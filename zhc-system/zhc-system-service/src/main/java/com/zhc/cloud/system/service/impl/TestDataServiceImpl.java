package com.zhc.cloud.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhc.cloud.system.domain.mysql.TestData;
import com.zhc.cloud.system.domain.mapper.TestDataMapper;
import com.zhc.cloud.system.service.TestDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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

    @Override
    public String selectPage() {
        TestData testData1 = new TestData();
        testData1.setName("zhc");
        testData1.setCreateId(1);
        testData1.setUpdateId(1);
        testDataMapper.insert(testData1);
//        PageHelper.startPage(1, 1);
        List<TestData> testData = testDataMapper.selectList(new LambdaQueryWrapper<>());
//        PageInfo<TestData> testDataPageInfo = new PageInfo<>(testData);
        System.out.println(testData);
//        System.out.println(testDataPageInfo);
        return "";
//        return new PageResult<>(tbArticlePage.getTotal(),tbArticlePage.getRecords());
    }

}
