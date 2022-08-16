package com.zrkizzy.blog.service;

import com.zrkizzy.blog.entity.UserInfo;

/**
 * @author zhangrongkang
 * @date 2022/8/15
 */
public interface UserInfoService {
    /**
     * 通过用户ID获取用户个人信息
     *
     * @return 用户个人信息
     */
    UserInfo getUserInfoById();
}
