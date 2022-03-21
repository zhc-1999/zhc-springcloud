package com.zhc.cloud.system.domain.mapper;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.zhc.cloud.system.domain.mysql.SysUserPO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 用户信息表 Mapper 接口
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Mapper
public interface SysUserMapper extends BaseMapper<SysUserPO> {

    SysUserPO getUserInfo(String username);

    List<SysUserPO> selectUserList(@Param("ew")LambdaQueryWrapper<SysUserPO> entityWrapper,@Param("deptId")Long deptId);
}
