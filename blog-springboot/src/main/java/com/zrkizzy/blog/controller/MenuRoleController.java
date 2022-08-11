package com.zrkizzy.blog.controller;

import com.zrkizzy.blog.service.MenuRoleService;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 菜单角色控制器
 *
 * @author zhangrongkang
 * @date 2022/8/12
 */
@RestController
public class MenuRoleController {
    @Resource
    private MenuRoleService menuRoleService;
}
