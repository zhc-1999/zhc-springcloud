package com.zhc.cloud.mysql.conf;

import com.alibaba.druid.pool.DruidDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.SQLException;

/**
 * @author zhc
 * @description mysql
 * @date 2021-12-29 09:56
 */
@Configuration
@Component
@RefreshScope
public class DruidConfig {


    @Value("${spring.datasource.url}")
    private String dbUrl;

    @Value("${spring.datasource.username}")
    private String username;

    @Value("${spring.datasource.password}")
    private String password;

    @Value("${spring.datasource.driver-class-name}")
    private String driverClassName;

    @Value("${spring.datasource.initial-size}")
    private int initialSize;

    @Value("${spring.datasource.min-idle}")
    private int minIdle;

    @Value("${spring.datasource.max-active}")
    private int maxActive;

    @Value("${spring.datasource.max-wait}")
    private int maxWait;

    @Value("${spring.datasource.time-between-eviction-runs-millis}")
    private int timeBetweenEvictionRunsMillis;

    @Value("${spring.datasource.min-evictable-idle-time-millis}")
    private int minEvictableIdleTimeMillis;

//    @Value("${spring.datasource.validation-query}")
//    private String validationQuery;
//
//    @Value("${spring.datasource.test-while-idle}")
//    private boolean testWhileIdle;
//
//    @Value("${spring.datasource.test-on-borrow}")
//    private boolean testOnBorrow;
//
//    @Value("${spring.datasource.test-on-return}")
//    private boolean testOnReturn;
//
//    @Value("${spring.datasource.pool-prepared-statements}")
//    private boolean poolPreparedStatements;
//
//    @Value("${spring.datasource.max-pool-prepared-statement-per-connection-size}")
//    private int maxPoolPreparedStatementPerConnectionSize;

    @Value("${spring.datasource.filters}")
    private String filters;

//    @Value("${spring.datasource.connection-properties}")
//    private String connectionProperties;

    /***
     * @Bean 声明其为Bean实例
     * @Primary 在同样的DataSource中，首先使用被标注的DataSource
     */
    @Bean
    @Primary
    @RefreshScope
    public DataSource dataSource(){
        DruidDataSource datasource = new DruidDataSource();
        datasource.setUrl(this.dbUrl);
        datasource.setUsername(username);
        datasource.setPassword(password);
        datasource.setDriverClassName(driverClassName);
        //configuration
        datasource.setInitialSize(initialSize);
        datasource.setMinIdle(minIdle);
        datasource.setMaxActive(maxActive);
        datasource.setMaxWait(maxWait);
        datasource.setTimeBetweenEvictionRunsMillis(timeBetweenEvictionRunsMillis);
        datasource.setMinEvictableIdleTimeMillis(minEvictableIdleTimeMillis);
//    	datasource.setValidationQuery(validationQuery);
//        datasource.setTestWhileIdle(testWhileIdle);
//        datasource.setTestOnBorrow(testOnBorrow);
//        datasource.setTestOnReturn(testOnReturn);
//        datasource.setPoolPreparedStatements(poolPreparedStatements);
//        datasource.setMaxPoolPreparedStatementPerConnectionSize(maxPoolPreparedStatementPerConnectionSize);
        try {
            datasource.setFilters(filters);
        } catch (SQLException e) {

        }
//    	datasource.setConnectionProperties(connectionProperties);
        return datasource;
    }

}
