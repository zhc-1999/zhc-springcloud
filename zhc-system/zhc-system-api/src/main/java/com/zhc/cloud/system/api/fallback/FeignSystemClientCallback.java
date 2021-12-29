package com.zhc.cloud.system.api.fallback;

import com.zhc.cloud.system.api.client.FeignTestClient;
import com.zhc.cloud.system.api.entity.TestData;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * @author zhc
 * @description test
 * @date 2021-12-29 15:15
 */
@Slf4j
@Component
public class FeignSystemClientCallback  implements FeignTestClient {

    @Override
    public String test(TestData testData) {
        return "服务器忙!请稍后重试!!!";
    }
}
