package com.video.assets.domain.manager;

import com.video.assets.domain.dataobject.AssetDO;

import java.util.List;

/**
 * 资产领域管理器
 * 负责领域内业务编排（多步操作 + 事务边界）
 */
public interface AssetManager {

    /**
     * 创建素材（素材入库 + 标签创建/关联），带事务
     */
    AssetDO createAsset(AssetDO assetDO, List<String> tagNames);
}
