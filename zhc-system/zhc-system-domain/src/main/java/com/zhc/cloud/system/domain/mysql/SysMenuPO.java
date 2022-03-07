package com.zhc.cloud.system.domain.mysql;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.zhc.cloud.mybatis.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * <p>
 * 菜单权限表
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Data
@TableName("sys_menu")
@ApiModel(value = "SysMenuPO对象", description = "菜单权限表")
public class SysMenuPO extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("菜单ID")
    @TableId(value = "menu_id", type = IdType.AUTO)
    private Long menuId;

    @ApiModelProperty("菜单名称")
    @TableField("menu_name")
    private String menuName;

    @ApiModelProperty("父菜单ID")
    @TableField("parent_id")
    private Long parentId;

    @ApiModelProperty("显示顺序")
    @TableField("order_num")
    private Integer orderNum;

    @ApiModelProperty("路由地址")
    @TableField("path")
    private String path;

    @ApiModelProperty("组件路径")
    @TableField("component")
    private String component;

    @ApiModelProperty("路由参数")
    @TableField("query")
    private String query;

    @ApiModelProperty("是否为外链（0是 1否）")
    @TableField("is_frame")
    private Integer isFrame;

    @ApiModelProperty("是否缓存（0缓存 1不缓存）")
    @TableField("is_cache")
    private Integer isCache;

    @ApiModelProperty("菜单类型（M目录 C菜单 F按钮 J接口）")
    @TableField("menu_type")
    private String menuType;

    @ApiModelProperty("菜单状态（0显示 1隐藏）")
    @TableField("visible")
    private String visible;

    @ApiModelProperty("菜单状态（0正常 1停用）")
    @TableField("status")
    private String status;

    @ApiModelProperty("权限标识")
    @TableField("perms")
    private String perms;

    @ApiModelProperty("菜单图标")
    @TableField("icon")
    private String icon;

    @ApiModelProperty("备注")
    @TableField("remark")
    private String remark;

    @ApiModelProperty("删除标志（0代表存在 1代表删除）")
    @TableField("deleted")
    @TableLogic
    private String deleted;

    /***
     * 子菜单
     * 排除字段
     */
    @TableField(exist=false)
    private List<SysMenuPO> children = new ArrayList<>();


    public static final String MENU_ID = "menu_id";

    public static final String MENU_NAME = "menu_name";

    public static final String PARENT_ID = "parent_id";

    public static final String ORDER_NUM = "order_num";

    public static final String PATH = "path";

    public static final String COMPONENT = "component";

    public static final String QUERY = "query";

    public static final String IS_FRAME = "is_frame";

    public static final String IS_CACHE = "is_cache";

    public static final String MENU_TYPE = "menu_type";

    public static final String VISIBLE = "visible";

    public static final String STATUS = "status";

    public static final String PERMS = "perms";

    public static final String ICON = "icon";

    public static final String REMARK = "remark";

    public static final String DELETED = "deleted";

}
