package com.zrkizzy.blog.vo;

import lombok.Data;

/**
 * 页面信息数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/9/24
 */
@Data
public class PagesVO {
    /**
     * 主键
     */
    private Integer id;
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
