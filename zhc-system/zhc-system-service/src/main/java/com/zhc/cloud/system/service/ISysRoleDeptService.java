package com.zhc.cloud.system.service;

import com.zhc.cloud.system.domain.mysql.SysRoleDeptPO;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhc.cloud.common.result.Result;

import java.util.List;

/**
 * <p>
 * 角色和部门关联表 服务类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
public interface ISysRoleDeptService extends IService<SysRoleDeptPO> {
 /***
 * 查询列表
 * @return Result
 */
 Result<List<SysRoleDeptPO>> selectList(SysRoleDeptPO entity);
 /***
 * 查询单个
 * @return Result
 */
 Result<SysRoleDeptPO> selectOne(SysRoleDeptPO entity);
 /***
 * 根据id查询
 * @return Result
 */
 public Result<SysRoleDeptPO> selectById(Integer id);

}
