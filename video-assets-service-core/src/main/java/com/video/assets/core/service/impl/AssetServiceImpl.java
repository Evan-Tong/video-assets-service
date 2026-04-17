package com.video.assets.core.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.video.assets.api.request.AssetCreateRequest;
import com.video.assets.api.request.AssetPageRequest;
import com.video.assets.api.service.AssetService;
import com.video.assets.api.vo.AssetDetailVO;
import com.video.assets.api.vo.AssetVO;
import com.video.assets.api.vo.TagCountVO;
import com.video.assets.api.vo.UploadTrendVO;
import com.video.assets.api.vo.UploaderAvgSizeVO;
import com.video.assets.core.convert.AssetConverter;
import com.video.assets.core.util.FieldFilterUtil;
import com.video.assets.domain.cache.CacheService;
import com.video.assets.domain.dataobject.AssetDO;
import com.video.assets.domain.dto.TagCountDTO;
import com.video.assets.domain.dataobject.TagDO;
import com.video.assets.domain.dto.UploadTrendDTO;
import com.video.assets.domain.dto.UploaderAvgSizeDTO;
import com.video.assets.domain.manager.AssetManager;
import com.video.assets.domain.repository.AssetRepository;
import com.video.assets.domain.repository.AssetQueryCondition;
import com.video.assets.domain.repository.AssetQueryCondition.SortItem;
import com.video.assets.shared.entity.PageResult;
import com.video.assets.shared.entity.Result;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

/**
 * 素材服务实现
 */
@Service
@Slf4j
public class AssetServiceImpl implements AssetService {

    private static final String CACHE_KEY_PREFIX = "asset:detail:";
    private static final String CACHE_KEY_UPLOADER_AVG = "stats:uploader-avg-size";
    private static final String CACHE_KEY_TOP_TAGS_PREFIX = "stats:top-tags:";
    private static final String CACHE_KEY_UPLOAD_TREND = "stats:upload-trend";
    /** 统计缓存 TTL：10 分钟 */
    private static final long STATS_CACHE_TTL_MINUTES = 10;

    @Resource
    private ObjectMapper objectMapper;

    @Resource
    private AssetManager assetManager;

    @Resource
    private AssetRepository assetRepository;

    @Resource
    private AssetConverter assetConverter;

    @Resource
    private CacheService cacheService;

    private static final Set<String> SORTABLE_COLUMNS = Set.of(
            "uploaded_at", "file_size", "title", "status", "uploader"
    );

    @Override
    public Result<AssetDetailVO> createAsset(AssetCreateRequest request) {
        // 1. 构建 AssetDO
        AssetDO assetDO = new AssetDO();
        assetDO.setAssetId(UUID.randomUUID().toString().replace("-", "").substring(0, 16).toUpperCase());
        assetDO.setTitle(request.getTitle());
        assetDO.setDescription(request.getDescription());
        assetDO.setFileUrl(request.getFileUrl());
        assetDO.setFileSize(request.getFileSize());
        assetDO.setFileFormat(request.getFileFormat());
        assetDO.setUploader(request.getUploader());

        // 处理 metadata
        Map<String, Object> metadata = request.getMetadata();
        if (metadata != null && !metadata.isEmpty()) {
            try {
                assetDO.setMetadata(objectMapper.writeValueAsString(metadata));
            } catch (JsonProcessingException e) {
                log.warn("metadata 序列化失败: {}", e.getMessage());
                assetDO.setMetadata("{}");
            }
        }

        // 2. 写入数据库（缓存启用时执行延迟双删）
        if (cacheService.isEnabled()) {
            String cacheKey = CACHE_KEY_PREFIX + assetDO.getAssetId();
            cacheService.delete(cacheKey);
        }

        // 3. 写入数据库
        AssetDO createdAsset = assetManager.createAsset(assetDO, request.getTags());
        log.info("素材创建成功, assetId={}", createdAsset.getAssetId());

        // 4. 延迟双删
        if (cacheService.isEnabled()) {
            cacheService.delayedDelete(CACHE_KEY_PREFIX + createdAsset.getAssetId());
            // 清理统计类缓存，确保统计数据及时更新
            cacheService.delete(CACHE_KEY_UPLOADER_AVG);
            cacheService.deleteByPrefix(CACHE_KEY_TOP_TAGS_PREFIX);
            cacheService.delete(CACHE_KEY_UPLOAD_TREND);
        }

        // 5. 构建返回 VO
        AssetDetailVO detailVO = assetConverter.toDetailVO(createdAsset);
        if (request.getTags() != null && !request.getTags().isEmpty()) {
            detailVO.setTags(request.getTags());
        }

        return Result.success(detailVO);
    }

    @Override
    public Result<PageResult<AssetVO>> queryAssetPage(AssetPageRequest request, String fields) {
        log.info("查询素材列表, sort参数: {}, fields: {}", request.getSort(), fields);
        Set<String> requestedFields = FieldFilterUtil.parseFields(fields);

        // 1. 转换查询条件
        AssetQueryCondition condition = assetConverter.toCondition(request);

        // 2. 解析排序参数
        List<SortItem> sortItems = parseSortParam(request.getSort());
        log.info("解析后的排序条件: {}", sortItems);
        condition.setSortItems(sortItems);

        // 3. 执行分页查询
        IPage<AssetDO> page = assetRepository.findPage(condition);

        // 4. 批量查询标签
        List<Long> assetDbIds = page.getRecords().stream()
                .map(AssetDO::getId)
                .collect(Collectors.toList());
        Map<Long, List<TagDO>> tagsMap = assetRepository.findTagsByAssetIds(assetDbIds);

        // 5. 转换 VO 并填充标签
        List<AssetVO> voList = page.getRecords().stream()
                .map(assetDO -> {
                    AssetVO vo = assetConverter.toVO(assetDO);
                    List<TagDO> tags = tagsMap.getOrDefault(assetDO.getId(), Collections.emptyList());
                    if (!tags.isEmpty()) {
                        vo.setTags(tags.stream().map(TagDO::getName).collect(Collectors.toList()));
                    }
                    return vo;
                })
                .collect(Collectors.toList());

        // 6. 稀疏字段过滤
        FieldFilterUtil.filterFieldsList(voList, requestedFields);

        // 7. 返回分页结果
        PageResult<AssetVO> pageResult = PageResult.of(
                voList, page.getTotal(), (int) page.getCurrent(), (int) page.getSize());
        return Result.success(pageResult);
    }

    @Override
    public Result<AssetDetailVO> getAssetDetail(String assetId, String fields) {
        Set<String> requestedFields = FieldFilterUtil.parseFields(fields);

        // 1. 缓存启用时，先查 Redis 缓存
        if (cacheService.isEnabled()) {
            String cacheKey = CACHE_KEY_PREFIX + assetId;
            String cachedJson = cacheService.get(cacheKey);
            if (cachedJson != null) {
                if (cacheService.isNullPlaceholder(cachedJson)) {
                    return Result.fail("素材不存在");
                }
                try {
                    AssetDetailVO cachedVO = objectMapper.readValue(cachedJson, AssetDetailVO.class);
                    FieldFilterUtil.filterFields(cachedVO, requestedFields);
                    log.info("从缓存获取素材详情, assetId={}", assetId);
                    return Result.success(cachedVO);
                } catch (JsonProcessingException e) {
                    log.warn("缓存反序列化失败, assetId={}: {}", assetId, e.getMessage());
                    cacheService.delete(cacheKey);
                }
            }
        }

        // 2. 缓存未命中或缓存禁用，查数据库
        AssetDO assetDO = assetRepository.findByAssetId(assetId);
        if (assetDO == null) {
            if (cacheService.isEnabled()) {
                cacheService.setNull(CACHE_KEY_PREFIX + assetId);
            }
            return Result.fail("素材不存在");
        }

        // 3. 转换为 DetailVO
        AssetDetailVO detailVO = assetConverter.toDetailVO(assetDO);

        // 4. 填充标签
        List<TagDO> tags = assetRepository.findTagsByAssetId(assetDO.getId());
        if (tags != null && !tags.isEmpty()) {
            detailVO.setTags(tags.stream().map(TagDO::getName).collect(Collectors.toList()));
        }

        // 5. 缓存启用时，写入 Redis 缓存（缓存完整 VO，字段过滤在返回前做）
        if (cacheService.isEnabled()) {
            try {
                String jsonValue = objectMapper.writeValueAsString(detailVO);
                cacheService.set(CACHE_KEY_PREFIX + assetId, jsonValue);
                log.info("素材详情写入缓存, assetId={}", assetId);
            } catch (JsonProcessingException e) {
                log.warn("缓存序列化失败, assetId={}: {}", assetId, e.getMessage());
            }
        }

        // 6. 稀疏字段过滤
        FieldFilterUtil.filterFields(detailVO, requestedFields);

        return Result.success(detailVO);
    }

    @Override
    public Result<List<UploaderAvgSizeVO>> getUploaderAvgSize() {
        // 缓存启用时，先查缓存
        if (cacheService.isEnabled()) {
            String cached = cacheService.get(CACHE_KEY_UPLOADER_AVG);
            if (cached != null) {
                try {
                    List<UploaderAvgSizeVO> voList = objectMapper.readValue(cached,
                            objectMapper.getTypeFactory().constructCollectionType(List.class, UploaderAvgSizeVO.class));
                    log.info("从缓存获取上传人平均文件大小统计");
                    return Result.success(voList);
                } catch (JsonProcessingException e) {
                    log.warn("统计缓存反序列化失败: {}", e.getMessage());
                    cacheService.delete(CACHE_KEY_UPLOADER_AVG);
                }
            }
        }

        List<UploaderAvgSizeDTO> dtoList = assetRepository.getUploaderAvgSize();
        List<UploaderAvgSizeVO> voList = dtoList.stream().map(dto -> {
            UploaderAvgSizeVO vo = new UploaderAvgSizeVO();
            vo.setUploader(dto.getUploader());
            vo.setAvgSize(dto.getAvgSize());
            return vo;
        }).toList();

        // 缓存启用时，写入缓存
        if (cacheService.isEnabled()) {
            try {
                cacheService.set(CACHE_KEY_UPLOADER_AVG, objectMapper.writeValueAsString(voList), STATS_CACHE_TTL_MINUTES);
            } catch (JsonProcessingException e) {
                log.warn("统计缓存序列化失败: {}", e.getMessage());
            }
        }
        return Result.success(voList);
    }

    @Override
    public Result<List<TagCountVO>> getTopTags(int limit) {
        String cacheKey = CACHE_KEY_TOP_TAGS_PREFIX + limit;

        // 缓存启用时，先查缓存
        if (cacheService.isEnabled()) {
            String cached = cacheService.get(cacheKey);
            if (cached != null) {
                try {
                    List<TagCountVO> voList = objectMapper.readValue(cached,
                            objectMapper.getTypeFactory().constructCollectionType(List.class, TagCountVO.class));
                    log.info("从缓存获取热门标签统计, limit={}", limit);
                    return Result.success(voList);
                } catch (JsonProcessingException e) {
                    log.warn("统计缓存反序列化失败: {}", e.getMessage());
                    cacheService.delete(cacheKey);
                }
            }
        }

        List<TagCountDTO> dtoList = assetRepository.getTopTags(limit);
        List<TagCountVO> voList = dtoList.stream().map(dto -> {
            TagCountVO vo = new TagCountVO();
            vo.setName(dto.getName());
            vo.setCount(dto.getCount());
            return vo;
        }).toList();

        // 缓存启用时，写入缓存
        if (cacheService.isEnabled()) {
            try {
                cacheService.set(cacheKey, objectMapper.writeValueAsString(voList), STATS_CACHE_TTL_MINUTES);
            } catch (JsonProcessingException e) {
                log.warn("统计缓存序列化失败: {}", e.getMessage());
            }
        }
        return Result.success(voList);
    }

    @Override
    public Result<List<UploadTrendVO>> getUploadTrend() {
        // 缓存启用时，先查缓存
        if (cacheService.isEnabled()) {
            String cached = cacheService.get(CACHE_KEY_UPLOAD_TREND);
            if (cached != null) {
                try {
                    List<UploadTrendVO> voList = objectMapper.readValue(cached,
                            objectMapper.getTypeFactory().constructCollectionType(List.class, UploadTrendVO.class));
                    log.info("从缓存获取上传趋势统计");
                    return Result.success(voList);
                } catch (JsonProcessingException e) {
                    log.warn("统计缓存反序列化失败: {}", e.getMessage());
                    cacheService.delete(CACHE_KEY_UPLOAD_TREND);
                }
            }
        }

        List<UploadTrendDTO> dtoList = assetRepository.getUploadTrend();
        List<UploadTrendVO> voList = dtoList.stream().map(dto -> {
            UploadTrendVO vo = new UploadTrendVO();
            vo.setDate(dto.getDate());
            vo.setCount(dto.getCount());
            return vo;
        }).toList();

        // 缓存启用时，写入缓存
        if (cacheService.isEnabled()) {
            try {
                cacheService.set(CACHE_KEY_UPLOAD_TREND, objectMapper.writeValueAsString(voList), STATS_CACHE_TTL_MINUTES);
            } catch (JsonProcessingException e) {
                log.warn("统计缓存序列化失败: {}", e.getMessage());
            }
        }
        return Result.success(voList);
    }

    /**
     * 解析排序参数，格式：field1:asc,field2:desc
     */
    private List<SortItem> parseSortParam(String sort) {
        if (sort == null || sort.isBlank()) {
            return null;
        }
        String cleanedSort = sort.strip().replaceAll("^\"|\"$", "");
        if (cleanedSort.isBlank()) {
            return null;
        }
        return Arrays.stream(cleanedSort.split(","))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .map(this::parseSingleSortItem)
                .filter(item -> item != null)
                .collect(Collectors.toList());
    }

    private SortItem parseSingleSortItem(String sortExpression) {
        String[] parts = sortExpression.split(":");
        String column = parts[0].trim().toLowerCase().replaceAll("\"", "");
        if (!SORTABLE_COLUMNS.contains(column)) {
            log.warn("不支持的排序字段: {}", column);
            return null;
        }
        boolean ascending = parts.length < 2 || "asc".equalsIgnoreCase(parts[1].trim());
        return SortItem.builder().column(column).ascending(ascending).build();
    }
}
