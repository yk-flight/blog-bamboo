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

 Date: 22/10/2022 14:07:27
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
INSERT INTO `about` (`id`, `content`, `update_time`) VALUES (1, '# 关于我\n一个想进大厂的大四学生狗\n万事顺意\n相信自己，世界相信你', '2022-10-17 20:09:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` (`id`, `title`, `category`, `publish_time`, `tags`, `summary`, `content_md`, `type`, `state`, `deleted`, `allow_comment`, `top`, `background`, `update_time`, `view_num`, `comment_num`) VALUES (1, '第一篇', 8, '2022-08-04 04:19:17', '[5]', '# 一级标题 测试内容', '# 一级标题\n测试内容，这里是测试内容\n## 二级标题\n继续测试\n测试权限', 1, 1, 0, 1, 0, 'http://localhost:8090/images/cover/8zkLNfgw.jpg', '2022-10-03 04:19:17', 20, 3);
INSERT INTO `article` (`id`, `title`, `category`, `publish_time`, `tags`, `summary`, `content_md`, `type`, `state`, `deleted`, `allow_comment`, `top`, `background`, `update_time`, `view_num`, `comment_num`) VALUES (2, '第二篇', 8, '2022-08-04 04:19:17', '[5]', '# 一级标题 测试内容', '# 一级标题\n测试内容，这里是测试内容\n## 二级标题\n继续测试\n测试权限', 1, 1, 0, 1, 1, 'http://localhost:8090/images/cover/8zkLNfgw.jpg', '2022-10-03 04:19:17', 26, 0);
INSERT INTO `article` (`id`, `title`, `category`, `publish_time`, `tags`, `summary`, `content_md`, `type`, `state`, `deleted`, `allow_comment`, `top`, `background`, `update_time`, `view_num`, `comment_num`) VALUES (6, '第二篇测试文章', 1, '2022-09-22 15:18:54', '[4,6,7]', '测试文章二', '测试文章', 1, 2, 1, 0, 1, 'http://localhost:8090/images/cover/xGx9zwY8.jpg', '2022-09-22 15:18:54', 23, 0);
INSERT INTO `article` (`id`, `title`, `category`, `publish_time`, `tags`, `summary`, `content_md`, `type`, `state`, `deleted`, `allow_comment`, `top`, `background`, `update_time`, `view_num`, `comment_num`) VALUES (7, '第三篇', 1, '2022-09-22 04:17:45', '[4,7]', '测试摘要', '测试\n继续测试能不能保存', 1, 1, 0, 1, 0, 'http://localhost:8090/images/cover/Y1TbZfkL.jpg', '2022-10-03 04:17:45', 32, 0);
INSERT INTO `article` (`id`, `title`, `category`, `publish_time`, `tags`, `summary`, `content_md`, `type`, `state`, `deleted`, `allow_comment`, `top`, `background`, `update_time`, `view_num`, `comment_num`) VALUES (8, '第四篇测试文章', 1, '2022-09-22 04:08:23', '[4,6,7]', '测试', '第四篇测试文章', 2, 1, 0, 1, 0, 'http://localhost:8090/images/cover/xGx9zwY8.jpg', '2022-10-03 04:08:23', 3, 0);
INSERT INTO `article` (`id`, `title`, `category`, `publish_time`, `tags`, `summary`, `content_md`, `type`, `state`, `deleted`, `allow_comment`, `top`, `background`, `update_time`, `view_num`, `comment_num`) VALUES (9, '前路有光，初心莫忘', 11, '2022-10-03 20:56:55', '[8]', '2021年终总结', '2021年的旅程也落下了帷幕', 1, 1, 0, 1, 0, 'http://localhost:8090/images/cover/LlfcijKq.jpeg', '2022-10-03 20:56:55', 2, 0);
INSERT INTO `article` (`id`, `title`, `category`, `publish_time`, `tags`, `summary`, `content_md`, `type`, `state`, `deleted`, `allow_comment`, `top`, `background`, `update_time`, `view_num`, `comment_num`) VALUES (10, '测试转HTML文章', 9, '2022-10-06 12:06:37', '[4,6]', '# 测试文本内容 测试图片 ![老农民](/images/avatar/P7E1vO0l.jpeg)  ## 测试二级标题', '# 测试一级标题\n测试图片\n![老农民](http://localhost:8081/images/avatar/P7E1vO0l.jpeg)\n\n```java\n// 代码内容，也不知道他为什么不高亮\npublic void static main () {\n    System.out.println();\n}\n```', 1, 1, 0, 1, 1, 'http://localhost:8090/images/avatar/P7E1vO0l.jpeg', '2022-10-06 12:06:37', 71, 6);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
INSERT INTO `categories` (`id`, `name`, `description`, `article_amount`, `image`, `create_time`, `update_time`) VALUES (1, '测试分类', '测试修改文章分类', 2, 'http://localhost:8090/images/cover/8zkLNfgw.jpg', '2022-08-18 08:00:00', '2022-09-22 19:14:03');
INSERT INTO `categories` (`id`, `name`, `description`, `article_amount`, `image`, `create_time`, `update_time`) VALUES (8, '数据结构', '数据结构学习笔记', 2, 'http://localhost:8090/images/cover/KU5ZUmz9.jpg', '2022-09-20 15:17:43', '2022-09-22 19:12:49');
INSERT INTO `categories` (`id`, `name`, `description`, `article_amount`, `image`, `create_time`, `update_time`) VALUES (9, '继续测试', '哈哈哈', 1, 'http://localhost:8090/images/cover/z0qKbnAk.jpg', '2022-09-27 09:52:16', '2022-09-28 15:32:16');
INSERT INTO `categories` (`id`, `name`, `description`, `article_amount`, `image`, `create_time`, `update_time`) VALUES (11, '生活记录', '生活记录文章', 1, 'http://localhost:8090/images/article/SbKJJVb8.jpg', '2022-10-03 20:56:23', '2022-10-03 20:56:32');
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` (`id`, `content`, `nick_name`, `parent_id`, `comment_time`, `allow`, `ip_address`, `ip_source`, `article_id`, `identity`, `reply_name`) VALUES (1, '第一条评论', '测试账号', 0, '2022-09-29 15:01:38', 1, '223.104.148.77', '江苏省苏州市 移动', 1, 1, NULL);
INSERT INTO `comment` (`id`, `content`, `nick_name`, `parent_id`, `comment_time`, `allow`, `ip_address`, `ip_source`, `article_id`, `identity`, `reply_name`) VALUES (2, '第2条评论', '测试账号', 0, '2022-09-29 15:01:38', 1, '223.104.148.77', '江苏省苏州市 移动', 1, 1, NULL);
INSERT INTO `comment` (`id`, `content`, `nick_name`, `parent_id`, `comment_time`, `allow`, `ip_address`, `ip_source`, `article_id`, `identity`, `reply_name`) VALUES (3, '第3条评论', '测试账号', 0, '2022-09-29 15:01:38', 1, '223.104.148.77', '江苏省苏州市 移动', 1, 1, NULL);
INSERT INTO `comment` (`id`, `content`, `nick_name`, `parent_id`, `comment_time`, `allow`, `ip_address`, `ip_source`, `article_id`, `identity`, `reply_name`) VALUES (8, '超级无敌架构师到此一游！<img src=\'https://static.talkxj.com/emoji/dx.jpg\' width=\'24\'height=\'24\' style=\'margin: 0 1px;\'/>', '超级无敌架构师', 0, '2022-09-29 23:26:28', 1, '0:0:0:0:0:0:0:1', '本地登录', 10, 1, NULL);
INSERT INTO `comment` (`id`, `content`, `nick_name`, `parent_id`, `comment_time`, `allow`, `ip_address`, `ip_source`, `article_id`, `identity`, `reply_name`) VALUES (9, '超级无敌架构师再次到此一游！', '超级无敌架构师', 8, '2022-09-29 23:30:04', 1, '0:0:0:0:0:0:0:1', '本地登录', 10, 1, '超级无敌架构师');
INSERT INTO `comment` (`id`, `content`, `nick_name`, `parent_id`, `comment_time`, `allow`, `ip_address`, `ip_source`, `article_id`, `identity`, `reply_name`) VALUES (10, '大哈皮', '超级无敌架构师', 8, '2022-09-29 23:30:44', 1, '0:0:0:0:0:0:0:1', '本地登录', 10, 1, '超级无敌架构师');
INSERT INTO `comment` (`id`, `content`, `nick_name`, `parent_id`, `comment_time`, `allow`, `ip_address`, `ip_source`, `article_id`, `identity`, `reply_name`) VALUES (11, '测试，哈哈哈', '世纪末的架构师', 1, '2022-10-20 16:23:34', 1, '127.0.0.1', '本地登录', 1, 0, NULL);
INSERT INTO `comment` (`id`, `content`, `nick_name`, `parent_id`, `comment_time`, `allow`, `ip_address`, `ip_source`, `article_id`, `identity`, `reply_name`) VALUES (12, '测试回复', '世纪末的架构师', 8, '2022-10-20 16:24:53', 1, '127.0.0.1', '本地登录', 10, 0, '超级无敌架构师');
INSERT INTO `comment` (`id`, `content`, `nick_name`, `parent_id`, `comment_time`, `allow`, `ip_address`, `ip_source`, `article_id`, `identity`, `reply_name`) VALUES (13, '回复一下', '世纪末的架构师', 2, '2022-10-20 16:25:26', 1, '127.0.0.1', '本地登录', 1, 0, NULL);
INSERT INTO `comment` (`id`, `content`, `nick_name`, `parent_id`, `comment_time`, `allow`, `ip_address`, `ip_source`, `article_id`, `identity`, `reply_name`) VALUES (14, '我继续回复', '世纪末的架构师', 2, '2022-10-20 16:25:48', 1, '127.0.0.1', '本地登录', 1, 0, NULL);
INSERT INTO `comment` (`id`, `content`, `nick_name`, `parent_id`, `comment_time`, `allow`, `ip_address`, `ip_source`, `article_id`, `identity`, `reply_name`) VALUES (15, '回复一下', '世纪末的架构师', 2, '2022-10-20 16:35:02', 1, '127.0.0.1', '本地登录', 1, 0, NULL);
INSERT INTO `comment` (`id`, `content`, `nick_name`, `parent_id`, `comment_time`, `allow`, `ip_address`, `ip_source`, `article_id`, `identity`, `reply_name`) VALUES (16, '测试一下', '世纪末的架构师', 3, '2022-10-20 16:36:08', 1, '127.0.0.1', '本地登录', 1, 0, NULL);
INSERT INTO `comment` (`id`, `content`, `nick_name`, `parent_id`, `comment_time`, `allow`, `ip_address`, `ip_source`, `article_id`, `identity`, `reply_name`) VALUES (17, '继续测试', '世纪末的架构师', 8, '2022-10-20 16:38:16', 1, '127.0.0.1', '本地登录', 10, 0, '世纪末的架构师');
INSERT INTO `comment` (`id`, `content`, `nick_name`, `parent_id`, `comment_time`, `allow`, `ip_address`, `ip_source`, `article_id`, `identity`, `reply_name`) VALUES (18, '测试', '世纪末的架构师', 3, '2022-10-20 16:42:37', 1, '127.0.0.1', '本地登录', 1, 0, NULL);
INSERT INTO `comment` (`id`, `content`, `nick_name`, `parent_id`, `comment_time`, `allow`, `ip_address`, `ip_source`, `article_id`, `identity`, `reply_name`) VALUES (22, 'hahaha', '世纪末的架构师', 1, '2022-10-21 14:49:53', 1, '127.0.0.1', '本地登录', 1, 0, '测试账号');
INSERT INTO `comment` (`id`, `content`, `nick_name`, `parent_id`, `comment_time`, `allow`, `ip_address`, `ip_source`, `article_id`, `identity`, `reply_name`) VALUES (23, '回复世纪末的架构师', '世纪末的架构师', 1, '2022-10-21 14:50:03', 1, '127.0.0.1', '本地登录', 1, 0, '世纪末的架构师');
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of files
-- ----------------------------
BEGIN;
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (1, 'm4VH2s1n.jpeg', '世纪末的架构师', 'http://localhost:8090/images/avatar/m4VH2s1n.jpeg', '用户上传图片', '2022-09-16 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (3, 'qm0coWzM.jpg', '世纪末的架构师', 'http://localhost:8090/images/cover/qm0coWzM.jpg', '用户上传图片', '2022-09-16 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (4, 'xGx9zwY8.jpg', '世纪末的架构师', 'http://localhost:8090/images/cover/xGx9zwY8.jpg', '用户上传图片', '2022-09-16 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (22, 'Y1TbZfkL.jpg', '世纪末的架构师', 'http://localhost:8090/images/cover/Y1TbZfkL.jpg', '用户上传图片', '2022-09-22 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (23, 'KU5ZUmz9.jpg', '世纪末的架构师', 'http://localhost:8090/images/cover/KU5ZUmz9.jpg', '用户上传图片', '2022-09-22 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (24, '8zkLNfgw.jpg', '世纪末的架构师', 'http://localhost:8090/images/cover/8zkLNfgw.jpg', '用户上传图片', '2022-09-22 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (26, 'VKXMSCmV.jpg', '世纪末的架构师', 'http://localhost:8090/images/article/VKXMSCmV.jpg', '用户上传图片', '2022-09-23 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (27, 'LlfcijKq.jpeg', '世纪末的架构师', 'http://localhost:8090/images/cover/LlfcijKq.jpeg', '用户上传图片', '2022-09-24 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (28, 'z0qKbnAk.jpg', '世纪末的架构师', 'http://localhost:8090/images/cover/z0qKbnAk.jpg', '用户上传图片', '2022-09-24 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (29, 'FvDOfIrj.jpg', '世纪末的架构师', 'http://localhost:8090/images/cover/FvDOfIrj.jpg', '用户上传图片', '2022-09-24 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (30, 'SbKJJVb8.jpg', '世纪末的架构师', 'http://localhost:8090/images/article/SbKJJVb8.jpg', '用户上传图片', '2022-09-26 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (31, 'WYJ2Mggr.jpg', '世纪末的架构师', 'http://localhost:8090/images/article/WYJ2Mggr.jpg', '用户上传图片', '2022-09-26 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (35, 'P7E1vO0l.jpeg', '世纪末的架构师', 'http://localhost:8090/images/avatar/P7E1vO0l.jpeg', '用户上传图片', '2022-09-26 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (36, 'zxYMikB5.jpg', '世纪末的架构师', 'http://localhost:8090/images/receipt/zxYMikB5.jpg', '用户上传图片', '2022-09-27 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (37, 'yloYMa7v.jpg', '世纪末的架构师', 'http://localhost:8090/images/receipt/yloYMa7v.jpg', '用户上传图片', '2022-09-27 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (44, 'x8uRIbC3.jpg', '世纪末的架构师', 'http://localhost:8090/images/avatar/x8uRIbC3.jpg', '用户上传图片', '2022-09-29 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (45, 'kxCDcvX0.jpg', '世纪末的架构师', 'http://localhost:8090/images/cover/kxCDcvX0.jpg', '用户上传图片', '2022-10-05 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (46, 'v8WtLNhP.jpg', '世纪末的架构师', 'http://localhost:8090/images/cover/v8WtLNhP.jpg', '用户上传图片', '2022-10-06 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (48, 'vSf982o2.jpg', '世纪末的架构师', 'http://localhost:8090/images/cover/vSf982o2.jpg', '用户上传图片', '2022-10-07 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (49, 'sq2LsYnV.jpg', '世纪末的架构师', 'http://localhost:8090/images/cover/sq2LsYnV.jpg', '用户上传图片', '2022-10-10 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (50, 'HgE8jo05.jpg', '世纪末的架构师', 'http://localhost:8090/images/cover/HgE8jo05.jpg', '用户上传图片', '2022-10-11 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (51, 'jKscXTn2.jpeg', '世纪末的架构师', 'http://localhost:8090/images/cover/jKscXTn2.jpeg', '用户上传图片', '2022-10-16 00:00:00');
INSERT INTO `files` (`id`, `file_name`, `user`, `url`, `description`, `upload_time`) VALUES (52, 'NNjKF1ZH.jpeg', '世纪末的架构师', 'http://localhost:8090/images/cover/NNjKF1ZH.jpeg', '用户上传图片', '2022-10-16 00:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of links
-- ----------------------------
BEGIN;
INSERT INTO `links` (`id`, `title`, `website`, `logo`, `description`, `create_time`) VALUES (1, '世纪末的架构师', 'https://www.zrkizzy.com', '\nhttp://localhost:8090/images/avatar/m4VH2s1n.jpeg', '疯狂的热爱夹带着文雅', '2022-09-24 22:09:13');
INSERT INTO `links` (`id`, `title`, `website`, `logo`, `description`, `create_time`) VALUES (4, '风丶宇的个人博客', 'https://www.talkxj.com', 'https://static.talkxj.com/photos/b553f564f81a80dc338695acb1b475d2.jpg', '往事不随风', '2022-09-24 14:56:58');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of message
-- ----------------------------
BEGIN;
INSERT INTO `message` (`id`, `nick_name`, `content`, `message_time`, `ip_source`, `ip_address`, `allow`) VALUES (1, '测试账号', '测试评论', '2022-09-28 11:39:55', '江苏省苏州市 移动', '223.104.148.77', 1);
INSERT INTO `message` (`id`, `nick_name`, `content`, `message_time`, `ip_source`, `ip_address`, `allow`) VALUES (2, '管小肾的伤悲', '鸿鹄之志定可鹏程万里，加油！！', '2022-09-06 10:47:00', '江苏省苏州市 移动', '223.104.148.77', 1);
INSERT INTO `message` (`id`, `nick_name`, `content`, `message_time`, `ip_source`, `ip_address`, `allow`) VALUES (3, '测试账号', '测试评论', '2022-09-28 11:39:55', '江苏省苏州市 移动', '223.104.148.77', 1);
INSERT INTO `message` (`id`, `nick_name`, `content`, `message_time`, `ip_source`, `ip_address`, `allow`) VALUES (7, '超级无敌架构师', '超级无敌架构师到此一游！', '2022-09-29 10:30:27', '', '0:0:0:0:0:0:0:1', 1);
INSERT INTO `message` (`id`, `nick_name`, `content`, `message_time`, `ip_source`, `ip_address`, `allow`) VALUES (8, '超级无敌架构师', '超级无敌架构师到此一游！', '2022-09-29 10:30:07', '', '0:0:0:0:0:0:0:1', 1);
INSERT INTO `message` (`id`, `nick_name`, `content`, `message_time`, `ip_source`, `ip_address`, `allow`) VALUES (9, '超级无敌架构师', '超级无敌架构师再次到此一游！', '2022-09-29 23:31:34', '', '0:0:0:0:0:0:0:1', 0);
INSERT INTO `message` (`id`, `nick_name`, `content`, `message_time`, `ip_source`, `ip_address`, `allow`) VALUES (10, '超级无敌架构师', '超级无敌架构师继续到此一游！', '2022-09-29 23:32:09', '', '0:0:0:0:0:0:0:1', 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (9, '标签模块', '添加新标签', 'POST', 'com.zrkizzy.blog.controller.TagsController.insertTags', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"name\":\"测试标签\"}]', '{\"code\":200,\"message\":\"标签添加成功\"}', 18, '2022-09-14 20:22:35');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (10, '标签模块', '添加新标签', 'POST', 'com.zrkizzy.blog.controller.TagsController.insertTags', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"name\":\"继续测试\"}]', '{\"code\":200,\"message\":\"标签添加成功\"}', 13, '2022-09-14 20:33:41');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (11, '标签模块', '添加新标签', 'POST', 'com.zrkizzy.blog.controller.TagsController.insertTags', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"name\":\"我还测试\"}]', '{\"code\":200,\"message\":\"标签添加成功\"}', 14, '2022-09-15 00:53:21');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (12, '标签模块', '更新标签', 'POST', 'com.zrkizzy.blog.controller.TagsController.updateTags', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"articleNum\":0,\"createTime\":1663158821000,\"id\":2,\"name\":\"继续测试吗？\"}]', '{\"code\":200,\"message\":\"标签更新成功\"}', 16, '2022-09-15 01:05:42');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (13, '标签模块', '更新标签', 'POST', 'com.zrkizzy.blog.controller.TagsController.updateTags', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"articleNum\":0,\"createTime\":1663174401000,\"id\":3,\"name\":\"我还测试呀\"}]', '{\"code\":200,\"message\":\"标签更新成功\"}', 7, '2022-09-15 01:05:51');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (14, '标签模块', '删除标签', 'DELETE', 'com.zrkizzy.blog.controller.TagsController.deleteTags', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[3]', '{\"code\":200,\"message\":\"标签删除成功\"}', 10, '2022-09-15 01:23:18');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (15, '标签模块', '批量删除标签', 'DELETE', 'com.zrkizzy.blog.controller.TagsController.deleteTagsBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[1,2]]', '{\"code\":200,\"message\":\"标签删除成功\"}', 8, '2022-09-15 01:23:25');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (16, '标签模块', '添加新标签', 'POST', 'com.zrkizzy.blog.controller.TagsController.insertTags', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"name\":\"测试\"}]', '{\"code\":200,\"message\":\"标签添加成功\"}', 9, '2022-09-15 01:23:40');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (17, '标签模块', '更新标签', 'POST', 'com.zrkizzy.blog.controller.TagsController.updateTags', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"articleNum\":0,\"createTime\":1663176220000,\"id\":4,\"name\":\"测试标签\"}]', '{\"code\":200,\"message\":\"标签更新成功\"}', 9, '2022-09-15 01:52:06');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (18, '用户模块', '更新用户头像路径', 'POST', 'com.zrkizzy.blog.service.impl.UserServiceImpl.updateAvatarById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"avatar\":\"/images//avatar/Sisgq8Ih.jpg\"}]', 'null', 8, '2022-09-15 22:31:00');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (19, '用户模块', '更新用户头像路径', 'POST', 'com.zrkizzy.blog.service.impl.UserServiceImpl.updateAvatarById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"avatar\":\"/images/avatar/lZrKuRQb.jpeg\"}]', 'null', 12, '2022-09-15 22:33:10');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (20, '用户模块', '更新用户头像路径', 'POST', 'com.zrkizzy.blog.service.impl.UserServiceImpl.updateAvatarById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"avatar\":\"/images/avatar/m4VH2s1n.jpeg\"}]', 'null', 11, '2022-09-16 00:57:35');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (21, '用户模块', '更新用户头像路径', 'POST', 'com.zrkizzy.blog.service.impl.UserServiceImpl.updateAvatarById', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"avatar\":\"/images/avatar/ogClDqhN.jpg\"}]', 'null', 6, '2022-09-16 00:59:07');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (22, '文件管理模块', '用户批量删除文件', 'DELETE', 'com.zrkizzy.blog.service.impl.FilesServiceImpl.deleteFileBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[6]]', '{\"code\":200,\"message\":\"删除成功\"}', 19, '2022-09-20 00:10:41');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (23, '文件管理模块', '用户批量删除文件', 'DELETE', 'com.zrkizzy.blog.service.impl.FilesServiceImpl.deleteFileBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[5]]', '{\"code\":200,\"message\":\"删除成功\"}', 12, '2022-09-20 00:13:29');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (24, '文件管理模块', '用户批量删除文件', 'DELETE', 'com.zrkizzy.blog.service.impl.FilesServiceImpl.deleteFileBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[8,9]]', '{\"code\":200,\"message\":\"删除成功\"}', 24, '2022-09-20 00:26:23');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (25, '文件管理模块', '用户批量删除文件', 'DELETE', 'com.zrkizzy.blog.service.impl.FilesServiceImpl.deleteFileBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[10]]', '{\"code\":200,\"message\":\"删除成功\"}', 18, '2022-09-20 00:26:52');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (26, '文件管理模块', '用户批量删除文件', 'DELETE', 'com.zrkizzy.blog.service.impl.FilesServiceImpl.deleteFileBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[7]]', '{\"code\":200,\"message\":\"删除成功\"}', 17, '2022-09-20 00:26:55');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (27, '文件管理模块', '用户批量删除文件', 'DELETE', 'com.zrkizzy.blog.service.impl.FilesServiceImpl.deleteFileBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[11]]', '{\"code\":200,\"message\":\"删除成功\"}', 18, '2022-09-20 00:40:10');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (28, '文件管理模块', '用户批量删除文件', 'DELETE', 'com.zrkizzy.blog.service.impl.FilesServiceImpl.deleteFileBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[12,13,14]]', '{\"code\":200,\"message\":\"删除成功\"}', 20, '2022-09-20 00:43:14');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (29, '文件管理模块', '用户批量删除文件', 'DELETE', 'com.zrkizzy.blog.service.impl.FilesServiceImpl.deleteFileBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[15,16,17]]', '{\"code\":200,\"message\":\"删除成功\"}', 21, '2022-09-20 00:48:12');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (30, '文件管理模块', '用户批量删除文件', 'DELETE', 'com.zrkizzy.blog.service.impl.FilesServiceImpl.deleteFileBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[18]]', '{\"code\":200,\"message\":\"删除成功\"}', 21, '2022-09-20 00:54:48');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (31, '文章模块', '根据上传图片的访问路径删除对应图片', 'GET', 'com.zrkizzy.blog.controller.UploadController.deleteFileByPath', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[\"/images/article/RAokZ3nI.jpg\"]', '{\"code\":200,\"message\":\"图片删除成功\"}', 21, '2022-09-20 00:57:38');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (32, '文章模块', '新增文章分类', 'POST', 'com.zrkizzy.blog.service.impl.CategoryServiceImpl.insertCategory', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"description\":\"数据结构学习笔记\",\"image\":\"\",\"name\":\"数据结构\"}]', '{\"code\":200,\"message\":\"文章分类创建成功\"}', 9, '2022-09-20 15:17:43');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (33, '文章模块', '更新文章分类', 'PUT', 'com.zrkizzy.blog.service.impl.CategoryServiceImpl.updateCategory', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"articleAmount\":0,\"createTime\":1660780800000,\"description\":\"测试修改文章分类\",\"id\":1,\"image\":\"https://z3.ax1x.com/2021/06/29/RdTyyq.jpg\",\"name\":\"测试分类\",\"updateTime\":1663671604804}]', '{\"code\":200,\"message\":\"文章分类更新成功\"}', 7, '2022-09-20 19:00:05');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (34, '标签模块', '添加新标签', 'POST', 'com.zrkizzy.blog.controller.TagsController.insertTags', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"name\":\"数据结构\"}]', '{\"code\":200,\"message\":\"标签添加成功\"}', 15, '2022-09-20 19:13:19');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (35, '标签模块', '添加新标签', 'POST', 'com.zrkizzy.blog.controller.TagsController.insertTags', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"name\":\"测试\"}]', '{\"code\":200,\"message\":\"标签添加成功\"}', 6, '2022-09-20 19:13:26');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (36, '用户信息模块', '修改用户是否启用', 'PUT', 'com.zrkizzy.blog.service.impl.UserInfoServiceImpl.changeUserEnabled', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2]', '{\"code\":200,\"message\":\"用户状态更新成功\"}', 16, '2022-09-21 11:40:14');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (37, '用户信息模块', '修改用户是否启用', 'PUT', 'com.zrkizzy.blog.service.impl.UserInfoServiceImpl.changeUserEnabled', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2]', '{\"code\":200,\"message\":\"用户状态更新成功\"}', 12, '2022-09-21 11:40:24');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (38, '用户信息模块', '修改用户是否启用', 'PUT', 'com.zrkizzy.blog.service.impl.UserInfoServiceImpl.changeUserEnabled', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2]', '{\"code\":200,\"message\":\"用户状态更新成功\"}', 13, '2022-09-21 11:40:25');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (39, '标签模块', '添加新标签', 'POST', 'com.zrkizzy.blog.controller.TagsController.insertTags', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"name\":\"学习笔记\"}]', '{\"code\":200,\"message\":\"标签添加成功\"}', 23, '2022-09-21 15:03:49');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (40, '文章管理模块', '修改文章评论状态', 'GET', 'com.zrkizzy.blog.controller.ArticleController.updateArticleComment', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2]', '{\"code\":200,\"message\":\"文章评论状态更新成功\"}', 27, '2022-09-21 23:07:38');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (41, '文章管理模块', '修改文章评论状态', 'GET', 'com.zrkizzy.blog.controller.ArticleController.updateArticleComment', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[1]', '{\"code\":200,\"message\":\"文章评论状态更新成功\"}', 23, '2022-09-21 23:07:43');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (42, '文章管理模块', '移动指定文章到回收站', 'GET', 'com.zrkizzy.blog.controller.ArticleController.removeArticle', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[4]', '{\"code\":200,\"message\":\"文章删除成功\"}', 41, '2022-09-22 00:10:58');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (43, '文章管理模块', '移动指定文章到回收站', 'GET', 'com.zrkizzy.blog.controller.ArticleController.removeArticle', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2]', '{\"code\":200,\"message\":\"文章删除成功\"}', 36, '2022-09-22 00:11:23');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (44, '文章管理模块', '移动指定文章到回收站', 'GET', 'com.zrkizzy.blog.controller.ArticleController.removeArticle', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[3]', '{\"code\":200,\"message\":\"文章删除成功\"}', 33, '2022-09-22 00:14:45');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (45, '文章管理模块', '批量移动文章到回收站', 'GET', 'com.zrkizzy.blog.controller.ArticleController.deleteArticleBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[4,5]]', '{\"code\":200,\"message\":\"文章批量删除成功\"}', 21, '2022-09-22 00:45:20');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (46, '文章管理模块', '批量移动文章到回收站', 'GET', 'com.zrkizzy.blog.controller.ArticleController.deleteArticleBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[4,5]]', '{\"code\":200,\"message\":\"文章批量删除成功\"}', 8, '2022-09-22 00:46:26');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (47, '文章管理模块', '批量移动文章到回收站', 'GET', 'com.zrkizzy.blog.controller.ArticleController.deleteArticleBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[4,5]]', '{\"code\":200,\"message\":\"文章批量删除成功\"}', 16, '2022-09-22 00:46:59');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (48, '文章管理模块', '批量移动文章到回收站', 'GET', 'com.zrkizzy.blog.controller.ArticleController.deleteArticleBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[4,5]]', '{\"code\":200,\"message\":\"文章批量删除成功\"}', 18, '2022-09-22 00:47:59');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (49, '文章管理模块', '恢复回收站文章', 'GET', 'com.zrkizzy.blog.controller.ArticleController.recoverArticle', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[5]', '{\"code\":200,\"message\":\"文章恢复成功\"}', 35, '2022-09-22 11:24:12');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (50, '文章管理模块', '恢复回收站文章', 'GET', 'com.zrkizzy.blog.controller.ArticleController.recoverArticle', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[3]', '{\"code\":200,\"message\":\"文章恢复成功\"}', 21, '2022-09-22 11:27:30');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (51, '文章管理模块', '恢复回收站文章', 'GET', 'com.zrkizzy.blog.controller.ArticleController.recoverArticle', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[3]', '{\"code\":200,\"message\":\"文章恢复成功\"}', 30, '2022-09-22 11:37:52');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (52, '文章管理模块', '修改文章评论状态', 'GET', 'com.zrkizzy.blog.controller.ArticleController.updateArticleComment', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[3]', '{\"code\":200,\"message\":\"文章评论状态更新成功\"}', 21, '2022-09-22 11:38:49');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (53, '文章管理模块', '修改文章评论状态', 'GET', 'com.zrkizzy.blog.controller.ArticleController.updateArticleComment', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[3]', '{\"code\":200,\"message\":\"文章评论状态更新成功\"}', 17, '2022-09-22 11:38:52');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (54, '文章管理模块', '移动指定文章到回收站', 'GET', 'com.zrkizzy.blog.controller.ArticleController.removeArticle', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[3]', '{\"code\":200,\"message\":\"文章删除成功\"}', 24, '2022-09-22 11:38:58');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (55, '文章管理模块', '批量移动文章到回收站', 'GET', 'com.zrkizzy.blog.controller.ArticleController.deleteArticleBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[2,4]]', '{\"code\":200,\"message\":\"文章批量删除成功\"}', 7, '2022-09-22 11:42:46');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (56, '文章管理模块', '批量恢复删除的文章', 'GET', 'com.zrkizzy.blog.controller.ArticleController.recoverArticleBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[2,4]]', '{\"code\":200,\"message\":\"文章批量恢复成功\"}', 14, '2022-09-22 11:43:29');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (57, '文章管理模块', '批量移动文章到回收站', 'GET', 'com.zrkizzy.blog.controller.ArticleController.removeArticleBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[5]]', '{\"code\":200,\"message\":\"文章批量删除成功\"}', 18, '2022-09-22 11:47:37');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (58, '文章管理模块', '批量恢复删除的文章', 'GET', 'com.zrkizzy.blog.controller.ArticleController.recoverArticleBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[5]]', '{\"code\":200,\"message\":\"文章批量恢复成功\"}', 20, '2022-09-22 11:47:47');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (59, '文章管理模块', '批量移动文章到回收站', 'GET', 'com.zrkizzy.blog.controller.ArticleController.removeArticleBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[2,4,5]]', '{\"code\":200,\"message\":\"文章批量删除成功\"}', 19, '2022-09-22 11:49:25');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (60, '文章管理模块', '移动指定文章到回收站', 'GET', 'com.zrkizzy.blog.controller.ArticleController.removeArticle', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[3]', '{\"code\":200,\"message\":\"文章删除成功\"}', 20, '2022-09-22 14:25:09');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (61, '文章管理模块', '删除指定文章', 'DELETE', 'com.zrkizzy.blog.service.impl.ArticleServiceImpl.deleteArticle', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[3]', '{\"code\":200,\"message\":\"文章删除成功\"}', 57, '2022-09-22 14:28:41');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (62, '文章管理模块', '删除指定文章', 'DELETE', 'com.zrkizzy.blog.service.impl.ArticleServiceImpl.deleteArticle', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[4]', '{\"code\":200,\"message\":\"文章删除成功\"}', 54, '2022-09-22 14:31:46');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (63, '文章管理模块', '批量恢复删除的文章', 'GET', 'com.zrkizzy.blog.controller.ArticleController.recoverArticleBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[2,5]]', '{\"code\":200,\"message\":\"文章批量恢复成功\"}', 20, '2022-09-22 15:06:36');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (64, '文章管理模块', '批量移动文章到回收站', 'GET', 'com.zrkizzy.blog.controller.ArticleController.removeArticleBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[2,5]]', '{\"code\":200,\"message\":\"文章批量删除成功\"}', 19, '2022-09-22 15:06:46');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (65, '文章管理模块', '批量恢复删除的文章', 'GET', 'com.zrkizzy.blog.controller.ArticleController.recoverArticleBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[2,5]]', '{\"code\":200,\"message\":\"文章批量恢复成功\"}', 21, '2022-09-22 15:07:29');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (66, '文章管理模块', '批量移动文章到回收站', 'GET', 'com.zrkizzy.blog.controller.ArticleController.removeArticleBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[2,5]]', '{\"code\":200,\"message\":\"文章批量删除成功\"}', 13, '2022-09-22 15:07:36');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (67, '文章管理模块', '批量删除回收站中的文章', 'DELETE', 'com.zrkizzy.blog.service.impl.ArticleServiceImpl.deleteArticleBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[2,5]]', '{\"code\":200,\"message\":\"文章删除成功\"}', 71, '2022-09-22 15:10:00');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (68, '文章管理模块', '修改文章评论状态', 'GET', 'com.zrkizzy.blog.controller.ArticleController.updateArticleComment', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[1]', '{\"code\":200,\"message\":\"文章评论状态更新成功\"}', 32, '2022-09-22 15:21:09');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (69, '文章管理模块', '更新文章置顶状态', 'GET', 'com.zrkizzy.blog.controller.ArticleController.updateArticleTop', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[6]', '{\"code\":200,\"message\":\"文章置顶状态更新成功\"}', 21, '2022-09-22 15:21:09');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (70, '文章管理模块', '更新文章置顶状态', 'GET', 'com.zrkizzy.blog.controller.ArticleController.updateArticleTop', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[6]', '{\"code\":200,\"message\":\"文章置顶状态更新成功\"}', 22, '2022-09-22 15:21:13');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (71, '文章管理模块', '更新文章置顶状态', 'GET', 'com.zrkizzy.blog.controller.ArticleController.updateArticleTop', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[6]', '{\"code\":200,\"message\":\"文章置顶状态更新成功\"}', 28, '2022-09-22 15:21:15');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (72, '文章管理模块', '修改文章评论状态', 'GET', 'com.zrkizzy.blog.controller.ArticleController.updateArticleComment', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[6]', '{\"code\":200,\"message\":\"文章评论状态更新成功\"}', 18, '2022-09-22 15:26:15');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (73, '文章管理模块', '移动指定文章到回收站', 'GET', 'com.zrkizzy.blog.controller.ArticleController.removeArticle', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[6]', '{\"code\":200,\"message\":\"文章删除成功\"}', 23, '2022-09-22 15:26:17');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (74, '文章管理模块', '更新文章置顶状态', 'GET', 'com.zrkizzy.blog.controller.ArticleController.updateArticleTop', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[7]', '{\"code\":200,\"message\":\"文章置顶状态更新成功\"}', 12, '2022-09-22 15:39:54');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (75, '文章管理模块', '更新文章置顶状态', 'GET', 'com.zrkizzy.blog.controller.ArticleController.updateArticleTop', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[7]', '{\"code\":200,\"message\":\"文章置顶状态更新成功\"}', 28, '2022-09-22 15:39:56');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (76, '用户信息模块', '修改用户是否启用', 'PUT', 'com.zrkizzy.blog.service.impl.UserInfoServiceImpl.changeUserEnabled', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2]', '{\"code\":200,\"message\":\"用户状态更新成功\"}', 7, '2022-09-22 16:24:40');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (77, '用户信息模块', '修改用户是否启用', 'PUT', 'com.zrkizzy.blog.service.impl.UserInfoServiceImpl.changeUserEnabled', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2]', '{\"code\":200,\"message\":\"用户状态更新成功\"}', 8, '2022-09-22 18:16:53');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (78, '用户信息模块', '修改用户是否启用', 'PUT', 'com.zrkizzy.blog.service.impl.UserInfoServiceImpl.changeUserEnabled', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2]', '{\"code\":200,\"message\":\"用户状态更新成功\"}', 12, '2022-09-22 18:17:16');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (79, '角色模块', '更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.RoleServiceImpl.updateRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":4,\"permission\":[4],\"roleName\":\"ROLE_user\",\"roleNameZh\":\"普通用户\"}]', '{\"code\":200,\"message\":\"角色信息更新成功\"}', 12, '2022-09-22 18:17:51');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (80, '角色模块', '用户更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2,4]', '{\"code\":200,\"message\":\"更新成功\"}', 8, '2022-09-22 18:17:58');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (81, '文章模块', '更新文章分类', 'PUT', 'com.zrkizzy.blog.service.impl.CategoryServiceImpl.updateCategory', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"articleAmount\":0,\"createTime\":1663658263000,\"description\":\"数据结构学习笔记\",\"id\":8,\"image\":\"/images/cover/qm0coWzM.jpg\",\"name\":\"数据结构\",\"updateTime\":1663844288886}]', '{\"code\":200,\"message\":\"文章分类更新成功\"}', 13, '2022-09-22 18:58:09');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (82, '文章模块', '更新文章分类', 'PUT', 'com.zrkizzy.blog.service.impl.CategoryServiceImpl.updateCategory', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"articleAmount\":4,\"createTime\":1660780800000,\"description\":\"测试修改文章分类\",\"id\":1,\"image\":\"https://z3.ax1x.com/2021/06/29/RdTyyq.jpg\",\"name\":\"测试分类\",\"updateTime\":1663844523955}]', '{\"code\":200,\"message\":\"文章分类更新成功\"}', 6, '2022-09-22 19:02:04');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (83, '文章模块', '更新文章分类', 'PUT', 'com.zrkizzy.blog.service.impl.CategoryServiceImpl.updateCategory', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"articleAmount\":0,\"createTime\":1663658263000,\"description\":\"数据结构学习笔记\",\"id\":8,\"image\":\"/images/cover/KU5ZUmz9.jpg\",\"name\":\"数据结构\",\"updateTime\":1663845168862}]', '{\"code\":200,\"message\":\"文章分类更新成功\"}', 5, '2022-09-22 19:12:49');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (84, '文章模块', '更新文章分类', 'PUT', 'com.zrkizzy.blog.service.impl.CategoryServiceImpl.updateCategory', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"articleAmount\":4,\"createTime\":1660780800000,\"description\":\"测试修改文章分类\",\"id\":1,\"image\":\"/images/cover/Y1TbZfkL.jpg\",\"name\":\"测试分类\",\"updateTime\":1663845191050}]', '{\"code\":200,\"message\":\"文章分类更新成功\"}', 9, '2022-09-22 19:13:11');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (85, '文章模块', '更新文章分类', 'PUT', 'com.zrkizzy.blog.service.impl.CategoryServiceImpl.updateCategory', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"articleAmount\":4,\"createTime\":1660780800000,\"description\":\"测试修改文章分类\",\"id\":1,\"image\":\"/images/cover/8zkLNfgw.jpg\",\"name\":\"测试分类\",\"updateTime\":1663845243486}]', '{\"code\":200,\"message\":\"文章分类更新成功\"}', 7, '2022-09-22 19:14:03');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (86, '文件管理模块', '用户批量删除文件', 'DELETE', 'com.zrkizzy.blog.service.impl.FilesServiceImpl.deleteFileBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[25]]', '{\"code\":200,\"message\":\"删除成功\"}', 16, '2022-09-23 09:21:36');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (87, '角色模块', '更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.RoleServiceImpl.updateRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":2,\"permission\":[4,11,12,13,14,28,5,15,16,6,17,18,19,7,20,8,21,27,9,22,23,24,25,10,26],\"roleName\":\"ROLE_test\",\"roleNameZh\":\"测试账号\"}]', '{\"code\":200,\"message\":\"角色信息更新成功\"}', 9, '2022-09-23 10:16:27');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (88, '角色模块', '用户更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2,2]', '{\"code\":200,\"message\":\"更新成功\"}', 7, '2022-09-23 10:18:04');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (89, '文章管理模块', '修改文章评论状态', 'GET', 'com.zrkizzy.blog.controller.ArticleController.updateArticleComment', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[1]', '{\"code\":200,\"message\":\"文章评论状态更新成功\"}', 24, '2022-09-23 16:24:01');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (90, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":1,\"image\":\"/images/cover/KU5ZUmz9.jpg\",\"label\":\"home\",\"title\":\"首页\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 12, '2022-09-24 16:27:39');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (91, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":1,\"image\":\"/images/cover/KU5ZUmz9.jpg\",\"label\":\"home\",\"title\":\"首页\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 25, '2022-09-24 16:27:32');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (92, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":1,\"image\":\"/images/cover/KU5ZUmz9.jpg\",\"label\":\"home\",\"title\":\"首页\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 6, '2022-09-24 16:34:12');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (93, '页面管理模块', '新增页面', 'POST', 'com.zrkizzy.blog.controller.PagesController.addPages', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"image\":\"/images/cover/qm0coWzM.jpg\",\"label\":\"test\",\"title\":\"测试页面\"}]', '{\"code\":200,\"message\":\"页面新建成功\"}', 20, '2022-09-24 16:37:37');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (94, '页面管理模块', '删除页面', 'DELETE', 'com.zrkizzy.blog.controller.PagesController.deletePageById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[9]', '{\"code\":200,\"message\":\"页面删除成功\"}', 19, '2022-09-24 16:46:36');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (95, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":6,\"image\":\"/images/cover/8zkLNfgw.jpg\",\"label\":\"link\",\"path\":\"/links\",\"title\":\"友链\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 25, '2022-09-24 16:54:17');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (96, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":6,\"image\":\"/images/cover/8zkLNfgw.jpg\",\"label\":\"link\",\"path\":\"/link\",\"title\":\"友链\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 15, '2022-09-24 16:54:23');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (97, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":2,\"image\":\"/images/cover/LlfcijKq.jpeg\",\"label\":\"archive\",\"path\":\"/archive\",\"title\":\"归档\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 19, '2022-09-24 17:21:47');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (98, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":3,\"image\":\"/images/article/VKXMSCmV.jpg\",\"label\":\"category\",\"path\":\"/category\",\"title\":\"分类\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 19, '2022-09-24 17:22:05');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (99, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":5,\"image\":\"/images/cover/Y1TbZfkL.jpg\",\"label\":\"photo\",\"path\":\"/photo\",\"title\":\"相册\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 7, '2022-09-24 17:23:09');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (100, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":5,\"image\":\"/images/cover/z0qKbnAk.jpg\",\"label\":\"photo\",\"path\":\"/photo\",\"title\":\"相册\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 20, '2022-09-24 17:23:49');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (101, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":4,\"image\":\"/images/cover/FvDOfIrj.jpg\",\"label\":\"log\",\"path\":\"/log\",\"title\":\"日志\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 19, '2022-09-24 17:25:37');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (102, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":8,\"image\":\"/images/cover/xGx9zwY8.jpg\",\"label\":\"message\",\"path\":\"/message\",\"title\":\"留言\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 14, '2022-09-24 17:25:52');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (103, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":8,\"image\":\"/images/cover/xGx9zwY8.jpg\",\"label\":\"message\",\"path\":\"/message\",\"title\":\"留言\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 6, '2022-09-24 17:25:58');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (104, '友链模块', '添加友链', 'POST', 'com.zrkizzy.blog.controller.LinksController.addLinks', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"createTime\":1664001929839,\"description\":\"包子博客，我用来测试一下\",\"logo\":\"https://tse3-mm.cn.bing.net/th/id/OIP.N9gKzFp25pPG7h7sIVznSwHaHa?pid=ImgDet&rs=1\",\"title\":\"测试网站\",\"website\":\"https://www/zrkizzy.com\"}]', '{\"code\":200,\"message\":\"友链添加成功\"}', 31, '2022-09-24 22:45:30');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (105, '友链模块', '添加友链', 'POST', 'com.zrkizzy.blog.controller.LinksController.addLinks', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"createTime\":1664002013422,\"description\":\"往事不随风\",\"logo\":\"https://static.talkxj.com/photos/b553f564f81a80dc338695acb1b475d2.jpg\",\"title\":\"风丶宇的个人博客\",\"website\":\"https://www.talkxj.com\"}]', '{\"code\":200,\"message\":\"友链添加成功\"}', 24, '2022-09-24 22:46:53');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (106, '友链模块', '更新友链', 'PUT', 'com.zrkizzy.blog.controller.LinksController.updateLinks', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"createTime\":1664028553000,\"description\":\"疯狂的热爱夹带着文雅\",\"id\":1,\"logo\":\"https://www.zrkizzy.com/upload/2021/11/header-90431fbd9cf848e2a5aaea0bf6b1089b.jpg\",\"title\":\"世纪末的架构师\",\"website\":\"https://www.zrkizzy.com\"}]', '{\"code\":200,\"message\":\"友链更新成功\"}', 9, '2022-09-24 22:52:09');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (107, '友链模块', '删除友链', 'DELETE', 'com.zrkizzy.blog.controller.LinksController.deleteLinkById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[3]', '{\"code\":200,\"message\":\"友链删除成功\"}', 17, '2022-09-24 22:56:23');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (108, '友链模块', '添加友链', 'POST', 'com.zrkizzy.blog.controller.LinksController.addLinks', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"createTime\":1664002617738,\"description\":\"往事不随风\",\"logo\":\"https://static.talkxj.com/photos/b553f564f81a80dc338695acb1b475d2.jpg\",\"title\":\"风丶宇的个人博客\",\"website\":\"https://static.talkxj.com\"}]', '{\"code\":200,\"message\":\"友链添加成功\"}', 21, '2022-09-24 22:56:58');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (109, '友链模块', '添加友链', 'POST', 'com.zrkizzy.blog.controller.LinksController.addLinks', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"createTime\":1664002631856,\"description\":\"111\",\"logo\":\"111\",\"title\":\"测试\",\"website\":\"111\"}]', '{\"code\":200,\"message\":\"友链添加成功\"}', 16, '2022-09-24 22:57:12');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (110, '友链模块', '删除友链', 'DELETE', 'com.zrkizzy.blog.controller.LinksController.deleteLinkById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[5]', '{\"code\":200,\"message\":\"友链删除成功\"}', 25, '2022-09-24 23:06:25');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (111, '友链模块', '删除友链', 'DELETE', 'com.zrkizzy.blog.controller.LinksController.deleteLinkById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2]', '{\"code\":200,\"message\":\"友链删除成功\"}', 23, '2022-09-24 23:06:30');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (112, '角色模块', '用户更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2,4]', '{\"code\":200,\"message\":\"更新成功\"}', 16, '2022-09-25 17:48:51');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (113, '角色模块', '用户更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2,4]', '{\"code\":200,\"message\":\"更新成功\"}', 34681, '2022-09-25 17:48:53');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (114, '角色模块', '用户更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2,4]', '{\"code\":200,\"message\":\"更新成功\"}', 41922, '2022-09-25 17:49:03');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (115, '角色模块', '用户更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2,4]', '{\"code\":200,\"message\":\"更新成功\"}', 13, '2022-09-25 23:47:29');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (116, '文章模块', '根据上传图片的访问路径删除对应图片', 'GET', 'com.zrkizzy.blog.controller.UploadController.deleteFileByPath', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[\"1\"]', '{\"code\":500,\"message\":\"图片删除失败\"}', 9, '2022-09-26 10:52:22');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (117, '文件管理模块', '用户批量删除文件', 'DELETE', 'com.zrkizzy.blog.service.impl.FilesServiceImpl.deleteFileBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[33,32]]', '{\"code\":200,\"message\":\"删除成功\"}', 21, '2022-09-26 10:53:23');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (118, '文章模块', '删除文章分类', 'DELETE', 'com.zrkizzy.blog.service.impl.CategoryServiceImpl.deleteCategory', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[1]', '{\"code\":500,\"message\":\"当前分类下还有文章，不能删除\"}', 7, '2022-09-26 14:58:38');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (119, '文章模块', '批量删除文章分类', 'DELETE', 'com.zrkizzy.blog.service.impl.CategoryServiceImpl.deleteCategoryBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[1,8]]', '{\"code\":500,\"message\":\"分类删除失败，测试分类 中还有文章\"}', 6, '2022-09-26 16:35:31');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (120, '文章模块', '批量删除文章分类', 'DELETE', 'com.zrkizzy.blog.service.impl.CategoryServiceImpl.deleteCategoryBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[1,8]]', '{\"code\":500,\"message\":\"分类删除失败，测试分类 中还有文章\"}', 7, '2022-09-26 16:40:56');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (121, '文章模块', '批量删除文章分类', 'DELETE', 'com.zrkizzy.blog.service.impl.CategoryServiceImpl.deleteCategoryBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[1,8]]', '{\"code\":500,\"message\":\"分类删除失败，测试分类 中还有文章\"}', 11, '2022-09-26 16:42:50');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (122, '标签模块', '批量删除标签', 'DELETE', 'com.zrkizzy.blog.controller.TagsController.deleteTagsBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[4,5,6,7]]', '{\"code\":500,\"message\":\"删除失败，测试标签 中还有文章\"}', 12, '2022-09-26 16:43:05');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (123, '标签模块', '删除标签', 'DELETE', 'com.zrkizzy.blog.controller.TagsController.deleteTags', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[6]', '{\"code\":500,\"message\":\"删除失败，当前标签下还有文章\"}', 7, '2022-09-26 16:43:13');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (124, '文件管理模块', '用户批量删除文件', 'DELETE', 'com.zrkizzy.blog.service.impl.FilesServiceImpl.deleteFileBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[34]]', '{\"code\":200,\"message\":\"删除成功\"}', 13, '2022-09-26 20:42:39');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (125, '网站管理模块', '更新网站其他信息', 'PUT', 'com.zrkizzy.blog.controller.WebsiteOtherController.updateOtherInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"alipayReceipt\":\"/images/receipt/yloYMa7v.jpg\",\"avatar\":\"/images/avatar/ogClDqhN.jpg\",\"commentAllow\":true,\"id\":1,\"messageAllow\":true,\"reward\":true,\"wechatReceipt\":\"/images/receipt/zxYMikB5.jpg\"}]', '{\"code\":200,\"message\":\"更新成功\"}', 34, '2022-09-27 00:52:54');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (126, '网站管理模块', '更新网站其他信息', 'PUT', 'com.zrkizzy.blog.controller.WebsiteOtherController.updateOtherInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"alipayReceipt\":\"/images/receipt/yloYMa7v.jpg\",\"avatar\":\"/images/avatar/ogClDqhN.jpg\",\"commentAllow\":false,\"id\":1,\"messageAllow\":false,\"reward\":true,\"wechatReceipt\":\"/images/receipt/zxYMikB5.jpg\"}]', '{\"code\":200,\"message\":\"更新成功\"}', 25, '2022-09-27 01:01:14');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (127, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":2,\"image\":\"/images/article/SbKJJVb8.jpg\",\"label\":\"archive\",\"path\":\"/archive\",\"title\":\"归档\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 25, '2022-09-27 01:13:37');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (128, '文章模块', '新增文章分类', 'POST', 'com.zrkizzy.blog.service.impl.CategoryServiceImpl.insertCategory', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"description\":\"哈哈哈\",\"image\":\"\",\"name\":\"继续测试\"}]', '{\"code\":200,\"message\":\"文章分类创建成功\"}', 26, '2022-09-27 09:52:16');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (129, '文章模块', '更新文章分类', 'PUT', 'com.zrkizzy.blog.service.impl.CategoryServiceImpl.updateCategory', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"articleAmount\":0,\"createTime\":1664243536000,\"description\":\"哈哈哈\",\"id\":9,\"image\":\"/images/cover/z0qKbnAk.jpg\",\"name\":\"继续测试\",\"updateTime\":1664243555448}]', '{\"code\":200,\"message\":\"文章分类更新成功\"}', 16, '2022-09-27 09:52:35');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (130, '文章模块', '更新文章分类', 'PUT', 'com.zrkizzy.blog.service.impl.CategoryServiceImpl.updateCategory', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"articleAmount\":0,\"createTime\":1664243536000,\"description\":\"哈哈哈1\",\"id\":9,\"image\":\"/images/cover/z0qKbnAk.jpg\",\"name\":\"继续测试\",\"updateTime\":1664243600464}]', '{\"code\":200,\"message\":\"文章分类更新成功\"}', 6, '2022-09-27 09:53:20');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (131, '文章模块', '更新文章分类', 'PUT', 'com.zrkizzy.blog.service.impl.CategoryServiceImpl.updateCategory', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"articleAmount\":0,\"createTime\":1664243536000,\"description\":\"哈哈哈测试测试测试测试测试测试测试测试测\",\"id\":9,\"image\":\"/images/cover/z0qKbnAk.jpg\",\"name\":\"继续测试\",\"updateTime\":1664244959925}]', '{\"code\":200,\"message\":\"文章分类更新成功\"}', 14, '2022-09-27 10:16:00');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (134, '角色模块', '用户更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2,2]', '{\"code\":200,\"message\":\"更新成功\"}', 12, '2022-09-27 14:17:22');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (135, '文章模块', '新增文章分类', 'POST', 'com.zrkizzy.blog.service.impl.CategoryServiceImpl.insertCategory', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"description\":\"\",\"image\":\"\",\"name\":\"\"}]', '{\"code\":200,\"message\":\"文章分类创建成功\"}', 27, '2022-09-27 15:59:58');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (136, '文章模块', '删除文章分类', 'DELETE', 'com.zrkizzy.blog.service.impl.CategoryServiceImpl.deleteCategory', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[10]', '{\"code\":200,\"message\":\"文章分类删除成功\"}', 13, '2022-09-27 16:00:03');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (137, '用户信息模块', '更新用户个人信息', 'POST', 'com.zrkizzy.blog.service.impl.UserInfoServiceImpl.updateUserInfo', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"csdn\":\"csdn111\",\"description\":\"这里是测试账号的自我描述\",\"email\":\"test@qq.com\",\"gitee\":\"github.com\",\"github\":\"github.com\",\"id\":2,\"leetcode\":\"leetcode\",\"nickName\":\"测试账号\",\"phone\":\"15234410000\",\"qq\":\"2675525537\",\"username\":\"test\"}]', '{\"code\":200,\"message\":\"信息更新成功\"}', 39, '2022-09-27 16:16:55');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (138, '用户模块', '管理员更新指定用户密码', 'PUT', 'com.zrkizzy.blog.service.impl.UserServiceImpl.updatePasswordById', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,\"123456\"]', '{\"code\":200,\"message\":\"重置成功\"}', 131, '2022-09-27 16:17:09');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (139, '角色模块', '用户更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,4]', '{\"code\":200,\"message\":\"更新成功\"}', 9, '2022-09-27 16:17:17');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (140, '角色模块', '用户更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,2]', '{\"code\":200,\"message\":\"更新成功\"}', 13, '2022-09-27 16:17:23');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (141, '角色模块', '用户更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,4]', '{\"code\":200,\"message\":\"更新成功\"}', 12, '2022-09-27 16:20:29');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (142, '角色模块', '用户更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,4]', '{\"code\":200,\"message\":\"更新成功\"}', 10, '2022-09-27 16:21:24');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (143, '角色模块', '用户更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,2]', '{\"code\":200,\"message\":\"更新成功\"}', 10, '2022-09-27 16:21:42');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (144, '用户模块', '管理员更新指定用户密码', 'PUT', 'com.zrkizzy.blog.service.impl.UserServiceImpl.updatePasswordById', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,\"123456\"]', '{\"code\":200,\"message\":\"重置成功\"}', 92, '2022-09-27 16:22:29');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (145, '角色模块', '用户更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,4]', '{\"code\":200,\"message\":\"更新成功\"}', 10, '2022-09-27 16:22:37');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (146, '用户模块', '管理员更新指定用户密码', 'PUT', 'com.zrkizzy.blog.service.impl.UserServiceImpl.updatePasswordById', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,\"123456\"]', '{\"code\":200,\"message\":\"重置成功\"}', 85, '2022-09-27 16:23:24');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (147, '用户模块', '管理员更新指定用户密码', 'PUT', 'com.zrkizzy.blog.service.impl.UserServiceImpl.updatePasswordById', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,\"1234567\"]', '{\"code\":200,\"message\":\"重置成功\"}', 84, '2022-09-27 16:24:00');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (148, '角色模块', '用户更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2,2]', '{\"code\":200,\"message\":\"更新成功\"}', 12, '2022-09-27 16:26:40');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (149, '用户模块', '管理员更新指定用户密码', 'PUT', 'com.zrkizzy.blog.service.impl.UserServiceImpl.updatePasswordById', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,\"123456\"]', '{\"code\":200,\"message\":\"重置成功\"}', 123, '2022-09-27 16:27:11');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (150, '角色模块', '用户更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,4]', '{\"code\":200,\"message\":\"更新成功\"}', 12, '2022-09-27 16:27:16');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (151, '角色模块', '用户更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,2]', '{\"code\":200,\"message\":\"更新成功\"}', 11, '2022-09-27 16:27:20');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (152, '用户模块', '管理员更新指定用户密码', 'PUT', 'com.zrkizzy.blog.service.impl.UserServiceImpl.updatePasswordById', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,\"123456\"]', '{\"code\":200,\"message\":\"重置成功\"}', 107, '2022-09-27 16:28:21');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (153, '角色模块', '用户更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,4]', '{\"code\":200,\"message\":\"更新成功\"}', 17, '2022-09-27 16:28:25');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (154, '角色模块', '用户更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,2]', '{\"code\":200,\"message\":\"更新成功\"}', 14, '2022-09-27 16:28:29');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (155, '角色模块', '用户更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,2]', '{\"code\":200,\"message\":\"更新成功\"}', 10, '2022-09-27 16:31:07');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (156, '角色模块', '用户更新角色', 'PUT', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,2]', '{\"code\":200,\"message\":\"更新成功\"}', 10, '2022-09-27 16:33:26');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (157, '角色模块', '用户更新角色', 'GET', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,4]', '{\"code\":200,\"message\":\"更新成功\"}', 17, '2022-09-27 16:34:29');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (158, '角色模块', '用户更新角色', 'GET', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,2]', '{\"code\":200,\"message\":\"更新成功\"}', 12, '2022-09-27 16:34:33');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (159, '角色模块', '用户更新角色', 'GET', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,2]', '{\"code\":200,\"message\":\"更新成功\"}', 15, '2022-09-27 16:34:56');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (160, '角色模块', '用户更新角色', 'GET', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,2]', '{\"code\":200,\"message\":\"更新成功\"}', 12, '2022-09-27 16:35:22');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (161, '文件管理模块', '用户批量删除文件', 'DELETE', 'com.zrkizzy.blog.service.impl.FilesServiceImpl.deleteFileBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[39,38]]', '{\"code\":200,\"message\":\"删除成功\"}', 14, '2022-09-27 16:38:38');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (162, '用户模块', '管理员更新指定用户密码', 'PUT', 'com.zrkizzy.blog.service.impl.UserServiceImpl.updatePasswordById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2,\"1234567\"]', '{\"code\":200,\"message\":\"重置成功\"}', 119, '2022-09-27 16:38:49');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (163, '角色模块', '用户更新角色', 'GET', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2,2]', '{\"code\":200,\"message\":\"更新成功\"}', 12, '2022-09-27 16:38:54');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (164, '角色管理模块', '更新角色的资源权限', 'POST', 'com.zrkizzy.blog.controller.ResourceRoleController.updateResourceRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"ids\":[1,14,15,16,17],\"roleId\":2}]', '{\"code\":200,\"message\":\"更新成功\"}', 81, '2022-09-27 20:15:56');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (165, '角色管理模块', '更新角色的资源权限', 'POST', 'com.zrkizzy.blog.controller.ResourceRoleController.updateResourceRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"ids\":[48],\"roleId\":2}]', '{\"code\":200,\"message\":\"更新成功\"}', 45, '2022-09-27 20:19:57');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (166, '角色模块', '用户更新角色', 'GET', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,4]', '{\"code\":200,\"message\":\"更新成功\"}', 14, '2022-09-27 20:22:44');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (167, '角色管理模块', '更新角色的资源权限', 'POST', 'com.zrkizzy.blog.controller.ResourceRoleController.updateResourceRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"ids\":[],\"roleId\":2}]', '{\"code\":200,\"message\":\"更新成功\"}', 25, '2022-09-27 20:23:29');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (168, '角色模块', '用户更新角色', 'GET', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2,2]', '{\"code\":200,\"message\":\"更新成功\"}', 9, '2022-09-27 20:23:55');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (169, '角色管理模块', '更新角色的资源权限', 'POST', 'com.zrkizzy.blog.controller.ResourceRoleController.updateResourceRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"ids\":[14,17],\"roleId\":2}]', '{\"code\":200,\"message\":\"更新成功\"}', 45, '2022-09-27 20:29:38');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (170, '角色管理模块', '更新角色的资源权限', 'POST', 'com.zrkizzy.blog.controller.ResourceRoleController.updateResourceRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"ids\":[14,17],\"roleId\":2}]', '{\"code\":200,\"message\":\"更新成功\"}', 55, '2022-09-27 20:31:32');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (171, '用户模块', '管理员更新指定用户密码', 'PUT', 'com.zrkizzy.blog.service.impl.UserServiceImpl.updatePasswordById', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2,\"1234567\"]', '{\"code\":200,\"message\":\"重置成功\"}', 118, '2022-09-27 20:32:23');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (172, '用户信息模块', '修改用户是否启用', 'PUT', 'com.zrkizzy.blog.service.impl.UserInfoServiceImpl.changeUserEnabled', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2]', '{\"code\":200,\"message\":\"用户状态更新成功\"}', 12, '2022-09-27 20:32:39');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (173, '用户信息模块', '修改用户是否启用', 'PUT', 'com.zrkizzy.blog.service.impl.UserInfoServiceImpl.changeUserEnabled', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[2]', '{\"code\":200,\"message\":\"用户状态更新成功\"}', 15, '2022-09-27 20:32:41');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (174, '角色管理模块', '更新角色的资源权限', 'POST', 'com.zrkizzy.blog.controller.ResourceRoleController.updateResourceRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"ids\":[],\"roleId\":2}]', '{\"code\":200,\"message\":\"更新成功\"}', 18, '2022-09-27 20:33:20');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (175, '用户信息模块', '更新用户个人信息', 'POST', 'com.zrkizzy.blog.service.impl.UserInfoServiceImpl.updateUserInfo', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"csdn\":\"csdn111\",\"description\":\"这里是测试账号的自我描述\",\"email\":\"test@qq.com\",\"gitee\":\"github.com\",\"github\":\"github.com\",\"id\":2,\"leetcode\":\"leetcode\",\"nickName\":\"测试账号\",\"phone\":\"15234410000\",\"qq\":\"2675525537\",\"username\":\"test\"}]', '{\"code\":200,\"message\":\"信息更新成功\"}', 49, '2022-09-27 20:33:51');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (176, '文章模块', '更新文章分类', 'PUT', 'com.zrkizzy.blog.service.impl.CategoryServiceImpl.updateCategory', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"articleAmount\":0,\"createTime\":1664243536000,\"description\":\"哈哈哈\",\"id\":9,\"image\":\"/images/cover/z0qKbnAk.jpg\",\"name\":\"继续测试\",\"updateTime\":1664350336202}]', '{\"code\":200,\"message\":\"文章分类更新成功\"}', 12, '2022-09-28 15:32:16');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (177, '网站管理模块', '更新网站其他信息', 'PUT', 'com.zrkizzy.blog.controller.WebsiteController.updateOtherInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"alipayReceipt\":\"/images/receipt/yloYMa7v.jpg\",\"avatar\":\"/images/avatar/ogClDqhN.jpg\",\"commentAllow\":true,\"id\":1,\"messageAllow\":false,\"reward\":true,\"wechatReceipt\":\"/images/receipt/zxYMikB5.jpg\"}]', '{\"code\":200,\"message\":\"更新成功\"}', 28, '2022-09-29 00:08:38');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (178, '网站管理模块', '更新网站其他信息', 'PUT', 'com.zrkizzy.blog.controller.WebsiteController.updateOtherInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"alipayReceipt\":\"/images/receipt/yloYMa7v.jpg\",\"avatar\":\"/images/avatar/ogClDqhN.jpg\",\"commentAllow\":false,\"id\":1,\"messageAllow\":false,\"reward\":true,\"wechatReceipt\":\"/images/receipt/zxYMikB5.jpg\"}]', '{\"code\":200,\"message\":\"更新成功\"}', 24, '2022-09-29 00:08:41');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (179, '留言模块', '删除指定留言', 'DELETE', 'com.zrkizzy.blog.controller.MessageController.deleteMessageById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[6]', '{\"code\":200,\"message\":\"删除成功\"}', 21, '2022-09-29 00:54:53');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (180, '留言模块', '通过审核留言', 'GET', 'com.zrkizzy.blog.controller.MessageController.passMessageById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2]', '{\"code\":200,\"message\":\"留言审核通过成功\"}', 33, '2022-09-29 00:54:58');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (181, '留言模块', '批量审核通过留言', 'GET', 'com.zrkizzy.blog.controller.MessageController.passMessageBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[2,3,4]]', '{\"code\":200,\"message\":\"留言审核批量通过成功\"}', 49, '2022-09-29 01:02:08');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (182, '留言模块', '批量审核通过留言', 'GET', 'com.zrkizzy.blog.controller.MessageController.passMessageBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[4,5]]', '{\"code\":200,\"message\":\"留言审核批量通过成功\"}', 27, '2022-09-29 01:02:59');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (183, '留言模块', '批量审核通过留言', 'GET', 'com.zrkizzy.blog.controller.MessageController.passMessageBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[4,5]]', '{\"code\":200,\"message\":\"留言审核批量通过成功\"}', 42, '2022-09-29 01:04:27');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (184, '留言模块', '批量审核通过留言', 'GET', 'com.zrkizzy.blog.controller.MessageController.passMessageBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[2,3]]', '{\"code\":200,\"message\":\"留言审核批量通过成功\"}', 37, '2022-09-29 01:05:11');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (185, '留言模块', '批量审核通过留言', 'GET', 'com.zrkizzy.blog.controller.MessageController.passMessageBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[1,2]]', '{\"code\":200,\"message\":\"留言审核批量通过成功\"}', 37, '2022-09-29 01:06:26');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (186, '留言模块', '删除指定留言', 'DELETE', 'com.zrkizzy.blog.controller.MessageController.deleteMessageById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[5]', '{\"code\":200,\"message\":\"删除成功\"}', 23, '2022-09-29 01:06:38');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (187, '留言模块', '批量审核通过留言', 'GET', 'com.zrkizzy.blog.controller.MessageController.passMessageBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[1,4]]', '{\"code\":200,\"message\":\"留言审核批量通过成功\"}', 24, '2022-09-29 01:06:46');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (188, '留言模块', '批量删除留言', 'DELETE', 'com.zrkizzy.blog.controller.MessageController.deleteMessageBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[1,4]]', '{\"code\":200,\"message\":\"批量删除成功\"}', 26, '2022-09-29 01:08:27');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (189, '留言模块', '批量审核通过留言', 'GET', 'com.zrkizzy.blog.controller.MessageController.passMessageBatchIds', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[[3,4]]', '{\"code\":200,\"message\":\"留言审核批量通过成功\"}', 41, '2022-09-29 01:19:31');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (190, '留言模块', '删除指定留言', 'DELETE', 'com.zrkizzy.blog.controller.MessageController.deleteMessageById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[4]', '{\"code\":200,\"message\":\"删除成功\"}', 22, '2022-09-29 01:23:52');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (191, '留言模块', '通过审核留言', 'GET', 'com.zrkizzy.blog.controller.MessageController.passMessageById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2]', '{\"code\":200,\"message\":\"留言审核通过成功\"}', 30, '2022-09-29 01:24:10');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (192, '留言模块', '批量审核通过留言', 'GET', 'com.zrkizzy.blog.controller.MessageController.passMessageBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[1,3]]', '{\"code\":200,\"message\":\"留言审核批量通过成功\"}', 35, '2022-09-29 01:24:16');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (193, '留言模块', '删除指定留言', 'DELETE', 'com.zrkizzy.blog.controller.MessageController.deleteMessageById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[3]', '{\"code\":200,\"message\":\"删除成功\"}', 13, '2022-09-29 01:24:22');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (194, '角色管理模块', '更新角色的资源权限', 'POST', 'com.zrkizzy.blog.controller.ResourceRoleController.updateResourceRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"ids\":[53,54,55,56,57],\"roleId\":2}]', '{\"code\":200,\"message\":\"更新成功\"}', 76, '2022-09-29 01:25:09');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (195, '留言模块', '删除指定留言', 'DELETE', 'com.zrkizzy.blog.controller.MessageController.deleteMessageById', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[6]', '{\"code\":200,\"message\":\"删除成功\"}', 13, '2022-09-29 01:25:50');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (196, '留言模块', '通过审核留言', 'GET', 'com.zrkizzy.blog.controller.MessageController.passMessageById', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[3]', '{\"code\":200,\"message\":\"留言审核通过成功\"}', 16, '2022-09-29 01:25:59');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (197, '留言模块', '批量审核通过留言', 'GET', 'com.zrkizzy.blog.controller.MessageController.passMessageBatchIds', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[[4,5]]', '{\"code\":200,\"message\":\"留言审核批量通过成功\"}', 25, '2022-09-29 01:26:04');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (198, '留言模块', '批量删除留言', 'DELETE', 'com.zrkizzy.blog.controller.MessageController.deleteMessageBatchIds', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[[4,5]]', '{\"code\":200,\"message\":\"批量删除成功\"}', 18, '2022-09-29 01:26:11');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (199, '角色管理模块', '更新角色的资源权限', 'POST', 'com.zrkizzy.blog.controller.ResourceRoleController.updateResourceRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"ids\":[],\"roleId\":2}]', '{\"code\":200,\"message\":\"更新成功\"}', 20, '2022-09-29 01:26:34');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (200, '网站管理模块', '更新网站其他信息', 'PUT', 'com.zrkizzy.blog.controller.WebsiteController.updateOtherInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"alipayReceipt\":\"/images/receipt/yloYMa7v.jpg\",\"avatar\":\"/images/avatar/RVtNwlKZ.jpg\",\"commentAllow\":false,\"id\":1,\"messageAllow\":false,\"reward\":true,\"wechatReceipt\":\"/images/receipt/zxYMikB5.jpg\"}]', '{\"code\":200,\"message\":\"更新成功\"}', 74, '2022-09-29 10:33:55');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (201, '网站管理模块', '更新网站其他信息', 'PUT', 'com.zrkizzy.blog.service.impl.WebsiteServiceImpl.updateOtherInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"alipayReceipt\":\"/images/receipt/yloYMa7v.jpg\",\"avatar\":\"/images/avatar/sXREg4Q5.jpg\",\"commentAllow\":false,\"id\":1,\"messageAllow\":false,\"reward\":true,\"wechatReceipt\":\"/images/receipt/zxYMikB5.jpg\"}]', '{\"code\":200,\"message\":\"更新成功\"}', 118, '2022-09-29 10:50:28');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (202, '文件管理模块', '用户批量删除文件', 'DELETE', 'com.zrkizzy.blog.service.impl.FilesServiceImpl.deleteFileBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[41]]', '{\"code\":200,\"message\":\"删除成功\"}', 16, '2022-09-29 10:51:17');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (203, '网站管理模块', '更新网站其他信息', 'PUT', 'com.zrkizzy.blog.service.impl.WebsiteServiceImpl.updateOtherInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"alipayReceipt\":\"/images/receipt/yloYMa7v.jpg\",\"avatar\":\"/images/avatar/ZKhQl1uf.jpg\",\"commentAllow\":false,\"id\":1,\"messageAllow\":false,\"reward\":true,\"wechatReceipt\":\"/images/receipt/zxYMikB5.jpg\"}]', '{\"code\":200,\"message\":\"更新成功\"}', 23, '2022-09-29 10:51:54');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (204, '文件管理模块', '用户批量删除文件', 'DELETE', 'com.zrkizzy.blog.service.impl.FilesServiceImpl.deleteFileBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[40]]', '{\"code\":200,\"message\":\"删除成功\"}', 14, '2022-09-29 10:52:20');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (205, '文件管理模块', '用户批量删除文件', 'DELETE', 'com.zrkizzy.blog.service.impl.FilesServiceImpl.deleteFileBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[2]]', '{\"code\":200,\"message\":\"删除成功\"}', 19, '2022-09-29 10:53:56');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (206, '文件管理模块', '用户批量删除文件', 'DELETE', 'com.zrkizzy.blog.service.impl.FilesServiceImpl.deleteFileBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[2]]', '{\"code\":500,\"message\":\"删除失败\"}', 11, '2022-09-29 10:54:29');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (207, '网站管理模块', '更新网站其他信息', 'PUT', 'com.zrkizzy.blog.service.impl.WebsiteServiceImpl.updateOtherInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"alipayReceipt\":\"/images/receipt/yloYMa7v.jpg\",\"avatar\":\"/images/avatar/S7yEr9M5.jpg\",\"commentAllow\":false,\"id\":1,\"messageAllow\":false,\"reward\":true,\"wechatReceipt\":\"/images/receipt/zxYMikB5.jpg\"}]', '{\"code\":200,\"message\":\"更新成功\"}', 28, '2022-09-29 11:47:45');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (208, '文件管理模块', '用户批量删除文件', 'DELETE', 'com.zrkizzy.blog.service.impl.FilesServiceImpl.deleteFileBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[43,42]]', '{\"code\":200,\"message\":\"删除成功\"}', 17, '2022-09-29 11:48:39');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (209, '网站管理模块', '更新网站其他信息', 'PUT', 'com.zrkizzy.blog.service.impl.WebsiteServiceImpl.updateOtherInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"alipayReceipt\":\"/images/receipt/yloYMa7v.jpg\",\"avatar\":\"/images/avatar/x8uRIbC3.jpg\",\"commentAllow\":false,\"id\":1,\"messageAllow\":false,\"reward\":true,\"wechatReceipt\":\"/images/receipt/zxYMikB5.jpg\"}]', '{\"code\":200,\"message\":\"更新成功\"}', 11, '2022-09-29 11:48:56');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (210, '评论模块', '删除指定评论', 'DELETE', 'com.zrkizzy.blog.controller.CommentController.deleteCommentById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[5]', '{\"code\":200,\"message\":\"删除成功\"}', 38, '2022-09-29 17:39:14');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (211, '评论模块', '删除指定评论', 'DELETE', 'com.zrkizzy.blog.controller.CommentController.deleteCommentById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[2]', '{\"code\":200,\"message\":\"删除成功\"}', 24, '2022-09-29 17:39:32');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (212, '评论模块', '通过审核评论', 'GET', 'com.zrkizzy.blog.controller.CommentController.passCommentById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[3]', '{\"code\":200,\"message\":\"评论审核通过成功\"}', 30, '2022-09-29 17:41:26');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (213, '评论模块', '批量删除评论', 'DELETE', 'com.zrkizzy.blog.controller.CommentController.deleteCommentBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[4,2,3]]', '{\"code\":200,\"message\":\"批量删除成功\"}', 23, '2022-09-29 17:43:50');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (214, '评论模块', '批量审核通过评论', 'GET', 'com.zrkizzy.blog.controller.CommentController.passCommentBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[6,7]]', '{\"code\":200,\"message\":\"评论审核批量通过成功\"}', 45, '2022-09-29 17:44:05');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (215, '评论模块', '删除指定评论', 'DELETE', 'com.zrkizzy.blog.controller.CommentController.deleteCommentById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[7]', '{\"code\":200,\"message\":\"删除成功\"}', 21, '2022-09-29 20:26:04');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (216, '评论模块', '通过审核评论', 'GET', 'com.zrkizzy.blog.controller.CommentController.passCommentById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[4]', '{\"code\":200,\"message\":\"评论审核通过成功\"}', 27, '2022-09-29 20:27:12');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (217, '评论模块', '通过审核评论', 'GET', 'com.zrkizzy.blog.controller.CommentController.passCommentById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[3]', '{\"code\":200,\"message\":\"评论审核通过成功\"}', 22, '2022-09-29 20:27:17');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (218, '角色管理模块', '更新角色的资源权限', 'POST', 'com.zrkizzy.blog.controller.ResourceRoleController.updateResourceRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"ids\":[58,59,60,61,62],\"roleId\":2}]', '{\"code\":200,\"message\":\"更新成功\"}', 83, '2022-09-29 20:28:41');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (219, '评论模块', '删除指定评论', 'DELETE', 'com.zrkizzy.blog.controller.CommentController.deleteCommentById', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[6]', '{\"code\":200,\"message\":\"删除成功\"}', 27, '2022-09-29 20:29:18');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (220, '评论模块', '通过审核评论', 'GET', 'com.zrkizzy.blog.controller.CommentController.passCommentById', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[5]', '{\"code\":200,\"message\":\"评论审核通过成功\"}', 11, '2022-09-29 20:29:26');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (221, '评论模块', '批量审核通过评论', 'GET', 'com.zrkizzy.blog.controller.CommentController.passCommentBatchIds', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[[3,4]]', '{\"code\":200,\"message\":\"评论审核批量通过成功\"}', 30, '2022-09-29 20:29:30');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (222, '评论模块', '批量删除评论', 'DELETE', 'com.zrkizzy.blog.controller.CommentController.deleteCommentBatchIds', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[[4,5]]', '{\"code\":200,\"message\":\"批量删除成功\"}', 19, '2022-09-29 20:29:37');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (223, '评论模块', '通过审核评论', 'GET', 'com.zrkizzy.blog.controller.CommentController.passCommentById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[8]', '{\"code\":200,\"message\":\"评论审核通过成功\"}', 28, '2022-09-29 23:29:31');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (224, '网站管理模块', '更新网站其他信息', 'PUT', 'com.zrkizzy.blog.service.impl.WebsiteServiceImpl.updateOtherInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"alipayReceipt\":\"/images/receipt/yloYMa7v.jpg\",\"avatar\":\"/images/avatar/x8uRIbC3.jpg\",\"commentAllow\":true,\"id\":1,\"messageAllow\":false,\"reward\":true,\"wechatReceipt\":\"/images/receipt/zxYMikB5.jpg\"}]', '{\"code\":200,\"message\":\"更新成功\"}', 34, '2022-09-29 23:30:27');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (225, '网站管理模块', '更新网站其他信息', 'PUT', 'com.zrkizzy.blog.service.impl.WebsiteServiceImpl.updateOtherInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"alipayReceipt\":\"/images/receipt/yloYMa7v.jpg\",\"avatar\":\"/images/avatar/x8uRIbC3.jpg\",\"commentAllow\":true,\"id\":1,\"messageAllow\":true,\"reward\":true,\"wechatReceipt\":\"/images/receipt/zxYMikB5.jpg\"}]', '{\"code\":200,\"message\":\"更新成功\"}', 15, '2022-09-29 23:31:16');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (226, '网站管理模块', '更新网站其他信息', 'PUT', 'com.zrkizzy.blog.service.impl.WebsiteServiceImpl.updateOtherInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"alipayReceipt\":\"/images/receipt/yloYMa7v.jpg\",\"avatar\":\"/images/avatar/x8uRIbC3.jpg\",\"commentAllow\":false,\"id\":1,\"messageAllow\":false,\"reward\":true,\"wechatReceipt\":\"/images/receipt/zxYMikB5.jpg\"}]', '{\"code\":200,\"message\":\"更新成功\"}', 10, '2022-09-29 23:31:50');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (227, '用户模块', '新增用户', 'POST', 'com.zrkizzy.blog.service.impl.UserServiceImpl.addUser', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"csdn\":\"\",\"description\":\"\",\"email\":\"\",\"gitee\":\"\",\"github\":\"\",\"leetcode\":\"\",\"nickName\":\"111\",\"phone\":\"\",\"qq\":\"\",\"username\":\"111\"}]', '{\"code\":200,\"message\":\"添加用户成功\"}', 106, '2022-09-30 00:23:56');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (228, '用户信息模块', '更新用户个人信息', 'POST', 'com.zrkizzy.blog.service.impl.UserInfoServiceImpl.updateUserInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"csdn\":\"1\",\"description\":\"1\",\"email\":\"111\",\"gitee\":\"111\",\"github\":\"111\",\"id\":5,\"leetcode\":\"1\",\"nickName\":\"111\",\"phone\":\"1\",\"qq\":\"111\",\"username\":\"111\"}]', '{\"code\":200,\"message\":\"信息更新成功\"}', 35, '2022-09-30 00:24:24');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (229, '角色模块', '用户更新角色', 'GET', 'com.zrkizzy.blog.service.impl.UserRoleServiceImpl.updateUserRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[5,4]', '{\"code\":200,\"message\":\"更新成功\"}', 14, '2022-09-30 00:24:28');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (230, '用户模块', '删除用户', 'DELETE', 'com.zrkizzy.blog.service.impl.UserServiceImpl.deleteUserById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[5]', '{\"code\":200,\"message\":\"删除成功\"}', 34, '2022-09-30 00:24:38');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (231, '用户信息模块', '更新用户个人信息', 'POST', 'com.zrkizzy.blog.service.impl.UserInfoServiceImpl.updateUserInfo', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"csdn\":\"csdn111\",\"description\":\"这里是测试账号的自我描述\",\"email\":\"test@qq.com\",\"gitee\":\"github.com\",\"github\":\"github.com\",\"id\":2,\"leetcode\":\"leetcode\",\"nickName\":\"测试账号\",\"phone\":\"15234410000\",\"qq\":\"2675525537\",\"username\":\"test\"}]', '{\"code\":200,\"message\":\"信息更新成功\"}', 26, '2022-09-30 00:28:44');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (232, '用户信息模块', '更新用户个人信息', 'POST', 'com.zrkizzy.blog.service.impl.UserInfoServiceImpl.updateUserInfo', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"csdn\":\"csdn111\",\"description\":\"这里是测试账号的自我描述\",\"email\":\"test@qq.com\",\"gitee\":\"github.com\",\"github\":\"github.com\",\"id\":2,\"leetcode\":\"leetcode\",\"nickName\":\"测试账号\",\"phone\":\"15234410000\",\"qq\":\"2675525537\",\"username\":\"test\"}]', '{\"code\":200,\"message\":\"信息更新成功\"}', 50, '2022-09-30 19:37:41');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (233, '文章模块', '新增文章分类', 'POST', 'com.zrkizzy.blog.service.impl.CategoryServiceImpl.insertCategory', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"description\":\"生活记录文章\",\"image\":\"/images/cover/z0qKbnAk.jpg\",\"name\":\"生活记录\"}]', '{\"code\":200,\"message\":\"文章分类创建成功\"}', 13, '2022-10-03 20:56:23');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (234, '文章模块', '更新文章分类', 'PUT', 'com.zrkizzy.blog.service.impl.CategoryServiceImpl.updateCategory', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"articleAmount\":0,\"createTime\":1664801783000,\"description\":\"生活记录文章\",\"id\":11,\"image\":\"/images/article/SbKJJVb8.jpg\",\"name\":\"生活记录\",\"updateTime\":1664801791778}]', '{\"code\":200,\"message\":\"文章分类更新成功\"}', 16, '2022-10-03 20:56:32');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (235, '标签模块', '添加新标签', 'POST', 'com.zrkizzy.blog.controller.TagsController.insertTags', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"name\":\"生活记录\"}]', '{\"code\":200,\"message\":\"标签添加成功\"}', 24, '2022-10-03 20:56:50');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (236, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":2,\"image\":\"/images/article/SbKJJVb8.jpg\",\"label\":\"archive\",\"path\":\"/archive\",\"title\":\"归档\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 10, '2022-10-05 09:15:25');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (237, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":2,\"image\":\"/images/cover/kxCDcvX0.jpg\",\"label\":\"archive\",\"path\":\"/archive\",\"title\":\"归档\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 21, '2022-10-05 09:15:50');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (238, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":3,\"image\":\"/images/cover/v8WtLNhP.jpg\",\"label\":\"category\",\"path\":\"/category\",\"title\":\"分类\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 25, '2022-10-06 10:44:05');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (239, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":4,\"image\":\"/images/cover/PyQGsDJS.jpg\",\"label\":\"tags\",\"path\":\"/tags\",\"title\":\"日志\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 31, '2022-10-07 00:24:36');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (240, '文件管理模块', '用户批量删除文件', 'DELETE', 'com.zrkizzy.blog.service.impl.FilesServiceImpl.deleteFileBatchIds', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[[47]]', '{\"code\":200,\"message\":\"删除成功\"}', 23, '2022-10-07 00:30:24');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (241, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":4,\"image\":\"/images/cover/vSf982o2.jpg\",\"label\":\"tags\",\"path\":\"/tags\",\"title\":\"标签\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 21, '2022-10-07 00:30:46');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (242, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":6,\"image\":\"/images/cover/sq2LsYnV.jpg\",\"label\":\"link\",\"path\":\"/link\",\"title\":\"友链\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 23, '2022-10-10 14:04:02');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (243, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":6,\"image\":\"/images/cover/HgE8jo05.jpg\",\"label\":\"link\",\"path\":\"/link\",\"title\":\"友链\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 24, '2022-10-11 10:53:08');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (244, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":7,\"image\":\"http://localhost:8090/images/cover/HgE8jo05.jpg\",\"label\":\"about\",\"path\":\"/about\",\"title\":\"关于我\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 26, '2022-10-16 19:02:26');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (245, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":6,\"image\":\"http://localhost:8090/images/cover/jKscXTn2.jpeg\",\"label\":\"links\",\"path\":\"/links\",\"title\":\"友链\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 11, '2022-10-16 19:02:35');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (246, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":8,\"image\":\"http://localhost:8090/images/cover/NNjKF1ZH.jpeg\",\"label\":\"message\",\"path\":\"/message\",\"title\":\"留言\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 15, '2022-10-16 19:03:00');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (247, '友链模块', '更新友链', 'PUT', 'com.zrkizzy.blog.controller.LinksController.updateLinks', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"createTime\":1664028553000,\"description\":\"疯狂的热爱夹带着文雅\",\"id\":1,\"logo\":\"\\nhttp://localhost:8090/images/avatar/m4VH2s1n.jpeg\",\"title\":\"世纪末的架构师\",\"website\":\"https://www.zrkizzy.com\"}]', '{\"code\":200,\"message\":\"友链更新成功\"}', 28, '2022-10-16 19:22:54');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (248, '友链模块', '更新友链', 'PUT', 'com.zrkizzy.blog.controller.LinksController.updateLinks', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"createTime\":1664002618000,\"description\":\"往事不随风\",\"id\":4,\"logo\":\"https://static.talkxj.com/photos/b553f564f81a80dc338695acb1b475d2.jpg\",\"title\":\"风丶宇的个人博客\",\"website\":\"https://www.talkxj.com\"}]', '{\"code\":200,\"message\":\"友链更新成功\"}', 17, '2022-10-16 19:25:13');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (249, '页面管理模块', '更新页面', 'PUT', 'com.zrkizzy.blog.controller.PagesController.updatePageInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"id\":8,\"image\":\"http://localhost:8090/images/cover/qm0coWzM.jpg\",\"label\":\"message\",\"path\":\"/message\",\"title\":\"留言\"}]', '{\"code\":200,\"message\":\"页面信息更新成功\"}', 24, '2022-10-17 16:14:59');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (250, '网站管理模块', '更新网站其他信息', 'PUT', 'com.zrkizzy.blog.service.impl.WebsiteServiceImpl.updateOtherInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"alipayReceipt\":\"http://localhost:8090/images/receipt/yloYMa7v.jpg\",\"avatar\":\"http://localhost:8090/images/avatar/x8uRIbC3.jpg\",\"commentAllow\":false,\"id\":1,\"messageAllow\":false,\"reward\":false,\"wechatReceipt\":\"http://localhost:8090/images/receipt/zxYMikB5.jpg\"}]', '{\"code\":200,\"message\":\"更新成功\"}', 35, '2022-10-17 16:35:27');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (251, '网站管理模块', '更新网站其他信息', 'PUT', 'com.zrkizzy.blog.service.impl.WebsiteServiceImpl.updateOtherInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"alipayReceipt\":\"http://localhost:8090/images/receipt/yloYMa7v.jpg\",\"avatar\":\"http://localhost:8090/images/avatar/x8uRIbC3.jpg\",\"commentAllow\":false,\"id\":1,\"messageAllow\":false,\"reward\":true,\"wechatReceipt\":\"http://localhost:8090/images/receipt/zxYMikB5.jpg\"}]', '{\"code\":200,\"message\":\"更新成功\"}', 19, '2022-10-17 16:35:41');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (252, '网站管理模块', '更新网站其他信息', 'PUT', 'com.zrkizzy.blog.service.impl.WebsiteServiceImpl.updateOtherInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"alipayReceipt\":\"http://localhost:8090/images/receipt/yloYMa7v.jpg\",\"avatar\":\"http://localhost:8090/images/avatar/x8uRIbC3.jpg\",\"commentAllow\":false,\"id\":1,\"messageAllow\":false,\"reward\":false,\"wechatReceipt\":\"http://localhost:8090/images/receipt/zxYMikB5.jpg\"}]', '{\"code\":200,\"message\":\"更新成功\"}', 23, '2022-10-17 16:51:37');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (253, '网站管理模块', '更新网站其他信息', 'PUT', 'com.zrkizzy.blog.service.impl.WebsiteServiceImpl.updateOtherInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"alipayReceipt\":\"http://localhost:8090/images/receipt/yloYMa7v.jpg\",\"avatar\":\"http://localhost:8090/images/avatar/x8uRIbC3.jpg\",\"commentAllow\":false,\"id\":1,\"messageAllow\":false,\"reward\":true,\"wechatReceipt\":\"http://localhost:8090/images/receipt/zxYMikB5.jpg\"}]', '{\"code\":200,\"message\":\"更新成功\"}', 15, '2022-10-17 16:52:44');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (254, '网站管理模块', '更新网站其他信息', 'PUT', 'com.zrkizzy.blog.service.impl.WebsiteServiceImpl.updateOtherInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"alipayReceipt\":\"http://localhost:8090/images/receipt/yloYMa7v.jpg\",\"avatar\":\"http://localhost:8090/images/avatar/x8uRIbC3.jpg\",\"commentAllow\":false,\"id\":1,\"messageAllow\":false,\"reward\":false,\"wechatReceipt\":\"http://localhost:8090/images/receipt/zxYMikB5.jpg\"}]', '{\"code\":200,\"message\":\"更新成功\"}', 10, '2022-10-17 16:52:57');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (255, '网站管理模块', '更新网站其他信息', 'PUT', 'com.zrkizzy.blog.service.impl.WebsiteServiceImpl.updateOtherInfo', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"alipayReceipt\":\"http://localhost:8090/images/receipt/yloYMa7v.jpg\",\"avatar\":\"http://localhost:8090/images/avatar/x8uRIbC3.jpg\",\"commentAllow\":false,\"id\":1,\"messageAllow\":false,\"reward\":true,\"wechatReceipt\":\"http://localhost:8090/images/receipt/zxYMikB5.jpg\"}]', '{\"code\":200,\"message\":\"更新成功\"}', 11, '2022-10-17 16:53:49');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (256, '角色管理模块', '更新角色资源权限', 'POST', 'com.zrkizzy.blog.controller.ResourceRoleController.updateResourceRole', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"ids\":[63],\"roleId\":2}]', '{\"code\":200,\"message\":\"更新成功\"}', 39, '2022-10-20 16:49:06');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (257, '评论模块', '删除指定评论', 'DELETE', 'com.zrkizzy.blog.controller.CommentController.deleteCommentById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[19]', '{\"code\":200,\"message\":\"删除成功\"}', 31, '2022-10-20 16:54:04');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (258, '评论模块', '删除指定评论', 'DELETE', 'com.zrkizzy.blog.controller.CommentController.deleteCommentById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[21]', '{\"code\":200,\"message\":\"删除成功\"}', 38, '2022-10-21 14:52:30');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (259, '评论模块', '删除指定评论', 'DELETE', 'com.zrkizzy.blog.controller.CommentController.deleteCommentById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[19]', '{\"code\":200,\"message\":\"删除成功\"}', 25, '2022-10-21 14:53:28');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (260, '评论模块', '通过审核评论', 'GET', 'com.zrkizzy.blog.controller.CommentController.passCommentById', '世纪末的架构师', '127.0.0.1', '本地登录', 1, '响应成功', '[10]', '{\"code\":200,\"message\":\"评论审核通过成功\"}', 48, '2022-10-21 14:54:02');
INSERT INTO `operate_log` (`id`, `module`, `description`, `request_method`, `operate_method`, `user`, `operate_ip`, `operate_source`, `status`, `status_description`, `request_param`, `return_param`, `duration`, `operate_time`) VALUES (261, '用户信息模块', '更新用户个人信息', 'POST', 'com.zrkizzy.blog.service.impl.UserInfoServiceImpl.updateUserInfo', '测试账号', '127.0.0.1', '本地登录', 1, '响应成功', '[{\"csdn\":\"csdn111\",\"description\":\"这里是测试账号的自我描述\",\"email\":\"test@qq.com\",\"gitee\":\"github.com\",\"github\":\"github.com\",\"id\":2,\"leetcode\":\"leetcode\",\"nickName\":\"测试账号\",\"phone\":\"15234410000\",\"qq\":\"2675525537\",\"username\":\"test\"}]', '{\"code\":200,\"message\":\"信息更新成功\"}', 46, '2022-10-21 15:03:36');
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
INSERT INTO `pages` (`id`, `title`, `label`, `image`, `path`) VALUES (1, '首页', 'home', 'http://localhost:8090/images/cover/KU5ZUmz9.jpg', '/');
INSERT INTO `pages` (`id`, `title`, `label`, `image`, `path`) VALUES (2, '归档', 'archive', 'http://localhost:8090/images/cover/kxCDcvX0.jpg', '/archive');
INSERT INTO `pages` (`id`, `title`, `label`, `image`, `path`) VALUES (3, '分类', 'category', 'http://localhost:8090/images/cover/v8WtLNhP.jpg', '/category');
INSERT INTO `pages` (`id`, `title`, `label`, `image`, `path`) VALUES (4, '标签', 'tags', 'http://localhost:8090/images/cover/vSf982o2.jpg', '/tags');
INSERT INTO `pages` (`id`, `title`, `label`, `image`, `path`) VALUES (5, '相册', 'photo', 'http://localhost:8090/images/cover/z0qKbnAk.jpg', '/photo');
INSERT INTO `pages` (`id`, `title`, `label`, `image`, `path`) VALUES (6, '友链', 'links', 'http://localhost:8090/images/cover/jKscXTn2.jpeg', '/links');
INSERT INTO `pages` (`id`, `title`, `label`, `image`, `path`) VALUES (7, '关于我', 'about', 'http://localhost:8090/images/cover/HgE8jo05.jpg', '/about');
INSERT INTO `pages` (`id`, `title`, `label`, `image`, `path`) VALUES (8, '留言', 'message', 'http://localhost:8090/images/cover/qm0coWzM.jpg', '/message');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tags
-- ----------------------------
BEGIN;
INSERT INTO `tags` (`id`, `name`, `create_time`, `article_num`) VALUES (4, '测试标签', '2022-09-15 01:23:40', 4);
INSERT INTO `tags` (`id`, `name`, `create_time`, `article_num`) VALUES (5, '数据结构', '2022-09-20 19:13:19', 1);
INSERT INTO `tags` (`id`, `name`, `create_time`, `article_num`) VALUES (6, '测试', '2022-09-20 19:13:26', 4);
INSERT INTO `tags` (`id`, `name`, `create_time`, `article_num`) VALUES (7, '学习笔记', '2022-09-21 15:03:49', 3);
INSERT INTO `tags` (`id`, `name`, `create_time`, `article_num`) VALUES (8, '生活记录', '2022-10-03 20:56:50', 1);
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
INSERT INTO `user` (`id`, `nick_name`, `username`, `password`, `avatar`, `ip_address`, `ip_source`, `last_login_time`, `enabled`, `create_time`, `update_time`) VALUES (1, '世纪末的架构师', 'admin', '$2a$10$Tt3NW32EBpMk9ClWUCAkOu6FIRXyhfze7xJ0bQGx8sdVgV4IqYzqO', 'http://localhost:8090/images/avatar/m4VH2s1n.jpeg', '0:0:0:0:0:0:0:1', '', '2022-10-21 16:01:14', 1, '2022-08-06 23:40:44', '2022-09-16 00:57:35');
INSERT INTO `user` (`id`, `nick_name`, `username`, `password`, `avatar`, `ip_address`, `ip_source`, `last_login_time`, `enabled`, `create_time`, `update_time`) VALUES (2, '测试账号', 'test', '$2a$10$d4AA4SDGcvCKMnPdoi2IyuNLxqwPINZwViN3pekUGUYXkqQozX.4y', 'http://localhost:8090/images/avatar/x8uRIbC3.jpg', '127.0.0.1', '本机登录', '2022-10-21 15:03:27', 1, '2022-08-13 18:23:02', '2022-10-21 15:03:36');
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
INSERT INTO `website` (`id`, `logo`, `name`, `author`, `introduction`, `create_date`, `publish`, `motto`, `record`) VALUES (1, 'http://localhost:8090/images/avatar/m4VH2s1n.jpeg', '世纪末的架构师', '世纪末的架构师', '疯狂的热爱夹带着文雅', '2021-08-06 17:02:42', '欢迎大家访问我的个人博客，项目源码在左边Git hub和Gitee，交流群号：782739347，欢迎大家加入', '困难只能吓倒懦夫、懒汉，而胜利永远属于攀登高峰的人。人生的奋斗目标不要太大，认准了一件事情，投入兴趣与热情坚持去做，你就会成功。人生，要的就是惊涛骇浪，这波涛中的每一朵浪花都是伟大的，最后汇成闪着金光的海洋。', '晋ICP备2021018904号');
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
INSERT INTO `website_other` (`id`, `avatar`, `comment_allow`, `message_allow`, `reward`, `wechat_receipt`, `alipay_receipt`) VALUES (1, 'http://localhost:8090/images/avatar/x8uRIbC3.jpg', 0, 0, 1, 'http://localhost:8090/images/receipt/zxYMikB5.jpg', 'http://localhost:8090/images/receipt/yloYMa7v.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of week_view
-- ----------------------------
BEGIN;
INSERT INTO `week_view` (`id`, `view_count`, `create_time`) VALUES (1, 60, '2022-09-27');
INSERT INTO `week_view` (`id`, `view_count`, `create_time`) VALUES (2, 62, '2022-09-28');
INSERT INTO `week_view` (`id`, `view_count`, `create_time`) VALUES (3, 29, '2022-09-29');
INSERT INTO `week_view` (`id`, `view_count`, `create_time`) VALUES (4, 48, '2022-09-30');
INSERT INTO `week_view` (`id`, `view_count`, `create_time`) VALUES (5, 15, '2022-10-01');
INSERT INTO `week_view` (`id`, `view_count`, `create_time`) VALUES (6, 25, '2022-10-02');
INSERT INTO `week_view` (`id`, `view_count`, `create_time`) VALUES (7, 40, '2022-10-03');
INSERT INTO `week_view` (`id`, `view_count`, `create_time`) VALUES (8, 0, '2022-10-07');
INSERT INTO `week_view` (`id`, `view_count`, `create_time`) VALUES (9, 0, '2022-10-13');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
