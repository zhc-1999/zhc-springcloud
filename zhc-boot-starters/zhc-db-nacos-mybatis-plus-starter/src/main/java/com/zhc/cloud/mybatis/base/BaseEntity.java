package com.zhc.cloud.mybatis.base;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;

import java.io.Serializable;
import java.util.Date;

/**
 * @author zhc
 * @description 抽象实体
 * @date 2022-01-01 14:57
 */
public class BaseEntity implements Serializable {

    /**
     * 创建者
     */
    @TableField(value = "`create_id`")
    private Integer createId;


    /**
     * 创建时间
     */
    @TableField(value = "`create_time`",fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 更新者
     */
    @TableField(value = "`update_id`")
    private Integer updateId;


    /**
     * 更新时间
     */
    @TableField(value = "`update_time`",fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    public Integer getCreateId() {
        return createId;
    }

    public void setCreateId(Integer createId) {
        this.createId = createId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getUpdateId() {
        return updateId;
    }

    public void setUpdateId(Integer updateId) {
        this.updateId = updateId;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
