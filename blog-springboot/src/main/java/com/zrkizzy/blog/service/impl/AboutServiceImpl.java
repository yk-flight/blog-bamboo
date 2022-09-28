package com.zrkizzy.blog.service.impl;

import com.zrkizzy.blog.entity.About;
import com.zrkizzy.blog.mapper.AboutMapper;
import com.zrkizzy.blog.service.AboutService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-26
 */
@Service
public class AboutServiceImpl extends ServiceImpl<AboutMapper, About> implements AboutService {

}
