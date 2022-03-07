package com.zhc.cloud.system.service.impl;

import com.zhc.cloud.system.domain.mysql.SysUserRolePO;
import com.zhc.cloud.system.domain.mapper.SysUserRoleMapper;
import com.zhc.cloud.system.service.ISysUserRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.stereotype.Service;
import com.zhc.cloud.common.result.Result;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * <p>
 * 用户和角色关联表 服务实现类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Service
public class SysUserRoleServiceImpl extends ServiceImpl<SysUserRoleMapper, SysUserRolePO> implements ISysUserRoleService {
    @Autowired
    private SysUserRoleMapper sysUserRolePOMapper;

    /***
    * 查询列表
    * @return Result
    */
    @Override
    public Result<List<SysUserRolePO>> selectList(SysUserRolePO sysUserRolePO) {
        LambdaQueryWrapper<SysUserRolePO> entityWrapper = new LambdaQueryWrapper<SysUserRolePO>();
        return Result.success(sysUserRolePOMapper.selectList(entityWrapper));
    }
    /***
    * 查询单个
    * @return Result
    */
    @Override
    public Result<SysUserRolePO> selectOne(SysUserRolePO sysUserRolePO) {
        LambdaQueryWrapper<SysUserRolePO> entityWrapper = new LambdaQueryWrapper<SysUserRolePO>();
        return Result.success(sysUserRolePOMapper.selectOne(entityWrapper));
    }
    /***
    * 根据id查询
    * @return Result
    */
    @Override
    public Result<SysUserRolePO> selectById(Integer id) {
        return Result.success(sysUserRolePOMapper.selectById(id));
    }


}
