package com.zrkizzy.blog.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * 菜单角色关联对象
 *
 * @author zhangrongkang
 * @date 2022/8/12
 */
@Data
@ApiModel("菜单角色关联对象")
@TableName("menu_role")
public class MenuRole implements Serializable {

    /**
     * 主键
     */
    @ApiModelProperty("主键")
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 菜单ID
     */
    @ApiModelProperty("菜单ID")
    private Integer menuId;

    /**
     * 角色ID
     */
    @ApiModelProperty("角色ID")
    private Integer roleId;
}
