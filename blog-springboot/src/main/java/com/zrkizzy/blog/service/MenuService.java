package com.zrkizzy.blog.service;

import com.zrkizzy.blog.entity.Menu;

import java.util.List;

/**
 * @author zhangrongkang
 * @date 2022/8/12
 */
public interface MenuService {
    /**
     * 根据角色获取菜单列表
     *
     * @return 菜单列表
     */
    List<Menu> getMenuWithRole();

    /**
     * 通过用户ID获取菜单列表
     *
     * @return 菜单列表
     */
    List<Menu> getMenusByUserId();

    /**
     * 根据用户ID获取当前用户具有的菜单权限
     *
     * @return 菜单权限集合
     */
    List<String> getPermissionByUserId();
}
