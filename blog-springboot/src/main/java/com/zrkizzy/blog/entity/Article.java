package com.zrkizzy.blog.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-14
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="Article对象", description="")
public class Article implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "博客标题")
    private String title;

    @ApiModelProperty(value = "博客分类")
    private Integer category;

    @ApiModelProperty(value = "发表时间")
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime publishTime;

    @ApiModelProperty(value = "标签")
    private String tags;

    @ApiModelProperty(value = "摘要")
    private String summary;

    @ApiModelProperty(value = "文章内容md")
    private String contentMd;

    @ApiModelProperty(value = "文章类型")
    private Integer type;

    @ApiModelProperty(value = "文章状态")
    private Boolean state;

    @ApiModelProperty(value = "是否删除")
    private Boolean deleted;

    @ApiModelProperty(value = "是否开启评论")
    private Boolean allowComment;

    @ApiModelProperty(value = "是否置顶")
    private Boolean top;

    @ApiModelProperty(value = "文章封面图")
    private String background;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.UPDATE)
    private LocalDateTime updateTime;

}
