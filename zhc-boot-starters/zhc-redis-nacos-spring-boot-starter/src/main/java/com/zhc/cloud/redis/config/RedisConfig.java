package com.zhc.cloud.redis.config;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.lang3.StringUtils;
import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.config.ClusterServersConfig;
import org.redisson.config.Config;
import org.redisson.config.SentinelServersConfig;
import org.redisson.config.SingleServerConfig;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.annotation.Reference;
import org.springframework.data.redis.connection.*;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.util.Assert;
import redis.clients.jedis.JedisPoolConfig;

import java.util.ArrayList;
import java.util.List;

/**
 * Redis配置类
 *
 * @author 邓健
 * @date 2020-12-05
 */
@Configuration
@RefreshScope
public class RedisConfig {

    @Value("${spring.redis.database:0}")
    private int dbIndex;

    @Value("${spring.redis.password}")
    private String password;

    @Value("${spring.redis.port:6379}")
    private int port;

    @Value("${spring.redis.host}")
    private String host;

    @Value("${spring.redis.timeout:5000}")
    private int timeout;

    @Value("${spring.redis.sentinel.nodes}")
    private String sentinelNodes;

    @Value("${spring.redis.cluster.nodes}")
    private String clusterNodes;

    @Value("${redisson.sentinel.addresses}")
    private String redissonSentinelAddr;

    @Value("${redisson.cluster.addresses}")
    private String redissonClusterAddr;

    @Value("${redisson.single.addresses}")
    private String redissonSingleAddr;

    @Value("${spring.redis.pool.max-active:100}")
    private int redisPoolMaxActive;

    @Value("${spring.redis.pool.max-wait:5000}")
    private int redisPoolMaxWait;

    @Value("${spring.redis.pool.max-idle:16}")
    private int redisPoolMaxIdle;

    @Value("${spring.redis.pool.min-idle:8}")
    private int redisPoolMinIdle;

    @Value("${spring.redis.sentinel.master:mymaster}")
    private String sentinelMaster;

    /**
     * 哨兵模式自动装配
     *
     * @return
     */
    @Bean
    @RefreshScope
    public RedissonClient redissonSentinel() {
        Config config = new Config();
        if (StringUtils.isNotBlank(redissonSentinelAddr)) {
            String[] address = StringUtils.split(redissonSentinelAddr, ",");
            SentinelServersConfig serverConfig = config.useSentinelServers().addSentinelAddress(address)
                    .setMasterName(sentinelMaster)
                    .setTimeout(timeout)
                    .setMasterConnectionPoolSize(redisPoolMaxIdle)
                    .setMasterConnectionMinimumIdleSize(redisPoolMinIdle)
                    .setSlaveConnectionMinimumIdleSize(redisPoolMinIdle)
                    .setSlaveConnectionPoolSize(redisPoolMaxIdle);
            if (StringUtils.isNotBlank(password)) {
                serverConfig.setPassword(password);
            }
            return Redisson.create(config);
        } else if (StringUtils.isNotBlank(redissonClusterAddr)) {
            String[] address = StringUtils.split(redissonClusterAddr, ",");
            ClusterServersConfig serverConfig = config.useClusterServers().addNodeAddress(address)
                    .setTimeout(timeout)
                    .setMasterConnectionPoolSize(redisPoolMaxIdle)
                    .setMasterConnectionMinimumIdleSize(redisPoolMinIdle)
                    .setSlaveConnectionMinimumIdleSize(redisPoolMinIdle)
                    .setSlaveConnectionPoolSize(redisPoolMaxIdle);
            if (StringUtils.isNotBlank(password)) {
                serverConfig.setPassword(password);
            }
            return Redisson.create(config);
        } else {
            SingleServerConfig serverConfig = config.useSingleServer().setAddress(redissonSingleAddr)
                    .setTimeout(timeout)
                    .setConnectionPoolSize(redisPoolMaxIdle)
                    .setConnectionMinimumIdleSize(redisPoolMinIdle);
            if (StringUtils.isNotBlank(password)) {
                serverConfig.setPassword(password);
            }
            return Redisson.create(config);
        }
    }

    /**
     * 配置redis连接工厂
     *
     * @return
     */
    @Bean
    @RefreshScope
    public RedisConnectionFactory defaultRedisConnectionFactory() {
        return createJedisConnectionFactory();
    }

    /**
     * 配置redisTemplate 注入方式使用@Resource(name="") 方式注入
     *
     * @return
     */
    @Bean(name = "redisTemplate")
    @RefreshScope
    public RedisTemplate defaultRedisTemplate() {
        RedisTemplate template = new RedisTemplate();
        template.setConnectionFactory(defaultRedisConnectionFactory());
        setSerializer(template);
        template.afterPropertiesSet();
        return template;
    }

    /**
     * 创建redis连接工厂
     *
     * @return
     */
    @RefreshScope
    public JedisConnectionFactory createJedisConnectionFactory() {
        JedisConnectionFactory jedisConnectionFactory = null;
        if (StringUtils.isNotBlank(host)) {
            RedisStandaloneConfiguration config = new RedisStandaloneConfiguration();
            config.setHostName(host);
            config.setPort(port);
            jedisConnectionFactory = new JedisConnectionFactory(config);
        } else if (StringUtils.isNotBlank(clusterNodes)) {
            RedisClusterConfiguration config = new RedisClusterConfiguration();
            config.setClusterNodes(createSentinels(clusterNodes));
            jedisConnectionFactory = new JedisConnectionFactory(config);
        } else if (StringUtils.isNotBlank(sentinelNodes)) {
            RedisSentinelConfiguration config = new RedisSentinelConfiguration();
            config.setSentinels(createSentinels(sentinelNodes));
            jedisConnectionFactory = new JedisConnectionFactory(config);
        }
        jedisConnectionFactory.setDatabase(dbIndex);
        jedisConnectionFactory.setPassword(password);
        jedisConnectionFactory.setTimeout(timeout);
        jedisConnectionFactory.setPoolConfig(setPoolConfig(redisPoolMaxIdle, redisPoolMinIdle, redisPoolMaxActive, redisPoolMaxWait, true));
        return jedisConnectionFactory;
    }

    /**
     * 设置连接池属性
     *
     * @param maxIdle
     * @param minIdle
     * @param maxActive
     * @param maxWait
     * @param testOnBorrow
     * @return
     */
    @RefreshScope
    public JedisPoolConfig setPoolConfig(int maxIdle, int minIdle, int maxActive, int maxWait, boolean testOnBorrow) {
        JedisPoolConfig poolConfig = new JedisPoolConfig();
        poolConfig.setMaxIdle(maxIdle);
        poolConfig.setMinIdle(minIdle);
        poolConfig.setMaxTotal(maxActive);
        poolConfig.setMaxWaitMillis(maxWait);
        poolConfig.setTestOnBorrow(testOnBorrow);
        return poolConfig;
    }

    /**
     * 设置RedisTemplate的序列化方式
     *
     * @param redisTemplate
     */
    @RefreshScope
    public void setSerializer(RedisTemplate redisTemplate) {
        Jackson2JsonRedisSerializer jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer(Object.class);
        ObjectMapper om = new ObjectMapper();
        om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        om.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
        jackson2JsonRedisSerializer.setObjectMapper(om);
        //设置键（key）的序列化方式
        redisTemplate.setKeySerializer(new StringRedisSerializer());
        redisTemplate.setValueSerializer(jackson2JsonRedisSerializer);
        redisTemplate.setHashKeySerializer(new StringRedisSerializer());
        redisTemplate.setHashValueSerializer(jackson2JsonRedisSerializer);
        redisTemplate.afterPropertiesSet();
    }

    //读取ip列表
    @RefreshScope
    private List<RedisNode> createSentinels(String ipListOriginal) {
        String[] ipList = StringUtils.split(ipListOriginal, ",");
        List<RedisNode> nodes = new ArrayList<>();
        for (String node : ipList) {
            try {
                String[] parts = StringUtils.split(node, ":");
                Assert.state(parts.length == 2, "Must be defined as 'host:port'");
                nodes.add(new RedisNode(parts[0], Integer.valueOf(parts[1])));
            } catch (RuntimeException ex) {
                throw new IllegalStateException("Invalid redis sentinel property", ex);
            }
        }
        return nodes;
    }
}
