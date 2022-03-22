package com.zhc.cloud.system.web.controller;

import com.zhc.cloud.common.result.Result;
import com.zhc.cloud.system.common.entity.SysDeptVO;
import com.zhc.cloud.system.service.ISysDeptService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author zhc
 * @description 组织
 * @date 2022-03-16 14:20
 */
@RestController
@RequestMapping("/dept")
@Slf4j
public class SysDeptController {

    @Autowired
    private ISysDeptService iSysDeptService;
    /**
     * 获取部门下拉树列表
     */
    @GetMapping("/treeselect")
    public Result<?> treeselect(SysDeptVO dept) {
        return iSysDeptService.treeselect(dept);
    }

}
