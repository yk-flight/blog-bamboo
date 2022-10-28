package com.zrkizzy.blog.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.zrkizzy.blog.annotation.LogAnnotation;
import com.zrkizzy.blog.dto.PhotoDTO;
import com.zrkizzy.blog.entity.Photo;
import com.zrkizzy.blog.service.PhotoService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.vo.PhotoVO;
import com.zrkizzy.blog.vo.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-10-25
 */
@RestController
@Api(tags = "PhotoController")
@RequestMapping("/photo")
public class PhotoController {
    @Resource
    private PhotoService photoService;

    @ApiOperation("获取相册列表")
    @GetMapping("/listPhotoCover")
    public List<Photo> listPhotoCover(@RequestParam("name") String name,
                                      @RequestParam("parentId") Integer parentId,
                                      @RequestParam("deleted") Integer deleted) {
        // 定义查询条件
        QueryWrapper<Photo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("deleted", deleted).like("name", name);
        if (!parentId.equals(-1)) {
            queryWrapper.eq("parent_id", parentId);
        }
        List<Photo> list = photoService.list(queryWrapper);
        // 当查询相册时将数据进行封装
        for (Photo photo : list) {
            // 清空查询条件
            queryWrapper.clear();
            // 设置每个相册的数量
            photo.setCount(photoService.count(queryWrapper.eq("parent_id", photo.getId())
                    .eq("deleted", 0)));
        }
        return list;
    }

    @ApiOperation("更新/添加相册/照片")
    @LogAnnotation(module = "相册模块", description = "更新或添加相册/照片")
    @PostMapping("/save")
    public Result save(@RequestBody PhotoDTO photoDTO) {
        Photo photo = BeanCopyUtil.copy(photoDTO, Photo.class);
        // 当前相册对象的ID不存在说明添加相册
        if (photoDTO.getId() == null) {
            // 定义当前相册未删除
            photo.setDeleted(0);
            if (photoService.save(photo)) {
                return Result.success("添加成功");
            }
            return Result.error("添加失败");
        }
        // 存在ID说明为更新操作
        if (photoService.updateById(photo)) {
            return Result.success("更新成功");
        }
        return Result.error("更新失败");
    }

    @ApiOperation("移动相册/照片到回收站")
    @LogAnnotation(module = "相册模块", description = "移动相册/照片到回收站")
    @GetMapping("/removePhotos/{id}")
    public Result removePhotos(@PathVariable Integer id) {
        LambdaUpdateWrapper<Photo> lambdaUpdateWrapper = new LambdaUpdateWrapper<>();
        lambdaUpdateWrapper.eq(Photo::getId, id).set(Photo::getDeleted, 1);
        if (photoService.update(lambdaUpdateWrapper)) {
            return Result.success("删除成功");
        }
        return Result.error("删除失败");
    }

    @ApiOperation("批量恢复相册/照片")
    @LogAnnotation(module = "相册模块", description = "批量恢复相册/照片")
    @GetMapping("/recoverPhotosBatchIds/{ids}")
    public Result recoverPhotosBatchIds(@PathVariable Integer[] ids) {
        return photoService.recoverPhotosBatchIds(Arrays.asList(ids));
    }

    @ApiOperation("批量移动照片到回收站")
    @GetMapping("/deletePhotoBatchIds/{ids}")
    public Result deletePhotoBatchIds(@PathVariable Integer[] ids) {
        return photoService.deletePhotoBatchIds(Arrays.asList(ids));
    }

    @ApiOperation("批量删除相册/照片")
    @DeleteMapping("/deletePhotosBatchIds/{ids}")
    public Result deletePhotosBatchIds(@PathVariable Integer[] ids) {
        return photoService.deletePhotosBatchIds(Arrays.asList(ids));
    }

    @ApiOperation("获取相册对应的照片")
    @GetMapping("/listPhotoById/{id}")
    public PhotoVO listPhotoById(@PathVariable Integer id) {
        return photoService.listPhotoById(id);
    }
}
