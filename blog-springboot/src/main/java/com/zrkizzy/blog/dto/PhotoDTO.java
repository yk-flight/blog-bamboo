package com.zrkizzy.blog.dto;

import lombok.Data;

/**
 * 相册/图片数据接收对象
 *
 * @author zhangrongkang
 * @date 2022/10/25
 */
@Data
public class PhotoDTO {
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
}
