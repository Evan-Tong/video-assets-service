package com.video.assets.infrastructure.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.video.assets.domain.dataobject.TagDO;
import com.video.assets.domain.dto.TagCountDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TagMapper extends BaseMapper<TagDO> {

    List<TagCountDTO> selectTopTags(@Param("limit") int limit);

    /**
     * 插入标签，若标签名已存在则忽略，返回已有记录的 ID
     */
    Long insertOrIgnore(@Param("name") String name);
}
