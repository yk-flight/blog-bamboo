package com.zrkizzy.blog.vo;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * 标签数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/9/14
 */
@Data
public class TagsVO {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 标签名称
     */
    private String name;
    /**
     * 文章数量
     */
    private Integer articleNum;
    /**
     * 创建时间
     */
    private LocalDateTime createTime;
}
