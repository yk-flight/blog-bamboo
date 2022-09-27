package com.zrkizzy.blog.dto;

import lombok.Data;

/**
 * 标签数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/9/20
 */
@Data
public class TagsDTO {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 标签名称
     */
    private String name;
}
