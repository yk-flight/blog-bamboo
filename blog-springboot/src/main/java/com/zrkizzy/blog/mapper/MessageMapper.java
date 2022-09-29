package com.zrkizzy.blog.mapper;

import com.zrkizzy.blog.entity.Message;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-28
 */
public interface MessageMapper extends BaseMapper<Message> {

    /**
     * 更新所有留言用户的头像
     *
     * @param avatar 头像路径
     */
    void updateAvatar(String avatar);
}
