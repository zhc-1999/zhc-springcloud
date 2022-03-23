package com.zhc.cloud.system.web.controller;


import com.zhc.cloud.common.result.Result;
import com.zhc.cloud.system.common.dto.LoginUserDTO;
import com.zhc.cloud.system.common.dto.SysUserDTO;
import com.zhc.cloud.system.common.entity.LoginVO;
import com.zhc.cloud.system.common.entity.SysUserVO;
import com.zhc.cloud.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

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
    /**
     * 获取用户列表
     */
    @GetMapping("/list")
    public Result<?> list(SysUserVO user) {
        return sysUserService.selectList(user);
    }

    /**
     * 添加或修改 页面信息
     * @return
     */
    @GetMapping(value = { "/", "/{userId}" })
    public Result<?> getInfo(@PathVariable(value = "userId", required = false) Long userId){
        return sysUserService.getInfo(userId);
    }
    /**
     * 添加或修改用戶
     * @return
     */
    @PostMapping(value = "/insertOrEdit" )
    public Result<?> insertOrEdit(@RequestBody SysUserVO user){
        return sysUserService.insertOrEdit(user);
    }
    /**
     * 删除用戶
     * @return
     */
    @DeleteMapping("/{userIds}")
    public Result<?> delete(@PathVariable Long[] userIds) {
        return sysUserService.delete(userIds);
    }

    /**
     * 导出用戶列表
     * @return
     */
    @PostMapping("/export")
    public void export(SysUserVO user,HttpServletResponse response) {
        sysUserService.export(response,user);
    }

    /***
     * 重置密码
     * @param user
     * @return
     */
    @PutMapping("/resetPwd")
    public Result<?> resetPwd(@RequestBody SysUserVO user){
        return sysUserService.resetPwd(user);
    }
}
