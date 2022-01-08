package com.zhc.cloud.business.start;

import com.nepxion.discovery.plugin.strategy.adapter.StrategyTracerAdapter;
import com.nepxion.discovery.plugin.strategy.service.monitor.ServiceStrategyMonitorAdapter;
import com.zhc.cloud.discovery.service.adapter.MyServiceStrategyMonitorAdapter;
import com.zhc.cloud.discovery.service.adapter.MyStrategyTracerAdapter;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;

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

    @Bean
    public StrategyTracerAdapter strategyTracerAdapter() {
        return new MyStrategyTracerAdapter();
    }
    @Bean
    public ServiceStrategyMonitorAdapter serviceStrategyMonitorAdapter() {
        return new MyServiceStrategyMonitorAdapter();
    }
}
