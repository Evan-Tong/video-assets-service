package com.video.assets.infrastructure.repository.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.video.assets.domain.dataobject.AssetDO;
import com.video.assets.domain.dataobject.AssetTagDO;
import com.video.assets.domain.dataobject.TagDO;
import com.video.assets.domain.repository.AssetQueryCondition;
import com.video.assets.domain.repository.AssetRepository;
import com.video.assets.infrastructure.mapper.AssetMapper;
import com.video.assets.infrastructure.mapper.AssetTagMapper;
import com.video.assets.infrastructure.mapper.TagMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import com.video.assets.domain.dto.TagCountDTO;
import com.video.assets.domain.dto.UploadTrendDTO;
import com.video.assets.domain.dto.UploaderAvgSizeDTO;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.stream.Collectors;

@Repository
@RequiredArgsConstructor
public class AssetRepositoryImpl implements AssetRepository {

    private final AssetMapper assetMapper;
    private final TagMapper tagMapper;
    private final AssetTagMapper assetTagMapper;

    @Override
    public AssetDO findByAssetId(String assetId) {
        LambdaQueryWrapper<AssetDO> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(AssetDO::getAssetId, assetId);
        return assetMapper.selectOne(wrapper);
    }

    @Override
    public Page<AssetDO> findPage(AssetQueryCondition condition) {
        Page<AssetDO> page = new Page<>(condition.getPageNum(), condition.getPageSize());
        LambdaQueryWrapper<AssetDO> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(condition.getStatus() != null, AssetDO::getStatus, condition.getStatus())
                .eq(condition.getUploader() != null, AssetDO::getUploader, condition.getUploader())
                .ge(condition.getFileSizeMin() != null, AssetDO::getFileSize, condition.getFileSizeMin())
                .le(condition.getFileSizeMax() != null, AssetDO::getFileSize, condition.getFileSizeMax())
                .ge(condition.getUploadedAtStart() != null, AssetDO::getUploadedAt, condition.getUploadedAtStart())
                .le(condition.getUploadedAtEnd() != null, AssetDO::getUploadedAt, condition.getUploadedAtEnd());

        // 动态排序：有排序参数时使用自定义排序，否则默认按上传时间倒序
        List<AssetQueryCondition.SortItem> sortItems = condition.getSortItems();
        if (sortItems != null && !sortItems.isEmpty()) {
            for (AssetQueryCondition.SortItem sortItem : sortItems) {
                OrderItem orderItem = new OrderItem();
                orderItem.setColumn(sortItem.getColumn());
                orderItem.setAsc(sortItem.isAscending());
                page.addOrder(orderItem);
            }
        } else {
            page.addOrder(OrderItem.desc("uploaded_at"));
        }

        return assetMapper.selectPage(page, wrapper);
    }

    @Override
    public List<TagDO> findTagsByAssetId(Long assetId) {
        LambdaQueryWrapper<AssetTagDO> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(AssetTagDO::getAssetId, assetId);
        List<AssetTagDO> assetTags = assetTagMapper.selectList(wrapper);
        
        if (assetTags.isEmpty()) {
            return Collections.emptyList();
        }
        
        List<Long> tagIds = assetTags.stream()
                .map(AssetTagDO::getTagId)
                .collect(Collectors.toList());
        return tagMapper.selectBatchIds(tagIds);
    }

    @Override
    public Map<Long, List<TagDO>> findTagsByAssetIds(List<Long> assetIds) {
        if (assetIds == null || assetIds.isEmpty()) {
            return Collections.emptyMap();
        }

        // 一次性查出所有关联关系
        LambdaQueryWrapper<AssetTagDO> atWrapper = new LambdaQueryWrapper<>();
        atWrapper.in(AssetTagDO::getAssetId, assetIds);
        List<AssetTagDO> allAssetTags = assetTagMapper.selectList(atWrapper);
        if (allAssetTags.isEmpty()) {
            return Collections.emptyMap();
        }

        // 收集所有 tagId，一次性查出所有标签
        List<Long> allTagIds = allAssetTags.stream()
                .map(AssetTagDO::getTagId)
                .distinct()
                .collect(Collectors.toList());
        List<TagDO> allTags = tagMapper.selectBatchIds(allTagIds);
        Map<Long, TagDO> tagMap = allTags.stream()
                .collect(Collectors.toMap(TagDO::getId, t -> t));

        // 按 assetId 分组
        Map<Long, List<TagDO>> result = new HashMap<>();
        for (AssetTagDO at : allAssetTags) {
            TagDO tag = tagMap.get(at.getTagId());
            if (tag != null) {
                result.computeIfAbsent(at.getAssetId(), k -> new ArrayList<>()).add(tag);
            }
        }
        return result;
    }

    @Override
    public Long countByStatus(String status) {
        LambdaQueryWrapper<AssetDO> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(AssetDO::getStatus, status);
        return assetMapper.selectCount(wrapper);
    }

    @Override
    public List<UploaderAvgSizeDTO> getUploaderAvgSize() {
        return assetMapper.selectUploaderAvgSize();
    }

    @Override
    public List<TagCountDTO> getTopTags(int limit) {
        return tagMapper.selectTopTags(limit);
    }

    @Override
    public List<UploadTrendDTO> getUploadTrend() {
        return assetMapper.selectUploadTrend();
    }

    @Override
    public void insert(AssetDO assetDO) {
        assetMapper.insert(assetDO);
    }

    @Override
    public Long findOrCreateTag(String tagName) {
        return tagMapper.insertOrIgnore(tagName);
    }

    @Override
    public void insertAssetTag(Long assetId, Long tagId) {
        AssetTagDO assetTagDO = new AssetTagDO();
        assetTagDO.setAssetId(assetId);
        assetTagDO.setTagId(tagId);
        assetTagMapper.insert(assetTagDO);
    }
}
