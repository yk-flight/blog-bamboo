package com.zrkizzy.blog.controller;

import com.zrkizzy.blog.annotation.LogAnnotation;
import com.zrkizzy.blog.dto.FilesDto;
import com.zrkizzy.blog.entity.Files;
import com.zrkizzy.blog.mapper.FilesMapper;
import com.zrkizzy.blog.service.IFilesService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.vo.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;

/**
 * 文件上传控制器
 *
 * @author zhangrongkang
 * @date 2022/9/2
 */
@Api(tags = "UploadController")
@RestController
@RequestMapping("/upload")
public class UploadController {
    @Resource
    private IFilesService filesService;
    @Resource
    private FilesMapper filesMapper;

    @ApiOperation("上传文件")
    @PostMapping("/")
    @LogAnnotation(module = "文件上传模块", description = "用户上传图片")
    public Result upload(MultipartFile file) throws IOException {
        FilesDto filesDto = filesService.saveFile(file);
        int count = filesMapper.insert(BeanCopyUtil.copy(filesDto, Files.class));
        if (count > 0) {
            return Result.success("头像上传成功", filesDto.getUrl());
        }
        return Result.error("头像上传失败");
    }
}
