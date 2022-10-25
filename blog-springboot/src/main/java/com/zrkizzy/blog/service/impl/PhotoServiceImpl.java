package com.zrkizzy.blog.service.impl;

import com.zrkizzy.blog.entity.Photo;
import com.zrkizzy.blog.mapper.PhotoMapper;
import com.zrkizzy.blog.service.PhotoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-10-25
 */
@Service
public class PhotoServiceImpl extends ServiceImpl<PhotoMapper, Photo> implements PhotoService {

}
