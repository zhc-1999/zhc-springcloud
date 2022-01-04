package com.zhc.cloud.common.result;

import lombok.Getter;


/**
 * @author zhc
 * @Title: WxSendJob
 * @ProjectName WeiXinMsg-master
 * @description: 响应码枚举
 * @date 2021/10/0101:15
 */
@Getter
public enum ResultCode {

    //200系列通用错误
    SUCCESS(200, "操作成功"),
    FAILED(201, "接口错误"),
    VALIDATE_FAILED(202, "参数校验失败"),
    ERROR(203, "未知错误");



    private int code;
    private String msg;

    ResultCode(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
