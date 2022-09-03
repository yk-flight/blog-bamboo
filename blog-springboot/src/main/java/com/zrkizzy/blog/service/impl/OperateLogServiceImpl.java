package com.zrkizzy.blog.service.impl;

import com.zrkizzy.blog.entity.OperateLog;
import com.zrkizzy.blog.mapper.OperateLogMapper;
import com.zrkizzy.blog.service.IOperateLogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-03
 */
@Service
public class OperateLogServiceImpl extends ServiceImpl<OperateLogMapper, OperateLog> implements IOperateLogService {

}
