package com.zrkizzy.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zrkizzy.blog.dto.BlogDTO;
import com.zrkizzy.blog.dto.MapValueDTO;
import com.zrkizzy.blog.entity.*;
import com.zrkizzy.blog.mapper.*;
import com.zrkizzy.blog.service.BlogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author zhangrongkang
 * @date 2022/10/3
 */
@Service
public class BlogServiceImpl implements BlogService {
    @Resource
    private MessageMapper messageMapper;
    @Resource
    private CategoryMapper categoryMapper;
    @Resource
    private TagsMapper tagsMapper;
    @Resource
    private OperateLogMapper operateLogMapper;
    @Resource
    private UserMapper userMapper;
    @Resource
    private CommentMapper commentMapper;
    @Resource
    private WeekViewMapper weekViewMapper;
    @Resource
    private ArticleMapper articleMapper;
    
    /**
     * 获取博客仪表盘信息
     *
     * @return 博客信息对象
     */
    @Override
    public BlogDTO getBlogInfo() {
        // 定义返回对象
        BlogDTO blogDTO = new BlogDTO();
        // 访问数量
        blogDTO.setAccessNum(weekViewMapper.getBlogVisitCount());
        // 文章数量
        blogDTO.setArticleNum(articleMapper.selectCount(new QueryWrapper<Article>().eq("deleted", 0)));
        // 留言数量
        blogDTO.setMessageNum(messageMapper.selectCount(null));
        // 用户数量
        blogDTO.setUserNum(userMapper.selectCount(null));
        // 最新评论
        blogDTO.setComments(commentMapper.selectList(
                new QueryWrapper<Comment>()
                        .orderByDesc("comment_time")
                        .last("limit 5")));
        // 最新留言
        blogDTO.setMessages(messageMapper.selectList(
                new QueryWrapper<Message>()
                        .orderByDesc("message_time")
                        .last("limit 5")));
        // 最新动态
        blogDTO.setOperateLogs(operateLogMapper.selectList(
                new QueryWrapper<OperateLog>()
                        .orderByDesc("operate_time")
                        .last("limit 5")));
        List<Tags> tagsList = tagsMapper.selectList(null);
        List<String> tags = new ArrayList<>();
        for (Tags tag : tagsList) {
            tags.add(tag.getName());
        }
        // 文章所有标签
        blogDTO.setTags(tags);
        // 文章所有分类，<分类名，文章数>
        List<Category> categories = categoryMapper.selectList(null);
        List<MapValueDTO> mapValueList = new ArrayList<>();
        for (Category category : categories) {
            MapValueDTO mapValueDTO = new MapValueDTO();
            mapValueDTO.setName(category.getName());
            mapValueDTO.setValue(category.getArticleAmount());
            mapValueList.add(mapValueDTO);
        }
        blogDTO.setCategories(mapValueList);
        return blogDTO;
    }


}
