package com.zrkizzy.blog.service;

import com.zrkizzy.blog.entity.Comment;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.CommentVO;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-29
 */
public interface CommentService extends IService<Comment> {

    /**
     * 获取评论列表(分页)
     *
     * @param curPage 当前页数
     * @param size 页面大小
     * @param nickName 用户昵称
     * @return 分页对象
     */
    PageVO getCommentList(Integer curPage, Integer size, String nickName);

    /**
     * 获取所有通过的评论列表
     *
     * @param curPage 当前页数
     * @param size 页面大小
     * @param nickName 用户昵称
     * @param allow 是否通过
     * @return 分页对象
     */
    PageVO getAllowCommentList(Integer curPage, Integer size, String nickName, Integer allow);

    /**
     * 添加评论
     *
     * @param commentVO 评论数据传输对象
     * @param request request请求
     * @return 前端响应对象
     */
    Result addComment(CommentVO commentVO, HttpServletRequest request);

    /**
     * 获取指定文章的评论列表
     *
     * @param curPage 当前页数
     * @param size 页面大小
     * @param id 文章ID
     * @return 评论列表
     */
    PageVO listComment(Integer curPage, Integer size, Integer id);
}
