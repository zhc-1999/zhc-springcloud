package com.zhc.cloud.gateway.utils;

import java.security.MessageDigest;

/**
 * @date 2020/1/7.16:04
 * @Version 1.0
 */
public class Md5Util {

    private static final char[] HEX_DIGITS = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
    public static String md5Capital(String s) {
        try {
            byte[] strTemp = s.getBytes();
            MessageDigest mdTemp = MessageDigest.getInstance("MD5");
            mdTemp.update(strTemp);
            byte[] md = mdTemp.digest();
            int j = md.length;
            char[] str = new char[j * 2];
            int k = 0;
            for (byte b : md) {
                str[k++] = HEX_DIGITS[b >> 4 & 15];
                str[k++] = HEX_DIGITS[b & 15];
            }
            return new String(str);
        } catch (Exception var10) {
            return null;
        }
    }
}
