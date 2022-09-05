package com.zrkizzy.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zrkizzy.blog.entity.Files;
import com.zrkizzy.blog.mapper.FilesMapper;
import com.zrkizzy.blog.service.IFilesService;
import com.zrkizzy.blog.utils.TimeUtil;
import com.zrkizzy.blog.vo.PageVO;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;

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
}
