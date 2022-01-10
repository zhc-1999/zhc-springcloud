package com.zhc.cloud.discovery.service.adapter;

import com.nepxion.discovery.common.constant.DiscoveryConstant;
import com.nepxion.discovery.plugin.strategy.adapter.DefaultStrategyTracerAdapter;
import org.apache.commons.lang3.StringUtils;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author zhc
 * @description MyStrategyTracerAdapter
 * @date 2022-01-08 00:34
 */
// 自定义调用链上下文参数的创建
// 对于getTraceId和getSpanId方法，在OpenTracing等调用链中间件引入的情况下，由调用链中间件决定，在这里定义不会起作用；在OpenTracing等调用链中间件未引入的情况下，在这里定义才有效，下面代码中表示从Http Header中获取，并全链路传递
// 对于getCustomizationMap方法，表示输出到调用链中的定制化业务参数，可以同时输出到日志和OpenTracing等调用链中间件，下面代码中表示从Http Header中获取，并全链路传递
public class MyStrategyTracerAdapter extends DefaultStrategyTracerAdapter {
    @Override
    public String getTraceId() {
        return StringUtils.isNotEmpty(strategyContextHolder.getHeader(DiscoveryConstant.TRACE_ID)) ? strategyContextHolder.getHeader(DiscoveryConstant.TRACE_ID) : StringUtils.EMPTY;
    }

    @Override
    public String getSpanId() {
        return StringUtils.isNotEmpty(strategyContextHolder.getHeader(DiscoveryConstant.SPAN_ID)) ? strategyContextHolder.getHeader(DiscoveryConstant.SPAN_ID) : StringUtils.EMPTY;
    }

    @Override
    public Map<String, String> getCustomizationMap() {
        Map<String, String> customizationMap = new LinkedHashMap<String, String>();
        customizationMap.put("user-id", StringUtils.isNotEmpty(strategyContextHolder.getHeader("user-id")) ? strategyContextHolder.getHeader("user-id") : StringUtils.EMPTY);
        customizationMap.put("user-name", StringUtils.isNotEmpty(strategyContextHolder.getHeader("user-name")) ? strategyContextHolder.getHeader("user-name") : StringUtils.EMPTY);
        return customizationMap;
    }
}

