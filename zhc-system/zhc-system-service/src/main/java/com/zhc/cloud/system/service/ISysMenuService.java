package com.zhc.cloud.system.service;

import com.zhc.cloud.system.domain.mysql.SysMenuPO;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhc.cloud.common.result.Result;

import java.util.List;

/**
 * <p>
 * 菜单权限表 服务类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
public interface ISysMenuService extends IService<SysMenuPO> {
 /***
 * 查询列表
 * @return Result
 */
 Result<List<SysMenuPO>> selectList(SysMenuPO entity);
 /***
 * 查询单个
 * @return Result
 */
 Result<SysMenuPO> selectOne(SysMenuPO entity);
 /***
 * 根据id查询
 * @return Result
 */
 public Result<SysMenuPO> selectById(Integer id);
 /**
  * 根据用户ID查询菜单
  *
  * @param userId 用户名称
  * @return 菜单列表
  */
 public Result<?> selectMenuTreeByUserId(String userId);
}
