package com.video.assets.core.convert;

import com.video.assets.core.util.JsonUtils;
import com.video.assets.domain.dataobject.AssetDO;
import com.video.assets.domain.repository.AssetQueryCondition;
import com.video.assets.api.request.AssetPageRequest;
import com.video.assets.api.vo.AssetDetailVO;
import com.video.assets.api.vo.AssetVO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;

import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Map;

/**
 * MapStruct 对象转换器
 */
@Mapper(componentModel = "spring")
public interface AssetConverter {

    DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    /**
     * AssetDO 转 AssetVO
     */
    @Mapping(source = "uploadedAt", target = "uploadedAt", qualifiedByName = "localDateTimeToString")
    @Mapping(source = "metadata", target = "metadata", qualifiedByName = "jsonStringToMap")
    @Mapping(target = "tags", ignore = true)
    AssetVO toVO(AssetDO assetDO);

    /**
     * AssetDO 转 AssetDetailVO
     */
    @Mapping(source = "uploadedAt", target = "uploadedAt", qualifiedByName = "localDateTimeToString")
    @Mapping(source = "metadata", target = "metadata", qualifiedByName = "jsonStringToMap")
    @Mapping(target = "tags", ignore = true)
    AssetDetailVO toDetailVO(AssetDO assetDO);

    /**
     * AssetPageRequest 转 AssetQueryCondition
     */
    @Mapping(source = "uploadedAtStart", target = "uploadedAtStart", qualifiedByName = "dateStringToLocalDateTime")
    @Mapping(source = "uploadedAtEnd", target = "uploadedAtEnd", qualifiedByName = "dateStringToEndOfDay")
    AssetQueryCondition toCondition(AssetPageRequest request);

    /**
     * OffsetDateTime 转 String
     */
    @Named("localDateTimeToString")
    default String localDateTimeToString(OffsetDateTime dateTime) {
        if (dateTime == null) {
            return null;
        }
        return dateTime.format(DATE_TIME_FORMATTER);
    }

    /**
     * JSON String 转 Map
     */
    @Named("jsonStringToMap")
    default Map<String, Object> jsonStringToMap(String jsonString) {
        return JsonUtils.parseToMap(jsonString);
    }

    /**
     * 日期字符串转 OffsetDateTime（当天开始时间）
     */
    @Named("dateStringToLocalDateTime")
    default OffsetDateTime dateStringToLocalDateTime(String dateString) {
        if (dateString == null || dateString.isEmpty()) {
            return null;
        }
        LocalDate localDate = LocalDate.parse(dateString, DATE_FORMATTER);
        return localDate.atStartOfDay(ZoneId.systemDefault()).toOffsetDateTime();
    }

    /**
     * 日期字符串转 OffsetDateTime（当天结束时间）
     */
    @Named("dateStringToEndOfDay")
    default OffsetDateTime dateStringToEndOfDay(String dateString) {
        if (dateString == null || dateString.isEmpty()) {
            return null;
        }
        LocalDate localDate = LocalDate.parse(dateString, DATE_FORMATTER);
        return localDate.atTime(23, 59, 59).atZone(ZoneId.systemDefault()).toOffsetDateTime();
    }
}
