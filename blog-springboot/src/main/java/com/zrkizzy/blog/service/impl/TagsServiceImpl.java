package com.zrkizzy.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zrkizzy.blog.entity.Tags;
import com.zrkizzy.blog.mapper.TagsMapper;
import com.zrkizzy.blog.service.TagsService;
import com.zrkizzy.blog.utils.CollectionUtil;
import com.zrkizzy.blog.vo.PageVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-14
 */
@Service
public class TagsServiceImpl extends ServiceImpl<TagsMapper, Tags> implements TagsService {
    @Resource
    private TagsMapper tagsMapper;

    /**
     * 获取标签列表
     *
     * @param name    标签名称
     * @param curPage 当前页数
     * @param size    页面大小
     * @return 分页对象
     */
    @Override
    public PageVO getTagsList(String name, Integer curPage, Integer size) {
        // 开启分页
        Page<Tags> page = new Page<>(curPage, size);
        // 定义查询条件
        QueryWrapper<Tags> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("name", name);
        Page<Tags> tagsPage = tagsMapper.selectPage(page, queryWrapper);
        return new PageVO(tagsPage.getTotal(), tagsPage.getRecords());
    }

    /**
     * 将标签名称集合转为对应的ID集合
     *
     * @param tags 标签名称集合
     * @param flag 是否需要更新标签数量
     * @return ID集合
     */
    @Override
    public String tagsConvertIds(String[] tags, Boolean flag) {
        // 定义返回结果
        StringBuilder builder = new StringBuilder();
        builder.append("[");
        // 查询所有标签列表
        List<Tags> tagsList = tagsMapper.selectList(null);
        // 循环遍历标签集合，将对应的ID添加到返回集合中
        for (String name : tags) {
            for (Tags tag : tagsList) {
                if (tag.getName().equals(name)) {
                    // 更新当前标签下的文章数量
                    if (flag) {
                        tag.setArticleNum(tag.getArticleNum() + 1);
                        tagsMapper.updateById(tag);
                    }
                    // 拼接标签内容
                    builder.append(tag.getId()).append(",");
                    break;
                }
            }
        }
        // 删除最后一个","并添加最后一个"]"
        builder.deleteCharAt(builder.length() - 1).append("]");
        return builder.toString();
    }

    /**
     * 将标签ID集合转为对应的数据集合
     *
     * @param tagIds 标签ID集合
     * @return 标签名称集合
     */
    @Override
    public String[] idsConvertTags(String tagIds) {
        // 将String类型的标签ID集合转为整型集合并进行查询
        List<String> tags = tagsMapper.selectTagsByIds(CollectionUtil.stringToIntegerList(tagIds));
        String[] result = new String[tags.size()];
        for (int i = 0; i < result.length; i++) {
            result[i] = tags.get(i);
        }
        return result;
    }
}
