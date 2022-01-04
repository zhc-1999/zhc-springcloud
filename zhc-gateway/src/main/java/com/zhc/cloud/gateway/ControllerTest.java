package com.zhc.cloud.gateway;

import com.zhc.cloud.redis.utils.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author zhc
 * @description test
 * @date 2021-12-28 17:04
 */
@RestController
public class ControllerTest {

    @Resource
    private RedisUtils redisUtils;

    @GetMapping("set")
    public String set(){
        redisUtils.set("user","{\"user\":\"1\",\"name\":\"张三\"}");
        return "success";
    }
    @GetMapping("get")
    public Object get(){
        return redisUtils.get("user");
    }
}
