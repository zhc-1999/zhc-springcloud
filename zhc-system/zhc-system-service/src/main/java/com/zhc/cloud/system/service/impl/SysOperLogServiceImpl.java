package com.zhc.cloud.system.service.impl;

import com.zhc.cloud.system.domain.mysql.SysOperLogPO;
import com.zhc.cloud.system.domain.mapper.SysOperLogMapper;
import com.zhc.cloud.system.service.ISysOperLogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.stereotype.Service;
import com.zhc.cloud.common.result.Result;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * <p>
 * 操作日志记录 服务实现类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Service
public class SysOperLogServiceImpl extends ServiceImpl<SysOperLogMapper, SysOperLogPO> implements ISysOperLogService {
    @Autowired
    private SysOperLogMapper sysOperLogPOMapper;

    /***
    * 查询列表
    * @return Result
    */
    @Override
    public Result<List<SysOperLogPO>> selectList(SysOperLogPO sysOperLogPO) {
        LambdaQueryWrapper<SysOperLogPO> entityWrapper = new LambdaQueryWrapper<SysOperLogPO>();
        return Result.success(sysOperLogPOMapper.selectList(entityWrapper));
    }
    /***
    * 查询单个
    * @return Result
    */
    @Override
    public Result<SysOperLogPO> selectOne(SysOperLogPO sysOperLogPO) {
        LambdaQueryWrapper<SysOperLogPO> entityWrapper = new LambdaQueryWrapper<SysOperLogPO>();
        return Result.success(sysOperLogPOMapper.selectOne(entityWrapper));
    }
    /***
    * 根据id查询
    * @return Result
    */
    @Override
    public Result<SysOperLogPO> selectById(Integer id) {
        return Result.success(sysOperLogPOMapper.selectById(id));
    }


}
