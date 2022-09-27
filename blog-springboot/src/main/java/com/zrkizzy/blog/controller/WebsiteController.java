package com.zrkizzy.blog.controller;


import com.zrkizzy.blog.annotation.LogAnnotation;
import com.zrkizzy.blog.dto.WebsiteOtherDTO;
import com.zrkizzy.blog.entity.Website;
import com.zrkizzy.blog.entity.WebsiteOther;
import com.zrkizzy.blog.service.IWebsiteOtherService;
import com.zrkizzy.blog.service.IWebsiteService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.utils.TimeUtil;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.WebsiteOtherVO;
import com.zrkizzy.blog.vo.param.WebsiteVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
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
    @Resource
    private IWebsiteOtherService websiteOtherService;

    @Resource
    private RedisTemplate<String, Object> redisTemplate;

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



    @ApiOperation("获取网站管理其他信息")
    @GetMapping("/getOtherInfo")
    public WebsiteOtherDTO getOtherInfo() {
        // 开启Redis
        ValueOperations<String, Object> valueOperations = redisTemplate.opsForValue();
        // 从Redis中获取对应的数据
        WebsiteOtherDTO websiteInfo = BeanCopyUtil.copy(valueOperations.get("website_info"), WebsiteOtherDTO.class);
        if (websiteInfo == null) {
            // 如果不存在则到数据库中获取
            WebsiteOther websiteOther = websiteOtherService.getById(1);
            websiteInfo = BeanCopyUtil.copy(websiteOther, WebsiteOtherDTO.class);
            // 将从数据库中获取到的对象设置到Redis中
            valueOperations.set("website_info", websiteInfo);
        }
        return websiteInfo;
    }

    @ApiOperation("更新网站管理其他信息")
    @LogAnnotation(module = "网站管理模块", description = "更新网站其他信息")
    @PutMapping("/updateOtherInfo")
    public Result updateOtherInfo(@RequestBody WebsiteOtherVO websiteOtherVO) {
        // 开启Redis
        ValueOperations<String, Object> valueOperations = redisTemplate.opsForValue();
        // 更新Redis中存储的网站其他信息对象
        WebsiteOther websiteOther = BeanCopyUtil.copy(websiteOtherVO, WebsiteOther.class);
        valueOperations.set("website_info", websiteOther);
        // 更新数据库中存储的网站信息对象
        if (websiteOtherService.updateById(websiteOther)) {
            return Result.success("更新成功");
        }
        return Result.error("更新失败");
    }
}
