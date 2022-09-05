package com.zrkizzy.blog.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="Files对象", description="")
public class Files implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "文件名称")
    private String fileName;

    @ApiModelProperty(value = "文件上传用户")
    private String user;

    @ApiModelProperty(value = "文件上传路径")
    private String url;

    @ApiModelProperty(value = "文件上传时间")
    private LocalDate uploadTime;

    @ApiModelProperty(value = "备注")
    private String description;


}
