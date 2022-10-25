package com.zrkizzy.blog.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.time.LocalDate;

/**
 * 文件数据接收对象
 *
 * @author zhangrongkang
 * @date 2022/9/7
 */
@Data
@Accessors(chain = true)
@ApiModel(value = "文件数据接收对象")
public class FilesVO {

    @ApiModelProperty(value = "主键")
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
