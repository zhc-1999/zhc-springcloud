package com.zhc.cloud.gateway.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.web.ErrorProperties;
import org.springframework.boot.autoconfigure.web.ResourceProperties;
import org.springframework.boot.autoconfigure.web.reactive.error.DefaultErrorWebExceptionHandler;
import org.springframework.boot.web.error.ErrorAttributeOptions;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpStatus;

import org.springframework.web.reactive.function.server.*;
import org.springframework.boot.web.reactive.error.ErrorAttributes;

import java.util.HashMap;
import java.util.Map;

/**
 * 自定义异常errorWebExceptionHandler的配置类, 使用我们自定义的JsonExceptionHandler处理异常
 * @author zhc
 */
@Slf4j
public class JsonExceptionHandler extends DefaultErrorWebExceptionHandler {

    public JsonExceptionHandler(ErrorAttributes errorAttributes, ResourceProperties resourceProperties, ErrorProperties errorProperties, ApplicationContext applicationContext) {
        super(errorAttributes, resourceProperties, errorProperties, applicationContext);
    }

    /**
     * 获取异常属性
     */
    @Override
    protected Map<String, Object> getErrorAttributes(ServerRequest request, ErrorAttributeOptions options) {
        int code = HttpStatus.INTERNAL_SERVER_ERROR.value();
        Throwable error = super.getError(request);
        String message;
        // 用于error级别记录日志，方便排查问题
        message = this.buildMessage(request, error);
        if (error instanceof org.springframework.cloud.gateway.support.NotFoundException) {
            code = HttpStatus.NOT_FOUND.value();
            message = "服务未找到";
        }
        // 判断是否是权限校验异常
        if (error instanceof com.zhc.cloud.gateway.exception.UnAuthorizationException) {
            code = HttpStatus.UNAUTHORIZED.value();
            message = "未授权访问";
        }
        // 判断是否触发限流异常
        if (error instanceof com.alibaba.csp.sentinel.slots.block.flow.FlowException) {
            code = 409;
            message = "触发限流";
        }
        return response(code, message);
    }


    /**
     * 指定响应处理方法为JSON处理的方法
     *
     * @param errorAttributes
     */
    @Override
    protected RouterFunction<ServerResponse> getRoutingFunction(ErrorAttributes errorAttributes) {
        return RouterFunctions.route(RequestPredicates.all(), this::renderErrorResponse);
    }


    /**
     * 构建异常信息
     *
     * @param request
     * @param ex
     * @return
     */
    private String buildMessage(ServerRequest request, Throwable ex) {
        StringBuilder message = new StringBuilder("Failed to handle request [");
        message.append(request.methodName());
        message.append(" ");
        message.append(request.uri());
        message.append("]");
        if (ex != null) {
            message.append(": ");
            message.append(ex.getMessage());
        }
        return message.toString();
    }


    /**
     * 构建返回的JSON数据格式
     *
     * @param status       状态码
     * @param errorMessage 异常信息
     * @return
     */
    public static Map<String, Object> response(int status, String errorMessage) {
        Map<String, Object> map = new HashMap<>();
        map.put("code", status);
        // 设置抛异常一直status为0
        map.put("status", 0);
        map.put("message", errorMessage);
        log.error("异常返回 {}", map);
        return map;
    }

}
