package com.video.assets.domain.dto;

import lombok.Data;

/**
 * 上传趋势统计
 */
@Data
public class UploadTrendDTO {

    /**
     * 日期
     */
    private String date;

    /**
     * 上传数量
     */
    private Long count;
}
