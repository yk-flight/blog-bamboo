package com.zrkizzy.blog.controller;

import com.zrkizzy.blog.entity.User;
import com.zrkizzy.blog.service.UserService;
import com.zrkizzy.blog.vo.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 用户模块控制器
 *
 * @author zhangrongkang
 * @date 2022/8/14
 */
@RestController
@Api(tags = "UserController")
public class UserController {
    @Resource
    private UserService userService;

    @ApiOperation("获取当前登录的用户信息")
    @GetMapping("/admin/getUserById")
    public Result getUserById() {
        return Result.success("", userService.getUserByUserId());
    }

}
