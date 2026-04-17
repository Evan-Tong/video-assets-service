package com.video.assets.infrastructure.config;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.autoconfigure.data.redis.RedisAutoConfiguration;
import org.springframework.context.annotation.Configuration;

/**
 * 当 cache.enabled=false 时，排除 Redis 自动配置，
 * 使得即使未安装 Redis 也能正常启动工程。
 */
@Configuration
@ConditionalOnProperty(name = "cache.enabled", havingValue = "false")
@EnableAutoConfiguration(exclude = {RedisAutoConfiguration.class})
public class RedisConditionalConfig {
}
