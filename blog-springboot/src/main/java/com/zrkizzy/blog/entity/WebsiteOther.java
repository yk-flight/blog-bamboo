package com.zrkizzy.blog.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-26
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="WebsiteOther对象", description="")
public class WebsiteOther implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    private Integer id;

    @ApiModelProperty(value = "游客头像")
    private String avatar;

    @ApiModelProperty(value = "评论审核 1 开启 0 关闭")
    private Boolean commentAllow;

    @ApiModelProperty(value = "留言审核 1 开启 0 关闭")
    private Boolean messageAllow;

    @ApiModelProperty(value = "打赏状态 1 开启 0 关闭")
    private Boolean reward;

    @ApiModelProperty(value = "微信收款码")
    private String wechatReceipt;

    @ApiModelProperty(value = "支付宝收款码")
    private String alipayReceipt;

    @ApiModelProperty(value = "音乐播放器 1 开启 0 关闭")
    private Boolean musicShow;

    @ApiModelProperty(value = "自动播放 1 开启 0 关闭")
    private Boolean musicAuto;

    @ApiModelProperty(value = "歌单ID")
    private String musicId;


}
