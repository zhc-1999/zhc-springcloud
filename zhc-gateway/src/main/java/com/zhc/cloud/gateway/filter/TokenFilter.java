package com.zhc.cloud.gateway.filter;

import cn.hutool.core.convert.Convert;
import com.zhc.cloud.gateway.constants.GatewayConstants;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.HttpHeaders;
import org.springframework.http.server.reactive.ServerHttpRequest;
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
@Component
@Slf4j
public class TokenFilter  implements GlobalFilter, Ordered {

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        discoveryHeader(exchange.getRequest());
        return chain.filter(exchange);
    }
    /**
     * 根据用户数据添加Header,用于路由判定
     */
    private void discoveryHeader(ServerHttpRequest request) {
        try {
            // 设置用户信息到Header
            Consumer<HttpHeaders> httpHeaders = httpHeader -> {
                try {
                    // 用户ID
                    Long userId = 1L;
                    if (userId != null) {
                        httpHeader.set(GatewayConstants.DISCOVERY_HEADER_USER_ID, String.valueOf(userId));
                    }
                    // 用户账号
                    String userName = "张三";
                    if (StringUtils.isNotBlank(userName)) {
                        userName = URLEncoder.encode(userName, "utf-8");
                        httpHeader.set(GatewayConstants.DISCOVERY_HEADER_USER_NAME, userName);
                    }
                }catch (Exception e){
                    log.error("URLEncoder异常",e);
                }
            };
            request.mutate().headers(httpHeaders).build();
        } catch (Exception e) {
            log.error("用户路由参数配置失败，已忽略。", e);
        }
    }
    @Override
    public int getOrder() {
        return 2;
    }
}
