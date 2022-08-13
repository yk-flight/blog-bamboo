package com.zrkizzy.blog.controller;

import com.zrkizzy.blog.entity.Menu;
import com.zrkizzy.blog.service.MenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * 菜单控制器
 *
 * @author zhangrongkang
 * @date 2022/8/12
 */
@Api(tags = "MenuController")
@RestController
@RequestMapping("/security/menus")
public class MenuController {
    @Resource
    private MenuService menuService;

    @ApiOperation("通过用户ID查询菜单列表")
    @GetMapping("/getMenusByUserId")
    public List<Menu> getMenusByUserId() {
        return menuService.getMenusByUserId();
    }
}
