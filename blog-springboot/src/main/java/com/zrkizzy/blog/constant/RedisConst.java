package com.zrkizzy.blog.constant;

/**
 * Redis中存储的常量键
 *
 * @author zhangrongkang
 * @date 2022/10/4
 */
public class RedisConst {
    /**
     * Redis中存储网站其他信息键
     */
    public static final String WEBSITE_INFO = "website_info";
    /**
     * Redis中存储的用户信息前缀
     */
    public static final String USER_INFO = "userInfo_";
    /**
     * Redis中存储的用户总访问量
     */
    public static final String BLOG_VIEWS_COUNT = "view_count";
    /**
     * Redis中存储的当日访问量
     */
    public static final String DAILY_VISITS = "daily_visits";
}
