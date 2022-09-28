package com.zrkizzy.blog.controller;


import com.zrkizzy.blog.annotation.LogAnnotation;
import com.zrkizzy.blog.entity.Pages;
import com.zrkizzy.blog.service.PagesService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.PagesVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-24
 */
@RestController
@Api(tags = "PagesController")
@RequestMapping("/pages")
public class PagesController {
    @Resource
    private PagesService pagesService;

    @ApiOperation("获取所有页面")
    @GetMapping("/getPagesList")
    public List<Pages> getPagesList() {
        return pagesService.list();
    }

    @ApiOperation("更新页面信息")
    @LogAnnotation(module = "页面管理模块", description = "更新页面")
    @PutMapping("/updatePageInfo")
    public Result updatePageInfo(@RequestBody PagesVO pagesVO) {
        // 复制页面对象
        Pages pages = BeanCopyUtil.copy(pagesVO, Pages.class);
        // 更新页面对象并返回结果
        if (pagesService.updateById(pages)) {
            return Result.success("页面信息更新成功");
        }
        return Result.error("页面信息更新失败");
    }

    @ApiOperation("新建页面")
    @LogAnnotation(module = "页面管理模块", description = "新增页面")
    @PostMapping("/addPages")
    public Result addPages(@RequestBody PagesVO pagesVO) {
        // 复制页面对象
        Pages pages = BeanCopyUtil.copy(pagesVO, Pages.class);
        // 添加页面对象并返回结果
        if (pagesService.save(pages)) {
            return Result.success("页面新建成功");
        }
        return Result.error("页面新建失败");
    }

    @ApiOperation("删除页面")
    @LogAnnotation(module = "页面管理模块", description = "删除页面")
    @DeleteMapping("/deletePageById/{id}")
    public Result deletePageById(@PathVariable Integer id) {
        if (pagesService.removeById(id)) {
            return Result.success("页面删除成功");
        }
        return Result.error("页面删除失败");
    }
}
