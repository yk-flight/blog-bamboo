package com.zrkizzy.blog.service;

import com.zrkizzy.blog.dto.RoleDto;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.RoleVO;

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

    /**
     * 更新角色信息
     *
     * @param roleVO 角色对象
     * @return 前端返回对象
     */
    Result updateRole(RoleVO roleVO);

    /**
     * 删除指定的角色
     *
     * @param roleId 角色ID
     * @return 前端返回对象
     */
    Result deleteRoleById(Integer roleId);

    /**
     * 新增角色
     *
     * @param roleVO 角色数据传递对象
     * @return 前端返回对象
     */
    Result insertRole(RoleVO roleVO);
}
