package com.zrkizzy.blog.vo.param;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * 文章归档数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/10/14
 */
@Data
public class ArchiveVO {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 博客标题
     */
    private String title;
    /**
     * 发表时间
     */
    private LocalDateTime publishTime;
    /**
     * 文章封面图
     */
    private String background;
}
