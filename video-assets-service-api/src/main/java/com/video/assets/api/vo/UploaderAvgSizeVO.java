package com.video.assets.api.vo;

import lombok.Data;

/**
 * 上传人平均文件大小统计
 */
@Data
public class UploaderAvgSizeVO {
    private String uploader;
    private Double avgSize;
}
