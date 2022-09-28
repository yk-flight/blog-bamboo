package com.zrkizzy.blog.service.impl;

import com.zrkizzy.blog.dto.ResourceDTO;
import com.zrkizzy.blog.entity.Resource;
import com.zrkizzy.blog.mapper.ResourceMapper;
import com.zrkizzy.blog.service.IResourceService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
public class ResourceServiceImpl extends ServiceImpl<ResourceMapper, Resource> implements IResourceService {
    @Autowired
    private ResourceMapper resourceMapper;

    /**
     * 获取所有封装好的资源权限
     *
     * @return 已封装的资源权限
     */
    @Override
    public List<ResourceDTO> getResourceList() {
        // 获取所有资源权限
        List<ResourceDTO> resources = BeanCopyUtil.copyList(resourceMapper.selectList(null), ResourceDTO.class);
        // 递归封装子权限并返回
        return setResourceChildren(resources, 0);
    }

    /**
     * 根据角色ID获取对应的资源权限
     *
     * @param roleId 角色ID
     * @return 角色对应的资源权限ID集合
     */
    @Override
    public List<Integer> getResourceById(Integer roleId) {
        return resourceMapper.getResourceById(roleId);
    }

    /**
     * 获取封装好的资源权限集合（递归）
     *
     * @param resources 所有资源权限数据
     * @param parentId 父ID
     * @return 封装好的资源权限集合
     */
    private List<ResourceDTO> setResourceChildren(List<ResourceDTO> resources, Integer parentId) {
        // 存储资源权限的集合
        List<ResourceDTO> children = new ArrayList<>();
        // 遍历所有权限集合
        for (ResourceDTO resource : resources) {
            // 如果当前集合中的父ID与传来的父ID相同
            if (resource.getParentId().equals(parentId)) {
                children.add(resource);
            }
        }
        // 递归获取并设置所有子权限
        for (ResourceDTO child : children) {
            child.setChildren(setResourceChildren(resources, child.getId()));
        }
        // 如果没有子权限则返回一个空集合
        if (children.size() == 0) {
            return null;
        }
        return children;
    }

}
