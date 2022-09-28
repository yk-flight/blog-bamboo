package com.zrkizzy.blog.controller;


import com.zrkizzy.blog.dto.ResourceDTO;
import com.zrkizzy.blog.service.IResourceService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-27
 */
@RestController
@Api(tags = "ResourceController")
@RequestMapping("/resource")
public class ResourceController {
    @Resource
    private IResourceService resourceService;

    @ApiOperation("获取所有资源权限")
    @GetMapping("/getResourceList")
    public List<ResourceDTO> getResourceList() {
        return resourceService.getResourceList();
    }

    @ApiOperation("根据角色ID获取资源权限")
    @GetMapping("/getResourceById/{id}")
    public List<Integer> getResourceById(@PathVariable Integer id) {
        return resourceService.getResourceById(id);
    }
}
