package com.zhc.cloud.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @author zhc
 * @description 网关启动类
 * @date 2021-12-26 02:20
 */
@SpringBootApplication(scanBasePackages = {"com.zhc.cloud.gateway"})
@EnableDiscoveryClient
@EnableConfigurationProperties
public class GatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(GatewayApplication.class, args);
    }
}
