package com.zrkizzy.blog.controller;

import com.zrkizzy.blog.entity.UserInfo;
import com.zrkizzy.blog.service.UserInfoService;
import com.zrkizzy.blog.service.impl.UserDetailsServiceImpl;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.UserInfoVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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

    @ApiOperation("获取用户个人信息")
    @GetMapping("/admin/getUserInfoById")
    public UserInfo getUserInfoById() {
        return userInfoService.getUserInfoById();
    }

    @ApiOperation("更新用户个人信息")
    @PostMapping("/admin/updateUserInfo")
    public Result updateUserInfo(@RequestBody UserInfoVO userInfoVO) {
        return userInfoService.updateUserInfo(userInfoVO);
    }
}
