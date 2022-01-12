**目录**

[Spring Cloud Alibaba（一） 简介](https://juejin.cn/post/7044168709535399944)

[Spring Cloud Alibaba（二） 环境搭建及nacos注册中心配置中心](https://juejin.cn/post/7047314936606752798)

[Spring Cloud Alibaba（三） 搭建API网关 gateway动态路由](https://juejin.cn/post/7049756722285674503)

[Spring Cloud Alibaba（四） 项目分层](https://juejin.cn/post/7051960434340921380)

## 什么是Feign

Feign是一种声明式、模板化的HTTP客户端(仅在Application Client中使用)（称feign作用：声明式服务调用）。声明式调用是指，就像调用本地方法一样调用远程方法，无需感知操作远程http请求。
## 什么是声明式服务调用

声明式调用就像调用本地方法一样调用远程方法;无感知发送http请求。

Spring Cloud的声明式调用, 可以做到使用 HTTP请求远程服务时能就像调用本地方法一样的体验，开发者完全感知不到这是远程方法，更感知不到这是个HTTP请求。Feign的应用，让Spring Cloud微服务调用像Dubbo一样，Application Client直接通过接口方法调用Application Service，而不需要通过常规的RestTemplate构造请求再解析返回数据。它解决了让开发者调用远程接口就跟调用本地方法一样，无需关注与远程的交互细节，更无需关注分布式环境开发。

## 一、集成OpenFeign

1. 引入依赖
```
<dependency>
    <groupId>org.springframework.cloud</groupId>
    <artifactId>spring-cloud-starter-openfeign</artifactId>
    <version>2.2.6.RELEASE</version>
</dependency>
```
2. 启动类增加注解
```
@EnableFeignClients
```
3. 增加配置信息
```

#feign配置
feign:
  client:
    config:
      default:
        #feign客户端建立连接超时时间
        connect-timeout: 2000
        #feign客户端建立连接后读取资源超时时间
        read-timeout: 10000
  #开启Hystrix断路器
  hystrix:
    enabled: true
#Hystrix配置
hystrix:
  command:
    HystrixCommandKey:
      execution:
        isolation:
          thread:
            #在调用方配置，被该调用方的指定方法（HystrixCommandKey方法名）的超时时间是该值
            timeoutInMilliseconds: 4000
    default:
      circuitBreaker:
        #出错百分比阈值，当达到此阈值后，开始短路。默认50%
        errorThresholdPercentage: 50%
        # 简言之，10s内请求失败数量达到20个，断路器开。  当在配置时间窗口内达到此数量的失败后，进行短路。默认20个
        requestVolumeThreshold: 20
        #短路多久以后开始尝试是否恢复，默认5s
        sleepWindowInMilliseconds: 5
      execution:
        isolation:
          thread:
            #配置Hystrix 超时时间   超时关闭
            #hystrix.command.default.execution.timeout.enabled=false
            #超时时间（默认1000ms）在调用方配置，被该调用方的所有方法的超时时间都是该值，优先级低于下边的指定配置
            timeoutInMilliseconds: 3000
      fallback:
        isolation:
          semaphore:
            #调用线程允许请求HystrixCommand.GetFallback()的最大数量，默认10。超出时将会有异常抛出，
            #注意：该项配置对于THREAD隔离模式也起作用
            maxConcurrentRequests: 50000
  threadpool:
    default:
      #线程池核心线程数 默认为10
      coreSize: 10
      #最大排队长度。默认-1  如果要从-1换成其他值则需重启，即该值不能动态调整，若要动态调整，需要使用到下边这个配置
      maxQueueSize: 100
      #排队线程数量阈值，默认为5，达到时拒绝，如果配置了该选项，队列的大小是该队列
      queueSizeRejectionThreshold: 5
```
4. 在zhc-system-api中新建几个类
```
@Data
public class TestData {
    private Long id;

    private String name;

}
```
```
//name NACOS中服务的名称
@FeignClient(name = "ZHC-SYSTEM-SERVICE", fallback = FeignSystemClientCallback.class)
public interface FeignTestClient {
    /**
     * 测试接口
     *
     * @return
     */
    @RequestMapping(value = "/test", method = RequestMethod.POST)
    String test(@RequestBody TestData testData);
}
```

```
@Slf4j
@Component
public class FeignSystemClientCallback  implements FeignTestClient {
    @Override
    public String test(TestData testData) {
        return "服务器忙!请稍后重试!!!";
    }
}
```
在zhc-system-web中新建一个测试方法
```
@RequestMapping(value = "/test", method = RequestMethod.POST)
public String test(@RequestBody TestData testData){
    log.info(String.valueOf(testData));
    return testDataService.select().toString();
}
```
5. 调用
   在zhc-business-service中引入zhc-system-api模块的依赖
```
<dependency>
    <groupId>com.zhc.cloud</groupId>
    <artifactId>zhc-system-api</artifactId>
    <version>0.0.1-SNAPSHOT</version>
</dependency>
```
然后在一个测试方法中写调用这个  /test 方法
![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/2efd537df7544d369cbc920dc45f2cf7~tplv-k3u1fbpfcp-watermark.image?)
然后调用这个测试方法，结果成功了
![image.png](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/118cd2974051462a9f670bad5fb3f73b~tplv-k3u1fbpfcp-watermark.image?)
这样集成OpenFeign就成功了


差不多就这样了，有问题可以看一下源代码：
[GitHub](https://github.com/zhc-1999/springcloud) 、[Gitee](https://gitee.com/zhhc88/springcloud)
（我是先搭建的项目，然后后补的文档。所以说项目和文档可能不太一样，有问题可以问我一下）