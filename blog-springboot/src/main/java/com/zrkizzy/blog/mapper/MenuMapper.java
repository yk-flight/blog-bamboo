package com.zrkizzy.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zrkizzy.blog.entity.Menu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author zhangrongkang
 * @date 2022/8/12
 */
@Mapper
public interface MenuMapper extends BaseMapper<Menu> {
    /**
     * 根据角色获取菜单列表
     *
     * @return 菜单列表
     */
    List<Menu> getMenuWithRole();
}
