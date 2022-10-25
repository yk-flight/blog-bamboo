package com.zrkizzy.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zrkizzy.blog.entity.Article;
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

    /**
     * 更新指定文章的访问量
     *
     * @param id 文章ID
     * @param viewNum 访问量
     * @return 受影响的行数
     */
    Integer updateArticleById(@Param("id")Integer id, @Param("viewNum") Integer viewNum);
}
