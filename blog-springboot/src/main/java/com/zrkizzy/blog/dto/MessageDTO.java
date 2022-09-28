package com.zrkizzy.blog.dto;

import lombok.Data;

/**
 * 留言数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/9/29
 */
@Data
public class MessageDTO {
    /**
     * 用户昵称
     */
    private String nickName;
    /**
     * 留言内容
     */
    private String content;
    /**
     * 是否通过 1 正常 0 审核中
     */
    private Integer allow;
}
