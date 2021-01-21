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

 Date: 21/01/2021 16:49:00
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
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `admin_menu` VALUES (10, 8, 0, '下注赔率', 'fa-bars', 'user-bet-odds', '*', '2021-01-15 05:39:20', '2021-01-15 05:39:20');
INSERT INTO `admin_menu` VALUES (11, 8, 0, '开奖管理', 'fa-bars', 'open-balls', '*', '2021-01-16 06:29:58', '2021-01-16 06:29:58');

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
) ENGINE = MyISAM AUTO_INCREMENT = 892 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `admin_role_menu` VALUES (1, 10, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 11, NULL, NULL);

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
-- Table structure for open_ball
-- ----------------------------
DROP TABLE IF EXISTS `open_ball`;
CREATE TABLE `open_ball`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `phase_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '期数',
  `play_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'new1',
  `first_ball` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '第一球',
  `second_ball` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '第二球',
  `third_ball` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '第三球',
  `fourth_ball` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '第四球',
  `fifth_ball` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '第五球',
  `open_method` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0=>算法开奖 1=>正常开奖,2 =>人工开奖',
  `current_open_ball_time` int(11) UNSIGNED NOT NULL DEFAULT 300 COMMENT '本期开奖时间 单位秒',
  `next_open_ball_time` int(11) UNSIGNED NOT NULL DEFAULT 300 COMMENT '下期开奖时间 单位秒',
  `current_sealing_time` int(11) UNSIGNED NOT NULL DEFAULT 120 COMMENT '本期封盘时间，单位秒',
  `next_sealing_time` int(11) UNSIGNED NOT NULL DEFAULT 120 COMMENT '下期封盘时间，单位秒',
  `status` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0=>下注中，1=>封盘中,2=>结束',
  `start_time` int(11) NOT NULL COMMENT '开盘时间 时间戳',
  `win_or_lose` decimal(11, 2) NOT NULL DEFAULT 0.00 COMMENT '盈亏',
  `current_phase` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '当前期数',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of open_ball
-- ----------------------------
INSERT INTO `open_ball` VALUES (3, '10000000', 'new1', 2, 3, 0, 0, 1, 0, 300, 300, 120, 120, 1, 1611218166, 10.30, 1, NULL, '2021-01-21 16:41:50');
INSERT INTO `open_ball` VALUES (4, '10000001', 'new1', 0, 0, 0, 0, 0, 0, 300, 300, 120, 120, 2, 1611218510, 0.00, 2, NULL, NULL);

-- ----------------------------
-- Table structure for user_bet
-- ----------------------------
DROP TABLE IF EXISTS `user_bet`;
CREATE TABLE `user_bet`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `phase_number` int(11) UNSIGNED NOT NULL COMMENT '当前多少期',
  `order_number` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '每个人下注唯一编号',
  `play_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'new1' COMMENT '彩种',
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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_bet
-- ----------------------------
INSERT INTO `user_bet` VALUES (7, 10000000, '1611194790', 'new1', 2, 3, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, -1.30, '2021-01-21 16:44:21', '2021-01-21 16:44:21');
INSERT INTO `user_bet` VALUES (8, 10000000, '1611194812', 'new1', 2, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 9, -9.00, '2021-01-21 16:44:23', '2021-01-21 16:44:23');

-- ----------------------------
-- Table structure for user_bet_odds
-- ----------------------------
DROP TABLE IF EXISTS `user_bet_odds`;
CREATE TABLE `user_bet_odds`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `play_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'new1' COMMENT '彩种',
  `sum_max` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总和大',
  `sum_min` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总和小',
  `sum_odd` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总和奇',
  `sum_even` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总和偶',
  `dragon` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '龙',
  `tiger` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '虎',
  `draw` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '和',
  `first_max` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '一球大',
  `first_min` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '一球小',
  `first_odd` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '一球奇',
  `first_even` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '一球偶',
  `first_0` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '一球0',
  `first_1` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '一球1',
  `first_2` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '一球2',
  `first_3` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '一球3',
  `first_4` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '一球4',
  `first_5` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '一球5',
  `first_6` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '一球6',
  `first_7` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '一球7',
  `first_8` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '一球8',
  `first_9` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '一球9',
  `second_max` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '二球大',
  `second_min` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '二球小',
  `second_odd` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '二球奇',
  `second_even` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '二球偶',
  `second_0` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '二球0',
  `second_1` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '二球1',
  `second_2` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '二球2',
  `second_3` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '二球3',
  `second_4` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '二球4',
  `second_5` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '二球5',
  `second_6` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '二球6',
  `second_7` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '二球7',
  `second_8` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '二球8',
  `second_9` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '二球9',
  `third_max` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '三球大',
  `third_min` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '三球小',
  `third_odd` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '三球奇',
  `third_even` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '三球偶',
  `third_0` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '三球0',
  `third_1` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '三球1',
  `third_2` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '三球2',
  `third_3` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '三球3',
  `third_4` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '三球4',
  `third_5` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '三球5',
  `third_6` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '三球6',
  `third_7` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '三球7',
  `third_8` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '三球8',
  `third_9` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '三球9',
  `fourth_max` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '四球大',
  `fourth_min` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '四球小',
  `fourth_odd` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '四球奇',
  `fourth_even` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '四球偶',
  `fourth_0` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '四球0',
  `fourth_1` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '四球1',
  `fourth_2` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '四球2',
  `fourth_3` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '四球3',
  `fourth_4` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '四球4',
  `fourth_5` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '四球5',
  `fourth_6` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '四球6',
  `fourth_7` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '四球7',
  `fourth_8` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '四球8',
  `fourth_9` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '四球9',
  `fifth_max` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '五球大',
  `fifth_min` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '五球小',
  `fifth_odd` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '五球奇',
  `fifth_even` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '五球偶',
  `fifth_0` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '五球0',
  `fifth_1` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '五球1',
  `fifth_2` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '五球2',
  `fifth_3` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '五球3',
  `fifth_4` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '五球4',
  `fifth_5` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '五球5',
  `fifth_6` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '五球6',
  `fifth_7` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '五球7',
  `fifth_8` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '五球8',
  `fifth_9` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '五球9',
  `before_three_leopard` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '前三豹子',
  `before_three_straight` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '前三顺子',
  `before_three_two_pairs` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '前三对子',
  `before_three_half_straight` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '前三半顺',
  `before_three_discrete` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '前三杂六',
  `middle_three_leopard` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '中三豹子',
  `middle_three_straight` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '中三顺子',
  `middle_three_two_pairs` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '中三对子',
  `middle_three_half_straight` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '中三半顺',
  `middle_three_discrete` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '中三杂六',
  `after_three_leopard` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '后三豹子',
  `after_three_straight` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '后三顺子',
  `after_three_two_pairs` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '后三对子',
  `after_three_half_straight` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '后三半顺',
  `after_three_discrete` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '后三杂六',
  `created_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_bet_odds
-- ----------------------------
INSERT INTO `user_bet_odds` VALUES (7, 'new1', 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 0.00, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 0.00, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, 1.90, '2021-01-21 10:16:49', '2021-01-21 10:16:49');

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
