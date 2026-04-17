package com.video.assets.domain.manager.impl;

import com.video.assets.domain.dataobject.AssetDO;
import com.video.assets.domain.manager.AssetManager;
import com.video.assets.domain.repository.AssetRepository;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 资产领域管理器实现
 */
@Service
public class AssetManagerImpl implements AssetManager {

    @Resource
    private AssetRepository assetRepository;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public AssetDO createAsset(AssetDO assetDO, List<String> tagNames) {
        assetRepository.insert(assetDO);
        if (tagNames != null && !tagNames.isEmpty()) {
            for (String tagName : tagNames) {
                Long tagId = assetRepository.findOrCreateTag(tagName);
                assetRepository.insertAssetTag(assetDO.getId(), tagId);
            }
        }
        return assetDO;
    }
}
