package com.video.assets.infrastructure.repository.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.video.assets.domain.dataobject.TagDO;
import com.video.assets.domain.repository.TagRepository;
import com.video.assets.infrastructure.mapper.TagMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class TagRepositoryImpl implements TagRepository {

    private final TagMapper tagMapper;

    @Override
    public List<TagDO> findAll() {
        return tagMapper.selectList(null);
    }

    @Override
    public TagDO findByName(String name) {
        LambdaQueryWrapper<TagDO> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(TagDO::getName, name);
        return tagMapper.selectOne(wrapper);
    }
}
