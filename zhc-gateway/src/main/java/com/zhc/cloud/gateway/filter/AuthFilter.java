package com.zhc.cloud.gateway.filter;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zhc.cloud.common.constant.CacheConstants;
import com.zhc.cloud.common.constant.SecurityConstants;
import com.zhc.cloud.common.constant.TokenConstants;
import com.zhc.cloud.common.result.Result;
import com.zhc.cloud.common.utils.JwtUtils;
import com.zhc.cloud.common.utils.ServletUtils;
import com.zhc.cloud.gateway.utils.Md5Util;
import com.zhc.cloud.gateway.utils.ResponseUtil;
import com.zhc.cloud.redis.utils.RedisUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.core.io.buffer.DataBufferUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.function.Consumer;

/**
 * @author zhc
 * @Title: AuthFilter
 * @ProjectName springcloud
 * @Description: TODO
 * @date 2022/01/0422:34
 */
@Component
@Slf4j
public class AuthFilter implements GlobalFilter, Ordered {
    @Value("#{'${security.ignore:/zhc-system-service/user/login}'.split(',')}")
    private List<String> excludeUrls;
    @Autowired
    private RedisUtils redisUtils;

    private static final AntPathMatcher antPathMatcher = new AntPathMatcher();
    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        ServerHttpRequest request = exchange.getRequest();
        ServerHttpResponse response = exchange.getResponse();
        try {
            // 不拦截的请求
            if (!CollectionUtils.isEmpty(excludeUrls)) {
                if (urlMatch(excludeUrls, request.getURI().getPath())) {
                    return chain.filter(exchange);
                }
            }
            // 加密请求拦截器
            long start = System.currentTimeMillis();
            log.info("进入链路安全拦截器,请求的路径：{}", request.getURI());
            HttpHeaders headers = request.getHeaders();

            //上传文件请求不做安全校验
            if (MediaType.MULTIPART_FORM_DATA.isCompatibleWith(headers.getContentType())) {
                log.info("上传文件的请求");
                return chain.filter(exchange);
            }

            String contentType = null;
            if (headers.getContentType() != null) {
                contentType = headers.getContentType().toString().replaceAll(" ", "");
            }
            String authorization = headers.getFirst(SecurityConstants.AUTHORIZATION_HEADER);
            log.info("链路安全校验获取到请求头中的{}：{}",SecurityConstants.AUTHORIZATION_HEADER, authorization);
            if (StringUtils.isEmpty(authorization)) {
                log.info("链路安全校验失败：请求头中没有{}",SecurityConstants.AUTHORIZATION_HEADER);
                return ResponseUtil.failed(response, Result.failed("请求失败，请稍后重试(103)"));
            }
            String[] split = authorization.split(" ");
            if (split.length != 2) {
                log.info("链路安全校验失败，x-authorization参数中：分割非法");
                return ResponseUtil.failed(response, Result.failed("请求失败，请稍后重试(103)"));
            }
            String timestamp = headers.getFirst("timestamp");
            if (!checkTimeStamp(timestamp)){
                return ResponseUtil.failed(response, Result.failed("请求失败，请稍后重试(103)"));
            }
            //获取请求body内容
//            String strBody = readAsChars(request);
//            log.info("链路安全校验-服务端获取请求体内容：{}", strBody);
            //获取请求方式 post，get等
            String method = request.getMethodValue();
            log.info("链路安全校验-服务端获取请求方式：{}", method);
            log.info("链路安全校验-服务端获取请求类型：{}", contentType);
            //防重放
//            boolean antiReplay = antiReplay(authorization,timestamp);
//            if (!antiReplay) {
//                return ResponseUtil.failed(response, Result.failed("请求失败，请稍后重试(103)"));
//            }
            String token = getToken(authorization);
            if (org.apache.commons.lang.StringUtils.isBlank(token)){
                log.info("链路安全校验失败：token校验失败");
                return ResponseUtil.failed(response, Result.reLogin("token校验失败，请重新登录"));
            }
            //获取用户id
            String userId = JwtUtils.getUserId(token);
            if (org.apache.commons.lang.StringUtils.isBlank(userId)){
                log.info("链路安全校验失败：token校验失败");
                return ResponseUtil.failed(response, Result.reLogin("token校验失败，请重新登录"));
            }
            //获取redis中用户信息是否存在
            boolean b = redisUtils.hasKey(CacheConstants.LOGIN_TOKEN_KEY + userId);
            if(!b){
                log.info("链路安全校验失败：登录状态已过期");
                return ResponseUtil.failed(response, Result.reLogin("登录状态已过期，请重新登录"));
            }
            //获取redis中用户信息的过期时间
            long time = redisUtils.getTime(CacheConstants.LOGIN_TOKEN_KEY + userId);
            //判断redis中用户信息的过期时间是否小于120分钟
            if (time<CacheConstants.REFRESH_TIME*CacheConstants.MILLIS_MINUTE*CacheConstants.MILLIS_SECOND){
                //token续期120分钟
                redisUtils.expire(CacheConstants.LOGIN_TOKEN_KEY + userId,CacheConstants.REFRESH_TIME*CacheConstants.MILLIS_MINUTE);
            }
            //获取redis中的用户信息
            Object o = redisUtils.get(CacheConstants.LOGIN_TOKEN_KEY + userId);
            JSONObject userJson = JSONObject.parseObject((String) o);
            String userToken = userJson.getString("token");
            //校验token是否过期
            if (!userToken.equals(token)){
                log.info("链路安全校验失败：登录状态已过期");
                return ResponseUtil.failed(response, Result.reLogin("登录状态已过期，请重新登录"));
            }
            //校验菜单及接口
            Object menuObject = redisUtils.get(CacheConstants.LOGIN_MENU_KEY + userId);
            if (menuObject == null){
                //TODO 去获取用户菜单存入redis中
            }
            List<String> list = JSON.parseObject(menuObject.toString(), ArrayList.class);
            if (!urlMatch(list,request.getURI().getPath().substring(1))){
                log.info("链路安全校验失败：接口权限错误");
                return ResponseUtil.failed(response, Result.failed("链路安全校验失败，接口权限错误，请联系系统管理员"));
            }
            //根据用户数据添加Header,用于路由判定
            discoveryHeader(request,userJson);
            log.info("链路安全校验成功");
            long end = System.currentTimeMillis();
            log.info("服务端链路安全校验总耗时（毫秒）：{}", (end - start));
        } catch (Exception e) {
            return ResponseUtil.failed(response, Result.failed("请求失败，请稍后重试(103)"));
        }
        return chain.filter(exchange);
    }

    @Override
    public int getOrder() {
        return 1;
    }

    /**
     * url过滤
     * @param urls
     * @param path
     * @return
     */
    private boolean urlMatch(List<String> urls, String path) {
        if (CollectionUtils.isEmpty(urls) || StringUtils.isEmpty(path)) {
            return false;
        }
        for (String url : urls) {
            if (antPathMatcher.match(url, path)) {
                return true;
            }
        }
        return false;
    }

    /***
     * 根据用户数据添加Header,用于路由判定
     * @param request
     * @param userJson
     */
    private void discoveryHeader(ServerHttpRequest request,JSONObject userJson) {
        try {
            // 设置用户信息到Header
            Consumer<HttpHeaders> httpHeaders = httpHeader -> {
                try {
                    httpHeader.set(SecurityConstants.DETAILS_USER_ID, String.valueOf(userJson.getInteger("userId")));
                    httpHeader.set(SecurityConstants.DETAILS_USER_NAME, String.valueOf(userJson.getString("userName")));
                    httpHeader.set(SecurityConstants.DETAILS_DEPT_ID, String.valueOf(userJson.getInteger("deptId")));
                    httpHeader.set(SecurityConstants.DETAILS_DEPT_NAME, String.valueOf(userJson.getString("deptName")));
                    httpHeader.set(SecurityConstants.LOGIN_USER, ServletUtils.urlEncode(JSONObject.toJSONString(userJson)));
                }catch (Exception e){
                    log.error("URLEncoder异常",e);
                }
            };
            request.mutate().headers(httpHeaders).build();
        } catch (Exception e) {
            log.error("用户路由参数配置失败，已忽略。", e);
        }
    }

    /***
     * 获取token
     * @param authorization
     * @return
     */
    private String getToken(String authorization){
        if (org.apache.commons.lang.StringUtils.isNotBlank(authorization) && authorization.startsWith(TokenConstants.PREFIX)) {
            authorization = authorization.replaceFirst(TokenConstants.PREFIX, org.apache.commons.lang.StringUtils.EMPTY);
        }
        return authorization;
    }
    /**
     * 获取请求body信息
     *
     * @return
     */
    private String readAsChars(ServerHttpRequest request) {
        StringBuilder sb = new StringBuilder();
        Flux<DataBuffer> body = request.getBody();
        body.subscribe(buffer -> {
            byte[] bytes = new byte[buffer.readableByteCount()];
            buffer.read(bytes);
            DataBufferUtils.release(buffer);
            String bodyString = new String(bytes, StandardCharsets.UTF_8);
            sb.append(bodyString);
        });
        return sb.toString();
    }
    /**
     * 防重放
     * @return boolean
     */
    private boolean antiReplay(String authorization,String timestamp) {
        long redisStart = System.currentTimeMillis();
        try {
            String md5Str = Md5Util.md5Capital(authorization+timestamp);
            if (redisUtils.setIfAbsent(md5Str, "1")) {
                redisUtils.expire(md5Str, 10);
                log.info("链路安全redis防重放key：{}", md5Str);
            } else {
                log.info("链路安全redis防重放校验已存在key:{}", md5Str);
                return false;
            }
        } catch (Exception e) {
            log.error("链路安全redis防重放报错信息：", e);
            return false;
        }
        long redisEnd = System.currentTimeMillis();
        log.info("服务端链路安全redis防重放总耗时（毫秒）：{}", (redisEnd - redisStart));
        return true;
    }
    /**
     * 校验时间戳过期时间
     *
     * @param timestamp
     * @return
     */
    private boolean checkTimeStamp(String timestamp) {
        if (StringUtils.isEmpty(timestamp)) {
            log.info("链路安全timestamp为null:{}", timestamp);
            return false;
        }
        long currentTime = System.currentTimeMillis() / 1000;// 统一都传毫秒
        long requestTime = 0;
        try {
            requestTime = Long.parseLong(timestamp);
        } catch (NumberFormatException e) {
            //logger.error("{}-鉴权时间戳错误 timestamp:{}", MsgCode.SIGN_PARAM_ERROR_CODE, timestamp);
            log.error("链路安全timestamp转换错误:{}" ,timestamp);
            return false;
        }
        if (Math.abs(currentTime - requestTime)>60) {
            log.error("{}-签名已过期，服务器当前时间:{}", requestTime, currentTime);
            return false;
        }
        return true;
    }

}
