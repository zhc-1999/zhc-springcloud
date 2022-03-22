package com.zhc.cloud.system.service;

import com.zhc.cloud.system.common.entity.LoginVO;
import com.zhc.cloud.system.common.entity.SysUserVO;
import com.zhc.cloud.system.domain.mysql.SysUserPO;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhc.cloud.common.result.Result;

/**
 * <p>
 * 用户信息表 服务类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
public interface ISysUserService extends IService<SysUserPO> {
    /***
    * 查询列表
    * @return Result
    */
    Result<?> selectList(SysUserVO entity);
    /***
    * 查询单个
    * @return Result
    */
    Result<SysUserPO> selectOne(SysUserPO entity);
    /***
    * 根据id查询
    * @return Result
    */
    public Result<SysUserPO> selectById(Integer id);

    /***
     * 登录接口
     * @param loginVO
     * @return
     */
    Result<?> login(LoginVO loginVO);

    /***
     * 退出
     * @return
     */
    Result<?> logOut();

    Result<?> getInfo();

    Result<?> getInfo(Long userId);

    Result<?> insertOrEdit(SysUserVO user);

    Result<?> delete(Long[] userIds);
}
