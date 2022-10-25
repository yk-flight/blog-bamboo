package com.zrkizzy.blog.vo;

import lombok.Data;

/**
 * 文章分类参数对象
 *
 * @author zhangrongkang
 * @date 2022/8/18
 */
@Data
public class CategoryVO {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 分类名称
     */
    private String name;
    /**
     * 分类描述
     */
    private String description;
    /**
     * 分类图片
     */
    private String image;
    /**
     * 文章数量
     */
    private Integer articleAmount;
}
