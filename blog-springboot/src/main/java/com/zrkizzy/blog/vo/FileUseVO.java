package com.zrkizzy.blog.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 文件用途数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/9/15
 */
@Data
@ApiModel(value = "文件用途数据传输对象")
public class FileUseVO {

    @ApiModelProperty("文件路径")
    private String path;

    @ApiModelProperty("文件用途")
    private String description;
}
