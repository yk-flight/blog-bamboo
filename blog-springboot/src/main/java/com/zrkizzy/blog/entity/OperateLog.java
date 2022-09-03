package com.zrkizzy.blog.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-03
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="OperateLog对象", description="")
public class OperateLog implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "系统模块")
    private String model;

    @ApiModelProperty(value = "操作类型")
    private String type;

    @ApiModelProperty(value = "请求方式")
    private String requestMethod;

    @ApiModelProperty(value = "操作方法")
    private String operateMethod;

    @ApiModelProperty(value = "操作人员")
    private String user;

    @ApiModelProperty(value = "操作地址")
    private String operateIp;

    @ApiModelProperty(value = "操作地点")
    private String operateAddr;

    @ApiModelProperty(value = "操作状态")
    private Integer status;

    @ApiModelProperty(value = "请求参数")
    private String requestParam;

    @ApiModelProperty(value = "返回参数")
    private String returnParam;

    @ApiModelProperty(value = "操作日期")
    private LocalDateTime operateTime;


}
