package com.zrkizzy.blog.controller;

import com.zrkizzy.blog.annotation.LogAnnotation;
import com.zrkizzy.blog.entity.Files;
import com.zrkizzy.blog.enums.FilePathEnum;
import com.zrkizzy.blog.service.FilesService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.FileUseVO;
import com.zrkizzy.blog.vo.param.FilesVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

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
    private FilesService filesService;

    @ApiOperation("获取所有文件")
    @GetMapping("/getFilesList")
    public PageVO getFilesList(@RequestParam("curPage") Integer curPage,
                               @RequestParam("size") Integer size,
                               @RequestParam("nickName") String nickName,
                               @RequestParam("startTime")String startTime,
                               @RequestParam("endTime") String endTime) {
        return filesService.getFilesList(curPage, size, nickName, startTime, endTime);
    }

    @ApiOperation("批量删除文件")
    @DeleteMapping("/deleteFileBatchIds/{ids}")
    public Result deleteFileBatchIds(@PathVariable Integer[] ids) {
        return filesService.deleteFileBatchIds(ids);
    }

    @ApiOperation("更新文件信息")
    @LogAnnotation(module = "文件管理模块", description = "用户更新文件备注")
    @PostMapping("/updateFileInfo")
    public Result updateFileInfo(@RequestBody FilesVO filesVO) {
        Files files = BeanCopyUtil.copy(filesVO, Files.class);
        if (filesService.updateById(files)) {
            return Result.success("更新成功");
        }
        return Result.error("更新失败");
    }

    @ApiOperation("获取文件用途")
    @GetMapping("/getFileUse")
    public List<FileUseVO> getFileUse() {
        List<FileUseVO> result = new ArrayList<>();
        for (FilePathEnum value : FilePathEnum.values()) {
            FileUseVO fileUseVO = new FileUseVO();
            fileUseVO.setPath(value.getPath());
            fileUseVO.setDescription(value.getDescription());
            result.add(fileUseVO);
        }
        return result;
    }
}
