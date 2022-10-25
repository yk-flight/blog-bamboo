package com.zrkizzy.blog.dto;

import lombok.Data;

/**
 * 友链数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/10/16
 */
@Data
public class LinksDTO {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 网站名称
     */
    private String title;
    /**
     * 网站地址
     */
    private String website;
    /**
     * 网站图标
     */
    private String logo;
    /**
     * 网站描述
     */
    private String description;
}
