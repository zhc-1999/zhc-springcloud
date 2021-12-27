package com.zhc.cloud.web.conteoller;

import com.zhc.cloud.service.TestDataService;
import com.zhc.cloud.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author zhc
 * @description 测试
 * @date 2021-12-25 02:07
 */
@RestController
@RefreshScope
public class TestController {

    @Value("${user.name}")
    private String name;
    @Autowired
    private TestService testService;
    @Autowired
    private TestDataService testDataService;

    @GetMapping("test")
    public String test(){
        return testService.test();
    }
    @GetMapping("/")
    public String test1(){
        return testDataService.select().toString()+name;
    }
}
