package com.zrkizzy.blog.handler;

import com.zrkizzy.blog.exception.BusinessException;
import com.zrkizzy.blog.vo.Result;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.Objects;

import static com.zrkizzy.blog.enums.StatusEnum.VALID_ERROR;

/**
 * 全局异常处理
 *
 * @author zhangrongkang
 * @date 2022/9/27
 */
@RestControllerAdvice
public class GlobalExceptionHandler {

    /**
     * 业务逻辑处理异常
     *
     * @param e 自定义业务逻辑异常类
     * @return 前端响应对象
     */
    @ExceptionHandler(value = BusinessException.class)
    public Result errorHandler(BusinessException e) {
        return Result.error(e.getCode(), e.getMessage());
    }

    /**
     * 方法参数异常错误
     *
     * @param e 方法参数异常类
     * @return 前端响应对象
     */
    @ExceptionHandler(value = MethodArgumentNotValidException.class)
    public Result errorHandler(MethodArgumentNotValidException e) {
        return Result.error(VALID_ERROR.getCode(), Objects.requireNonNull(e.getBindingResult().getFieldError()).getDefaultMessage());
    }

    /**
     * 系统异常错误
     *
     * @param e 异常类
     * @return 前端响应对象
     */
    @ExceptionHandler(value = Exception.class)
    public Result errorHandler(Exception e) {
        e.printStackTrace();
        return Result.error(e.getMessage());
    }
}
