package com.zrkizzy.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zrkizzy.blog.entity.Role;
import com.zrkizzy.blog.entity.User;
import com.zrkizzy.blog.mapper.MenuMapper;
import com.zrkizzy.blog.mapper.RoleMapper;
import com.zrkizzy.blog.mapper.UserMapper;
import com.zrkizzy.blog.service.UserService;
import com.zrkizzy.blog.utils.IpUtil;
import com.zrkizzy.blog.utils.JwtTokenUtil;
import com.zrkizzy.blog.utils.UserUtil;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.PasswordVO;
import eu.bitwalker.useragentutils.UserAgent;
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

import static com.zrkizzy.blog.constant.CommonConst.LOCAL_HOST;

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
    @Resource
    private MenuMapper menuMapper;

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
        updateLastLoginInfo(username, request);

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
    public void updateLastLoginInfo(String username, HttpServletRequest request) {
        // 通过用户名获取到指定用户对象
        User user = getUserByUserName(username);
        // 重新设置当前用户上一次登录的时间
        user.setLastLoginTime(new Date());
        // 获取到用户登录IP
        String ipAddress = IpUtil.getCurIpAddress(request);
        // 获取到用户登录的IP属地
        String ipSource = IpUtil.getIpSource(ipAddress);
        // 判断是否获取到了真实IP地址，如果没有获取到真实IP地址则设置为本机
        if (ipAddress.equals(LOCAL_HOST)) {
            ipSource = "本机登录";
        }
        // 设置用户的IP信息
        user.setIpAddress(ipAddress);
        user.setIpSource(ipSource);
        // 更新用户信息
        userMapper.updateById(user);
    }

    /**
     * 获取当前登录的用户信息
     *
     * @return 当前登录的用户对象
     */
    @Override
    public User getUserByUserId() {
        // 获取当前登录用户的ID
        Integer userId = UserUtil.getCurrentUser().getId();
        // 根据用户ID查询到用户对象
        User user = userMapper.selectById(userId);
        // 设置用户的菜单权限
        List<String> permission = menuMapper.getPermissionByUserId(userId);
        user.setPermission(permission);
        return user;
    }

    /**
     * 获取用户登录设备
     *
     * @param request 请求信息
     * @return 用户登录设备
     */
    @Override
    public String getUserAgent(HttpServletRequest request) {
        UserAgent userAgent = IpUtil.getUserAgent(request);
        // 拼接操作系统信息
        return userAgent.getOperatingSystem().getName() + " " +
                // 拼接浏览器信息
                userAgent.getBrowser();
    }

    /**
     * 用户更新密码
     *
     * @param passwordVO 用户密码参数对象
     * @return 返回结果对象
     */
    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public Result updatePassword(PasswordVO passwordVO) {
        // 判断新旧密码是否一致
        if (passwordEncoder.matches(passwordVO.getNewPassword(), passwordVO.getOldPassword())) {
            return Result.error("新密码不能与旧密码相同");
        }
        // 获取当前登录用户的ID
        Integer userId = UserUtil.getCurrentUser().getId();
        // 通过用户ID查询到对应的用户对象
        User user = userMapper.selectById(userId);

        String password = passwordEncoder.encode(passwordVO.getNewPassword());
        // 更新上一次用户更新时间
        user.setUpdateTime(new Date());
        // 更新用户密码
        user.setPassword(password);

        int count = userMapper.updateById(user);
        if (count > 0) {
            return Result.success("更新密码成功");
        }
        return Result.error("更新密码失败");
    }
}
