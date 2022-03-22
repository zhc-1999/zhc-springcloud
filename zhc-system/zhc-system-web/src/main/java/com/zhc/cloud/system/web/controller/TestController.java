package com.zhc.cloud.system.web.controller;

import com.alibaba.fastjson.JSONObject;
import com.zhc.cloud.common.constant.SecurityConstants;
import com.zhc.cloud.common.result.Result;
import com.zhc.cloud.common.utils.ServletUtils;
import com.zhc.cloud.system.common.dto.LoginUserDTO;
import com.zhc.cloud.system.common.entity.TestDataVO;
import com.zhc.cloud.system.service.TestDataService;
import com.zhc.cloud.system.service.TestService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("test1")
    public String test1(){
        log.info("test");
        log.info(ServletUtils.getHeader(SecurityConstants.DETAILS_USER_ID));
        log.info(ServletUtils.getHeader(SecurityConstants.DETAILS_USER_NAME));
        log.info(ServletUtils.getHeader(SecurityConstants.DETAILS_USER_ID));
        log.info(ServletUtils.getHeader(SecurityConstants.DETAILS_USER_NAME));
        String loginUser = ServletUtils.getHeader(SecurityConstants.LOGIN_USER);
        JSONObject dataObj = JSONObject.parseObject(loginUser);
        LoginUserDTO loginUserDTO = JSONObject.toJavaObject(dataObj, LoginUserDTO.class);
        log.info(String.valueOf(loginUserDTO));
        return "testDataService.test()";
    }
    @GetMapping("test2")
    public String test2(){
        log.info("test2");
        return testDataService.selectPage();
    }

    @RequestMapping(value = "/test", method = RequestMethod.POST)
    public Result<?> test(HttpServletRequest request, @RequestBody TestDataVO testDataVO){
        String s = request.getHeaders("user-name").nextElement();
        String name = "";
        try {
            name = URLDecoder.decode(s, "UTF-8");
        }catch (Exception e){
            log.error("",e);
        }
        log.info(name);
        log.info(String.valueOf(testDataVO));
        return Result.success(testDataService.select());
    }

}
