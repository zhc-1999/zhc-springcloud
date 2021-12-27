package com.zhc.cloud.gateway.filter;

import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import static com.zhc.cloud.gateway.utils.IpAdrressUtil.getIpAdrress;

/**
 * @author zhc
 * @Title: LoggingFilter
 * @date 2021/11/3 16:32
 * @notes 记录每个ip请求时长
 */
@Component
@Slf4j
public class LoggingFilter implements GlobalFilter, Ordered {


    private static final String START_TIME = "startTime";

    public LoggingFilter() {
        log.info("Loaded GlobalFilter [Logging]");
    }

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        log.info("Method:{} Host:{} Path:{} Query:{}",
                exchange.getRequest().getMethod().name(),
                getIpAdrress(exchange.getRequest()),
                exchange.getRequest().getURI().getPath(),
                exchange.getRequest().getQueryParams()
        );

        exchange.getAttributes().put(START_TIME, System.currentTimeMillis());
        return chain.filter(exchange).then( Mono.fromRunnable(() -> {
            Long startTime = exchange.getAttribute(START_TIME);
            if (startTime != null) {
                Long executeTime = (System.currentTimeMillis() - startTime);
                log.info(exchange.getRequest().getURI().getRawPath() + " : " + executeTime + "ms");
            }
        }));
    }

    @Override
    public int getOrder() {
        return Ordered.LOWEST_PRECEDENCE;
    }
}
