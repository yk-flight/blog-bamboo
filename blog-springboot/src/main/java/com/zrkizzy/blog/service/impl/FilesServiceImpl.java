package com.zrkizzy.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zrkizzy.blog.dto.FilesDto;
import com.zrkizzy.blog.entity.Files;
import com.zrkizzy.blog.mapper.FilesMapper;
import com.zrkizzy.blog.service.IFilesService;
import com.zrkizzy.blog.utils.TimeUtil;
import com.zrkizzy.blog.utils.UserUtil;
import com.zrkizzy.blog.utils.UuidUtil;
import com.zrkizzy.blog.vo.PageVO;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.time.LocalDate;

import static com.zrkizzy.blog.constant.CommonConst.DOMAIN;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-05
 */
@Service
public class FilesServiceImpl extends ServiceImpl<FilesMapper, Files> implements IFilesService {
    @Resource
    private FilesMapper filesMapper;

    @Value("${file.path}")
    private String path;

    /**
     * 获取上传的图片列表
     *
     * @param curPage 当前页数
     * @param size 页面大小
     * @param nickName 上传用户昵称
     * @param startTime 开始时间
     * @param endTime  结束时间
     * @return 分页对象
     */
    @Override
    public PageVO getFilesList(Integer curPage, Integer size, String nickName, String startTime, String endTime) {
        // 开启分页
        Page<Files> page = new Page<>(curPage, size);
        // 定义查询条件
        QueryWrapper<Files> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("user", nickName);
        if (!StringUtils.isEmpty(startTime) && !StringUtils.isEmpty(endTime)) {
            // 上传时间大于起始时间
            queryWrapper.ge("upload_time", TimeUtil.stringToLocalDateDay(startTime));
            // 小于结束时间
            queryWrapper.le("upload_time", TimeUtil.stringToLocalDateDay(endTime));
        }
        // 查询分页
        Page<Files> filesPage = filesMapper.selectPage(page, queryWrapper);
        return new PageVO(filesPage.getTotal(), filesPage.getRecords());
    }

    /**
     * 将文件解析并上传到指定路径
     *
     * @param file 要进行上传到文件
     * @return 文件上传数据对象
     */
    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public FilesDto saveFile(MultipartFile file) throws IOException {
        // 获取文件类型
        int index = file.getOriginalFilename().lastIndexOf(".") + 1;
        String suffix = file.getOriginalFilename().substring(index);
        String fileName = UuidUtil.getShortUuid() + "." + suffix;
        // 拼接文件的全路径
        String fullPath = path +
                // 拼接 "/"
                File.separator +
                // 拼接文件名
                fileName;

        // 如果不存在文件保存的位置
        if (!java.nio.file.Files.exists(Paths.get(path))) {
            // 创建文件夹
            java.nio.file.Files.createDirectory(Paths.get(path));
        }
        // 保存上传的文件
        file.transferTo(new File(fullPath));
        // 定义返回的路径
        String url = DOMAIN + fileName;
        // 将当前上传的图片保存在数据库中
        FilesDto filesDto = new FilesDto();
        // 上传的用户
        filesDto.setUser(UserUtil.getCurrentUser().getNickName());
        // 上传时间
        filesDto.setUploadTime(LocalDate.now());
        // 文件路径
        filesDto.setUrl(url);
        // 文件名称
        filesDto.setFileName(fileName);
        // 设置备注
        filesDto.setDescription("用户上传图片");
        return filesDto;
    }
}
