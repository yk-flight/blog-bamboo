package com.zrkizzy.blog.dto;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * 关于我数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/9/26
 */
@Data
public class AboutDto {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 内容
     */
    private String content;
    /**
     * 上一次更新时间
     */
    private LocalDateTime updateTime;
}
