package com.zrkizzy.blog.controller;

import com.zrkizzy.blog.service.IFilesService;
import com.zrkizzy.blog.vo.PageVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-05
 */
@Api(tags = "FilesController")
@RestController
@RequestMapping("/files")
public class FilesController {
    @Resource
    private IFilesService filesService;

    @ApiOperation("获取所有文件")
    @GetMapping("/getFilesList")
    public PageVO getFilesList(@RequestParam("curPage") Integer curPage,
                               @RequestParam("size") Integer size,
                               @RequestParam("nickName") String nickName,
                               @RequestParam("startTime")String startTime,
                               @RequestParam("endTime") String endTime) {
        return filesService.getFilesList(curPage, size, nickName, startTime, endTime);
    }
}
