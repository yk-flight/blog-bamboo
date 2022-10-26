package com.zrkizzy.blog.vo;

import com.zrkizzy.blog.entity.Photo;
import lombok.Data;

import java.util.List;

/**
 * 相册前端返回对象
 *
 * @author zhangrongkang
 * @date 2022/10/26
 */
@Data
public class PhotoVO {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 相册/照片名称
     */
    private String name;
    /**
     * 相册/照片描述
     */
    private String description;
    /**
     * 父ID 0 相册 1 照片
     */
    private Integer parentId;
    /**
     * 图片路径
     */
    private String image;
    /**
     * 照片数量
     */
    private Integer count;
    /**
     * 相册存储的照片
     */
    private List<Photo> children;
}
