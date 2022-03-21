package com.zhc.cloud.system.domain.mapper;

import com.zhc.cloud.system.domain.mysql.SysPostPO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 * 岗位信息表 Mapper 接口
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Mapper
public interface SysPostMapper extends BaseMapper<SysPostPO> {

    List<SysPostPO> selectPostListByUserId(Long userId);
}
