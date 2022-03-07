package com.zhc.cloud.system.web.controller;

import com.zhc.cloud.common.result.Result;
import com.zhc.cloud.common.utils.SecurityUtils;
import com.zhc.cloud.system.service.ISysMenuService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author zhc
 * @description 菜单表
 * @date 2022-02-21 14:01
 */
@Slf4j
@RestController
@RequestMapping("/menu")
public class SysMenuController {

    @Autowired
    private ISysMenuService menuService;
    /**
     * 获取路由信息
     *
     * @return 路由信息
     */
    @GetMapping("getMenus")
    public Result<?> getMenus(){
        String userId = SecurityUtils.getUserId();
        return menuService.selectMenuTreeByUserId(userId);
    }

}
