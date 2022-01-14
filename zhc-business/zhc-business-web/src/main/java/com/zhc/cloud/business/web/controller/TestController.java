package com.zhc.cloud.business.web.controller;

import com.zhc.cloud.business.service.TestDataService;
import com.zhc.cloud.business.service.TestService;
import com.zhc.cloud.common.result.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;

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
    public Result<?> test(HttpServletRequest request){
        String s = request.getHeaders("user-name").nextElement();
        String name = "";
        try {
            name = URLDecoder.decode(s, "UTF-8");
        }catch (Exception e){
            log.error("",e);
        }
        log.info(name);
        return testDataService.test();
    }
    @GetMapping("/test1")
    public String test1(){
        log.info("test1");
        return testDataService.select().toString();
    }
}
