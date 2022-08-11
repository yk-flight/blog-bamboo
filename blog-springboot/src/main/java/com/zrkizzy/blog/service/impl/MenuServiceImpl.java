package com.zrkizzy.blog.service.impl;

import com.zrkizzy.blog.mapper.MenuMapper;
import com.zrkizzy.blog.service.MenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author zhangrongkang
 * @date 2022/8/12
 */
@Service
public class MenuServiceImpl implements MenuService {
    @Resource
    private MenuMapper menuMapper;
}
