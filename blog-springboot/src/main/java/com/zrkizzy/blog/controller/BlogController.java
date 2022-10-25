package com.zrkizzy.blog.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zrkizzy.blog.dto.*;
import com.zrkizzy.blog.entity.Article;
import com.zrkizzy.blog.entity.Message;
import com.zrkizzy.blog.entity.Website;
import com.zrkizzy.blog.service.*;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.utils.TimeUtil;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 博客信息控制器
 *
 * @author zhangrongkang
 * @date 2022/10/3
 */
@Api(tags = "BlogController")
@RestController
@RequestMapping("/api")
public class BlogController {
    @Resource
    private LinksService linksService;
    @Resource
    private ArticleService articleService;
    @Resource
    private TagsService tagsService;
    @Resource
    private CategoryService categoryService;
    @Resource
    private AboutService aboutService;
    @Resource
    private UserInfoService userInfoService;
    @Resource
    private WebsiteService websiteService;
    @Resource
    private WebsiteOtherService websiteOtherService;
    @Resource
    private SocialService socialService;
    @Resource
    private MessageService messageService;
    @Resource
    private CommentService commentService;
    @Resource
    private WeekViewService weekViewService;
    @Resource
    private PagesService pagesService;

    @ApiOperation("获取博客顶部导航栏信息")
    @GetMapping("/getNavBarInfo")
    public List<PagesDTO> getNavBarInfo() {
        return BeanCopyUtil.copyList(pagesService.list(), PagesDTO.class);
    }

    @ApiOperation("获取博客首页配置信息")
    @GetMapping("/getBlogConfigInfo")
    public BlogConfigVO getBlogConfigInfo() {
        Website website = websiteService.getById(1);
        // 获取博客基本配置信息
        WebsiteVO websiteVO = BeanCopyUtil.copy(website, WebsiteVO.class);
        // 设置博客的创建时间
        websiteVO.setCreateDate(TimeUtil.localDateTimeToString(website.getCreateDate()));
        WebsiteOtherVO websiteOtherVO = BeanCopyUtil.copy(websiteOtherService.getWebsiteInfo(), WebsiteOtherVO.class);
        // 获取博客社交配置信息
        SocialVO socialVO = BeanCopyUtil.copy(socialService.getById(1), SocialVO.class);
        // 获取博客社交链接信息
        BlogConfigVO blogConfigVO = BeanCopyUtil.copy(userInfoService.getUserInfoById(1), BlogConfigVO.class);
        // 定义博客基本配置
        blogConfigVO.setWebsiteVO(websiteVO);
        blogConfigVO.setWebsiteOtherVO(websiteOtherVO);
        blogConfigVO.setSocialVO(socialVO);
        // 获取并配置博客的文章、标签、分类数量
        blogConfigVO.setArticleCount(articleService.count(new QueryWrapper<Article>().eq("state", 1)));
        blogConfigVO.setCategoryCount(categoryService.count());
        blogConfigVO.setTagsCount(tagsService.count());
        // 网站总访问量
        blogConfigVO.setVisitCount(weekViewService.getBlogVisitCount());
        return blogConfigVO;
    }

    @ApiOperation("获取文章归档数据")
    @GetMapping("/getArchiveList")
    public PageVO getArchiveList(@RequestParam("curPage") Integer curPage,
                                 @RequestParam("size") Integer size) {
        return articleService.getArchiveList(curPage, size);
    }

    @ApiOperation("获取文章分类数据")
    @GetMapping("/getCategoryList")
    public PageVO getCategoryList(@RequestParam("curPage") Integer curPage,
                                  @RequestParam("size") Integer size) {
        return categoryService.getCategoryList(curPage, size);
    }

    @ApiOperation("获取关于我数据")
    @GetMapping("/getAboutInfo")
    public AboutVO getAboutInfo() {
        return BeanCopyUtil.copy(aboutService.getById(1), AboutVO.class);
    }

    @ApiOperation("获取友链数据")
    @GetMapping("/getLinkList")
    public List<LinksDTO> getLinkList() {
        return BeanCopyUtil.copyList(linksService.list(), LinksDTO.class);
    }

    @ApiOperation("获取标签数据")
    @GetMapping("/getTagsList")
    public List<TagsDTO> getTagsList() {
        return BeanCopyUtil.copyList(tagsService.list(), TagsDTO.class);
    }

    @ApiOperation("获取留言数据")
    @GetMapping("/getMessageList")
    public List<MessageDTO> getMessageList() {
        // 获取通过审核到留言
        List<Message> messageList = messageService.list(new QueryWrapper<Message>().eq("allow", 1));
        return BeanCopyUtil.copyList(messageList, MessageDTO.class);
    }

    @ApiOperation("获取文章列表")
    @GetMapping("/getArticleList")
    public PageVO getArticleList(@RequestParam("curPage") Integer curPage,
                                 @RequestParam("size") Integer size) {
        return articleService.listArticle(curPage, size);
    }

    @ApiOperation("通过文章ID获取指定文章内容")
    @GetMapping("/getArticleById/{id}")
    public ArticleDTO getArticleById(@PathVariable Integer id) {
        return articleService.getArticleById(id);
    }

    @ApiOperation("获取相关推荐文章")
    @GetMapping("/getRecommend")
    public List<RecommendVO> listRecommend() {
        return articleService.listRecommend();
    }

    @ApiOperation("获取评论列表")
    @GetMapping("/listComment")
    public PageVO listComment(@RequestParam("curPage") Integer curPage,
                              @RequestParam("size") Integer size,
                              @RequestParam("id") Integer id) {
        return commentService.listComment(curPage, size, id);
    }

    @ApiOperation("保存用户评论")
    @PostMapping("/saveComment")
    public Result saveComment(@RequestBody CommentVO commentVO, HttpServletRequest request) {
        return commentService.addComment(commentVO, request);
    }

    @ApiOperation("保存用户留言")
    @PostMapping("/saveMessage")
    public Result saveMessage(@RequestBody MessageDTO messageDTO, HttpServletRequest request) {
        return messageService.addMessage(messageDTO, request);
    }

    @ApiOperation("获取分类/标签对应的文章")
    @GetMapping("/listArticle")
    public Map<String, Object> listArticle(@RequestParam("curPage") Integer curPage,
                                           @RequestParam("size") Integer size,
                                           @RequestParam("path") String path,
                                           @RequestParam("id") Integer id) {
        return articleService.listArticleById(curPage, size, path, id);
    }
}
