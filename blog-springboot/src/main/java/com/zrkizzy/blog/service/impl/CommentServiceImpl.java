package com.zrkizzy.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zrkizzy.blog.dto.CommentDTO;
import com.zrkizzy.blog.entity.Article;
import com.zrkizzy.blog.entity.Comment;
import com.zrkizzy.blog.entity.WebsiteOther;
import com.zrkizzy.blog.mapper.ArticleMapper;
import com.zrkizzy.blog.mapper.CommentMapper;
import com.zrkizzy.blog.service.CommentService;
import com.zrkizzy.blog.service.WebsiteOtherService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.utils.IpUtil;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.CommentVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import static com.zrkizzy.blog.constant.CommonConst.LOCAL_HOST;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-29
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {
    @Resource
    private WebsiteOtherService websiteOtherService;
    @Resource
    private ArticleMapper articleMapper;
    @Resource
    private CommentMapper commentMapper;

    /**
     * 获取评论列表(分页)
     *
     * @param curPage  当前页数
     * @param size     页面大小
     * @param nickName 用户昵称
     * @return 分页对象
     */
    @Override
    public PageVO getCommentList(Integer curPage, Integer size, String nickName) {
        // 开启分页
        Page<Comment> page = new Page<>(curPage, size);
        // 定义查询条件
        QueryWrapper<Comment> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("nick_name", nickName);
        Page<Comment> commentPage = commentMapper.selectPage(page, queryWrapper);
        return new PageVO(commentPage.getTotal(), commentPage.getRecords());
    }

    /**
     * 获取所有通过的评论列表
     *
     * @param curPage  当前页数
     * @param size     页面大小
     * @param nickName 用户昵称
     * @param allow    是否通过
     * @return 分页对象
     */
    @Override
    public PageVO getAllowCommentList(Integer curPage, Integer size, String nickName, Integer allow) {
        // 开启分页
        Page<Comment> page = new Page<>(curPage, size);
        // 定义查询条件
        QueryWrapper<Comment> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("nick_name", nickName).eq("allow", allow);
        // 查询分页
        Page<Comment> commentPage = commentMapper.selectPage(page, queryWrapper);
        return new PageVO(commentPage.getTotal(), commentPage.getRecords());
    }

    /**
     * 添加评论
     *
     * @param commentVO 评论数据传输对象
     * @param request request请求
     * @return 前端响应对象
     */
    @Override
    public Result addComment(CommentVO commentVO, HttpServletRequest request) {
        // 复制对象
        Comment comment = BeanCopyUtil.copy(commentVO, Comment.class);
        // 设置评论时间
        comment.setCommentTime(LocalDateTime.now());
        // 设置评论IP地址
        String ipAddress = IpUtil.getCurIpAddress(request);
        String ipSource = IpUtil.getIpSource(ipAddress);
        comment.setIpAddress(ipAddress);
        if (ipAddress.equals(LOCAL_HOST)) {
            ipSource = "本地登录";
        }
        comment.setIpSource(ipSource);
        // 获取网站信息对象
        WebsiteOther websiteInfo = websiteOtherService.getWebsiteInfo();
        if (!websiteInfo.getCommentAllow()) {
            // 将评论定义为已发布状态
            comment.setAllow(1);
        } else {
            comment.setAllow(0);
        }
        // 更新当前评论对应文章的评论数
        if (!comment.getArticleId().equals(0)) {
            // 如果当前评论的来源不是关于我页面
            Article article = articleMapper.selectById(comment.getArticleId());
            article.setCommentNum(article.getCommentNum() + 1);
            articleMapper.updateById(article);
        }
        // 添加评论到数据库
        if (commentMapper.insert(comment) < 1) {
            return Result.error("评论失败");
        }
        if (websiteInfo.getCommentAllow()) {
            return Result.success("评论成功，请等待管理员审核");
        }
        return Result.success("评论成功");
    }

    /**
     * 获取指定文章的评论列表
     *
     * @param curPage 当前页数
     * @param size    页面大小
     * @param id      文章ID
     * @return 评论列表
     */
    @Override
    public PageVO listComment(Integer curPage, Integer size, Integer id) {
        // 开启分页
        Page<Comment> page = new Page<>(curPage, size);
        // 定义查询条件
        QueryWrapper<Comment> queryWrapper = new QueryWrapper<>();
        // 查询当前文章通过审核的评论总数
        queryWrapper.eq("article_id", id).eq("allow", 1);
        List<Comment> comments = commentMapper.selectList(queryWrapper);
        // 查询当前文章的一级评论总数
        queryWrapper.eq("parent_id", 0);
        // 查询分页
        Page<Comment> commentPage = commentMapper.selectPage(page, queryWrapper);
        // 复制集合对象
        List<CommentDTO> commentDTOList = BeanCopyUtil.copyList(commentPage.getRecords(), CommentDTO.class);
        // 查询所有评论
        for (CommentDTO commentDTO : commentDTOList) {
            setCommentChild(commentDTO, comments);
        }
        return new PageVO((long) comments.size(), commentDTOList);
    }

    /**
     * 封装集合对象
     *
     * @param commentDTO 评论数据传输对象
     * @param commentList 所有评论集合对象
     */
    private void setCommentChild(CommentDTO commentDTO, List<Comment> commentList) {
        List<Comment> children = new ArrayList<>();
        for (Comment comment : commentList) {
            if (commentDTO.getId().equals(comment.getParentId())) {
                children.add(comment);
            }
        }
        commentDTO.setChildren(children);
    }
}
