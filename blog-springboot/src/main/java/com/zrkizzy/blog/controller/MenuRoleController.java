package com.zrkizzy.blog.controller;

import com.zrkizzy.blog.service.MenuRoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * 菜单角色控制器
 *
 * @author zhangrongkang
 * @date 2022/8/12
 */
@RestController
@Api(tags = "MenuRoleController")
public class MenuRoleController {
    @Resource
    private MenuRoleService menuRoleService;

    @ApiOperation("获取当前登录用户可访问的页面")
    @GetMapping("/admin/getAccessPath")
    public List<String> getAccessPath() {
        return menuRoleService.getAccessPath();
    }


}
