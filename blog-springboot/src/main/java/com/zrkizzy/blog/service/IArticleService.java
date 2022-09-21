package com.zrkizzy.blog.service;

import com.zrkizzy.blog.entity.Article;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.ArticleVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-14
 */
public interface IArticleService extends IService<Article> {

    /**
     * 用户进行发布文章/保存草稿业务逻辑
     *
     * @param articleVO 文章数据传输对象
     * @return 前端响应对象
     */
    Result saveArticle(ArticleVO articleVO);
}
