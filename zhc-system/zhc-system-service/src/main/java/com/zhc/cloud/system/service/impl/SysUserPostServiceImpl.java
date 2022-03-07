package com.zhc.cloud.system.service.impl;

import com.zhc.cloud.system.domain.mysql.SysUserPostPO;
import com.zhc.cloud.system.domain.mapper.SysUserPostMapper;
import com.zhc.cloud.system.service.ISysUserPostService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.stereotype.Service;
import com.zhc.cloud.common.result.Result;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * <p>
 * 用户与岗位关联表 服务实现类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Service
public class SysUserPostServiceImpl extends ServiceImpl<SysUserPostMapper, SysUserPostPO> implements ISysUserPostService {
    @Autowired
    private SysUserPostMapper sysUserPostPOMapper;

    /***
    * 查询列表
    * @return Result
    */
    @Override
    public Result<List<SysUserPostPO>> selectList(SysUserPostPO sysUserPostPO) {
        LambdaQueryWrapper<SysUserPostPO> entityWrapper = new LambdaQueryWrapper<SysUserPostPO>();
        return Result.success(sysUserPostPOMapper.selectList(entityWrapper));
    }
    /***
    * 查询单个
    * @return Result
    */
    @Override
    public Result<SysUserPostPO> selectOne(SysUserPostPO sysUserPostPO) {
        LambdaQueryWrapper<SysUserPostPO> entityWrapper = new LambdaQueryWrapper<SysUserPostPO>();
        return Result.success(sysUserPostPOMapper.selectOne(entityWrapper));
    }
    /***
    * 根据id查询
    * @return Result
    */
    @Override
    public Result<SysUserPostPO> selectById(Integer id) {
        return Result.success(sysUserPostPOMapper.selectById(id));
    }


}
