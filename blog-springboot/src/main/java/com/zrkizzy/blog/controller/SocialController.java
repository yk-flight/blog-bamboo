package com.zrkizzy.blog.controller;


import com.zrkizzy.blog.entity.Social;
import com.zrkizzy.blog.service.SocialService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.SocialVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-13
 */
@RestController
@Api(tags = "SocialController")
@RequestMapping("/social")
public class SocialController {
    @Resource
    private SocialService socialService;

    @ApiOperation("获取所有社交信息是否启用")
    @GetMapping("/getSocialInfo")
    public Social getSocialInfo() {
        return socialService.getById(1);
    }

    @ApiOperation("更新社交信息是否启用")
    @PostMapping("/updateSocialInfo")
    public Result updateSocialInfo(@RequestBody SocialVO socialVO) {
        Social social = BeanCopyUtil.copy(socialVO, Social.class);
        if (socialService.updateById(social)) {
            return Result.success("更新成功");
        }
        return Result.error("更新失败");
    }
}
