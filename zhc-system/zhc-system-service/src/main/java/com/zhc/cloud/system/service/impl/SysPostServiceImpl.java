package com.zhc.cloud.system.service.impl;

import com.zhc.cloud.system.domain.mysql.SysPostPO;
import com.zhc.cloud.system.domain.mapper.SysPostMapper;
import com.zhc.cloud.system.service.ISysPostService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.stereotype.Service;
import com.zhc.cloud.common.result.Result;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * <p>
 * 岗位信息表 服务实现类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Service
public class SysPostServiceImpl extends ServiceImpl<SysPostMapper, SysPostPO> implements ISysPostService {
    @Autowired
    private SysPostMapper sysPostPOMapper;

    /***
    * 查询列表
    * @return Result
    */
    @Override
    public Result<List<SysPostPO>> selectList(SysPostPO sysPostPO) {
        LambdaQueryWrapper<SysPostPO> entityWrapper = new LambdaQueryWrapper<SysPostPO>();
        return Result.success(sysPostPOMapper.selectList(entityWrapper));
    }
    /***
    * 查询单个
    * @return Result
    */
    @Override
    public Result<SysPostPO> selectOne(SysPostPO sysPostPO) {
        LambdaQueryWrapper<SysPostPO> entityWrapper = new LambdaQueryWrapper<SysPostPO>();
        return Result.success(sysPostPOMapper.selectOne(entityWrapper));
    }
    /***
    * 根据id查询
    * @return Result
    */
    @Override
    public Result<SysPostPO> selectById(Integer id) {
        return Result.success(sysPostPOMapper.selectById(id));
    }


}
