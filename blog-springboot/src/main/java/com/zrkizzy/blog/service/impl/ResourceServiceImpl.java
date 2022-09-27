package com.zrkizzy.blog.service.impl;

import com.zrkizzy.blog.entity.Resource;
import com.zrkizzy.blog.mapper.ResourceMapper;
import com.zrkizzy.blog.service.IResourceService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-27
 */
@Service
public class ResourceServiceImpl extends ServiceImpl<ResourceMapper, Resource> implements IResourceService {

}
