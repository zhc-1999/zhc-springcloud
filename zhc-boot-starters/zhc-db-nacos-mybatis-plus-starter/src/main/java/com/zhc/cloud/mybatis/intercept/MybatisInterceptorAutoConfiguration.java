package com.zhc.cloud.mybatis.intercept;

import com.github.pagehelper.autoconfigure.PageHelperAutoConfiguration;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;

import javax.annotation.PostConstruct;
import java.util.List;

/**
 * @author zhc
 * @description 数据权限插件 配置
 * @date 2022-04-01 17:01
 */
@AutoConfigureAfter(PageHelperAutoConfiguration.class)
@Configuration
public class MybatisInterceptorAutoConfiguration implements InitializingBean{

    @Autowired
    private List<SqlSessionFactory> sqlSessionFactoryList;

    @Override
    @PostConstruct
    public void afterPropertiesSet() throws Exception {
        //创建自定义mybatis拦截器，添加到chain的最后面
        MybatisDataPermissionIntercept mybatisInterceptor = new MybatisDataPermissionIntercept();

        for (SqlSessionFactory sqlSessionFactory : sqlSessionFactoryList) {
            org.apache.ibatis.session.Configuration configuration = sqlSessionFactory.getConfiguration();
            //自己添加
            configuration.addInterceptor(mybatisInterceptor);
        }
    }

}
