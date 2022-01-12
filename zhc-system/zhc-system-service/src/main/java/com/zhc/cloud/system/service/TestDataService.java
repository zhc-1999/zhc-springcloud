package com.zhc.cloud.system.service;

import com.zhc.cloud.system.domain.mysql.TestDataPO;

import java.util.List;

/**
 * @author zhc
 * @program: springcloud
 * @description test
 * @date 2021-12-25 05:54
 */
public interface TestDataService {
    List<TestDataPO> select();
    String selectPage();
}
