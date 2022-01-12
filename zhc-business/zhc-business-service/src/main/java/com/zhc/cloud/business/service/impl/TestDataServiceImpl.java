package com.zhc.cloud.business.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhc.cloud.business.domain.mysql.TestDataPO;
import com.zhc.cloud.business.domain.mapper.TestDataMapper;
import com.zhc.cloud.common.result.Result;
import com.zhc.cloud.system.api.client.FeignTestClient;
import com.zhc.cloud.system.api.entity.TestDataVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zhc.cloud.business.service.TestDataService;

import java.util.List;

/**
 * @author zhc
 */
@Service
public class TestDataServiceImpl extends ServiceImpl<TestDataMapper, TestDataPO> implements TestDataService{

    @Autowired
    private TestDataMapper testDataMapper;

    @Autowired
    private FeignTestClient feignTestClient;
    @Override
    public List<TestDataPO> select() {
        return testDataMapper.selectList(new LambdaQueryWrapper<>());
    }

    @Override
    public Result<?> test() {
        TestDataVO testDataVO = new TestDataVO();
        testDataVO.setId(1L);
        testDataVO.setName("名称");
        return feignTestClient.test(testDataVO);
    }
}
