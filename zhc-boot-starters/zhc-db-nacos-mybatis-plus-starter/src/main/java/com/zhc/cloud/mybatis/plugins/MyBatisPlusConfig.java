package com.zhc.cloud.mybatis.plugins;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.autoconfigure.ConfigurationCustomizer;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.DataPermissionInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import com.github.pagehelper.PageInterceptor;
import org.apache.ibatis.type.JdbcType;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * com.zhc.cloud.system.domain.mapper
 * @author zhc
 * @description 分页配置
 * @date 2022-01-01 15:01
 */
@Configuration
@MapperScan("com.zhc.cloud.*.domain.mapper*")
public class MyBatisPlusConfig {

    /**
     * 分页插件，自动识别数据库类型
     *
     * @return
     */
    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor() {
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
        // 数据权限插件
//        DataPermissionInterceptor dataPermissionInterceptor=new DataPermissionInterceptor();
//        MyDataPermissionHandler myDataPermissionHandler=new MyDataPermissionHandler();
//        // 添加自定义的数据权限处理器
//        dataPermissionInterceptor.setDataPermissionHandler(myDataPermissionHandler);
//        interceptor.addInnerInterceptor(dataPermissionInterceptor);
        interceptor.addInnerInterceptor(new DataPermissionInterceptor(new MyDataPermissionHandler()));
        //分页插件
        interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));
        return interceptor;
    }

//    @Bean
//    ConfigurationCustomizer mybatisConfigurationCustomizer() {
//        return configuration -> {
//            configuration.setCacheEnabled(true);
//            configuration.setMapUnderscoreToCamelCase(true);
//            configuration.setCallSettersOnNulls(true);
//            configuration.setJdbcTypeForNull(JdbcType.NULL);
//            configuration.addInterceptor(new PageInterceptor());
//        };
//    }
}
