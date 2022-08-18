package com.zrkizzy.blog.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 文章分类表
 *
 * @author zhangrongkang
 * @date 2022/8/18
 */
@Data
@ApiModel("文章分类对象")
public class CategoryDto implements Serializable {
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
     * 包含文章数
     */
    @ApiModelProperty("包含文章数")
    private Integer articleAmount;

    /**
     * 分类图片
     */
    @ApiModelProperty("分类图片")
    private String image;

    /**
     * 创建时间
     */
    @ApiModelProperty("创建时间")
    private Date createTime;

    /**
     * 更新时间
     */
    @ApiModelProperty("更新时间")
    private Date updateTime;
}
