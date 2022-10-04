package com.zrkizzy.blog.dto;

import lombok.Data;

/**
 * 哈希Map数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/10/3
 */
@Data
public class MapValueDTO {
    /**
     * 名称
     */
    private String name;
    /**
     * 值
     */
    private Integer value;
}
