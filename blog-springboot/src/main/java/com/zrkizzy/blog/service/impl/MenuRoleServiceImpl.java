package com.zrkizzy.blog.service.impl;

import com.zrkizzy.blog.mapper.MenuRoleMapper;
import com.zrkizzy.blog.service.MenuRoleService;
import com.zrkizzy.blog.utils.UserUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author zhangrongkang
 * @date 2022/8/12
 */
@Service
public class MenuRoleServiceImpl implements MenuRoleService {
    @Resource
    private MenuRoleMapper menuRoleMapper;

    /**
     * 获取当前登录用户可访问的页面路径
     *
     * @return 可访问的页面路径集合
     */
    @Override
    public List<String> getAccessPath() {
        // 获取当前登录用户的ID
        Integer userId = UserUtil.getCurrentUser().getId();
        return menuRoleMapper.getAccessPath(userId);
    }
}
