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
 * 角色信息表
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_role")
@ApiModel(value = "SysRolePO对象", description = "角色信息表")
public class SysRolePO extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("角色ID")
    @TableId(value = "role_id", type = IdType.AUTO)
    private Long roleId;

    @ApiModelProperty("角色名称")
    @TableField("role_name")
    private String roleName;

    @ApiModelProperty("角色权限字符串")
    @TableField("role_key")
    private String roleKey;

    @ApiModelProperty("显示顺序")
    @TableField("role_sort")
    private Integer roleSort;

    @ApiModelProperty("数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）")
    @TableField("data_scope")
    private String dataScope;

    @ApiModelProperty("菜单树选择项是否关联显示")
    @TableField("menu_check_strictly")
    private Boolean menuCheckStrictly;

    @ApiModelProperty("部门树选择项是否关联显示")
    @TableField("dept_check_strictly")
    private Boolean deptCheckStrictly;

    @ApiModelProperty("角色状态（0正常 1停用）")
    @TableField("status")
    private String status;

    @ApiModelProperty("删除标志（0代表存在 1代表删除）")
    @TableField("deleted")
    @TableLogic
    private String deleted;

    @ApiModelProperty("备注")
    @TableField("remark")
    private String remark;


    public static final String ROLE_ID = "role_id";

    public static final String ROLE_NAME = "role_name";

    public static final String ROLE_KEY = "role_key";

    public static final String ROLE_SORT = "role_sort";

    public static final String DATA_SCOPE = "data_scope";

    public static final String MENU_CHECK_STRICTLY = "menu_check_strictly";

    public static final String DEPT_CHECK_STRICTLY = "dept_check_strictly";

    public static final String STATUS = "status";

    public static final String DELETED = "deleted";

    public static final String REMARK = "remark";

}
