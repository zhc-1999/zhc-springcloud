package com.zhc.cloud.common.result;

import lombok.*;


/**
 * @author zhc
 * @Title: WxSendJob
 * @description: 自定义统一响应体
 * VO（ View Object）：显示层对象，通常是Web向模板渲染引擎层传输的对象。
 * @date 2021/10/0101:15
 */
@Data
@NoArgsConstructor
@ToString
public class Result<T> {
    /**
     * 状态码，比如1000代表响应成功
     */
    private Integer code;
    /**
     * 响应信息，用来说明响应情况
     */
    private String msg;
    /**
     * 响应的具体数据
     */
    private T data;

    private Long timestamp;

    public static <R> Result<R> success() {
        return new Result<R>(ResultCode.SUCCESS);
    }

    public static <R> Result<R> success(R data) {
        return new Result<>(ResultCode.SUCCESS, "success", data);
    }
    public static <R> Result<R> success(ResultCode resultCode,R data) {
        return new Result<>(resultCode, resultCode.getMsg(), data);
    }
    public static <R> Result<R> failed() {
        return new Result<>(ResultCode.FAILED);
    }
    public static <R> Result<R> failed(String error) {
        return new Result<>(ResultCode.FAILED, error);
    }

    public static <R> Result<R> failed(ResultCode resultCode,String error) {
        return new Result<>(resultCode, error);
    }

    public Result(T data) {
        this(ResultCode.SUCCESS, data);
        timestamp = System.currentTimeMillis();
    }
    public Result(ResultCode resultCode) {
        this.code = resultCode.getCode();
        this.msg = resultCode.getMsg();
        timestamp = System.currentTimeMillis();
    }
    public Result(ResultCode resultCode, T data) {
        this.code = resultCode.getCode();
        this.msg = resultCode.getMsg();
        this.data = data;
        timestamp = System.currentTimeMillis();
    }

    public Result(ResultCode resultCode, String message) {
        this.code = resultCode.getCode();
        this.msg = message;
        timestamp = System.currentTimeMillis();
    }

    public Result(ResultCode resultCode, String message, T data) {
        this.code = resultCode.getCode();
        this.msg = message;
        timestamp = System.currentTimeMillis();
        this.data = data;
    }


}
