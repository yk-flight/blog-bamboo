# 项目介绍

<div align="center">
  <img src="https://z3.ax1x.com/2021/06/29/RdO4fO.jpg" width="200px">


  <span>**基于SpringBoot + Vue前后端分离的个人博客**</span>

  ![](https://img.shields.io/badge/Java-1.8-orange) ![](https://img.shields.io/badge/MySQL-8.0.13-brightgreen) ![](https://img.shields.io/badge/SpringBoot-2.4.1-yellow) ![](https://img.shields.io/badge/SpringSecurity-%E6%9D%83%E9%99%90-blue) ![](https://img.shields.io/badge/MybatisPlus-3.4.3-red)    ![](https://img.shields.io/badge/SpringRedis-2.4.1-red) ![](https://img.shields.io/badge/vue-2.6.11-yellowgreen)   ![](https://img.shields.io/badge/element--ui-2.15.6-blue)

</div>

## 项目地址

**项目地址：** [https://www.zrkizzy.com](https://www.zrkizzy.com)

**后台地址：**[https://admin.zrkizzy.com](https://admin.zrkizzy.com)

**测试账号**：test &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**密码**：123456

**在线接口文档地址：**[https://admin.zrkizzy.com/api/doc.html](https://admin.zrkizzy.com/api/doc.html)

**Github地址：** [https://github.com/Architect-Java/blog](https://github.com/Architect-Java/blog)

**Gitee地址：** [https://gitee.com/dream-flight/blog](https://gitee.com/dream-flight/blog)

## 目录结构

前端项目位于`blog-vue`目录，`blog-ui`为博客前台项目，`admin`为博客后台

后端项目位于`blog-springboot`目录

SQL文件为根目录的`blog.sql`文件，需要MySQL8及以上的版本

**前端项目：**

```shell
blog-ui/admin
├── public   
├── api                -- api请求接口目录
├── assets             -- 静态资源
├── components         -- 全局组件
├── constant           -- 全局常量
├── filter             -- 过滤器
├── icons              -- svg图标
├── layout             -- 项目布局
├── router             -- 路由
├── store              -- 全局缓存
├── styles             -- scss样式目录
├── utils              -- 工具目录
├── views              -- 页面视图
├── App.vue            -- App.vue
├── main.js            -- main.js
└── permission.js      -- 路由导航守卫  
```

**后端项目**

```shell
system-springboot
├── annotation         --  自定义注解
├── aspect             --  aop切面
├── config             --  配置模块
├── constant           --  静态常量模块
├── controller         --  控制器模块
├── dto                --  dto模块
├── entity             --  实体类模块
├── enums              --  枚举模块
├── exception          --  全局异常处理模块
├── filters    	       --  过滤器模块
├── generator	       --  逆向工程模块
├── handler            --  处理器模块（自定义JWT权限过滤器）
├── mapper             --  数据持久化模块
├── service            --  业务处理模块
├── util               --  工具类模块
└── vo        	       --  vo模块
```

## 项目运行：

**数据库：** 拉取项目到本地后，在数据库中需要先创建好名为`blog`的数据库，编码方式为`utf8mb4`，之后在`blog`数据库运行`blog.sql`文件，数据库会自动创建好表并导入数据。

**后端：** 修改`application.yml`配置类中相应的参数信息。

**前端：** 分别在前端项目`blog-ui`，`admin`中执行`npm install`方法下载前端项目对应的依赖后`npm run server`后即可运行

项目启动成功后输入管理员账号：admin	密码：123456 进行登录即可进入系统

本地接口文档地址：http://localhost:8090/doc.html

**代码生成器运行：** 在使用`Mybatis-Plus`代码生成器时，需要先将`/src/main/java/com/zrkizzy/blog/generator`目录下的`CodeGentrator`文件中数据库连接参数以及数据库用户名密码进行相应的修改后即可成功运行

**注意：** 先启动后端项目，再启动前端项目（前端项目运行顺序为**先运行前台项目再运行后台项目**），前端项目很多数据以及配置由后端动态加载

## 项目特点

- 前端前台样式参考hexo的样式"竹"、"Butterfly"，"风丶宇的个人博客"进行设计，整体美观简洁
- 前端后台样式参考"若依框架"、"element-admin"、"楠橘星后台管理"进行设计
- 使用"element-ui"进行样式渲染，重写部分"element-ui"样式源码，侧边栏、面包屑导航自动生成
- 后台采用RBAC模型，支持动态权限分配，前端菜单与后台权限实时更新
- 项目前后端分离开发，适应当前潮流
- 评论支持表情的输入和回复功能
- 博客编辑器采取Markdown语法，编辑文章快捷方便
- 博客留言墙采取弹幕样式，整体显示更加便捷
- 文章支持代码高亮和复制，增加用户阅读代码的体验
- 项目支持自定义相册以及相册预览，提升用户体验
- 增加文章目录，优化用户阅读体验
- 添加音乐播放器，支持自定义配置QQ音乐歌单
- 页面切换采用了NProgress进行过渡，增加项目美观程度
- 使用Spring AOP自定义注解实现日志管理
- 集成Mybatis-Plus代码生成器，简化后续开发
- 前端代码层次简单，没有进行严重封装，便于后端开发者阅读与扩展开发
- 后端代码编写遵循阿里巴巴开发规范，利于开发者学习

## 技术介绍：

**前端：** vue + vuex + vue-router + axios + element-ui + sass + vue-cropper + dayjs + nprogress + mavon-editor 
**后端：** SpringBoot + SpringSecurity + JWT + Swagger2 + MyBatisPlus + MySQL + Redis + Freemarker + FastJson + Kaptcha

## 开发环境

| 开发工具 | 功能作用      |
| -------- | ------------- |
| Idea     | Java开发工具  |
| Navicat  | MySQL连接工具 |
| VSCode   | Vue开发工具   |
| Medis    | Redis连接工具 |

| 开发环境 | 版本   |
| -------- | ------ |
| JDK      | 1.8    |
| MySQL    | 8.0.13 |
| Vue      | 2.6.11 |
| Redis    | 6.0.5  |

## 运行环境

**服务器配置：** 腾讯云2核4G CentOS7.2

**项目部署：** Nginx + Docker

## 项目截图

![](https://blog-springbot.oss-cn-hangzhou.aliyuncs.com/images/Home.png)![](https://blog-springbot.oss-cn-hangzhou.aliyuncs.com/images/ArticleList.png)

![](https://blog-springbot.oss-cn-hangzhou.aliyuncs.com/images/Article.png)

![](https://blog-springbot.oss-cn-hangzhou.aliyuncs.com/images/Login.png)

![](https://blog-springbot.oss-cn-hangzhou.aliyuncs.com/images/Dashboard.png)

![](https://blog-springbot.oss-cn-hangzhou.aliyuncs.com/images/Website.png)

![](https://blog-springbot.oss-cn-hangzhou.aliyuncs.com/images/CreateArticle.png)

![](https://blog-springbot.oss-cn-hangzhou.aliyuncs.com/images/Photos.png)

## 项目总结

经历了两个月的时间，这个博客从前台到后台终于开发完成并成功上线部署，在开发期间真的感谢风丶宇对我遇到问题的指点，很感谢也很倾佩风丶宇能够将如此优秀的项目开源供我们学习，因为我本身是后端开发，对于前端的样式以及实现设计并不精通，前端项目中很多地方的实现参考了风丶宇的代码。同时也很感谢木字楠在开发过程中与我遇到的问题进行探讨、交流项目思路，感谢一路走来帮助过我的的人。

虽然当前博客项目已经基本完成，但是项目仍然有很多可以进行优化和改进的地方，后续我会不断进行迭代更新，项目不足之处也欢迎大家对我提出问题和建议，博客项目技术实现较为简单，很适合新手开发者进行学习。对于博客实现的一些问题，我也会竭尽我所能来为大家解答，欢迎大家加入交流群中，我们一起探讨。

最后再次感谢大家的支持，您的star就是我的动力❤️

## 交流群

<img src="https://blog-springbot.oss-cn-hangzhou.aliyuncs.com/images/QQ.jpeg" alt="QQ" style="zoom:50%;" />