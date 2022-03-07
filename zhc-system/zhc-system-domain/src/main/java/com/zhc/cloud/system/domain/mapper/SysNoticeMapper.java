package com.zhc.cloud.system.domain.mapper;

import com.zhc.cloud.system.domain.mysql.SysNoticePO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 通知公告表 Mapper 接口
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Mapper
public interface SysNoticeMapper extends BaseMapper<SysNoticePO> {

}
