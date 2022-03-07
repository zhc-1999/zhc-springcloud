package com.zhc.cloud.mybatis.plugins;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Date;

/**
 * @author zhc
 * @description mybits-plues自动填充
 * @date 2022-01-01 21:05
 */
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

    @Override
    public void insertFill(MetaObject metaObject) {
        Date date = new Date();
        this.strictInsertFill(metaObject, "createTime", Date.class, date);
        this.strictInsertFill(metaObject, "updateTime", Date.class, date);
        // 起始版本 3.3.0(推荐使用)
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        Date date = new Date();
        this.strictUpdateFill(metaObject, "updateTime", Date.class, date);
        // 起始版本 3.3.0(推荐)
    }
}
