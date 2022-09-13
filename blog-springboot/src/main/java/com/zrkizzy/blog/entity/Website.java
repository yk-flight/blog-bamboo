package com.zrkizzy.blog.entity;

import com.baomidou.mybatisplus.annotation.IdType;
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
 * @since 2022-09-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="Website对象", description="")
public class Website implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
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
    private LocalDateTime createDate;

    @ApiModelProperty(value = "公告")
    private String publish;

    @ApiModelProperty(value = "座右铭")
    private String motto;

    @ApiModelProperty(value = "备案号")
    private String record;


}
