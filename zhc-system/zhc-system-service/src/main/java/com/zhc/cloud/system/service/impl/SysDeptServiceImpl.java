package com.zhc.cloud.system.service.impl;

import com.zhc.cloud.system.domain.mysql.SysDeptPO;
import com.zhc.cloud.system.domain.mapper.SysDeptMapper;
import com.zhc.cloud.system.service.ISysDeptService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.stereotype.Service;
import com.zhc.cloud.common.result.Result;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * <p>
 * 部门表 服务实现类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Service
public class SysDeptServiceImpl extends ServiceImpl<SysDeptMapper, SysDeptPO> implements ISysDeptService {
    @Autowired
    private SysDeptMapper sysDeptPOMapper;

    /***
    * 查询列表
    * @return Result
    */
    @Override
    public Result<List<SysDeptPO>> selectList(SysDeptPO sysDeptPO) {
        LambdaQueryWrapper<SysDeptPO> entityWrapper = new LambdaQueryWrapper<SysDeptPO>();
        return Result.success(sysDeptPOMapper.selectList(entityWrapper));
    }
    /***
    * 查询单个
    * @return Result
    */
    @Override
    public Result<SysDeptPO> selectOne(SysDeptPO sysDeptPO) {
        LambdaQueryWrapper<SysDeptPO> entityWrapper = new LambdaQueryWrapper<SysDeptPO>();
        return Result.success(sysDeptPOMapper.selectOne(entityWrapper));
    }
    /***
    * 根据id查询
    * @return Result
    */
    @Override
    public Result<SysDeptPO> selectById(Integer id) {
        return Result.success(sysDeptPOMapper.selectById(id));
    }


}
