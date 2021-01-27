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

 Date: 27/01/2021 17:11:43
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
) ENGINE = MyISAM AUTO_INCREMENT = 943 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES (892, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-01-27 14:40:59', '2021-01-27 14:40:59');
INSERT INTO `admin_operation_log` VALUES (893, 1, 'admin/open-balls', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 14:41:11', '2021-01-27 14:41:11');
INSERT INTO `admin_operation_log` VALUES (894, 1, 'admin/open-balls/3', 'PUT', '127.0.0.1', '{\"name\":\"first_ball\",\"value\":\"8\",\"pk\":\"3\",\"_token\":\"71oCmJKRG0enkRlT25SsAmsspe0nhJyjCh7QxMfU\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-01-27 14:41:31', '2021-01-27 14:41:31');
INSERT INTO `admin_operation_log` VALUES (895, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 14:41:40', '2021-01-27 14:41:40');
INSERT INTO `admin_operation_log` VALUES (896, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 14:41:42', '2021-01-27 14:41:42');
INSERT INTO `admin_operation_log` VALUES (897, 1, 'admin/user-bets', 'POST', '127.0.0.1', '{\"order_number\":null,\"bet_sum\":null,\"phase_number\":\"10000001\",\"play_type\":\"new1\",\"sum_max\":\"20\",\"sum_min\":\"0\",\"sum_odd\":\"0\",\"sum_even\":\"0\",\"dragon\":\"0\",\"tiger\":\"0\",\"draw\":\"0\",\"before_three_leopard\":\"0\",\"before_three_straight\":\"0\",\"before_three_two_pairs\":\"0\",\"before_three_half_straight\":\"0\",\"before_three_discrete\":\"0\",\"middle_three_leopard\":\"0\",\"middle_three_straight\":\"10\",\"middle_three_two_pairs\":\"0\",\"middle_three_half_straight\":\"0\",\"middle_three_discrete\":\"0\",\"after_three_leopard\":\"0\",\"after_three_straight\":\"0\",\"after_three_two_pairs\":\"0\",\"after_three_half_straight\":\"0\",\"after_three_discrete\":\"0\",\"first_max\":\"0\",\"first_min\":\"0\",\"first_odd\":\"0\",\"first_even\":\"0\",\"first_0\":\"0\",\"first_1\":\"0\",\"first_2\":\"0\",\"first_3\":\"0\",\"first_4\":\"0\",\"first_5\":\"0\",\"first_6\":\"0\",\"first_8\":\"0\",\"first_9\":\"0\",\"second_max\":\"0\",\"second_min\":\"0\",\"second_odd\":\"0\",\"second_even\":\"0\",\"second_0\":\"0\",\"second_1\":\"0\",\"second_2\":\"0\",\"second_3\":\"0\",\"second_4\":\"0\",\"second_5\":\"0\",\"second_6\":\"0\",\"second_8\":\"0\",\"second_9\":\"0\",\"third_max\":\"0\",\"third_min\":\"0\",\"third_odd\":\"0\",\"third_even\":\"0\",\"third_0\":\"0\",\"third_1\":\"0\",\"third_2\":\"0\",\"third_3\":\"0\",\"third_4\":\"0\",\"third_5\":\"0\",\"third_6\":\"0\",\"third_8\":\"0\",\"third_9\":\"0\",\"fourth_max\":\"0\",\"fourth_min\":\"0\",\"fourth_odd\":\"0\",\"fourth_even\":\"0\",\"fourth_0\":\"0\",\"fourth_1\":\"0\",\"fourth_2\":\"0\",\"fourth_3\":\"0\",\"fourth_4\":\"0\",\"fourth_5\":\"0\",\"fourth_6\":\"0\",\"fourth_8\":\"0\",\"fourth_9\":\"0\",\"fifth_max\":\"0\",\"fifth_min\":\"0\",\"fifth_odd\":\"0\",\"fifth_even\":\"0\",\"fifth_0\":\"0\",\"fifth_1\":\"0\",\"fifth_2\":\"0\",\"fifth_3\":\"0\",\"fifth_4\":\"0\",\"fifth_5\":\"0\",\"fifth_6\":\"0\",\"fifth_8\":\"0\",\"fifth_9\":\"0\",\"_token\":\"71oCmJKRG0enkRlT25SsAmsspe0nhJyjCh7QxMfU\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/user-bets\"}', '2021-01-27 14:41:57', '2021-01-27 14:41:57');
INSERT INTO `admin_operation_log` VALUES (898, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-27 14:41:57', '2021-01-27 14:41:57');
INSERT INTO `admin_operation_log` VALUES (899, 1, 'admin/user-bets/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 14:42:10', '2021-01-27 14:42:10');
INSERT INTO `admin_operation_log` VALUES (900, 1, 'admin/user-bets/9/edit', 'GET', '127.0.0.1', '[]', '2021-01-27 14:42:20', '2021-01-27 14:42:20');
INSERT INTO `admin_operation_log` VALUES (901, 1, 'admin/user-bets/9/edit', 'GET', '127.0.0.1', '[]', '2021-01-27 14:42:29', '2021-01-27 14:42:29');
INSERT INTO `admin_operation_log` VALUES (902, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 14:42:38', '2021-01-27 14:42:38');
INSERT INTO `admin_operation_log` VALUES (903, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 14:42:40', '2021-01-27 14:42:40');
INSERT INTO `admin_operation_log` VALUES (904, 1, 'admin/open-balls', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 14:46:02', '2021-01-27 14:46:02');
INSERT INTO `admin_operation_log` VALUES (905, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 14:48:22', '2021-01-27 14:48:22');
INSERT INTO `admin_operation_log` VALUES (906, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 14:48:24', '2021-01-27 14:48:24');
INSERT INTO `admin_operation_log` VALUES (907, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-27 14:48:41', '2021-01-27 14:48:41');
INSERT INTO `admin_operation_log` VALUES (908, 1, 'admin/user-bets', 'POST', '127.0.0.1', '{\"order_number\":null,\"bet_sum\":null,\"phase_number\":\"10000002\",\"play_type\":\"new1\",\"sum_max\":\"40\",\"sum_min\":\"0\",\"sum_odd\":\"0\",\"sum_even\":\"30\",\"dragon\":\"0\",\"tiger\":\"50\",\"draw\":\"0\",\"before_three_leopard\":\"0\",\"before_three_straight\":\"0\",\"before_three_two_pairs\":\"50\",\"before_three_half_straight\":\"0\",\"before_three_discrete\":\"0\",\"middle_three_leopard\":\"0\",\"middle_three_straight\":\"0\",\"middle_three_two_pairs\":\"0\",\"middle_three_half_straight\":\"0\",\"middle_three_discrete\":\"0\",\"after_three_leopard\":\"0\",\"after_three_straight\":\"0\",\"after_three_two_pairs\":\"40\",\"after_three_half_straight\":\"0\",\"after_three_discrete\":\"0\",\"first_max\":\"0\",\"first_min\":\"0\",\"first_odd\":\"0\",\"first_even\":\"0\",\"first_0\":\"0\",\"first_1\":\"0\",\"first_2\":\"0\",\"first_3\":\"0\",\"first_4\":\"0\",\"first_5\":\"0\",\"first_6\":\"0\",\"first_8\":\"0\",\"first_9\":\"0\",\"second_max\":\"0\",\"second_min\":\"0\",\"second_odd\":\"0\",\"second_even\":\"0\",\"second_0\":\"0\",\"second_1\":\"0\",\"second_2\":\"0\",\"second_3\":\"0\",\"second_4\":\"40\",\"second_5\":\"0\",\"second_6\":\"0\",\"second_8\":\"0\",\"second_9\":\"0\",\"third_max\":\"30\",\"third_min\":\"0\",\"third_odd\":\"0\",\"third_even\":\"0\",\"third_0\":\"0\",\"third_1\":\"0\",\"third_2\":\"0\",\"third_3\":\"0\",\"third_4\":\"0\",\"third_5\":\"0\",\"third_6\":\"0\",\"third_8\":\"0\",\"third_9\":\"0\",\"fourth_max\":\"0\",\"fourth_min\":\"0\",\"fourth_odd\":\"0\",\"fourth_even\":\"0\",\"fourth_0\":\"0\",\"fourth_1\":\"0\",\"fourth_2\":\"0\",\"fourth_3\":\"0\",\"fourth_4\":\"40\",\"fourth_5\":\"0\",\"fourth_6\":\"0\",\"fourth_8\":\"0\",\"fourth_9\":\"0\",\"fifth_max\":\"0\",\"fifth_min\":\"0\",\"fifth_odd\":\"0\",\"fifth_even\":\"0\",\"fifth_0\":\"0\",\"fifth_1\":\"0\",\"fifth_2\":\"0\",\"fifth_3\":\"0\",\"fifth_4\":\"0\",\"fifth_5\":\"0\",\"fifth_6\":\"0\",\"fifth_8\":\"0\",\"fifth_9\":\"0\",\"_token\":\"71oCmJKRG0enkRlT25SsAmsspe0nhJyjCh7QxMfU\"}', '2021-01-27 14:49:05', '2021-01-27 14:49:05');
INSERT INTO `admin_operation_log` VALUES (909, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-27 14:49:05', '2021-01-27 14:49:05');
INSERT INTO `admin_operation_log` VALUES (910, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 14:49:16', '2021-01-27 14:49:16');
INSERT INTO `admin_operation_log` VALUES (911, 1, 'admin/open-balls', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 14:49:17', '2021-01-27 14:49:17');
INSERT INTO `admin_operation_log` VALUES (912, 1, 'admin/open-balls/10', 'PUT', '127.0.0.1', '{\"name\":\"next_sealing_time\",\"value\":\"250\",\"pk\":\"10\",\"_token\":\"71oCmJKRG0enkRlT25SsAmsspe0nhJyjCh7QxMfU\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-01-27 14:49:50', '2021-01-27 14:49:50');
INSERT INTO `admin_operation_log` VALUES (913, 1, 'admin/open-balls', 'GET', '127.0.0.1', '[]', '2021-01-27 14:51:00', '2021-01-27 14:51:00');
INSERT INTO `admin_operation_log` VALUES (914, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 14:51:16', '2021-01-27 14:51:16');
INSERT INTO `admin_operation_log` VALUES (915, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 14:51:18', '2021-01-27 14:51:18');
INSERT INTO `admin_operation_log` VALUES (916, 1, 'admin/user-bets', 'POST', '127.0.0.1', '{\"order_number\":null,\"bet_sum\":null,\"phase_number\":\"10000003\",\"play_type\":\"new1\",\"sum_max\":\"0\",\"sum_min\":\"20\",\"sum_odd\":\"40\",\"sum_even\":\"0\",\"dragon\":\"0\",\"tiger\":\"40\",\"draw\":\"0\",\"before_three_leopard\":\"0\",\"before_three_straight\":\"0\",\"before_three_two_pairs\":\"40\",\"before_three_half_straight\":\"0\",\"before_three_discrete\":\"0\",\"middle_three_leopard\":\"20\",\"middle_three_straight\":\"0\",\"middle_three_two_pairs\":\"0\",\"middle_three_half_straight\":\"0\",\"middle_three_discrete\":\"0\",\"after_three_leopard\":\"40\",\"after_three_straight\":\"0\",\"after_three_two_pairs\":\"40\",\"after_three_half_straight\":\"0\",\"after_three_discrete\":\"0\",\"first_max\":\"0\",\"first_min\":\"0\",\"first_odd\":\"0\",\"first_even\":\"0\",\"first_0\":\"0\",\"first_1\":\"0\",\"first_2\":\"0\",\"first_3\":\"0\",\"first_4\":\"0\",\"first_5\":\"0\",\"first_6\":\"20\",\"first_8\":\"0\",\"first_9\":\"0\",\"second_max\":\"0\",\"second_min\":\"0\",\"second_odd\":\"0\",\"second_even\":\"20\",\"second_0\":\"0\",\"second_1\":\"0\",\"second_2\":\"0\",\"second_3\":\"0\",\"second_4\":\"0\",\"second_5\":\"0\",\"second_6\":\"0\",\"second_8\":\"0\",\"second_9\":\"0\",\"third_max\":\"0\",\"third_min\":\"0\",\"third_odd\":\"0\",\"third_even\":\"0\",\"third_0\":\"0\",\"third_1\":\"0\",\"third_2\":\"0\",\"third_3\":\"0\",\"third_4\":\"0\",\"third_5\":\"0\",\"third_6\":\"0\",\"third_8\":\"20\",\"third_9\":\"0\",\"fourth_max\":\"0\",\"fourth_min\":\"0\",\"fourth_odd\":\"0\",\"fourth_even\":\"0\",\"fourth_0\":\"0\",\"fourth_1\":\"0\",\"fourth_2\":\"0\",\"fourth_3\":\"0\",\"fourth_4\":\"0\",\"fourth_5\":\"0\",\"fourth_6\":\"0\",\"fourth_8\":\"0\",\"fourth_9\":\"0\",\"fifth_max\":\"0\",\"fifth_min\":\"0\",\"fifth_odd\":\"0\",\"fifth_even\":\"0\",\"fifth_0\":\"0\",\"fifth_1\":\"0\",\"fifth_2\":\"0\",\"fifth_3\":\"0\",\"fifth_4\":\"0\",\"fifth_5\":\"0\",\"fifth_6\":\"0\",\"fifth_8\":\"0\",\"fifth_9\":\"0\",\"_token\":\"71oCmJKRG0enkRlT25SsAmsspe0nhJyjCh7QxMfU\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/user-bets\"}', '2021-01-27 14:52:17', '2021-01-27 14:52:17');
INSERT INTO `admin_operation_log` VALUES (917, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-27 14:52:18', '2021-01-27 14:52:18');
INSERT INTO `admin_operation_log` VALUES (918, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 14:52:25', '2021-01-27 14:52:25');
INSERT INTO `admin_operation_log` VALUES (919, 1, 'admin/user-bets', 'POST', '127.0.0.1', '{\"order_number\":null,\"bet_sum\":null,\"phase_number\":\"10000003\",\"play_type\":\"new1\",\"sum_max\":\"40\",\"sum_min\":\"20\",\"sum_odd\":\"0\",\"sum_even\":\"0\",\"dragon\":\"0\",\"tiger\":\"0\",\"draw\":\"0\",\"before_three_leopard\":\"20\",\"before_three_straight\":\"20\",\"before_three_two_pairs\":\"0\",\"before_three_half_straight\":\"0\",\"before_three_discrete\":\"0\",\"middle_three_leopard\":\"0\",\"middle_three_straight\":\"0\",\"middle_three_two_pairs\":\"0\",\"middle_three_half_straight\":\"0\",\"middle_three_discrete\":\"0\",\"after_three_leopard\":\"0\",\"after_three_straight\":\"0\",\"after_three_two_pairs\":\"0\",\"after_three_half_straight\":\"0\",\"after_three_discrete\":\"0\",\"first_max\":\"0\",\"first_min\":\"0\",\"first_odd\":\"0\",\"first_even\":\"0\",\"first_0\":\"0\",\"first_1\":\"0\",\"first_2\":\"20\",\"first_3\":\"0\",\"first_4\":\"0\",\"first_5\":\"0\",\"first_6\":\"0\",\"first_8\":\"0\",\"first_9\":\"0\",\"second_max\":\"0\",\"second_min\":\"0\",\"second_odd\":\"0\",\"second_even\":\"0\",\"second_0\":\"0\",\"second_1\":\"0\",\"second_2\":\"0\",\"second_3\":\"0\",\"second_4\":\"0\",\"second_5\":\"0\",\"second_6\":\"0\",\"second_8\":\"0\",\"second_9\":\"0\",\"third_max\":\"0\",\"third_min\":\"0\",\"third_odd\":\"0\",\"third_even\":\"0\",\"third_0\":\"0\",\"third_1\":\"0\",\"third_2\":\"0\",\"third_3\":\"0\",\"third_4\":\"0\",\"third_5\":\"0\",\"third_6\":\"20\",\"third_8\":\"0\",\"third_9\":\"0\",\"fourth_max\":\"0\",\"fourth_min\":\"0\",\"fourth_odd\":\"0\",\"fourth_even\":\"0\",\"fourth_0\":\"0\",\"fourth_1\":\"0\",\"fourth_2\":\"0\",\"fourth_3\":\"0\",\"fourth_4\":\"0\",\"fourth_5\":\"0\",\"fourth_6\":\"20\",\"fourth_8\":\"0\",\"fourth_9\":\"0\",\"fifth_max\":\"20\",\"fifth_min\":\"0\",\"fifth_odd\":\"0\",\"fifth_even\":\"0\",\"fifth_0\":\"0\",\"fifth_1\":\"0\",\"fifth_2\":\"0\",\"fifth_3\":\"0\",\"fifth_4\":\"0\",\"fifth_5\":\"0\",\"fifth_6\":\"0\",\"fifth_8\":\"0\",\"fifth_9\":\"0\",\"_token\":\"71oCmJKRG0enkRlT25SsAmsspe0nhJyjCh7QxMfU\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/user-bets\"}', '2021-01-27 14:52:47', '2021-01-27 14:52:47');
INSERT INTO `admin_operation_log` VALUES (920, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-27 14:52:47', '2021-01-27 14:52:47');
INSERT INTO `admin_operation_log` VALUES (921, 1, 'admin/open-balls', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 14:52:52', '2021-01-27 14:52:52');
INSERT INTO `admin_operation_log` VALUES (922, 1, 'admin/open-balls', 'GET', '127.0.0.1', '[]', '2021-01-27 14:55:07', '2021-01-27 14:55:07');
INSERT INTO `admin_operation_log` VALUES (923, 1, 'admin/open-balls', 'GET', '127.0.0.1', '[]', '2021-01-27 14:57:47', '2021-01-27 14:57:47');
INSERT INTO `admin_operation_log` VALUES (924, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 14:58:06', '2021-01-27 14:58:06');
INSERT INTO `admin_operation_log` VALUES (925, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-27 14:59:10', '2021-01-27 14:59:10');
INSERT INTO `admin_operation_log` VALUES (926, 1, 'admin/open-balls', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 14:59:12', '2021-01-27 14:59:12');
INSERT INTO `admin_operation_log` VALUES (927, 1, 'admin/open-balls', 'GET', '127.0.0.1', '[]', '2021-01-27 15:13:00', '2021-01-27 15:13:00');
INSERT INTO `admin_operation_log` VALUES (928, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 15:22:15', '2021-01-27 15:22:15');
INSERT INTO `admin_operation_log` VALUES (929, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 15:22:16', '2021-01-27 15:22:16');
INSERT INTO `admin_operation_log` VALUES (930, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-27 15:23:58', '2021-01-27 15:23:58');
INSERT INTO `admin_operation_log` VALUES (931, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-27 15:24:00', '2021-01-27 15:24:00');
INSERT INTO `admin_operation_log` VALUES (932, 1, 'admin/open-balls', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 15:24:07', '2021-01-27 15:24:07');
INSERT INTO `admin_operation_log` VALUES (933, 1, 'admin/open-balls', 'GET', '127.0.0.1', '[]', '2021-01-27 15:24:46', '2021-01-27 15:24:46');
INSERT INTO `admin_operation_log` VALUES (934, 1, 'admin/open-balls', 'GET', '127.0.0.1', '[]', '2021-01-27 15:25:36', '2021-01-27 15:25:36');
INSERT INTO `admin_operation_log` VALUES (935, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 15:25:39', '2021-01-27 15:25:39');
INSERT INTO `admin_operation_log` VALUES (936, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 15:25:42', '2021-01-27 15:25:42');
INSERT INTO `admin_operation_log` VALUES (937, 1, 'admin/user-bets', 'POST', '127.0.0.1', '{\"order_number\":null,\"bet_sum\":null,\"phase_number\":\"10000000\",\"play_type\":\"customer\",\"sum_max\":\"20\",\"sum_min\":\"0\",\"sum_odd\":\"0\",\"sum_even\":\"0\",\"dragon\":\"0\",\"tiger\":\"0\",\"draw\":\"0\",\"before_three_leopard\":\"0\",\"before_three_straight\":\"0\",\"before_three_two_pairs\":\"0\",\"before_three_half_straight\":\"0\",\"before_three_discrete\":\"0\",\"middle_three_leopard\":\"0\",\"middle_three_straight\":\"0\",\"middle_three_two_pairs\":\"0\",\"middle_three_half_straight\":\"0\",\"middle_three_discrete\":\"0\",\"after_three_leopard\":\"0\",\"after_three_straight\":\"0\",\"after_three_two_pairs\":\"0\",\"after_three_half_straight\":\"0\",\"after_three_discrete\":\"0\",\"first_max\":\"0\",\"first_min\":\"0\",\"first_odd\":\"0\",\"first_even\":\"0\",\"first_0\":\"0\",\"first_1\":\"0\",\"first_2\":\"0\",\"first_3\":\"0\",\"first_4\":\"0\",\"first_5\":\"0\",\"first_6\":\"0\",\"first_8\":\"0\",\"first_9\":\"0\",\"second_max\":\"0\",\"second_min\":\"0\",\"second_odd\":\"0\",\"second_even\":\"0\",\"second_0\":\"0\",\"second_1\":\"0\",\"second_2\":\"0\",\"second_3\":\"0\",\"second_4\":\"0\",\"second_5\":\"0\",\"second_6\":\"0\",\"second_8\":\"0\",\"second_9\":\"0\",\"third_max\":\"0\",\"third_min\":\"0\",\"third_odd\":\"0\",\"third_even\":\"0\",\"third_0\":\"0\",\"third_1\":\"0\",\"third_2\":\"0\",\"third_3\":\"0\",\"third_4\":\"0\",\"third_5\":\"0\",\"third_6\":\"0\",\"third_8\":\"0\",\"third_9\":\"0\",\"fourth_max\":\"0\",\"fourth_min\":\"0\",\"fourth_odd\":\"0\",\"fourth_even\":\"0\",\"fourth_0\":\"0\",\"fourth_1\":\"0\",\"fourth_2\":\"0\",\"fourth_3\":\"0\",\"fourth_4\":\"0\",\"fourth_5\":\"0\",\"fourth_6\":\"0\",\"fourth_8\":\"0\",\"fourth_9\":\"0\",\"fifth_max\":\"0\",\"fifth_min\":\"0\",\"fifth_odd\":\"0\",\"fifth_even\":\"0\",\"fifth_0\":\"0\",\"fifth_1\":\"0\",\"fifth_2\":\"0\",\"fifth_3\":\"0\",\"fifth_4\":\"0\",\"fifth_5\":\"0\",\"fifth_6\":\"0\",\"fifth_8\":\"0\",\"fifth_9\":\"0\",\"_token\":\"71oCmJKRG0enkRlT25SsAmsspe0nhJyjCh7QxMfU\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/user-bets\"}', '2021-01-27 15:25:48', '2021-01-27 15:25:48');
INSERT INTO `admin_operation_log` VALUES (938, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-27 15:25:48', '2021-01-27 15:25:48');
INSERT INTO `admin_operation_log` VALUES (939, 1, 'admin/open-balls', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 15:25:59', '2021-01-27 15:25:59');
INSERT INTO `admin_operation_log` VALUES (940, 1, 'admin/open-balls/16', 'PUT', '127.0.0.1', '{\"name\":\"first_ball\",\"value\":\"6\",\"pk\":\"16\",\"_token\":\"71oCmJKRG0enkRlT25SsAmsspe0nhJyjCh7QxMfU\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-01-27 15:26:18', '2021-01-27 15:26:18');
INSERT INTO `admin_operation_log` VALUES (941, 1, 'admin/open-balls', 'GET', '127.0.0.1', '[]', '2021-01-27 15:26:19', '2021-01-27 15:26:19');
INSERT INTO `admin_operation_log` VALUES (942, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-27 15:26:23', '2021-01-27 15:26:23');

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
  `play_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'new1' COMMENT '彩种类型',
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
  `sum_bet_price` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '下注总额',
  `win_or_lose` decimal(11, 2) NOT NULL DEFAULT 0.00 COMMENT '盈亏',
  `current_phase` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '当前期数',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of open_ball
-- ----------------------------
INSERT INTO `open_ball` VALUES (18, '10000001', 'customer', 0, 0, 0, 0, 0, 0, 30000, 300, 200, 200, 0, 1611736875, 0, 0.00, 2, '2021-01-27 16:41:15', '2021-01-27 16:41:15');
INSERT INTO `open_ball` VALUES (1, '10000000', 'customer', 0, 0, 0, 0, 0, 0, 30000, 300, 200, 200, 2, 1611736825, 0, 0.00, 1, '2021-01-27 16:40:25', '2021-01-27 16:40:25');

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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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

SET FOREIGN_KEY_CHECKS = 1;
