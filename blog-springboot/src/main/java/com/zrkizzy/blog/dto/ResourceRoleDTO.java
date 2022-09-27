package com.zrkizzy.blog.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 角色资源数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/9/27
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResourceRoleDTO {
    /**
     * 资源ID
     */
    private Integer id;
    /**
     * 权限路径
     */
    private String url;
    /**
     * 请求方式
     */
    private String requestMethod;
    /**
     * 角色名
     */
    private List<String> roleList;
}
