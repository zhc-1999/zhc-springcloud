package com.zhc.cloud.system.service.impl;

import com.zhc.cloud.system.domain.mysql.SysRoleDeptPO;
import com.zhc.cloud.system.domain.mapper.SysRoleDeptMapper;
import com.zhc.cloud.system.service.ISysRoleDeptService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.stereotype.Service;
import com.zhc.cloud.common.result.Result;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * <p>
 * 角色和部门关联表 服务实现类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Service
public class SysRoleDeptServiceImpl extends ServiceImpl<SysRoleDeptMapper, SysRoleDeptPO> implements ISysRoleDeptService {
    @Autowired
    private SysRoleDeptMapper sysRoleDeptPOMapper;

    /***
    * 查询列表
    * @return Result
    */
    @Override
    public Result<List<SysRoleDeptPO>> selectList(SysRoleDeptPO sysRoleDeptPO) {
        LambdaQueryWrapper<SysRoleDeptPO> entityWrapper = new LambdaQueryWrapper<SysRoleDeptPO>();
        return Result.success(sysRoleDeptPOMapper.selectList(entityWrapper));
    }
    /***
    * 查询单个
    * @return Result
    */
    @Override
    public Result<SysRoleDeptPO> selectOne(SysRoleDeptPO sysRoleDeptPO) {
        LambdaQueryWrapper<SysRoleDeptPO> entityWrapper = new LambdaQueryWrapper<SysRoleDeptPO>();
        return Result.success(sysRoleDeptPOMapper.selectOne(entityWrapper));
    }
    /***
    * 根据id查询
    * @return Result
    */
    @Override
    public Result<SysRoleDeptPO> selectById(Integer id) {
        return Result.success(sysRoleDeptPOMapper.selectById(id));
    }


}
