package com.zhc.cloud.system.common.dto;

import lombok.Data;

/**
 * @author zhc
 * @description SysMenu
 * @date 2022-01-30 00:00
 */
@Data
public class SysMenuDTO {

    /**
     * 菜单ID
     */
    private Long menuId;
    /**
     * 菜单名称
     */
    private String menuName;
    /**
     * 父菜单ID
     */
    private Long parentId;
    /**
     * 显示顺序
     */
    private Integer orderNum;
    /**
     * 菜单类型（M目录 C菜单 F按钮 J接口）
     */
    private String menuType;
    /**
     * 地址
     */
    private String path;
    /**
     * 组件路径
     */
    private String component;
    /**
     * 路由参数
     */
    private String query;
    /**
     * 权限标识
     */
    private String perms;
    /**
     * 菜单状态（0显示 1隐藏）
     */
    private String visible;
    /**
     * 菜单图标
     */
    private String icon;
}
