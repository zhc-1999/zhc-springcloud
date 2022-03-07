package com.zhc.cloud.system.domain.mapper;

import com.zhc.cloud.system.domain.mysql.SysUserRolePO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 用户和角色关联表 Mapper 接口
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Mapper
public interface SysUserRoleMapper extends BaseMapper<SysUserRolePO> {

}
