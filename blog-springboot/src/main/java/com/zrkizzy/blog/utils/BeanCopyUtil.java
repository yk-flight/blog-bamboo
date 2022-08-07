package com.zrkizzy.blog.utils;

import org.springframework.beans.BeanUtils;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * 集合对象复制工具类
 *
 * @author zhangrongkang
 * @date 2022/8/7
 */
public class BeanCopyUtil {
    /**
     * 复制集合
     *
     * @param source 复制的原对象集合
     * @param clazz 对象类型
     * @param <T> 泛型
     * @return 复制完成的集合
     */
    public static <T> List<T> copyList(List<T> source, Class<T> clazz) {
        List<T> target = new ArrayList<>();
        if (!CollectionUtils.isEmpty(source)) {
            if (!CollectionUtils.isEmpty(source)) {
                for (Object c : source) {
                    T obj = copy(c, clazz);
                    target.add(obj);
                }
            }
        }
        return target;
    }

    /**
     * 复制对象
     *
     * @param source 复制的原对象
     * @param clazz 对象类型
     * @param <T> 泛型
     * @return 复制完成的新对象
     */
    public static <T> T copy(Object source, Class<T> clazz) {
        if (source == null) {
            return null;
        }
        T obj = null;
        try {
            obj = clazz.newInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }
        BeanUtils.copyProperties(source, obj);
        return obj;
    }
}
