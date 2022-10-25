package com.zrkizzy.blog.vo;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * 友链信息数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/9/24
 */
@Data
public class LinksVO {
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
    /**
     * 创建时间
     */
    private LocalDateTime createTime;
}
