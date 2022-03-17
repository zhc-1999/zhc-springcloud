package com.zhc.cloud.system.service.impl;

import com.zhc.cloud.system.domain.mysql.SysDictTypePO;
import com.zhc.cloud.system.domain.mapper.SysDictTypeMapper;
import com.zhc.cloud.system.service.ISysDictTypeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.stereotype.Service;
import com.zhc.cloud.common.result.Result;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * <p>
 * 字典类型表 服务实现类
 * </p>
 *
 * @author zhc
 * @since 2022-03-16
 */
@Service
public class SysDictTypeServiceImpl extends ServiceImpl<SysDictTypeMapper, SysDictTypePO> implements ISysDictTypeService {
    @Autowired
    private SysDictTypeMapper sysDictTypePOMapper;

    /***
    * 查询列表
    * @return Result
    */
    @Override
    public Result<List<SysDictTypePO>> selectList(SysDictTypePO sysDictTypePO) {
        LambdaQueryWrapper<SysDictTypePO> entityWrapper = new LambdaQueryWrapper<SysDictTypePO>();
        return Result.success(sysDictTypePOMapper.selectList(entityWrapper));
    }
    /***
    * 查询单个
    * @return Result
    */
    @Override
    public Result<SysDictTypePO> selectOne(SysDictTypePO sysDictTypePO) {
        LambdaQueryWrapper<SysDictTypePO> entityWrapper = new LambdaQueryWrapper<SysDictTypePO>();
        return Result.success(sysDictTypePOMapper.selectOne(entityWrapper));
    }
    /***
    * 根据id查询
    * @return Result
    */
    @Override
    public Result<SysDictTypePO> selectById(Integer id) {
        return Result.success(sysDictTypePOMapper.selectById(id));
    }


}
