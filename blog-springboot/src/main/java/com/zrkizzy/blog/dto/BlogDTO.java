package com.zrkizzy.blog.dto;

import com.zrkizzy.blog.entity.Comment;
import com.zrkizzy.blog.entity.Message;
import com.zrkizzy.blog.entity.OperateLog;
import lombok.Data;

import java.util.List;

/**
 * 博客仪表盘数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/10/3
 */
@Data
public class BlogDTO {
    /**
     * 最新评论
     */
    private List<Comment> comments;
    /**
     * 最新动态
     */
    private List<OperateLog> operateLogs;
    /**
     * 文章所有标签
     */
    private List<String> tags;
    /**
     * 文章所有分类，<分类名，文章数>
     */
    private List<MapValueDTO>  categories;
    /**
     * 访问数量
     */
    private Integer accessNum;
    /**
     * 文章数量
     */
    private Integer articleNum;
    /**
     * 留言数量
     */
    private Integer messageNum;
    /**
     * 用户数量
     */
    private Integer userNum;
    /**
     * 最新留言
     */
    private List<Message> messages;
}
