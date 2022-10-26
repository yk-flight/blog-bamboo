package com.zrkizzy.blog.mapper;

import com.zrkizzy.blog.entity.Photo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-10-25
 */
public interface PhotoMapper extends BaseMapper<Photo> {

    /**
     * 批量恢复相册
     *
     * @param ids 相册ID集合
     * @return 受影响的行数
     */
    Integer recoverPhotosBatchIds(@Param("ids") List<Integer> ids);

    /**
     * 批量删除相册
     *
     * @param ids 相册ID集合
     * @return 受影响的行数
     */
    Integer deletePhotosBatchIds(@Param("ids") List<Integer> ids);

    /**
     * 批量移动照片到回收站
     *
     * @param ids 照片ID集合
     * @return 受影响到行数
     */
    Integer deletePhotoBatchIds(@Param("ids") List<Integer> ids);
}
