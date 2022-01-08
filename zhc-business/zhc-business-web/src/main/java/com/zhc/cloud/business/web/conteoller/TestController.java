package com.zhc.cloud.business.web.conteoller;

import com.zhc.cloud.business.service.TestDataService;
import com.zhc.cloud.business.service.TestService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * @author zhc
 * @description 测试
 * @date 2021-12-25 02:07
 */
@RestController
@RefreshScope
@Slf4j
public class TestController {


    @Autowired
    private TestService testService;
    @Autowired
    private TestDataService testDataService;

    @GetMapping("test")
    public String test(HttpServletRequest request){
        log.info("test");
        return testDataService.test();
    }
    @GetMapping("/test1")
    public String test1(){
        log.info("test1");
        return testDataService.select().toString();
    }
}
