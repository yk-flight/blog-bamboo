package com.zrkizzy.blog.service;

import com.zrkizzy.blog.dto.WeekViewDTO;
import com.zrkizzy.blog.entity.WeekView;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-10-03
 */
public interface WeekViewService extends IService<WeekView> {
    /**
     * 获取一周访问量数据
     *
     * @return 本周访问量数据传输对象
     */
    WeekViewDTO getWeekViewData();
}
