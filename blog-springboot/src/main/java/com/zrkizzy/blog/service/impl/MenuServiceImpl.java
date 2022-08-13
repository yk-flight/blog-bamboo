package com.zrkizzy.blog.service.impl;

import com.zrkizzy.blog.entity.Menu;
import com.zrkizzy.blog.mapper.MenuMapper;
import com.zrkizzy.blog.service.MenuService;
import com.zrkizzy.blog.utils.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

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
    @Resource
    private RedisTemplate<String, Object> redisTemplate;

    /**
     * 根据角色获取菜单列表
     *
     * @return 菜单列表
     */
    @Override
    public List<Menu> getMenuWithRole() {
        return menuMapper.getMenuWithRole();
    }

    /**
     * 通过用户ID获取菜单列表
     *
     * @return 菜单列表
     */
    @Override
    public List<Menu> getMenusByUserId() {
        // 获取到当前登录用户的ID
        Integer userId = UserUtil.getCurrentUser().getId();
        ValueOperations<String, Object> valueOperations = redisTemplate.opsForValue();
        // 从Redis中获取菜单数据
        List<Menu> menuList = (List<Menu>) valueOperations.get("menu_" + userId);
        // 判断从Redis中获取到的菜单列表是否存在
        if (CollectionUtils.isEmpty(menuList)) {
            // 如果为空则从数据库中获取
            menuList = menuMapper.getMenusByUserId(userId);
            // 将从数据库中获取到的菜单数据设置到Redis中
            valueOperations.set("menu_" + userId, menuList);
        }

        return menuList;
    }
}
