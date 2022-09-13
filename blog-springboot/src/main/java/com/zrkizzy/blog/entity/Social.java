package com.zrkizzy.blog.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="Social对象", description="")
public class Social implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
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
