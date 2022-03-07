package com.zhc.cloud.system.domain.mapper;

import com.zhc.cloud.system.domain.mysql.SysUserPO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

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
}
