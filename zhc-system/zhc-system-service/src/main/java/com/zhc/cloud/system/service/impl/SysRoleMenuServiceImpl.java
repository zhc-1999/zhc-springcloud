package com.zhc.cloud.system.service.impl;

import com.zhc.cloud.system.domain.mysql.SysRoleMenuPO;
import com.zhc.cloud.system.domain.mapper.SysRoleMenuMapper;
import com.zhc.cloud.system.service.ISysRoleMenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.stereotype.Service;
import com.zhc.cloud.common.result.Result;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * <p>
 * 角色和菜单关联表 服务实现类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Service
public class SysRoleMenuServiceImpl extends ServiceImpl<SysRoleMenuMapper, SysRoleMenuPO> implements ISysRoleMenuService {
    @Autowired
    private SysRoleMenuMapper sysRoleMenuPOMapper;

    /***
    * 查询列表
    * @return Result
    */
    @Override
    public Result<List<SysRoleMenuPO>> selectList(SysRoleMenuPO sysRoleMenuPO) {
        LambdaQueryWrapper<SysRoleMenuPO> entityWrapper = new LambdaQueryWrapper<SysRoleMenuPO>();
        return Result.success(sysRoleMenuPOMapper.selectList(entityWrapper));
    }
    /***
    * 查询单个
    * @return Result
    */
    @Override
    public Result<SysRoleMenuPO> selectOne(SysRoleMenuPO sysRoleMenuPO) {
        LambdaQueryWrapper<SysRoleMenuPO> entityWrapper = new LambdaQueryWrapper<SysRoleMenuPO>();
        return Result.success(sysRoleMenuPOMapper.selectOne(entityWrapper));
    }
    /***
    * 根据id查询
    * @return Result
    */
    @Override
    public Result<SysRoleMenuPO> selectById(Integer id) {
        return Result.success(sysRoleMenuPOMapper.selectById(id));
    }


}
