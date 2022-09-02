package com.zrkizzy.blog.service;

import com.zrkizzy.blog.entity.Role;
import com.zrkizzy.blog.entity.User;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.PasswordVO;
import com.zrkizzy.blog.vo.param.UserInfoVO;

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

    /**
     * 更新指定用户上一次登录信息
     *
     * @param username 用户名
     * @param request 请求信息
     */
    void updateLastLoginInfo(String username, HttpServletRequest request);

    /**
     * 获取当前登录的用户信息
     *
     * @return 当前登录的用户对象
     */
    User getUserByUserId();

    /**
     * 获取用户登录设备
     *
     * @param request 请求信息
     * @return 用户登录设备
     */
    String getUserAgent(HttpServletRequest request);

    /**
     * 用户更新密码
     *
     * @param passwordVO 用户密码参数对象
     * @return 返回结果对象
     */
    Result updatePassword(PasswordVO passwordVO);

    /**
     * 获取用户列表
     *
     * @param curPage 当前页面
     * @param size 页面大小
     * @param username 用户名
     * @return 分页对象
     */
    PageVO getUserList(Integer curPage, Integer size, String username);

    /**
     * 新增用户
     *
     * @param userInfoVO 用户数据传递对象
     * @return 前端响应对象
     */
    Result addUser(UserInfoVO userInfoVO);

    /**
     * 根据用户ID删除用户
     *
     * @param userId 用户ID
     * @return 前端响应对象
     */
    Result deleteUserById(Integer userId);

    /**
     * 根据用户ID修改密码
     *
     * @param userId 用户ID
     * @param password 新密码
     * @return 前端响应对象
     */
    Result updatePasswordById(Integer userId, String password);
}
