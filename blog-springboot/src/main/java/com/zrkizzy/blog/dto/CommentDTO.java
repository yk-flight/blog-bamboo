package com.zrkizzy.blog.dto;

import com.zrkizzy.blog.entity.Comment;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 评论数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/9/29
 */
@Data
public class CommentDTO {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 评论内容
     */
    private String content;
    /**
     * 用户昵称
     */
    private String nickName;
    /**
     * 父id
     */
    private Integer parentId;
    /**
     * 评论时间
     */
    private LocalDateTime commentTime;
    /**
     * 是否通过
     */
    private Integer allow;
    /**
     * IP地址
     */
    private String ipAddress;
    /**
     * IP属地
     */
    private String ipSource;
    /**
     * 回复评论
     */
    private List<Comment> children;
    /**
     * 用户身份
     */
    private Integer identity;
    /**
     * 评论文章
     */
    private Integer articleId;
}
