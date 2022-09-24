package com.zrkizzy.blog.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
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
 * @since 2022-09-24
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="Pages对象", description="")
public class Pages implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "页面名称")
    private String title;

    @ApiModelProperty(value = "页面标签")
    private String label;

    @ApiModelProperty(value = "页面图片")
    private String image;

    @ApiModelProperty(value = "页面路径")
    private String path;
}
