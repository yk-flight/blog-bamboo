package com.zrkizzy.blog.service;

import com.zrkizzy.blog.entity.Website;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zrkizzy.blog.vo.Result;
import com.zrkizzy.blog.vo.param.WebsiteOtherVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-11
 */
public interface WebsiteService extends IService<Website> {

    /**
     * 更新网站信息
     *
     * @param websiteOtherVO 网站其他信息数据传输对象
     * @return 前端响应对象
     */
    Result updateOtherInfo(WebsiteOtherVO websiteOtherVO);
}
