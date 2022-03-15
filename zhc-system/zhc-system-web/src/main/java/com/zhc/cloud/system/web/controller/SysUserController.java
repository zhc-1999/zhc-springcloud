package com.zhc.cloud.system.web.controller;


import com.zhc.cloud.common.constant.CacheConstants;
import com.zhc.cloud.common.constant.Constants;
import com.zhc.cloud.common.constant.SecurityConstants;
import com.zhc.cloud.common.constant.UserConstants;
import com.zhc.cloud.common.enums.UserStatus;
import com.zhc.cloud.common.result.Result;
import com.zhc.cloud.common.utils.IdUtils;
import com.zhc.cloud.common.utils.JwtUtils;
import com.zhc.cloud.common.utils.SecurityUtils;
import com.zhc.cloud.common.utils.ServletUtils;
import com.zhc.cloud.common.utils.ip.IpUtils;
import com.zhc.cloud.system.api.dto.LoginUserDTO;
import com.zhc.cloud.system.api.entity.LoginVO;
import com.zhc.cloud.system.domain.mysql.SysLoginLogPO;
import com.zhc.cloud.system.domain.mysql.SysUserPO;
import com.zhc.cloud.system.service.ISysLoginLogService;
import com.zhc.cloud.system.service.ISysUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;
import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * <p>
 * 用户信息表 前端控制器
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@RestController
@RequestMapping("/user")
@Slf4j
public class SysUserController {

    @Autowired
    private ISysUserService sysUserService;

    /***
     * 登录
     * @param loginVO
     * @return
     */
    @PostMapping("login")
    public Result<?> login(@RequestBody LoginVO loginVO) {
        return sysUserService.login(loginVO);
    }

    /***
     * 退出
     * @return
     */
    @DeleteMapping("logOut")
    public Result<?> logOut() {
        return sysUserService.logOut();
    }
    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public Result<?> getInfo(){
        return sysUserService.getInfo();
    }
}
