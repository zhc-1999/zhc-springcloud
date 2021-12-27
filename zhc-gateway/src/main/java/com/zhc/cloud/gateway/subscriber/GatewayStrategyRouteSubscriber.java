//package com.zhc.cloud.gateway.subscriber;
//
//import com.google.common.eventbus.Subscribe;
//import com.nepxion.discovery.plugin.strategy.gateway.event.GatewayStrategyRouteAddedEvent;
//import com.nepxion.discovery.plugin.strategy.gateway.event.GatewayStrategyRouteDeletedEvent;
//import com.nepxion.discovery.plugin.strategy.gateway.event.GatewayStrategyRouteModifiedEvent;
//import com.nepxion.discovery.plugin.strategy.gateway.event.GatewayStrategyRouteUpdatedAllEvent;
//import com.nepxion.eventbus.annotation.EventBus;
//
//
///**
// * @author zhc
// */
//@EventBus
//public class GatewayStrategyRouteSubscriber {
//
//    @Subscribe
//    public void onGatewayStrategyRouteAdded(GatewayStrategyRouteAddedEvent gatewayStrategyRouteAddedEvent) {
//        System.out.println("增加网关路由=" + gatewayStrategyRouteAddedEvent.getGatewayStrategyRouteEntity());
//    }
//
//    @Subscribe
//    public void onGatewayStrategyRouteModified(GatewayStrategyRouteModifiedEvent gatewayStrategyRouteModifiedEvent) {
//        System.out.println("修改网关路由=" + gatewayStrategyRouteModifiedEvent.getGatewayStrategyRouteEntity());
//    }
//
//    @Subscribe
//    public void onGatewayStrategyRouteDeleted(GatewayStrategyRouteDeletedEvent gatewayStrategyRouteDeletedEvent) {
//        System.out.println("删除网关路由=" + gatewayStrategyRouteDeletedEvent.getRouteId());
//    }
//
//    @Subscribe
//    public void onGatewayStrategyRouteUpdatedAll(GatewayStrategyRouteUpdatedAllEvent gatewayStrategyRouteUpdatedAllEvent) {
//        System.out.println("更新全部网关路由=" + gatewayStrategyRouteUpdatedAllEvent.getGatewayStrategyRouteEntityList());
//    }
//}
