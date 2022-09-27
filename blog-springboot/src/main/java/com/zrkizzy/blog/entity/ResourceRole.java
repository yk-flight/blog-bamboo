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
 * @since 2022-09-27
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="ResourceRole对象", description="")
public class ResourceRole implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "资源权限ID")
    private Integer resourceId;

    @ApiModelProperty(value = "用户角色ID")
    private Integer roleId;


}
