package com.zrkizzy.blog.vo.param;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
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
@ApiModel(value = "网站设置数据传输对象", description = "")
public class WebsiteVO {
    @ApiModelProperty(value = "主键")
    private Integer id;

    @ApiModelProperty(value = "网站头像")
    private String logo;

    @ApiModelProperty(value = "网站名称")
    private String name;

    @ApiModelProperty(value = "网站作者")
    private String author;

    @ApiModelProperty(value = "网站简介")
    private String introduction;

    @ApiModelProperty(value = "网站创建日期")
    private String createDate;

    @ApiModelProperty(value = "公告")
    private String publish;

    @ApiModelProperty(value = "座右铭")
    private String motto;

    @ApiModelProperty(value = "备案号")
    private String record;
}
