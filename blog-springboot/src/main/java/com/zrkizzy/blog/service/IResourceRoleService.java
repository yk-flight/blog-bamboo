package com.zrkizzy.blog.service;

import com.zrkizzy.blog.entity.ResourceRole;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zrkizzy.blog.vo.Result;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-27
 */
public interface IResourceRoleService extends IService<ResourceRole> {

    /**
     * 更新角色资源权限
     *
     * @param roleId 角色ID
     * @param ids 资源权限ID集合
     * @return 前端返回对象
     */
    Result updateResourceRole(Integer roleId, List<Integer> ids);
}
