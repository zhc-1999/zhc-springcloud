package com.zhc.cloud.system.service;

import com.zhc.cloud.system.domain.mysql.SysNoticePO;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhc.cloud.common.result.Result;

import java.util.List;

/**
 * <p>
 * 通知公告表 服务类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
public interface ISysNoticeService extends IService<SysNoticePO> {
 /***
 * 查询列表
 * @return Result
 */
 Result<List<SysNoticePO>> selectList(SysNoticePO entity);
 /***
 * 查询单个
 * @return Result
 */
 Result<SysNoticePO> selectOne(SysNoticePO entity);
 /***
 * 根据id查询
 * @return Result
 */
 public Result<SysNoticePO> selectById(Integer id);

}
