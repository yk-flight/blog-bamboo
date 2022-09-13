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

 Date: 13/09/2022 22:17:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类描述',
  `article_amount` int DEFAULT NULL COMMENT '包含文章数',
  `image` varchar(255) DEFAULT NULL COMMENT '分类图片',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
INSERT INTO `categories` (`id`, `name`, `description`, `article_amount`, `image`, `create_time`, `update_time`) VALUES (1, '测试分类1', '测试修改文章分类', 0, 'https://z3.ax1x.com/2021/06/29/RdTyyq.jpg', '2022-08-18 08:00:00', '2022-08-18 23:41:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of files
-- ----------------------------
BEGIN;
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (1, 'ijrbhduX.png', '世纪末的架构师', '/images/ijrbhduX.png', '用户上传图片', '2021-05-06 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (2, '4u03nrRo.jpg', '测试账号', '/images/4u03nrRo.jpg', '用户上传图片', '2022-09-07 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (3, 'zpw1h2aC.jpg', '世纪末的架构师', '/images/zpw1h2aC.jpg', '用户上传图片', '2022-09-08 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (4, 'ncgViPvg.jpg', '世纪末的架构师', '/images/ncgViPvg.jpg', '用户上传图片', '2022-09-11 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (5, '2fNqMyrf.jpg', '世纪末的架构师', '/images/2fNqMyrf.jpg', '用户上传图片', '2022-09-11 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (6, 'ot7oGykS.jpg', '世纪末的架构师', '/images/ot7oGykS.jpg', '用户上传图片', '2022-09-11 00:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `permission`, `name`, `icon`, `require_auth`, `parent_id`, `enabled`, `create_Time`) VALUES (16, '/information/leave/**', '/information/leave', 'Leave', 'leave', '留言管理', 'message', 1, 5, 1, '2022-08-06 23:40:44');
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
  `request_param` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '请求参数',
  `return_param` mediumtext COMMENT '返回参数',
  `duration` int unsigned DEFAULT NULL COMMENT '执行时长',
  `operate_time` datetime DEFAULT NULL COMMENT '操作日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of operate_log
-- ----------------------------
BEGIN;
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (1, '文件管理模块', '用户批量删除文件', 'DELETE', 'com.zrkizzy.blog.service.impl.FilesServiceImpl.deleteFileBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[3,5,7,8,9,10,11,13]]', '{\"code\":200,\"message\":\"删除成功\"}', 21, '2022-09-07 16:13:17');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (2, '用户模块', '更新用户头像路径', 'POST', 'com.zrkizzy.blog.service.impl.UserServiceImpl.updateAvatarById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"avatar\":\"/images/ijrbhduX.png\"}]', 'null', 10, '2022-09-07 16:16:28');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (3, '用户模块', '更新用户头像路径', 'POST', 'com.zrkizzy.blog.service.impl.UserServiceImpl.updateAvatarById', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"avatar\":\"/images/4u03nrRo.jpg\"}]', 'null', 5, '2022-09-07 16:17:27');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (4, '角色模块', '用户更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2,4]', '{\"code\":200,\"message\":\"更新成功\"}', 16, '2022-09-08 19:56:04');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (5, '用户模块', '管理员更新指定用户密码', 'PUT', 'com.zrkizzy.blog.service.impl.UserServiceImpl.updatePasswordById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2,\"1234567\"]', '{\"code\":200,\"message\":\"重置成功\"}', 90, '2022-09-08 19:56:31');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (6, '用户信息模块', '修改用户是否启用', 'PUT', 'com.zrkizzy.blog.service.impl.UserInfoServiceImpl.changeUserEnabled', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2]', '{\"code\":200,\"message\":\"用户状态更新成功\"}', 14, '2022-09-08 19:57:12');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (7, '用户信息模块', '修改用户是否启用', 'PUT', 'com.zrkizzy.blog.service.impl.UserInfoServiceImpl.changeUserEnabled', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2]', '{\"code\":200,\"message\":\"用户状态更新成功\"}', 13, '2022-09-08 19:57:14');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (8, '角色模块', '用户更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2,2]', '{\"code\":200,\"message\":\"更新成功\"}', 9, '2022-09-08 22:30:39');
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
INSERT INTO `role` (`id`, `role_name`, `role_name_zh`, `permission`, `create_time`, `update_time`) VALUES (2, 'ROLE_test', '测试账号', '[4,11,12,13,14,5,15,16,6,17,18,19,7,20,8,21,27,9,22,23,24,25,10,26]', '2022-08-07 12:39:32', '2022-09-05 21:28:02');
INSERT INTO `role` (`id`, `role_name`, `role_name_zh`, `permission`, `create_time`, `update_time`) VALUES (4, 'ROLE_user', '普通用户', '[2,3]', '2022-08-18 08:00:00', '2022-08-29 13:55:11');
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
INSERT INTO `social` (`id`, `github_show`, `gitee_show`, `csdn_show`, `qq_show`, `leetcode_show`) VALUES (1, 1, 0, 0, 1, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`id`, `nick_name`, `username`, `password`, `avatar`, `ip_address`, `ip_source`, `last_login_time`, `enabled`, `create_time`, `update_time`) VALUES (1, '世纪末的架构师', 'admin', '$2a$10$Tt3NW32EBpMk9ClWUCAkOu6FIRXyhfze7xJ0bQGx8sdVgV4IqYzqO', '/images/ijrbhduX.png', '127.0.0.1', '本机登录', '2022-09-13 20:10:17', 1, '2022-08-06 23:40:44', '2022-09-07 16:16:28');
INSERT INTO `user` (`id`, `nick_name`, `username`, `password`, `avatar`, `ip_address`, `ip_source`, `last_login_time`, `enabled`, `create_time`, `update_time`) VALUES (2, '测试账号', 'test', '$2a$10$o5mhJfOF1brtQb0kxeAu7OiurnwRn/d9TqbzdE08RinS4p3s60Cey', '/images/4u03nrRo.jpg', '127.0.0.1', '本机登录', '2022-09-13 20:09:59', 1, '2022-08-13 18:23:02', '2022-09-07 16:17:27');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
INSERT INTO `website` (`id`, `logo`, `name`, `author`, `introduction`, `create_date`, `publish`, `motto`, `record`) VALUES (1, '/images/ijrbhduX.png', '世纪末的架构师', '世纪末的架构师', '疯狂的热爱夹带着文雅', '2021-08-06 20:57:35', '欢迎大家访问我的个人博客，项目源码在左边Git hub和Gitee，交流群号：782739347，欢迎大家加入', '困难只能吓倒懦夫、懒汉，而胜利永远属于攀登高峰的人。人生的奋斗目标不要太大，认准了一件事情，投入兴趣与热情坚持去做，你就会成功。人生，要的就是惊涛骇浪，这波涛中的每一朵浪花都是伟大的，最后汇成闪着金光的海洋。', '晋ICP备2021018904号');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
