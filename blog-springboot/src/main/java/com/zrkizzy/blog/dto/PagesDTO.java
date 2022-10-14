package com.zrkizzy.blog.dto;

import lombok.Data;

/**
 * @author zhangrongkang
 * @date 2022/10/13
 */
@Data
public class PagesDTO {
    /**
     * 页面名称
     */
    private String title;
    /**
     * 页面标签
     */
    private String label;
    /**
     * 页面图片
     */
    private String image;
    /**
     * 页面路径
     */
    private String path;
}
