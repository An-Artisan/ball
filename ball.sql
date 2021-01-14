/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : ball

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 14/01/2021 18:23:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (2, 0, 2, '管理员', 'fa-tasks', '', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (3, 2, 3, '用户列表', 'fa-users', 'auth/users', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (4, 2, 4, '角色列表', 'fa-user', 'auth/roles', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (5, 2, 5, '权限列表', 'fa-ban', 'auth/permissions', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (6, 2, 6, '菜单列表', 'fa-bars', 'auth/menu', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (7, 2, 7, '操作日志', 'fa-history', 'auth/logs', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (8, 0, 0, '下注管理', 'fa-bars', NULL, '*', '2021-01-14 09:14:54', '2021-01-14 09:14:54');
INSERT INTO `admin_menu` VALUES (9, 8, 0, '下注列表', 'fa-bars', 'user-bets', '*', '2021-01-14 09:15:03', '2021-01-14 09:15:28');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES (1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-01-14 08:19:15', '2021-01-14 08:19:15');
INSERT INTO `admin_operation_log` VALUES (2, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-14 08:19:21', '2021-01-14 08:19:21');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-14 08:19:24', '2021-01-14 08:19:24');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2021-01-14 08:21:12', '2021-01-14 08:21:12');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-14 08:21:15', '2021-01-14 08:21:15');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2021-01-14 08:21:21', '2021-01-14 08:21:21');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-14 08:21:24', '2021-01-14 08:21:24');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-14 08:21:37', '2021-01-14 08:21:37');
INSERT INTO `admin_operation_log` VALUES (9, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2021-01-14 08:22:03', '2021-01-14 08:22:03');
INSERT INTO `admin_operation_log` VALUES (10, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-14 08:22:07', '2021-01-14 08:22:07');
INSERT INTO `admin_operation_log` VALUES (11, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-14 08:22:08', '2021-01-14 08:22:08');
INSERT INTO `admin_operation_log` VALUES (12, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-14 08:22:09', '2021-01-14 08:22:09');
INSERT INTO `admin_operation_log` VALUES (13, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-14 08:22:10', '2021-01-14 08:22:10');
INSERT INTO `admin_operation_log` VALUES (14, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-14 08:36:46', '2021-01-14 08:36:46');
INSERT INTO `admin_operation_log` VALUES (15, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-01-14 09:14:38', '2021-01-14 09:14:38');
INSERT INTO `admin_operation_log` VALUES (16, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u4e0b\\u6ce8\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"3gCpr8lZf63MZp3zLSHXo13tNgB9ikGd1x541Vrb\"}', '2021-01-14 09:14:54', '2021-01-14 09:14:54');
INSERT INTO `admin_operation_log` VALUES (17, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-01-14 09:14:54', '2021-01-14 09:14:54');
INSERT INTO `admin_operation_log` VALUES (18, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u4e0b\\u6ce8\\u5217\\u8868\",\"icon\":\"fa-bars\",\"uri\":\"user-bets\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"3gCpr8lZf63MZp3zLSHXo13tNgB9ikGd1x541Vrb\"}', '2021-01-14 09:15:03', '2021-01-14 09:15:03');
INSERT INTO `admin_operation_log` VALUES (19, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-01-14 09:15:03', '2021-01-14 09:15:03');
INSERT INTO `admin_operation_log` VALUES (20, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-01-14 09:15:07', '2021-01-14 09:15:07');
INSERT INTO `admin_operation_log` VALUES (21, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-14 09:15:10', '2021-01-14 09:15:10');
INSERT INTO `admin_operation_log` VALUES (22, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-14 09:15:12', '2021-01-14 09:15:12');
INSERT INTO `admin_operation_log` VALUES (23, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-14 09:15:16', '2021-01-14 09:15:16');
INSERT INTO `admin_operation_log` VALUES (24, 1, 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-14 09:15:22', '2021-01-14 09:15:22');
INSERT INTO `admin_operation_log` VALUES (25, 1, 'admin/auth/menu/9', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u4e0b\\u6ce8\\u5217\\u8868\",\"icon\":\"fa-bars\",\"uri\":\"user-bets\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"3gCpr8lZf63MZp3zLSHXo13tNgB9ikGd1x541Vrb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/menu\"}', '2021-01-14 09:15:28', '2021-01-14 09:15:28');
INSERT INTO `admin_operation_log` VALUES (26, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-01-14 09:15:28', '2021-01-14 09:15:28');
INSERT INTO `admin_operation_log` VALUES (27, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-01-14 09:15:30', '2021-01-14 09:15:30');
INSERT INTO `admin_operation_log` VALUES (28, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-14 09:16:35', '2021-01-14 09:16:35');
INSERT INTO `admin_operation_log` VALUES (29, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-14 09:16:46', '2021-01-14 09:16:46');
INSERT INTO `admin_operation_log` VALUES (30, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-14 09:31:16', '2021-01-14 09:31:16');
INSERT INTO `admin_operation_log` VALUES (31, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-14 09:31:47', '2021-01-14 09:31:47');
INSERT INTO `admin_operation_log` VALUES (32, 1, 'admin/user-bets/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-14 09:31:56', '2021-01-14 09:31:56');
INSERT INTO `admin_operation_log` VALUES (33, 1, 'admin/user-bets/1', 'GET', '127.0.0.1', '[]', '2021-01-14 09:35:19', '2021-01-14 09:35:19');
INSERT INTO `admin_operation_log` VALUES (34, 1, 'admin/user-bets/1', 'GET', '127.0.0.1', '[]', '2021-01-14 09:35:28', '2021-01-14 09:35:28');
INSERT INTO `admin_operation_log` VALUES (35, 1, 'admin/user-bets/1', 'GET', '127.0.0.1', '[]', '2021-01-14 09:36:40', '2021-01-14 09:36:40');
INSERT INTO `admin_operation_log` VALUES (36, 1, 'admin/user-bets/1', 'GET', '127.0.0.1', '[]', '2021-01-14 09:51:50', '2021-01-14 09:51:50');
INSERT INTO `admin_operation_log` VALUES (37, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-14 09:51:51', '2021-01-14 09:51:51');
INSERT INTO `admin_operation_log` VALUES (38, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-14 09:58:31', '2021-01-14 09:58:31');
INSERT INTO `admin_operation_log` VALUES (39, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-14 09:58:33', '2021-01-14 09:58:33');
INSERT INTO `admin_operation_log` VALUES (40, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-14 09:58:57', '2021-01-14 09:58:57');
INSERT INTO `admin_operation_log` VALUES (41, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-14 09:59:09', '2021-01-14 09:59:09');
INSERT INTO `admin_operation_log` VALUES (42, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-14 10:04:08', '2021-01-14 10:04:08');
INSERT INTO `admin_operation_log` VALUES (43, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-14 10:04:40', '2021-01-14 10:04:40');
INSERT INTO `admin_operation_log` VALUES (44, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-14 10:06:14', '2021-01-14 10:06:14');
INSERT INTO `admin_operation_log` VALUES (45, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-14 10:06:28', '2021-01-14 10:06:28');
INSERT INTO `admin_operation_log` VALUES (46, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-14 10:06:38', '2021-01-14 10:06:38');
INSERT INTO `admin_operation_log` VALUES (47, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-14 10:07:03', '2021-01-14 10:07:03');
INSERT INTO `admin_operation_log` VALUES (48, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-14 10:08:27', '2021-01-14 10:08:27');
INSERT INTO `admin_operation_log` VALUES (49, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-14 10:09:24', '2021-01-14 10:09:24');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_permissions_slug_unique`(`slug`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 8, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 9, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_permissions_role_id_permission_id_index`(`role_id`, `permission_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_users_role_id_user_id_index`(`role_id`, `user_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_roles_slug_unique`(`slug`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2021-01-14 08:14:31', '2021-01-14 08:14:31');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions`  (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_user_permissions_user_id_permission_id_index`(`user_id`, `permission_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$uOyKqelJ/cb66/37VnKLzel3Kh7ih7IuSCL2eblUeHjyVuU//HSwm', 'Administrator', NULL, 'iURoNELx7D8NaVZk1VJQFHK1tNemzE1GOSeUnmBTJGasI6FvWh6trt84Zt9l', '2021-01-14 08:14:31', '2021-01-14 08:14:31');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- ----------------------------
-- Table structure for user_bet
-- ----------------------------
DROP TABLE IF EXISTS `user_bet`;
CREATE TABLE `user_bet`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `phase_number` int(11) UNSIGNED NOT NULL COMMENT '当前多少期',
  `order_number` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '每个人下注唯一编号',
  `sum_max` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总和大',
  `sum_min` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总和小',
  `sum_odd` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总和奇',
  `sum_even` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总和偶',
  `dragon` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '龙',
  `tiger` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '虎',
  `draw` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '和',
  `first_max` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一球大',
  `first_min` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一球小',
  `first_odd` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一球奇',
  `first_even` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一球偶',
  `first_0` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一球0',
  `first_1` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一球1',
  `first_2` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一球2',
  `first_3` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一球3',
  `first_4` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一球4',
  `first_5` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一球5',
  `first_6` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一球6',
  `first_7` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一球7',
  `first_8` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一球8',
  `first_9` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一球9',
  `second_max` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二球大',
  `second_min` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二球小',
  `second_odd` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二球奇',
  `second_even` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二球偶',
  `second_0` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二球0',
  `second_1` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二球1',
  `second_2` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二球2',
  `second_3` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二球3',
  `second_4` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二球4',
  `second_5` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二球5',
  `second_6` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二球6',
  `second_7` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二球7',
  `second_8` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二球8',
  `second_9` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二球9',
  `third_max` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '三球大',
  `third_min` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '三球小',
  `third_odd` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '三球奇',
  `third_even` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '三球偶',
  `third_0` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '三球0',
  `third_1` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '三球1',
  `third_2` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '三球2',
  `third_3` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '三球3',
  `third_4` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '三球4',
  `third_5` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '三球5',
  `third_6` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '三球6',
  `third_7` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '三球7',
  `third_8` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '三球8',
  `third_9` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '三球9',
  `fourth_max` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '四球大',
  `fourth_min` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '四球小',
  `fourth_odd` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '四球奇',
  `fourth_even` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '四球偶',
  `fourth_0` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '四球0',
  `fourth_1` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '四球1',
  `fourth_2` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '四球2',
  `fourth_3` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '四球3',
  `fourth_4` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '四球4',
  `fourth_5` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '四球5',
  `fourth_6` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '四球6',
  `fourth_7` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '四球7',
  `fourth_8` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '四球8',
  `fourth_9` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '四球9',
  `fifth_max` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '五球大',
  `fifth_min` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '五球小',
  `fifth_odd` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '五球奇',
  `fifth_even` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '五球偶',
  `fifth_0` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '五球0',
  `fifth_1` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '五球1',
  `fifth_2` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '五球2',
  `fifth_3` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '五球3',
  `fifth_4` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '五球4',
  `fifth_5` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '五球5',
  `fifth_6` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '五球6',
  `fifth_7` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '五球7',
  `fifth_8` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '五球8',
  `fifth_9` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '五球9',
  `before_three_leopard` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '前三豹子',
  `before_three_straight` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '前三顺子',
  `before_three_two_pairs` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '前三对子',
  `before_three_half_straight` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '前三半顺',
  `before_three_discrete` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '前三杂六',
  `middle_three_leopard` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '中三豹子',
  `middle_three_straight` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '中三顺子',
  `middle_three_two_pairs` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '中三对子',
  `middle_three_half_straight` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '中三半顺',
  `middle_three_discrete` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '中三杂六',
  `after_three_leopard` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '后三豹子',
  `after_three_straight` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '后三顺子',
  `after_three_two_pairs` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '后三对子',
  `after_three_half_straight` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '后三半顺',
  `after_three_discrete` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '后三杂六',
  `is_open_lottery` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 => 未开奖 1=> 开奖',
  `bet_sum` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '下注总额',
  `win_or_lose` decimal(11, 2) NOT NULL DEFAULT 0.00 COMMENT '盈亏',
  `created_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_bet
-- ----------------------------
INSERT INTO `user_bet` VALUES (1, 123, '123', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.00, NULL, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
