package com.zrkizzy.blog.service;

import com.zrkizzy.blog.dto.BlogDTO;

/**
 * @author zhangrongkang
 * @date 2022/10/3
 */
public interface BlogService {
    /**
     * 获取博客仪表盘信息
     *
     * @return 博客信息对象
     */
    BlogDTO getBlogInfo();
}
