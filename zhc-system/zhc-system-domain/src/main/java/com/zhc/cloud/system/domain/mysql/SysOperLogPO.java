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
 * 操作日志记录
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Data
@TableName("sys_oper_log")
@ApiModel(value = "SysOperLogPO对象", description = "操作日志记录")
public class SysOperLogPO extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("日志主键")
    @TableId(value = "oper_id", type = IdType.AUTO)
    private Long operId;

    @ApiModelProperty("模块标题")
    @TableField("title")
    private String title;

    @ApiModelProperty("业务类型（0其它 1新增 2修改 3删除）")
    @TableField("business_type")
    private Integer businessType;

    @ApiModelProperty("方法名称")
    @TableField("method")
    private String method;

    @ApiModelProperty("请求方式")
    @TableField("request_method")
    private String requestMethod;

    @ApiModelProperty("操作类别（0其它 1后台用户 2手机端用户）")
    @TableField("operator_type")
    private Integer operatorType;

    @ApiModelProperty("操作人员")
    @TableField("oper_name")
    private String operName;

    @ApiModelProperty("部门名称")
    @TableField("dept_name")
    private String deptName;

    @ApiModelProperty("请求URL")
    @TableField("oper_url")
    private String operUrl;

    @ApiModelProperty("主机地址")
    @TableField("oper_ip")
    private String operIp;

    @ApiModelProperty("操作地点")
    @TableField("oper_location")
    private String operLocation;

    @ApiModelProperty("请求参数")
    @TableField("oper_param")
    private String operParam;

    @ApiModelProperty("返回参数")
    @TableField("json_result")
    private String jsonResult;

    @ApiModelProperty("操作状态（0正常 1异常）")
    @TableField("status")
    private Integer status;

    @ApiModelProperty("错误消息")
    @TableField("error_msg")
    private String errorMsg;

    @ApiModelProperty("操作时间")
    @TableField("oper_time")
    private Date operTime;


    public static final String OPER_ID = "oper_id";

    public static final String TITLE = "title";

    public static final String BUSINESS_TYPE = "business_type";

    public static final String METHOD = "method";

    public static final String REQUEST_METHOD = "request_method";

    public static final String OPERATOR_TYPE = "operator_type";

    public static final String OPER_NAME = "oper_name";

    public static final String DEPT_NAME = "dept_name";

    public static final String OPER_URL = "oper_url";

    public static final String OPER_IP = "oper_ip";

    public static final String OPER_LOCATION = "oper_location";

    public static final String OPER_PARAM = "oper_param";

    public static final String JSON_RESULT = "json_result";

    public static final String STATUS = "status";

    public static final String ERROR_MSG = "error_msg";

    public static final String OPER_TIME = "oper_time";

}
