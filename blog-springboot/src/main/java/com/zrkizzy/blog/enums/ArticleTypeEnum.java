package com.zrkizzy.blog.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 文章类型枚举
 *
 * @author zhangrongkang
 * @date 2022/9/15
 */
@Getter
@AllArgsConstructor
public enum ArticleTypeEnum {
    /**
     * 原创
     */
    ORIGINAL(1, "原创"),
    /**
     * 转载
     */
    REPRINT(2, "转载"),
    /**
     * 翻译
     */
    TRANSLATE(3, "翻译");

    /**
     * 状态码
     */
    private final Integer code;
    /**
     * 描述
     */
    private final String description;

    /**
     * 获取文章类型枚举
     *
     * @param code 状态码
     * @return 文章类型枚举
     */
    public static ArticleTypeEnum getArticleTypeEnum(Integer code) {
        for (ArticleTypeEnum value : ArticleTypeEnum.values()) {
            if (value.getCode().equals(code)) {
                return value;
            }
        }
        return null;
    }

    /**
     * 获取对应的文章类型描述
     *
     * @param code 状态码
     * @return 文章类型描述
     */
    public static String getDescription(Integer code) {
        for (ArticleTypeEnum value : ArticleTypeEnum.values()) {
            if (value.getCode().equals(code)) {
                return value.getDescription();
            }
        }
        return null;
    }
}
