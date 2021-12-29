package com.zhc.cloud.start;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.web.WebApplicationInitializer;

/**
 * @author zhc
 */
@SpringBootApplication(scanBasePackages = {"com.zhc.cloud"})
@EnableConfigurationProperties
@MapperScan("com.zhc.cloud.domain.mapper")
@EnableDiscoveryClient
public class ZhcBusinssStartApplication  {

    public static void main(String[] args) {
        SpringApplication.run(ZhcBusinssStartApplication.class, args);
    }


}
