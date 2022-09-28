package com.zrkizzy.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zrkizzy.blog.dto.MessageDTO;
import com.zrkizzy.blog.dto.WebsiteOtherDTO;
import com.zrkizzy.blog.entity.Message;
import com.zrkizzy.blog.mapper.MessageMapper;
import com.zrkizzy.blog.mapper.WebsiteOtherMapper;
import com.zrkizzy.blog.service.MessageService;
import com.zrkizzy.blog.utils.BeanCopyUtil;
import com.zrkizzy.blog.utils.IpUtil;
import com.zrkizzy.blog.vo.PageVO;
import com.zrkizzy.blog.vo.Result;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;

import static com.zrkizzy.blog.constant.CommonConst.WEBSITE_INFO;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangrongkang
 * @since 2022-09-28
 */
@Service
public class MessageServiceImpl extends ServiceImpl<MessageMapper, Message> implements MessageService {
    @Resource
    private RedisTemplate<String, Object> redisTemplate;
    @Resource
    private WebsiteOtherMapper websiteOtherMapper;
    @Resource
    private MessageMapper messageMapper;

    /**
     * 获取留言列表(分页)
     *
     * @param curPage  当前页数
     * @param size     页面大小
     * @param nickName 留言用户昵称
     * @param allow 是否通过
     * @return 分页对象
     */
    @Override
    public PageVO getMessageList(Integer curPage, Integer size, String nickName, Integer allow) {
        // 开启分页
        Page<Message> page = new Page<>(curPage, size);
        // 定义查询条件
        QueryWrapper<Message> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("nick_name", nickName);
        // 判断是否需要查询审核状态
        if (allow != -1) {
            queryWrapper.eq("allow", allow);
        }
        // 查询分页
        Page<Message> messagePage = messageMapper.selectPage(page, queryWrapper);
        return new PageVO(messagePage.getTotal(), messagePage.getRecords());
    }

    /**
     * 新增留言
     *
     * @param messageDTO 留言数据传输对象
     * @return 前端响应对象
     */
    @Override
    public Result addMessage(MessageDTO messageDTO, HttpServletRequest request) {
        // 复制对象
        Message message = BeanCopyUtil.copy(messageDTO, Message.class);
        // 评论时间
        message.setMessageTime(LocalDateTime.now());
        // 获取到网站信息对象
        WebsiteOtherDTO websiteInfo = getWebsiteInfo();
        // 查看是否需要进行留言审核
        if (websiteInfo.getMessageAllow()) {
            // 设置当前留言为审核中
            message.setAllow(0);
        } else {
            // 设置当前留言状态为已通过
            message.setAllow(1);
        }
        // 获取IP地址
        String ipAddress = IpUtil.getCurIpAddress(request);
        message.setIpAddress(ipAddress);
        // 获取IP属地
        String ipSource = IpUtil.getIpSource(ipAddress);
        message.setIpSource(ipSource);
        // 将留言数据添加到数据库中
        if (messageMapper.insert(message) > 0) {
            return Result.success("留言发布成功");
        }
        return Result.error("留言发布失败");
    }

    /**
     * 获取网站信息对象
     *
     * @return 网站信息对象
     */
    private WebsiteOtherDTO getWebsiteInfo() {
        // 开启Redis
        ValueOperations<String, Object> valueOperations = redisTemplate.opsForValue();
        // 从Redis中获取评论审核信息
        WebsiteOtherDTO websiteOtherDTO = ( WebsiteOtherDTO) valueOperations.get(WEBSITE_INFO);
        // 如果获取到的对象为空
        if (websiteOtherDTO == null) {
            WebsiteOtherDTO websiteInfo = BeanCopyUtil.copy(websiteOtherMapper.selectById(1), WebsiteOtherDTO.class);
            // 将从数据库中获取到的对象设置到Redis中
            valueOperations.set(WEBSITE_INFO, websiteInfo);
        }
        return websiteOtherDTO;
    }
}
