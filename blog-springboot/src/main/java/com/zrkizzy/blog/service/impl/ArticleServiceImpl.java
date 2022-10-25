package com.zrkizzy.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zrkizzy.blog.annotation.LogAnnotation;
import com.zrkizzy.blog.dto.ArticleDTO;
import com.zrkizzy.blog.entity.Article;
import com.zrkizzy.blog.entity.Category;
import com.zrkizzy.blog.entity.Tags;
import com.zrkizzy.blog.mapper.ArticleMapper;
import com.zrkizzy.blog.mapper.CategoryMapper;
import com.zrkizzy.blog.mapper.TagsMapper;
import com.zrkizzy.blog.service.ArticleService;
import com.zrkizzy.blog.service.TagsService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.utils.CollectionUtil;
import com.zrkizzy.blog.utils.TimeUtil;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.ArchiveVO;
import com.zrkizzy.blog.vo.ArticleVO;
import com.zrkizzy.blog.vo.ArticlesVO;
import com.zrkizzy.blog.vo.RecommendVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.zrkizzy.blog.constant.CommonConst.CATEGORY;
import static com.zrkizzy.blog.constant.CommonConst.TAG;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-14
 */
@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements ArticleService {
    @Resource
    private ArticleMapper articleMapper;
    @Resource
    private CategoryMapper categoryMapper;
    @Resource
    private TagsMapper tagsMapper;

    @Resource
    private TagsService tagsService;

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
        article.setTags(tagsService.tagsConvertIds(articleVO.getTags(), true));

        // 更新分类的文章数量
        Category category = categoryMapper.selectById(article.getCategory());
        category.setArticleAmount(category.getArticleAmount() + 1);
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
        List<ArticleDTO> result = new ArrayList<>();
        // 遍历查询到的集合对象
        for (Article article : list) {
            ArticleDTO articleDto = BeanCopyUtil.copy(article, ArticleDTO.class);
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

    /**
     * 批量恢复删除的文章
     *
     * @param ids 文章ID集合
     * @return 前端响应对象
     */
    @Override
    public Result recoverArticleBatchIds(List<Integer> ids) {
        int count = articleMapper.recoverArticleBatchIds(ids);
        if (count == ids.size()) {
            return Result.success("文章批量恢复成功");
        }
        return Result.error("文章批量恢复失败");
    }

    /**
     * 删除指定文章
     *
     * @param id 文章ID
     * @return 前端响应对象
     */
    @Override
    @LogAnnotation(module = "文章管理模块", description = "删除指定文章")
    @Transactional(rollbackFor = RuntimeException.class)
    public Result deleteArticle(Integer id) {
        // 处理文章对应的标签以及分类数据
        deleteTagsAndCategoryNum(id);
        // 删除文章并返回
        int count = articleMapper.deleteById(id);
        if (count > 0) {
            return Result.success("文章删除成功");
        }
        return Result.error("文章删除失败");
    }

    /**
     * 批量删除回收站中的文章
     *
     * @param ids 文章ID集合
     * @return 前端响应对象
     */
    @Override
    @LogAnnotation(module = "文章管理模块", description = "批量删除回收站中的文章")
    @Transactional(rollbackFor = RuntimeException.class)
    public Result deleteArticleBatchIds(List<Integer> ids) {
        if (ids == null || ids.size() == 0) {
            return Result.error("请选择要删除的文章");
        }
        // 更新文章对应分类以及标签下的文章数量
        for (Integer id : ids) {
            deleteTagsAndCategoryNum(id);
        }
        // 批量删除文章
        int count = articleMapper.deleteBatchIds(ids);
        if (count == ids.size()) {
            return Result.success("文章删除成功");
        }
        return Result.error("文章删除失败");
    }

    /**
     * 更新文章操作
     *
     * @param articleVO 文章数据传输对象
     * @return 前端响应对象
     */
    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public Result updateArticle(ArticleVO articleVO) {
        // 更新当前文章的分类数据以及标签数据
        updateCategoryAndTags(articleVO);
        // 复制文章数据传递对象
        Article article = BeanCopyUtil.copy(articleVO, Article.class);
        // 发布时间
        article.setPublishTime(TimeUtil.stringToLocalDateTime(articleVO.getPublishTime()));
        // 更新时间
        article.setUpdateTime(LocalDateTime.now());
        // 标签处理
        article.setTags(tagsService.tagsConvertIds(articleVO.getTags(), false));
        // 更新文章对象
        int count = articleMapper.updateById(article);

        if (count < 1) {
            return Result.error("文章保存失败");
        }
        if (article.getState().equals(1)) {
            return Result.success("文章发布成功");
        }
        return Result.success("文章保存成功");
    }

    /**
     * 博客前台获取文章归档数据
     *
     * @param curPage 当前页数
     * @param size    页面大小
     * @return 前端分页对象
     */
    @Override
    public PageVO getArchiveList(Integer curPage, Integer size) {
        // 开启分页
        Page<Article> page = new Page<>(curPage, size);
        // 定义查询条件
        QueryWrapper<Article> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("publish_time")
                .eq("state", 1)
                .eq("deleted", 0);
        Page<Article> articles = articleMapper.selectPage(page, queryWrapper);
        // 处理查询到的结果并返回
        return new PageVO(articles.getTotal(), BeanCopyUtil.copyList(articles.getRecords(), ArchiveVO.class));
    }

    /**
     * 获取所有前台文章(分页)
     *
     * @param curPage  当前页数
     * @param size     页面大小
     * @return 分页对象
     */
    @Override
    public PageVO listArticle(Integer curPage, Integer size) {
        // 开启分页
        Page<Article> page = new Page<>(curPage, size);
        // 定义查询条件
        QueryWrapper<Article> queryWrapper = new QueryWrapper<>();
        // 发布状态和是否在回收站
        queryWrapper.eq("state", 1)
                .eq("deleted", 0)
                .orderByDesc("top")
                .orderByDesc("publish_time");
        // 查询数据
        IPage<Article> articlePage = articleMapper.selectPage(page, queryWrapper);
        // 定义返回结果
        List<ArticlesVO> result = new ArrayList<>();
        // 对要进行返回的数据进行处理
        List<Article> list = articlePage.getRecords();
        for (Article article : list) {
            ArticlesVO articlesVO = BeanCopyUtil.copy(article, ArticlesVO.class);
            // 将字符串类型的标签ID转为整型集合
            List<Integer> ids = CollectionUtil.stringToIntegerList(article.getTags());
            // 设置标签集合
            articlesVO.setTags(tagsMapper.listTagsByIds(ids));
            // 设置文章分类名称
            articlesVO.setCategoryName(categoryMapper.selectById(article.getCategory()).getName());
            result.add(articlesVO);
        }
        return new PageVO(articlePage.getTotal(), result);
    }

    /**
     * 根据文章ID获取到文章对象
     *
     * @param id 文章ID
     * @return 文章数据传输对象
     */
    @Override
    public ArticleDTO getArticleById(Integer id) {
        // 获取到对应的文章信息对象
        Article article = articleMapper.selectById(id);
        // 更新当前文章的访问量
        articleMapper.updateArticleById(article.getId(), article.getViewNum() + 1);
        ArticleDTO articleDTO = BeanCopyUtil.copy(article, ArticleDTO.class);
        // 将字符串类型的标签ID转为整型集合
        List<Integer> ids = CollectionUtil.stringToIntegerList(article.getTags());
        // 设置文章标签名称
        articleDTO.setTags(tagsMapper.selectTagsByIds(ids));
        // 设置文章分类名称
        articleDTO.setCategoryName(categoryMapper.selectById(article.getCategory()).getName());
        return articleDTO;
    }

    /**
     * 获取相关推荐文章
     *
     * @return 相关推荐文章
     */
    @Override
    public List<RecommendVO> listRecommend() {
        // 定义查询条件
        QueryWrapper<Article> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("state", 1)
                .eq("deleted", 0)
                .orderByDesc("view_num")
                .last("limit 5");
        // 处理查询到的文章并返回结果
        return BeanCopyUtil.copyList(articleMapper.selectList(queryWrapper), RecommendVO.class);
    }

    /**
     * 获取文章列表
     *
     * @param curPage 当前页数
     * @param size    页面大小
     * @param path    标签 / 分类
     * @param id      对应ID
     * @return 哈希表
     */
    @Override
    public Map<String, Object> listArticleById(Integer curPage, Integer size, String path, Integer id) {
        String name = "";
        // 开启分页
        Page<Article> page = new Page<>(curPage, size);
        // 定义查询条件
        QueryWrapper<Article> queryWrapper = new QueryWrapper<>();
        // 已发布和未删除
        queryWrapper.eq("state", 1)
                .eq("deleted", 0);
        // 判断路径
        if (path.equals(CATEGORY)) {
            // 根据分类查询文章
            queryWrapper.eq("category", id);
            name = categoryMapper.selectById(id).getName();
        } else {
            name = tagsMapper.selectById(id).getName();
        }
        // 查询数据
        IPage<Article> articlePage = articleMapper.selectPage(page, queryWrapper);
        // 定义返回结果
        List<ArticlesVO> result = new ArrayList<>();
        // 对要进行返回的数据进行处理
        List<Article> list = articlePage.getRecords();
        for (Article article : list) {
            ArticlesVO articlesVO = BeanCopyUtil.copy(article, ArticlesVO.class);
            // 将字符串类型的标签ID转为整型集合
            List<Integer> ids = CollectionUtil.stringToIntegerList(article.getTags());
            // 设置标签集合
            articlesVO.setTags(tagsMapper.listTagsByIds(ids));
            // 设置文章分类名称
            articlesVO.setCategoryName(categoryMapper.selectById(article.getCategory()).getName());
            if (path.equals(TAG) && ids != null && ids.contains(id)) {
                result.add(articlesVO);
            } else if (path.equals(CATEGORY)) {
                result.add(articlesVO);
            }
        }
        Map<String, Object> map = new HashMap<>();
        map.put("page", new PageVO((long) result.size(), result));
        map.put("name", name);
        return map;
    }


    /**
     * 更新当前文章的分类以及标签对应的文章数量
     *
     * @param articleVO 文章数据传输对象
     */
    private void updateCategoryAndTags(ArticleVO articleVO) {
        // 通过ID获取到文章对象
        Article article = articleMapper.selectById(articleVO.getId());
        // 如果文章到分类发生了变化
        if (!article.getCategory().equals(articleVO.getCategory())) {
            // 更新分类数据
            Category oldCategory = categoryMapper.selectById(article.getCategory());
            Category newCategory = categoryMapper.selectById(articleVO.getCategory());
            oldCategory.setArticleAmount(oldCategory.getArticleAmount() - 1);
            newCategory.setArticleAmount(newCategory.getArticleAmount() + 1);
            categoryMapper.updateById(oldCategory);
            categoryMapper.updateById(newCategory);
        }

        // 查看标签数据是否发生变化
        String tagsIds = tagsService.tagsConvertIds(articleVO.getTags(), false);
        System.out.println(tagsIds);
        if (!tagsIds.equals(article.getTags())) {
            // 将原本所有的标签数进行-1操作，将新的所有标签进行+1操作
            updateTagsArticleNum(CollectionUtil.stringToIntegerList(article.getTags()),
                    CollectionUtil.stringToIntegerList(tagsIds));
        }
    }

    /**
     * 修改标签对应的文章数<br/>
     * 1. 旧标签对应的文章数执行 - 1操作<br/>
     * 2. 新标签对应的文章数执行 + 1操作<br/>
     *
     * @param oldIds 旧的标签ID集合
     * @param newIds 新的标签ID集合
     */
    private void updateTagsArticleNum(List<Integer> oldIds, List<Integer> newIds) {
        // 旧标签对应的文章数执行-1
        for (Integer id : oldIds) {
            Tags tags = tagsMapper.selectById(id);
            tags.setArticleNum(tags.getArticleNum() - 1);
            tagsMapper.updateById(tags);
        }
        // 新标签对应的文章数+1
        for (Integer id : newIds) {
            Tags tags = tagsMapper.selectById(id);
            tags.setArticleNum(tags.getArticleNum() + 1);
            tagsMapper.updateById(tags);
        }
    }

    /**
     * 删除文章对应的分类以及标签的文章数量
     *
     * @param id 文章ID
     */
    private void deleteTagsAndCategoryNum(Integer id) {
        // 获取对应的文章对象
        Article article = articleMapper.selectById(id);
        // 更新文章对应分类下的文章数量
        Category category = categoryMapper.selectById(article.getCategory());
        category.setArticleAmount(category.getArticleAmount() - 1);
        categoryMapper.updateById(category);
        // 更新文章对应标签下的文章数量
        List<Integer> tagIds = CollectionUtil.stringToIntegerList(article.getTags());
        // 查询到当前文章的标签
        if (tagIds != null && tagIds.size() > 0) {
            for (Integer tagId : tagIds) {
                // 删除当前标签的文章数量
                Tags tags = tagsMapper.selectById(tagId);
                tags.setArticleNum(tags.getArticleNum() - 1);
                // 更新标签对象
                tagsMapper.updateById(tags);
            }
        }
    }
}
