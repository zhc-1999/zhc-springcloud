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
 * 角色和菜单关联表
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Data
@TableName("sys_role_menu")
@ApiModel(value = "SysRoleMenuPO对象", description = "角色和菜单关联表")
public class SysRoleMenuPO extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("角色ID")
    private Long roleId;

    @ApiModelProperty("菜单ID")
    private Long menuId;


    public static final String ROLE_ID = "role_id";

    public static final String MENU_ID = "menu_id";

}
