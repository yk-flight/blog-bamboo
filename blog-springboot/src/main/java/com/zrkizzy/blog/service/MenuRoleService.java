package com.zrkizzy.blog.service;

import java.util.List;

/**
 * @author zhangrongkang
 * @date 2022/8/12
 */
public interface MenuRoleService {
    /**
     * 获取当前登录用户可访问的页面路径
     *
     * @return 可访问的页面路径集合
     */
    List<String> getAccessPath();
}
