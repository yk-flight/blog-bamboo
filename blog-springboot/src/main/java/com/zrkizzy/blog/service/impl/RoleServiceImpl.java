package com.zrkizzy.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zrkizzy.blog.dto.RoleDto;
import com.zrkizzy.blog.entity.MenuRole;
import com.zrkizzy.blog.entity.Role;
import com.zrkizzy.blog.mapper.MenuRoleMapper;
import com.zrkizzy.blog.mapper.RoleMapper;
import com.zrkizzy.blog.service.RoleService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.RoleVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * @author zhangrongkang
 * @date 2022/8/7
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Resource
    private RoleMapper roleMapper;
    @Resource
    private MenuRoleMapper menuRoleMapper;

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

    /**
     * 更新角色信息
     *
     * @param roleVO 角色对象
     * @return 前端返回对象
     */
    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public Result updateRole(RoleVO roleVO) {
        // 定义上一次更新时间
        roleVO.setUpdateTime(new Date());
        // 复制当前角色对象
        int row = roleMapper.updateById(BeanCopyUtil.copy(roleVO, Role.class));
        if (row > 0) {
            return Result.success("角色信息更新成功");
        }
        return Result.error("角色信息更新失败");
    }

    /**
     * 删除指定的角色
     *
     * @param roleId 角色ID
     * @return 前端返回对象
     */
    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public Result deleteRoleById(Integer roleId) {
        // 1. 删除角色菜单表中对应的数据
        QueryWrapper<MenuRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("role_id", roleId);
        menuRoleMapper.delete(queryWrapper);
        // 2. 删除角色表中的数据
        int row = roleMapper.deleteById(roleId);
        if (row > 0) {
            return Result.success("角色删除成功");
        }
        return Result.error("角色删除失败");
    }

    /**
     * 新增角色
     *
     * @param roleVO 角色数据传递对象
     * @return 前端返回对象
     */
    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public Result insertRole(RoleVO roleVO) {
        System.out.println(BeanCopyUtil.copy(roleVO, Role.class));
        int row = roleMapper.insert(BeanCopyUtil.copy(roleVO, Role.class));
        if (row > 0) {
            return Result.success("新增角色成功");
        }
        return Result.error("新增角色失败");
    }
}
