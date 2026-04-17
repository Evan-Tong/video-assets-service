package com.video.assets.domain.repository;

import com.video.assets.domain.dataobject.TagDO;

import java.util.List;

public interface TagRepository {

    List<TagDO> findAll();

    TagDO findByName(String name);
}
