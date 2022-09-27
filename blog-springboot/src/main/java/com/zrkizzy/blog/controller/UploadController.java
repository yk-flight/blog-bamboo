package com.zrkizzy.blog.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zrkizzy.blog.annotation.LogAnnotation;
import com.zrkizzy.blog.dto.FilesDTO;
import com.zrkizzy.blog.entity.Files;
import com.zrkizzy.blog.mapper.FilesMapper;
import com.zrkizzy.blog.service.IFilesService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.vo.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;

import static com.zrkizzy.blog.constant.CommonConst.DOMAIN;

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

    @Value("${file.path}")
    public String uploadPath;

    @ApiOperation("上传文件")
    @PostMapping("/")
    public Result upload(@RequestPart("file")MultipartFile file, @RequestPart("filePath") String filePath) throws IOException {
        FilesDTO filesDto = filesService.saveFile(file, filePath);
        int count = filesMapper.insert(BeanCopyUtil.copy(filesDto, Files.class));
        if (count > 0) {
            return Result.success("图片上传成功", filesDto.getUrl());
        }
        return Result.error("图片上传失败");
    }

    @ApiOperation("上传文件")
    @PostMapping("/uploadImage")
    public String uploadImage(MultipartFile file, String path, String user) throws IOException {
        FilesDTO filesDto = filesService.saveImage(file, path, user);
        filesMapper.insert(BeanCopyUtil.copy(filesDto, Files.class));
        return filesDto.getUrl();
    }

    @ApiOperation("根据文件访问路径删除文件")
    @LogAnnotation(module = "文章模块", description = "根据上传图片的访问路径删除对应图片")
    @GetMapping("/deleteFileByPath")
    public Result deleteFileByPath(String path) {
        // 1. 删除当前数据库中存储的上传文件信息
        // 定义查询条件
        QueryWrapper<Files> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("url", path);
        // 删除数据库中存储的数据
        if (!filesService.remove(queryWrapper)) {
            return Result.error("图片删除失败");
        }
        // 2. 根据文件路径删除对应文件
        // 处理文件路径，传来的文件路径为访问路径，需要将"/image"替换为文件真正的路径
        path = path.replace(DOMAIN, uploadPath);
        // 根据文件的实际路径定义文件对象
        File file = new File(path);
        // 删除文件
        if (file.delete()) {
            return Result.success("图片删除成功");
        }
        return Result.error("图片删除失败");
    }
}
