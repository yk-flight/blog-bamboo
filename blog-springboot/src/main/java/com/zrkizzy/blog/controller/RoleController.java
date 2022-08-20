package com.zrkizzy.blog.controller;

import com.zrkizzy.blog.dto.RoleDto;
import com.zrkizzy.blog.service.RoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * 角色模块控制器
 *
 * @author zhangrongkang
 * @date 2022/8/7
 */
@Api(tags = "RoleController")
@RestController
public class RoleController {
    @Resource
    private RoleService roleService;

    @ApiOperation("获取所有角色")
    @GetMapping("/admin/getAllRoles")
    public List<RoleDto> getAllRoles() {
        return roleService.getAllRoles();
    }
}
