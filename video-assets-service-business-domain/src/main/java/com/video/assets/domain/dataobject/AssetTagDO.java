package com.video.assets.domain.dataobject;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("asset_tags")
public class AssetTagDO {

    private Long assetId;

    private Long tagId;
}
