package com.zrkizzy.blog.service;

import com.zrkizzy.blog.entity.Role;
import com.zrkizzy.blog.entity.User;
import com.zrkizzy.blog.vo.Result;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

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

    /**
     * 用户登录后返回token
     *
     * @param username 用户名
     * @param password 密码
     * @param code 验证码
     * @param request 请求
     * @return 携带token的返回对象
     */
    Result login(String username, String password, String code, HttpServletRequest request);

    /**
     * 通过用户ID获取对应的用户权限
     *
     * @param userId 用户ID
     * @return 当前用户的权限集合
     */
    List<Role> getRoles(Integer userId);
}
