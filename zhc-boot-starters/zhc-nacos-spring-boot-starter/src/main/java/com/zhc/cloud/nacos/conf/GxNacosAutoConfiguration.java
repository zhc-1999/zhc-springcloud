package com.zhc.cloud.nacos.conf;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author zhc
 * @description naocs配置
 * @date 2021-12-25 15:35
 */
@Configuration
public class GxNacosAutoConfiguration {

    @Bean
    public CommandLineRunner nacosLogger (){
        return args -> {
            System.out.println("==== zhc NACOS loaded  ^ __ ^====");
        };
    }

}
