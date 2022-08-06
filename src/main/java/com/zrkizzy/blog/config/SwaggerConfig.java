package com.zrkizzy.blog.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * Swagger接口文档配置类
 *
 * @author zhangrongkang
 * @date 2022/8/4
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig {

    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                // 接口文档的参数信息
                .apiInfo(apiInfo())
                .select()
                // 包扫描的位置
                .apis(RequestHandlerSelectors.basePackage("com.zrkizzy.blog.controller"))
                .paths(PathSelectors.any())
                .build();
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                // 定义标题
                .title("个人博客接口文档")
                // 接口文档描述
                .description("这里是关于个人博客接口文档的描述")
                // 接口文档作者信息
                .contact(new Contact("世纪末的架构师", "http:localhost:8090/doc.html", "1072876976@qq.com"))
                // 版本号
                .version("1.0")
                .build();
    }
}
