package com.zrkizzy.blog.vo;

import com.zrkizzy.blog.dto.TagsDTO;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 博客前台文章数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/10/19
 */
@Data
public class ArticlesVO {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 博客标题
     */
    private String title;
    /**
     * 博客分类
     */
    private Integer category;
    /**
     * 分类名称
     */
    private String categoryName;
    /**
     * 发表时间
     */
    private LocalDateTime publishTime;
    /**
     * 标签
     */
    private List<TagsDTO> tags;
    /**
     * 摘要
     */
    private String summary;
    /**
     * 是否置顶
     */
    private Boolean top;
    /**
     * 文章封面图
     */
    private String background;
}
