package com.zrkizzy.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zrkizzy.blog.entity.MenuRole;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zhangrongkang
 * @date 2022/8/12
 */
@Mapper
public interface MenuRoleMapper extends BaseMapper<MenuRole> {
    /**
     * 根据用户ID获取当前用户可访问的页面路径
     *
     * @param userId 用户ID
     * @return 可访问的路径集合
     */
    List<String> getAccessPath(Integer userId);

    /**
     * 将权限集合添加到对应角色
     *
     * @param roleId 角色ID
     * @param ids 权限集合
     * @return 受影响的行数
     */
    Integer insertRoles(@Param("roleId") Integer roleId, @Param("ids") Integer[] ids);
}
