package com.zrkizzy.blog.service.impl;

import com.zrkizzy.blog.mapper.MenuRoleMapper;
import com.zrkizzy.blog.service.MenuRoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author zhangrongkang
 * @date 2022/8/12
 */
@Service
public class MenuRoleServiceImpl implements MenuRoleService {
    @Resource
    private MenuRoleMapper menuRoleMapper;
}
