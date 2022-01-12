package com.zhc.cloud.system.domain.mysql;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zhc.cloud.mybatis.base.BaseEntity;
import lombok.Data;

/**
 * @author zhc
 */
@TableName(value = "test_data")
@Data
public class TestDataPO extends BaseEntity {
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @TableField(value = "`name`")
    private String name;
    @TableField(value = "`deleted`")
    private Integer deleted;

    public static final String COL_ID = "id";

    public static final String COL_NAME = "name";


}