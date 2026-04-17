package com.video.assets.domain.repository;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.OffsetDateTime;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AssetQueryCondition {

    private String status;

    private String uploader;

    private Long fileSizeMin;

    private Long fileSizeMax;

    private OffsetDateTime uploadedAtStart;

    private OffsetDateTime uploadedAtEnd;

    private Integer pageNum;

    private Integer pageSize;

    private List<SortItem> sortItems;

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class SortItem {
        private String column;
        private boolean ascending;
    }
}
