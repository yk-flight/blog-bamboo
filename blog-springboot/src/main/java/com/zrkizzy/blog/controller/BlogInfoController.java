package com.zrkizzy.blog.controller;

import com.zrkizzy.blog.dto.BlogDTO;
import com.zrkizzy.blog.service.BlogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 博客后台控制器
 *
 * @author zhangrongkang
 * @date 2022/10/19
 */
@Api(tags = "BlogInfoController")
@RestController
@RequestMapping("/blog")
public class BlogInfoController {
    @Resource
    private BlogService blogService;

    @ApiOperation("获取博客仪表盘信息")
    @GetMapping("/getBlogInfo")
    public BlogDTO getBlogInfo() {
        return blogService.getBlogInfo();
    }
}
