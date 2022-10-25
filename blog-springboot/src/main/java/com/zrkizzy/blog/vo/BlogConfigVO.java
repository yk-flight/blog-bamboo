package com.zrkizzy.blog.vo;

import lombok.Data;

/**
 * 博客首页配置信息
 *
 * @author zhangrongkang
 * @date 2022/10/13
 */
@Data
public class BlogConfigVO {
    /**
     * 网站基础配置信息
     */
    private WebsiteVO websiteVO;
    /**
     * 网站其他配置信息
     */
    private WebsiteOtherVO websiteOtherVO;
    /**
     * 网站社交信息
     */
    private SocialVO socialVO;
    /**
     * gitee
     */
    private String gitee;
    /**
     * git hub
     */
    private String github;
    /**
     * csdn
     */
    private String csdn;
    /**
     * leetcode
     */
    private String leetcode;
    /**
     * 文章数量
     */
    private Integer articleCount;
    /**
     * 标签数量
     */
    private Integer tagsCount;
    /**
     * 分类数量
     */
    private Integer categoryCount;
    /**
     * 总访问量
     */
    private Integer visitCount;
}
