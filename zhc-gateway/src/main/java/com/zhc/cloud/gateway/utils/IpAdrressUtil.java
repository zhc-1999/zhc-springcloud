package com.zhc.cloud.gateway.utils;

import org.apache.commons.lang.StringUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.server.reactive.ServerHttpRequest;

/**
 * @author zhc
 * @Title: IpAdrressUtil
 * @date 2021/11/3 16:53
 * @notes 获取真实IP
 */
public class IpAdrressUtil {

    private static String UN_KNOWN = "unKnown";

    public static String getIpAdrress(ServerHttpRequest request) {
        HttpHeaders headers = request.getHeaders();
        String xIp = headers.getFirst("X-Real-IP");
        String xFor = headers.getFirst("X-Forwarded-For");
        //多次反向代理后会有多个ip值，第一个ip才是真实ip
        if (StringUtils.isNotEmpty(xFor) && !UN_KNOWN.equalsIgnoreCase(xFor)) {
            int index = xFor.indexOf(",");
            if (index != -1) {
                return xFor.substring(0, index);
            } else {
                return xFor;
            }
        }
        xFor = xIp;
        if (StringUtils.isNotEmpty(xFor) && !UN_KNOWN.equalsIgnoreCase(xFor)) {
            return xFor;
        }
        if (StringUtils.isEmpty(xFor) || UN_KNOWN.equalsIgnoreCase(xFor)) {
            xFor = headers.getFirst("Proxy-Client-IP");
        }
        if (StringUtils.isEmpty(xFor) || UN_KNOWN.equalsIgnoreCase(xFor)) {
            xFor = headers.getFirst("WL-Proxy-Client-IP");
        }
        if (StringUtils.isEmpty(xFor) || UN_KNOWN.equalsIgnoreCase(xFor)) {
            xFor = headers.getFirst("HTTP_CLIENT_IP");
        }
        if (StringUtils.isEmpty(xFor) || UN_KNOWN.equalsIgnoreCase(xFor)) {
            xFor = headers.getFirst("HTTP_X_FORWARDED_FOR");
        }
        if (StringUtils.isEmpty(xFor) || UN_KNOWN.equalsIgnoreCase(xFor)) {
            xFor = request.getRemoteAddress() == null ? null : request.getRemoteAddress().toString();
        }
        return xFor;
    }
}
