package com.zrkizzy.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zrkizzy.blog.dto.ArticleDto;
import com.zrkizzy.blog.entity.Article;
import com.zrkizzy.blog.entity.Category;
import com.zrkizzy.blog.mapper.ArticleMapper;
import com.zrkizzy.blog.mapper.CategoryMapper;
import com.zrkizzy.blog.mapper.TagsMapper;
import com.zrkizzy.blog.service.IArticleService;
import com.zrkizzy.blog.service.ITagsService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.utils.CollectionUtil;
import com.zrkizzy.blog.utils.TimeUtil;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.ArticleVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-14
 */
@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements IArticleService {
    @Resource
    private ArticleMapper articleMapper;
    @Resource
    private CategoryMapper categoryMapper;
    @Resource
    private TagsMapper tagsMapper;

    @Resource
    private ITagsService tagsService;

    /**
     * 用户进行发布文章/保存草稿业务逻辑
     *
     * @param articleVO 文章数据传输对象
     * @return 前端响应对象
     */
    @Override
    public Result saveArticle(ArticleVO articleVO) {
        // 复制文章数据传递对象
        Article article = BeanCopyUtil.copy(articleVO, Article.class);
        // 发布时间
        article.setPublishTime(TimeUtil.stringToLocalDateTime(articleVO.getPublishTime()));
        // 更新时间
        article.setUpdateTime(LocalDateTime.now());
        // 评论数量和浏览数量
        article.setCommentNum(0);
        article.setViewNum(0);
        // 标签处理
        article.setTags(tagsService.tagsConvertIds(articleVO.getTags()));

        // 更新分类的文章数量
        Category category = categoryMapper.selectById(article.getCategory());
        category.setArticleAmount(category.getId() + 1);
        categoryMapper.updateById(category);
        // 将文章添加到数据库中
        int count = articleMapper.insert(article);
        if (count < 1) {
            return Result.error("文章发布失败");
        }
        // 判断文章状态是否为草稿
        if (article.getState().equals(0)) {
            return Result.success("草稿保存成功");
        }
        return Result.success("文章发布成功");
    }

    /**
     * 获取所有文章(分页)
     *
     * @param curPage  当前页数
     * @param size     页面大小
     * @param title    文章标题
     * @param state    发布状态 0 草稿箱 1 已发布 2 回收站
     * @param type     文章类型 1 原创 2 转载 3 翻译
     * @param category 文章分类ID
     * @param deleted  是否回收 1 已回收 0 未回收
     * @return 分页对象
     */
    @Override
    public PageVO getArticleList(Integer curPage, Integer size,
                                 String title, Integer state,
                                 Integer type, Integer category,
                                 Boolean deleted) {
        // 开启分页
        Page<Article> page = new Page<>(curPage, size);
        // 定义查询条件
        QueryWrapper<Article> queryWrapper = new QueryWrapper<>();
        // 标题
        queryWrapper.like("title", title);
        // 状态
        if (state != -1) {
            queryWrapper.eq("state", state);
        }
        // 定义文章类型查询条件
        if (type != 0) {
            queryWrapper.eq("type", type);
        }
        // 定义分类查询条件
        if (category != 0) {
            queryWrapper.eq("category", category);
        }
        // 回收站
        queryWrapper.eq("deleted", deleted);
        // 查询数据
        Page<Article> articlePage = articleMapper.selectPage(page, queryWrapper);
        // 对要进行返回的数据进行处理
        List<Article> list = articlePage.getRecords();
        // 定义返回的集合
        List<ArticleDto> result = new ArrayList<>();
        // 遍历查询到的集合对象
        for (Article article : list) {
            ArticleDto articleDto = BeanCopyUtil.copy(article, ArticleDto.class);
            // 将字符串类型的标签ID转为整型集合
            List<Integer> ids = CollectionUtil.stringToIntegerList(article.getTags());
            // 设置文章标签名称
            articleDto.setTags(tagsMapper.selectTagsByIds(ids));
            // 设置文章分类名称
            articleDto.setCategoryName(categoryMapper.selectById(article.getCategory()).getName());
            // 将设置好的文章数据返回对象添加到集合中
            result.add(articleDto);
        }
        // 返回查询到的数据
        return new PageVO(articlePage.getTotal(), result);
    }

    /**
     * 将文章批量移动到回收站
     *
     * @param ids 文章ID集合
     * @return 前端响应对象
     */
    @Override
    public Result removeArticleBatchIds(List<Integer> ids) {
        int count = articleMapper.removeArticleBatchIds(ids);
        if (count == ids.size()) {
            return Result.success("文章批量删除成功");
        }
        return Result.error("文章批量删除失败");
    }
}
