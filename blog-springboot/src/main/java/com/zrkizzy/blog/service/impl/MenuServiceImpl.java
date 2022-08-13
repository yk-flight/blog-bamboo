package com.zrkizzy.blog.service.impl;

import com.zrkizzy.blog.entity.Menu;
import com.zrkizzy.blog.mapper.MenuMapper;
import com.zrkizzy.blog.service.MenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author zhangrongkang
 * @date 2022/8/12
 */
@Service
public class MenuServiceImpl implements MenuService {
    @Resource
    private MenuMapper menuMapper;

    /**
     * 根据角色获取菜单列表
     *
     * @return 菜单列表
     */
    @Override
    public List<Menu> getMenuWithRole() {
        return menuMapper.getMenuWithRole();
    }
}
