package com.zhc.cloud.mybatis.plugins;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.zhc.cloud.common.utils.SecurityUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

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
        // 这个是通用的，插入和更新都可以使用 但是当字段存在值 的时候不进行填充
        String userId = SecurityUtils.getUserId();
        if (StringUtils.isNotBlank(userId)){
            this.fillStrategy(metaObject, "createId",  Integer.valueOf(userId));
            this.fillStrategy(metaObject, "updateId",  Integer.valueOf(userId));
        }
        // 这个是insert的时候用的，插入的时候时候强制进行填充
        this.strictInsertFill(metaObject, "createTime", Date.class, date);
        this.strictInsertFill(metaObject, "updateTime", Date.class, date);
        // 起始版本 3.3.0(推荐使用)
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        Date date = new Date();
        // 这个是通用的，插入和更新都可以使用 但是当字段存在值 的时候不进行填充
        this.strictUpdateFill(metaObject, "updateTime", Date.class, date);
        // update的时候使用，更新的时候强制进行填充
        String userId = SecurityUtils.getUserId();
        if (StringUtils.isNotBlank(userId)){
            this.fillStrategy(metaObject, "updateId",  Integer.valueOf(SecurityUtils.getUserId()));
        }
        // 起始版本 3.3.0(推荐)
    }
}
