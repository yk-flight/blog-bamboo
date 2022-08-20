package com.zrkizzy.blog.service;

import com.zrkizzy.blog.dto.RoleDto;

import java.util.List;

/**
 * @author zhangrongkang
 * @date 2022/8/7
 */
public interface RoleService {
    /**
     * 获取所有角色
     *
     * @return 获取所有角色
     */
    List<RoleDto> getAllRoles();
}
