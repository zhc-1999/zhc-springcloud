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
 * 字典数据表
 * </p>
 *
 * @author zhc
 * @since 2022-03-16
 */
@Data
@TableName("sys_dict_data")
@ApiModel(value = "SysDictDataPO对象", description = "字典数据表")
public class SysDictDataPO extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("字典编码")
    @TableId(value = "dict_code", type = IdType.AUTO)
    private Long dictCode;

    @ApiModelProperty("字典排序")
    @TableField("dict_sort")
    private Integer dictSort;

    @ApiModelProperty("字典标签")
    @TableField("dict_label")
    private String dictLabel;

    @ApiModelProperty("字典键值")
    @TableField("dict_value")
    private String dictValue;

    @ApiModelProperty("字典类型")
    @TableField("dict_type")
    private String dictType;

    @ApiModelProperty("样式属性（其他样式扩展）")
    @TableField("css_class")
    private String cssClass;

    @ApiModelProperty("表格回显样式")
    @TableField("list_class")
    private String listClass;

    @ApiModelProperty("是否默认（Y是 N否）")
    @TableField("is_default")
    private String isDefault;

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


    public static final String DICT_CODE = "dict_code";

    public static final String DICT_SORT = "dict_sort";

    public static final String DICT_LABEL = "dict_label";

    public static final String DICT_VALUE = "dict_value";

    public static final String DICT_TYPE = "dict_type";

    public static final String CSS_CLASS = "css_class";

    public static final String LIST_CLASS = "list_class";

    public static final String IS_DEFAULT = "is_default";

    public static final String STATUS = "status";

    public static final String REMARK = "remark";

    public static final String DELETED = "deleted";

}
