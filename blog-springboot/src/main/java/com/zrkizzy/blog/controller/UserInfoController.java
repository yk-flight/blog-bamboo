package com.zrkizzy.blog.controller;

import com.zrkizzy.blog.service.UserInfoService;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 用户信息前端控制器
 *
 * @author zhangrongkang
 * @date 2022/8/15
 */
@Api(tags = "UserInfoController")
@RestController
public class UserInfoController {
    @Resource
    private UserInfoService userInfoService;
}
