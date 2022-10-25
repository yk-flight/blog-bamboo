package com.zrkizzy.blog.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.zrkizzy.blog.annotation.LogAnnotation;
import com.zrkizzy.blog.entity.Comment;
import com.zrkizzy.blog.service.CommentService;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.CommentVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-29
 */
@RestController
@Api(tags = "CommentController")
@RequestMapping("/comment")
public class CommentController {
    @Resource
    private CommentService commentService;

    @ApiOperation("获取所有评论列表（嵌套分页）")
    @GetMapping("/getCommentList")
    public PageVO getCommentList(@RequestParam("curPage") Integer curPage,
                                 @RequestParam("size") Integer size,
                                 @RequestParam("nickName") String nickName) {
        return commentService.getCommentList(curPage, size, nickName);
    }

    @ApiOperation("添加评论")
    @PostMapping("/addComment")
    public Result addComment(@RequestBody CommentVO commentVO, HttpServletRequest request) {
        return commentService.addComment(commentVO, request);
    }

    @ApiOperation("根据通过状态获取评论列表（分页）")
    @GetMapping("/getAllowCommentList")
    public PageVO getAllowCommentList(@RequestParam("curPage") Integer curPage,
                                 @RequestParam("size") Integer size,
                                 @RequestParam("nickName") String nickName,
                                 @RequestParam("allow") Integer allow) {
        return commentService.getAllowCommentList(curPage, size, nickName, allow);
    }

    @ApiOperation("删除指定评论")
    @LogAnnotation(module = "评论模块", description = "删除指定评论")
    @DeleteMapping("/deleteCommentById/{id}")
    public Result deleteCommentById(@PathVariable Integer id) {
        // 删除当前评论的子评论
        commentService.remove(new QueryWrapper<Comment>().eq("parent_id", id));
        if (commentService.removeById(id)) {
            return Result.success("删除成功");
        }
        return Result.error("删除失败");
    }

    @ApiOperation("批量删除评论")
    @LogAnnotation(module = "评论模块", description = "批量删除评论")
    @DeleteMapping("/deleteCommentBatchIds/{ids}")
    public Result deleteCommentBatchIds(@PathVariable Integer[] ids) {
        if (commentService.removeByIds(Arrays.asList(ids))) {
            return Result.success("批量删除成功");
        }
        return Result.error("批量删除失败");
    }

    @ApiOperation("通过审核评论")
    @LogAnnotation(module = "评论模块", description = "通过审核评论")
    @GetMapping("/passCommentById/{id}")
    public Result passCommentById(@PathVariable Integer id) {
        // 定义更新条件
        LambdaUpdateWrapper<Comment> lambdaUpdateWrapper = new LambdaUpdateWrapper<>();
        lambdaUpdateWrapper.eq(Comment::getId, id).set(Comment::getAllow, 1);
        if (commentService.update(lambdaUpdateWrapper)) {
            return Result.success("评论审核通过成功");
        }
        return Result.error("评论审核通过失败");
    }

    @ApiOperation("批量审核通过评论")
    @LogAnnotation(module = "评论模块", description = "批量审核通过评论")
    @GetMapping("/passCommentBatchIds/{ids}")
    public Result passCommentBatchIds(@PathVariable Integer[] ids) {
        // 定义更新条件
        LambdaUpdateWrapper<Comment> lambdaUpdateWrapper = new LambdaUpdateWrapper<>();
        int count = 0;
        for (Integer id : ids) {
            // 清空上一次更新条件
            lambdaUpdateWrapper.clear();
            // 定义本次更新条件
            lambdaUpdateWrapper.eq(Comment::getId, id).set(Comment::getAllow, 1);
            if (commentService.update(lambdaUpdateWrapper)) {
                count++;
            }
        }
        if (count == ids.length) {
            return Result.success("评论审核批量通过成功");
        }
        return Result.error("评论审核批量通过失败");
    }

}
