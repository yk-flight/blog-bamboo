package com.zrkizzy.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zrkizzy.blog.dto.ArticleDTO;
import com.zrkizzy.blog.entity.Article;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.ArticleVO;
import com.zrkizzy.blog.vo.RecommendVO;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-14
 */
public interface ArticleService extends IService<Article> {

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

    /**
     * 批量恢复删除的文章
     *
     * @param ids 文章ID集合
     * @return 前端响应对象
     */
    Result recoverArticleBatchIds(List<Integer> ids);

    /**
     * 删除指定文章
     *
     * @param id 文章ID
     * @return 前端响应对象
     */
    Result deleteArticle(Integer id);

    /**
     * 批量删除回收站中的文章
     *
     * @param ids 文章ID集合
     * @return 前端响应对象
     */
    Result deleteArticleBatchIds(List<Integer> ids);

    /**
     * 更新文章操作
     *
     * @param articleVO 文章数据传输对象
     * @return 前端响应对象
     */
    Result updateArticle(ArticleVO articleVO);

    /**
     * 博客前台获取文章归档数据
     *
     * @param curPage 当前页数
     * @param size 页面大小
     * @return 前端分页对象
     */
    PageVO getArchiveList(Integer curPage, Integer size);

    /**
     * 获取所有前台文章(分页)
     *
     * @param curPage 当前页数
     * @param size 页面大小
     * @return 分页对象
     */
    PageVO listArticle(Integer curPage, Integer size);

    /**
     * 根据文章ID获取到文章对象
     *
     * @param id 文章ID
     * @return 文章数据传输对象
     */
    ArticleDTO getArticleById(Integer id);

    /**
     * 获取相关推荐文章
     *
     * @return 相关推荐文章
     */
    List<RecommendVO> listRecommend();

    /**
     * 获取文章列表
     *
     * @param curPage 当前页数
     * @param size 页面大小
     * @param path 标签 / 分类
     * @param id 对应ID
     * @return 哈希表
     */
    Map<String, Object> listArticleById(Integer curPage, Integer size, String path, Integer id);
}
