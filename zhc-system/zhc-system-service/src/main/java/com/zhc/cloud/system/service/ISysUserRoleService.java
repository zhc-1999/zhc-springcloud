package com.zhc.cloud.system.service;

import com.zhc.cloud.system.domain.mysql.SysUserRolePO;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhc.cloud.common.result.Result;

import java.util.List;

/**
 * <p>
 * 用户和角色关联表 服务类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
public interface ISysUserRoleService extends IService<SysUserRolePO> {
 /***
 * 查询列表
 * @return Result
 */
 Result<List<SysUserRolePO>> selectList(SysUserRolePO entity);
 /***
 * 查询单个
 * @return Result
 */
 Result<SysUserRolePO> selectOne(SysUserRolePO entity);
 /***
 * 根据id查询
 * @return Result
 */
 public Result<SysUserRolePO> selectById(Integer id);

}
