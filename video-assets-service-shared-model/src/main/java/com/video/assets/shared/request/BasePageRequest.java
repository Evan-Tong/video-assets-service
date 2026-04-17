package com.video.assets.shared.request;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import lombok.Data;

@Data
public class BasePageRequest {

    @Min(value = 1, message = "页码不能小于1")
    private Integer pageNum = 1;

    @Min(value = 1, message = "每页条数不能小于1")
    @Max(value = 100, message = "每页条数不能超过100")
    private Integer pageSize = 20;

    /**
     * 排序规则，格式：字段名:排序方向，多个用逗号分隔。
     * 示例：uploaded_at:desc,file_size:asc
     */
    private String sort;
}
