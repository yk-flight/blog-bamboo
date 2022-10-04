package com.zrkizzy.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zrkizzy.blog.dto.BlogDTO;
import com.zrkizzy.blog.dto.MapValueDTO;
import com.zrkizzy.blog.entity.*;
import com.zrkizzy.blog.mapper.*;
import com.zrkizzy.blog.service.BlogService;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

import static com.zrkizzy.blog.constant.RedisConst.BLOG_VIEWS_COUNT;

/**
 * @author zhangrongkang
 * @date 2022/10/3
 */
@Service
public class BlogServiceImpl implements BlogService {
    @Resource
    private RedisTemplate<String, Object> redisTemplate;
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
        // 开启Redis
        ValueOperations<String, Object> valueOperations = redisTemplate.opsForValue();
        Integer accessNum = (Integer) valueOperations.get(BLOG_VIEWS_COUNT);
        // 如果没有访问量则创建
        if (accessNum == null) {
            valueOperations.set(BLOG_VIEWS_COUNT, 0);
        }
        // 访问数量
        blogDTO.setAccessNum(accessNum);
        // 文章数量
        blogDTO.setArticleNum(articleMapper.selectCount(new QueryWrapper<Article>().eq("deleted", 0)));
        // 留言数量
        blogDTO.setMessageNum(messageMapper.selectCount(null));
        // 用户数量
        blogDTO.setUserNum(userMapper.selectCount(null));
        // 热门文章
        blogDTO.setHotArticles(articleMapper.selectList(
                new QueryWrapper<Article>()
                        .eq("deleted", 0)
                        .orderByDesc("view_num")
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
