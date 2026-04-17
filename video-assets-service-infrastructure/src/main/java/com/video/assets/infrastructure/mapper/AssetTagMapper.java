package com.video.assets.infrastructure.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.video.assets.domain.dataobject.AssetTagDO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AssetTagMapper extends BaseMapper<AssetTagDO> {
}
