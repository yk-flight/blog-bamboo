package com.zrkizzy.blog.utils;

import com.zrkizzy.blog.entity.User;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * 用户操作工具类
 *
 * @author zhangrongkang
 * @date 2022/8/13
 */
public class UserUtil {

    /**
     * 获取当前登录的用户
     *
     * @return 当前登录的用户对象
     */
    public static User getCurrentUser() {
        return (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }
}
