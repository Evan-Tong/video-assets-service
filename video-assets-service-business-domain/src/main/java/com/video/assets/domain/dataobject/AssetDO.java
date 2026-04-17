package com.video.assets.domain.dataobject;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.handlers.JacksonTypeHandler;
import lombok.Data;

import java.time.OffsetDateTime;

@Data
@TableName("assets")
public class AssetDO {

    @TableId(type = IdType.AUTO)
    private Long id;

    private String assetId;

    private String title;

    private String description;

    private String fileUrl;

    private Long fileSize;

    private String fileFormat;

    private String status = "pending";

    private String uploader;

    private OffsetDateTime uploadedAt;

    @TableField(typeHandler = JacksonTypeHandler.class)
    private String metadata;
}
