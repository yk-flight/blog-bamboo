package com.zrkizzy.blog.mapper;

import com.zrkizzy.blog.entity.Role;

import java.util.List;

/**
 * @author zhangrongkang
 * @date 2022/8/7
 */
public interface RoleMapper {
    /**
     * 通过用户ID获取对应的用户权限
     *
     * @param userId 用户ID
     * @return 当前用户的权限集合
     */
    List<Role> getRoles(Integer userId);
}

