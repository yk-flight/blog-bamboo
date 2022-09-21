package com.zrkizzy.blog.service.impl;

import com.zrkizzy.blog.entity.Article;
import com.zrkizzy.blog.entity.Category;
import com.zrkizzy.blog.mapper.ArticleMapper;
import com.zrkizzy.blog.mapper.CategoryMapper;
import com.zrkizzy.blog.service.IArticleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zrkizzy.blog.service.ITagsService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.utils.TimeUtil;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.ArticleVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;

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
        if (!article.getState()) {
            return Result.success("草稿保存成功");
        }
        return Result.success("文章发布成功");
    }
}
