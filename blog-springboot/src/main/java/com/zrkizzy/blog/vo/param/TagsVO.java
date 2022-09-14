package com.zrkizzy.blog.vo.param;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 标签数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/9/14
 */
@Data
@ApiModel("标签数据传输对象")
public class TagsVO {
    @ApiModelProperty(value = "主键")
    private Integer id;

    @ApiModelProperty(value = "标签名称")
    private String name;

    @ApiModelProperty(value = "文章数量")
    private Integer articleNum;

    @ApiModelProperty(value = "创建时间")
    private LocalDateTime createTime;
}
