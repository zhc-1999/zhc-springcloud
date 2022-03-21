package com.zhc.cloud.system.api.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author zhc
 * @description 用户实体类
 * @date 2022-03-16 17:09
 */
@Data
public class UserDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long userId;

    private Long deptId;

    private String deptName;

    private String userName;

    private String nickName;

    private String phone;

    private String sex;

    private String avatar;

    private String status;

    private Date createTime;
}
