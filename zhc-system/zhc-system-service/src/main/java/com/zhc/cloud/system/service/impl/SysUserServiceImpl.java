package com.zhc.cloud.system.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.zhc.cloud.common.constant.CacheConstants;
import com.zhc.cloud.common.constant.Constants;
import com.zhc.cloud.common.constant.SecurityConstants;
import com.zhc.cloud.common.constant.UserConstants;
import com.zhc.cloud.common.enums.UserStatus;
import com.zhc.cloud.common.utils.IdUtils;
import com.zhc.cloud.common.utils.JwtUtils;
import com.zhc.cloud.common.utils.ServletUtils;
import com.zhc.cloud.common.utils.ip.IpUtils;
import com.zhc.cloud.redis.utils.RedisUtils;
import com.zhc.cloud.system.api.dto.LoginUserDTO;
import com.zhc.cloud.system.api.dto.SysRoleDTO;
import com.zhc.cloud.system.api.entity.LoginVO;
import com.zhc.cloud.system.domain.mapper.*;
import com.zhc.cloud.system.domain.mysql.*;
import com.zhc.cloud.system.service.ISysUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.zhc.cloud.common.result.Result;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;

/**
 * <p>
 * 用户信息表 服务实现类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUserPO> implements ISysUserService {
    @Autowired
    private SysUserMapper sysUserPOMapper;
    @Autowired
    private SysDeptMapper sysDeptMapper;
    @Autowired
    private SysLoginLogMapper sysLoginLogMapper;
    @Autowired
    private SysRoleMapper sysRoleMapper;
    @Autowired
    private SysMenuMapper sysMenuMapper;
    @Autowired
    private RedisUtils redisUtils;

    /***
    * 查询列表
    * @return Result
    */
    @Override
    public Result<List<SysUserPO>> selectList(SysUserPO sysUserPO) {
        LambdaQueryWrapper<SysUserPO> entityWrapper = new LambdaQueryWrapper<SysUserPO>();
        return Result.success(sysUserPOMapper.selectList(entityWrapper));
    }
    /***
    * 查询单个
    * @return Result
    */
    @Override
    public Result<SysUserPO> selectOne(SysUserPO sysUserPO) {
        LambdaQueryWrapper<SysUserPO> entityWrapper = new LambdaQueryWrapper<SysUserPO>();
        return Result.success(sysUserPOMapper.selectOne(entityWrapper));
    }
    /***
    * 根据id查询
    * @return Result
    */
    @Override
    public Result<SysUserPO> selectById(Integer id) {
        return Result.success(sysUserPOMapper.selectById(id));
    }

    /**
     * 登录接口
     * @param loginVO
     * @return Result
     */
    @Override
    public Result<?> login(LoginVO loginVO) {
        String username = loginVO.getUserName();
        String password = loginVO.getPassword();
        // 用户名或密码为空 错误
        if (StringUtils.isAnyBlank(username, password)) {
            return Result.failed("用户/密码必须填写");
        }
        // 密码如果不在指定范围内 错误
        if (password.length() < UserConstants.PASSWORD_MIN_LENGTH || password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
            return Result.failed("用户密码不在指定范围");
        }
        // 用户名不在指定范围内 错误
        if (username.length() < UserConstants.USERNAME_MIN_LENGTH || username.length() > UserConstants.USERNAME_MAX_LENGTH) {
            return Result.failed("用户名不在指定范围");
        }
        LambdaQueryWrapper<SysUserPO> userLambdaQueryWrapper = new LambdaQueryWrapper<>();
        userLambdaQueryWrapper.eq(SysUserPO::getUserName,username);
        SysUserPO sysUser = sysUserPOMapper.selectOne(userLambdaQueryWrapper);
        if (sysUser == null){
            return Result.failed("用户名或密码错误");
        }
        Long userId = sysUser.getUserId();
        if (StringUtils.isBlank(sysUser.getUserName())) {
            return Result.failed("用户名或密码错误");
        }
        if (UserStatus.DELETED.getCode().equals(sysUser.getDeleted())) {
            recordLogininfor(userId, Constants.LOGIN_FAIL, "对不起，您的账号： + username + 已被删除");
            return Result.failed("对不起，您的账号：" + username + " 已被删除");
        }
        if (UserStatus.DISABLE.getCode().equals(sysUser.getStatus())) {
            recordLogininfor(userId, Constants.LOGIN_FAIL, "对不起，您的账号：" + username + " 已停用");
            return Result.failed("对不起，您的账号：" + username + " 已停用");
        }
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        if (!passwordEncoder.matches(password, sysUser.getPassword())) {
            recordLogininfor(userId, Constants.LOGIN_FAIL, "用户不存在/密码错误");
            return Result.failed("用户不存在/密码错误");
        }
        //获取用户的组织机构
        SysDeptPO sysDept = sysDeptMapper.selectById(sysUser.getDeptId());
        if (sysDept == null){
            recordLogininfor(userId, Constants.LOGIN_FAIL, "对不起，您的账号：" + username + " 组织机构不存在");
            return Result.failed("对不起，您的账号：" + username + " 组织机构不存在");
        }
        //获取用户的角色权限
        List<SysRolePO> sysRoleList = sysRoleMapper.selectByUserId(userId);
        if(sysRoleList.size()<=0){
            recordLogininfor(userId, Constants.LOGIN_FAIL, "对不起，您的账号：" + username + " 角色不存在");
            return Result.failed("对不起，您的账号：" + username + " 角色不存在");
        }
        Set<SysRoleDTO> roleSet = new HashSet();
        for (SysRolePO sysRolePO : sysRoleList) {
            SysRoleDTO sysRoleDTO = new SysRoleDTO();
            BeanUtils.copyProperties(sysRolePO,sysRoleDTO);
            roleSet.add(sysRoleDTO);
        }
        //获取角色菜单
        List<SysMenuPO> sysMenuList =sysMenuMapper.selectByUserId(userId);
        Set<String> menuSet = new HashSet<>();
        for (SysMenuPO sysMenuPO : sysMenuList) {
            if (StringUtils.isNotBlank(sysMenuPO.getComponent())) {
                menuSet.add(sysMenuPO.getComponent());
            }
        }
        //菜单存储到redis 中
        redisUtils.set(CacheConstants.LOGIN_MENU_KEY+userId, JSONObject.toJSONString(menuSet),CacheConstants.EXPIRATION*CacheConstants.MILLIS_SECOND);
        LoginUserDTO loginUserDTO = new LoginUserDTO();
        loginUserDTO.setUserName(username);
        loginUserDTO.setUserId(userId);
        loginUserDTO.setRoles(roleSet);
        loginUserDTO.setDeptId(sysDept.getDeptId());
        loginUserDTO.setDeptName(sysDept.getDeptName());
        recordLogininfor(userId, Constants.LOGIN_SUCCESS, "登录成功");
        // 获取登录token
        return Result.success(createToken(loginUserDTO));
    }

    @Override
    public Result<?> logOut() {
        LoginUserDTO loginUserDTO = JSONObject.toJavaObject(JSONObject.parseObject(ServletUtils.getHeader(SecurityConstants.LOGIN_USER)), LoginUserDTO.class);
        if (loginUserDTO == null){
            return Result.reLogin("获取用户信息失败，请重新登录");
        }
        Long userId = loginUserDTO.getUserId();
        if (StringUtils.isNotEmpty(String.valueOf(userId))) {
            // 删除用户缓存记录
            redisUtils.delKey(CacheConstants.LOGIN_TOKEN_KEY+userId);
            // 记录用户退出日志
            recordLogininfor(userId, Constants.LOGOUT, "退出成功");
        }
        return Result.success();
    }


    /**
     * 创建令牌
     */
    public Map<String, Object> createToken(LoginUserDTO loginUserDTO) {
        String uuid = IdUtils.fastUUID();
        // Jwt存储信息
        Map<String, Object> claimsMap = new HashMap<>();
        claimsMap.put(SecurityConstants.USER_KEY, uuid);
        claimsMap.put(SecurityConstants.DETAILS_USER_ID, loginUserDTO.getUserId());
        claimsMap.put(SecurityConstants.DETAILS_USER_NAME, loginUserDTO.getUserName());
        String token = JwtUtils.createToken(claimsMap);
        Map<String, Object> rspMap = new HashMap<>();
        loginUserDTO.setIpaddr(IpUtils.getIpAddr(ServletUtils.getRequest()));
        loginUserDTO.setLoginTime(new Date());
        loginUserDTO.setToken(token);
        redisUtils.set(CacheConstants.LOGIN_TOKEN_KEY+loginUserDTO.getUserId(), JSONObject.toJSONString(loginUserDTO),CacheConstants.EXPIRATION*CacheConstants.MILLIS_SECOND);
        // 接口返回信息
        rspMap.put("accessToken", token);
        rspMap.put("expiresIn", CacheConstants.EXPIRATION*CacheConstants.MILLIS_SECOND);
        rspMap.put("uuid", uuid);
        return rspMap;
    }

    /**
     * 记录登录信息
     *
     * @param userId 用户id
     * @param status 状态
     * @param message 消息内容
     * @return
     */
    public void recordLogininfor(Long userId, String status, String message) {
        SysLoginLogPO loginLog = new SysLoginLogPO();
        loginLog.setUserId(userId);
        loginLog.setIpaddr(IpUtils.getIpAddr(ServletUtils.getRequest()));
        loginLog.setMsg(message);
        // 日志状态
        if (Constants.LOGIN_FAIL.equals(status)){
            loginLog.setStatus("1");
        }else {
            loginLog.setStatus("0");
        }
        loginLog.setAccessTime(new Date());
        loginLog.setCreateId(userId.intValue());
        loginLog.setUpdateId(userId.intValue());
        sysLoginLogMapper.insert(loginLog);
    }


}
