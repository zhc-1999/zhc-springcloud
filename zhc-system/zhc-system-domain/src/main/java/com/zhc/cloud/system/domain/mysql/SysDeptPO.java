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
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * <p>
 * 部门表
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_dept")
@ApiModel(value = "SysDeptPO对象", description = "部门表")
public class SysDeptPO extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("部门id")
    @TableId(value = "dept_id", type = IdType.AUTO)
    private Long deptId;

    @ApiModelProperty("父部门id")
    @TableField("parent_id")
    private Long parentId;

    @ApiModelProperty("祖级列表")
    @TableField("ancestors")
    private String ancestors;

    @ApiModelProperty("部门名称")
    @TableField("dept_name")
    private String deptName;

    @ApiModelProperty("显示顺序")
    @TableField("order_num")
    private Integer orderNum;

    @ApiModelProperty("负责人")
    @TableField("leader")
    private String leader;

    @ApiModelProperty("联系电话")
    @TableField("phone")
    private String phone;

    @ApiModelProperty("邮箱")
    @TableField("email")
    private String email;

    @ApiModelProperty("部门状态（0正常 1停用）")
    @TableField("status")
    private String status;

    @ApiModelProperty("删除标志（0代表存在 1代表删除）")
    @TableField("deleted")
    @TableLogic
    private String deleted;


    public static final String DEPT_ID = "dept_id";

    public static final String PARENT_ID = "parent_id";

    public static final String ANCESTORS = "ancestors";

    public static final String DEPT_NAME = "dept_name";

    public static final String ORDER_NUM = "order_num";

    public static final String LEADER = "leader";

    public static final String PHONE = "phone";

    public static final String EMAIL = "email";

    public static final String STATUS = "status";

    public static final String DELETED = "deleted";

}
