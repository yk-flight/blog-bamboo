package com.zrkizzy.blog.handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zrkizzy.blog.vo.Result;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 自定义退出登录成功处理
 *
 * @author zhangrongkang
 * @date 2022/8/7
 */
@Component
public class LogoutSuccessHandlerImpl implements LogoutSuccessHandler {
    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        System.out.println("执行了退出登录逻辑");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        // 获取输出流
        PrintWriter out = response.getWriter();
        Result bean = Result.success("退出登录成功");
        bean.setCode(200);
        out.write(new ObjectMapper().writeValueAsString(bean));
        out.flush();
        out.close();
    }
}
