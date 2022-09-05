package com.zrkizzy.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zrkizzy.blog.entity.Files;
import com.zrkizzy.blog.vo.PageVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-05
 */
public interface IFilesService extends IService<Files> {
    /**
     * 获取上传的图片列表
     *
     * @param curPage 当前页数
     * @param size 页面大小
     * @param nickName 上传用户昵称
     * @param startTime 开始时间
     * @param endTime  结束时间
     * @return 分页对象
     */
    PageVO getFilesList(Integer curPage, Integer size, String nickName, String startTime, String endTime);
}
