package com.zhc.cloud.common.constant;

/**
 * @author zhc
 * @description 缓存key常量
 * @date 2022-01-28 16:20
 */
public class CacheConstants {


    public final static long MILLIS_SECOND = 1000;

    public final static long MILLIS_MINUTE = 60;

    /**
     * 缓存有效期，默认720（分钟）
     */
    public final static long EXPIRATION = 720 * MILLIS_MINUTE;

    /**
     * 缓存刷新时间，默认120（分钟）
     */
    public final static long REFRESH_TIME = 120;


    /**
     * 权限缓存前缀
     */
    public final static String LOGIN_TOKEN_KEY = "login_tokens:";
    /**
     * 菜单缓存前缀
     */
    public final static String LOGIN_MENU_KEY = "login_menus:";
}
