package com.video.assets.domain.dto;

import lombok.Data;

/**
 * 上传人平均文件大小统计
 */
@Data
public class UploaderAvgSizeDTO {

    /**
     * 上传人
     */
    private String uploader;

    /**
     * 平均文件大小（字节）
     */
    private Double avgSize;
}
