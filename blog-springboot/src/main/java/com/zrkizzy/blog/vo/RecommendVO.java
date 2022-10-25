package com.zrkizzy.blog.vo;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * 推荐文章返回对象
 *
 * @author zhangrongkang
 * @date 2022/10/19
 */
@Data
public class RecommendVO {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 博客标题
     */
    private String title;
    /**
     * 文章封面图
     */
    private String background;
    /**
     * 发表时间
     */
    private LocalDateTime publishTime;
}
