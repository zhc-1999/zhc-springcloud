package com.zhc.cloud.system.service;

import com.zhc.cloud.system.domain.mysql.SysDictDataPO;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhc.cloud.common.result.Result;

import java.util.List;

/**
 * <p>
 * 字典数据表 服务类
 * </p>
 *
 * @author zhc
 * @since 2022-03-16
 */
public interface ISysDictDataService extends IService<SysDictDataPO> {
 /***
 * 查询列表
 * @return Result
 */
 Result<List<SysDictDataPO>> selectList(SysDictDataPO entity);
 /***
 * 查询单个
 * @return Result
 */
 Result<SysDictDataPO> selectOne(SysDictDataPO entity);
 /***
 * 根据id查询
 * @return Result
 */
 public Result<SysDictDataPO> selectById(Integer id);

    Result<?> dictType(String dictType);
}
