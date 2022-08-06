package com.zrkizzy.blog.service;

import com.zrkizzy.blog.entity.User;

/**
 * 获取用户信息
 *
 * @author zhangrongkang
 * @date 2022/8/7
 */
public interface UserService {

    /**
     * 通过用户名获取用户对象
     *
     * @param username 用户名
     * @return 用户对象
     */
    User getUserByUserName(String username);
}
