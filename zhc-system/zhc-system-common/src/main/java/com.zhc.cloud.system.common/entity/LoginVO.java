package com.zhc.cloud.system.common.entity;

import lombok.Data;

/**
 * @author zhc
 * @description 登录
 * @date 2022-01-27 16:19
 */
@Data
public class LoginVO {
    /**
     * 用户名
     */
    private String username;

    /**
     * 用户密码
     */
    private String password;

}
