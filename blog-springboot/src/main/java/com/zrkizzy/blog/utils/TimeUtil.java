package com.zrkizzy.blog.utils;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 * 时间转化工具类
 *
 * @author zhangrongkang
 * @date 2022/9/5
 */
public class TimeUtil {
    /**
     * LocalDateTime 转 String
     *
     * @param time LocalDateTime
     * @return 对应的字符串
     */
    public static String localDateTimeToString(LocalDateTime time) {
        return time.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    /**
     * 获取当前时间（字符串格式）
     *
     * @return 当前时间
     */
    public static String getNowTime(){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return df.format(new Date());
    }

    /**
     * String 转 LocalDateTime
     *
     * @param time String
     * @return LocalDateTime
     */
    public static LocalDate stringToLocalDateDay(String time){
        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        return LocalDate.parse(time, df);
    }
}
