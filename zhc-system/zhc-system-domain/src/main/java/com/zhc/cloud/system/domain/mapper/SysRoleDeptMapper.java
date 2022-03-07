package com.zhc.cloud.system.domain.mapper;

import com.zhc.cloud.system.domain.mysql.SysRoleDeptPO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 角色和部门关联表 Mapper 接口
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Mapper
public interface SysRoleDeptMapper extends BaseMapper<SysRoleDeptPO> {

}
