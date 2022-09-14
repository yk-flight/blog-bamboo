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
 * @since 2022-09-14
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="Tags对象", description="")
public class Tags implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "标签名称")
    private String name;

    @ApiModelProperty(value = "文章数量")
    private Integer articleNum;

    @ApiModelProperty(value = "创建时间")
    private LocalDateTime createTime;


}
