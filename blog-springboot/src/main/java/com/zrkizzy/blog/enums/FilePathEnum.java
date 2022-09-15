package com.zrkizzy.blog.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 文件上传路径枚举
 *
 * @author zhangrongkang
 * @date 2022/9/15
 */
@Getter
@AllArgsConstructor
public enum FilePathEnum {
    /**
     * 用户头像路径
     */
    AVATAR("avatar/", "用户头像"),
    /**
     * 相册图片
     */
    PHOTO("photo/", "相册图片"),
    /**
     * 封面图片
     */
    COVER("cover/", "封面图片"),
    /**
     * 文章图片
     */
    ARTICLE("article/", "文章图片");

    /**
     * 文件路径
     */
    private final String path;
    /**
     * 文件描述
     */
    private final String description;
}
