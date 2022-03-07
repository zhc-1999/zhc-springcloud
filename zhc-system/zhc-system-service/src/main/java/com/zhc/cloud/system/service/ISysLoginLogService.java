package com.zhc.cloud.system.service;

import com.zhc.cloud.system.domain.mysql.SysLoginLogPO;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhc.cloud.common.result.Result;

import java.util.List;

/**
 * <p>
 * 系统访问记录 服务类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
public interface ISysLoginLogService extends IService<SysLoginLogPO> {
 /***
 * 查询列表
 * @return Result
 */
 Result<List<SysLoginLogPO>> selectList(SysLoginLogPO entity);
 /***
 * 查询单个
 * @return Result
 */
 Result<SysLoginLogPO> selectOne(SysLoginLogPO entity);
 /***
 * 根据id查询
 * @return Result
 */
 public Result<SysLoginLogPO> selectById(Integer id);

}
