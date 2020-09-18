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

 Date: 19/09/2020 01:26:35
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
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add admin', 1, 'add_admin');
INSERT INTO `auth_permission` VALUES (2, 'Can change admin', 1, 'change_admin');
INSERT INTO `auth_permission` VALUES (3, 'Can delete admin', 1, 'delete_admin');
INSERT INTO `auth_permission` VALUES (4, 'Can view admin', 1, 'view_admin');
INSERT INTO `auth_permission` VALUES (5, 'Can add area', 2, 'add_area');
INSERT INTO `auth_permission` VALUES (6, 'Can change area', 2, 'change_area');
INSERT INTO `auth_permission` VALUES (7, 'Can delete area', 2, 'delete_area');
INSERT INTO `auth_permission` VALUES (8, 'Can view area', 2, 'view_area');
INSERT INTO `auth_permission` VALUES (9, 'Can add article', 3, 'add_article');
INSERT INTO `auth_permission` VALUES (10, 'Can change article', 3, 'change_article');
INSERT INTO `auth_permission` VALUES (11, 'Can delete article', 3, 'delete_article');
INSERT INTO `auth_permission` VALUES (12, 'Can view article', 3, 'view_article');
INSERT INTO `auth_permission` VALUES (13, 'Can add label', 4, 'add_label');
INSERT INTO `auth_permission` VALUES (14, 'Can change label', 4, 'change_label');
INSERT INTO `auth_permission` VALUES (15, 'Can delete label', 4, 'delete_label');
INSERT INTO `auth_permission` VALUES (16, 'Can view label', 4, 'view_label');
INSERT INTO `auth_permission` VALUES (17, 'Can add user', 5, 'add_user');
INSERT INTO `auth_permission` VALUES (18, 'Can change user', 5, 'change_user');
INSERT INTO `auth_permission` VALUES (19, 'Can delete user', 5, 'delete_user');
INSERT INTO `auth_permission` VALUES (20, 'Can view user', 5, 'view_user');
INSERT INTO `auth_permission` VALUES (21, 'Can add subscribe', 6, 'add_subscribe');
INSERT INTO `auth_permission` VALUES (22, 'Can change subscribe', 6, 'change_subscribe');
INSERT INTO `auth_permission` VALUES (23, 'Can delete subscribe', 6, 'delete_subscribe');
INSERT INTO `auth_permission` VALUES (24, 'Can view subscribe', 6, 'view_subscribe');
INSERT INTO `auth_permission` VALUES (25, 'Can add mid article label', 7, 'add_midarticlelabel');
INSERT INTO `auth_permission` VALUES (26, 'Can change mid article label', 7, 'change_midarticlelabel');
INSERT INTO `auth_permission` VALUES (27, 'Can delete mid article label', 7, 'delete_midarticlelabel');
INSERT INTO `auth_permission` VALUES (28, 'Can view mid article label', 7, 'view_midarticlelabel');
INSERT INTO `auth_permission` VALUES (29, 'Can add like', 8, 'add_like');
INSERT INTO `auth_permission` VALUES (30, 'Can change like', 8, 'change_like');
INSERT INTO `auth_permission` VALUES (31, 'Can delete like', 8, 'delete_like');
INSERT INTO `auth_permission` VALUES (32, 'Can view like', 8, 'view_like');
INSERT INTO `auth_permission` VALUES (33, 'Can add image', 9, 'add_image');
INSERT INTO `auth_permission` VALUES (34, 'Can change image', 9, 'change_image');
INSERT INTO `auth_permission` VALUES (35, 'Can delete image', 9, 'delete_image');
INSERT INTO `auth_permission` VALUES (36, 'Can view image', 9, 'view_image');
INSERT INTO `auth_permission` VALUES (37, 'Can add folder', 10, 'add_folder');
INSERT INTO `auth_permission` VALUES (38, 'Can change folder', 10, 'change_folder');
INSERT INTO `auth_permission` VALUES (39, 'Can delete folder', 10, 'delete_folder');
INSERT INTO `auth_permission` VALUES (40, 'Can view folder', 10, 'view_folder');
INSERT INTO `auth_permission` VALUES (41, 'Can add comment', 11, 'add_comment');
INSERT INTO `auth_permission` VALUES (42, 'Can change comment', 11, 'change_comment');
INSERT INTO `auth_permission` VALUES (43, 'Can delete comment', 11, 'delete_comment');
INSERT INTO `auth_permission` VALUES (44, 'Can view comment', 11, 'view_comment');
INSERT INTO `auth_permission` VALUES (45, 'Can add log entry', 12, 'add_logentry');
INSERT INTO `auth_permission` VALUES (46, 'Can change log entry', 12, 'change_logentry');
INSERT INTO `auth_permission` VALUES (47, 'Can delete log entry', 12, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (48, 'Can view log entry', 12, 'view_logentry');
INSERT INTO `auth_permission` VALUES (49, 'Can add permission', 13, 'add_permission');
INSERT INTO `auth_permission` VALUES (50, 'Can change permission', 13, 'change_permission');
INSERT INTO `auth_permission` VALUES (51, 'Can delete permission', 13, 'delete_permission');
INSERT INTO `auth_permission` VALUES (52, 'Can view permission', 13, 'view_permission');
INSERT INTO `auth_permission` VALUES (53, 'Can add group', 14, 'add_group');
INSERT INTO `auth_permission` VALUES (54, 'Can change group', 14, 'change_group');
INSERT INTO `auth_permission` VALUES (55, 'Can delete group', 14, 'delete_group');
INSERT INTO `auth_permission` VALUES (56, 'Can view group', 14, 'view_group');
INSERT INTO `auth_permission` VALUES (57, 'Can add user', 15, 'add_user');
INSERT INTO `auth_permission` VALUES (58, 'Can change user', 15, 'change_user');
INSERT INTO `auth_permission` VALUES (59, 'Can delete user', 15, 'delete_user');
INSERT INTO `auth_permission` VALUES (60, 'Can view user', 15, 'view_user');
INSERT INTO `auth_permission` VALUES (61, 'Can add content type', 16, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (62, 'Can change content type', 16, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (63, 'Can delete content type', 16, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (64, 'Can view content type', 16, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (65, 'Can add session', 17, 'add_session');
INSERT INTO `auth_permission` VALUES (66, 'Can change session', 17, 'change_session');
INSERT INTO `auth_permission` VALUES (67, 'Can delete session', 17, 'delete_session');
INSERT INTO `auth_permission` VALUES (68, 'Can view session', 17, 'view_session');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$216000$GzomD1Zo4GQl$gaDVDtPKkrY5Gqp/VyxghL9nJb2dA8L3BKIRWDtELGk=', '2020-09-17 19:22:07.791111', 1, 'admin', '', '', 'admin@admin.com', 1, 1, '2020-09-17 19:22:05.593661');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES (1, 'Django框架21天从入门到精通', '认真看帮助文档+实践+项目就可以了', '认真看帮助文档+实践+项目就可以了', '认真看帮助文档+实践+项目就可以了', '2020-09-18 16:44:21.026941', '2020-09-18 16:55:30.273712', 1, 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_comment
-- ----------------------------
INSERT INTO `cms_comment` VALUES (1, '极力推荐，文章精品！', '2020-09-18 17:06:55.903610', '2020-09-18 17:06:55.903610', 1, 2, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_folder
-- ----------------------------
INSERT INTO `cms_folder` VALUES (1, 'Python', '2020-09-18 16:33:19.436480', '2020-09-18 16:14:47.811830', 1, NULL);
INSERT INTO `cms_folder` VALUES (2, 'web笔记', '2020-09-18 16:26:00.170172', '2020-09-18 16:26:00.170172', 1, 1);
INSERT INTO `cms_folder` VALUES (3, 'django笔记', '2020-09-18 16:26:17.717467', '2020-09-18 16:26:17.717467', 1, 2);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2020-09-18 15:55:00.189601', '1', 'Area object (1)', 1, '[{\"added\": {}}]', 2, 1);
INSERT INTO `django_admin_log` VALUES (2, '2020-09-18 16:00:30.071470', '1', 'User object (1)', 1, '[{\"added\": {}}]', 5, 1);
INSERT INTO `django_admin_log` VALUES (3, '2020-09-18 16:03:39.401700', '1', 'uuid_ismyblue-ismyblue-大脑袋标兵', 2, '[{\"changed\": {\"fields\": [\"Birth\", \"Address\", \"PersonalInfo\"]}}]', 5, 1);
INSERT INTO `django_admin_log` VALUES (4, '2020-09-18 16:05:04.592150', '1', 'Article object (1)', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (5, '2020-09-18 16:13:34.315141', '1', 'Django框架21天从入门到精通-uuid_ismyblue-ismyblue-大脑袋标兵', 2, '[]', 3, 1);
INSERT INTO `django_admin_log` VALUES (6, '2020-09-18 16:14:47.820824', '1', 'Folder object (1)', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (7, '2020-09-18 16:26:00.176168', '2', 'web笔记-uuid_ismyblue-ismyblue-大脑袋标兵', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (8, '2020-09-18 16:26:17.776509', '3', 'django笔记-uuid_ismyblue-ismyblue-大脑袋标兵', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (9, '2020-09-18 16:33:19.438479', '1', 'Python: uuid_ismyblue-ismyblue-大脑袋标兵', 2, '[{\"changed\": {\"fields\": [\"Folder name\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (10, '2020-09-18 16:39:22.633728', '1', 'Label object (1)', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (11, '2020-09-18 16:41:15.897588', '1', '大脑袋标兵: Django框架21天从入门到精通', 2, '[{\"changed\": {\"fields\": [\"Folder id\", \"Label id\"]}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (12, '2020-09-18 16:44:21.030939', '1', '大脑袋标兵: Django框架21天从入门到精通', 2, '[{\"changed\": {\"fields\": [\"Folder id\"]}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (13, '2020-09-18 16:46:51.734268', '1', '大脑袋标兵: Django框架21天从入门到精通', 2, '[{\"changed\": {\"fields\": [\"Folder id\"]}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (14, '2020-09-18 16:55:30.280712', '1', '大脑袋标兵: Django框架21天从入门到精通', 2, '[]', 3, 1);
INSERT INTO `django_admin_log` VALUES (15, '2020-09-18 16:57:04.331359', '1', '大脑袋标兵文章Django框架21天从入门到精通的标签:web', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (16, '2020-09-18 17:00:30.013056', '2', '湖南省长沙市雨花区430111', 1, '[{\"added\": {}}]', 2, 1);
INSERT INTO `django_admin_log` VALUES (17, '2020-09-18 17:02:16.129237', '2', 'uuid_hextech-hextech-海克斯科技', 1, '[{\"added\": {}}]', 5, 1);
INSERT INTO `django_admin_log` VALUES (18, '2020-09-18 17:02:35.183997', '1', '海克斯科技关注了大脑袋标兵', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (19, '2020-09-18 17:03:41.199245', '2', '海克斯科技点赞了大脑袋标兵的文章Django框架21天从入门到精通', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (20, '2020-09-18 17:06:55.907606', '1', 'Django框架21天从入门到精通的评论：极力推荐，文章精品！', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (21, '2020-09-18 17:10:29.929321', '2', 'uuid_hextech-hextech-海克斯科技', 2, '[]', 5, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (12, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (14, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (13, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (15, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (16, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (17, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (1, 'zooapi', 'admin');
INSERT INTO `django_content_type` VALUES (2, 'zooapi', 'area');
INSERT INTO `django_content_type` VALUES (3, 'zooapi', 'article');
INSERT INTO `django_content_type` VALUES (11, 'zooapi', 'comment');
INSERT INTO `django_content_type` VALUES (10, 'zooapi', 'folder');
INSERT INTO `django_content_type` VALUES (9, 'zooapi', 'image');
INSERT INTO `django_content_type` VALUES (4, 'zooapi', 'label');
INSERT INTO `django_content_type` VALUES (8, 'zooapi', 'like');
INSERT INTO `django_content_type` VALUES (7, 'zooapi', 'midarticlelabel');
INSERT INTO `django_content_type` VALUES (6, 'zooapi', 'subscribe');
INSERT INTO `django_content_type` VALUES (5, 'zooapi', 'user');

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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-09-17 19:13:55.903838');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2020-09-17 19:13:56.128743');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2020-09-17 19:13:56.891032');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2020-09-17 19:13:57.049944');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2020-09-17 19:13:57.070929');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2020-09-17 19:13:57.240872');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2020-09-17 19:13:57.435721');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2020-09-17 19:13:57.523669');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2020-09-17 19:13:57.542658');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2020-09-17 19:13:57.631609');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2020-09-17 19:13:57.638604');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2020-09-17 19:13:57.657594');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2020-09-17 19:13:57.769530');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2020-09-17 19:13:57.870474');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2020-09-17 19:13:57.914447');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2020-09-17 19:13:57.933436');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2020-09-17 19:13:58.010391');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2020-09-17 19:13:58.040375');
INSERT INTO `django_migrations` VALUES (19, 'zooapi', '0001_initial', '2020-09-17 19:13:58.722372');
INSERT INTO `django_migrations` VALUES (20, 'zooapi', '0002_auto_20200919_0012', '2020-09-18 16:13:08.939745');
INSERT INTO `django_migrations` VALUES (21, 'zooapi', '0003_auto_20200919_0014', '2020-09-18 16:14:43.591825');
INSERT INTO `django_migrations` VALUES (22, 'zooapi', '0004_article_label_id', '2020-09-18 16:38:45.909700');
INSERT INTO `django_migrations` VALUES (23, 'zooapi', '0005_auto_20200919_0046', '2020-09-18 16:46:28.582394');
INSERT INTO `django_migrations` VALUES (24, 'zooapi', '0002_remove_article_label_id', '2020-09-18 16:56:36.886693');
INSERT INTO `django_migrations` VALUES (25, 'zooapi', '0003_auto_20200919_0106', '2020-09-18 17:06:49.030292');

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
INSERT INTO `django_session` VALUES ('h1fdhcvl4cmyadwiec93iyts65l9ra0q', '.eJxVjDsOwjAQBe_iGllef2NKes5g7XodHECOFCcV4u4QKQW0b2beSyTc1pq2XpY0sTgLEKffjTA_StsB37HdZpnnti4TyV2RB-3yOnN5Xg7376Bir9_aOxWg5KiYIaOBEMFFDFwsW-1CUIYdGUPKG02WYcDRa68wBnA0jFG8P8bhNww:1kIzTr:_Ra-M8eMCUp6HIZ5bfF-X54ODOnspLmq3EiM2PmNBW0', '2020-10-01 19:22:07.796107');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rms_image
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  `socre` int NOT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_user
-- ----------------------------
INSERT INTO `ums_user` VALUES (1, 'uuid_ismyblue', 'ismyblue', 'ismyblue', '大脑袋标兵', '黄先生', 1, 'ismyblue@ismyblue.com', '13975555555', 'None', 1000, 1, '1997-01-01', '岳麓大道', 'smart boy', '2020-09-18 16:03:39.390707', '2020-09-18 16:00:30.058476', 1);
INSERT INTO `ums_user` VALUES (2, 'uuid_hextech', 'hextech', 'hextech', '海克斯科技', '贺女士', 0, 'hextech@hextech.com', '18397777777', NULL, 250, 1, '1996-01-01', '大马路边上', 'stupid boy', '2020-09-18 17:02:16.124241', '2020-09-18 17:10:29.923325', 2);

SET FOREIGN_KEY_CHECKS = 1;
