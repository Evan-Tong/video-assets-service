package com.video.assets.infrastructure.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.video.assets.domain.dataobject.AssetDO;
import com.video.assets.domain.dto.UploaderAvgSizeDTO;
import com.video.assets.domain.dto.UploadTrendDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AssetMapper extends BaseMapper<AssetDO> {

    List<UploaderAvgSizeDTO> selectUploaderAvgSize();

    List<UploadTrendDTO> selectUploadTrend();
}
