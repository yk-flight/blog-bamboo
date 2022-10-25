package com.zrkizzy.blog.mapper;

import com.zrkizzy.blog.dto.TagsDTO;
import com.zrkizzy.blog.entity.Tags;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-14
 */
public interface TagsMapper extends BaseMapper<Tags> {
    /**
     * 根据ID集合获取标签名称集合
     *
     * @param ids ID集合
     * @return 对应的标签名称集合
     */
    List<String> selectTagsByIds(@Param("ids") List<Integer> ids);

    /**
     * 根据ID获取标签数据传输对象集合
     *
     * @param ids ID集合
     * @return 标签数据传输对象集合
     */
    List<TagsDTO> listTagsByIds(@Param("ids") List<Integer> ids);
}
