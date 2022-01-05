**目录**

[Spring Cloud Alibaba（一） 简介](https://juejin.cn/post/7044168709535399944)

[Spring Cloud Alibaba（二） 环境搭建及nacos注册中心配置中心](https://juejin.cn/post/7047314936606752798)

# Spring Cloud Alibaba（三） 搭建API网关 gateway动态路由


## 什么是Gateway
Spring Cloud Gateway是Spring Cloud官方推出的第二代网关框架，取代Zuul 网关。网关作为流量的，在微服务系统中有着非常作用。据说性能是第一代网关 zuul的1.5倍。(基于Netty,WebFlux)。

## 网关作用:
网关是整个微服务API请求的入口，负责拦截所有请求，分发到服务上去。可以实现日志拦截、权限控制、解决跨域问题、限流、熔断、负载均衡，隐藏服务端的ip，黑名单与白名单拦截、授权等

## 一、搭建gateway项目

准备工作

参考 [Spring Cloud Alibaba（二） 环境搭建及nacos注册中心配置中心](https://juejin.cn/post/7047314936606752798) 启动 Nacos 和一个 zhc-system 服务。

1.  **引依赖**
```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <artifactId>springcloud</artifactId>
        <groupId>com.zhc.cloud</groupId>
        <version>0.0.1-SNAPSHOT</version>
    </parent>
    <modelVersion>4.0.0</modelVersion>
    <artifactId>zhc-gateway</artifactId>
    <properties>
        <maven.compiler.source>8</maven.compiler.source>
        <maven.compiler.target>8</maven.compiler.target>
    </properties>
    <dependencies>
        <dependency>
            <groupId>com.zhc.cloud</groupId>
            <artifactId>zhc-common</artifactId>
            <version>0.0.1-SNAPSHOT</version>
        </dependency>
        <!--gateway-->
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-gateway</artifactId>
            <version>2.2.6.RELEASE</version>
        </dependency>
        <!--nacos-->
        <dependency>
            <groupId>com.alibaba.cloud</groupId>
            <artifactId>spring-cloud-starter-alibaba-nacos-config</artifactId>
            <version>2.2.6.RELEASE</version>
        </dependency>
        <dependency>
            <groupId>com.alibaba.cloud</groupId>
            <artifactId>spring-cloud-starter-alibaba-nacos-discovery</artifactId>
            <version>2.2.6.RELEASE</version>
        </dependency>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-bootstrap</artifactId>
            <version>3.1.0</version>
        </dependency>
    </dependencies>
</project>
```
2.  **写配置文件**
```
spring:
  # Cloud 配置
  cloud:
    nacos:
      # nacos discovery 配置
      discovery:
        #使用nacos的配置中心配置覆盖本地配置
        enabled: true
        #分組
        group: ZHC_GROUP
        #给服务添加一些标签，例如属于什么业务线，该元数据会持久化存储在服务端，但是客户端消费时不会获取到此值，默认为空
        metadata:
          env: env1
          group: ZHC_GROUP
          region: dev
          version: 1.0
          zone: zone1
        #命名空间ID
        namespace: ZHC_GROUP
        #账号
        username: nacos
        #密码
        password: nacos
        #该项目是否向注册中心注册服务，默认为true
        register-enabled: true
        #nacos地址
        server-addr: 127.0.0.1:8848
        #项目名称
        service: ZHC-GATEWAY-SERVICE
```

3.  **启动类**

```
@SpringBootApplication//SpringBoot
@EnableDiscoveryClient//能够让注册中心能够发现，扫描到该服务
@EnableConfigurationProperties//开启服务的注册
public class GatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(GatewayApplication.class, args);
    }
}
```

![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/a53fa47a8fd347538cad935c22b119ef~tplv-k3u1fbpfcp-watermark.image?)
看到gateway服务，这样最基础的网关已经搭建完成了。
## 二、配置Gateway路由

1. **修改配置文件**
```
spring:
  # Cloud 配置
  cloud:
    # gateway 网关配置
    gateway:
      routes:
        #配置路由： 路由id,路由到微服务的uri,断言（判断条件）
        - id: ZHC-SYSTEM-SERVICE #保持唯一
          uri: lb://ZHC-SYSTEM-SERVICE #目标为服务地址
          predicates:
            - Path=/zhc-system-service/** #设置路由断言,代理zhc-system-service
    nacos:
      # nacos discovery 配置
      discovery:
        #使用nacos的配置中心配置覆盖本地配置
        enabled: true
        #分組
        group: ZHC_GROUP
        #给服务添加一些标签，例如属于什么业务线，该元数据会持久化存储在服务端，但是客户端消费时不会获取到此值，默认为空
        metadata:
          env: env1
          group: ZHC_GROUP
          region: dev
          version: 1.0
          zone: zone1
        #命名空间ID
        namespace: ZHC_GROUP
        #账号
        username: nacos
        #密码
        password: nacos
        #该项目是否向注册中心注册服务，默认为true
        register-enabled: true
        #nacos地址
        server-addr: 127.0.0.1:8848
        #项目名称
        service: ZHC-GATEWAY-SERVICE
```
在上面的配置中：

id：id注意不要重复，最好为项目名称，例如id: ZHC-SYSTEM-SERVICE

uri: 配置路由uri，lb://ZHC-SYSTEM-SERVICE 前代表路由的服务，lb://为固定写法，表示开启负载均衡。ZHC-SYSTEM-SERVICE即服务在Nacos中注册的名字。同时也可以是一个url，例如http://127.0.0.1:7001

![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/72183983891e42c281b7262a882c8a8d~tplv-k3u1fbpfcp-watermark.image?)

predicates: - Path=/zhc-system-service/** 使用"Path Route Predicate Factory"，规则为 /zhc-system-service 开头的任意URI

2. **启动应用并测试**

![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/e885f7a011e8446eb6d5d3833900c67a~tplv-k3u1fbpfcp-watermark.image?)
![image.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/c5db61acfbd94da4a01f17ba4143bd09~tplv-k3u1fbpfcp-watermark.image?)
可以看出多次请求被平均分配到两个实例上。

除了Path Route Predicate Factory，Gateway还支持多种设置方式，就不多说了，自己看一下吧：

| 类型 | 示例 |
| --- | --- |
|After	|After=2017-01-20T17:42:47.789-07:00[America/Denver]|
|Before|	Before=2017-01-20T17:42:47.789-07:00[America/Denver]|
|Between|	2017-01-20T17:42:47.789-07:00[America/Denver], 2017-01-21T17:42:47.789-07:00[America/Denver]|
|Cookie	|Cookie=chocolate, ch.p|
|Header|	Header=X-Request-Id, \d+|
|Host|	Host=**.somehost.org|
|Method|	Method=GET|
|Path	|Path=/foo/{segment}|
|Query|	Query=baz|
|RemoteAddr|	RemoteAddr=192.168.1.1/24|

## 三、配置Gateway动态路由
这里使用**nepxion discovery**实现Gateway动态路由功能，后序会出使用**nepxion discovery**实现灰度发布
1.  **引依赖**
```
<!--Nepxion Discovery -->
<!-- 1.注册中心插件 -->
<dependency>
    <groupId>com.nepxion</groupId>
    <artifactId>discovery-plugin-register-center-starter-nacos</artifactId>
</dependency>
<!-- 2.配置中心插件 -->
<dependency>
    <groupId>com.nepxion</groupId>
    <artifactId>discovery-plugin-config-center-starter-nacos</artifactId>
</dependency>
<!-- 3.管理中心插件 -->
<dependency>
    <groupId>com.nepxion</groupId>
    <artifactId>discovery-plugin-admin-center-starter</artifactId>
</dependency>
<!-- 4.网关策略编排插件 -->
<dependency>
    <groupId>com.nepxion</groupId>
    <artifactId>discovery-plugin-strategy-starter-gateway</artifactId>
</dependency>
```
2.  **写配置文件**
```
spring:
  application:
    name: zhc-gateway
    strategy:
      # 网关策略
      gateway:
        # 开启和关闭网关订阅配置中心的动态路由策略。缺失则默认为false
        dynamic.route.enabled: true
  # Cloud 配置
  cloud:
    # gateway 网关配置
    gateway:
#      routes:
#        #配置路由： 路由id,路由到微服务的uri,断言（判断条件）
#        - id: ZHC-SYSTEM-SERVICE #保持唯一
#          uri: lb://ZHC-SYSTEM-SERVICE #目标为服务地址
#          predicates:
#            - Path=/zhc-system-service/** #设置路由断言,代理zhc-system-service
    nacos:
      # nacos discovery 配置
      discovery:
        enabled: true
        group: ZHC_GROUP
        metadata:
          env: env1
          group: ZHC_GROUP
          region: dev
          version: 1.0
          zone: zone1
        namespace: ZHC_GROUP
        username: nacos
        password: nacos
        register-enabled: true
        server-addr: 127.0.0.1:8848
        service: ZHC-GATEWAY-SERVICE
```
3. **在nacos中配置路由**
```
[
    {
        "id": "zhc-system-service",
        "uri": "[lb://ZHC-SYSTEM-SERVICE]()",
        "predicates": [
            "Path=/zhc-system-service/**"
        ],
        "filters": [
            "StripPrefix=1"
        ],
        "order": 0,
        "metadata": {}
    }
]
```
Group为{group}，DataId为{网关serviceId}-dynamic-route
![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/403027b96bd748dea2f6ac9ec876d135~tplv-k3u1fbpfcp-watermark.image?)
3. **启动应用并测试**

1. 启动zhc-system和zhc-business和zhc-gateway项目，然后调用zhc-system项目测试是否能调用

![image.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/5b9c5a773ce5448eb91c62e1ccbcc7e7~tplv-k3u1fbpfcp-watermark.image?)
测试可以通过且已经负载均衡
![image.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/5db17ab5ee594aaa83228e8319a5b4a2~tplv-k3u1fbpfcp-watermark.image?)
![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/0ff8100894a246db8b2b4525ab8e0527~tplv-k3u1fbpfcp-watermark.image?)
2. 在nacos中添加zhc-business项目的路由
   可以看到没有添加之前不能调用
   ![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/427d2edda64e4dbe8f1da82428309111~tplv-k3u1fbpfcp-watermark.image?)
   添加zhc-business项目的路由
   ![image.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/9deedd8482eb4b2dbcb0fab008cbbd87~tplv-k3u1fbpfcp-watermark.image?)
   可以看到这个日志后，路由添加成功

![image.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/7de099cc8e5443578d064065ba2da28f~tplv-k3u1fbpfcp-watermark.image?)

然后调用测试
![image.png](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/be537cb937d4422ca0ad473b4f2aeec6~tplv-k3u1fbpfcp-watermark.image?)
由此可以看到动态修改路由已成功

源代码：
[GitHub](https://github.com/zhc-1999/springcloud) 、[Gitee](https://gitee.com/zhhc88/springcloud)
（我是先搭建的项目，然后后补的文档。所以说项目和文档可能不太一样，有问题可以问我一下）