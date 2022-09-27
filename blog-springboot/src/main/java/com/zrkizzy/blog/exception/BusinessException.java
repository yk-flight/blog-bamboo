package com.zrkizzy.blog.exception;

import com.zrkizzy.blog.enums.StatusEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;

import static com.zrkizzy.blog.enums.StatusEnum.FAIL;

/**
 * 业务逻辑异常
 *
 * @author zhangrongkang
 * @date 2022/9/27
 */
@Getter
@AllArgsConstructor
public class BusinessException extends RuntimeException {
    /**
     * 操作错误码
     */
    private Integer code = FAIL.getCode();
    /**
     * 错误信息
     */
    private String message;

    public BusinessException(String message) {
        this.message = message;
    }

    /**
     * 其他错误状态
     *
     * @param statusEnum 状态枚举
     */
    public BusinessException(StatusEnum statusEnum) {
        this.code = statusEnum.getCode();
        this.message = statusEnum.getDescription();
    }
}
