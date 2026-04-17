package com.video.assets.api.controller;

import com.video.assets.api.request.AssetCreateRequest;
import com.video.assets.api.request.AssetPageRequest;
import com.video.assets.api.service.AssetService;
import com.video.assets.api.vo.AssetDetailVO;
import com.video.assets.api.vo.AssetVO;
import com.video.assets.api.vo.UploaderAvgSizeVO;
import com.video.assets.api.vo.TagCountVO;
import com.video.assets.api.vo.UploadTrendVO;
import com.video.assets.shared.entity.PageResult;
import com.video.assets.shared.entity.Result;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/assets")
@Tag(name = "素材管理", description = "视频素材查询接口")
public class AssetController {

    @Resource
    private AssetService assetService;

    @PostMapping("")
    @Operation(summary = "创建素材")
    public Result<AssetDetailVO> createAsset(@Valid @RequestBody AssetCreateRequest request) {
        return assetService.createAsset(request);
    }

    @GetMapping("")
    @Operation(summary = "分页查询素材列表")
    public Result<PageResult<AssetVO>> queryAssetPage(
            @Valid @ModelAttribute AssetPageRequest request,
            @RequestParam(required = false) String fields) {
        return assetService.queryAssetPage(request, fields);
    }

    @GetMapping("/{assetId}")
    @Operation(summary = "查询素材详情")
    public Result<AssetDetailVO> getAssetDetail(
            @PathVariable String assetId,
            @RequestParam(required = false) String fields) {
        return assetService.getAssetDetail(assetId, fields);
    }

    @GetMapping("/stats/uploader-avg-size")
    @Operation(summary = "各上传人平均文件大小统计")
    public Result<List<UploaderAvgSizeVO>> getUploaderAvgSize() {
        return assetService.getUploaderAvgSize();
    }

    @GetMapping("/stats/top-tags")
    @Operation(summary = "热门标签统计")
    public Result<List<TagCountVO>> getTopTags(@RequestParam(defaultValue = "5") int limit) {
        return assetService.getTopTags(limit);
    }

    @GetMapping("/stats/upload-trend")
    @Operation(summary = "上传趋势分析（近30天）")
    public Result<List<UploadTrendVO>> getUploadTrend() {
        return assetService.getUploadTrend();
    }
}