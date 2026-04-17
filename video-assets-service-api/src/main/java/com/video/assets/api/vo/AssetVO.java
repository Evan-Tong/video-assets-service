package com.video.assets.api.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * 素材视图对象
 */
@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class AssetVO {

    private String assetId;
    private String title;
    private String description;
    private String fileUrl;
    private Long fileSize;
    private String fileFormat;
    private String status;
    private String uploader;
    private String uploadedAt;
    private List<String> tags;
    private Map<String, Object> metadata;
}
