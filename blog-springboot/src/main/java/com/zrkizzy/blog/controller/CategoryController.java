package com.zrkizzy.blog.controller;

import com.zrkizzy.blog.dto.CategoryDto;
import com.zrkizzy.blog.service.CategoryService;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.CategoryVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 文章分类控制器
 *
 * @author zhangrongkang
 * @date 2022/8/18
 */
@Api(tags = "CategoryController")
@RestController
public class CategoryController {
    @Resource
    private CategoryService categoryService;

    @ApiOperation("获取所有文章分类（分页）")
    @PostMapping("/admin/getCategoryByPage")
    public PageVO getCategoryByPage(Integer curPage,Integer size, String name) {
        return categoryService.getCategoryByPage(curPage, size, name);
    }

    @ApiOperation("新增文章分类")
    @PostMapping("/admin/insertCategory")
    public Result insertCategory(@RequestBody CategoryVO categoryVO) {
        return categoryService.insertCategory(categoryVO);
    }

    @ApiOperation("删除指定的文章分类")
    @DeleteMapping("/admin/deleteCategory/{id}")
    public Result deleteCategory(@PathVariable Integer id) {
        return categoryService.deleteCategory(id);
    }

    @ApiOperation("批量删除文章分类")
    @DeleteMapping("/admin/deleteCategoryBatchIds")
    public Result deleteCategoryBatchIds(Integer[] ids) {
        return categoryService.deleteCategoryBatchIds(ids);
    }

    @ApiOperation("更新指定的文章分类")
    @PostMapping("/admin/updateCategory")
    public Result updateCategory(@RequestBody CategoryDto categoryDto) {
        return categoryService.updateCategory(categoryDto);
    }
}
