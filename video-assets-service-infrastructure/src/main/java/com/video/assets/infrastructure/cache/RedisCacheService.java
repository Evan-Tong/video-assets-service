package com.video.assets.infrastructure.cache;

import com.video.assets.domain.cache.CacheService;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.data.redis.core.Cursor;
import org.springframework.data.redis.core.ScanOptions;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.*;

/**
 * Redis 缓存服务实现，仅在 cache.enabled=true 时加载
 */
@Component
@Slf4j
@ConditionalOnProperty(name = "cache.enabled", havingValue = "true", matchIfMissing = true)
public class RedisCacheService implements CacheService {

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    /** 默认缓存过期时间：30 分钟 */
    private static final long DEFAULT_TTL_MINUTES = 30;

    /** 空值缓存过期时间：1 分钟（防穿透） */
    private static final long NULL_VALUE_TTL_MINUTES = 1;

    /** TTL 随机偏移范围：±5 分钟（防雪崩） */
    private static final long TTL_JITTER_MINUTES = 5;

    /** 延迟双删等待时间：500 毫秒 */
    private static final long DELAY_DELETE_MS = 500;

    /** 延迟双删调度器（单线程即可，仅做延迟调度，不阻塞工作线程） */
    private static final ScheduledExecutorService DELAY_DELETE_SCHEDULER;

    static {
        ThreadFactory threadFactory = r -> {
            Thread thread = new Thread(r, "cache-delay-delete");
            thread.setDaemon(true);
            return thread;
        };
        DELAY_DELETE_SCHEDULER = new ScheduledThreadPoolExecutor(1, threadFactory);
    }

    /** 空值标记 */
    private static final String NULL_PLACEHOLDER = "@@NULL@@";

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public String get(String key) {
        try {
            return stringRedisTemplate.opsForValue().get(key);
        } catch (Exception e) {
            log.warn("Redis 读取失败, key={}: {}", key, e.getMessage());
            return null;
        }
    }

    @Override
    public void set(String key, String value) {
        try {
            long jitter = ThreadLocalRandom.current().nextLong(-TTL_JITTER_MINUTES, TTL_JITTER_MINUTES + 1);
            long ttl = DEFAULT_TTL_MINUTES + jitter;
            stringRedisTemplate.opsForValue().set(key, value, ttl, TimeUnit.MINUTES);
        } catch (Exception e) {
            log.warn("Redis 写入失败, key={}: {}", key, e.getMessage());
        }
    }

    @Override
    public void set(String key, String value, long ttlMinutes) {
        try {
            long jitter = ThreadLocalRandom.current().nextLong(-TTL_JITTER_MINUTES, TTL_JITTER_MINUTES + 1);
            long ttl = Math.max(1, ttlMinutes + jitter);
            stringRedisTemplate.opsForValue().set(key, value, ttl, TimeUnit.MINUTES);
        } catch (Exception e) {
            log.warn("Redis 写入失败, key={}: {}", key, e.getMessage());
        }
    }

    @Override
    public void setNull(String key) {
        try {
            stringRedisTemplate.opsForValue().set(key, NULL_PLACEHOLDER, NULL_VALUE_TTL_MINUTES, TimeUnit.MINUTES);
        } catch (Exception e) {
            log.warn("Redis 写入空值失败, key={}: {}", key, e.getMessage());
        }
    }

    @Override
    public boolean isNullPlaceholder(String value) {
        return NULL_PLACEHOLDER.equals(value);
    }

    @Override
    public void delete(String key) {
        try {
            stringRedisTemplate.delete(key);
            log.info("删除缓存, key={}", key);
        } catch (Exception e) {
            log.warn("Redis 删除失败, key={}: {}", key, e.getMessage());
        }
    }

    @Override
    public void deleteByPrefix(String keyPrefix) {
        try {
            Set<String> keysToDelete = new HashSet<>();
            ScanOptions scanOptions = ScanOptions.scanOptions()
                    .match(keyPrefix + "*")
                    .count(100)
                    .build();
            try (Cursor<String> cursor = stringRedisTemplate.scan(scanOptions)) {
                while (cursor.hasNext()) {
                    keysToDelete.add(cursor.next());
                }
            }
            if (!keysToDelete.isEmpty()) {
                stringRedisTemplate.delete(keysToDelete);
                log.info("按前缀删除缓存, prefix={}, count={}", keyPrefix, keysToDelete.size());
            }
        } catch (Exception e) {
            log.warn("按前缀删除缓存失败, prefix={}: {}", keyPrefix, e.getMessage());
        }
    }

    @Override
    public void delayedDelete(String key) {
        DELAY_DELETE_SCHEDULER.schedule(() -> {
            try {
                stringRedisTemplate.delete(key);
                log.info("延迟双删完成, key={}", key);
            } catch (Exception e) {
                log.warn("延迟双删失败, key={}: {}", key, e.getMessage());
            }
        }, DELAY_DELETE_MS, TimeUnit.MILLISECONDS);
    }
}
