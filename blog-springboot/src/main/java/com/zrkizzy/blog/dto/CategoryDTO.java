package com.zrkizzy.blog.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 文章分类表
 *
 * @author zhangrongkang
 * @date 2022/8/18
 */
@Data
public class CategoryDTO implements Serializable {
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
     * 包含文章数
     */
    private Integer articleAmount;
    /**
     * 分类图片
     */
    private String image;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 更新时间
     */
    private Date updateTime;
}
