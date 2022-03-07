package com.zhc.cloud.system.domain.mysql;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.sql.Blob;
import com.zhc.cloud.mybatis.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * <p>
 * 通知公告表
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Data
@TableName("sys_notice")
@ApiModel(value = "SysNoticePO对象", description = "通知公告表")
public class SysNoticePO extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("公告ID")
    @TableId(value = "notice_id", type = IdType.AUTO)
    private Integer noticeId;

    @ApiModelProperty("公告标题")
    @TableField("notice_title")
    private String noticeTitle;

    @ApiModelProperty("公告类型（1通知 2公告）")
    @TableField("notice_type")
    private String noticeType;

    @ApiModelProperty("公告内容")
    @TableField("notice_content")
    private String noticeContent;

    @ApiModelProperty("公告状态（0正常 1关闭）")
    @TableField("status")
    private String status;

    @ApiModelProperty("备注")
    @TableField("remark")
    private String remark;

    @ApiModelProperty("删除标志（0代表存在 1代表删除）")
    @TableField("deleted")
    @TableLogic
    private String deleted;


    public static final String NOTICE_ID = "notice_id";

    public static final String NOTICE_TITLE = "notice_title";

    public static final String NOTICE_TYPE = "notice_type";

    public static final String NOTICE_CONTENT = "notice_content";

    public static final String STATUS = "status";

    public static final String REMARK = "remark";

    public static final String DELETED = "deleted";

}
