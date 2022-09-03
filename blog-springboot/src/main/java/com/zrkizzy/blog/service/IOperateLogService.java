package com.zrkizzy.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zrkizzy.blog.entity.OperateLog;
import com.zrkizzy.blog.vo.PageVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-03
 */
public interface IOperateLogService extends IService<OperateLog> {

    /**
     * 获取操作日志列表
     *
     * @param curPage 当前页数
     * @param size 页面大小
     * @param nickName 用户名
     * @param module 系统模块
     * @return 分页对象
     */
    PageVO getOperateLogList(Integer curPage, Integer size, String nickName, String module);
}
