package com.zrkizzy.blog.dto;

import lombok.Data;

/**
 * 网站基础信息数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/10/14
 */
@Data
public class WebsiteDTO {
    /**
     * 网站头像
     */
    private String logo;
    /**
     * 网站名称
     */
    private String name;
    /**
     * 网站作者
     */
    private String author;
    /**
     * 网站简介
     */
    private String introduction;
    /**
     * 网站创建日期
     */
    private String createDate;
    /**
     * 公告
     */
    private String publish;
    /**
     * 座右铭
     */
    private String motto;
    /**
     * 备案号
     */
    private String record;
}
