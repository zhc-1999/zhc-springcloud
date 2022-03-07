package com.zhc.cloud.system.service;

import com.zhc.cloud.system.domain.mysql.SysRolePO;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhc.cloud.common.result.Result;

import java.util.List;

/**
 * <p>
 * 角色信息表 服务类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
public interface ISysRoleService extends IService<SysRolePO> {
 /***
 * 查询列表
 * @return Result
 */
 Result<List<SysRolePO>> selectList(SysRolePO entity);
 /***
 * 查询单个
 * @return Result
 */
 Result<SysRolePO> selectOne(SysRolePO entity);
 /***
 * 根据id查询
 * @return Result
 */
 public Result<SysRolePO> selectById(Integer id);

}
