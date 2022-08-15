package com.zrkizzy.blog.service.impl;

import com.zrkizzy.blog.mapper.UserInfoMapper;
import com.zrkizzy.blog.service.UserInfoService;
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
}
