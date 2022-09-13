package com.zrkizzy.blog.controller;


import com.zrkizzy.blog.entity.Website;
import com.zrkizzy.blog.service.IWebsiteService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.utils.TimeUtil;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.WebsiteVO;
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
 * @since 2022-09-11
 */
@RestController
@Api(tags = "WebsiteController")
@RequestMapping("/website")
public class WebsiteController {
    @Resource
    private IWebsiteService websiteService;

    @ApiOperation("获取网站设置信息")
    @GetMapping("/getWebsiteInfo")
    public Website getWebsiteInfo() {
        return websiteService.getById(1);
    }

    @ApiOperation("更新网站设置信息")
    @PostMapping("/updateWebsiteInfo")
    public Result updateWebsiteInfo(@RequestBody WebsiteVO websiteVO) {
        Website website = BeanCopyUtil.copy(websiteVO, Website.class);
        // 设置网站的创建时间
        website.setCreateDate(TimeUtil.stringToLocalDateTimeDay(websiteVO.getCreateDate()));
        System.out.println(website);
        if (websiteService.updateById(website)) {
            return Result.success("网站信息修改成功");
        }
        return Result.error("网站信息修改失败");
    }
}
