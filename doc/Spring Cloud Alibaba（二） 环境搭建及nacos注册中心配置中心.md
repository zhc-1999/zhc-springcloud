# Spring Cloud Alibaba（二） 环境搭建及nacos注册中心配置中心

## 技术选型

```
maven
开发工具：idea
注册中心、配置中心：nacos-2.0.3
spring-cloud
spring-cloud-alibaba
API网关：spring-cloud-alibaba-gateway
数据库：MySQL 5.7
nosql：redis
分布式锁：redisson
持久层：mybatis-plus
全链路蓝绿灰度发布容灾、网关动态路由: discovery-6.12.1
分布式事务：seata
服务调用：openfeign
服务熔断和降级：Hystrix
```

## 架构设计

![image.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/b0066332898043efabc23814c416c2d7~tplv-k3u1fbpfcp-watermark.image?)
本人画的不好，别喷我🐶

## 一、Nacos安装及启动
### 1. Nacos单机启动
1. 首先先下载nacos
   github下载地址：https://github.com/alibaba/nacos/releases

百度云下载地址：https://pan.baidu.com/s/1n1l1lf8BDs5bMTcyrvrVvQ?pwd=41A5   提取码：41A5

2. 解压后进入nacos/bin目录

3. 输入命令启动服务
   单机启动
   linux：`sh startup.sh -m standalone`

   windows：`cmd startup.cmd -m standalone`


![image.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/127aa073f36a4599a116c7711b405e56~tplv-k3u1fbpfcp-watermark.image?)

看到这个基本上就是启动成功了，可通过 http://127.0.0.1:8848/nacos/index.html 进入自带的控制台界面，默认用户名/密码是**nacos/nacos**

![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/1322d1e4774a46fc98ac96f5bcf9d254~tplv-k3u1fbpfcp-watermark.image?)

### 2. Nacos集群启动

3个或3个以上Nacos节点才能构成集群，仅支持linux/unix/mac

在nacos的解压目录conf目录下，有配置文件cluster.conf（若无则手动创建），每行配置成ip:port。（配置3个或3个以上节点）
``` text
#cluster.conf
192.168.0.1:8848
192.168.0.2:8848
192.168.0.3:8848
```
配置后在各个节点服务器输入命令启动所有服务：sh startup.sh


### 3. 配置Mysql
默认使用嵌入式数据库，0.7版本以后增加支持mysql数据源能力

初始化nacos相关表：运行conf/nacos-mysql.sql文件
修改conf/application.properties文件，增加支持mysql数据源配置（目前只支持mysql），添加mysql数据源的url、用户名和密码
```
spring.datasource.platform=mysql
db.num=1
db.url.0=jdbc:mysql://127.0.0.1:3306/nacos?characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true
db.user=user
db.password=password
``` 
配置后输入命令启动服务（参照上文后续启动服务命令）


> 2. Nacos集群启动 3. 配置Mysql 全都是借鉴别人的，咱没试过，有问题别找我，找我我也不会🐶


## 二、搭建项目
### 1.新建无骨架的maven项目作为父项目

![image.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/6b2794ec69d4400fb2a8be3cb140b807~tplv-k3u1fbpfcp-watermark.image?)
删除掉src及其他的东西留下个pom，在pom中引入依赖作为父依赖，然后下面的子依赖就可以不用写版本号了。

``` java
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-dependencies</artifactId>
        <version>2.3.12.RELEASE</version>
    </parent>
    <properties>
        <java.version>1.8</java.version>
        <spring-cloud-alibaba.version>2.2.6.RELEASE</spring-cloud-alibaba.version>
        <spring-cloud.version>Hoxton.SR12</spring-cloud.version>
    </properties>
    <!--全局引入下载依赖地址，并不会引入依赖-->
    <dependencyManagement>
        <dependencies>
            <!--springcloud下载仓库-->
            <dependency>
                <groupId>org.springframework.cloud</groupId>
                <artifactId>spring-cloud-dependencies</artifactId>
                <version>${spring-cloud.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
            <!--阿里巴巴下载仓库-->
            <dependency>
                <groupId>com.alibaba.cloud</groupId>
                <artifactId>spring-cloud-alibaba-dependencies</artifactId>
                <version>${spring-cloud-alibaba.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
            <!--nacos注册发现依赖-->
            <dependency>
                <groupId>com.alibaba.cloud</groupId>
                <artifactId>spring-cloud-starter-alibaba-nacos-discovery</artifactId>
                <version>${spring-cloud-alibaba.version}</version>
            </dependency>
            <!--nacos统一配置中心管理依赖-->\
            <dependency>
                <groupId>com.alibaba.cloud</groupId>
                <artifactId>spring-cloud-starter-alibaba-nacos-config</artifactId>
                <version>${spring-cloud-alibaba.version}</version>
            </dependency>
        </dependencies>
    </dependencyManagement>
```

## 三、ncaos注册中心
新建一个Module：zhc-common，以后主要是放置公共实体类以及公共工具类以及公共依赖，所以不需要启动类，以及test

![image.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/2a312c782a01448587b74173ee32d780~tplv-k3u1fbpfcp-watermark.image?)
![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/b57dac9e348a43349bae48913a625881~tplv-k3u1fbpfcp-watermark.image?)


``` java

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

    <artifactId>zhc-common</artifactId>

    <properties>
        <maven.compiler.source>8</maven.compiler.source>
        <maven.compiler.target>8</maven.compiler.target>
    </properties>

    <dependencies>
        <dependency>
            <groupId>cn.hutool</groupId>
            <artifactId>hutool-all</artifactId>
        </dependency>
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
        </dependency>
        <dependency>
            <groupId>org.apache.commons</groupId>
            <artifactId>commons-lang3</artifactId>
        </dependency>
        <dependency>
            <groupId>com.google.guava</groupId>
            <artifactId>guava</artifactId>
        </dependency>
        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>fastjson</artifactId>
        </dependency>
    </dependencies>
    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>

</project>
```
然后根据上面的方式在建两个module，这里一个zhc-business，一个zhc-system\
然后公共类引入Nacos注册发现依赖 以及 springboot的web依赖，两个新建的module引入common

然后以zhc-system服务为例
1. **引依赖**
```
<dependencies>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>
    <dependency>
        <groupId>com.alibaba.cloud</groupId>
        <artifactId>spring-cloud-starter-alibaba-nacos-config</artifactId>
    </dependency>
    <dependency>
        <groupId>com.alibaba.cloud</groupId>
        <artifactId>spring-cloud-starter-alibaba-nacos-discovery</artifactId>
    </dependency>
    <dependency>
        <groupId>com.zhc.cloud</groupId>
        <artifactId>zhc-common</artifactId>
        <version>0.0.1-SNAPSHOT</version>
    </dependency>
</dependencies>
```
2. **写配置文件**
   创建resource文件夹以及application.yml文件并写入配置
```
spring
    #nacos
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
          service: ZHC-BUSINESS-SERVICE
```
3. **启动类**
```
@SpringBootApplication //SpringBoot
@EnableConfigurationProperties //开启服务的注册
public class ZhcSystemStartApplication {

    public static void main(String[] args) {
        SpringApplication.run(ZhcSystemStartApplication.class, args);
    }


}
```
4. **服务注册到nacos**
   在nacos中创建命名空间

![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/be0f9c970b5f48cea8cd85ce4966db72~tplv-k3u1fbpfcp-watermark.image?)

创建后启动项目就可以看到ZHC-SYSTEM-SERVICE可以注册到ncaos。

![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/bc4bbd9237a54a659a5ebf68f0683e99~tplv-k3u1fbpfcp-watermark.image?)

## 四、ncaos配置中心
1. **写配置文件**
   创建 *bootstrap.yml* 文件并写入配置
```
spring:
  application:
    name: zhc-business
  cloud:
    nacos:
      # nacos config 配置
      config:
        #        enabled: false
        #        nacos集群地址。注：多个IP可以通过“，”号隔离，例如192.168.80.1:8848,192.168.80.1:8848  填写域名时前缀不要加上http://
        server-addr: 127.0.0.1:8848
        #命名空间ID
        namespace: ZHC_GROUP
        #账号
        username: nacos
        #密码
        password: nacos
        # 主配置 最大重试次数
        max-retry: 5
        # 主配置 配置监听长轮询超时时间
        config-long-poll-timeout: 46000
        # 主配置 重试时间
        config-retry-time: 2000
        # 主配置 开启注册监听器预加载配置服务（除非特殊业务需求，否则不推荐打开该参数）
        enable-remote-sync-config: true
        # 主配置 data-id
        name: zhc-business
        # 主配置 group-id
        group: ZHC_GROUP
        # 主配置 配置文件类型
        fileExtension: yaml
        # nacos默认远程优先，需要使用本地配置优先可以开启下边三条配置
#        override-none: true
#        allow-override: true
#        override-system-properties: false
```
2. **nacos配置**
   在ZHC_GROUP分组下创建

![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/e649fef8e9c840ada370deecddba6f12~tplv-k3u1fbpfcp-watermark.image?)

创建后配置zhc-business项目

![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/f98eb8d1e6804f4389b160e1d48665ad~tplv-k3u1fbpfcp-watermark.image?)
日志打印这个说明读取nacos日志成功
![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/99cd1edbde0a4f7b94a4fb6a1156bc61~tplv-k3u1fbpfcp-watermark.image?)


源代码：https://github.com/zhc-1999/springcloud （我是先搭建的项目，然后后补的文档。所以说项目和文档可能不太一样，有问题可以问我一下）