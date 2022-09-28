package com.zrkizzy.blog.vo.param;

import lombok.Data;

import java.util.List;

/**
 * 资源角色数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/9/27
 */
@Data
public class ResourceRoleVO {
    /**
     * 角色ID
     */
    private Integer roleId;
    /**
     * 资源主键
     */
    private List<Integer> ids;
}
