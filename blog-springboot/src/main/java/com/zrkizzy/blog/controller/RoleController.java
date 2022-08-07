package com.zrkizzy.blog.controller;

import com.zrkizzy.blog.service.RoleService;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 角色模块控制器
 *
 * @author zhangrongkang
 * @date 2022/8/7
 */
@Api(tags = "RoleController")
@RestController
public class RoleController {
    @Resource
    private RoleService roleService;
}
