package com.zrkizzy.blog.service;

import com.zrkizzy.blog.entity.Links;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zrkizzy.blog.vo.PageVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-24
 */
public interface ILinksService extends IService<Links> {

    /**
     * 获取友链列表(分页)
     *
     * @param curPage 当前页数
     * @param size 页面大小
     * @param title 网站名称
     * @return 分页对象
     */
    PageVO getLinksList(Integer curPage, Integer size, String title);
}
