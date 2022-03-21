package com.zhc.cloud.common.utils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.zhc.cloud.common.constant.SecurityConstants;

/**
 * @author zhc
 * @description SecurityUtils
 * @date 2022-02-21 14:05
 */
public class SecurityUtils {

    protected static final ThreadLocal<String> threadLocal = new ThreadLocal();
    /**
     * 设置权限标识
     */
    public static void setDataScope(){
        threadLocal.set(SecurityConstants.DATA_SCOPE);
    }
    /**
     * 获取权限标识 并清除
     */
    public static String getDataScope(){
        String s = threadLocal.get();
        threadLocal.remove();
        return s;
    }
    /**
     * 获取用户ID
     */
    public static String getUserId(){
        return ServletUtils.getHeader(SecurityConstants.DETAILS_USER_ID);
    }
    /**
     * 获取用户名称
     */
    public static String getUsername() {
        return ServletUtils.getHeader(SecurityConstants.DETAILS_USER_NAME);
    }
    /**
     * 获取组织机构deptId
     */
    public static String getDeptId() {
        return ServletUtils.getHeader(SecurityConstants.DETAILS_DEPT_ID);
    }

    /**
     * 获取登录用户信息
     */
    public static JSONObject getLoginUser() {
        String loginUser = ServletUtils.getHeader(SecurityConstants.LOGIN_USER);
        return JSONObject.parseObject(loginUser);
    }

    /**
     * 获取登录用户信息
     */
    public static Boolean isAdmin() {
        String loginUser = ServletUtils.getHeader(SecurityConstants.LOGIN_USER);
        JSONObject jsonObject = JSONObject.parseObject(loginUser);
        JSONArray roles = jsonObject.getJSONArray("roles");
        for (Object role : roles) {
            JSONObject roleJson = JSONObject.parseObject(role.toString());
            String roleKey = roleJson.getString("roleKey");
            if (roleKey.equals("admin")){
                return true;
            }
        }
        return false;
    }


}
