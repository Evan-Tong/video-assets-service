package com.video.assets.domain.repository;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.video.assets.domain.dataobject.AssetDO;
import com.video.assets.domain.dataobject.TagDO;
import com.video.assets.domain.dto.TagCountDTO;
import com.video.assets.domain.dto.UploadTrendDTO;
import com.video.assets.domain.dto.UploaderAvgSizeDTO;

import java.util.List;
import java.util.Map;

public interface AssetRepository {

    AssetDO findByAssetId(String assetId);

    IPage<AssetDO> findPage(AssetQueryCondition condition);

    List<TagDO> findTagsByAssetId(Long assetId);

    /**
     * 批量查询多个素材的标签（解决 N+1 问题）
     * @return key=assetId, value=该素材关联的标签列表
     */
    Map<Long, List<TagDO>> findTagsByAssetIds(List<Long> assetIds);

    Long countByStatus(String status);

    List<UploaderAvgSizeDTO> getUploaderAvgSize();

    List<TagCountDTO> getTopTags(int limit);

    List<UploadTrendDTO> getUploadTrend();

    /**
     * 插入素材记录
     */
    void insert(AssetDO assetDO);

    /**
     * 根据标签名查找或创建标签，返回标签ID
     */
    Long findOrCreateTag(String tagName);

    /**
     * 创建素材-标签关联
     */
    void insertAssetTag(Long assetId, Long tagId);
}
