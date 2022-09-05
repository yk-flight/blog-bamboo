package com.zrkizzy.blog.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * 文件信息传输对象
 *
 * @author zhangrongkang
 * @date 2022/9/5
 */
@Data
@ApiModel("文件信息传输对象")
public class FilesDto implements Serializable {
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
