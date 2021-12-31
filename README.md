# springcloud

## 1. 项目介绍
spring Cloud alibaba项目搭建，无具体业务。

## 2. 项目总体架构图
![](resources/Springcloud技术架构.png)

## 3. 功能介绍
* **分布式系统基础支撑**
    * nacos配置中心
    * nacos注册中心
    * 全链路蓝绿灰度发布容灾: discovery
    * 网关动态路由: discovery
    * 服务调用：openfeign
    * 服务熔断和降级：Hystrix
    * spring-cloud
    * spring-cloud-alibaba
    * API网关：spring-cloud-alibaba-gateway
    * 持久层：mybits-plus
    * nosql：redis
    * 分布式锁：redisson
    * 分布式事务：seata

## 4. 模块说明
```lua
springcloud -- 父项目，公共依赖
│  ├─zhc-business -- 业务模块
│  │  ├─zhc-business-api -- 接口
│  │  ├─zhc-business-domain -- 数据库操作
│  │  ├─zhc-business-service -- 业务层
│  │  ├─zhc-business-start -- 启动类
│  │  ├─zhc-business-web -- 接口入口 conteoller
│  ├─zhc-system -- system模块
│  │  ├─zhc-system-api -- 接口
│  │  ├─zhc-system-domain -- 数据库操作
│  │  ├─zhc-system-service -- 业务层
│  │  ├─zhc-system-start -- 启动类
│  │  ├─zhc-system-web -- 接口入口 conteoller
│  ├─zhc-gateway -- api网关工程
│  ├─zhc-common -- 通用依赖
│  ├─zhc-boot-starters -- 封装的starter
│  │  ├─zhc-spring-boot-starter -- springboot starter
│  │  ├─zhc-db-nacos-mybatis-plus-starter -- 封装数据库通用操作逻辑（可用nacos动态修改数据库连接账号密码等）
│  │  ├─zhc-nacos-spring-boot-starter -- naocs springboot
│  │  ├─zhc-nacos-spring-cloud-starter -- naocs springcloud
│  │  ├─zhc-discovery-gateway-spring-cloud-starter -- 封装gatewa discovery （网关蓝绿灰度发布）
│  │  ├─zhc-sentinel-gateway-spring-cloud-starter -- 封装gatewa sentinel （网关流量控制、熔断降级）
│  │  ├─zhc-discovery-service-spring-cloud-starter -- 封装service discovery （服务蓝绿灰度发布）
│  │  ├─zhc-sentinel-service-spring-cloud-starter -- 封装service sentinel（服务流量控制、熔断降级）
│  │  ├─zhc-redis-nacos-spring-boot-starter -- 封装redis通用操作逻辑（可用nacos动态修改redis连接账号密码等）
│  │  ├─zhc-feign-spring-cloud-starter -- 封装fegin通用操作逻辑
```