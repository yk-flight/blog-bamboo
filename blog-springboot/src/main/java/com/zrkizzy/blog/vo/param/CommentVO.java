package com.zrkizzy.blog.vo.param;

import lombok.Data;

/**
 * 评论数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/9/29
 */
@Data
public class CommentVO {
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
     * 评论文章
     */
    private Integer articleId;
    /**
     * 用户身份
     */
    private Integer identity;
    /**
     * 回复人
     */
    private String replyName;
}
