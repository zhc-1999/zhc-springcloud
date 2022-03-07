package com.zhc.cloud.system.domain.mysql;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;

import com.zhc.cloud.mybatis.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * <p>
 * 系统访问记录
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Data
@TableName("sys_login_log")
@ApiModel(value = "SysLoginLogPO对象", description = "系统访问记录")
public class SysLoginLogPO extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("访问ID")
    @TableId(value = "info_id", type = IdType.AUTO)
    private Long infoId;

    @ApiModelProperty("用户账号")
    @TableField("user_id")
    private Long userId;

    @ApiModelProperty("登录IP地址")
    @TableField("ipaddr")
    private String ipaddr;

    @ApiModelProperty("登录状态（0成功 1失败）")
    @TableField("status")
    private String status;

    @ApiModelProperty("提示信息")
    @TableField("msg")
    private String msg;

    @ApiModelProperty("访问时间")
    @TableField("access_time")
    private Date accessTime;


    public static final String INFO_ID = "info_id";

    public static final String USER_NAME = "user_name";

    public static final String IPADDR = "ipaddr";

    public static final String STATUS = "status";

    public static final String MSG = "msg";

    public static final String ACCESS_TIME = "access_time";

}
