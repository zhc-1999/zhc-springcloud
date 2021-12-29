package com.zhc.cloud.business.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhc.cloud.business.domain.mysql.TestData;
import com.zhc.cloud.business.domain.mapper.TestDataMapper;
import com.zhc.cloud.system.api.client.FeignTestClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zhc.cloud.business.service.TestDataService;

import java.util.List;

/**
 * @author zhc
 */
@Service
public class TestDataServiceImpl extends ServiceImpl<TestDataMapper, TestData> implements TestDataService{

    @Autowired
    private TestDataMapper testDataMapper;

    @Autowired
    FeignTestClient feignTestClient;
    @Override
    public List<TestData> select() {
        return testDataMapper.selectList(new LambdaQueryWrapper<>());
    }

    @Override
    public String test() {
        return feignTestClient.test(new com.zhc.cloud.system.api.entity.TestData());
    }
}
