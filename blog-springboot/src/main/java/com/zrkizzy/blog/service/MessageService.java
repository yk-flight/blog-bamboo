package com.zrkizzy.blog.service;

import com.zrkizzy.blog.dto.MessageDTO;
import com.zrkizzy.blog.entity.Message;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-28
 */
public interface MessageService extends IService<Message> {
    /**
     * 获取留言列表(分页)
     *
     * @param curPage 当前页数
     * @param size 页面大小
     * @param nickName 留言用户昵称
     * @param allow 是否通过
     * @return 分页对象
     */
    PageVO getMessageList(Integer curPage, Integer size, String nickName, Integer allow);

    /**
     * 新增留言
     *
     * @param messageDTO 留言数据传输对象
     * @param request request请求
     * @return 前端响应对象
     */
    Result addMessage(MessageDTO messageDTO, HttpServletRequest request);

    /**
     * 更新留言用户的头像
     *
     * @param avatar 头像路径
     */
    void updateAvatar(String avatar);
}
