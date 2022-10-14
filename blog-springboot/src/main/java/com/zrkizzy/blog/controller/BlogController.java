package com.zrkizzy.blog.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zrkizzy.blog.dto.BlogDTO;
import com.zrkizzy.blog.dto.PagesDTO;
import com.zrkizzy.blog.entity.Article;
import com.zrkizzy.blog.entity.Social;
import com.zrkizzy.blog.entity.Website;
import com.zrkizzy.blog.service.*;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.utils.TimeUtil;
import com.zrkizzy.blog.vo.param.BlogConfigVO;
import com.zrkizzy.blog.vo.param.SocialVO;
import com.zrkizzy.blog.vo.param.WebsiteVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * 博客信息控制器
 *
 * @author zhangrongkang
 * @date 2022/10/3
 */
@Api(tags = "BlogController")
@RestController
public class BlogController {
    @Resource
    private BlogService blogService;
    @Resource
    private ArticleService articleService;
    @Resource
    private TagsService tagsService;
    @Resource
    private CategoryService categoryService;
    @Resource
    private UserInfoService userInfoService;
    @Resource
    private WebsiteService websiteService;
    @Resource
    private SocialService socialService;
    @Resource
    private WeekViewService weekViewService;
    @Resource
    private PagesService pagesService;

    @ApiOperation("获取博客顶部导航栏信息")
    @GetMapping("/api/getNavBarInfo")
    public List<PagesDTO> getNavBarInfo() {
        return BeanCopyUtil.copyList(pagesService.list(), PagesDTO.class);
    }

    @ApiOperation("获取博客首页配置信息")
    @GetMapping("/api/getBlogConfigInfo")
    public BlogConfigVO getBlogConfigInfo() {
        Website website = websiteService.getOne(new QueryWrapper<Website>().eq("id", 1));
        // 获取博客基本配置信息
        WebsiteVO websiteVO = BeanCopyUtil.copy(website, WebsiteVO.class);
        // 设置博客的创建时间
        websiteVO.setCreateDate(TimeUtil.localDateTimeToString(website.getCreateDate()));
        // 获取博客社交配置信息
        SocialVO socialVO = BeanCopyUtil.copy(socialService.getOne(new QueryWrapper<Social>().eq("id", 1)), SocialVO.class);
        // 获取博客社交链接信息
        BlogConfigVO blogConfigVO = BeanCopyUtil.copy(userInfoService.getUserInfoById(1), BlogConfigVO.class);
        // 定义博客基本配置
        blogConfigVO.setWebsiteVO(websiteVO);
        blogConfigVO.setSocialVO(socialVO);
        // 获取并配置博客的文章、标签、分类数量
        blogConfigVO.setArticleCount(articleService.count(new QueryWrapper<Article>().eq("state", 1)));
        blogConfigVO.setCategoryCount(categoryService.count());
        blogConfigVO.setTagsCount(tagsService.count());
        // 网站总访问量
        blogConfigVO.setVisitCount(weekViewService.getBlogVisitCount());
        return blogConfigVO;
    }

    @ApiOperation("获取博客仪表盘信息")
    @GetMapping("/blog/getBlogInfo")
    public BlogDTO getBlogInfo() {
        return blogService.getBlogInfo();
    }
}
