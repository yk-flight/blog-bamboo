package com.zrkizzy.blog.utils;

import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * 集合工具类
 *
 * @author zhangrongkang
 * @date 2022/9/21
 */
public class CollectionUtil {
    /**
     * 将传来的字符串数据转为整型集合
     *
     * @param str 字符串数据
     * @return 整型集合
     */
    public static List<Integer> stringToIntegerList(String str) {
        if (StringUtils.isEmpty(str)) {
            return null;
        }
        // 去除字符串两边的[]
        str = str.substring(1, str.length() - 1);
        // 根据 , 进行分割
        String[] split = str.split(",");
        List<Integer> result = new ArrayList<>();
        for (String s : split) {
            result.add(Integer.parseInt(s));
        }
        return result;
    }
}
