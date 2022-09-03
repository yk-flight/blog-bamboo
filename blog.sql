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

 Date: 03/09/2022 17:15:46
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
  `url` varchar(255) DEFAULT NULL COMMENT '文件上传路径',
  `upload_time` datetime DEFAULT NULL COMMENT '文件上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of files
-- ----------------------------
BEGIN;
INSERT INTO `files` (`id`, `file_name`, `url`, `upload_time`) VALUES (1, 'h9BVg9XX.jpeg', '/images/h9BVg9XX.jpeg', '2022-09-03 11:34:57');
INSERT INTO `files` (`id`, `file_name`, `url`, `upload_time`) VALUES (2, '5eoV1YxS.jpg', '/images/5eoV1YxS.jpg', '2022-09-03 11:35:31');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
COMMIT;

-- ----------------------------
-- Table structure for operate_log
-- ----------------------------
DROP TABLE IF EXISTS `operate_log`;
CREATE TABLE `operate_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `model` varchar(255) DEFAULT NULL COMMENT '系统模块',
  `type` varchar(255) DEFAULT NULL COMMENT '操作类型',
  `request_method` varchar(255) DEFAULT NULL COMMENT '请求方式',
  `operate_method` varchar(255) DEFAULT NULL COMMENT '操作方法',
  `user` varchar(255) DEFAULT NULL COMMENT '操作人员',
  `operate_ip` varchar(255) DEFAULT NULL COMMENT '操作地址',
  `operate_addr` varchar(255) DEFAULT NULL COMMENT '操作地点',
  `status` tinyint DEFAULT NULL COMMENT '操作状态',
  `request_param` varchar(255) DEFAULT NULL COMMENT '请求参数',
  `return_param` varchar(255) DEFAULT NULL COMMENT '返回参数',
  `operate_time` datetime DEFAULT NULL COMMENT '操作日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of operate_log
-- ----------------------------
BEGIN;
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
INSERT INTO `role` (`id`, `role_name`, `role_name_zh`, `permission`, `create_time`, `update_time`) VALUES (1, 'ROLE_admin', '系统管理员', '[4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]', '2022-08-07 01:06:37', '2022-08-29 13:53:31');
INSERT INTO `role` (`id`, `role_name`, `role_name_zh`, `permission`, `create_time`, `update_time`) VALUES (2, 'ROLE_test', '测试账号', '[4,11,12,13,14,5,15,16]', '2022-08-07 12:39:32', '2022-08-31 19:17:22');
INSERT INTO `role` (`id`, `role_name`, `role_name_zh`, `permission`, `create_time`, `update_time`) VALUES (4, 'ROLE_user', '普通用户', '[2,3]', '2022-08-18 08:00:00', '2022-08-29 13:55:11');
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
INSERT INTO `user` (`id`, `nick_name`, `username`, `password`, `avatar`, `ip_address`, `ip_source`, `last_login_time`, `enabled`, `create_time`, `update_time`) VALUES (1, '世纪末的架构师', 'admin', '$2a$10$Tt3NW32EBpMk9ClWUCAkOu6FIRXyhfze7xJ0bQGx8sdVgV4IqYzqO', '/images/h9BVg9XX.jpeg', '127.0.0.1', '本机登录', '2022-09-03 11:13:33', 1, '2022-08-06 23:40:44', '2022-09-03 11:18:28');
INSERT INTO `user` (`id`, `nick_name`, `username`, `password`, `avatar`, `ip_address`, `ip_source`, `last_login_time`, `enabled`, `create_time`, `update_time`) VALUES (2, '测试账号', 'test', '$2a$10$qmqXxCiHH99iUC4esmxRfO9MYhC6EUtuTaNDsgOEAhp5Ef0BoS4.C', '/images/5eoV1YxS.jpg', '127.0.0.1', '本机登录', '2022-09-03 11:12:53', 1, '2022-08-13 18:23:02', '2022-09-03 11:13:17');
INSERT INTO `user` (`id`, `nick_name`, `username`, `password`, `avatar`, `ip_address`, `ip_source`, `last_login_time`, `enabled`, `create_time`, `update_time`) VALUES (4, 'nick', 'myCount', '$2a$10$YvE51d7kLfdQKF02R/DNXu1FUkHbY6.XymZHqxyNU9UMC2isMN/Eq', 'http://localhost:8090/images/21BId5lf.jpg', NULL, NULL, NULL, 1, '2022-09-03 01:20:19', '2022-09-03 01:20:19');
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
INSERT INTO `user_info` (`id`, `email`, `phone`, `qq`, `github`, `gitee`, `csdn`, `leetcode`, `description`) VALUES (4, '@qq.com', '15233337777', '267552', 'gthub.com', 'gitee.com', 'csdn.com', 'leetcode.com', '这里是自我描述');
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
INSERT INTO `user_role` (`id`, `user_id`, `role_id`) VALUES (2, 2, 4);
INSERT INTO `user_role` (`id`, `user_id`, `role_id`) VALUES (4, 4, 4);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
