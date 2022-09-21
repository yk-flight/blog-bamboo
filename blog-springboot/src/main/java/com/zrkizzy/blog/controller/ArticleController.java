package com.zrkizzy.blog.controller;


import com.zrkizzy.blog.service.IArticleService;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.ArticleVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-14
 */
@RestController
@Api(tags = "ArticleController")
@RequestMapping("/article")
public class ArticleController {
    @Resource
    private IArticleService articleService;

    @ApiOperation("保存文章")
    @PostMapping("/save")
    public Result save(@RequestBody ArticleVO articleVO) {
        return articleService.saveArticle(articleVO);
    }

}

