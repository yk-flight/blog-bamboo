package com.zrkizzy.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zrkizzy.blog.entity.Role;
import com.zrkizzy.blog.entity.User;
import com.zrkizzy.blog.mapper.RoleMapper;
import com.zrkizzy.blog.mapper.UserMapper;
import com.zrkizzy.blog.service.UserService;
import com.zrkizzy.blog.utils.JwtTokenUtil;
import com.zrkizzy.blog.vo.Result;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zhangrongkang
 * @date 2022/8/7
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;
    @Resource
    private RoleMapper roleMapper;

    @Value("${jwt.tokenHead}")
    private String tokenHead;

    @Resource
    private UserDetailsService userDetailsService;
    @Resource
    private PasswordEncoder passwordEncoder;
    @Resource
    private JwtTokenUtil jwtTokenUtil;

    /**
     * 通过用户名获取用户对象
     *
     * @param username 用户名
     * @return 用户对象
     */
    @Override
    public User getUserByUserName(String username) {
        return userMapper.selectOne(new QueryWrapper<User>().eq("username", username));
    }

    /**
     * 用户登录后返回token
     *
     * @param username 用户名
     * @param password 密码
     * @param code     验证码
     * @param request  请求
     * @return 携带token的返回对象
     */
    @Override
    public Result login(String username, String password, String code, HttpServletRequest request) {
        // 1. -------------------- 判断验证码 --------------------
        // 从Session中获取验证码
        String kaptcha = (String) request.getSession().getAttribute("kaptcha");
        // 判断验证码是否正确
        if (StringUtils.isEmpty(kaptcha) || !kaptcha.equals(code)) {
            return Result.error("验证码输入错误，请重新输入");
        }
        // 2. -------------------- 判断用户名和密码 --------------------
        // 获取到UserDetails
        UserDetails userDetails = userDetailsService.loadUserByUsername(username);
        // 如果userDetails为空或密码匹配不一致
        if (null == userDetails || !passwordEncoder.matches(password, userDetails.getPassword())) {
            return Result.error("用户名或密码错误");
        }

        // 3. -------------------- 判断账号是否被禁用 --------------------
        // 查看用户是否被禁用
        if (!userDetails.isEnabled()) {
            return Result.error("当前账号已禁用，请联系管理员");
        }

        // 4. -------------------- 更新用户上一次登录时间 --------------------
        updateLastLoginTime(username);

        // 更新security登录用户对象，参数1：userDetails，参数2：密码，参数3：用户权限列表
        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
        // security全局更新用户权限
        SecurityContextHolder.getContext().setAuthentication(authenticationToken);
        // 通过userDetails生成token
        String token = jwtTokenUtil.generateToken(userDetails);
        Map<String, String> tokenMap = new HashMap<>();
        // 令牌
        tokenMap.put("token", token);
        // 头部信息
        tokenMap.put("tokenHead", tokenHead);
        // 登录成功后将token返回给前端
        return Result.success("登录成功", tokenMap);
    }

    /**
     * 通过用户ID获取对应的用户权限
     *
     * @param userId 用户ID
     * @return 当前用户的权限集合
     */
    @Override
    public List<Role> getRoles(Integer userId) {
        return roleMapper.getRoles(userId);
    }

    /**
     * 更新指定用户上一次登录时间
     *
     * @param username 用户名
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateLastLoginTime(String username) {
        // 通过用户名获取到指定用户对象
        User user = getUserByUserName(username);
        // 重新设置当前用户上一次登录的时间
        user.setLastLoginTime(new Date());
        userMapper.updateById(user);
    }
}
