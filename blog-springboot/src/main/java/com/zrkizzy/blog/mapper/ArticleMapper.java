package com.zrkizzy.blog.mapper;

import com.zrkizzy.blog.entity.Article;
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
public interface ArticleMapper extends BaseMapper<Article> {
    /**
     * 将文章批量移动到回收站
     *
     * @param ids 文章ID集合
     * @return 受影响的行数
     */
    Integer removeArticleBatchIds(@Param("ids") List<Integer> ids);

    /**
     * 将文章批量从回收站恢复
     *
     * @param ids 文章ID集合
     * @return 受影响的行数
     */
    Integer recoverArticleBatchIds(@Param("ids") List<Integer> ids);
}
