package com.zrkizzy.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zrkizzy.blog.entity.Category;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * @author zhangrongkang
 * @date 2022/8/18
 */
@Mapper
public interface CategoryMapper extends BaseMapper<Category> {
    /**
     * 获取所有文章分类（分页）
     *
     * @param page 分页对象
     * @param name 分类名称
     * @return 分页结果
     */
    IPage<Category> getCategoryByPage(Page<Category> page, @Param("name") String name);
}
