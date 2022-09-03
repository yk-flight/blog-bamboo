package com.zrkizzy.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zrkizzy.blog.annotation.LogAnnotation;
import com.zrkizzy.blog.dto.CategoryDto;
import com.zrkizzy.blog.entity.Category;
import com.zrkizzy.blog.mapper.CategoryMapper;
import com.zrkizzy.blog.service.CategoryService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.CategoryVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Date;

/**
 * @author zhangrongkang
 * @date 2022/8/18
 */
@Service
public class CategoryServiceImpl implements CategoryService {
    @Resource
    private CategoryMapper categoryMapper;

    /**
     * 查询指定的文章分类列表（分页）
     *
     * @param curPage 当前页数
     * @param size    页面大小
     * @param name    分类名称
     * @return 分页对象
     */
    @Override
    public PageVO getCategoryByPage(Integer curPage, Integer size, String name) {
        // 开启分页
        Page<Category> page = new Page<>(curPage, size);
        // 获取到分页后的结果
        IPage<Category> result = categoryMapper.getCategoryByPage(page, name);
        // 返回分页结果到前端
        return new PageVO(result.getTotal(), result.getRecords());
    }

    /**
     * 新增文章分类
     *
     * @param categoryVO 文章分类参数对象
     * @return 前端返回对象
     */
    @Override
    @LogAnnotation(module = "文章模块", description = "新增文章分类")
    @Transactional(rollbackFor = RuntimeException.class)
    public Result insertCategory(CategoryVO categoryVO) {
        // 判断是否有同名分类
        Category same = categoryMapper.selectOne(new QueryWrapper<Category>().eq("name", categoryVO.getName()));
        if (null != same) {
            return Result.error("已有当前分类");
        }

        // 将当前参数对象复制到文章分类对象中
        Category category = BeanCopyUtil.copy(categoryVO, Category.class);

        // 初始分类文章数为0
        category.setArticleAmount(0);
        // 当前文章分类到创建时间和更新时间
        category.setCreateTime(new Date());
        category.setUpdateTime(new Date());

        // 添加数据到数据库中
        int count = categoryMapper.insert(category);

        if (count > 0) {
            return Result.success("文章分类创建成功");
        }
        return Result.error("文章分类创建失败");
    }

    /**
     * 删除指定的文章分类
     *
     * @param id 文章分类ID
     * @return 前端返回对象
     */
    @Override
    @LogAnnotation(module = "文章模块", description = "删除文章分类")
    @Transactional(rollbackFor = RuntimeException.class)
    public Result deleteCategory(Integer id) {
        // TODO 将当前分类下的文章所属分类重置

        int count = categoryMapper.deleteById(id);
        if (count > 0) {
            return Result.success("文章分类删除成功");
        }
        return Result.error("文章分类删除失败");
    }

    /**
     * 批量删除文章分类
     *
     * @param ids 文章分类ID数组
     * @return 前端返回对象
     */
    @Override
    @LogAnnotation(module = "文章模块", description = "批量删除文章分类")
    public Result deleteCategoryBatchIds(Integer[] ids) {
        // TODO 将当前分类下的文章所属分类重置

        int count = categoryMapper.deleteBatchIds(Arrays.asList(ids));
        if (ids.length == count) {
            return Result.success("文章分类批量删除成功");
        }
        return Result.error("文章分类批量删除失败");
    }

    /**
     * 更新指定的文章分类
     *
     * @param categoryDto 文章分类参数对象
     * @return 前端返回对象
     */
    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    @LogAnnotation(module = "文章模块", description = "更新文章分类")
    public Result updateCategory(CategoryDto categoryDto) {
        // 设置当前分类的更新时间
        categoryDto.setUpdateTime(new Date());
        // 将当前文章分类传参对象进行复制
        Category category = BeanCopyUtil.copy(categoryDto, Category.class);
        // 更新当前文章分类对象
        int count = categoryMapper.updateById(category);
        if (count > 0) {
            return Result.success("文章分类更新成功");
        }
        return Result.error("文章分类更新失败");
    }
}
