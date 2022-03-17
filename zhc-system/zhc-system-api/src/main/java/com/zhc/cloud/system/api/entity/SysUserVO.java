package com.zhc.cloud.system.api.entity;

import com.zhc.cloud.common.page.PageVO;
import lombok.Data;

import java.util.Date;

/**
 * @author zhc
 * @description 前端用户列表参数
 * @date 2022-03-16 15:42
 */
@Data
public class SysUserVO extends PageVO {

    private String userName;
    private String status;
    private String phone;
    private Long deptId;

    private Date beginTime;
    private Date endTime;

}
