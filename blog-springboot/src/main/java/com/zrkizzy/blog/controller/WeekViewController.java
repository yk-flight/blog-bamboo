package com.zrkizzy.blog.controller;


import com.zrkizzy.blog.dto.WeekViewDTO;
import com.zrkizzy.blog.service.WeekViewService;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-10-03
 */
@RestController
@Api(tags = "WeekViewController")
@RequestMapping("/week-view")
public class WeekViewController {
    @Resource
    private WeekViewService weekViewService;

    @GetMapping("/getWeekViewData")
    public WeekViewDTO getWeekViewData() {
        return weekViewService.getWeekViewData();
    }
}
