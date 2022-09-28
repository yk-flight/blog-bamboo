package com.zrkizzy.blog.controller;


import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.zrkizzy.blog.annotation.LogAnnotation;
import com.zrkizzy.blog.dto.MessageDTO;
import com.zrkizzy.blog.entity.Message;
import com.zrkizzy.blog.service.MessageService;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;
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
 * @since 2022-09-28
 */
@RestController
@Api(tags = "MessageController")
@RequestMapping("/message")
public class MessageController {
    @Resource
    private MessageService messageService;

    @ApiOperation("获取所有留言（分页）")
    @GetMapping("/getMessageList")
    public PageVO getMessageList(@RequestParam("curPage") Integer curPage,
                                 @RequestParam("size") Integer size,
                                 @RequestParam("nickName") String nickName,
                                 @RequestParam("allow") Integer allow) {
        return messageService.getMessageList(curPage, size, nickName, allow);
    }

    @ApiOperation("新增留言")
    @PostMapping("/addMessage")
    public Result addMessage(@RequestBody MessageDTO messageDTO, HttpServletRequest request) {
        return messageService.addMessage(messageDTO, request);
    }

    @ApiOperation("删除指定留言")
    @LogAnnotation(module = "留言模块", description = "删除指定留言")
    @DeleteMapping("/deleteMessageById/{id}")
    public Result deleteMessageById(@PathVariable Integer id) {
        if (messageService.removeById(id)) {
            return Result.success("删除成功");
        }
        return Result.error("删除失败");
    }

    @ApiOperation("批量删除留言")
    @LogAnnotation(module = "留言模块", description = "批量删除留言")
    @DeleteMapping("/deleteMessageBatchIds/{ids}")
    public Result deleteMessageBatchIds(@PathVariable Integer[] ids) {
        if (messageService.removeByIds(Arrays.asList(ids))) {
            return Result.success("批量删除成功");
        }
        return Result.error("批量删除失败");
    }

    @ApiOperation("通过审核留言")
    @LogAnnotation(module = "留言模块", description = "通过审核留言")
    @GetMapping("/passMessageById/{id}")
    public Result passMessageById(@PathVariable Integer id) {
        // 定义更新条件
        LambdaUpdateWrapper<Message> lambdaUpdateWrapper = new LambdaUpdateWrapper<>();
        lambdaUpdateWrapper.eq(Message::getId, id).set(Message::getAllow, 1);
        if (messageService.update(lambdaUpdateWrapper)) {
            return Result.success("留言审核通过成功");
        }
        return Result.error("留言审核通过失败");
    }

    @ApiOperation("批量审核通过留言")
    @LogAnnotation(module = "留言模块", description = "批量审核通过留言")
    @GetMapping("/passMessageBatchIds/{ids}")
    public Result passMessageBatchIds(@PathVariable Integer[] ids) {
        // 定义更新条件
        LambdaUpdateWrapper<Message> lambdaUpdateWrapper = new LambdaUpdateWrapper<>();
        int count = 0;
        for (Integer id : ids) {
            // 清空上一次更新条件
            lambdaUpdateWrapper.clear();
            // 定义本次更新条件
            lambdaUpdateWrapper.eq(Message::getId, id).set(Message::getAllow, 1);
            if (messageService.update(lambdaUpdateWrapper)) {
                count++;
            }
        }
        if (count == ids.length) {
            return Result.success("留言审核批量通过成功");
        }
        return Result.error("留言审核批量通过失败");
    }
}
