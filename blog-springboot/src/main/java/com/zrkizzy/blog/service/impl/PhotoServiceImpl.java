package com.zrkizzy.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zrkizzy.blog.annotation.LogAnnotation;
import com.zrkizzy.blog.entity.Photo;
import com.zrkizzy.blog.mapper.PhotoMapper;
import com.zrkizzy.blog.service.PhotoService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.vo.PhotoVO;
import com.zrkizzy.blog.vo.Result;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-10-25
 */
@Service
public class PhotoServiceImpl extends ServiceImpl<PhotoMapper, Photo> implements PhotoService {

    @Resource
    private PhotoMapper photoMapper;

    /**
     * 批量恢复相册
     *
     * @param ids 相册ID集合
     * @return 前端响应对象
     */
    @Override
    public Result recoverPhotosBatchIds(List<Integer> ids) {
        int count = photoMapper.recoverPhotosBatchIds(ids);
        if (count == ids.size()) {
            return Result.success("批量恢复成功");
        }
        return Result.error("批量恢复失败");
    }

    /**
     * 批量删除相册
     *
     * @param ids 相册ID集合
     * @return 前端响应对象
     */
    @Override
    @LogAnnotation(module = "相册模块", description = "批量删除相册/图片")
    public Result deletePhotosBatchIds(List<Integer> ids) {
        // 删除相册对应的相册
        int count = photoMapper.deletePhotosBatchIds(ids);
        // 删除相册对应的照片
        QueryWrapper<Photo> queryWrapper = new QueryWrapper<>();
        for (Integer id : ids) {
            // 清除当前查询条件
            queryWrapper.clear();
            queryWrapper.eq("parent_id", id);
            photoMapper.delete(queryWrapper);
        }
        if (count == ids.size()) {
            return Result.success("批量删除成功");
        }
        return Result.error("批量删除失败");
    }

    /**
     * 根据ID获取相册以及对应照片
     *
     * @param id 相册ID
     * @return 相册返回对象
     */
    @Override
    public PhotoVO listPhotoById(Integer id) {
        // 根据ID获取到当前相册对象
        PhotoVO photoVO = BeanCopyUtil.copy(photoMapper.selectById(id), PhotoVO.class);
        // 定义查询条件
        QueryWrapper<Photo> queryWrapper = new QueryWrapper<Photo>();
        queryWrapper.eq("deleted", 0).eq("parent_id", id);
        // 获取到当前相册对应的照片
        photoVO.setChildren(photoMapper.selectList(queryWrapper));
        // 清空查询条件
        queryWrapper.clear();
        queryWrapper.eq("parent_id", id).eq("deleted", 0);
        // 设置当前相册的图片数量
        photoVO.setCount(photoMapper.selectCount(queryWrapper));
        // 返回相册对象
        return photoVO;
    }

    /**
     * 批量移动照片到回收站
     *
     * @param ids 照片ID集合
     * @return 前端返回对象
     */
    @Override
    public Result deletePhotoBatchIds(List<Integer> ids) {
        int count = photoMapper.deletePhotoBatchIds(ids);
        if (count == ids.size()) {
            return Result.success("批量删除成功");
        }
        return Result.error("批量删除失败");
    }

}
