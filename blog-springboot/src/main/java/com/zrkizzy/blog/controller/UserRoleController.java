package com.zrkizzy.blog.controller;

import com.zrkizzy.blog.service.UserRoleService;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 用户角色关联控制器
 *
 * @author zhangrongkang
 * @date 2022/8/7
 */
@Api(tags = "UserRoleController")
@RestController
public class UserRoleController {
    @Resource
    private UserRoleService userRoleService;
}
