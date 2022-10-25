package com.zrkizzy.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zrkizzy.blog.annotation.LogAnnotation;
import com.zrkizzy.blog.dto.CategoryDTO;
import com.zrkizzy.blog.entity.Category;
import com.zrkizzy.blog.mapper.CategoryMapper;
import com.zrkizzy.blog.service.CategoryService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.CategoryVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * @author zhangrongkang
 * @date 2022/8/18
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {
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
        // 如果当前文章分类下存在文章则不能删除该分类
        Category category = categoryMapper.selectById(id);
        if (category.getArticleAmount() > 0) {
            return Result.error("当前分类下还有文章，不能删除");
        }

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
    @Transactional(rollbackFor = RuntimeException.class)
    @LogAnnotation(module = "文章模块", description = "批量删除文章分类")
    public Result deleteCategoryBatchIds(Integer[] ids) {
        QueryWrapper<Category> queryWrapper = new QueryWrapper<>();
        queryWrapper.in("id", Arrays.asList(ids));
        List<Category> categories = categoryMapper.selectList(queryWrapper);
        // 如果当前要删除的分类下还有文章
        for (Category category : categories) {
            if (category.getArticleAmount() > 0) {
                return Result.error("分类删除失败，" + category.getName() + " 中还有文章");
            }
        }

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
    public Result updateCategory(CategoryDTO categoryDto) {
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

    /**
     * 获取所有文章分类
     *
     * @return 所有文章分类集合
     */
    @Override
    public List<Category> getAllCategory() {
        return categoryMapper.selectList(null);
    }

    /**
     * 博客前台获取分类集合
     *
     * @param curPage 当前页数
     * @param size    页面大小
     * @return 文章分页对象
     */
    @Override
    public PageVO getCategoryList(Integer curPage, Integer size) {
        // 开启分页
        Page<Category> page = new Page<>(curPage, size);
        // 定义查询条件
        QueryWrapper<Category> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("create_time");
        // 查询分页结果
        Page<Category> categories = categoryMapper.selectPage(page, queryWrapper);
        // 处理查询结果并返回
        return new PageVO(categories.getTotal(), BeanCopyUtil.copyList(categories.getRecords(), CategoryVO.class));
    }
}
