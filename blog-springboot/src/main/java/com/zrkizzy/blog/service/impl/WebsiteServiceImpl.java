package com.zrkizzy.blog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zrkizzy.blog.annotation.LogAnnotation;
import com.zrkizzy.blog.entity.Website;
import com.zrkizzy.blog.entity.WebsiteOther;
import com.zrkizzy.blog.mapper.WebsiteMapper;
import com.zrkizzy.blog.mapper.WebsiteOtherMapper;
import com.zrkizzy.blog.service.WebsiteService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.WebsiteOtherVO;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import static com.zrkizzy.blog.constant.RedisConst.WEBSITE_INFO;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-11
 */
@Service
public class WebsiteServiceImpl extends ServiceImpl<WebsiteMapper, Website> implements WebsiteService {
    @Resource
    private RedisTemplate<String, Object> redisTemplate;

    @Resource
    private WebsiteOtherMapper websiteOtherMapper;

    /**
     * 更新网站信息
     *
     * @param websiteOtherVO 网站其他信息数据传输对象
     * @return 前端响应对象
     */
    @Override
    @LogAnnotation(module = "网站管理模块", description = "更新网站其他信息")
    @Transactional(rollbackFor = Exception.class)
    public Result updateOtherInfo(WebsiteOtherVO websiteOtherVO) {
        // 开启Redis
        ValueOperations<String, Object> valueOperations = redisTemplate.opsForValue();
        // 更新Redis中存储的网站其他信息对象
        WebsiteOther websiteOther = BeanCopyUtil.copy(websiteOtherVO, WebsiteOther.class);
        valueOperations.set(WEBSITE_INFO, websiteOther);
        // 更新数据库中存储的网站信息对象
        if (websiteOtherMapper.updateById(websiteOther) > 0) {
            return Result.success("更新成功");
        }
        return Result.error("更新失败");
    }
}
