package com.zhc.cloud.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhc.cloud.system.domain.mysql.TestDataPO;
import com.zhc.cloud.system.domain.mapper.TestDataMapper;
import com.zhc.cloud.system.service.TestDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zhc
 */
@Service
public class TestDataServiceImpl extends ServiceImpl<TestDataMapper, TestDataPO> implements TestDataService {

    @Autowired
    private TestDataMapper testDataMapper;


    @Override
    public List<TestDataPO> select() {
        return testDataMapper.selectList(new LambdaQueryWrapper<>());
    }

    @Override
    public String selectPage() {
        TestDataPO testDataPO1 = new TestDataPO();
        testDataPO1.setName("zhc");
        testDataMapper.insert(testDataPO1);
//        PageHelper.startPage(1, 1);
        List<TestDataPO> testDatumPOS = testDataMapper.selectList(new LambdaQueryWrapper<>());
//        PageInfo<TestData> testDataPageInfo = new PageInfo<>(testData);
        System.out.println(testDatumPOS);
//        System.out.println(testDataPageInfo);
        return "";
//        return new PageResult<>(tbArticlePage.getTotal(),tbArticlePage.getRecords());
    }

}
