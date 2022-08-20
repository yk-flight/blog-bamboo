package com.zrkizzy.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zrkizzy.blog.entity.MenuRole;
import com.zrkizzy.blog.entity.Role;
import com.zrkizzy.blog.mapper.MenuRoleMapper;
import com.zrkizzy.blog.mapper.RoleMapper;
import com.zrkizzy.blog.service.MenuRoleService;
import com.zrkizzy.blog.utils.UserUtil;
import com.zrkizzy.blog.vo.Result;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * @author zhangrongkang
 * @date 2022/8/12
 */
@Service
public class MenuRoleServiceImpl implements MenuRoleService {
    @Resource
    private MenuRoleMapper menuRoleMapper;
    @Resource
    private RoleMapper roleMapper;

    /**
     * 获取当前登录用户可访问的页面路径
     *
     * @return 可访问的页面路径集合
     */
    @Override
    public List<String> getAccessPath() {
        // 获取当前登录用户的ID
        Integer userId = UserUtil.getCurrentUser().getId();
        return menuRoleMapper.getAccessPath(userId);
    }

    /**
     * 更新当前用户的用户权限<br/>
     * 1. 先将当前角色具有的所有权限全部删除<br/>
     * 2. 将当前传来的数组中的权限进行重新添加<br/>
     *
     * @param roleId 角色ID
     * @param ids    要进行赋值的权限
     * @return 前端返回对象
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result updateRolePermission(Integer roleId, Integer[] ids) {
        // 定义查询对象
        QueryWrapper<MenuRole> queryWrapper = new QueryWrapper<>();
        // 定义查询条件
        queryWrapper.eq("role_id", roleId);
        // 1. 批量删除当前角色具有的所有权限
        menuRoleMapper.delete(queryWrapper);
        // 2. 将当前要进行赋值的权限重新进行添加
        Integer rows = menuRoleMapper.insertRoles(roleId, ids);
        // 更新当前角色的上次更新时间
        Role role = roleMapper.selectOne(new QueryWrapper<Role>().eq("id", roleId));
        role.setUpdateTime(new Date());
        // 更新用户
        roleMapper.updateById(role);
        if (rows == ids.length) {
            return Result.success("角色权限更新成功");
        }
        return Result.error("角色权限更新发生异常");
    }
}
