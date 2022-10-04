package com.zrkizzy.blog.mapper;

import com.zrkizzy.blog.entity.WeekView;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-10-03
 */
public interface WeekViewMapper extends BaseMapper<WeekView> {
    /**
     * 更新昨日访问量
     *
     * @param lastDay 昨日日期
     * @param lastDayCount 昨日访问量
     * @return 受影响的行数
     */
    Integer updateLastDayCount(@Param("lastDay") String lastDay, @Param("lastDayCount") Integer lastDayCount);
}
