package com.zrkizzy.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zrkizzy.blog.dto.CategoryDTO;
import com.zrkizzy.blog.entity.Category;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.CategoryVO;

import java.util.List;

/**
 * @author zhangrongkang
 * @date 2022/8/18
 */
public interface CategoryService extends IService<Category> {

    /**
     * 查询指定的文章分类列表（分页）
     *
     * @param curPage 当前页数
     * @param size 页面大小
     * @param name 分类名称
     * @return 分页对象
     */
    PageVO getCategoryByPage(Integer curPage, Integer size, String name);

    /**
     * 新增文章分类
     *
     * @param categoryVO 文章分类参数对象
     * @return 前端返回对象
     */
    Result insertCategory(CategoryVO categoryVO);

    /**
     * 删除指定的文章分类
     *
     * @param id 文章分类ID
     * @return 前端返回对象
     */
    Result deleteCategory(Integer id);

    /**
     * 批量删除文章分类
     *
     * @param ids 文章分类ID数组
     * @return 前端返回对象
     */
    Result deleteCategoryBatchIds(Integer[] ids);

    /**
     * 更新指定的文章分类
     *
     * @param categoryDto 文章分类参数对象
     * @return 前端返回对象
     */
    Result updateCategory(CategoryDTO categoryDto);

    /**
     * 获取所有文章分类
     *
     * @return 所有文章分类集合
     */
    List<Category> getAllCategory();

    /**
     * 博客前台获取分类集合
     *
     * @param curPage 当前页数
     * @param size 页面大小
     * @return 文章分页对象
     */
    PageVO getCategoryList(Integer curPage, Integer size);
}
