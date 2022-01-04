package com.zhc.cloud.gateway.utils;

import com.alibaba.fastjson.JSON;
import com.zhc.cloud.common.result.Result;
import com.zhc.cloud.common.result.ResultCode;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.http.server.reactive.ServerHttpResponse;
import reactor.core.publisher.Mono;

/**
 * @author zhc
 * @Title: ResponseUtil
 * @ProjectName springcloud
 * @Description: TODO
 * @date 2022/01/0422:36
 */
public class ResponseUtil {


    public static Mono<Void> failed(ServerHttpResponse response, Result result) {
        String resp = JSON.toJSONString(result);
        DataBuffer bodyDataBuffer = response.bufferFactory().wrap(resp.getBytes());
        response.getHeaders().add("Content-Type", "application/json;charset=UTF-8");
        return response.writeWith(Mono.just(bodyDataBuffer));
    }

    public static Mono<Void> failed(ServerHttpResponse response, ResultCode resultCode ,String msg) {
        Result resultVo = Result.failed(resultCode, msg);
        String resp = JSON.toJSONString(resultVo);
        DataBuffer bodyDataBuffer = response.bufferFactory().wrap(resp.getBytes());
        response.getHeaders().add("Content-Type", "application/json;charset=UTF-8");
        return response.writeWith(Mono.just(bodyDataBuffer));
    }

    public static Mono<Void> success(ServerHttpResponse response) {
        Result resultVo = Result.success();
        String resp = JSON.toJSONString(resultVo);
        DataBuffer bodyDataBuffer = response.bufferFactory().wrap(resp.getBytes());
        response.getHeaders().add("Content-Type", "application/json;charset=UTF-8");
        return response.writeWith(Mono.just(bodyDataBuffer));
    }
}
