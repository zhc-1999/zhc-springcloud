package com.zhc.cloud.system.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhc.cloud.common.constant.CacheConstants;
import com.zhc.cloud.common.constant.Constants;
import com.zhc.cloud.common.constant.SecurityConstants;
import com.zhc.cloud.common.constant.UserConstants;
import com.zhc.cloud.common.enums.UserStatus;
import com.zhc.cloud.common.utils.*;
import com.zhc.cloud.common.utils.ip.IpUtils;
import com.zhc.cloud.mybatis.base.BaseEntity;
import com.zhc.cloud.redis.utils.RedisUtils;
import com.zhc.cloud.system.common.dto.*;
import com.zhc.cloud.system.common.entity.LoginVO;
import com.zhc.cloud.system.common.entity.SysUserVO;
import com.zhc.cloud.system.domain.mapper.*;
import com.zhc.cloud.system.domain.mysql.*;
import com.zhc.cloud.system.service.ISysUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.zhc.cloud.common.result.Result;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.*;
import java.util.stream.Collectors;

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
    private SysUserMapper sysUserMapper;
    @Autowired
    private SysDeptMapper sysDeptMapper;
    @Autowired
    private SysLoginLogMapper sysLoginLogMapper;
    @Autowired
    private SysRoleMapper sysRoleMapper;
    @Autowired
    private SysMenuMapper sysMenuMapper;
    @Autowired
    private SysPostMapper sysPostMapper;
    @Autowired
    private RedisUtils redisUtils;
    @Autowired
    private SysUserPostMapper sysUserPostMapper;
    @Autowired
    private SysUserRoleMapper sysUserRoleMapper;

    /***
    * 查询列表
    * @return Result
    */
    @Override
    public Result<?> selectList(SysUserVO sysUserVO) {
        SecurityUtils.startDataScope();
        PageHelper.startPage(sysUserVO.getPageNum(), sysUserVO.getPageSize());
        SysUserDTO sysUserDTO = new SysUserDTO();
        BeanUtils.copyProperties(sysUserVO,sysUserDTO);
        List<SysUserPO> sysUserPOS = sysUserMapper.selectUserList(sysUserDTO);
        List<UserDTO> userDTOS = new ArrayList<>();
        for (SysUserPO sysUserPO : sysUserPOS) {
            UserDTO userDTO = new UserDTO();
            BeanUtils.copyProperties(sysUserPO,userDTO);
            SysDeptPO sysDeptPO = sysDeptMapper.selectById(sysUserPO.getDeptId());
            userDTO.setDeptName(sysDeptPO.getDeptName());
            userDTO.setPhone(SensitiveInfoUtils.mobilePhone(userDTO.getPhone()));
            userDTOS.add(userDTO);
        }
        PageInfo<UserDTO> pageInfo = new PageInfo<>(userDTOS);
        return Result.success(pageInfo);
    }
    /***
    * 查询单个
    * @return Result
    */
    @Override
    public Result<SysUserPO> selectOne(SysUserPO sysUserPO) {
        LambdaQueryWrapper<SysUserPO> entityWrapper = new LambdaQueryWrapper<SysUserPO>();
        return Result.success(sysUserMapper.selectOne(entityWrapper));
    }
    /***
    * 根据id查询
    * @return Result
    */
    @Override
    public Result<SysUserPO> selectById(Integer id) {
        return Result.success(sysUserMapper.selectById(id));
    }

    /**
     * 登录接口
     * @param loginVO
     * @return Result
     */
    @Override
    public Result<?> login(LoginVO loginVO) {
        String username = loginVO.getUsername();
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
        SysUserPO sysUser = sysUserMapper.selectOne(userLambdaQueryWrapper);
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
        List<SysRolePO> sysRoleList = sysRoleMapper.selectRoleList(userId);
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
        Set<SysMenuDTO> menuDTOSet = new HashSet();
        for (SysMenuPO sysMenuPO : sysMenuList) {
            SysMenuDTO menuDTO = new SysMenuDTO();
            BeanUtils.copyProperties(sysMenuPO,menuDTO);
            menuDTOSet.add(menuDTO);
            if (StringUtils.isNotBlank(sysMenuPO.getPath())) {
                menuSet.add(sysMenuPO.getPath());
            }
        }
        //菜单存储到redis 中
        redisUtils.set(CacheConstants.LOGIN_MENU_KEY+userId, JSONObject.toJSONString(menuSet),CacheConstants.EXPIRATION*CacheConstants.MILLIS_SECOND);
        LoginUserDTO loginUserDTO = new LoginUserDTO();
        loginUserDTO.setUserName(username);
        loginUserDTO.setUserId(userId);
        loginUserDTO.setRoles(roleSet);
        loginUserDTO.setMenus(menuDTOSet);
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

    @Override
    public Result<?> getInfo() {
        LoginUserDTO loginUserDTO = JSONObject.toJavaObject(JSONObject.parseObject(ServletUtils.getHeader(SecurityConstants.LOGIN_USER)), LoginUserDTO.class);
        if (loginUserDTO == null){
            return Result.reLogin("获取用户信息失败，请重新登录");
        }
        Long userId = loginUserDTO.getUserId();
        Object o = redisUtils.get(CacheConstants.LOGIN_TOKEN_KEY + userId);
        LoginUserDTO loginUser = JSONObject.parseObject(o.toString(), LoginUserDTO.class);
        loginUser.setToken(null);
        Set<SysMenuDTO> menus = loginUser.getMenus();
        List<String> menuList = new ArrayList<>();
        for (SysMenuDTO menu : menus) {
            menuList.add(menu.getPerms());
        }
        Set<SysRoleDTO> roles = loginUser.getRoles();
        List<String> roleList = new ArrayList<>();
        for (SysRoleDTO role : roles) {
            roleList.add(role.getRoleKey());
        }
        JSONObject jsonObject = JSONObject.parseObject(o.toString());
        jsonObject.put("menuList",menuList);
        jsonObject.put("roleList",roleList);
        return Result.success(jsonObject);
    }

    @Override
    public Result<?> getInfo(Long userId) {
        Map<String, Object> map = new HashMap<>();
        List<SysRolePO> sysRoleList =null;
        if(SecurityUtils.isAdmin()){
            sysRoleList= sysRoleMapper.selectRoleList(null);
        }else {
            sysRoleList = sysRoleMapper.selectRoleList(Long.valueOf(SecurityUtils.getUserId()));
        }
        if (userId !=null && userId != 0) {
            SysUserPO sysUser = sysUserMapper.selectById(userId);
            map = JSON.parseObject(JSON.toJSONString(sysUser), Map.class);
            map.put("postIds", sysPostMapper.selectPostListByUserId(userId).stream().map(SysPostPO::getPostId).collect(Collectors.toList()));
            map.put("roleIds", sysRoleMapper.selectRoleList(userId).stream().map(SysRolePO::getRoleId).collect(Collectors.toList()));
        }
        map.put("roles", sysRoleList);
        map.put("posts", sysPostMapper.selectList(new LambdaQueryWrapper<>()));
        return Result.success(map);
    }

    @Override
    public Result<?> insertOrEdit(SysUserVO user) {
        Long userId = user.getUserId();
        if (userId== null || userId == 0) {
            if (StringUtils.isEmpty(user.getUserName()) || sysUserMapper.selectCount(new LambdaQueryWrapper<SysUserPO>().eq(SysUserPO::getUserName, user.getUserName())) > 0) {
                return Result.failed("新增用户'" + user.getUserName() + "'失败，登录账号已存在");
            } else if (StringUtils.isEmpty(user.getPhone()) || sysUserMapper.selectCount(new LambdaQueryWrapper<SysUserPO>().eq(SysUserPO::getPhone, user.getPhone())) > 0) {
                return Result.failed("新增用户'" + user.getUserName() + "'失败，手机号码已存在");
            } else if (StringUtils.isEmpty(user.getEmail()) || sysUserMapper.selectCount(new LambdaQueryWrapper<SysUserPO>().eq(SysUserPO::getEmail, user.getEmail())) > 0) {
                return Result.failed("新增用户'" + user.getUserName() + "'失败，邮箱账号已存在");
            }
            SysUserPO sysUserPO = new SysUserPO();
            BeanUtils.copyProperties(user, sysUserPO);
            sysUserPO.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
            int insert = sysUserMapper.insert(sysUserPO);
            if (insert > 0) {
                user.setUserId(sysUserPO.getUserId());
                insertUserPost(user);
                insertUserRole(user);
                return Result.success(insert);
            }
        }else {
            if (StringUtils.isEmpty(user.getPhone()) || sysUserMapper.selectCount(new LambdaQueryWrapper<SysUserPO>().eq(SysUserPO::getPhone, user.getPhone()).ne(SysUserPO::getUserId,userId)) > 0) {
                return Result.failed("修改用户'" + user.getUserName() + "'失败，手机号码已存在");
            } else if (StringUtils.isEmpty(user.getEmail()) || sysUserMapper.selectCount(new LambdaQueryWrapper<SysUserPO>().eq(SysUserPO::getEmail, user.getEmail()).ne(SysUserPO::getUserId,userId)) > 0) {
                return Result.failed("修改用户'" + user.getUserName() + "'失败，邮箱账号已存在");
            }
            SysUserPO sysUserPO = sysUserMapper.selectById(userId);
            BeanUtils.copyProperties(user, sysUserPO);
            if (sysUserPO == null){
                return Result.failed("修改用户'" + user.getUserName() + "'失败，用戶不存在");
            }
            // 删除用户与角色关联
            sysUserRoleMapper.delete(new LambdaQueryWrapper<SysUserRolePO>().eq(SysUserRolePO::getUserId,userId));
            // 新增用户与角色管理
            insertUserRole(user);
            // 删除用户与岗位关联
            sysUserPostMapper.delete(new LambdaQueryWrapper<SysUserPostPO>().eq(SysUserPostPO::getUserId,userId));
            // 新增用户与岗位管理
            insertUserPost(user);
            return Result.success(sysUserMapper.updateById(sysUserPO));
        }
        return Result.failed();
    }

    @Override
    public Result<?> delete(Long[] userIds) {
        if (ArrayUtils.contains(userIds, SecurityUtils.getUserId())) {
            return Result.failed("当前用户不能删除");
        }
        // 删除用户与角色关联
        for (Long userId : userIds) {
            sysUserRoleMapper.delete(new LambdaQueryWrapper<SysUserRolePO>().in(SysUserRolePO::getUserId,userId));
            // 删除用户与岗位关联
            sysUserPostMapper.delete(new LambdaQueryWrapper<SysUserPostPO>().in(SysUserPostPO::getUserId,userId));
        }
        sysUserMapper.deleteBatchIds(Arrays.asList(userIds));
        return Result.success();
    }

    @Override
    public void export(HttpServletResponse response, SysUserVO user) {
        SecurityUtils.startDataScope();
        SysUserDTO sysUserDTO = new SysUserDTO();
        BeanUtils.copyProperties(user,sysUserDTO);
        List<SysUserPO> sysUserPOS = sysUserMapper.selectUserList(sysUserDTO);
        List<UserDTO> userDTOS = new ArrayList<>();
        for (SysUserPO sysUserPO : sysUserPOS) {
            UserDTO userDTO = new UserDTO();
            BeanUtils.copyProperties(sysUserPO,userDTO);
            SysDeptPO sysDeptPO = sysDeptMapper.selectById(sysUserPO.getDeptId());
            switch (sysUserPO.getSex()) {
                case "0":
                    userDTO.setSex("男");
                    break;
                case "1":
                    userDTO.setSex("女");
                    break;
                default:
                    userDTO.setSex("未知");
            }
            if ("0".equals(sysUserPO.getStatus())) {
                userDTO.setStatus("正常");
            } else {
                userDTO.setStatus("停用");
            }
            userDTO.setDeptName(sysDeptPO.getDeptName());
            userDTO.setPhone(SensitiveInfoUtils.mobilePhone(userDTO.getPhone()));
            userDTOS.add(userDTO);
        }
        try {
            // 通过工具类创建writer，默认创建xls格式
            ExcelWriter writer = ExcelUtil.getWriter();
            //自定义标题别名
            writer.addHeaderAlias("userId", "用户ID");
            writer.addHeaderAlias("deptName", "组织名称");
            writer.addHeaderAlias("userName", "用户账号");
            writer.addHeaderAlias("nickName", "用户昵称");
            writer.addHeaderAlias("email", "用户邮箱");
            writer.addHeaderAlias("phone", "手机号码");
            writer.addHeaderAlias("sex", "用户性别");
            writer.addHeaderAlias("status", "帐号状态");
            writer.addHeaderAlias("createTime", "创建时间");
            //只导出设置别名的字段
            writer.setOnlyAlias(true);
            // 一次性写出内容，使用默认样式，强制输出标题
            writer.write(userDTOS, true);
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setCharacterEncoding("utf-8");
            ServletOutputStream out=response.getOutputStream();

            writer.flush(out, true);
            writer.close();
            IoUtil.close(out);
        }catch(Exception e){
            log.error("导出异常",e);
        }
    }

    @Override
    public Result<?> resetPwd(SysUserVO user) {
        SysUserPO sysUserPO = sysUserMapper.selectById(user.getUserId());
        if (sysUserPO == null) {
            return Result.failed("用户不存在");
        }
        sysUserPO.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
        int i = sysUserMapper.updateById(sysUserPO);
        return Result.success(i);
    }

    /**
     * 新增用户岗位信息
     *
     * @param user 用户对象
     */
    private void insertUserPost(SysUserVO user) {
        Long[] posts = user.getPostIds();
        if (posts.length>0) {
            // 新增用户与岗位管理
            for (Long postId : posts) {
                SysUserPostPO up = new SysUserPostPO();
                up.setUserId(user.getUserId());
                up.setPostId(postId);
                sysUserPostMapper.insert(up);
            }
        }
    }
    /**
     * 新增用户角色信息
     *
     * @param user 用户对象
     */
    public void insertUserRole(SysUserVO user) {
        Long[] roles = user.getRoleIds();
        if (roles.length>0) {
            // 新增用户与角色管理
            for (Long roleId : roles) {
                SysUserRolePO ur = new SysUserRolePO();
                ur.setUserId(user.getUserId());
                ur.setRoleId(roleId);
                sysUserRoleMapper.insert(ur);
            }
        }
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
        sysLoginLogMapper.insert(loginLog);
    }


}
