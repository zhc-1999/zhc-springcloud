package com.zhc.cloud.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhc.cloud.domain.entity.mysql.TestData;
import com.zhc.cloud.domain.mapper.mysql.TestDataMapper;
import com.zhc.cloud.service.TestDataService;

import java.util.List;

/**
 * @author zhc
 */
@Service
public class TestDataServiceImpl extends ServiceImpl<TestDataMapper, TestData> implements TestDataService{

    @Autowired
    private TestDataMapper testDataMapper;

    @Override
    public List<TestData> select() {
        return testDataMapper.selectList(new LambdaQueryWrapper<>());
    }
}
