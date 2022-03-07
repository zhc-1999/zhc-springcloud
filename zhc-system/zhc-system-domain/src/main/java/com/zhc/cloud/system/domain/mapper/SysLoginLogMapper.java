package com.zhc.cloud.system.domain.mapper;

import com.zhc.cloud.system.domain.mysql.SysLoginLogPO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 系统访问记录 Mapper 接口
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Mapper
public interface SysLoginLogMapper extends BaseMapper<SysLoginLogPO> {

}
