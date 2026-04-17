package com.video.assets.infrastructure.cache;

import com.video.assets.domain.cache.CacheService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

/**
 * 空操作缓存实现，当缓存功能禁用时使用。
 * 所有操作直接跳过，服务降级为直查数据库。
 */
@Component
@Slf4j
@ConditionalOnProperty(name = "cache.enabled", havingValue = "false", matchIfMissing = false)
public class NoOpCacheService implements CacheService {

    public NoOpCacheService() {
        log.info("缓存已禁用，使用 NoOpCacheService，所有查询将直接访问数据库");
    }

    @Override
    public boolean isEnabled() {
        return false;
    }

    @Override
    public String get(String key) {
        return null;
    }

    @Override
    public void set(String key, String value) {
        // 缓存禁用，不执行任何操作
    }

    @Override
    public void set(String key, String value, long ttlMinutes) {
        // 缓存禁用，不执行任何操作
    }

    @Override
    public void setNull(String key) {
        // 缓存禁用，不执行任何操作
    }

    @Override
    public boolean isNullPlaceholder(String value) {
        return false;
    }

    @Override
    public void delete(String key) {
        // 缓存禁用，不执行任何操作
    }

    @Override
    public void deleteByPrefix(String keyPrefix) {
        // 缓存禁用，不执行任何操作
    }

    @Override
    public void delayedDelete(String key) {
        // 缓存禁用，不执行任何操作
    }
}
