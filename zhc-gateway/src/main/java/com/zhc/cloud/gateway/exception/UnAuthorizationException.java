package com.zhc.cloud.gateway.exception;

/**
 * 自定义未授权异常
 * @author zhc
 */
public class UnAuthorizationException extends RuntimeException {

    private static final long serialVersionUID = 1L;
    private int code;
    private String msg;

    public String getMsg() {
        return this.msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCode() {
        return this.code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}
