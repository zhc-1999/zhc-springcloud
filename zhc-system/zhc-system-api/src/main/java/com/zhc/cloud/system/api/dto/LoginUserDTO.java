package com.zhc.cloud.system.api.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

/**
 * @author zhc
 * @description LoginUserDTO
 * @date 2022-01-28 18:03
 */
@Data
public class LoginUserDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 用户唯一标识
     */
    private String token;

    /**
     * 用户名id
     */
    private Long userId;

    /**
     * 用户名
     */
    private String userName;

    /**
     * 登录时间
     */
    private Date loginTime;

    /**
     * 部门id
     */
    private Long deptId;

    /**
     * 部门名称
     */
    private String deptName;

    /**
     * 登录IP地址
     */
    private String ipaddr;

    /**
     * 菜单权限列表
     */
    private Set<SysMenuDTO> menus;

    /**
     * 角色列表
     */
    private Set<SysRoleDTO> roles;

}
