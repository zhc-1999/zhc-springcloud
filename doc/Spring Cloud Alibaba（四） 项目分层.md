**目录**

[Spring Cloud Alibaba（一） 简介](https://juejin.cn/post/7044168709535399944)

[Spring Cloud Alibaba（二） 环境搭建及nacos注册中心配置中心](https://juejin.cn/post/7047314936606752798)

[Spring Cloud Alibaba（三） 搭建API网关 gateway动态路由](https://juejin.cn/post/7049756722285674503)

先给你们看一下项目分层结构

![image.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/63d1b9eb5dab496f931a950623053bf0~tplv-k3u1fbpfcp-watermark.image?)

前面说到搭建 *zhc-system* 项目，为了更方便调用feign，我这边给项目分了一下层，我这边分为了五个层次，具体如下：
```
zhc-system-api    -- 项目开放的API，及一些实体类（入参 VO） 供项目内的feign调用
zhc-system-web    -- 项目内的controller
zhc-system-service    -- 项目内的业务层
zhc-system-domain    -- 项目内的实体类（PO 持久化对象）及Mapper
zhc-system-start    -- 项目的配置文件及启动类
```
不太了解VO、PO的可以看一下下面的，我这里为了不那么麻烦只用了VO、PO

**VO、DTO、DO、PO概念：**

**VO（View Object）：** 视图对象，用于展示层，它的作用是把某个指定页面（或组件）的所有数据封装起来。

**DTO（Data Transfer Object）：** 数据传输对象，这个概念来源于J2EE的设计模式，原来的目的是为了EJB的分布式应用提供粗粒度的数据实体，以减少分布式调用的次数，从而提高分布式调用的性能和降低网络负载，但在这里，我泛指用于展示层与服务层之间的数据传输对象。

**DO（Domain Object）：** 领域对象，就是从现实世界中抽象出来的有形或无形的业务实体。

**PO（Persistent Object）：** 持久化对象，它跟持久层（通常是关系型数据库）的数据结构形成一一对应的映射关系，如果持久层是关系型数据库，那么，数据表中的每个字段（或若干个）就对应PO的一个（或若干个）属性。

**依赖关系：**
zhc-system-start 依赖 zhc-system-web
zhc-system-web 依赖 zhc-system-service
zhc-system-service 依赖 zhc-system-domain、zhc-system-api

差不多就这样了，有问题可以看一下源代码：
[GitHub](https://github.com/zhc-1999/springcloud) 、[Gitee](https://gitee.com/zhhc88/springcloud)
（我是先搭建的项目，然后后补的文档。所以说项目和文档可能不太一样，有问题可以问我一下）