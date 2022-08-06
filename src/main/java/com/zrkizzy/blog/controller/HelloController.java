package com.zrkizzy.blog.controller;

import com.zrkizzy.blog.entity.User;
import com.zrkizzy.blog.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author zhangrongkang
 * @date 2022/8/6
 */
@RestController
@RequestMapping("/hello")
@Api(tags = "HelloController")
public class HelloController {
    @Resource
    private UserService userService;

    @ApiOperation(value = "测试方法")
    @GetMapping("/say")
    public User sayHello() {
        return userService.getUserByUserName("admin");
    }
}
