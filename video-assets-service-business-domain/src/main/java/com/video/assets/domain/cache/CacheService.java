package com.video.assets.domain.cache;

/**
 * 缓存服务接口，由基础设施层实现
 */
public interface CacheService {

    /**
     * 缓存是否启用
     */
    boolean isEnabled();

    /**
     * 从缓存获取值
     *
     * @return 缓存值，null 表示未命中
     */
    String get(String key);

    /**
     * 写入缓存（带 TTL 和随机偏移防雪崩）
     */
    void set(String key, String value);

    /**
     * 写入缓存（指定 TTL 分钟数）
     */
    void set(String key, String value, long ttlMinutes);

    /**
     * 缓存空值（防穿透）
     */
    void setNull(String key);

    /**
     * 判断缓存值是否为空值标记
     */
    boolean isNullPlaceholder(String value);

    /**
     * 删除缓存
     */
    void delete(String key);

    /**
     * 按前缀删除缓存
     */
    void deleteByPrefix(String keyPrefix);

    /**
     * 延迟双删：异步等待后再次删除缓存
     */
    void delayedDelete(String key);
}
