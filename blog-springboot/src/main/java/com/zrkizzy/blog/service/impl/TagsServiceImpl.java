package com.zrkizzy.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zrkizzy.blog.entity.Tags;
import com.zrkizzy.blog.mapper.TagsMapper;
import com.zrkizzy.blog.service.ITagsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zrkizzy.blog.vo.PageVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-14
 */
@Service
public class TagsServiceImpl extends ServiceImpl<TagsMapper, Tags> implements ITagsService {
    @Resource
    private TagsMapper tagsMapper;

    /**
     * 获取标签列表
     *
     * @param name    标签名称
     * @param curPage 当前页数
     * @param size    页面大小
     * @return 分页对象
     */
    @Override
    public PageVO getTagsList(String name, Integer curPage, Integer size) {
        // 开启分页
        Page<Tags> page = new Page<>(curPage, size);
        // 定义查询条件
        QueryWrapper<Tags> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("name", name);
        Page<Tags> tagsPage = tagsMapper.selectPage(page, queryWrapper);
        return new PageVO(tagsPage.getTotal(), tagsPage.getRecords());
    }
}
