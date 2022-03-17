package com.zhc.cloud.system.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.zhc.cloud.common.constant.Constants;
import com.zhc.cloud.redis.utils.RedisUtils;
import com.zhc.cloud.system.domain.mysql.SysDictDataPO;
import com.zhc.cloud.system.domain.mapper.SysDictDataMapper;
import com.zhc.cloud.system.service.ISysDictDataService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import com.zhc.cloud.common.result.Result;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * <p>
 * 字典数据表 服务实现类
 * </p>
 *
 * @author zhc
 * @since 2022-03-16
 */
@Service
public class SysDictDataServiceImpl extends ServiceImpl<SysDictDataMapper, SysDictDataPO> implements ISysDictDataService {
    @Autowired
    private RedisUtils redisUtils;
    @Autowired
    private SysDictDataMapper sysDictDataPOMapper;

    /***
    * 查询列表
    * @return Result
    */
    @Override
    public Result<List<SysDictDataPO>> selectList(SysDictDataPO sysDictDataPO) {
        LambdaQueryWrapper<SysDictDataPO> entityWrapper = new LambdaQueryWrapper<SysDictDataPO>();
        return Result.success(sysDictDataPOMapper.selectList(entityWrapper));
    }
    /***
    * 查询单个
    * @return Result
    */
    @Override
    public Result<SysDictDataPO> selectOne(SysDictDataPO sysDictDataPO) {
        LambdaQueryWrapper<SysDictDataPO> entityWrapper = new LambdaQueryWrapper<SysDictDataPO>();
        return Result.success(sysDictDataPOMapper.selectOne(entityWrapper));
    }
    /***
    * 根据id查询
    * @return Result
    */
    @Override
    public Result<SysDictDataPO> selectById(Integer id) {
        return Result.success(sysDictDataPOMapper.selectById(id));
    }

    @Override
    public Result<?> dictType(String dictType) {
        List<SysDictDataPO> sysDictData = null;
        Object redisData = redisUtils.get(Constants.SYS_DICT_KEY + dictType);
        if ( redisData == null) {
            LambdaQueryWrapper<SysDictDataPO> dictDataLambdaQueryWrapper = new LambdaQueryWrapper<>();
            dictDataLambdaQueryWrapper.eq(SysDictDataPO::getDictType,dictType);
            sysDictData = sysDictDataPOMapper.selectList(dictDataLambdaQueryWrapper);
            if (sysDictData == null){
                return Result.failed("字典类型不存在");
            }
            redisUtils.set(Constants.SYS_DICT_KEY + dictType, JSONObject.toJSONString(sysDictData));
        }else {
            sysDictData = JSONObject.parseArray((String) redisData,SysDictDataPO.class);
        }
        return Result.success(sysDictData);
    }


}
