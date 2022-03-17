package com.zhc.cloud.system.service;

import com.zhc.cloud.system.domain.mysql.SysDictTypePO;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhc.cloud.common.result.Result;

import java.util.List;

/**
 * <p>
 * 字典类型表 服务类
 * </p>
 *
 * @author zhc
 * @since 2022-03-16
 */
public interface ISysDictTypeService extends IService<SysDictTypePO> {
 /***
 * 查询列表
 * @return Result
 */
 Result<List<SysDictTypePO>> selectList(SysDictTypePO entity);
 /***
 * 查询单个
 * @return Result
 */
 Result<SysDictTypePO> selectOne(SysDictTypePO entity);
 /***
 * 根据id查询
 * @return Result
 */
 public Result<SysDictTypePO> selectById(Integer id);

}
