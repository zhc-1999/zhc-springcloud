

# Spring Cloud Alibaba 简介

Spring Cloud Alibaba 致力于提供微服务开发的一站式解决方案。此项目包含开发分布式应用微服务的必需组件，方便开发者通过 Spring Cloud 编程模型轻松使用这些组件来开发分布式应用服务。

依托 Spring Cloud Alibaba ，您只需要添加一些注解和少量配置，就可以将 Spring Cloud 应用接入阿里微服务解决方案，通过阿里中间件来迅速搭建分布式应用系统。

阿里巴巴结合自身微服务实践，开源的微服务全家桶

在业界广泛使用，已有很多成功案例

# 主要功能

服务限流降级：默认支持 WebServlet、WebFlux， OpenFeign、RestTemplate、Spring Cloud Gateway，Zuul， Dubbo 和 RocketMQ 限流降级功能的接入，可以在运行时通过控制台实时修改限流降级规则，还支持查看限流降级 Metrics 监控。

服务注册与发现：适配 Spring Cloud 服务注册与发现标准，默认集成了 Ribbon 的支持。

分布式配置管理：支持分布式系统中的外部化配置，配置更改时自动刷新。

消息驱动能力：基于 Spring Cloud Stream 为微服务应用构建消息驱动能力。

分布式事务：使用 @GlobalTransactional 注解，高效并且对业务零侵入地解决分布式事务问题。

阿里云对象存储：阿里云提供的海量、安全、低成本、高可靠的云存储服务。支持在任何应用、任何时间、任何地点存储和访问任意类型的数据。

分布式任务调度：提供秒级、精准、高可靠、高可用的定时（基于 Cron 表达式）任务调度服务。同时提供分布式的任务执行模型，如网格任务。网格任务支持海量子任务均匀分配到所有 Worker（schedulerx-client）上执行。

阿里云短信服务：覆盖全球的短信服务，友好、高效、智能的互联化通讯能力，帮助企业迅速搭建客户触达通道。


# 组件

Sentinel ：把流量作为切入点，从流量控制、熔断降级、系统负载保护等多个维度保护服务的稳 定性。

Nacos ：一个更易于构建云原生应用的动态服务发现、配置管理和服务管理平台。

RocketMQ ：一款开源的分布式消息系统，基于高可用分布式集群技术，提供低延时的、高可靠 的消息发布与订阅服务。

Dubbo ： Apache Dubbo™ 是一款高性能 Java RPC 框架。

Seata ：阿里巴巴开源产品，一个易于使用的高性能微服务分布式事务解决方案。

Alibaba Cloud ACM ：一款在分布式架构环境中对应用配置进行集中管理和推送的应用配置中心 产品。

Alibaba Cloud OSS : 阿里云对象存储服务（ Object Storage Service ，简称 OSS ），是阿里云提 供的海量、安全、低成本、高可靠的云存储服务。您可以在任何应用、任何时间、任何地点存储和 访问任意类型的数据。

Alibaba Cloud SchedulerX : 阿里中间件团队开发的一款分布式任务调度产品，提供秒级、精 准、高可靠、高可用的定时（基于 Cron 表达式）任务调度服务。

Alibaba Cloud SMS : 覆盖全球的短信服务，友好、高效、智能的互联化通讯能力，帮助企业迅速 搭建客户触达通道。

# Spring Cloud Alibaba与Spring Cloud

SpringCloud的Hoxton版本，和之前的版本相比，用新的组件替换掉了原来大部分的组件，老的组件现在处于 停更不停用 的状况。

详情见下图（× 的表示之前的组件，现在停更了的；√ 的表示新的替换后的组件）：
![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/b7ca64ebc1f74462bf2a012a97d977fe~tplv-k3u1fbpfcp-zoom-1.image)
#### 描述：

##### 服务注册中心：

Eureka：官方停止更新，并且已经有更好的替代产品了，可以使用，但是官方已经不建议使用了（重度患者）。

Zookeeper：某些老系统，以前是用的Zookeeper + Dubbo，后来做技术升级，结果发现SpringCloud的Eureka停更了，然后就用了最少的技术切换，那么就用了Zookeeper做注册中心。

Consul：go语言开发的，也是一个优秀的服务注册框架，但是使用量较少，风头都被Nacos抢了。

Nacos：来自于SpringCloudAlibaba，在企业中经过了百万级注册考验的，不但可以完美替换Eureka，还能做其他组件的替换，所以强烈建议使用，是学习的重点。

##### 服务调用：

Ribbon：也进入了维护状态，停止更新了，但是Spring官方还在使用（轻度患者）。

LoadBalancer：Spring官方推出的一个新的组件，打算逐渐取代掉Ribbon，但是现在还处于萌芽状态。

##### 服务调用2：

Feign：Netflix 公司产品，也停止更新了。

OpenFeign：Spring社区等不了Netflix更新了，然后就自己做了一个组件，不用Feign了。

##### 服务降级：

Hystrix：官网不推荐使用，但是中国企业中还在大规模使用。

Resilience4J：官网推荐使用，但是国内很少用这个。

Sentienl：来自于SpringCloudAlibaba，在中国企业替换Hystrix的组件，国内强烈建议使用。

##### 服务网关：

Zuul：Netflix 公司产品，公司内部产生分歧，有的人想自己出一个Zuul2。

Zuul2：也是Netflix 公司准备出的产品，但是由于内部分歧，所以Zuul2已经胎死腹中了。

gateway：Spring社区自己出的网关组件，官方隆重介绍和极度推荐的网关服务组件。

##### 服务配置：

Config：目前也在使用，风头被Nacos抢了。

Nacos：来自于SpringCloudAlibaba，后来居上，把Config给替换了。

##### 服务总线：

Bus：SpringCloud原生的服务总线组件，现在风头也被Nacos抢了。

Nacos：来自于SpringCloudAlibaba，后来居上，把Bus给替换了。

综上可以看出，Nacos 是重中之重，一个组件就替换掉了原来的几个组件。

参考链接如下：
[SpringCloud组件的停更和替换说明](https://www.cnblogs.com/y3blogs/p/13276504.html)
[SpringCloudAlibaba（一）SpringCloudAlibaba简介](https://blog.csdn.net/xuruanshun/article/details/120140950)
