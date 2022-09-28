package com.zrkizzy.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zrkizzy.blog.entity.Links;
import com.zrkizzy.blog.mapper.LinksMapper;
import com.zrkizzy.blog.service.LinksService;
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
 * @since 2022-09-24
 */
@Service
public class LinksServiceImpl extends ServiceImpl<LinksMapper, Links> implements LinksService {
    @Resource
    private LinksMapper linksMapper;

    /**
     * 获取友链列表(分页)
     *
     * @param curPage 当前页数
     * @param size    页面大小
     * @param title   网站名称
     * @return 分页对象
     */
    @Override
    public PageVO getLinksList(Integer curPage, Integer size, String title) {
        // 开启分页
        Page<Links> page = new Page<>(curPage, size);
        // 定义查询条件
        QueryWrapper<Links> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("title", title);
        // 查询分页
        Page<Links> linksPage = linksMapper.selectPage(page, queryWrapper);
        // 返回查询到的结果
        return new PageVO(linksPage.getTotal(), linksPage.getRecords());
    }
}
