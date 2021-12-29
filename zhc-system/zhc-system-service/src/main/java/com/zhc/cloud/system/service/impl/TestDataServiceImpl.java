package com.zhc.cloud.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhc.cloud.system.domain.mysql.TestData;
import com.zhc.cloud.system.domain.mapper.TestDataMapper;
import com.zhc.cloud.system.service.TestDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zhc
 */
@Service
public class TestDataServiceImpl extends ServiceImpl<TestDataMapper, TestData> implements TestDataService {

    @Autowired
    private TestDataMapper testDataMapper;


    @Override
    public List<TestData> select() {
        return testDataMapper.selectList(new LambdaQueryWrapper<>());
    }
}
