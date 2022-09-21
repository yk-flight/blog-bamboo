package com.zrkizzy.blog.vo.param;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 文章分类参数对象
 *
 * @author zhangrongkang
 * @date 2022/8/18
 */
@Data
@Accessors(chain = true)
@ApiModel(value = "文章分类对象")
public class CategoryVO {
    /**
     * 主键
     */
    @ApiModelProperty("主键")
    private Integer id;
    /**
     * 分类名称
     */
    @ApiModelProperty("分类名称")
    private String name;

    /**
     * 分类描述
     */
    @ApiModelProperty("分类描述")
    private String description;

    /**
     * 分类图片
     */
    @ApiModelProperty("分类图片")
    private String image;

}
