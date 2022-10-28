/*
 Navicat Premium Data Transfer

 Source Server         : MySQL 
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 28/10/2022 20:48:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for about
-- ----------------------------
DROP TABLE IF EXISTS `about`;
CREATE TABLE `about` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` longtext COMMENT '内容',
  `update_time` datetime DEFAULT NULL COMMENT '上一次更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of about
-- ----------------------------
BEGIN;
INSERT INTO `about` (`id`, `content`, `update_time`) VALUES (1, '# 关于我\n在这里编辑关于我的内容', '2022-10-26 19:54:44');
COMMIT;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '博客标题',
  `category` int DEFAULT NULL COMMENT '博客分类',
  `publish_time` datetime DEFAULT NULL COMMENT '发表时间',
  `tags` varchar(255) DEFAULT NULL COMMENT '标签',
  `summary` varchar(255) DEFAULT NULL COMMENT '摘要',
  `content_md` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '文章内容',
  `type` tinyint DEFAULT NULL COMMENT '文章类型 1 原创 2 转载 3 翻译',
  `state` tinyint DEFAULT NULL COMMENT '文章状态 0 草稿 1 已发布 2 回收站',
  `deleted` tinyint DEFAULT '0' COMMENT '是否删除 1 已删除 0 未删除',
  `allow_comment` tinyint DEFAULT '1' COMMENT '是否开启评论 1 开启 0 不开启',
  `top` tinyint DEFAULT '0' COMMENT '是否置顶 1 置顶 0 不置顶',
  `background` varchar(255) DEFAULT NULL COMMENT '文章封面图',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `view_num` int DEFAULT '0' COMMENT '浏览数量',
  `comment_num` int DEFAULT '0' COMMENT '评论数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` (`id`, `title`, `category`, `publish_time`, `tags`, `summary`, `content_md`, `type`, `state`, `deleted`, `allow_comment`, `top`, `background`, `update_time`, `view_num`, `comment_num`) VALUES (1, 'Hello,World', 1, '2022-10-26 09:55:08', '[1]', '个人博客网站第一篇文章，如果你看到了这一篇文章，那么证明你已经安装成功了，感谢使用本项目进行创作，希望能够使用愉快。', '# Hello World\n如果你看到了这一篇文章，那么证明你已经安装成功了，感谢使用本项目进行创作，希望能够使用愉快。', 1, 1, 0, 1, 1, 'http://localhost:8090/images/article/db5BlBTX.jpg', '2022-10-27 09:55:08', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名',
  `description` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类描述',
  `article_amount` int DEFAULT NULL COMMENT '包含文章数',
  `image` varchar(255) DEFAULT NULL COMMENT '分类图片',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
INSERT INTO `categories` (`id`, `name`, `description`, `article_amount`, `image`, `create_time`, `update_time`) VALUES (1, '默认分类', '初始项目默认分类', 1, 'http://localhost:8090/images/cover/wJYK57GY.jpg', '2022-10-26 20:34:38', '2022-10-26 20:34:38');
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '评论内容',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '用户昵称',
  `parent_id` int DEFAULT NULL COMMENT '父id',
  `comment_time` datetime DEFAULT NULL COMMENT '评论时间',
  `allow` tinyint DEFAULT NULL COMMENT '是否通过 1 已通过 0 审核中',
  `ip_address` varchar(255) DEFAULT NULL COMMENT 'IP地址',
  `ip_source` varchar(255) DEFAULT NULL COMMENT 'IP属地',
  `article_id` int DEFAULT NULL COMMENT '评论文章  留言页 0',
  `identity` tinyint DEFAULT NULL COMMENT '评论身份 博主 0 游客 1',
  `reply_name` varchar(255) DEFAULT NULL COMMENT '回复人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `user` varchar(255) DEFAULT NULL COMMENT '文件上传用户',
  `url` varchar(255) DEFAULT NULL COMMENT '文件上传路径',
  `description` varchar(255) DEFAULT NULL COMMENT '备注',
  `upload_time` datetime DEFAULT NULL COMMENT '文件上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of files
-- ----------------------------
BEGIN;
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (1, 'HXdqipKH.jpeg', '世纪末的架构师', 'http://localhost:8090/images/avatar/HXdqipKH.jpeg', '用户上传图片', '2022-10-26 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (3, 'm6CwXcmd.jpg', '世纪末的架构师', 'http://localhost:8090/images/cover/m6CwXcmd.jpg', '用户上传图片', '2022-10-26 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (4, 'yjKQy31p.jpg', '世纪末的架构师', 'http://localhost:8090/images/cover/yjKQy31p.jpg', '用户上传图片', '2022-10-26 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (5, 'zMorKuQv.jpg', '世纪末的架构师', 'http://localhost:8090/images/cover/zMorKuQv.jpg', '用户上传图片', '2022-10-26 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (6, 'dJKfIxdi.jpg', '世纪末的架构师', 'http://localhost:8090/images/cover/dJKfIxdi.jpg', '用户上传图片', '2022-10-26 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (7, 'hAzew3vK.jpg', '世纪末的架构师', 'http://localhost:8090/images/cover/hAzew3vK.jpg', '用户上传图片', '2022-10-26 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (8, 'LDO7EmDk.jpeg', '世纪末的架构师', 'http://localhost:8090/images/cover/LDO7EmDk.jpeg', '用户上传图片', '2022-10-26 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (9, 'NR7mu3yz.jpg', '世纪末的架构师', 'http://localhost:8090/images/cover/NR7mu3yz.jpg', '用户上传图片', '2022-10-26 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (10, 'lkIqXYMZ.jpg', '世纪末的架构师', 'http://localhost:8090/images/cover/lkIqXYMZ.jpg', '用户上传图片', '2022-10-26 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (11, 'RTu3Ou2u.jpg', '世纪末的架构师', 'http://localhost:8090/images/cover/RTu3Ou2u.jpg', '用户上传图片', '2022-10-26 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (12, 'gyV0k4lt.jpg', '世纪末的架构师', 'http://localhost:8090/images/receipt/gyV0k4lt.jpg', '用户上传图片', '2022-10-26 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (13, 'WegCyJWk.jpg', '世纪末的架构师', 'http://localhost:8090/images/receipt/WegCyJWk.jpg', '用户上传图片', '2022-10-26 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (14, '8HjImUIj.jpg', '世纪末的架构师', 'http://localhost:8090/images/avatar/8HjImUIj.jpg', '用户上传图片', '2022-10-26 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (15, 'wJYK57GY.jpg', '世纪末的架构师', 'http://localhost:8090/images/cover/wJYK57GY.jpg', '用户上传图片', '2022-10-26 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (16, 'db5BlBTX.jpg', '世纪末的架构师', 'http://localhost:8090/images/article/db5BlBTX.jpg', '用户上传图片', '2022-10-26 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for links
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(100) DEFAULT NULL COMMENT '网站名称',
  `website` varchar(255) DEFAULT NULL COMMENT '网站地址',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '网站logo',
  `description` varchar(255) DEFAULT NULL COMMENT '网站描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of links
-- ----------------------------
BEGIN;
INSERT INTO `links` (`id`, `title`, `website`, `logo`, `description`, `create_time`) VALUES (1, '世纪末的架构师', 'https://www.zrkizzy.com', 'http://localhost:8090/images/avatar/HXdqipKH.jpeg', '疯狂的热爱夹带着文雅', '2022-09-24 22:09:13');
COMMIT;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` varchar(64) DEFAULT NULL COMMENT '后端访问路径',
  `path` varchar(64) DEFAULT NULL COMMENT '前端访问路径',
  `component` varchar(64) DEFAULT NULL COMMENT '组件',
  `permission` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '权限标识',
  `name` varchar(64) DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(64) DEFAULT NULL COMMENT '图标',
  `require_auth` tinyint DEFAULT NULL COMMENT '是否要求权限',
  `parent_id` int DEFAULT NULL COMMENT '父组件Id',
  `enabled` tinyint DEFAULT NULL COMMENT '是否启用',
  `create_Time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of menu
-- ----------------------------
BEGIN;
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (1, '/', '/', '/', NULL, '所有', NULL, NULL, NULL, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (2, '/', '/profile', 'Profile', NULL, '个人中心', 'user', 1, 1, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (3, '/', '/dashboard', 'Dashboard', NULL, '仪表盘', 'dashboard', 1, 1, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (4, '/', '/article', 'Main', 'article', '文章管理', 'article', 1, 1, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (5, '/', '/information', 'Main', 'information', '消息管理', 'email', 1, 1, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (6, '/', '/security', 'Main', 'security', '权限管理', 'security', 1, 1, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (7, '/', '/user', 'Main', 'userManage', '用户管理', 'personnel-manage', 1, 1, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (8, '/', '/picture', 'Main', 'picture', '图片管理', 'table', 1, 1, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (9, '/', '/system', 'Main', 'system', '系统管理', 'system', 1, 1, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (10, '/', '/log', 'Main', 'logManage', '日志管理', 'server', 1, 1, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (11, '/article/creat/**', '/article/create-article', 'CreateArticle', 'articleCreate', '发布文章', 'article-create', 1, 4, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (12, '/article/list/**', '/article/article-list', 'ArticleList', 'articleList', '文章列表', 'article-ranking', 1, 4, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (13, '/article/category/**', '/article/categorys', 'Category', 'category', '分类管理', 'category', 1, 4, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (14, '/article/tags/**', '/article/tags', 'Tags', 'tags', '标签管理', 'tags', 1, 4, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (15, '/information/comment/**', '/information/comment', 'Comment', 'comment', '评论管理', 'comments', 1, 5, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (16, '/information/message/**', '/information/message', 'Message', 'message', '留言管理', 'message', 1, 5, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (17, '/security/menus/**', '/security/menus', 'Menus', 'menus', '菜单列表', 'menu', 1, 6, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (18, '/security/interface/**', '/security/interface', 'Interface', 'swagger', '接口文档', 'swagger', 1, 6, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (19, '/security/roles/**', '/security/roles', 'Roles', 'roles', '角色管理', 'role', 1, 6, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (20, '/user/userList/**', '/user/userList', 'UserList', 'userList', '用户列表', 'peoples', 1, 7, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (21, '/picture/pictureList/**', '/picture/pictureList', 'PictureList', 'pictureList', '图片列表', 'dict', 1, 8, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (22, '/system/website/**', '/system/website', 'Website', 'website', '网站管理', 'computer', 1, 9, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (23, '/system/pages/**', '/system/pages', 'Pages', 'pages', '页面管理', 'documentation', 1, 9, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (24, '/system/links/**', '/system/links', 'Links', 'links', '友链管理', 'personnel', 1, 9, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (25, '/system/about/**', '/system/about', 'About', 'about', '关于我', 'edit', 1, 9, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (26, '/log/operation/**', '/log/operation', 'Operation', 'operation', '操作日志', 'access', 1, 10, 1, '2022-08-06 23:40:44');
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (27, '/picture/pictureManage/**', '/picture/pictureManage', 'PictureManage', 'pictureManage', '相册管理', 'tool', 1, 8, 1, '2022-08-06 23:40:44');
COMMIT;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '用户昵称',
  `content` varchar(255) DEFAULT NULL COMMENT '留言内容',
  `message_time` datetime DEFAULT NULL COMMENT '留言时间',
  `ip_source` varchar(255) DEFAULT NULL COMMENT 'IP属地',
  `ip_address` varchar(255) DEFAULT NULL COMMENT 'IP地址',
  `allow` tinyint DEFAULT NULL COMMENT '是否通过 1 正常 0 审核中',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of message
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for operate_log
-- ----------------------------
DROP TABLE IF EXISTS `operate_log`;
CREATE TABLE `operate_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '系统模块',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作描述',
  `request_method` varchar(255) DEFAULT NULL COMMENT '请求方式',
  `operate_method` varchar(255) DEFAULT NULL COMMENT '操作方法',
  `user` varchar(255) DEFAULT NULL COMMENT '操作人员',
  `operate_ip` varchar(255) DEFAULT NULL COMMENT '操作地址',
  `operate_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作地点',
  `status` tinyint DEFAULT NULL COMMENT '操作状态',
  `status_description` varchar(255) DEFAULT NULL COMMENT '状态描述',
  `request_param` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '请求参数',
  `return_param` mediumtext COMMENT '返回参数',
  `duration` int unsigned DEFAULT NULL COMMENT '执行时长',
  `operate_time` datetime DEFAULT NULL COMMENT '操作日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of operate_log
-- ----------------------------
BEGIN;
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (1, '留言模块', '删除指定留言', 'DELETE', 'com.zrkizzy.blog.controller.MessageController.deleteMessageById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[1]', '{\"code\":200,\"message\":\"删除成功\"}', 20, '2022-10-28 08:30:29');
COMMIT;

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) DEFAULT NULL COMMENT '页面名称',
  `label` varchar(100) DEFAULT NULL COMMENT '页面标签',
  `image` varchar(255) DEFAULT NULL COMMENT '页面图片',
  `path` varchar(255) DEFAULT NULL COMMENT '页面路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of pages
-- ----------------------------
BEGIN;
INSERT INTO `pages` (`id`, `title`, `label`, `image`, `path`) VALUES (1, '首页', 'home', 'http://localhost:8090/images/cover/m6CwXcmd.jpg', '/');
INSERT INTO `pages` (`id`, `title`, `label`, `image`, `path`) VALUES (2, '归档', 'archive', 'http://localhost:8090/images/cover/yjKQy31p.jpg', '/archive');
INSERT INTO `pages` (`id`, `title`, `label`, `image`, `path`) VALUES (3, '分类', 'category', 'http://localhost:8090/images/cover/zMorKuQv.jpg', '/category');
INSERT INTO `pages` (`id`, `title`, `label`, `image`, `path`) VALUES (4, '标签', 'tags', 'http://localhost:8090/images/cover/dJKfIxdi.jpg', '/tags');
INSERT INTO `pages` (`id`, `title`, `label`, `image`, `path`) VALUES (5, '相册', 'photo', 'http://localhost:8090/images/cover/z0qKbnAk.jpg', '/photo');
INSERT INTO `pages` (`id`, `title`, `label`, `image`, `path`) VALUES (6, '友链', 'links', 'http://localhost:8090/images/cover/LDO7EmDk.jpeg', '/links');
INSERT INTO `pages` (`id`, `title`, `label`, `image`, `path`) VALUES (7, '关于我', 'about', 'http://localhost:8090/images/cover/NR7mu3yz.jpg', '/about');
INSERT INTO `pages` (`id`, `title`, `label`, `image`, `path`) VALUES (8, '留言', 'message', 'http://localhost:8090/images/cover/lkIqXYMZ.jpg', '/message');
INSERT INTO `pages` (`id`, `title`, `label`, `image`, `path`) VALUES (9, '文章列表', 'articleList', 'http://localhost:8090/images/cover/RTu3Ou2u.jpg', 'null');
COMMIT;

-- ----------------------------
-- Table structure for photo
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '相册/照片名称',
  `description` varchar(255) DEFAULT NULL COMMENT '相册/照片描述',
  `parent_id` int DEFAULT NULL COMMENT '父ID 0 相册 1 照片',
  `image` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `deleted` tinyint DEFAULT '0' COMMENT '是否在回收站 1 回收站 0 未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of photo
-- ----------------------------
BEGIN;
INSERT INTO `photo` (`id`, `name`, `description`, `parent_id`, `image`, `deleted`) VALUES (1, '默认相册', '初始系统默认相册', 0, 'http://localhost:8090/images/cover/m6CwXcmd.jpg', 0);
INSERT INTO `photo` (`id`, `name`, `description`, `parent_id`, `image`, `deleted`) VALUES (2, '首页', '首页图片', 1, 'http://localhost:8090/images/cover/m6CwXcmd.jpg', 0);
INSERT INTO `photo` (`id`, `name`, `description`, `parent_id`, `image`, `deleted`) VALUES (3, '归档', '归档页面图片', 1, 'http://localhost:8090/images/cover/yjKQy31p.jpg', 0);
INSERT INTO `photo` (`id`, `name`, `description`, `parent_id`, `image`, `deleted`) VALUES (4, '分类', '分类页面图片', 1, 'http://localhost:8090/images/cover/zMorKuQv.jpg', 0);
INSERT INTO `photo` (`id`, `name`, `description`, `parent_id`, `image`, `deleted`) VALUES (5, '标签', '标签页面图片', 1, 'http://localhost:8090/images/cover/dJKfIxdi.jpg', 0);
INSERT INTO `photo` (`id`, `name`, `description`, `parent_id`, `image`, `deleted`) VALUES (6, '相册', '相册页面图片', 1, 'http://localhost:8090/images/cover/hAzew3vK.jpg', 0);
INSERT INTO `photo` (`id`, `name`, `description`, `parent_id`, `image`, `deleted`) VALUES (7, '友链', '友情链接页面图片', 1, 'http://localhost:8090/images/cover/LDO7EmDk.jpeg', 0);
INSERT INTO `photo` (`id`, `name`, `description`, `parent_id`, `image`, `deleted`) VALUES (8, '关于我', '关于我页面图片', 1, 'http://localhost:8090/images/cover/NR7mu3yz.jpg', 0);
INSERT INTO `photo` (`id`, `name`, `description`, `parent_id`, `image`, `deleted`) VALUES (9, '留言', '留言页面图片', 1, 'http://localhost:8090/images/cover/lkIqXYMZ.jpg', 0);
INSERT INTO `photo` (`id`, `name`, `description`, `parent_id`, `image`, `deleted`) VALUES (10, '文章列表', '文章列表图片', 1, 'http://localhost:8090/images/cover/RTu3Ou2u.jpg', 0);
COMMIT;

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` int NOT NULL COMMENT '主键',
  `resource_name` varchar(255) DEFAULT NULL COMMENT '资源名称',
  `url` varchar(255) DEFAULT NULL COMMENT '权限路径',
  `request_method` varchar(255) DEFAULT NULL COMMENT '请求方式',
  `parent_id` int DEFAULT NULL COMMENT '父权限id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of resource
-- ----------------------------
BEGIN;
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (1, '用户模块', NULL, NULL, 0, '2022-09-27 14:11:14');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (2, '分类模块', NULL, NULL, 0, '2022-09-27 14:11:34');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (3, '文章模块', NULL, NULL, 0, '2022-09-27 14:12:28');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (4, '标签模块', NULL, NULL, 0, '2022-09-27 14:13:28');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (5, '文件模块', NULL, NULL, 0, '2022-09-27 14:13:28');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (6, '友链模块', NULL, NULL, 0, '2022-09-27 14:13:28');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (7, '日志模块', NULL, NULL, 0, '2022-09-27 14:13:28');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (8, '页面模块', NULL, NULL, 0, '2022-09-27 14:13:28');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (9, '资源模块', NULL, NULL, 0, '2022-09-27 14:13:28');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (10, '角色模块', NULL, NULL, 0, '2022-09-27 14:13:28');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (11, '社交模块', NULL, NULL, 0, '2022-09-27 14:13:28');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (12, '关于我模块', NULL, NULL, 0, '2022-09-27 14:13:28');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (13, '网站信息模块', NULL, NULL, 0, '2022-09-27 14:13:28');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (14, '修改指定用户密码', '/user/admin/updatePasswordById?**', 'PUT', 1, '2022-09-27 14:13:28');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (15, '新增用户', '/user/admin/addUser', 'POST', 1, '2022-09-27 14:13:28');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (16, '删除用户', '/user/admin/deleteUserById/**', 'DELETE', 1, '2022-09-27 15:21:46');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (17, '修改指定用户启用状态', '/admin/changeUserEnabled/**', 'PUT', 1, '2022-09-27 15:23:16');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (18, '新增分类', '/admin/insertCategory', 'POST', 2, '2022-09-27 15:24:21');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (19, '删除指定的分类', '/admin/deleteCategory/**', 'DELETE', 2, '2022-09-27 15:24:49');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (20, '批量删除分类', '/admin/deleteCategoryBatchIds/**', 'DELETE', 2, '2022-09-27 15:24:49');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (21, '更新指定分类', '/admin/updateCategory', 'PUT', 2, '2022-09-27 15:25:56');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (22, '更新/编辑文章', '/article/save', 'POST', 3, '2022-09-27 15:35:03');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (23, '修改文章是否置顶', '/article/updateArticleTop/**', 'GET', 3, '2022-09-27 15:35:36');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (24, '修改文章是否允许评论', '/article/updateArticleComment/**', 'GET', 3, '2022-09-27 15:36:26');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (25, '移动指定文章到回收站', '/article/removeArticle/**', 'GET', 3, '2022-09-27 15:37:22');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (26, '批量移动文章到回收站', '/article/removeArticleBatchIds/**', 'GET', 3, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (27, '删除指定文章', '/article/deleteArticle/**', 'DELETE', 3, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (28, '批量删除回收站文章', '/article/deleteArticleBatchIds/**', 'DELETE', 3, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (29, '添加标签', '/tags/insertTags', 'POST', 4, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (30, '删除标签', '/tags/deleteTags/**', 'DELETE', 4, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (31, '批量删除标签', '/tags/deleteTagsBatchIds/**', 'DELETE', 4, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (32, '更新标签', '/tags/updateTags', 'POST', 4, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (33, '批量删除文件', '/files/deleteFileBatchIds/**', 'DELETE', 5, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (34, '更新文件信息', '/files/updateFileInfo', 'POST', 5, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (35, '更新角色资源权限', '/resource-role/updateResourceRole', 'POST', 9, '2022-09-27 20:18:31');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (37, '根据文件访问路径删除文件', '/upload/deleteFileByPath/**', 'GET', 5, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (38, '添加友链', '/links/addLinks', 'POST', 6, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (39, '更新友链', '/links/updateLinks', 'PUT', 6, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (40, '删除友链', '/links/deleteLinkById/**', 'DELETE', 6, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (41, '批量删除日志', '/operate-log/deleteLogBatchIds/**', 'DELETE', 7, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (42, '新建页面', '/pages/addPages', 'POST', 8, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (43, '更新页面', '/pages/updatePageInfo', 'PUT', 8, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (44, '删除页面', '/pages/deletePageById/**', 'DELETE', 8, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (45, '更新角色', '/role/admin/updateRole/**', 'PUT', 10, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (46, '新增角色', '/role/admin/insertRole', 'POST', 10, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (47, '删除角色', '/role/admin/deleteRole/**', 'DELETE', 10, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (48, '更新用户角色', '/user-role/updateUserRole?**', 'GET', 10, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (49, '更新社交信息是否启用', '/social/updateSocialInfo', 'POST', 11, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (50, '更新关于我信息', '/about/updateAboutInfo', 'PUT', 12, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (51, '更新网站设置信息', '/website/updateWebsiteInfo', 'POST', 13, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (52, '更新网站管理其他信息', '/website/updateOtherInfo', 'PUT', 13, '2022-09-27 15:37:55');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (53, '留言模块', NULL, NULL, 0, '2022-09-29 01:14:20');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (54, '删除指定留言', '/message/deleteMessageById/**', 'DELETE', 53, '2022-09-29 01:14:20');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (55, '批量删除留言', '/message/deleteMessageBatchIds/**', 'DELETE', 53, '2022-09-29 01:14:20');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (56, '通过审核留言', '/message/passMessageById/**', 'GET', 53, '2022-09-29 01:14:20');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (57, '批量审核通过留言', '/message/passMessageBatchIds/**', 'GET', 53, '2022-09-29 01:14:20');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (58, '评论模块', NULL, NULL, 0, '2022-09-29 01:14:20');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (59, '删除指定评论', '/comment/deleteCommentById/**', 'DELETE', 58, '2022-09-29 01:14:20');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (60, '批量删除评论', '/comment/deleteCommentBatchIds/**', 'DELETE', 58, '2022-09-29 01:14:20');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (61, '通过审核评论', '/comment/passCommentById/**', 'GET', 58, '2022-09-29 01:14:20');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (62, '批量审核通过评论', '/comment/passCommentBatchIds/**', 'GET', 58, '2022-09-29 01:14:20');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (63, '后台回复评论', '/comment/addComment', 'POST', 58, '2022-10-20 16:35:26');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (64, '更新用户个人信息', '/admin/updateUserInfo', 'POST', 1, '2022-10-25 17:29:14');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (65, '用户更新密码', '/user/admin/updatePassword', 'PUT', 1, '2022-10-25 17:32:50');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (66, '用户上传文件', '/upload/', 'POST', 5, '2022-10-25 17:43:46');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (67, '用户上传头像', '/user/admin/uploadAvatar', 'POST', 5, '2022-10-25 17:49:48');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (68, '相册模块', NULL, NULL, 0, '2022-10-26 20:10:43');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (69, '添加/更新相册或照片', '/photo/save', 'POST', 68, '2022-10-26 20:11:15');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (70, '移动相册/照片到回收站', '/photo/removePhotos/**', 'GET', 68, '2022-10-26 20:12:04');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (71, '批量恢复相册/照片', '/photo/recoverPhotosBatchIds/**', 'GET', 68, '2022-10-26 20:13:01');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (72, '批量移动照片到回收站', '/photo/deletePhotoBatchIds/**', 'GET', 68, '2022-10-26 20:13:35');
INSERT INTO `resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `create_time`) VALUES (73, '批量删除相册/照片', '/photo/deletePhotosBatchIds/**', 'DELETE', 68, '2022-10-26 20:14:43');
COMMIT;

-- ----------------------------
-- Table structure for resource_role
-- ----------------------------
DROP TABLE IF EXISTS `resource_role`;
CREATE TABLE `resource_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resource_id` int DEFAULT NULL COMMENT '资源权限ID',
  `role_id` int DEFAULT NULL COMMENT '用户角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of resource_role
-- ----------------------------
BEGIN;
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (1, 1, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (2, 2, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (3, 3, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (4, 4, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (5, 5, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (6, 6, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (7, 7, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (8, 8, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (9, 9, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (10, 10, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (11, 11, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (12, 12, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (13, 13, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (14, 14, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (15, 15, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (16, 16, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (17, 17, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (18, 18, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (19, 19, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (20, 20, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (21, 21, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (22, 22, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (23, 23, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (24, 24, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (25, 25, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (26, 26, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (27, 27, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (28, 28, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (29, 29, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (30, 30, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (31, 31, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (32, 32, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (33, 33, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (34, 34, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (35, 35, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (37, 37, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (38, 38, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (39, 39, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (40, 40, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (41, 41, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (42, 42, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (43, 43, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (44, 44, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (45, 45, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (46, 46, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (47, 47, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (48, 48, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (49, 49, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (50, 50, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (51, 51, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (52, 52, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (53, 53, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (54, 54, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (55, 55, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (56, 56, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (57, 57, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (58, 58, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (59, 59, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (60, 60, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (61, 61, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (62, 62, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (63, 63, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (64, 64, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (65, 65, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (66, 66, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (67, 67, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (68, 68, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (69, 69, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (70, 70, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (71, 71, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (72, 72, 1);
INSERT INTO `resource_role` (`id`, `resource_id`, `role_id`) VALUES (73, 73, 1);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色',
  `role_name_zh` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `permission` varchar(255) DEFAULT NULL COMMENT '角色权限',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` (`id`, `role_name`, `role_name_zh`, `permission`, `create_time`, `update_time`) VALUES (1, 'ROLE_admin', '系统管理员', '[4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27]', '2022-08-07 01:06:37', '2022-08-29 13:53:31');
INSERT INTO `role` (`id`, `role_name`, `role_name_zh`, `permission`, `create_time`, `update_time`) VALUES (2, 'ROLE_test', '测试账号', '[4,11,12,13,14,5,15,16,6,17,18,19,7,20,8,21,27,9,22,23,24,25,10,26]', '2022-08-07 12:39:32', '2022-09-23 10:16:27');
INSERT INTO `role` (`id`, `role_name`, `role_name_zh`, `permission`, `create_time`, `update_time`) VALUES (4, 'ROLE_user', '普通用户', '[4]', '2022-08-18 08:00:00', '2022-09-22 18:17:51');
COMMIT;

-- ----------------------------
-- Table structure for social
-- ----------------------------
DROP TABLE IF EXISTS `social`;
CREATE TABLE `social` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `github_show` tinyint DEFAULT NULL COMMENT '是否展示Github',
  `gitee_show` tinyint DEFAULT NULL COMMENT '是否展示Gitee',
  `csdn_show` tinyint DEFAULT NULL COMMENT '是否展示CSDN',
  `qq_show` tinyint DEFAULT NULL COMMENT '是否展示QQ',
  `leetcode_show` tinyint DEFAULT NULL COMMENT '是否展示LeetCode',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of social
-- ----------------------------
BEGIN;
INSERT INTO `social` (`id`, `github_show`, `gitee_show`, `csdn_show`, `qq_show`, `leetcode_show`) VALUES (1, 1, 1, 1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '标签名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `article_num` int DEFAULT '0' COMMENT '文章数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tags
-- ----------------------------
BEGIN;
INSERT INTO `tags` (`id`, `name`, `create_time`, `article_num`) VALUES (1, '默认标签', '2022-10-26 20:34:51', 1);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nick_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户昵称',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `ip_address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '登录IP',
  `ip_source` varchar(64) DEFAULT NULL COMMENT 'IP属地',
  `last_login_time` datetime DEFAULT NULL COMMENT '用户上次登录时间',
  `enabled` tinyint(1) DEFAULT NULL COMMENT '当前用户是否启用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`id`, `nick_name`, `username`, `password`, `avatar`, `ip_address`, `ip_source`, `last_login_time`, `enabled`, `create_time`, `update_time`) VALUES (1, '世纪末的架构师', 'admin', '$2a$10$Tt3NW32EBpMk9ClWUCAkOu6FIRXyhfze7xJ0bQGx8sdVgV4IqYzqO', 'http://localhost:8090/images/avatar/HXdqipKH.jpeg', '127.0.0.1', '本机登录', '2022-10-28 11:45:16', 1, '2022-08-06 23:40:44', '2022-10-26 20:18:45');
INSERT INTO `user` (`id`, `nick_name`, `username`, `password`, `avatar`, `ip_address`, `ip_source`, `last_login_time`, `enabled`, `create_time`, `update_time`) VALUES (2, '测试账号', 'test', '$2a$10$7yIvlsT5yiA3vXllBmwHJOAN7d.viT6QzzS/18EF2y4JauhNMFK8i', 'http://localhost:8090/images/avatar/8HjImUIj.jpg', '127.0.0.1', '本机登录', '2022-10-28 11:45:26', 1, '2022-08-13 18:23:02', '2022-10-26 20:16:30');
COMMIT;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `email` varchar(64) DEFAULT NULL COMMENT '用户邮箱',
  `phone` varchar(64) DEFAULT NULL COMMENT '手机号码',
  `qq` varchar(64) DEFAULT NULL COMMENT 'QQ号码',
  `github` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'git hub地址',
  `gitee` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'git ee地址',
  `csdn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'csdn账号',
  `leetcode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'leetcode主页',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '自我描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_info
-- ----------------------------
BEGIN;
INSERT INTO `user_info` (`id`, `email`, `phone`, `qq`, `github`, `gitee`, `csdn`, `leetcode`, `description`) VALUES (1, '1072876976@qq.com', '15234417033', '1072876976', 'https://github.com/Architect-Java', 'https://gitee.com/dream-flight', 'https://blog.csdn.net/qq_48455576?spm=1011.2124.3001.5343', 'https://leetcode.cn/u/dream-flight/', '一个想进大厂的大三学生狗');
INSERT INTO `user_info` (`id`, `email`, `phone`, `qq`, `github`, `gitee`, `csdn`, `leetcode`, `description`) VALUES (2, 'test@qq.com', '15234410000', '2675525537', 'github.com', 'github.com', 'csdn111', 'leetcode', '这里是测试账号的自我描述');
COMMIT;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `role_id` int DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_role
-- ----------------------------
BEGIN;
INSERT INTO `user_role` (`id`, `user_id`, `role_id`) VALUES (1, 1, 1);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`) VALUES (2, 2, 2);
COMMIT;

-- ----------------------------
-- Table structure for website
-- ----------------------------
DROP TABLE IF EXISTS `website`;
CREATE TABLE `website` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logo` varchar(255) DEFAULT NULL COMMENT '网站头像',
  `name` varchar(255) DEFAULT NULL COMMENT '网站名称',
  `author` varchar(255) DEFAULT NULL COMMENT '网站作者',
  `introduction` varchar(255) DEFAULT NULL COMMENT '网站简介',
  `create_date` datetime DEFAULT NULL COMMENT '网站创建日期',
  `publish` tinytext COMMENT '公告',
  `motto` varchar(255) DEFAULT NULL COMMENT '座右铭',
  `record` varchar(255) DEFAULT NULL COMMENT '备案号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of website
-- ----------------------------
BEGIN;
INSERT INTO `website` (`id`, `logo`, `name`, `author`, `introduction`, `create_date`, `publish`, `motto`, `record`) VALUES (1, 'http://localhost:8090/images/avatar/HXdqipKH.jpeg', '世纪末的架构师', '世纪末的架构师', '疯狂的热爱夹带着文雅', '2021-08-06 20:01:13', '欢迎大家访问我的个人博客，项目源码在左边Git hub和Gitee，交流群号：782739347，欢迎大家加入', '困难只能吓倒懦夫、懒汉，而胜利永远属于攀登高峰的人。人生的奋斗目标不要太大，认准了一件事情，投入兴趣与热情坚持去做，你就会成功。人生，要的就是惊涛骇浪，这波涛中的每一朵浪花都是伟大的，最后汇成闪着金光的海洋。', '这里填写你的备案号');
COMMIT;

-- ----------------------------
-- Table structure for website_other
-- ----------------------------
DROP TABLE IF EXISTS `website_other`;
CREATE TABLE `website_other` (
  `id` int NOT NULL COMMENT '主键',
  `avatar` varchar(255) DEFAULT NULL COMMENT '游客头像',
  `comment_allow` tinyint DEFAULT NULL COMMENT '评论审核 1 开启 0 关闭',
  `message_allow` tinyint DEFAULT NULL COMMENT '留言审核 1 开启 0 关闭',
  `reward` tinyint DEFAULT NULL COMMENT '打赏状态 1 开启 0 关闭',
  `wechat_receipt` varchar(255) DEFAULT NULL COMMENT '微信收款码',
  `alipay_receipt` varchar(255) DEFAULT NULL COMMENT '支付宝收款码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of website_other
-- ----------------------------
BEGIN;
INSERT INTO `website_other` (`id`, `avatar`, `comment_allow`, `message_allow`, `reward`, `wechat_receipt`, `alipay_receipt`) VALUES (1, 'http://localhost:8090/images/avatar/8HjImUIj.jpg', 0, 0, 1, 'http://localhost:8090/images/receipt/gyV0k4lt.jpg', 'http://localhost:8090/images/receipt/WegCyJWk.jpg');
COMMIT;

-- ----------------------------
-- Table structure for week_view
-- ----------------------------
DROP TABLE IF EXISTS `week_view`;
CREATE TABLE `week_view` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `view_count` int DEFAULT NULL COMMENT '访问量',
  `create_time` date DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of week_view
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
