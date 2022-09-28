package com.zrkizzy.blog.controller;


import com.zrkizzy.blog.annotation.LogAnnotation;
import com.zrkizzy.blog.entity.Links;
import com.zrkizzy.blog.service.LinksService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.LinksVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-24
 */
@RestController
@Api(tags = "LinksController")
@RequestMapping("/links")
public class LinksController {
    @Resource
    private LinksService linksService;

    @ApiOperation("获取友链列表(分页)")
    @GetMapping("/getLinksList")
    public PageVO getLinksList(@RequestParam("curPage") Integer curPage,
                               @RequestParam("size") Integer size,
                               @RequestParam("title") String title) {
        return linksService.getLinksList(curPage, size, title);
    }

    @ApiOperation("更新友链")
    @LogAnnotation(module = "友链模块", description = "更新友链")
    @PutMapping("/updateLinks")
    public Result updateLinks(@RequestBody LinksVO linksVO) {
        // 复制友链对象
        Links links = BeanCopyUtil.copy(linksVO, Links.class);
        // 更新友链并返回结果
        if (linksService.updateById(links)) {
            return Result.success("友链更新成功");
        }
        return Result.error("友链更新失败");
    }

    @ApiOperation("添加友链")
    @LogAnnotation(module = "友链模块", description = "添加友链")
    @PostMapping("/addLinks")
    public Result addLinks(@RequestBody LinksVO linksVO) {
        // 复制友链对象
        Links links = BeanCopyUtil.copy(linksVO, Links.class);
        // 更新友链并返回结果
        if (linksService.save(links)) {
            return Result.success("友链添加成功");
        }
        return Result.error("友链添加失败");
    }

    @ApiOperation("删除友链")
    @LogAnnotation(module = "友链模块", description = "删除友链")
    @DeleteMapping("/deleteLinkById/{id}")
    public Result deleteLinkById(@PathVariable Integer id) {
        // 删除友链对象并返回结果
        if (linksService.removeById(id)) {
            return Result.success("友链删除成功");
        }
        return Result.error("友链删除失败");
    }
}
