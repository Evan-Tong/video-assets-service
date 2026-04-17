package com.video.assets.api.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;
import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * 创建素材请求
 */
@Data
public class AssetCreateRequest {

    /** 素材标题 */
    @NotBlank(message = "素材标题不能为空")
    @Size(max = 500, message = "标题长度不能超过500")
    private String title;

    /** 描述信息 */
    private String description;

    /** 文件存储路径 */
    private String fileUrl;

    /** 文件大小（字节） */
    @Positive(message = "文件大小必须为正数")
    private Long fileSize;

    /** 文件格式 */
    private String fileFormat;

    /** 视频时长（秒） */
    @Positive(message = "视频时长必须为正数")
    private Integer duration;

    /** 上传人 */
    @NotBlank(message = "上传人不能为空")
    private String uploader;

    /** 标签列表 */
    private List<String> tags;

    /** 扩展字段 */
    private Map<String, Object> metadata;
}
