package com.zhc.cloud.system.domain.mysql;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import com.zhc.cloud.mybatis.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * <p>
 * 字典类型表
 * </p>
 *
 * @author zhc
 * @since 2022-03-16
 */
@Data
@TableName("sys_dict_type")
@ApiModel(value = "SysDictTypePO对象", description = "字典类型表")
public class SysDictTypePO extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("字典主键")
    @TableId(value = "dict_id", type = IdType.AUTO)
    private Long dictId;

    @ApiModelProperty("字典名称")
    @TableField("dict_name")
    private String dictName;

    @ApiModelProperty("字典类型")
    @TableField("dict_type")
    private String dictType;

    @ApiModelProperty("状态（0正常 1停用）")
    @TableField("status")
    private String status;

    @ApiModelProperty("备注")
    @TableField("remark")
    private String remark;

    @ApiModelProperty("删除标志（0代表存在 1代表删除）")
    @TableField("deleted")
    @TableLogic
    private String deleted;


    public static final String DICT_ID = "dict_id";

    public static final String DICT_NAME = "dict_name";

    public static final String DICT_TYPE = "dict_type";

    public static final String STATUS = "status";

    public static final String REMARK = "remark";

    public static final String DELETED = "deleted";

}
