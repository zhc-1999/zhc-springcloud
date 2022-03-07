package com.zhc.cloud.system.service.impl;

import com.zhc.cloud.system.domain.mysql.SysLoginLogPO;
import com.zhc.cloud.system.domain.mapper.SysLoginLogMapper;
import com.zhc.cloud.system.service.ISysLoginLogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.stereotype.Service;
import com.zhc.cloud.common.result.Result;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * <p>
 * 系统访问记录 服务实现类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Service
public class SysLoginLogServiceImpl extends ServiceImpl<SysLoginLogMapper, SysLoginLogPO> implements ISysLoginLogService {
    @Autowired
    private SysLoginLogMapper sysLoginLogPOMapper;

    /***
    * 查询列表
    * @return Result
    */
    @Override
    public Result<List<SysLoginLogPO>> selectList(SysLoginLogPO sysLoginLogPO) {
        LambdaQueryWrapper<SysLoginLogPO> entityWrapper = new LambdaQueryWrapper<SysLoginLogPO>();
        return Result.success(sysLoginLogPOMapper.selectList(entityWrapper));
    }
    /***
    * 查询单个
    * @return Result
    */
    @Override
    public Result<SysLoginLogPO> selectOne(SysLoginLogPO sysLoginLogPO) {
        LambdaQueryWrapper<SysLoginLogPO> entityWrapper = new LambdaQueryWrapper<SysLoginLogPO>();
        return Result.success(sysLoginLogPOMapper.selectOne(entityWrapper));
    }
    /***
    * 根据id查询
    * @return Result
    */
    @Override
    public Result<SysLoginLogPO> selectById(Integer id) {
        return Result.success(sysLoginLogPOMapper.selectById(id));
    }


}
