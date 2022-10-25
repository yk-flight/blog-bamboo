package com.zrkizzy.blog.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-10-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="Photo对象", description="")
public class Photo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "相册/照片名称")
    private String name;

    @ApiModelProperty(value = "相册/照片描述")
    private String description;

    @ApiModelProperty(value = "父ID 0 相册 1 照片")
    private Integer parentId;

    @ApiModelProperty(value = "图片路径")
    private String image;


}
