package com.zrkizzy.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zrkizzy.blog.entity.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author zhangrongkang
 * @date 2022/8/6
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {
}
