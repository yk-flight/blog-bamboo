package com.zrkizzy.blog.service;

import com.zrkizzy.blog.entity.UserInfo;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.UserInfoVO;
import org.springframework.transaction.annotation.Transactional;

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

    /**
     * 更新登录用户的个人信息
     *
     * @param userInfoVO 用户信息对象
     * @return 前端返回对象
     */
    Result updateUserInfo(UserInfoVO userInfoVO);
}
