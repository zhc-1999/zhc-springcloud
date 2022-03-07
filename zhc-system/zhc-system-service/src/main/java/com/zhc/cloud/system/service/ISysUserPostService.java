package com.zhc.cloud.system.service;

import com.zhc.cloud.system.domain.mysql.SysUserPostPO;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhc.cloud.common.result.Result;

import java.util.List;

/**
 * <p>
 * 用户与岗位关联表 服务类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
public interface ISysUserPostService extends IService<SysUserPostPO> {
 /***
 * 查询列表
 * @return Result
 */
 Result<List<SysUserPostPO>> selectList(SysUserPostPO entity);
 /***
 * 查询单个
 * @return Result
 */
 Result<SysUserPostPO> selectOne(SysUserPostPO entity);
 /***
 * 根据id查询
 * @return Result
 */
 public Result<SysUserPostPO> selectById(Integer id);

}
