package com.zhc.cloud.system.domain.mysql;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import com.zhc.cloud.mybatis.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * <p>
 * 用户和角色关联表
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Data
@TableName("sys_user_role")
@ApiModel(value = "SysUserRolePO对象", description = "用户和角色关联表")
public class SysUserRolePO extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("用户ID")
    private Long userId;

    @ApiModelProperty("角色ID")
    private Long roleId;


    public static final String USER_ID = "user_id";

    public static final String ROLE_ID = "role_id";

}
