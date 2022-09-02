package com.zrkizzy.blog.controller;

import com.zrkizzy.blog.service.UserService;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.PasswordVO;
import com.zrkizzy.blog.vo.param.UserInfoVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 用户模块控制器
 *
 * @author zhangrongkang
 * @date 2022/8/14
 */
@RestController
@Api(tags = "UserController")
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

    @ApiOperation("获取当前登录的用户信息")
    @GetMapping("/admin/getUserById")
    public Result getUserById() {
        return Result.success("", userService.getUserByUserId());
    }

    @ApiOperation("获取用户登录设备")
    @GetMapping("/admin/getUserAgent")
    public String getUserAgent(HttpServletRequest request) {
        return userService.getUserAgent(request);
    }

    @ApiOperation("更新用户密码")
    @PutMapping("/admin/updatePassword")
    public Result updatePassword(@RequestBody PasswordVO passwordVO) {
        return userService.updatePassword(passwordVO);
    }

    @ApiOperation("修改指定用户密码")
    @PutMapping("/admin/updatePasswordById")
    public Result updatePasswordById(Integer userId, String password) {
        return userService.updatePasswordById(userId, password);
    }

    @ApiOperation("获取所有用户")
    @GetMapping("/admin/getUserList")
    public PageVO getUserList(@RequestParam("curPage") Integer curPage, @RequestParam("size") Integer size, @RequestParam("name") String username) {
        return userService.getUserList(curPage, size, username);
    }

    @ApiOperation("新增用户")
    @PostMapping("/admin/addUser")
    public Result addUser(@RequestBody UserInfoVO userInfoVO) {
        return userService.addUser(userInfoVO);
    }

    @ApiOperation("删除用户")
    @DeleteMapping("/admin/deleteUserById/{id}")
    public Result deleteUserById(@PathVariable Integer id) {
        return userService.deleteUserById(id);
    }
}
