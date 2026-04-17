package com.video.assets.api.request;

import com.video.assets.shared.request.BasePageRequest;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 素材分页查询请求
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class AssetPageRequest extends BasePageRequest {
    private String status;
    private String uploader;
    private Long fileSizeMin;
    private Long fileSizeMax;
    private String uploadedAtStart;
    private String uploadedAtEnd;
}
