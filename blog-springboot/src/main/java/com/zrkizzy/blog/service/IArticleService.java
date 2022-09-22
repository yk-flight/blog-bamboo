package com.zrkizzy.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zrkizzy.blog.entity.Article;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.ArticleVO;

import java.util.List;

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

    /**
     * 获取所有文章(分页)
     *
     * @param curPage 当前页数
     * @param size 页面大小
     * @param title 文章标题
     * @param state 发布状态 0 草稿箱 1 已发布 2 回收站
     * @param type 文章类型 1 原创 2 转载 3 翻译
     * @param category 文章分类ID
     * @param deleted 是否回收 1 已回收 0 未回收
     * @return 分页对象
     */
    PageVO getArticleList(Integer curPage, Integer size, String title, Integer state, Integer type, Integer category, Boolean deleted);

    /**
     * 将文章批量移动到回收站
     *
     * @param ids 文章ID集合
     * @return 前端响应对象
     */
    Result removeArticleBatchIds(List<Integer> ids);
}
