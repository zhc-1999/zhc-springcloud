package com.zhc.cloud.system.web.controller;


import com.zhc.cloud.common.result.Result;
import com.zhc.cloud.system.service.ISysDictDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 字典数据表 前端控制器
 * </p>
 *
 * @author zhc
 * @since 2022-03-16
 */
@RestController
@RequestMapping("/dictData")
@Slf4j
public class SysDictDataController {

    @Autowired
    private ISysDictDataService iSysDictDataService;

    /**
     * 根据字典类型查询字典数据信息
     */
    @GetMapping(value = "/type/{dictType}")
    public Result<?> dictType(@PathVariable String dictType) {
        return iSysDictDataService.dictType(dictType);
    }
}
