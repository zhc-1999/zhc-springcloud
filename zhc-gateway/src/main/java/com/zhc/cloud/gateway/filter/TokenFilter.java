package com.zhc.cloud.gateway.filter;

import cn.hutool.core.convert.Convert;
import com.zhc.cloud.common.constant.CacheConstants;
import com.zhc.cloud.common.constant.SecurityConstants;
import com.zhc.cloud.common.constant.TokenConstants;
import com.zhc.cloud.common.result.Result;
import com.zhc.cloud.common.utils.JwtUtils;
import com.zhc.cloud.common.utils.ServletUtils;
import com.zhc.cloud.gateway.utils.ResponseUtil;
import com.zhc.cloud.redis.utils.RedisUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.HttpHeaders;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import java.util.stream.Collectors;

/**
 * @author zhc
 * @description 权限校验
 * @date 2022-01-07 17:57
 */
//@Component
//@Slf4j
//public class TokenFilter  implements GlobalFilter, Ordered {
//    @Value("#{'${security.ignore:/user/login}'.split(',')}")
//    private List<String> excludeUrls;
//    @Autowired
//    private RedisUtils redisUtils;
//    @Override
//    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
//        ServerHttpRequest request = exchange.getRequest();
//        ServerHttpResponse response = exchange.getResponse();
//        try {
//            // 不拦截的请求
//            if (!CollectionUtils.isEmpty(excludeUrls)) {
//                if (urlMatch(excludeUrls, request.getURI().getPath())) {
//                    return chain.filter(exchange);
//                }
//            }
//            String token = request.getHeaders().getFirst(SecurityConstants.AUTHORIZATION_HEADER);
//            // 如果前端设置了令牌前缀，则裁剪掉前缀
//            if (StringUtils.isNotEmpty(token) && token.startsWith(TokenConstants.PREFIX)) {
//                token = token.replaceFirst(TokenConstants.PREFIX, StringUtils.EMPTY);
//            }
//            //获取用户id
//            String userId = JwtUtils.getUserId(token);
//            if (StringUtils.isBlank(userId)){
//                log.info("链路安全校验失败：token校验失败");
//                return ResponseUtil.failed(response, Result.failed("token校验失败"));
//            }
//            boolean b = redisUtils.hasKey(CacheConstants.LOGIN_TOKEN_KEY + userId);
//            if(!b){
//                log.info("链路安全校验失败：登录状态已过期");
//                return ResponseUtil.failed(response, Result.failed("登录状态已过期"));
//            }
//            long time = redisUtils.getTime(CacheConstants.LOGIN_TOKEN_KEY + userId);
//            if (time<CacheConstants.REFRESH_TIME*CacheConstants.MILLIS_MINUTE*CacheConstants.MILLIS_SECOND){
//                redisUtils.expire(CacheConstants.LOGIN_TOKEN_KEY + userId,CacheConstants.REFRESH_TIME*CacheConstants.MILLIS_MINUTE);
//            }
//
//            //根据用户数据添加Header,用于路由判定
//            discoveryHeader(request);
//        } catch (Exception e) {
//            log.error("",e);
//            return ResponseUtil.failed(response, Result.failed("请求失败，请稍后重试(103)"));
//        }
//        return chain.filter(exchange);
//    }
//    /**
//     * 根据用户数据添加Header,用于路由判定
//     */
//    private void discoveryHeader(ServerHttpRequest request) {
//        try {
//            // 设置用户信息到Header
//            Consumer<HttpHeaders> httpHeaders = httpHeader -> {
//                try {
//
//                }catch (Exception e){
//                    log.error("URLEncoder异常",e);
//                }
//            };
//            request.mutate().headers(httpHeaders).build();
//        } catch (Exception e) {
//            log.error("用户路由参数配置失败，已忽略。", e);
//        }
//    }
//    @Override
//    public int getOrder() {
//        return 2;
//    }
//}
