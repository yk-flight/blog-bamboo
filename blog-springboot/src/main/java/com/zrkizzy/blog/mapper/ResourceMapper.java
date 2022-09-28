package com.zrkizzy.blog.mapper;

import com.zrkizzy.blog.entity.Resource;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-27
 */
public interface ResourceMapper extends BaseMapper<Resource> {

    /**
     * 根据角色ID获取对应的资源权限
     *
     * @param roleId 角色ID
     * @return 角色对应的资源权限ID集合
     */
    List<Integer> getResourceById(@Param("roleId") Integer roleId);
}
