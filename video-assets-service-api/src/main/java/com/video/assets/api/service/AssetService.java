package com.video.assets.api.service;

import com.video.assets.api.request.AssetCreateRequest;
import com.video.assets.api.request.AssetPageRequest;
import com.video.assets.api.vo.AssetDetailVO;
import com.video.assets.api.vo.AssetVO;
import com.video.assets.api.vo.TagCountVO;
import com.video.assets.api.vo.UploadTrendVO;
import com.video.assets.api.vo.UploaderAvgSizeVO;
import com.video.assets.shared.entity.PageResult;
import com.video.assets.shared.entity.Result;

import java.util.List;

/**
 * 素材服务接口
 */
public interface AssetService {

    /**
     * 创建素材
     */
    Result<AssetDetailVO> createAsset(AssetCreateRequest request);

    /**
     * 分页查询素材列表
     *
     * @param request 分页查询请求
     * @param fields  稀疏字段集，逗号分隔的字段名，为 null 时返回全部字段
     */
    Result<PageResult<AssetVO>> queryAssetPage(AssetPageRequest request, String fields);

    /**
     * 获取素材详情
     *
     * @param assetId 素材ID
     * @param fields  稀疏字段集，逗号分隔的字段名，为 null 时返回全部字段
     */
    Result<AssetDetailVO> getAssetDetail(String assetId, String fields);

    /**
     * 各上传人平均文件大小统计
     */
    Result<List<UploaderAvgSizeVO>> getUploaderAvgSize();

    /**
     * 热门标签统计
     */
    Result<List<TagCountVO>> getTopTags(int limit);

    /**
     * 上传趋势分析（近30天）
     */
    Result<List<UploadTrendVO>> getUploadTrend();
}
