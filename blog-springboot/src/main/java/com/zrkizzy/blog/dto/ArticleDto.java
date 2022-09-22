package com.zrkizzy.blog.dto;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 文章数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/9/21
 */
@Data
public class ArticleDto {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 博客标题
     */
    private String title;
    /**
     * 博客分类名称
     */
    private String categoryName;
    /**
     * 发表时间
     */
    private LocalDateTime publishTime;
    /**
     * 标签
     */
    private List<String> tags;
    /**
     * 摘要
     */
    private String summary;
    /**
     * 文章内容
     */
    private String contentMd;
    /**
     * 文章类型名称
     */
    private Integer type;
    /**
     * 文章状态
     */
    private Integer state;
    /**
     * 是否在回收站
     */
    private Boolean deleted;
    /**
     * 是否开启评论
     */
    private Boolean allowComment;
    /**
     * 是否置顶
     */
    private Boolean top;
    /**
     * 文章封面图
     */
    private String background;
    /**
     * 浏览数量
     */
    private Integer viewNum;
    /**
     * 评论数量
     */
    private Integer commentNum;
    /**
     * 更新时间
     */
    private LocalDateTime updateTime;
}
