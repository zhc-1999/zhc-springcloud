package com.zhc.cloud.system.service;

import com.zhc.cloud.system.domain.mysql.TestData;

import java.util.List;

/**
 * @author zhc
 * @program: springcloud
 * @description test
 * @date 2021-12-25 05:54
 */
public interface TestDataService {
    List<TestData> select();
    String selectPage();
}
