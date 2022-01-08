package com.zhc.cloud.gateway.filter;

import com.zhc.cloud.common.result.Result;
import com.zhc.cloud.gateway.utils.Md5Util;
import com.zhc.cloud.gateway.utils.ResponseUtil;
import com.zhc.cloud.redis.utils.RedisUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
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
import java.util.List;
import java.util.concurrent.TimeUnit;

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
//    @Autowired
//    private List<String> excludeUrls;
    @Autowired
    private RedisUtils redisUtils;
    private static final AntPathMatcher antPathMatcher = new AntPathMatcher();
    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        ServerHttpRequest request = exchange.getRequest();
        ServerHttpResponse response = exchange.getResponse();
        try {

            // 不拦截的请求
//            if (!CollectionUtils.isEmpty(excludeUrls)) {
//                if (urlMatch(excludeUrls, request.getURI().getPath())) {
//                    return chain.filter(exchange);
//                }
//            }
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
            String authorization = headers.getFirst("x-authorization");
            log.info("链路安全校验获取到请求头中的x-authorization：{}", authorization);
            if (StringUtils.isEmpty(authorization)) {
                log.info("链路安全校验失败：请求头中没有x-authorization");
                return ResponseUtil.failed(response, Result.failed("请求失败，请稍后重试(103)"));
            }
            String[] split = authorization.split(":");
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
            boolean antiReplay = antiReplay(authorization,timestamp);
            if (!antiReplay) {
                return ResponseUtil.failed(response, Result.failed("请求失败，请稍后重试(103)"));
            }
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
