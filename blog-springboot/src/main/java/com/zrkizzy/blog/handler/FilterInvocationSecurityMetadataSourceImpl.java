package com.zrkizzy.blog.handler;

import com.zrkizzy.blog.dto.ResourceRoleDTO;
import com.zrkizzy.blog.mapper.RoleMapper;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.CollectionUtils;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.Collection;
import java.util.List;

/**
 * 权限控制过滤器：根据请求url分析请求所需的角色
 *
 * @author zhangrongkang
 * @date 2022/8/7
 */
@Component
public class FilterInvocationSecurityMetadataSourceImpl implements FilterInvocationSecurityMetadataSource {
    /**
     * 角色资源列表
     */
    private static List<ResourceRoleDTO> resourceRoleList;
    @Resource
    private RoleMapper roleMapper;

    /**
     * 加载角色资源信息（在项目启动时执行该方法）
     */
    @PostConstruct
    private void loadResourceData() {
        resourceRoleList = roleMapper.selectResourceRoles();
    }
    /**
     * 清空当前角色信息权限
     */
    public void clearDataSource() {
        resourceRoleList = null;
    }


    private final AntPathMatcher antPathMatcher = new AntPathMatcher();

    @Override
    public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
        // 如果有修改用户资源权限操作后需要重新进行查询
        if (CollectionUtils.isEmpty(resourceRoleList)) {
            this.loadResourceData();
        }
        FilterInvocation filter = (FilterInvocation) object;
        // 获取请求的方法
        String method = filter.getRequest().getMethod();
        // 获取请求的URL
        String requestUrl = filter.getRequestUrl();
        // 匹配权限的URL
        for (ResourceRoleDTO resourceRoleDTO : resourceRoleList) {
            // 如果请求路径与请求方法一致则进行权限添加操作
            if (antPathMatcher.match(resourceRoleDTO.getUrl(), requestUrl) && resourceRoleDTO.getRequestMethod().equals(method)) {
                return SecurityConfig.createList(resourceRoleDTO.getRoleList().toArray(new String[]{}));
            }
        }
        // 没有匹配到的url默认登录即可访问
        return SecurityConfig.createList("ROLE_LOGIN");
    }

    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return false;
    }
}
