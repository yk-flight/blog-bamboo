package com.zrkizzy.blog.controller;

import com.zrkizzy.blog.dto.MenuDto;
import com.zrkizzy.blog.entity.Menu;
import com.zrkizzy.blog.service.MenuService;
import com.zrkizzy.blog.vo.param.MenuVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
public class MenuController {
    @Resource
    private MenuService menuService;

    @ApiOperation("通过用户ID查询菜单列表")
    @GetMapping("/security/menus/getMenusByUserId")
    public List<Menu> getMenusByUserId() {
        return menuService.getMenusByUserId();
    }

    @ApiOperation("获取当前角色具有的菜单权限")
    @GetMapping("/security/menus/getPermissionByUserId")
    public List<String> getPermissionByUserId() {
        return menuService.getPermissionByUserId();
    }

    @ApiOperation("获取所有菜单列表")
    @PostMapping("/admin/getAllMenus")
    public List<MenuDto> getAllMenus(@RequestBody MenuVO menuVO) {
        return menuService.getAllMenus(menuVO);
    }
}
