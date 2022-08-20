package com.zrkizzy.blog.service;

import com.zrkizzy.blog.vo.Result;

import java.util.List;

/**
 * @author zhangrongkang
 * @date 2022/8/12
 */
public interface MenuRoleService {
    /**
     * 获取当前登录用户可访问的页面路径
     *
     * @return 可访问的页面路径集合
     */
    List<String> getAccessPath();

    /**
     * 更新当前用户的用户权限
     *
     * @param roleId 角色ID
     * @param ids 要进行赋值的权限
     * @return 前端返回对象
     */
    Result updateRolePermission(Integer roleId, Integer[] ids);
}
