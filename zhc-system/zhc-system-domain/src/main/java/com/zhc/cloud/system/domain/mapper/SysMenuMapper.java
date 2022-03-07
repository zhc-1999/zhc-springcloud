package com.zhc.cloud.system.domain.mapper;

import com.zhc.cloud.system.domain.mysql.SysMenuPO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 * 菜单权限表 Mapper 接口
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Mapper
public interface SysMenuMapper extends BaseMapper<SysMenuPO> {

    List<SysMenuPO> selectByUserId(Long userId);

    List<SysMenuPO> selectMenuTreeByUserId(String userId);
}
