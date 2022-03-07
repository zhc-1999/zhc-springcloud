package com.zhc.cloud.system.service;

import com.zhc.cloud.system.domain.mysql.SysPostPO;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhc.cloud.common.result.Result;

import java.util.List;

/**
 * <p>
 * 岗位信息表 服务类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
public interface ISysPostService extends IService<SysPostPO> {
 /***
 * 查询列表
 * @return Result
 */
 Result<List<SysPostPO>> selectList(SysPostPO entity);
 /***
 * 查询单个
 * @return Result
 */
 Result<SysPostPO> selectOne(SysPostPO entity);
 /***
 * 根据id查询
 * @return Result
 */
 public Result<SysPostPO> selectById(Integer id);

}
