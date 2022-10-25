package com.zrkizzy.blog.controller;

import com.zrkizzy.blog.dto.CategoryDTO;
import com.zrkizzy.blog.entity.Category;
import com.zrkizzy.blog.service.CategoryService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.CategoryVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

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
    @GetMapping("/admin/getCategoryByPage")
    public PageVO getCategoryByPage(@RequestParam("curPage") Integer curPage, @RequestParam("size") Integer size, @RequestParam("name") String name) {
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
    @DeleteMapping("/admin/deleteCategoryBatchIds/{ids}")
    public Result deleteCategoryBatchIds(@PathVariable Integer[] ids) {
        return categoryService.deleteCategoryBatchIds(ids);
    }

    @ApiOperation("更新指定的文章分类")
    @PutMapping("/admin/updateCategory")
    public Result updateCategory(@RequestBody CategoryDTO categoryDto) {
        return categoryService.updateCategory(categoryDto);
    }

    @ApiOperation("获取所有文章分类")
    @GetMapping("/category/getAllCategory")
    public List<CategoryVO> getAllCategory() {
        List<Category> list = categoryService.getAllCategory();
        // 复制集合对象并返回
        return BeanCopyUtil.copyList(list, CategoryVO.class);
    }
}
