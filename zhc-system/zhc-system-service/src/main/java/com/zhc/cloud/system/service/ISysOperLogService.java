package com.zhc.cloud.system.service;

import com.zhc.cloud.system.domain.mysql.SysOperLogPO;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhc.cloud.common.result.Result;

import java.util.List;

/**
 * <p>
 * 操作日志记录 服务类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
public interface ISysOperLogService extends IService<SysOperLogPO> {
 /***
 * 查询列表
 * @return Result
 */
 Result<List<SysOperLogPO>> selectList(SysOperLogPO entity);
 /***
 * 查询单个
 * @return Result
 */
 Result<SysOperLogPO> selectOne(SysOperLogPO entity);
 /***
 * 根据id查询
 * @return Result
 */
 public Result<SysOperLogPO> selectById(Integer id);

}
