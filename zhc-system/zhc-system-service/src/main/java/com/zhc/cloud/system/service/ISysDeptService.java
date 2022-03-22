package com.zhc.cloud.system.service;

import com.zhc.cloud.system.common.entity.SysDeptVO;
import com.zhc.cloud.system.domain.mysql.SysDeptPO;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhc.cloud.common.result.Result;

import java.util.List;

/**
 * <p>
 * 部门表 服务类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
public interface ISysDeptService extends IService<SysDeptPO> {
 /***
 * 查询列表
 * @return Result
 */
 Result<List<SysDeptPO>> selectList(SysDeptPO entity);
 /***
 * 查询单个
 * @return Result
 */
 Result<SysDeptPO> selectOne(SysDeptPO entity);
 /***
 * 根据id查询
 * @return Result
 */
 public Result<SysDeptPO> selectById(Integer id);

    Result<?> treeselect(SysDeptVO dept);
}
