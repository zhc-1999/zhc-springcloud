package com.zhc.cloud.system.api.client;

import com.zhc.cloud.common.result.Result;
import com.zhc.cloud.system.api.entity.TestDataVO;
import com.zhc.cloud.system.api.fallback.FeignSystemClientCallback;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author zhc
 * @description testClient
 * @date 2021-12-29 15:11
 */
@FeignClient(name = "ZHC-SYSTEM-SERVICE", fallback = FeignSystemClientCallback.class)
public interface FeignTestClient {

    /**
     * 测试接口
     *
     * @return
     */
    @RequestMapping(value = "/test", method = RequestMethod.POST)
    Result<?> test(@RequestBody TestDataVO testDataVO);
}
