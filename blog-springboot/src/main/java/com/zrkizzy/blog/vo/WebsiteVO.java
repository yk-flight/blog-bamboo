package com.zrkizzy.blog.vo;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 网站设置数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/9/12
 */
@Data
@Accessors(chain = true)
public class WebsiteVO {
    /**
     * 主键
     */
    private Integer id;
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
