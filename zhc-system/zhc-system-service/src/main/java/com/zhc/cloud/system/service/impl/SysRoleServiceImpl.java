package com.zhc.cloud.system.service.impl;

import com.zhc.cloud.system.domain.mysql.SysRolePO;
import com.zhc.cloud.system.domain.mapper.SysRoleMapper;
import com.zhc.cloud.system.service.ISysRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.stereotype.Service;
import com.zhc.cloud.common.result.Result;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * <p>
 * 角色信息表 服务实现类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRolePO> implements ISysRoleService {
    @Autowired
    private SysRoleMapper sysRolePOMapper;

    /***
    * 查询列表
    * @return Result
    */
    @Override
    public Result<List<SysRolePO>> selectList(SysRolePO sysRolePO) {
        LambdaQueryWrapper<SysRolePO> entityWrapper = new LambdaQueryWrapper<SysRolePO>();
        return Result.success(sysRolePOMapper.selectList(entityWrapper));
    }
    /***
    * 查询单个
    * @return Result
    */
    @Override
    public Result<SysRolePO> selectOne(SysRolePO sysRolePO) {
        LambdaQueryWrapper<SysRolePO> entityWrapper = new LambdaQueryWrapper<SysRolePO>();
        return Result.success(sysRolePOMapper.selectOne(entityWrapper));
    }
    /***
    * 根据id查询
    * @return Result
    */
    @Override
    public Result<SysRolePO> selectById(Integer id) {
        return Result.success(sysRolePOMapper.selectById(id));
    }


}
