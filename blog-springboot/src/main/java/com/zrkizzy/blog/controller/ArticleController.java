package com.zrkizzy.blog.controller;


import com.zrkizzy.blog.annotation.LogAnnotation;
import com.zrkizzy.blog.entity.Article;
import com.zrkizzy.blog.service.IArticleService;
import com.zrkizzy.blog.service.ITagsService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.utils.TimeUtil;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.ArticleVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Arrays;

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
    @Resource
    private ITagsService tagsService;

    @ApiOperation("保存文章")
    @PostMapping("/save")
    public Result save(@RequestBody ArticleVO articleVO) {
        // 如果传来的文章对象存在ID则说明为文章编辑操作
        if (articleVO.getId() != null) {
            return articleService.updateArticle(articleVO);
        }
        // 如果文章对象不存在ID则说明为添加文章操作
        return articleService.saveArticle(articleVO);
    }

    @ApiOperation("获取文章列表(分页)")
    @GetMapping("/getArticleList")
    public PageVO getArticleList(@RequestParam("curPage") Integer curPage,
                                 @RequestParam("size") Integer size,
                                 @RequestParam("title") String title,
                                 @RequestParam("state") Integer state,
                                 @RequestParam("type") Integer type,
                                 @RequestParam("category") Integer category,
                                 @RequestParam("deleted") Boolean deleted) {
        return articleService.getArticleList(curPage, size, title, state, type, category, deleted);
    }

    @ApiOperation("修改文章置顶状态")
    @LogAnnotation(module = "文章管理模块", description = "更新文章置顶状态")
    @GetMapping("/updateArticleTop/{id}")
    public Result updateArticleTop(@PathVariable Integer id) {
        // 通过ID获取到文章
        Article article = articleService.getById(id);
        // 设置文章是否置顶
        article.setTop(!article.getTop());
        // 更新数据并返回结果
        if (articleService.updateById(article)) {
            return Result.success("文章置顶状态更新成功");
        }
        return Result.error("文章置顶状态更新失败");
    }

    @ApiOperation("修改文章是否可评论")
    @LogAnnotation(module = "文章管理模块", description = "修改文章评论状态")
    @GetMapping("/updateArticleComment/{id}")
    public Result updateArticleComment(@PathVariable Integer id) {
        // 通过ID获取到文章
        Article article = articleService.getById(id);
        // 设置文章是否可评论
        article.setAllowComment(!article.getAllowComment());
        // 更新数据并返回结果
        if (articleService.updateById(article)) {
            return Result.success("文章评论状态更新成功");
        }
        return Result.error("文章评论状态更新失败");
    }

    @ApiOperation("将指定文章移动到回收站")
    @LogAnnotation(module = "文章管理模块", description = "移动指定文章到回收站")
    @GetMapping("/removeArticle/{id}")
    public Result removeArticle(@PathVariable Integer id) {
        // 根据ID获取到当前文章对象
        Article article = articleService.getById(id);
        // 将当前文章移动到回收站中
        article.setDeleted(true);
        article.setState(2);
        // 更新并返回结果
        if (articleService.updateById(article)) {
            return Result.success("文章删除成功");
        }
        return Result.error("文章删除失败");
    }

    @ApiOperation("批量移动文章到回收站")
    @LogAnnotation(module = "文章管理模块", description = "批量移动文章到回收站")
    @GetMapping("/removeArticleBatchIds/{ids}")
    public Result removeArticleBatchIds(@PathVariable Integer[] ids) {
        return articleService.removeArticleBatchIds(Arrays.asList(ids));
    }

    @ApiOperation("恢复回收站文章")
    @LogAnnotation(module = "文章管理模块", description = "恢复回收站文章")
    @GetMapping("/recoverArticle/{id}")
    public Result recoverArticle(@PathVariable Integer id) {
        // 根据文章ID获取到文章对象
        Article article = articleService.getById(id);
        article.setDeleted(false);
        article.setState(1);
        // 更新文章对象并返回
        if (articleService.updateById(article)) {
            return Result.success("文章恢复成功");
        }
        return Result.error("文章恢复失败");
    }

    @ApiOperation("批量恢复删除的文章")
    @LogAnnotation(module = "文章管理模块", description = "批量恢复删除的文章")
    @GetMapping("/recoverArticleBatchIds/{ids}")
    public Result recoverArticleBatchIds(@PathVariable Integer[] ids) {
        return articleService.recoverArticleBatchIds(Arrays.asList(ids));
    }

    @ApiOperation("删除指定文章")
    @DeleteMapping("/deleteArticle/{id}")
    public Result deleteArticle(@PathVariable Integer id) {
        return articleService.deleteArticle(id);
    }

    @ApiOperation("批量删除回收站的文章")
    @DeleteMapping("/deleteArticleBatchIds/{ids}")
    public Result deleteArticleBatchIds(@PathVariable Integer[] ids) {
        return articleService.deleteArticleBatchIds(Arrays.asList(ids));
    }

    @ApiOperation("通过文章ID获取指定文章内容")
    @GetMapping("/getArticleById/{id}")
    public ArticleVO getArticleById(@PathVariable Integer id) {
        // 获取到对应的文章信息对象
        Article article = articleService.getById(id);
        ArticleVO articleVO = BeanCopyUtil.copy(article, ArticleVO.class);
        // 文章发布时间
        articleVO.setPublishTime(TimeUtil.localDateTimeToString(article.getPublishTime()));
        // 文章更新时间
        articleVO.setUpdateTime(TimeUtil.localDateTimeToString(article.getUpdateTime()));
        // 文章标签
        articleVO.setTags(tagsService.idsConvertTags(article.getTags()));
        return articleVO;
    }
}

