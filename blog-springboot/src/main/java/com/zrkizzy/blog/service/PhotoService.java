package com.zrkizzy.blog.service;

import com.zrkizzy.blog.entity.Photo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zrkizzy.blog.vo.PhotoVO;
import com.zrkizzy.blog.vo.Result;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-10-25
 */
public interface PhotoService extends IService<Photo> {

    /**
     * 批量恢复相册
     *
     * @param ids 相册ID集合
     * @return 前端响应对象
     */
    Result recoverPhotosBatchIds(List<Integer> ids);

    /**
     * 批量删除相册
     *
     * @param ids 相册ID集合
     * @return 前端响应对象
     */
    Result deletePhotosBatchIds(List<Integer> ids);

    /**
     * 根据ID获取相册以及对应照片
     *
     * @param id 相册ID
     * @return 相册返回对象
     */
    PhotoVO listPhotoById(Integer id);

    /**
     * 批量移动照片到回收站
     *
     * @param ids 照片ID集合
     * @return 前端返回对象
     */
    Result deletePhotoBatchIds(List<Integer> ids);
}
