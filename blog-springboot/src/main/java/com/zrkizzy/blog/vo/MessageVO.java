package com.zrkizzy.blog.vo;

import lombok.Data;

/**
 * 留言数据传递对象
 *
 * @author zhangrongkang
 * @date 2022/10/17
 */
@Data
public class MessageVO {
    /**
     * 用户昵称
     */
    private String nickName;
    /**
     * 留言内容
     */
    private String content;
}
