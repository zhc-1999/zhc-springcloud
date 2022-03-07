package com.zhc.cloud.system.domain.mysql;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.zhc.cloud.mybatis.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * <p>
 * 用户信息表
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_user")
@ApiModel(value = "SysUserPO对象", description = "用户信息表")
public class SysUserPO extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("用户ID")
    @TableId(value = "user_id", type = IdType.AUTO)
    private Long userId;

    @ApiModelProperty("部门ID")
    @TableField("dept_id")
    private Long deptId;

    @ApiModelProperty("用户账号")
    @TableField("user_name")
    private String userName;

    @ApiModelProperty("用户昵称")
    @TableField("nick_name")
    private String nickName;

    @ApiModelProperty("用户类型（00系统用户）")
    @TableField("user_type")
    private String userType;

    @ApiModelProperty("用户邮箱")
    @TableField("email")
    private String email;

    @ApiModelProperty("手机号码")
    @TableField("phone")
    private String phone;

    @ApiModelProperty("用户性别（0男 1女 2未知）")
    @TableField("sex")
    private String sex;

    @ApiModelProperty("头像地址")
    @TableField("avatar")
    private String avatar;

    @ApiModelProperty("密码")
    @TableField("password")
    private String password;

    @ApiModelProperty("帐号状态（0正常 1停用）")
    @TableField("status")
    private String status;

    @ApiModelProperty("删除标志（0代表存在 1代表删除）")
    @TableField("deleted")
    @TableLogic
    private String deleted;

    @ApiModelProperty("最后登录IP")
    @TableField("login_ip")
    private String loginIp;

    @ApiModelProperty("最后登录时间")
    @TableField("login_date")
    private Date loginDate;

    @ApiModelProperty("备注")
    @TableField("remark")
    private String remark;

    public static final String USER_ID = "user_id";

    public static final String DEPT_ID = "dept_id";

    public static final String USER_NAME = "user_name";

    public static final String NICK_NAME = "nick_name";

    public static final String USER_TYPE = "user_type";

    public static final String EMAIL = "email";

    public static final String PHONE = "phone";

    public static final String SEX = "sex";

    public static final String AVATAR = "avatar";

    public static final String PASSWORD = "password";

    public static final String STATUS = "status";

    public static final String DELETED = "deleted";

    public static final String LOGIN_IP = "login_ip";

    public static final String LOGIN_DATE = "login_date";

    public static final String REMARK = "remark";

}
