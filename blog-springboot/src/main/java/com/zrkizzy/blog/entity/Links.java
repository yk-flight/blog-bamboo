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
 * @since 2022-09-24
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="Links对象", description="")
public class Links implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "网站名称")
    private String title;

    @ApiModelProperty(value = "网站地址")
    private String website;

    @ApiModelProperty(value = "网站logo")
    private String logo;

    @ApiModelProperty(value = "网站描述")
    private String description;

    @ApiModelProperty(value = "创建时间")
    private LocalDateTime createTime;
}
