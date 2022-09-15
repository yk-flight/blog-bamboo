package com.zrkizzy.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zrkizzy.blog.dto.FilesDto;
import com.zrkizzy.blog.entity.Files;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-05
 */
public interface IFilesService extends IService<Files> {
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
    PageVO getFilesList(Integer curPage, Integer size, String nickName, String startTime, String endTime);

    /**
     * 将文件解析并上传到指定路径
     *
     * @param file 要进行上传到文件
     * @param filePath 文件存储路径
     * @return 文件上传数据对象
     * @exception IOException IO流异常
     */
    FilesDto saveFile(MultipartFile file, String filePath) throws IOException;


    /**
     * 通过id删除指定的文件
     *
     * @param ids ID集合
     * @return 前端响应对象
     */
    Result deleteFileBatchIds(Integer[] ids);
}
