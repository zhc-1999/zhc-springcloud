package com.zhc.cloud.business.start;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author zhc
 */
@SpringBootApplication(scanBasePackages = {"com.zhc.cloud"})
@EnableConfigurationProperties
@MapperScan("com.zhc.cloud.business.domain.mapper")
@EnableDiscoveryClient
@EnableFeignClients(basePackages={"com.zhc.cloud"})
public class ZhcBusinssStartApplication  {

    public static void main(String[] args) {
        SpringApplication.run(ZhcBusinssStartApplication.class, args);
    }


}
