package com.zrkizzy.blog.dto;

import lombok.Data;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * 文件信息传输对象
 *
 * @author zhangrongkang
 * @date 2022/9/5
 */
@Data
public class FilesDTO implements Serializable {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 文件名称
     */
    private String fileName;
    /**
     * 文件上传用户
     */
    private String user;
    /**
     * 文件上传路径
     */
    private String url;
    /**
     * 文件上传时间
     */
    private LocalDate uploadTime;
    /**
     * 备注
     */
    private String description;
}
