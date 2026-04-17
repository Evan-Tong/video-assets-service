package com.video.assets;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication(scanBasePackages = "com.video.assets")
@MapperScan("com.video.assets.infrastructure.mapper")
@EnableAsync
public class VideoAssetsApplication {

    public static void main(String[] args) {
        SpringApplication.run(VideoAssetsApplication.class, args);
    }
}
