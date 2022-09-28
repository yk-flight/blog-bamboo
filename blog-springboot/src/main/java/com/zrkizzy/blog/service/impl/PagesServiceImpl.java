package com.zrkizzy.blog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zrkizzy.blog.entity.Pages;
import com.zrkizzy.blog.mapper.PagesMapper;
import com.zrkizzy.blog.service.PagesService;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-24
 */
@Service
public class PagesServiceImpl extends ServiceImpl<PagesMapper, Pages> implements PagesService {

}
