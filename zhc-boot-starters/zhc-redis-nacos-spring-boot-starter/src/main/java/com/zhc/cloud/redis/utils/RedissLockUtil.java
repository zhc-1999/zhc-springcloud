package com.zhc.cloud.redis.utils;

import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.concurrent.TimeUnit;

/**
 * 分布式锁redisson工具类
 * @author zhc
 * @description 分布式锁redisson工具类
 * @date 2021-12-29 09:56
 */
@Component
public class RedissLockUtil {

    @Value("${cache.prefix}")
    private String lockPrefixKey;

    @Resource
    private RedissonClient redissonClient;

    public RLock lock(String lockKey) {
        String key = lockPrefixKey + lockKey;
        RLock lock = redissonClient.getLock(key);
        lock.lock();
        return lock;
    }

    public RLock lock(String lockKey, int leaseTime) {
        String key = lockPrefixKey + lockKey;
        RLock lock = redissonClient.getLock(key);
        lock.lock(leaseTime, TimeUnit.SECONDS);
        return lock;
    }

    public RLock lock(String lockKey, TimeUnit unit, int timeout) {
        String key = lockPrefixKey + lockKey;
        RLock lock = redissonClient.getLock(key);
        lock.lock(timeout, unit);
        return lock;
    }

    public boolean tryLock(String lockKey, TimeUnit unit, int waitTime, int leaseTime) {
        String key = lockPrefixKey + lockKey;
        RLock lock = redissonClient.getLock(key);
        try {
            return lock.tryLock(waitTime, leaseTime, unit);
        } catch (InterruptedException e) {
            return false;
        }
    }

    public void unlock(String lockKey) {
        String key = lockPrefixKey + lockKey;
        RLock lock = redissonClient.getLock(key);
        lock.unlock();
    }

    public void unlock(RLock lock) {
        lock.unlock();
    }
}
