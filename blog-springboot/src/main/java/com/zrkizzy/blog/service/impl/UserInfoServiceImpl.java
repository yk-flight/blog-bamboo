package com.zrkizzy.blog.service.impl;

import com.zrkizzy.blog.entity.User;
import com.zrkizzy.blog.entity.UserInfo;
import com.zrkizzy.blog.mapper.UserInfoMapper;
import com.zrkizzy.blog.mapper.UserMapper;
import com.zrkizzy.blog.service.UserInfoService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.utils.UserUtil;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.UserInfoVO;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @author zhangrongkang
 * @date 2022/8/15
 */
@Service
public class UserInfoServiceImpl implements UserInfoService {
    @Resource
    private UserInfoMapper userInfoMapper;
    @Resource
    private UserMapper userMapper;

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

    /**
     * 更新登录用户的个人信息
     *
     * @param userInfoVO 用户信息对象
     * @return 前端返回对象
     */
    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public Result updateUserInfo(UserInfoVO userInfoVO) {
        // 获取当前登录用户ID
        Integer userId = UserUtil.getCurrentUser().getId();
        // 查询当前用户的昵称
        User user = userMapper.selectById(userId);
        // 判断昵称是否需要修改
        if (!user.getNickName().equals(userInfoVO.getNickName())) {
            // 如果昵称需要更新则将用户昵称进行设置
            user.setNickName(userInfoVO.getNickName());
        }
        // 更新用户上一次更新时间
        user.setUpdateTime(new Date());
        // 更新用户信息
        userMapper.updateById(user);
        UserInfo userInfo = BeanCopyUtil.copy(userInfoVO, UserInfo.class);
        // 设置当前用户对象的ID
        userInfo.setId(userId);
        // 获取受到影响到行数
        int count = userInfoMapper.updateById(userInfo);
        // 更新Redis中的用户信息对象
        ValueOperations<String, Object> valueOperations = redisTemplate.opsForValue();
        valueOperations.set("userInfo_" + userId, userInfo);

        if (count > 0) {
            return Result.success("信息更新成功");
        }
        return Result.error("信息更新失败");
    }
}
