package com.zrkizzy.blog.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 资源权限数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/9/27
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResourceDTO {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 资源名称
     */
    private String resourceName;
    /**
     * 父权限id
     */
    private Integer parentId;
    /**
     * 权限列表
     */
    private List<ResourceDTO> children;
}
