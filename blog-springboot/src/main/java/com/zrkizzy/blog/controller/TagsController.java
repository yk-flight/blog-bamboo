package com.zrkizzy.blog.controller;


import com.zrkizzy.blog.annotation.LogAnnotation;
import com.zrkizzy.blog.dto.TagsDTO;
import com.zrkizzy.blog.entity.Tags;
import com.zrkizzy.blog.service.TagsService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.TagsVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-14
 */
@RestController
@Api(tags = "TagsController")
@RequestMapping("/tags")
public class TagsController {
    @Resource
    private TagsService tagsService;

    @ApiOperation("获取所有标签(分页)")
    @GetMapping("/getTagsList")
    public PageVO getTagsList(@RequestParam("name") String name,
                              @RequestParam("curPage") Integer curPage,
                              @RequestParam("size") Integer size) {
        return tagsService.getTagsList(name, curPage, size);
    }

    @ApiOperation("添加标签")
    @LogAnnotation(module = "标签模块", description = "添加新标签")
    @PostMapping("/insertTags")
    public Result insertTags(@RequestBody TagsVO tagsVO) {
        // 复制标签对象
        Tags tags = BeanCopyUtil.copy(tagsVO, Tags.class);
        // 设置标签对象的创建时间
        tags.setCreateTime(LocalDateTime.now());
        // 设置标签的文章数量
        tags.setArticleNum(0);
        if (tagsService.save(tags)) {
            return Result.success("标签添加成功");
        }
        return Result.error("标签添加失败");
    }

    @ApiOperation("删除标签")
    @LogAnnotation(module = "标签模块", description = "删除标签")
    @DeleteMapping("/deleteTags/{id}")
    public Result deleteTags(@PathVariable Integer id) {
        // 判断当前标签下是否还有文章
        Tags tags = tagsService.getById(id);
        if (tags.getArticleNum() > 0) {
            return Result.error("删除失败，当前标签下还有文章");
        }
        if (tagsService.removeById(id)) {
            return Result.success("标签删除成功");
        }
        return Result.error("标签删除失败");
    }

    @ApiOperation("批量删除标签")
    @LogAnnotation(module = "标签模块", description = "批量删除标签")
    @DeleteMapping("/deleteTagsBatchIds/{ids}")
    public Result deleteTagsBatchIds(@PathVariable Integer[] ids) {
        List<Tags> tags = tagsService.listByIds(Arrays.asList(ids));
        // 判断当前标签下是否还有文章
        for (Tags tag : tags) {
            if (tag.getArticleNum() > 0) {
                return Result.error("删除失败，" + tag.getName() + " 中还有文章");
            }
        }
        if (tagsService.removeByIds(Arrays.asList(ids))) {
            return Result.success("标签删除成功");
        }
        return Result.error("标签删除失败");
    }

    @ApiOperation("更新标签")
    @LogAnnotation(module = "标签模块", description = "更新标签")
    @PostMapping("/updateTags")
    public Result updateTags(@RequestBody TagsVO tagsVO) {
        Tags tags = BeanCopyUtil.copy(tagsVO, Tags.class);
        if (tagsService.updateById(tags)) {
            return Result.success("标签更新成功");
        }
        return Result.error("标签更新失败");
    }

    @ApiOperation("获取所有标签")
    @GetMapping("/getAllTags")
    public List<TagsDTO> getAllTags() {
        List<Tags> list = tagsService.list();
        // 复制集合对象并返回
        return BeanCopyUtil.copyList(list, TagsDTO.class);
    }
}
