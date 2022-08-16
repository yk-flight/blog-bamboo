package com.zrkizzy.blog.service.impl;

import com.zrkizzy.blog.entity.UserInfo;
import com.zrkizzy.blog.mapper.UserInfoMapper;
import com.zrkizzy.blog.service.UserInfoService;
import com.zrkizzy.blog.utils.UserUtil;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author zhangrongkang
 * @date 2022/8/15
 */
@Service
public class UserInfoServiceImpl implements UserInfoService {
    @Resource
    private UserInfoMapper userInfoMapper;

    @Resource
    private RedisTemplate<String, Object> redisTemplate;

    /**
     * 通过用户ID获取用户个人信息
     *
     * @return 用户个人信息
     */
    @Override
    public UserInfo getUserInfoById() {
        // 获取用户ID
        Integer userId = UserUtil.getCurrentUser().getId();
        ValueOperations<String, Object> valueOperations = redisTemplate.opsForValue();
        // 从Redis中获取个人信息数据
        UserInfo userInfo = (UserInfo) valueOperations.get("userInfo_" + userId);
        if (userInfo == null) {
            // 如果Redis中不存在个人信息数据则到数据库中查询，查询后存储到Redis中
            userInfo = userInfoMapper.selectById(userId);
            valueOperations.set("userInfo_" + userId, userInfo);
        }
        return userInfo;
    }
}
