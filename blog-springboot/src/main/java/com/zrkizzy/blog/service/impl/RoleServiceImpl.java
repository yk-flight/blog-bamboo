package com.zrkizzy.blog.service.impl;

import com.zrkizzy.blog.dto.RoleDto;
import com.zrkizzy.blog.entity.Role;
import com.zrkizzy.blog.mapper.RoleMapper;
import com.zrkizzy.blog.service.RoleService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author zhangrongkang
 * @date 2022/8/7
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Resource
    private RoleMapper roleMapper;

    /**
     * 获取所有角色
     *
     * @return 获取所有角色
     */
    @Override
    public List<RoleDto> getAllRoles() {
        List<Role> roles = roleMapper.selectList(null);
        // 复制当前所有的角色对象
        List<RoleDto> roleDtoList = BeanCopyUtil.copyList(roles, RoleDto.class);
        // 设置每一个角色的权限
        for (RoleDto roleDto : roleDtoList) {
            roleDto.setPermission(roleMapper.getPermissionByRoles(roleDto.getId()));
        }
        return roleDtoList;
    }
}
