package com.zrkizzy.blog.vo;

import lombok.Data;

/**
 * 社交信息数据传输对象
 *
 * @author zhangrongkang
 * @since 2022-09-13
 */
@Data
public class SocialVO {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 是否展示Github
     */
    private Boolean githubShow;
    /**
     * 是否展示Gitee
     */
    private Boolean giteeShow;
    /**
     * 是否展示CSDN
     */
    private Boolean csdnShow;
    /**
     * 是否展示LeetCode
     */
    private Boolean leetcodeShow;
    /**
     * 是否展示QQ
     */
    private Boolean qqShow;


}
