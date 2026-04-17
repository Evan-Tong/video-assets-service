package com.video.assets.domain.util;

import com.video.assets.domain.constants.DomainConstants;

public class PageUtil {

    public static Integer sanitizePageNum(Integer pageNum) {
        if (pageNum == null || pageNum < 1) {
            return 1;
        }
        return pageNum;
    }

    public static Integer sanitizePageSize(Integer pageSize) {
        if (pageSize == null || pageSize < 1) {
            return DomainConstants.DEFAULT_PAGE_SIZE;
        }
        if (pageSize > DomainConstants.MAX_PAGE_SIZE) {
            return DomainConstants.MAX_PAGE_SIZE;
        }
        return pageSize;
    }
}
