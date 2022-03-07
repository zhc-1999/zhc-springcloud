package com.zhc.cloud.system.service;

import com.zhc.cloud.system.domain.mysql.SysRoleMenuPO;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhc.cloud.common.result.Result;

import java.util.List;

/**
 * <p>
 * 角色和菜单关联表 服务类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
public interface ISysRoleMenuService extends IService<SysRoleMenuPO> {
 /***
 * 查询列表
 * @return Result
 */
 Result<List<SysRoleMenuPO>> selectList(SysRoleMenuPO entity);
 /***
 * 查询单个
 * @return Result
 */
 Result<SysRoleMenuPO> selectOne(SysRoleMenuPO entity);
 /***
 * 根据id查询
 * @return Result
 */
 public Result<SysRoleMenuPO> selectById(Integer id);

}
