package com.zhc.cloud.system.service.impl;

import com.zhc.cloud.system.domain.mysql.SysNoticePO;
import com.zhc.cloud.system.domain.mapper.SysNoticeMapper;
import com.zhc.cloud.system.service.ISysNoticeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.stereotype.Service;
import com.zhc.cloud.common.result.Result;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * <p>
 * 通知公告表 服务实现类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Service
public class SysNoticeServiceImpl extends ServiceImpl<SysNoticeMapper, SysNoticePO> implements ISysNoticeService {
    @Autowired
    private SysNoticeMapper sysNoticePOMapper;

    /***
    * 查询列表
    * @return Result
    */
    @Override
    public Result<List<SysNoticePO>> selectList(SysNoticePO sysNoticePO) {
        LambdaQueryWrapper<SysNoticePO> entityWrapper = new LambdaQueryWrapper<SysNoticePO>();
        return Result.success(sysNoticePOMapper.selectList(entityWrapper));
    }
    /***
    * 查询单个
    * @return Result
    */
    @Override
    public Result<SysNoticePO> selectOne(SysNoticePO sysNoticePO) {
        LambdaQueryWrapper<SysNoticePO> entityWrapper = new LambdaQueryWrapper<SysNoticePO>();
        return Result.success(sysNoticePOMapper.selectOne(entityWrapper));
    }
    /***
    * 根据id查询
    * @return Result
    */
    @Override
    public Result<SysNoticePO> selectById(Integer id) {
        return Result.success(sysNoticePOMapper.selectById(id));
    }


}
