package com.zhc.cloud.business.service.impl;

import com.zhc.cloud.business.service.TestService;
import org.springframework.stereotype.Service;

/**
 * @author zhc
 * @description 测试
 * @date 2021-12-25 02:13
 */
@Service
public class TestServiceImpl implements TestService {

    @Override
    public String test() {
        return TestServiceImpl.class.getName();
    }
}
