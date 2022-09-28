package com.zrkizzy.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zrkizzy.blog.entity.ResourceRole;
import com.zrkizzy.blog.mapper.ResourceRoleMapper;
import com.zrkizzy.blog.service.IResourceRoleService;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.handler.FilterInvocationSecurityMetadataSourceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-27
 */
@Service
public class ResourceRoleServiceImpl extends ServiceImpl<ResourceRoleMapper, ResourceRole> implements IResourceRoleService {
    @Resource
    private ResourceRoleMapper resourceRoleMapper;
    @Resource
    private FilterInvocationSecurityMetadataSourceImpl filterInvocationSecurityMetadataSource;

    /**
     * 更新角色资源权限
     *
     * @param roleId 角色ID
     * @param ids 资源权限ID集合
     * @return 前端返回对象
     */
    @Override
    public Result updateResourceRole(Integer roleId, List<Integer> ids) {
        // 删除当前角色具有的所有资源权限
        resourceRoleMapper.delete(new QueryWrapper<ResourceRole>().eq("role_id", roleId));
        // 将当前所有的资源角色ID进行添加
        ResourceRole resourceRole = new ResourceRole();
        int count = 0;
        for (Integer id : ids) {
            resourceRole.setRoleId(roleId);
            resourceRole.setResourceId(id);
            count += resourceRoleMapper.insert(resourceRole);
        }
        // 重新加载角色资源信息
        filterInvocationSecurityMetadataSource.clearDataSource();
        if (count != ids.size()) {
            return Result.error("更新失败");
        }
        return Result.success("更新成功");
    }
}
