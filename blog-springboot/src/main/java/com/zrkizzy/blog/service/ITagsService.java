package com.zrkizzy.blog.service;

import com.zrkizzy.blog.entity.Tags;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zrkizzy.blog.vo.PageVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-14
 */
public interface ITagsService extends IService<Tags> {

    /**
     * 获取标签列表
     *
     * @param name 标签名称
     * @param curPage 当前页数
     * @param size 页面大小
     * @return 分页对象
     */
    PageVO getTagsList(String name, Integer curPage, Integer size);
}
