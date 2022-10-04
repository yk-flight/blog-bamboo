package com.zrkizzy.blog.service.impl;

import com.zrkizzy.blog.entity.WebsiteOther;
import com.zrkizzy.blog.mapper.WebsiteOtherMapper;
import com.zrkizzy.blog.service.WebsiteOtherService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import static com.zrkizzy.blog.constant.RedisConst.WEBSITE_INFO;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-26
 */
@Service
public class WebsiteOtherServiceImpl extends ServiceImpl<WebsiteOtherMapper, WebsiteOther> implements WebsiteOtherService {
    @Resource
    private RedisTemplate<String, Object> redisTemplate;
    @Resource
    private WebsiteOtherMapper websiteOtherMapper;

    /**
     * 获取网站信息对象
     *
     * @return 网站信息对象
     */
    @Override
    public WebsiteOther getWebsiteInfo() {
        // 开启Redis
        ValueOperations<String, Object> valueOperations = redisTemplate.opsForValue();
        // 从Redis中获取评论审核信息
        WebsiteOther websiteInfo = (WebsiteOther) valueOperations.get(WEBSITE_INFO);
        // 如果获取到的对象为空
        if (websiteInfo == null) {
            websiteInfo = websiteOtherMapper.selectById(1);
            // 将从数据库中获取到的对象设置到Redis中
            valueOperations.set(WEBSITE_INFO, websiteInfo);
        }
        return websiteInfo;
    }
}
