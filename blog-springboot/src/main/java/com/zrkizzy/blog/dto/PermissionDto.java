package com.zrkizzy.blog.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 权限数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/8/20
 */
@Data
@ApiModel("权限数据传输对象")
public class PermissionDto {

    /**
     * 主键
     */
    @ApiModelProperty("主键")
    private Integer id;

    /**
     * 路径权限
     */
    @ApiModelProperty("路径权限")
    private String path;
}
