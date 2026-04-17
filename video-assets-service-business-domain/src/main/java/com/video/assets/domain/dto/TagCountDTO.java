package com.video.assets.domain.dto;

import lombok.Data;

/**
 * 热门标签统计
 */
@Data
public class TagCountDTO {

    /**
     * 标签名称
     */
    private String name;

    /**
     * 使用次数
     */
    private Long count;
}
