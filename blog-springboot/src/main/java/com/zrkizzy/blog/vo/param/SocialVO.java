package com.zrkizzy.blog.vo.param;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 社交信息数据传输对象
 *
 * @author zhangrongkang
 * @since 2022-09-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="社交信息数据传输对象")
public class SocialVO {

    @ApiModelProperty(value = "主键")
    private Integer id;

    @ApiModelProperty(value = "是否展示Github")
    private Boolean githubShow;

    @ApiModelProperty(value = "是否展示Gitee")
    private Boolean giteeShow;

    @ApiModelProperty(value = "是否展示CSDN")
    private Boolean csdnShow;

    @ApiModelProperty(value = "是否展示LeetCode")
    private Boolean leetcodeShow;

    @ApiModelProperty(value = "是否展示QQ")
    private Boolean qqShow;


}
