package com.zrkizzy.blog.vo.param;

import lombok.Data;

/**
 * 网站其他信息数据传输对象
 * 
 * @author zhangrongkang
 * @date 2022/9/26
 */
@Data
public class WebsiteOtherVO {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 游客头像
     */
    private String avatar;
    /**
     * 评论审核 1 开启 0 关闭
     */
    private Boolean commentAllow;
    /**
     * 留言审核 1 开启 0 关闭
     */
    private Boolean messageAllow;
    /**
     * 打赏状态 1 开启 0 关闭
     */
    private Boolean reward;
    /**
     * 微信收款码
     */
    private String wechatReceipt;
    /**
     * 支付宝收款码
     */
    private String alipayReceipt;
}