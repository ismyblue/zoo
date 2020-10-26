/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : zooapi

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 28/09/2020 20:41:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$216000$6Ok6woUB4Cmg$bt50HdxrEeWvRosvWAjn1EAltWP2kVhKJKCbcYiZkQM=', '2020-09-25 03:54:47.930885', 1, 'admin', '', '', 'ismyblue@163.com', 1, 1, '2020-09-24 08:57:25.277830');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `content_html` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `content_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  `creator_id` int NOT NULL,
  `folder_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cms_article_creator_id_b9922410_fk_ums_user_id`(`creator_id`) USING BTREE,
  INDEX `cms_article_folder_id_a8dc8a95_fk_cms_folder_id`(`folder_id`) USING BTREE,
  CONSTRAINT `cms_article_creator_id_b9922410_fk_ums_user_id` FOREIGN KEY (`creator_id`) REFERENCES `ums_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cms_article_folder_id_a8dc8a95_fk_cms_folder_id` FOREIGN KEY (`folder_id`) REFERENCES `cms_folder` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES (1, 'Django框架从入门到放弃', '认真看帮助文档+实践+项目就可以了', '认真看帮助文档+实践+项目就可以了', '认真看帮助文档+实践+项目就可以了', '2020-09-18 16:44:21.026941', '2020-09-27 03:04:51.698451', 1, 1);
INSERT INTO `cms_article` VALUES (2, '21天学会Flask框架', '一直看书，看视频，看文档，一边看一边写代码，一边写个小程序。就完事了_text。', '一直看书，看视频，看文档，一边看一边写代码，一边写个小程序。就完事了_html。', '一直看书，看视频，看文档，一边看一边写代码，一边写个小程序。就完事了_json。', '2020-09-24 13:31:18.172205', '2020-09-24 13:31:18.172205', 1, 3);

-- ----------------------------
-- Table structure for cms_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE `cms_comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment_text` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  `article_id` int NOT NULL,
  `creator_id` int NOT NULL,
  `parent_comment_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cms_comment_article_id_6455a7d6_fk_cms_article_id`(`article_id`) USING BTREE,
  INDEX `cms_comment_creator_id_275f6275_fk_ums_user_id`(`creator_id`) USING BTREE,
  INDEX `cms_comment_parent_comment_id_3307a682_fk_cms_comment_id`(`parent_comment_id`) USING BTREE,
  CONSTRAINT `cms_comment_article_id_6455a7d6_fk_cms_article_id` FOREIGN KEY (`article_id`) REFERENCES `cms_article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cms_comment_creator_id_275f6275_fk_ums_user_id` FOREIGN KEY (`creator_id`) REFERENCES `ums_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cms_comment_parent_comment_id_3307a682_fk_cms_comment_id` FOREIGN KEY (`parent_comment_id`) REFERENCES `cms_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_comment
-- ----------------------------
INSERT INTO `cms_comment` VALUES (1, '极力推荐，文章精品！', '2020-09-18 17:06:55.903610', '2020-09-18 17:06:55.903610', 1, 2, NULL);
INSERT INTO `cms_comment` VALUES (2, '谢谢夸奖！', '2020-09-25 01:52:41.875186', '2020-09-25 01:52:41.875186', 1, 1, 1);
INSERT INTO `cms_comment` VALUES (3, '有点简略，不过还可以！', '2020-09-25 01:54:19.714361', '2020-09-25 01:54:19.714361', 1, 1, NULL);

-- ----------------------------
-- Table structure for cms_folder
-- ----------------------------
DROP TABLE IF EXISTS `cms_folder`;
CREATE TABLE `cms_folder`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `folder_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  `creator_id` int NOT NULL,
  `parent_folder_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cms_folder_creator_id_c989e96d_fk_ums_user_id`(`creator_id`) USING BTREE,
  INDEX `cms_folder_parent_folder_id_acf9c72b_fk_cms_folder_id`(`parent_folder_id`) USING BTREE,
  CONSTRAINT `cms_folder_creator_id_c989e96d_fk_ums_user_id` FOREIGN KEY (`creator_id`) REFERENCES `ums_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cms_folder_parent_folder_id_acf9c72b_fk_cms_folder_id` FOREIGN KEY (`parent_folder_id`) REFERENCES `cms_folder` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_folder
-- ----------------------------
INSERT INTO `cms_folder` VALUES (1, 'Python', '2020-09-18 16:33:19.436480', '2020-09-18 16:14:47.811830', 1, NULL);
INSERT INTO `cms_folder` VALUES (2, 'web笔记', '2020-09-18 16:26:00.170172', '2020-09-18 16:26:00.170172', 1, 1);
INSERT INTO `cms_folder` VALUES (3, 'django笔记', '2020-09-18 16:26:17.717467', '2020-09-18 16:26:17.717467', 1, 2);
INSERT INTO `cms_folder` VALUES (4, '自动化测试', '2020-09-24 12:33:26.178558', '2020-09-24 12:33:26.178558', 1, 1);
INSERT INTO `cms_folder` VALUES (5, 'C/C++', '2020-09-24 12:47:47.196839', '2020-09-24 12:47:47.196839', 1, NULL);

-- ----------------------------
-- Table structure for cms_label
-- ----------------------------
DROP TABLE IF EXISTS `cms_label`;
CREATE TABLE `cms_label`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `label_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  `creator_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cms_label_creator_id_33ed7674_fk_ums_user_id`(`creator_id`) USING BTREE,
  CONSTRAINT `cms_label_creator_id_33ed7674_fk_ums_user_id` FOREIGN KEY (`creator_id`) REFERENCES `ums_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_label
-- ----------------------------
INSERT INTO `cms_label` VALUES (1, 'web', 'web技术相关', '2020-09-18 16:39:22.630727', '2020-09-18 16:39:22.630727', 1);

-- ----------------------------
-- Table structure for cms_like
-- ----------------------------
DROP TABLE IF EXISTS `cms_like`;
CREATE TABLE `cms_like`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `operate_type` tinyint(1) NOT NULL,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  `article_id` int NOT NULL,
  `operator_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cms_like_article_id_9783840f_fk_cms_article_id`(`article_id`) USING BTREE,
  INDEX `cms_like_operator_id_5c9419d4_fk_ums_user_id`(`operator_id`) USING BTREE,
  CONSTRAINT `cms_like_article_id_9783840f_fk_cms_article_id` FOREIGN KEY (`article_id`) REFERENCES `cms_article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cms_like_operator_id_5c9419d4_fk_ums_user_id` FOREIGN KEY (`operator_id`) REFERENCES `ums_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_like
-- ----------------------------
INSERT INTO `cms_like` VALUES (2, 1, '2020-09-18 17:03:41.191241', '2020-09-18 17:03:41.191241', 1, 2);

-- ----------------------------
-- Table structure for cms_mid_article_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_mid_article_article`;
CREATE TABLE `cms_mid_article_article`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  `article_id` int NOT NULL,
  `label_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cms_mid_article_article_article_id_8ab9e707_fk_cms_article_id`(`article_id`) USING BTREE,
  INDEX `cms_mid_article_article_label_id_e151726b_fk_cms_label_id`(`label_id`) USING BTREE,
  CONSTRAINT `cms_mid_article_article_article_id_8ab9e707_fk_cms_article_id` FOREIGN KEY (`article_id`) REFERENCES `cms_article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cms_mid_article_article_label_id_e151726b_fk_cms_label_id` FOREIGN KEY (`label_id`) REFERENCES `cms_label` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_mid_article_article
-- ----------------------------
INSERT INTO `cms_mid_article_article` VALUES (1, '2020-09-18 16:57:04.319365', '2020-09-18 16:57:04.319365', 1, 1);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2020-09-24 12:33:26.182557', '4', '大脑袋标兵: Python->自动化测试', 1, '[{\"added\": {}}]', 2, 1);
INSERT INTO `django_admin_log` VALUES (2, '2020-09-25 03:39:34.555127', '3', 'uuid-6b18b18d558dad32e8e2e9a00a384176-huanghao-黄老鼠', 2, '[{\"changed\": {\"fields\": [\"Uuid\", \"Nickname\", \"RealName\", \"Email\", \"Tel\", \"Socre\", \"Birth\", \"AreaCode\", \"Address\", \"PersonalInfo\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (3, '2020-09-25 03:55:02.912077', '1', '大脑袋剑客: Django框架21天从入门到精通', 2, '[{\"changed\": {\"fields\": [\"Folder id\"]}}]', 5, 1);
INSERT INTO `django_admin_log` VALUES (4, '2020-09-25 03:58:31.203933', '1', '大脑袋剑客: Django框架从入门到放弃', 2, '[{\"changed\": {\"fields\": [\"Folder id\"]}}]', 5, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (5, 'zooapi', 'article');
INSERT INTO `django_content_type` VALUES (3, 'zooapi', 'comment');
INSERT INTO `django_content_type` VALUES (2, 'zooapi', 'folder');
INSERT INTO `django_content_type` VALUES (1, 'zooapi', 'subscribe');
INSERT INTO `django_content_type` VALUES (4, 'zooapi', 'user');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-09-24 08:54:56.644969');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2020-09-24 08:54:56.847842');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2020-09-24 08:54:57.483477');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2020-09-24 08:54:57.635407');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2020-09-24 08:54:57.649384');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2020-09-24 08:54:57.786304');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2020-09-24 08:54:57.879252');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2020-09-24 08:54:57.928222');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2020-09-24 08:54:57.940216');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2020-09-24 08:54:58.107119');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2020-09-24 08:54:58.116115');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2020-09-24 08:54:58.134108');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2020-09-24 08:54:58.224053');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2020-09-24 08:54:58.302009');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2020-09-24 08:54:58.334989');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2020-09-24 08:54:58.353978');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2020-09-24 08:54:58.482904');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2020-09-24 08:54:58.536873');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for rms_image
-- ----------------------------
DROP TABLE IF EXISTS `rms_image`;
CREATE TABLE `rms_image`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `image_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  `creator_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rms_image_creator_id_1e323bcf_fk_ums_user_id`(`creator_id`) USING BTREE,
  CONSTRAINT `rms_image_creator_id_1e323bcf_fk_ums_user_id` FOREIGN KEY (`creator_id`) REFERENCES `ums_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rms_image
-- ----------------------------
INSERT INTO `rms_image` VALUES (2, '020d60a751ffd92f655f356d8f2b6cc6', '/web/user_images/ismyblue/64472db33078eb62718b88a0a99fa669.png', '2020-09-27 03:51:11.538718', '2020-09-27 03:51:11.538718', 1);
INSERT INTO `rms_image` VALUES (3, '4cddcd8a497607382ceb81728369d166', '/web/user_images/ismyblue/13cd05a79f1f5f91b9d5f9a2057a2914.png', '2020-09-27 03:51:18.641694', '2020-09-27 03:51:18.641694', 1);
INSERT INTO `rms_image` VALUES (4, 'b1c6213e35aa6861cfddc6a4a619f098', '/web/user_images/ismyblue/e354190aa172b042969cc9a037d8e447.png', '2020-09-27 04:41:42.758017', '2020-09-27 04:41:42.758017', 1);
INSERT INTO `rms_image` VALUES (5, '汤姆猫', '/web/user_images/ismyblue/6cf7fbe2ce2ab338381aa805ffd25a85.png', '2020-09-27 04:46:14.796972', '2020-09-27 04:46:14.796972', 1);
INSERT INTO `rms_image` VALUES (6, '杰瑞鼠', '/web/user_images/ismyblue/968cb975268e1f1e9333239b2bc9f247.png', '2020-09-27 10:44:43.799426', '2020-09-27 10:44:43.799426', 1);

-- ----------------------------
-- Table structure for ums_admin
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin`;
CREATE TABLE `ums_admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `degree` smallint NOT NULL,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admin
-- ----------------------------

-- ----------------------------
-- Table structure for ums_area
-- ----------------------------
DROP TABLE IF EXISTS `ums_area`;
CREATE TABLE `ums_area`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `area_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_area
-- ----------------------------
INSERT INTO `ums_area` VALUES (1, '湖南省', '长沙市', '岳麓区', '430104');
INSERT INTO `ums_area` VALUES (2, '湖南省', '长沙市', '雨花区', '430111');

-- ----------------------------
-- Table structure for ums_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `ums_subscribe`;
CREATE TABLE `ums_subscribe`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  `subscribe_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ums_subscribe_subscribe_id_ca5011c8_fk_ums_user_id`(`subscribe_id`) USING BTREE,
  INDEX `ums_subscribe_user_id_a63d75de_fk_ums_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `ums_subscribe_subscribe_id_ca5011c8_fk_ums_user_id` FOREIGN KEY (`subscribe_id`) REFERENCES `ums_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ums_subscribe_user_id_a63d75de_fk_ums_user_id` FOREIGN KEY (`user_id`) REFERENCES `ums_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_subscribe
-- ----------------------------
INSERT INTO `ums_subscribe` VALUES (1, '2020-09-18 17:02:35.177988', '2020-09-18 17:02:35.177988', 2, 1);

-- ----------------------------
-- Table structure for ums_user
-- ----------------------------
DROP TABLE IF EXISTS `ums_user`;
CREATE TABLE `ums_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `realName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gender` tinyint(1) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tel` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `logo_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `socre` int NULL DEFAULT NULL,
  `enable` tinyint(1) NOT NULL,
  `birth` date NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `personalInfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  `areaCode_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ums_user_areaCode_id_8be9eab7_fk_ums_area_id`(`areaCode_id`) USING BTREE,
  CONSTRAINT `ums_user_areaCode_id_8be9eab7_fk_ums_area_id` FOREIGN KEY (`areaCode_id`) REFERENCES `ums_area` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_user
-- ----------------------------
INSERT INTO `ums_user` VALUES (1, 'uuid_ismyblue', 'ismyblue', '53215fddbd29b95e3354712364b1f6c8', '大脑袋剑客', '黄先生', 1, 'ismyblue@ismyblue.com', '13975555555', 'None', 1000, 1, '1997-01-01', '中南林业科技大学南2-415', 'smart boy', '2020-09-18 16:03:39.390707', '2020-09-25 03:32:50.679770', 1);
INSERT INTO `ums_user` VALUES (2, 'uuid_hextech', 'hextech', 'c29bcbecf429b1af6d0519767294fc34', '海克斯科技', '贺女士', 0, 'hextech@hextech.com', '18397777777', NULL, 250, 1, '1996-01-01', '大马路边上', 'stupid boy', '2020-09-18 17:02:16.124241', '2020-09-18 17:10:29.923325', 2);
INSERT INTO `ums_user` VALUES (3, 'uuid-6b18b18d558dad32e8e2e9a00a384176', 'huanghao', '9003d1df22eb4d3820015070385194c8', '黄老鼠', '黄浩', 1, '1141345@qq.com', '13978788787', NULL, 250, 1, '2020-09-25', '麓谷企业广场', '不费力气，一无所有', '2020-09-24 11:38:48.119592', '2020-09-25 03:39:34.549130', 1);

SET FOREIGN_KEY_CHECKS = 1;
