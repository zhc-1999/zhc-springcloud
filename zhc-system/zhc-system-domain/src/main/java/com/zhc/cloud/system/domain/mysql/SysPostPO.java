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
 * 岗位信息表
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Data
@TableName("sys_post")
@ApiModel(value = "SysPostPO对象", description = "岗位信息表")
public class SysPostPO extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("岗位ID")
    @TableId(value = "post_id", type = IdType.AUTO)
    private Long postId;

    @ApiModelProperty("岗位编码")
    @TableField("post_code")
    private String postCode;

    @ApiModelProperty("岗位名称")
    @TableField("post_name")
    private String postName;

    @ApiModelProperty("显示顺序")
    @TableField("post_sort")
    private Integer postSort;

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


    public static final String POST_ID = "post_id";

    public static final String POST_CODE = "post_code";

    public static final String POST_NAME = "post_name";

    public static final String POST_SORT = "post_sort";

    public static final String STATUS = "status";

    public static final String REMARK = "remark";

    public static final String DELETED = "deleted";

}
