package com.zrkizzy.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zrkizzy.blog.dto.WeekViewDTO;
import com.zrkizzy.blog.entity.WeekView;
import com.zrkizzy.blog.mapper.WeekViewMapper;
import com.zrkizzy.blog.service.WeekViewService;
import com.zrkizzy.blog.utils.TimeUtil;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import static com.zrkizzy.blog.constant.RedisConst.DAILY_VISITS;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-10-03
 */
@Service
public class WeekViewServiceImpl extends ServiceImpl<WeekViewMapper, WeekView> implements WeekViewService {
    @Resource
    private RedisTemplate<String, Object> redisTemplate;
    @Resource
    private WeekViewMapper weekViewMapper;

    /**
     * 获取一周访问量数据
     *
     * @return 本周访问量数据传输对象
     */
    @Override
    public WeekViewDTO getWeekViewData() {
        WeekViewDTO weekViewDTO = new WeekViewDTO();
        List<String> dateData = new ArrayList<>();
        List<Integer> countData= new ArrayList<>();
        LocalDate startTime = LocalDate.now().plusDays(-7);
        LocalDate endTime = LocalDate.now();
        // 定义查询条件
        QueryWrapper<WeekView> queryWrapper = new QueryWrapper<>();
        queryWrapper.lt("create_time", endTime).gt("create_time", startTime).orderByAsc("create_time");
        List<WeekView> weekViews = weekViewMapper.selectList(queryWrapper);
        // 将查询到的数据进行赋值
        for (WeekView weekView : weekViews) {
            dateData.add(TimeUtil.localDateToString(weekView.getCreateTime()));
            countData.add(weekView.getViewCount());
        }
        weekViewDTO.setDateData(dateData);
        weekViewDTO.setCountData(countData);
        return weekViewDTO;
    }

    /**
     * 获取博客总访问量
     *
     * @return 博客总访问量
     */
    @Override
    public Integer getBlogVisitCount() {
        return weekViewMapper.getBlogVisitCount();
    }

    /**
     * 存储每日用户访问量（每天凌晨0点将昨日用户访问量进行存储）
     */
    @Scheduled(cron = " 0 0 0 * * ?", zone = "Asia/Shanghai")
    public void updateViewCount() {
        // 开启Redis
        ValueOperations<String, Object> valueOperations = redisTemplate.opsForValue();
        // 获取到昨天的日期
        LocalDate lastDay = LocalDate.now().plusDays(-1);
        // 获取当日的访问量
        Integer viewCounts = (Integer) valueOperations.get(DAILY_VISITS);
        if (viewCounts == null) {
            // 如果不存在当日访问量则进行添加
            valueOperations.set(DAILY_VISITS, 0);
            viewCounts = 0;
        }
        // 将前一天的访问量添加到数据库中
        WeekView weekView = new WeekView();
        weekView.setViewCount(viewCounts);
        weekView.setCreateTime(lastDay);
        weekViewMapper.insert(weekView);
    }

    /**
     * 清空Redis中存储的当日访问量（每天凌晨0点1分执行）
     */
    @Scheduled(cron = " 0 1 0 * * ?", zone = "Asia/Shanghai")
    public void clearViewCount() {
        // 开启Redis
        ValueOperations<String, Object> valueOperations = redisTemplate.opsForValue();
        // 清空Redis中当天的访问量
        valueOperations.set(DAILY_VISITS, 0);
    }
}
