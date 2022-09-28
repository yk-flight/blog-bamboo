package com.zrkizzy.blog.service;

import com.zrkizzy.blog.dto.ResourceDTO;
import com.zrkizzy.blog.entity.Resource;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-27
 */
public interface IResourceService extends IService<Resource> {

    /**
     * 获取所有封装好的资源权限
     *
     * @return 已封装的资源权限
     */
    List<ResourceDTO> getResourceList();

    /**
     * 根据角色ID获取对应的资源权限
     *
     * @param roleId 角色ID
     * @return 角色对应的资源权限ID集合
     */
    List<Integer> getResourceById(Integer roleId);
}
