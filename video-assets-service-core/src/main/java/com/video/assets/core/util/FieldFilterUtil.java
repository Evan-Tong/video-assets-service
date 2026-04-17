package com.video.assets.core.util;

import lombok.extern.slf4j.Slf4j;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * 稀疏字段集过滤工具类。
 * 根据指定的字段名列表，将 VO 对象中非指定字段置为 null，
 * 配合 @JsonInclude(NON_NULL) 实现只返回请求的字段。
 */
@Slf4j
public final class FieldFilterUtil {

    private FieldFilterUtil() {
    }

    /** 始终保留的字段（业务标识字段不应被过滤掉） */
    private static final Set<String> ALWAYS_KEEP_FIELDS = Set.of("assetId");

    /**
     * 解析逗号分隔的 fields 字符串为字段名集合
     *
     * @param fieldsParam 逗号分隔的字段名，如 "title,status,uploader"
     * @return 字段名集合，若输入为空则返回 null（表示不过滤）
     */
    public static Set<String> parseFields(String fieldsParam) {
        if (fieldsParam == null || fieldsParam.isBlank()) {
            return null;
        }
        return Arrays.stream(fieldsParam.split(","))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .collect(Collectors.toSet());
    }

    /**
     * 对单个 VO 对象执行字段过滤，将非指定字段置为 null
     *
     * @param vo            要过滤的 VO 对象
     * @param requestedFields 请求的字段名集合，为 null 时不做任何过滤
     * @param <T>           VO 类型
     * @return 过滤后的 VO 对象（原对象被修改）
     */
    public static <T> T filterFields(T vo, Set<String> requestedFields) {
        if (vo == null || requestedFields == null || requestedFields.isEmpty()) {
            return vo;
        }

        Set<String> fieldsToKeep = new java.util.HashSet<>(requestedFields);
        fieldsToKeep.addAll(ALWAYS_KEEP_FIELDS);

        Class<?> clazz = vo.getClass();
        while (clazz != null && clazz != Object.class) {
            for (Field field : clazz.getDeclaredFields()) {
                if (!fieldsToKeep.contains(field.getName())) {
                    try {
                        field.setAccessible(true);
                        field.set(vo, null);
                    } catch (IllegalAccessException e) {
                        log.warn("无法置空字段 {}: {}", field.getName(), e.getMessage());
                    }
                }
            }
            clazz = clazz.getSuperclass();
        }
        return vo;
    }

    /**
     * 对 VO 列表执行字段过滤
     *
     * @param voList          要过滤的 VO 列表
     * @param requestedFields 请求的字段名集合，为 null 时不做任何过滤
     * @param <T>             VO 类型
     * @return 过滤后的 VO 列表（原列表中的对象被修改）
     */
    public static <T> List<T> filterFieldsList(List<T> voList, Set<String> requestedFields) {
        if (voList == null || requestedFields == null || requestedFields.isEmpty()) {
            return voList;
        }
        voList.forEach(vo -> filterFields(vo, requestedFields));
        return voList;
    }
}
