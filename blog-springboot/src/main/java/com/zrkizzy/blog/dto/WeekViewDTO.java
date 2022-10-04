package com.zrkizzy.blog.dto;

import lombok.Data;

import java.util.List;

/**
 * 一周访问量数据传输对象
 *
 * @author zhangrongkang
 * @date 2022/10/4
 */
@Data
public class WeekViewDTO {
    /**
     * 横轴日期
     */
    private List<String> dateData;
    /**
     * 纵轴访问量
     */
    private List<Integer> countData;
}
