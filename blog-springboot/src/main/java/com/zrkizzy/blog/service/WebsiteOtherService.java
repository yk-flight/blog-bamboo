package com.zrkizzy.blog.service;

import com.zrkizzy.blog.entity.WebsiteOther;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-26
 */
public interface WebsiteOtherService extends IService<WebsiteOther> {
    /**
     * 获取网站信息对象
     *
     * @return 网站信息对象
     */
    WebsiteOther getWebsiteInfo();
}
