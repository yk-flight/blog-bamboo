package com.zrkizzy.blog.controller;


import com.zrkizzy.blog.dto.AboutDTO;
import com.zrkizzy.blog.entity.About;
import com.zrkizzy.blog.service.AboutService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.AboutVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.time.LocalDateTime;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-26
 */
@RestController
@Api(tags = "AboutController")
@RequestMapping("/about")
public class AboutController {
    @Resource
    private AboutService aboutService;

    @ApiOperation("获取关于我的信息")
    @GetMapping("/getAboutInfo")
    public AboutDTO getAboutInfo() {
        return BeanCopyUtil.copy(aboutService.getById(1), AboutDTO.class);
    }

    @ApiOperation("更新关于我信息")
    @PutMapping("/updateAboutInfo")
    public Result updateAboutInfo(@RequestBody AboutVO aboutVO) {
        // 复制关于我对象
        aboutVO.setUpdateTime(LocalDateTime.now());
        About about = BeanCopyUtil.copy(aboutVO, About.class);
        // 更新并返回结果
        if (aboutService.updateById(about)) {
            return Result.success("更新成功");
        }
        return Result.error("更新失败");
    }
}
