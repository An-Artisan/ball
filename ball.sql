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

 Date: 15/01/2021 18:50:31
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
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = MyISAM AUTO_INCREMENT = 536 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `admin_operation_log` VALUES (50, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-14 10:30:06', '2021-01-14 10:30:06');
INSERT INTO `admin_operation_log` VALUES (51, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-14 10:30:08', '2021-01-14 10:30:08');
INSERT INTO `admin_operation_log` VALUES (52, 1, 'admin/user-bets/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-14 10:30:13', '2021-01-14 10:30:13');
INSERT INTO `admin_operation_log` VALUES (53, 1, 'admin/user-bets/1', 'GET', '127.0.0.1', '[]', '2021-01-14 10:30:29', '2021-01-14 10:30:29');
INSERT INTO `admin_operation_log` VALUES (54, 1, 'admin/user-bets/1', 'GET', '127.0.0.1', '[]', '2021-01-14 10:30:48', '2021-01-14 10:30:48');
INSERT INTO `admin_operation_log` VALUES (55, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-01-15 02:01:52', '2021-01-15 02:01:52');
INSERT INTO `admin_operation_log` VALUES (56, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 02:01:58', '2021-01-15 02:01:58');
INSERT INTO `admin_operation_log` VALUES (57, 1, 'admin/user-bets/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 02:02:07', '2021-01-15 02:02:07');
INSERT INTO `admin_operation_log` VALUES (58, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 02:02:12', '2021-01-15 02:02:12');
INSERT INTO `admin_operation_log` VALUES (59, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 02:02:13', '2021-01-15 02:02:13');
INSERT INTO `admin_operation_log` VALUES (60, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:03:55', '2021-01-15 02:03:55');
INSERT INTO `admin_operation_log` VALUES (61, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:05:55', '2021-01-15 02:05:55');
INSERT INTO `admin_operation_log` VALUES (62, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:06:30', '2021-01-15 02:06:30');
INSERT INTO `admin_operation_log` VALUES (63, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:07:13', '2021-01-15 02:07:13');
INSERT INTO `admin_operation_log` VALUES (64, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:08:22', '2021-01-15 02:08:22');
INSERT INTO `admin_operation_log` VALUES (65, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:11:11', '2021-01-15 02:11:11');
INSERT INTO `admin_operation_log` VALUES (66, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:11:26', '2021-01-15 02:11:26');
INSERT INTO `admin_operation_log` VALUES (67, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:13:45', '2021-01-15 02:13:45');
INSERT INTO `admin_operation_log` VALUES (68, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:14:10', '2021-01-15 02:14:10');
INSERT INTO `admin_operation_log` VALUES (69, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:14:33', '2021-01-15 02:14:33');
INSERT INTO `admin_operation_log` VALUES (70, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:14:51', '2021-01-15 02:14:51');
INSERT INTO `admin_operation_log` VALUES (71, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:17:11', '2021-01-15 02:17:11');
INSERT INTO `admin_operation_log` VALUES (72, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:17:40', '2021-01-15 02:17:40');
INSERT INTO `admin_operation_log` VALUES (73, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:17:52', '2021-01-15 02:17:52');
INSERT INTO `admin_operation_log` VALUES (74, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:17:59', '2021-01-15 02:17:59');
INSERT INTO `admin_operation_log` VALUES (75, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:18:09', '2021-01-15 02:18:09');
INSERT INTO `admin_operation_log` VALUES (76, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:18:23', '2021-01-15 02:18:23');
INSERT INTO `admin_operation_log` VALUES (77, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:18:49', '2021-01-15 02:18:49');
INSERT INTO `admin_operation_log` VALUES (78, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:18:55', '2021-01-15 02:18:55');
INSERT INTO `admin_operation_log` VALUES (79, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:19:05', '2021-01-15 02:19:05');
INSERT INTO `admin_operation_log` VALUES (80, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:19:13', '2021-01-15 02:19:13');
INSERT INTO `admin_operation_log` VALUES (81, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:19:25', '2021-01-15 02:19:25');
INSERT INTO `admin_operation_log` VALUES (82, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:20:39', '2021-01-15 02:20:39');
INSERT INTO `admin_operation_log` VALUES (83, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:21:09', '2021-01-15 02:21:09');
INSERT INTO `admin_operation_log` VALUES (84, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:23:48', '2021-01-15 02:23:48');
INSERT INTO `admin_operation_log` VALUES (85, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:23:52', '2021-01-15 02:23:52');
INSERT INTO `admin_operation_log` VALUES (86, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:23:58', '2021-01-15 02:23:58');
INSERT INTO `admin_operation_log` VALUES (87, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:24:00', '2021-01-15 02:24:00');
INSERT INTO `admin_operation_log` VALUES (88, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:24:07', '2021-01-15 02:24:07');
INSERT INTO `admin_operation_log` VALUES (89, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:24:12', '2021-01-15 02:24:12');
INSERT INTO `admin_operation_log` VALUES (90, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:24:21', '2021-01-15 02:24:21');
INSERT INTO `admin_operation_log` VALUES (91, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:25:52', '2021-01-15 02:25:52');
INSERT INTO `admin_operation_log` VALUES (92, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:32:27', '2021-01-15 02:32:27');
INSERT INTO `admin_operation_log` VALUES (93, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:32:32', '2021-01-15 02:32:32');
INSERT INTO `admin_operation_log` VALUES (94, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:32:43', '2021-01-15 02:32:43');
INSERT INTO `admin_operation_log` VALUES (95, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:33:00', '2021-01-15 02:33:00');
INSERT INTO `admin_operation_log` VALUES (96, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:36:38', '2021-01-15 02:36:38');
INSERT INTO `admin_operation_log` VALUES (97, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:36:58', '2021-01-15 02:36:58');
INSERT INTO `admin_operation_log` VALUES (98, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:37:05', '2021-01-15 02:37:05');
INSERT INTO `admin_operation_log` VALUES (99, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:37:11', '2021-01-15 02:37:11');
INSERT INTO `admin_operation_log` VALUES (100, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:37:35', '2021-01-15 02:37:35');
INSERT INTO `admin_operation_log` VALUES (101, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:38:04', '2021-01-15 02:38:04');
INSERT INTO `admin_operation_log` VALUES (102, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:38:14', '2021-01-15 02:38:14');
INSERT INTO `admin_operation_log` VALUES (103, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:38:21', '2021-01-15 02:38:21');
INSERT INTO `admin_operation_log` VALUES (104, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:38:26', '2021-01-15 02:38:26');
INSERT INTO `admin_operation_log` VALUES (105, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:38:31', '2021-01-15 02:38:31');
INSERT INTO `admin_operation_log` VALUES (106, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:38:35', '2021-01-15 02:38:35');
INSERT INTO `admin_operation_log` VALUES (107, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:38:39', '2021-01-15 02:38:39');
INSERT INTO `admin_operation_log` VALUES (108, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:38:44', '2021-01-15 02:38:44');
INSERT INTO `admin_operation_log` VALUES (109, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:38:49', '2021-01-15 02:38:49');
INSERT INTO `admin_operation_log` VALUES (110, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:38:54', '2021-01-15 02:38:54');
INSERT INTO `admin_operation_log` VALUES (111, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:38:59', '2021-01-15 02:38:59');
INSERT INTO `admin_operation_log` VALUES (112, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:39:32', '2021-01-15 02:39:32');
INSERT INTO `admin_operation_log` VALUES (113, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:39:37', '2021-01-15 02:39:37');
INSERT INTO `admin_operation_log` VALUES (114, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:39:43', '2021-01-15 02:39:43');
INSERT INTO `admin_operation_log` VALUES (115, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:39:48', '2021-01-15 02:39:48');
INSERT INTO `admin_operation_log` VALUES (116, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:40:02', '2021-01-15 02:40:02');
INSERT INTO `admin_operation_log` VALUES (117, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:42:34', '2021-01-15 02:42:34');
INSERT INTO `admin_operation_log` VALUES (118, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:42:44', '2021-01-15 02:42:44');
INSERT INTO `admin_operation_log` VALUES (119, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:43:47', '2021-01-15 02:43:47');
INSERT INTO `admin_operation_log` VALUES (120, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:44:08', '2021-01-15 02:44:08');
INSERT INTO `admin_operation_log` VALUES (121, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:48:35', '2021-01-15 02:48:35');
INSERT INTO `admin_operation_log` VALUES (122, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:48:52', '2021-01-15 02:48:52');
INSERT INTO `admin_operation_log` VALUES (123, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:49:58', '2021-01-15 02:49:58');
INSERT INTO `admin_operation_log` VALUES (124, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:50:21', '2021-01-15 02:50:21');
INSERT INTO `admin_operation_log` VALUES (125, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:50:35', '2021-01-15 02:50:35');
INSERT INTO `admin_operation_log` VALUES (126, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:51:08', '2021-01-15 02:51:08');
INSERT INTO `admin_operation_log` VALUES (127, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:51:36', '2021-01-15 02:51:36');
INSERT INTO `admin_operation_log` VALUES (128, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:51:50', '2021-01-15 02:51:50');
INSERT INTO `admin_operation_log` VALUES (129, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:52:10', '2021-01-15 02:52:10');
INSERT INTO `admin_operation_log` VALUES (130, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:52:56', '2021-01-15 02:52:56');
INSERT INTO `admin_operation_log` VALUES (131, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:53:04', '2021-01-15 02:53:04');
INSERT INTO `admin_operation_log` VALUES (132, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:54:32', '2021-01-15 02:54:32');
INSERT INTO `admin_operation_log` VALUES (133, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:54:58', '2021-01-15 02:54:58');
INSERT INTO `admin_operation_log` VALUES (134, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:55:35', '2021-01-15 02:55:35');
INSERT INTO `admin_operation_log` VALUES (135, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:55:52', '2021-01-15 02:55:52');
INSERT INTO `admin_operation_log` VALUES (136, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:56:22', '2021-01-15 02:56:22');
INSERT INTO `admin_operation_log` VALUES (137, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:56:27', '2021-01-15 02:56:27');
INSERT INTO `admin_operation_log` VALUES (138, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:56:38', '2021-01-15 02:56:38');
INSERT INTO `admin_operation_log` VALUES (139, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:56:51', '2021-01-15 02:56:51');
INSERT INTO `admin_operation_log` VALUES (140, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:56:58', '2021-01-15 02:56:58');
INSERT INTO `admin_operation_log` VALUES (141, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:58:23', '2021-01-15 02:58:23');
INSERT INTO `admin_operation_log` VALUES (142, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:59:12', '2021-01-15 02:59:12');
INSERT INTO `admin_operation_log` VALUES (143, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:59:24', '2021-01-15 02:59:24');
INSERT INTO `admin_operation_log` VALUES (144, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 02:59:47', '2021-01-15 02:59:47');
INSERT INTO `admin_operation_log` VALUES (145, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:00:08', '2021-01-15 03:00:08');
INSERT INTO `admin_operation_log` VALUES (146, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:00:14', '2021-01-15 03:00:14');
INSERT INTO `admin_operation_log` VALUES (147, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:00:22', '2021-01-15 03:00:22');
INSERT INTO `admin_operation_log` VALUES (148, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:00:31', '2021-01-15 03:00:31');
INSERT INTO `admin_operation_log` VALUES (149, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:00:36', '2021-01-15 03:00:36');
INSERT INTO `admin_operation_log` VALUES (150, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:00:46', '2021-01-15 03:00:46');
INSERT INTO `admin_operation_log` VALUES (151, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:00:47', '2021-01-15 03:00:47');
INSERT INTO `admin_operation_log` VALUES (152, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:00:53', '2021-01-15 03:00:53');
INSERT INTO `admin_operation_log` VALUES (153, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:03:04', '2021-01-15 03:03:04');
INSERT INTO `admin_operation_log` VALUES (154, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:03:22', '2021-01-15 03:03:22');
INSERT INTO `admin_operation_log` VALUES (155, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:03:32', '2021-01-15 03:03:32');
INSERT INTO `admin_operation_log` VALUES (156, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:04:19', '2021-01-15 03:04:19');
INSERT INTO `admin_operation_log` VALUES (157, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:04:40', '2021-01-15 03:04:40');
INSERT INTO `admin_operation_log` VALUES (158, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:07:36', '2021-01-15 03:07:36');
INSERT INTO `admin_operation_log` VALUES (159, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:07:59', '2021-01-15 03:07:59');
INSERT INTO `admin_operation_log` VALUES (160, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:08:20', '2021-01-15 03:08:20');
INSERT INTO `admin_operation_log` VALUES (161, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:08:39', '2021-01-15 03:08:39');
INSERT INTO `admin_operation_log` VALUES (162, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:08:47', '2021-01-15 03:08:47');
INSERT INTO `admin_operation_log` VALUES (163, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:08:52', '2021-01-15 03:08:52');
INSERT INTO `admin_operation_log` VALUES (164, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:08:54', '2021-01-15 03:08:54');
INSERT INTO `admin_operation_log` VALUES (165, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:09:09', '2021-01-15 03:09:09');
INSERT INTO `admin_operation_log` VALUES (166, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:09:24', '2021-01-15 03:09:24');
INSERT INTO `admin_operation_log` VALUES (167, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:11:46', '2021-01-15 03:11:46');
INSERT INTO `admin_operation_log` VALUES (168, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:12:11', '2021-01-15 03:12:11');
INSERT INTO `admin_operation_log` VALUES (169, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:13:06', '2021-01-15 03:13:06');
INSERT INTO `admin_operation_log` VALUES (170, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:13:19', '2021-01-15 03:13:19');
INSERT INTO `admin_operation_log` VALUES (171, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:13:36', '2021-01-15 03:13:36');
INSERT INTO `admin_operation_log` VALUES (172, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:14:38', '2021-01-15 03:14:38');
INSERT INTO `admin_operation_log` VALUES (173, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:14:54', '2021-01-15 03:14:54');
INSERT INTO `admin_operation_log` VALUES (174, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:15:17', '2021-01-15 03:15:17');
INSERT INTO `admin_operation_log` VALUES (175, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:15:49', '2021-01-15 03:15:49');
INSERT INTO `admin_operation_log` VALUES (176, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:15:53', '2021-01-15 03:15:53');
INSERT INTO `admin_operation_log` VALUES (177, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:16:05', '2021-01-15 03:16:05');
INSERT INTO `admin_operation_log` VALUES (178, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:16:14', '2021-01-15 03:16:14');
INSERT INTO `admin_operation_log` VALUES (179, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:16:31', '2021-01-15 03:16:31');
INSERT INTO `admin_operation_log` VALUES (180, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:16:36', '2021-01-15 03:16:36');
INSERT INTO `admin_operation_log` VALUES (181, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:16:47', '2021-01-15 03:16:47');
INSERT INTO `admin_operation_log` VALUES (182, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:17:17', '2021-01-15 03:17:17');
INSERT INTO `admin_operation_log` VALUES (183, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:17:31', '2021-01-15 03:17:31');
INSERT INTO `admin_operation_log` VALUES (184, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:17:44', '2021-01-15 03:17:44');
INSERT INTO `admin_operation_log` VALUES (185, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:21:48', '2021-01-15 03:21:48');
INSERT INTO `admin_operation_log` VALUES (186, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:23:35', '2021-01-15 03:23:35');
INSERT INTO `admin_operation_log` VALUES (187, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:25:11', '2021-01-15 03:25:11');
INSERT INTO `admin_operation_log` VALUES (188, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:27:08', '2021-01-15 03:27:08');
INSERT INTO `admin_operation_log` VALUES (189, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:27:21', '2021-01-15 03:27:21');
INSERT INTO `admin_operation_log` VALUES (190, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:27:33', '2021-01-15 03:27:33');
INSERT INTO `admin_operation_log` VALUES (191, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:27:40', '2021-01-15 03:27:40');
INSERT INTO `admin_operation_log` VALUES (192, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:27:56', '2021-01-15 03:27:56');
INSERT INTO `admin_operation_log` VALUES (193, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:30:34', '2021-01-15 03:30:34');
INSERT INTO `admin_operation_log` VALUES (194, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:31:05', '2021-01-15 03:31:05');
INSERT INTO `admin_operation_log` VALUES (195, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:31:11', '2021-01-15 03:31:11');
INSERT INTO `admin_operation_log` VALUES (196, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:31:18', '2021-01-15 03:31:18');
INSERT INTO `admin_operation_log` VALUES (197, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:31:25', '2021-01-15 03:31:25');
INSERT INTO `admin_operation_log` VALUES (198, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:32:03', '2021-01-15 03:32:03');
INSERT INTO `admin_operation_log` VALUES (199, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:32:15', '2021-01-15 03:32:15');
INSERT INTO `admin_operation_log` VALUES (200, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:32:26', '2021-01-15 03:32:26');
INSERT INTO `admin_operation_log` VALUES (201, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:32:33', '2021-01-15 03:32:33');
INSERT INTO `admin_operation_log` VALUES (202, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:32:40', '2021-01-15 03:32:40');
INSERT INTO `admin_operation_log` VALUES (203, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:32:51', '2021-01-15 03:32:51');
INSERT INTO `admin_operation_log` VALUES (204, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:33:25', '2021-01-15 03:33:25');
INSERT INTO `admin_operation_log` VALUES (205, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:33:43', '2021-01-15 03:33:43');
INSERT INTO `admin_operation_log` VALUES (206, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:33:59', '2021-01-15 03:33:59');
INSERT INTO `admin_operation_log` VALUES (207, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:34:22', '2021-01-15 03:34:22');
INSERT INTO `admin_operation_log` VALUES (208, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:34:41', '2021-01-15 03:34:41');
INSERT INTO `admin_operation_log` VALUES (209, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:34:52', '2021-01-15 03:34:52');
INSERT INTO `admin_operation_log` VALUES (210, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:35:07', '2021-01-15 03:35:07');
INSERT INTO `admin_operation_log` VALUES (211, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:35:32', '2021-01-15 03:35:32');
INSERT INTO `admin_operation_log` VALUES (212, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:35:42', '2021-01-15 03:35:42');
INSERT INTO `admin_operation_log` VALUES (213, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:35:48', '2021-01-15 03:35:48');
INSERT INTO `admin_operation_log` VALUES (214, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:35:58', '2021-01-15 03:35:58');
INSERT INTO `admin_operation_log` VALUES (215, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:36:13', '2021-01-15 03:36:13');
INSERT INTO `admin_operation_log` VALUES (216, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:36:20', '2021-01-15 03:36:20');
INSERT INTO `admin_operation_log` VALUES (217, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:36:27', '2021-01-15 03:36:27');
INSERT INTO `admin_operation_log` VALUES (218, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:36:30', '2021-01-15 03:36:30');
INSERT INTO `admin_operation_log` VALUES (219, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:36:35', '2021-01-15 03:36:35');
INSERT INTO `admin_operation_log` VALUES (220, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:36:40', '2021-01-15 03:36:40');
INSERT INTO `admin_operation_log` VALUES (221, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:36:49', '2021-01-15 03:36:49');
INSERT INTO `admin_operation_log` VALUES (222, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:36:53', '2021-01-15 03:36:53');
INSERT INTO `admin_operation_log` VALUES (223, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:37:33', '2021-01-15 03:37:33');
INSERT INTO `admin_operation_log` VALUES (224, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:37:44', '2021-01-15 03:37:44');
INSERT INTO `admin_operation_log` VALUES (225, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:37:57', '2021-01-15 03:37:57');
INSERT INTO `admin_operation_log` VALUES (226, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:38:01', '2021-01-15 03:38:01');
INSERT INTO `admin_operation_log` VALUES (227, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:39:18', '2021-01-15 03:39:18');
INSERT INTO `admin_operation_log` VALUES (228, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:39:35', '2021-01-15 03:39:35');
INSERT INTO `admin_operation_log` VALUES (229, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:40:15', '2021-01-15 03:40:15');
INSERT INTO `admin_operation_log` VALUES (230, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:40:26', '2021-01-15 03:40:26');
INSERT INTO `admin_operation_log` VALUES (231, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:42:53', '2021-01-15 03:42:53');
INSERT INTO `admin_operation_log` VALUES (232, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:44:09', '2021-01-15 03:44:09');
INSERT INTO `admin_operation_log` VALUES (233, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:45:28', '2021-01-15 03:45:28');
INSERT INTO `admin_operation_log` VALUES (234, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:45:56', '2021-01-15 03:45:56');
INSERT INTO `admin_operation_log` VALUES (235, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 03:46:07', '2021-01-15 03:46:07');
INSERT INTO `admin_operation_log` VALUES (236, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 04:50:23', '2021-01-15 04:50:23');
INSERT INTO `admin_operation_log` VALUES (237, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 04:50:42', '2021-01-15 04:50:42');
INSERT INTO `admin_operation_log` VALUES (238, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 04:52:15', '2021-01-15 04:52:15');
INSERT INTO `admin_operation_log` VALUES (239, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 04:52:44', '2021-01-15 04:52:44');
INSERT INTO `admin_operation_log` VALUES (240, 1, 'admin/user-bets/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 04:52:50', '2021-01-15 04:52:50');
INSERT INTO `admin_operation_log` VALUES (241, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 04:54:25', '2021-01-15 04:54:25');
INSERT INTO `admin_operation_log` VALUES (242, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 04:54:28', '2021-01-15 04:54:28');
INSERT INTO `admin_operation_log` VALUES (243, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 04:54:37', '2021-01-15 04:54:37');
INSERT INTO `admin_operation_log` VALUES (244, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 04:57:51', '2021-01-15 04:57:51');
INSERT INTO `admin_operation_log` VALUES (245, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 04:57:54', '2021-01-15 04:57:54');
INSERT INTO `admin_operation_log` VALUES (246, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 04:58:27', '2021-01-15 04:58:27');
INSERT INTO `admin_operation_log` VALUES (247, 1, 'admin/user-bets/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 04:58:35', '2021-01-15 04:58:35');
INSERT INTO `admin_operation_log` VALUES (248, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 04:58:39', '2021-01-15 04:58:39');
INSERT INTO `admin_operation_log` VALUES (249, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 04:58:43', '2021-01-15 04:58:43');
INSERT INTO `admin_operation_log` VALUES (250, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 04:58:47', '2021-01-15 04:58:47');
INSERT INTO `admin_operation_log` VALUES (251, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 04:59:42', '2021-01-15 04:59:42');
INSERT INTO `admin_operation_log` VALUES (252, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 04:59:47', '2021-01-15 04:59:47');
INSERT INTO `admin_operation_log` VALUES (253, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 04:59:49', '2021-01-15 04:59:49');
INSERT INTO `admin_operation_log` VALUES (254, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:00:25', '2021-01-15 05:00:25');
INSERT INTO `admin_operation_log` VALUES (255, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:00:37', '2021-01-15 05:00:37');
INSERT INTO `admin_operation_log` VALUES (256, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:00:45', '2021-01-15 05:00:45');
INSERT INTO `admin_operation_log` VALUES (257, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 05:05:41', '2021-01-15 05:05:41');
INSERT INTO `admin_operation_log` VALUES (258, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 05:07:08', '2021-01-15 05:07:08');
INSERT INTO `admin_operation_log` VALUES (259, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 05:07:09', '2021-01-15 05:07:09');
INSERT INTO `admin_operation_log` VALUES (260, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 05:09:13', '2021-01-15 05:09:13');
INSERT INTO `admin_operation_log` VALUES (261, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:09:26', '2021-01-15 05:09:26');
INSERT INTO `admin_operation_log` VALUES (262, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:09:28', '2021-01-15 05:09:28');
INSERT INTO `admin_operation_log` VALUES (263, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:09:33', '2021-01-15 05:09:33');
INSERT INTO `admin_operation_log` VALUES (264, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 05:09:42', '2021-01-15 05:09:42');
INSERT INTO `admin_operation_log` VALUES (265, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:09:43', '2021-01-15 05:09:43');
INSERT INTO `admin_operation_log` VALUES (266, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 05:10:06', '2021-01-15 05:10:06');
INSERT INTO `admin_operation_log` VALUES (267, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 05:11:25', '2021-01-15 05:11:25');
INSERT INTO `admin_operation_log` VALUES (268, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 05:11:37', '2021-01-15 05:11:37');
INSERT INTO `admin_operation_log` VALUES (269, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 05:11:51', '2021-01-15 05:11:51');
INSERT INTO `admin_operation_log` VALUES (270, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 05:11:59', '2021-01-15 05:11:59');
INSERT INTO `admin_operation_log` VALUES (271, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 05:14:31', '2021-01-15 05:14:31');
INSERT INTO `admin_operation_log` VALUES (272, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:14:57', '2021-01-15 05:14:57');
INSERT INTO `admin_operation_log` VALUES (273, 1, 'admin/user-bets/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:15:02', '2021-01-15 05:15:02');
INSERT INTO `admin_operation_log` VALUES (274, 1, 'admin/user-bets/1', 'GET', '127.0.0.1', '[]', '2021-01-15 05:15:35', '2021-01-15 05:15:35');
INSERT INTO `admin_operation_log` VALUES (275, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:15:38', '2021-01-15 05:15:38');
INSERT INTO `admin_operation_log` VALUES (276, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 05:15:40', '2021-01-15 05:15:40');
INSERT INTO `admin_operation_log` VALUES (277, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:15:45', '2021-01-15 05:15:45');
INSERT INTO `admin_operation_log` VALUES (278, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:15:46', '2021-01-15 05:15:46');
INSERT INTO `admin_operation_log` VALUES (279, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:16:14', '2021-01-15 05:16:14');
INSERT INTO `admin_operation_log` VALUES (280, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 05:16:15', '2021-01-15 05:16:15');
INSERT INTO `admin_operation_log` VALUES (281, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:16:18', '2021-01-15 05:16:18');
INSERT INTO `admin_operation_log` VALUES (282, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 05:16:40', '2021-01-15 05:16:40');
INSERT INTO `admin_operation_log` VALUES (283, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 05:16:55', '2021-01-15 05:16:55');
INSERT INTO `admin_operation_log` VALUES (284, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:17:16', '2021-01-15 05:17:16');
INSERT INTO `admin_operation_log` VALUES (285, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:17:21', '2021-01-15 05:17:21');
INSERT INTO `admin_operation_log` VALUES (286, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 05:18:39', '2021-01-15 05:18:39');
INSERT INTO `admin_operation_log` VALUES (287, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 05:18:58', '2021-01-15 05:18:58');
INSERT INTO `admin_operation_log` VALUES (288, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 05:19:01', '2021-01-15 05:19:01');
INSERT INTO `admin_operation_log` VALUES (289, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 05:19:48', '2021-01-15 05:19:48');
INSERT INTO `admin_operation_log` VALUES (290, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 05:20:35', '2021-01-15 05:20:35');
INSERT INTO `admin_operation_log` VALUES (291, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 05:20:43', '2021-01-15 05:20:43');
INSERT INTO `admin_operation_log` VALUES (292, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 05:21:00', '2021-01-15 05:21:00');
INSERT INTO `admin_operation_log` VALUES (293, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 05:21:15', '2021-01-15 05:21:15');
INSERT INTO `admin_operation_log` VALUES (294, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:21:20', '2021-01-15 05:21:20');
INSERT INTO `admin_operation_log` VALUES (295, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:21:22', '2021-01-15 05:21:22');
INSERT INTO `admin_operation_log` VALUES (296, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:22:35', '2021-01-15 05:22:35');
INSERT INTO `admin_operation_log` VALUES (297, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:22:57', '2021-01-15 05:22:57');
INSERT INTO `admin_operation_log` VALUES (298, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:23:58', '2021-01-15 05:23:58');
INSERT INTO `admin_operation_log` VALUES (299, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:24:48', '2021-01-15 05:24:48');
INSERT INTO `admin_operation_log` VALUES (300, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:26:27', '2021-01-15 05:26:27');
INSERT INTO `admin_operation_log` VALUES (301, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:27:32', '2021-01-15 05:27:32');
INSERT INTO `admin_operation_log` VALUES (302, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:27:41', '2021-01-15 05:27:41');
INSERT INTO `admin_operation_log` VALUES (303, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 05:38:34', '2021-01-15 05:38:34');
INSERT INTO `admin_operation_log` VALUES (304, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:38:43', '2021-01-15 05:38:43');
INSERT INTO `admin_operation_log` VALUES (305, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:38:45', '2021-01-15 05:38:45');
INSERT INTO `admin_operation_log` VALUES (306, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:38:58', '2021-01-15 05:38:58');
INSERT INTO `admin_operation_log` VALUES (307, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u4e0b\\u6ce8\\u8d54\\u7387\",\"icon\":\"fa-bars\",\"uri\":\"user-bet-odds\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\"}', '2021-01-15 05:39:20', '2021-01-15 05:39:20');
INSERT INTO `admin_operation_log` VALUES (308, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-01-15 05:39:21', '2021-01-15 05:39:21');
INSERT INTO `admin_operation_log` VALUES (309, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-01-15 05:39:27', '2021-01-15 05:39:27');
INSERT INTO `admin_operation_log` VALUES (310, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:39:30', '2021-01-15 05:39:30');
INSERT INTO `admin_operation_log` VALUES (311, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 05:39:39', '2021-01-15 05:39:39');
INSERT INTO `admin_operation_log` VALUES (312, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 05:40:47', '2021-01-15 05:40:47');
INSERT INTO `admin_operation_log` VALUES (313, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 05:41:34', '2021-01-15 05:41:34');
INSERT INTO `admin_operation_log` VALUES (314, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 05:41:56', '2021-01-15 05:41:56');
INSERT INTO `admin_operation_log` VALUES (315, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 05:44:32', '2021-01-15 05:44:32');
INSERT INTO `admin_operation_log` VALUES (316, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:44:33', '2021-01-15 05:44:33');
INSERT INTO `admin_operation_log` VALUES (317, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 05:44:34', '2021-01-15 05:44:34');
INSERT INTO `admin_operation_log` VALUES (318, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 05:45:07', '2021-01-15 05:45:07');
INSERT INTO `admin_operation_log` VALUES (319, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:45:09', '2021-01-15 05:45:09');
INSERT INTO `admin_operation_log` VALUES (320, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 05:45:09', '2021-01-15 05:45:09');
INSERT INTO `admin_operation_log` VALUES (321, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 05:45:41', '2021-01-15 05:45:41');
INSERT INTO `admin_operation_log` VALUES (322, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 05:45:43', '2021-01-15 05:45:43');
INSERT INTO `admin_operation_log` VALUES (323, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:49:17', '2021-01-15 05:49:17');
INSERT INTO `admin_operation_log` VALUES (324, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:49:27', '2021-01-15 05:49:27');
INSERT INTO `admin_operation_log` VALUES (325, 1, 'admin/user-bet-odds', 'POST', '127.0.0.1', '{\"sum_max\":\"1\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\"}', '2021-01-15 05:49:35', '2021-01-15 05:49:35');
INSERT INTO `admin_operation_log` VALUES (326, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:49:35', '2021-01-15 05:49:35');
INSERT INTO `admin_operation_log` VALUES (327, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:51:55', '2021-01-15 05:51:55');
INSERT INTO `admin_operation_log` VALUES (328, 1, 'admin/user-bet-odds', 'POST', '127.0.0.1', '{\"sum_max\":\"222\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\"}', '2021-01-15 05:52:00', '2021-01-15 05:52:00');
INSERT INTO `admin_operation_log` VALUES (329, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:52:00', '2021-01-15 05:52:00');
INSERT INTO `admin_operation_log` VALUES (330, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:56:04', '2021-01-15 05:56:04');
INSERT INTO `admin_operation_log` VALUES (331, 1, 'admin/user-bet-odds', 'POST', '127.0.0.1', '{\"sum_max\":\"333\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\"}', '2021-01-15 05:56:08', '2021-01-15 05:56:08');
INSERT INTO `admin_operation_log` VALUES (332, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:56:09', '2021-01-15 05:56:09');
INSERT INTO `admin_operation_log` VALUES (333, 1, 'admin/user-bet-odds', 'POST', '127.0.0.1', '{\"sum_max\":\"0.5\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\"}', '2021-01-15 05:56:27', '2021-01-15 05:56:27');
INSERT INTO `admin_operation_log` VALUES (334, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:56:27', '2021-01-15 05:56:27');
INSERT INTO `admin_operation_log` VALUES (335, 1, 'admin/user-bet-odds', 'POST', '127.0.0.1', '{\"sum_max\":\"0.5\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\"}', '2021-01-15 05:56:32', '2021-01-15 05:56:32');
INSERT INTO `admin_operation_log` VALUES (336, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:56:32', '2021-01-15 05:56:32');
INSERT INTO `admin_operation_log` VALUES (337, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:56:34', '2021-01-15 05:56:34');
INSERT INTO `admin_operation_log` VALUES (338, 1, 'admin/user-bet-odds', 'POST', '127.0.0.1', '{\"sum_max\":\"0\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\"}', '2021-01-15 05:56:49', '2021-01-15 05:56:49');
INSERT INTO `admin_operation_log` VALUES (339, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:56:49', '2021-01-15 05:56:49');
INSERT INTO `admin_operation_log` VALUES (340, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:57:03', '2021-01-15 05:57:03');
INSERT INTO `admin_operation_log` VALUES (341, 1, 'admin/user-bet-odds', 'POST', '127.0.0.1', '{\"sum_max\":\"0.25\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\"}', '2021-01-15 05:57:09', '2021-01-15 05:57:09');
INSERT INTO `admin_operation_log` VALUES (342, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:57:10', '2021-01-15 05:57:10');
INSERT INTO `admin_operation_log` VALUES (343, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:57:43', '2021-01-15 05:57:43');
INSERT INTO `admin_operation_log` VALUES (344, 1, 'admin/user-bet-odds', 'POST', '127.0.0.1', '{\"sum_max\":\"0.52\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\"}', '2021-01-15 05:57:49', '2021-01-15 05:57:49');
INSERT INTO `admin_operation_log` VALUES (345, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 05:57:49', '2021-01-15 05:57:49');
INSERT INTO `admin_operation_log` VALUES (346, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 06:01:33', '2021-01-15 06:01:33');
INSERT INTO `admin_operation_log` VALUES (347, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 06:01:37', '2021-01-15 06:01:37');
INSERT INTO `admin_operation_log` VALUES (348, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 06:02:50', '2021-01-15 06:02:50');
INSERT INTO `admin_operation_log` VALUES (349, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 06:03:00', '2021-01-15 06:03:00');
INSERT INTO `admin_operation_log` VALUES (350, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 06:03:13', '2021-01-15 06:03:13');
INSERT INTO `admin_operation_log` VALUES (351, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 06:03:19', '2021-01-15 06:03:19');
INSERT INTO `admin_operation_log` VALUES (352, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 06:03:29', '2021-01-15 06:03:29');
INSERT INTO `admin_operation_log` VALUES (353, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 06:03:40', '2021-01-15 06:03:40');
INSERT INTO `admin_operation_log` VALUES (354, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 06:04:06', '2021-01-15 06:04:06');
INSERT INTO `admin_operation_log` VALUES (355, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 06:04:37', '2021-01-15 06:04:37');
INSERT INTO `admin_operation_log` VALUES (356, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 06:04:57', '2021-01-15 06:04:57');
INSERT INTO `admin_operation_log` VALUES (357, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 06:05:57', '2021-01-15 06:05:57');
INSERT INTO `admin_operation_log` VALUES (358, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:06:03', '2021-01-15 06:06:03');
INSERT INTO `admin_operation_log` VALUES (359, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:06:07', '2021-01-15 06:06:07');
INSERT INTO `admin_operation_log` VALUES (360, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 06:06:44', '2021-01-15 06:06:44');
INSERT INTO `admin_operation_log` VALUES (361, 1, 'admin/user-bet-odds', 'POST', '127.0.0.1', '{\"sum_max\":\"1\",\"sum_min\":\"1\",\"sum_odd\":\"1\",\"sum_even\":\"1\",\"dragon\":\"1\",\"tiger\":\"1\",\"draw\":\"1\",\"before_three_leopard\":\"1\",\"before_three_straight\":\"1\",\"before_three_two_pairs\":\"1\",\"before_three_half_straight\":\"1\",\"before_three_discrete\":\"1\",\"middle_three_leopard\":\"1\",\"middle_three_straight\":\"1\",\"middle_three_two_pairs\":\"1\",\"middle_three_half_straight\":\"1\",\"middle_three_discrete\":\"1\",\"after_three_leopard\":\"1\",\"after_three_straight\":\"1\",\"after_three_two_pairs\":\"1\",\"after_three_half_straight\":\"1\",\"after_three_discrete\":\"1\",\"first_max\":\"1\",\"first_min\":\"1\",\"first_odd\":\"1\",\"first_even\":\"1\",\"first_0\":\"1\",\"first_1\":\"1\",\"first_2\":\"1\",\"first_3\":\"1\",\"first_4\":\"1\",\"first_5\":\"1\",\"first_6\":\"1\",\"first_8\":\"1\",\"first_9\":\"1\",\"second_max\":\"1\",\"second_min\":\"1\",\"second_odd\":\"1\",\"second_even\":\"1\",\"second_0\":\"1\",\"second_1\":\"1\",\"second_2\":\"1\",\"second_3\":\"1\",\"second_4\":\"1\",\"second_5\":\"1\",\"second_6\":\"1\",\"second_8\":\"1\",\"second_9\":\"1\",\"third_max\":\"1\",\"third_min\":\"1\",\"third_odd\":\"1\",\"third_even\":\"1\",\"third_0\":\"1\",\"third_1\":\"1\",\"third_2\":\"1\",\"third_3\":\"1\",\"third_4\":\"1\",\"third_5\":\"1\",\"third_6\":\"1\",\"third_8\":\"1\",\"third_9\":\"1\",\"fourth_max\":\"1\",\"fourth_min\":\"1\",\"fourth_odd\":\"1\",\"fourth_even\":\"1\",\"fourth_0\":\"1\",\"fourth_1\":\"1\",\"fourth_2\":\"1\",\"fourth_3\":\"1\",\"fourth_4\":\"1\",\"fourth_5\":\"1\",\"fourth_6\":\"1\",\"fourth_8\":\"1\",\"fourth_9\":\"1\",\"fifth_max\":\"1\",\"fifth_min\":\"1\",\"fifth_odd\":\"1\",\"fifth_even\":\"1\",\"fifth_0\":\"1\",\"fifth_1\":\"1\",\"fifth_2\":\"1\",\"fifth_3\":\"1\",\"fifth_4\":\"1\",\"fifth_5\":\"1\",\"fifth_6\":\"1\",\"fifth_8\":\"1\",\"fifth_9\":\"1\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\"}', '2021-01-15 06:06:49', '2021-01-15 06:06:49');
INSERT INTO `admin_operation_log` VALUES (362, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 06:06:49', '2021-01-15 06:06:49');
INSERT INTO `admin_operation_log` VALUES (363, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '[]', '2021-01-15 06:10:05', '2021-01-15 06:10:05');
INSERT INTO `admin_operation_log` VALUES (364, 1, 'admin/user-bet-odds', 'POST', '127.0.0.1', '{\"sum_max\":\"1\",\"sum_min\":\"1\",\"sum_odd\":\"1\",\"sum_even\":\"1\",\"dragon\":\"1\",\"tiger\":\"1\",\"draw\":\"1\",\"before_three_leopard\":\"1\",\"before_three_straight\":\"1\",\"before_three_two_pairs\":\"1\",\"before_three_half_straight\":\"1\",\"before_three_discrete\":\"1\",\"middle_three_leopard\":\"1\",\"middle_three_straight\":\"1\",\"middle_three_two_pairs\":\"1\",\"middle_three_half_straight\":\"1\",\"middle_three_discrete\":\"1\",\"after_three_leopard\":\"1\",\"after_three_straight\":\"1\",\"after_three_two_pairs\":\"1\",\"after_three_half_straight\":\"1\",\"after_three_discrete\":\"1\",\"first_max\":\"1\",\"first_min\":\"1\",\"first_odd\":\"1\",\"first_even\":\"1\",\"first_0\":\"1\",\"first_1\":\"1\",\"first_2\":\"1\",\"first_3\":\"1\",\"first_4\":\"1\",\"first_5\":\"1\",\"first_6\":\"1\",\"first_8\":\"1\",\"first_9\":\"1\",\"second_max\":\"1\",\"second_min\":\"1\",\"second_odd\":\"1\",\"second_even\":\"1\",\"second_0\":\"1\",\"second_1\":\"1\",\"second_2\":\"1\",\"second_3\":\"1\",\"second_4\":\"1\",\"second_5\":\"1\",\"second_6\":\"1\",\"second_8\":\"1\",\"second_9\":\"1\",\"third_max\":\"1\",\"third_min\":\"1\",\"third_odd\":\"1\",\"third_even\":\"1\",\"third_0\":\"1\",\"third_1\":\"1\",\"third_2\":\"1\",\"third_3\":\"1\",\"third_4\":\"1\",\"third_5\":\"1\",\"third_6\":\"1\",\"third_8\":\"1\",\"third_9\":\"1\",\"fourth_max\":\"1\",\"fourth_min\":\"1\",\"fourth_odd\":\"1\",\"fourth_even\":\"1\",\"fourth_0\":\"1\",\"fourth_1\":\"1\",\"fourth_2\":\"1\",\"fourth_3\":\"1\",\"fourth_4\":\"1\",\"fourth_5\":\"1\",\"fourth_6\":\"1\",\"fourth_8\":\"1\",\"fourth_9\":\"1\",\"fifth_max\":\"1\",\"fifth_min\":\"1\",\"fifth_odd\":\"1\",\"fifth_even\":\"1\",\"fifth_0\":\"1\",\"fifth_1\":\"1\",\"fifth_2\":\"1\",\"fifth_3\":\"1\",\"fifth_4\":\"1\",\"fifth_5\":\"1\",\"fifth_6\":\"1\",\"fifth_8\":\"1\",\"fifth_9\":\"1\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\"}', '2021-01-15 06:10:07', '2021-01-15 06:10:07');
INSERT INTO `admin_operation_log` VALUES (365, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 06:10:08', '2021-01-15 06:10:08');
INSERT INTO `admin_operation_log` VALUES (366, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:11:43', '2021-01-15 06:11:43');
INSERT INTO `admin_operation_log` VALUES (367, 1, 'admin/user-bet-odds', 'POST', '127.0.0.1', '{\"sum_max\":\"1\",\"sum_min\":\"1\",\"sum_odd\":\"1\",\"sum_even\":\"1\",\"dragon\":\"1\",\"tiger\":\"1\",\"draw\":\"1\",\"before_three_leopard\":\"1\",\"before_three_straight\":\"1\",\"before_three_two_pairs\":\"1\",\"before_three_half_straight\":\"1\",\"before_three_discrete\":\"1\",\"middle_three_leopard\":\"1\",\"middle_three_straight\":\"1\",\"middle_three_two_pairs\":\"1\",\"middle_three_half_straight\":\"1\",\"middle_three_discrete\":\"1\",\"after_three_leopard\":\"1\",\"after_three_straight\":\"1\",\"after_three_two_pairs\":\"1\",\"after_three_half_straight\":\"1\",\"after_three_discrete\":\"1\",\"first_max\":\"1\",\"first_min\":\"1\",\"first_odd\":\"1\",\"first_even\":\"1\",\"first_0\":\"1\",\"first_1\":\"1\",\"first_2\":\"1\",\"first_3\":\"1\",\"first_4\":\"1\",\"first_5\":\"1\",\"first_6\":\"1\",\"first_8\":\"1\",\"first_9\":\"1\",\"second_max\":\"1\",\"second_min\":\"1\",\"second_odd\":\"1\",\"second_even\":\"1\",\"second_0\":\"1\",\"second_1\":\"1\",\"second_2\":\"1\",\"second_3\":\"1\",\"second_4\":\"1\",\"second_5\":\"1\",\"second_6\":\"1\",\"second_8\":\"1\",\"second_9\":\"1\",\"third_max\":\"1\",\"third_min\":\"1\",\"third_odd\":\"1\",\"third_even\":\"1\",\"third_0\":\"1\",\"third_1\":\"1\",\"third_2\":\"1\",\"third_3\":\"1\",\"third_4\":\"1\",\"third_5\":\"1\",\"third_6\":\"1\",\"third_8\":\"1\",\"third_9\":\"1\",\"fourth_max\":\"1\",\"fourth_min\":\"1\",\"fourth_odd\":\"1\",\"fourth_even\":\"1\",\"fourth_0\":\"1\",\"fourth_1\":\"1\",\"fourth_2\":\"1\",\"fourth_3\":\"1\",\"fourth_4\":\"1\",\"fourth_5\":\"1\",\"fourth_6\":\"1\",\"fourth_8\":\"1\",\"fourth_9\":\"1\",\"fifth_max\":\"1\",\"fifth_min\":\"1\",\"fifth_odd\":\"1\",\"fifth_even\":\"1\",\"fifth_0\":\"1\",\"fifth_1\":\"1\",\"fifth_2\":\"1\",\"fifth_3\":\"1\",\"fifth_4\":\"1\",\"fifth_5\":\"1\",\"fifth_6\":\"1\",\"fifth_8\":\"1\",\"fifth_9\":\"1\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/user-bet-odds\"}', '2021-01-15 06:11:45', '2021-01-15 06:11:45');
INSERT INTO `admin_operation_log` VALUES (368, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 06:11:46', '2021-01-15 06:11:46');
INSERT INTO `admin_operation_log` VALUES (369, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 06:12:46', '2021-01-15 06:12:46');
INSERT INTO `admin_operation_log` VALUES (370, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:12:47', '2021-01-15 06:12:47');
INSERT INTO `admin_operation_log` VALUES (371, 1, 'admin/user-bet-odds', 'POST', '127.0.0.1', '{\"sum_max\":\"1\",\"sum_min\":\"1\",\"sum_odd\":\"1\",\"sum_even\":\"1\",\"dragon\":\"1\",\"tiger\":\"1\",\"draw\":\"1\",\"before_three_leopard\":\"1\",\"before_three_straight\":\"1\",\"before_three_two_pairs\":\"1\",\"before_three_half_straight\":\"1\",\"before_three_discrete\":\"1\",\"middle_three_leopard\":\"1\",\"middle_three_straight\":\"1\",\"middle_three_two_pairs\":\"1\",\"middle_three_half_straight\":\"1\",\"middle_three_discrete\":\"1\",\"after_three_leopard\":\"1\",\"after_three_straight\":\"1\",\"after_three_two_pairs\":\"1\",\"after_three_half_straight\":\"1\",\"after_three_discrete\":\"1\",\"first_max\":\"1\",\"first_min\":\"1\",\"first_odd\":\"1\",\"first_even\":\"1\",\"first_0\":\"1\",\"first_1\":\"1\",\"first_2\":\"1\",\"first_3\":\"1\",\"first_4\":\"1\",\"first_5\":\"1\",\"first_6\":\"1\",\"first_8\":\"1\",\"first_9\":\"1\",\"second_max\":\"1\",\"second_min\":\"1\",\"second_odd\":\"1\",\"second_even\":\"1\",\"second_0\":\"1\",\"second_1\":\"1\",\"second_2\":\"1\",\"second_3\":\"1\",\"second_4\":\"1\",\"second_5\":\"1\",\"second_6\":\"1\",\"second_8\":\"1\",\"second_9\":\"1\",\"third_max\":\"1\",\"third_min\":\"1\",\"third_odd\":\"1\",\"third_even\":\"1\",\"third_0\":\"1\",\"third_1\":\"1\",\"third_2\":\"1\",\"third_3\":\"1\",\"third_4\":\"1\",\"third_5\":\"1\",\"third_6\":\"1\",\"third_8\":\"1\",\"third_9\":\"1\",\"fourth_max\":\"1\",\"fourth_min\":\"1\",\"fourth_odd\":\"1\",\"fourth_even\":\"1\",\"fourth_0\":\"1\",\"fourth_1\":\"1\",\"fourth_2\":\"1\",\"fourth_3\":\"1\",\"fourth_4\":\"1\",\"fourth_5\":\"1\",\"fourth_6\":\"1\",\"fourth_8\":\"1\",\"fourth_9\":\"1\",\"fifth_max\":\"1\",\"fifth_min\":\"1\",\"fifth_odd\":\"1\",\"fifth_even\":\"1\",\"fifth_0\":\"1\",\"fifth_1\":\"1\",\"fifth_2\":\"1\",\"fifth_3\":\"1\",\"fifth_4\":\"1\",\"fifth_5\":\"1\",\"fifth_6\":\"1\",\"fifth_8\":\"1\",\"fifth_9\":\"1\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/user-bet-odds\"}', '2021-01-15 06:12:50', '2021-01-15 06:12:50');
INSERT INTO `admin_operation_log` VALUES (372, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 06:12:50', '2021-01-15 06:12:50');
INSERT INTO `admin_operation_log` VALUES (373, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 06:13:02', '2021-01-15 06:13:02');
INSERT INTO `admin_operation_log` VALUES (374, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:13:03', '2021-01-15 06:13:03');
INSERT INTO `admin_operation_log` VALUES (375, 1, 'admin/user-bet-odds', 'POST', '127.0.0.1', '{\"sum_max\":\"1\",\"sum_min\":\"1\",\"sum_odd\":\"1\",\"sum_even\":\"1\",\"dragon\":\"1\",\"tiger\":\"1\",\"draw\":\"1\",\"before_three_leopard\":\"1\",\"before_three_straight\":\"1\",\"before_three_two_pairs\":\"1\",\"before_three_half_straight\":\"1\",\"before_three_discrete\":\"1\",\"middle_three_leopard\":\"1\",\"middle_three_straight\":\"1\",\"middle_three_two_pairs\":\"1\",\"middle_three_half_straight\":\"1\",\"middle_three_discrete\":\"1\",\"after_three_leopard\":\"1\",\"after_three_straight\":\"1\",\"after_three_two_pairs\":\"1\",\"after_three_half_straight\":\"1\",\"after_three_discrete\":\"1\",\"first_max\":\"1\",\"first_min\":\"1\",\"first_odd\":\"1\",\"first_even\":\"1\",\"first_0\":\"1\",\"first_1\":\"1\",\"first_2\":\"1\",\"first_3\":\"1\",\"first_4\":\"1\",\"first_5\":\"1\",\"first_6\":\"1\",\"first_8\":\"1\",\"first_9\":\"1\",\"second_max\":\"1\",\"second_min\":\"1\",\"second_odd\":\"1\",\"second_even\":\"1\",\"second_0\":\"1\",\"second_1\":\"1\",\"second_2\":\"1\",\"second_3\":\"1\",\"second_4\":\"1\",\"second_5\":\"1\",\"second_6\":\"1\",\"second_8\":\"1\",\"second_9\":\"1\",\"third_max\":\"1\",\"third_min\":\"1\",\"third_odd\":\"1\",\"third_even\":\"1\",\"third_0\":\"1\",\"third_1\":\"1\",\"third_2\":\"1\",\"third_3\":\"1\",\"third_4\":\"1\",\"third_5\":\"1\",\"third_6\":\"1\",\"third_8\":\"1\",\"third_9\":\"1\",\"fourth_max\":\"1\",\"fourth_min\":\"1\",\"fourth_odd\":\"1\",\"fourth_even\":\"1\",\"fourth_0\":\"1\",\"fourth_1\":\"1\",\"fourth_2\":\"1\",\"fourth_3\":\"1\",\"fourth_4\":\"1\",\"fourth_5\":\"1\",\"fourth_6\":\"1\",\"fourth_8\":\"1\",\"fourth_9\":\"1\",\"fifth_max\":\"1\",\"fifth_min\":\"1\",\"fifth_odd\":\"1\",\"fifth_even\":\"1\",\"fifth_0\":\"1\",\"fifth_1\":\"1\",\"fifth_2\":\"1\",\"fifth_3\":\"1\",\"fifth_4\":\"1\",\"fifth_5\":\"1\",\"fifth_6\":\"1\",\"fifth_8\":\"1\",\"fifth_9\":\"1\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/user-bet-odds\"}', '2021-01-15 06:13:06', '2021-01-15 06:13:06');
INSERT INTO `admin_operation_log` VALUES (376, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 06:13:06', '2021-01-15 06:13:06');
INSERT INTO `admin_operation_log` VALUES (377, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-01-15 06:13:59', '2021-01-15 06:13:59');
INSERT INTO `admin_operation_log` VALUES (378, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:14:04', '2021-01-15 06:14:04');
INSERT INTO `admin_operation_log` VALUES (379, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:14:05', '2021-01-15 06:14:05');
INSERT INTO `admin_operation_log` VALUES (380, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:14:13', '2021-01-15 06:14:13');
INSERT INTO `admin_operation_log` VALUES (381, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:14:15', '2021-01-15 06:14:15');
INSERT INTO `admin_operation_log` VALUES (382, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 06:14:21', '2021-01-15 06:14:21');
INSERT INTO `admin_operation_log` VALUES (383, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 06:14:24', '2021-01-15 06:14:24');
INSERT INTO `admin_operation_log` VALUES (384, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 06:14:28', '2021-01-15 06:14:28');
INSERT INTO `admin_operation_log` VALUES (385, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:14:36', '2021-01-15 06:14:36');
INSERT INTO `admin_operation_log` VALUES (386, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:14:38', '2021-01-15 06:14:38');
INSERT INTO `admin_operation_log` VALUES (387, 1, 'admin/user-bet-odds', 'POST', '127.0.0.1', '{\"sum_max\":\"1\",\"sum_min\":\"1\",\"sum_odd\":\"1\",\"sum_even\":\"1\",\"dragon\":\"1\",\"tiger\":\"1\",\"draw\":\"1\",\"before_three_leopard\":\"1\",\"before_three_straight\":\"1\",\"before_three_two_pairs\":\"1\",\"before_three_half_straight\":\"1\",\"before_three_discrete\":\"1\",\"middle_three_leopard\":\"1\",\"middle_three_straight\":\"1\",\"middle_three_two_pairs\":\"1\",\"middle_three_half_straight\":\"1\",\"middle_three_discrete\":\"1\",\"after_three_leopard\":\"1\",\"after_three_straight\":\"1\",\"after_three_two_pairs\":\"1\",\"after_three_half_straight\":\"1\",\"after_three_discrete\":\"1\",\"first_max\":\"1\",\"first_min\":\"1\",\"first_odd\":\"1\",\"first_even\":\"1\",\"first_0\":\"1\",\"first_1\":\"1\",\"first_2\":\"1\",\"first_3\":\"1\",\"first_4\":\"1\",\"first_5\":\"1\",\"first_6\":\"1\",\"first_8\":\"1\",\"first_9\":\"1\",\"second_max\":\"1\",\"second_min\":\"1\",\"second_odd\":\"1\",\"second_even\":\"1\",\"second_0\":\"1\",\"second_1\":\"1\",\"second_2\":\"1\",\"second_3\":\"1\",\"second_4\":\"1\",\"second_5\":\"1\",\"second_6\":\"1\",\"second_8\":\"1\",\"second_9\":\"1\",\"third_max\":\"1\",\"third_min\":\"1\",\"third_odd\":\"1\",\"third_even\":\"1\",\"third_0\":\"1\",\"third_1\":\"1\",\"third_2\":\"1\",\"third_3\":\"1\",\"third_4\":\"1\",\"third_5\":\"1\",\"third_6\":\"1\",\"third_8\":\"1\",\"third_9\":\"1\",\"fourth_max\":\"1\",\"fourth_min\":\"1\",\"fourth_odd\":\"1\",\"fourth_even\":\"1\",\"fourth_0\":\"1\",\"fourth_1\":\"1\",\"fourth_2\":\"1\",\"fourth_3\":\"1\",\"fourth_4\":\"1\",\"fourth_5\":\"1\",\"fourth_6\":\"1\",\"fourth_8\":\"1\",\"fourth_9\":\"1\",\"fifth_max\":\"1\",\"fifth_min\":\"1\",\"fifth_odd\":\"1\",\"fifth_even\":\"1\",\"fifth_0\":\"1\",\"fifth_1\":\"1\",\"fifth_2\":\"1\",\"fifth_3\":\"1\",\"fifth_4\":\"1\",\"fifth_5\":\"1\",\"fifth_6\":\"1\",\"fifth_8\":\"1\",\"fifth_9\":\"1\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/user-bet-odds\"}', '2021-01-15 06:14:42', '2021-01-15 06:14:42');
INSERT INTO `admin_operation_log` VALUES (388, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 06:14:42', '2021-01-15 06:14:42');
INSERT INTO `admin_operation_log` VALUES (389, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 06:16:50', '2021-01-15 06:16:50');
INSERT INTO `admin_operation_log` VALUES (390, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 06:17:41', '2021-01-15 06:17:41');
INSERT INTO `admin_operation_log` VALUES (391, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 06:17:43', '2021-01-15 06:17:43');
INSERT INTO `admin_operation_log` VALUES (392, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 06:18:02', '2021-01-15 06:18:02');
INSERT INTO `admin_operation_log` VALUES (393, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 06:19:30', '2021-01-15 06:19:30');
INSERT INTO `admin_operation_log` VALUES (394, 1, 'admin/user-bet-odds/6', 'PUT', '127.0.0.1', '{\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"updated_at\":\"2021-01-07 06:14:42\"}', '2021-01-15 06:19:39', '2021-01-15 06:19:39');
INSERT INTO `admin_operation_log` VALUES (395, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 06:23:53', '2021-01-15 06:23:53');
INSERT INTO `admin_operation_log` VALUES (396, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 06:24:11', '2021-01-15 06:24:11');
INSERT INTO `admin_operation_log` VALUES (397, 1, 'admin/user-bet-odds/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:24:14', '2021-01-15 06:24:14');
INSERT INTO `admin_operation_log` VALUES (398, 1, 'admin/user-bet-odds', 'POST', '127.0.0.1', '{\"sum_max\":\"1\",\"sum_min\":\"1\",\"sum_odd\":\"1\",\"sum_even\":\"1\",\"dragon\":\"1\",\"tiger\":\"1\",\"draw\":\"1\",\"before_three_leopard\":\"1\",\"before_three_straight\":\"1\",\"before_three_two_pairs\":\"1\",\"before_three_half_straight\":\"1\",\"before_three_discrete\":\"1\",\"middle_three_leopard\":\"1\",\"middle_three_straight\":\"1\",\"middle_three_two_pairs\":\"1\",\"middle_three_half_straight\":\"1\",\"middle_three_discrete\":\"1\",\"after_three_leopard\":\"1\",\"after_three_straight\":\"1\",\"after_three_two_pairs\":\"1\",\"after_three_half_straight\":\"1\",\"after_three_discrete\":\"1\",\"first_max\":\"1\",\"first_min\":\"1\",\"first_odd\":\"1\",\"first_even\":\"1\",\"first_0\":\"1\",\"first_1\":\"1\",\"first_2\":\"1\",\"first_3\":\"1\",\"first_4\":\"1\",\"first_5\":\"1\",\"first_6\":\"1\",\"first_8\":\"1\",\"first_9\":\"1\",\"second_max\":\"1\",\"second_min\":\"1\",\"second_odd\":\"1\",\"second_even\":\"1\",\"second_0\":\"1\",\"second_1\":\"1\",\"second_2\":\"1\",\"second_3\":\"1\",\"second_4\":\"1\",\"second_5\":\"1\",\"second_6\":\"1\",\"second_8\":\"1\",\"second_9\":\"1\",\"third_max\":\"1\",\"third_min\":\"1\",\"third_odd\":\"1\",\"third_even\":\"1\",\"third_0\":\"1\",\"third_1\":\"1\",\"third_2\":\"1\",\"third_3\":\"1\",\"third_4\":\"1\",\"third_5\":\"1\",\"third_6\":\"1\",\"third_8\":\"1\",\"third_9\":\"1\",\"fourth_max\":\"1\",\"fourth_min\":\"1\",\"fourth_odd\":\"1\",\"fourth_even\":\"1\",\"fourth_0\":\"1\",\"fourth_1\":\"1\",\"fourth_2\":\"1\",\"fourth_3\":\"1\",\"fourth_4\":\"1\",\"fourth_5\":\"1\",\"fourth_6\":\"1\",\"fourth_8\":\"1\",\"fourth_9\":\"1\",\"fifth_max\":\"1\",\"fifth_min\":\"1\",\"fifth_odd\":\"1\",\"fifth_even\":\"1\",\"fifth_0\":\"1\",\"fifth_1\":\"1\",\"fifth_2\":\"1\",\"fifth_3\":\"1\",\"fifth_4\":\"1\",\"fifth_5\":\"1\",\"fifth_6\":\"1\",\"fifth_8\":\"1\",\"fifth_9\":\"1\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/user-bet-odds\"}', '2021-01-15 06:24:16', '2021-01-15 06:24:16');
INSERT INTO `admin_operation_log` VALUES (399, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 06:24:16', '2021-01-15 06:24:16');
INSERT INTO `admin_operation_log` VALUES (400, 1, 'admin/user-bet-odds/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:24:21', '2021-01-15 06:24:21');
INSERT INTO `admin_operation_log` VALUES (401, 1, 'admin/user-bet-odds/7', 'PUT', '127.0.0.1', '{\"sum_max\":\"1\",\"sum_min\":\"1\",\"sum_odd\":\"1\",\"sum_even\":\"1\",\"dragon\":\"1\",\"tiger\":\"1\",\"draw\":\"1\",\"before_three_leopard\":\"1\",\"before_three_straight\":\"1\",\"before_three_two_pairs\":\"1\",\"before_three_half_straight\":\"1\",\"before_three_discrete\":\"1\",\"middle_three_leopard\":\"1\",\"middle_three_straight\":\"1\",\"middle_three_two_pairs\":\"1\",\"middle_three_half_straight\":\"1\",\"middle_three_discrete\":\"1\",\"after_three_leopard\":\"1\",\"after_three_straight\":\"1\",\"after_three_two_pairs\":\"1\",\"after_three_half_straight\":\"1\",\"after_three_discrete\":\"1\",\"first_max\":\"1\",\"first_min\":\"1\",\"first_odd\":\"1\",\"first_even\":\"1\",\"first_0\":\"1\",\"first_1\":\"1\",\"first_2\":\"1\",\"first_3\":\"1\",\"first_4\":\"1\",\"first_5\":\"1\",\"first_6\":\"1\",\"first_8\":\"1\",\"first_9\":\"1\",\"second_max\":\"1\",\"second_min\":\"1\",\"second_odd\":\"1\",\"second_even\":\"1\",\"second_0\":\"1\",\"second_1\":\"1\",\"second_2\":\"1\",\"second_3\":\"1\",\"second_4\":\"1\",\"second_5\":\"1\",\"second_6\":\"1\",\"second_8\":\"1\",\"second_9\":\"1\",\"third_max\":\"1\",\"third_min\":\"1\",\"third_odd\":\"1\",\"third_even\":\"1\",\"third_0\":\"1\",\"third_1\":\"1\",\"third_2\":\"1\",\"third_3\":\"1\",\"third_4\":\"1\",\"third_5\":\"1\",\"third_6\":\"1\",\"third_8\":\"1\",\"third_9\":\"1\",\"fourth_max\":\"1\",\"fourth_min\":\"1\",\"fourth_odd\":\"1\",\"fourth_even\":\"1\",\"fourth_0\":\"1\",\"fourth_1\":\"1\",\"fourth_2\":\"1\",\"fourth_3\":\"1\",\"fourth_4\":\"1\",\"fourth_5\":\"1\",\"fourth_6\":\"1\",\"fourth_8\":\"1\",\"fourth_9\":\"1\",\"fifth_max\":\"1\",\"fifth_min\":\"1\",\"fifth_odd\":\"1\",\"fifth_even\":\"1\",\"fifth_0\":\"1\",\"fifth_1\":\"1\",\"fifth_2\":\"1\",\"fifth_3\":\"1\",\"fifth_4\":\"1\",\"fifth_5\":\"1\",\"fifth_6\":\"1\",\"fifth_8\":\"1\",\"fifth_9\":\"1\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/user-bet-odds\"}', '2021-01-15 06:24:26', '2021-01-15 06:24:26');
INSERT INTO `admin_operation_log` VALUES (402, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 06:24:27', '2021-01-15 06:24:27');
INSERT INTO `admin_operation_log` VALUES (403, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 06:25:50', '2021-01-15 06:25:50');
INSERT INTO `admin_operation_log` VALUES (404, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 06:26:00', '2021-01-15 06:26:00');
INSERT INTO `admin_operation_log` VALUES (405, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '[]', '2021-01-15 06:27:30', '2021-01-15 06:27:30');
INSERT INTO `admin_operation_log` VALUES (406, 1, 'admin/user-bet-odds/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:27:44', '2021-01-15 06:27:44');
INSERT INTO `admin_operation_log` VALUES (407, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:42:35', '2021-01-15 06:42:35');
INSERT INTO `admin_operation_log` VALUES (408, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:42:39', '2021-01-15 06:42:39');
INSERT INTO `admin_operation_log` VALUES (409, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 06:42:42', '2021-01-15 06:42:42');
INSERT INTO `admin_operation_log` VALUES (410, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 06:47:37', '2021-01-15 06:47:37');
INSERT INTO `admin_operation_log` VALUES (411, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:47:40', '2021-01-15 06:47:40');
INSERT INTO `admin_operation_log` VALUES (412, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 06:47:47', '2021-01-15 06:47:47');
INSERT INTO `admin_operation_log` VALUES (413, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:47:50', '2021-01-15 06:47:50');
INSERT INTO `admin_operation_log` VALUES (414, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:47:53', '2021-01-15 06:47:53');
INSERT INTO `admin_operation_log` VALUES (415, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 06:53:10', '2021-01-15 06:53:10');
INSERT INTO `admin_operation_log` VALUES (416, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 06:54:07', '2021-01-15 06:54:07');
INSERT INTO `admin_operation_log` VALUES (417, 1, 'admin/user-bet-odds', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:54:15', '2021-01-15 06:54:15');
INSERT INTO `admin_operation_log` VALUES (418, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:54:18', '2021-01-15 06:54:18');
INSERT INTO `admin_operation_log` VALUES (419, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:54:20', '2021-01-15 06:54:20');
INSERT INTO `admin_operation_log` VALUES (420, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 06:54:27', '2021-01-15 06:54:27');
INSERT INTO `admin_operation_log` VALUES (421, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:54:28', '2021-01-15 06:54:28');
INSERT INTO `admin_operation_log` VALUES (422, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 06:54:29', '2021-01-15 06:54:29');
INSERT INTO `admin_operation_log` VALUES (423, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 06:54:30', '2021-01-15 06:54:30');
INSERT INTO `admin_operation_log` VALUES (424, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:54:34', '2021-01-15 06:54:34');
INSERT INTO `admin_operation_log` VALUES (425, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 06:54:34', '2021-01-15 06:54:34');
INSERT INTO `admin_operation_log` VALUES (426, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 06:55:57', '2021-01-15 06:55:57');
INSERT INTO `admin_operation_log` VALUES (427, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:55:59', '2021-01-15 06:55:59');
INSERT INTO `admin_operation_log` VALUES (428, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 06:56:00', '2021-01-15 06:56:00');
INSERT INTO `admin_operation_log` VALUES (429, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 06:58:33', '2021-01-15 06:58:33');
INSERT INTO `admin_operation_log` VALUES (430, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:58:35', '2021-01-15 06:58:35');
INSERT INTO `admin_operation_log` VALUES (431, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 06:58:36', '2021-01-15 06:58:36');
INSERT INTO `admin_operation_log` VALUES (432, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:58:38', '2021-01-15 06:58:38');
INSERT INTO `admin_operation_log` VALUES (433, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 06:58:38', '2021-01-15 06:58:38');
INSERT INTO `admin_operation_log` VALUES (434, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:58:40', '2021-01-15 06:58:40');
INSERT INTO `admin_operation_log` VALUES (435, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 06:58:40', '2021-01-15 06:58:40');
INSERT INTO `admin_operation_log` VALUES (436, 1, 'admin/user-bets/1/edit', 'GET', '127.0.0.1', '[]', '2021-01-15 06:58:48', '2021-01-15 06:58:48');
INSERT INTO `admin_operation_log` VALUES (437, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 06:58:50', '2021-01-15 06:58:50');
INSERT INTO `admin_operation_log` VALUES (438, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 06:59:32', '2021-01-15 06:59:32');
INSERT INTO `admin_operation_log` VALUES (439, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 06:59:52', '2021-01-15 06:59:52');
INSERT INTO `admin_operation_log` VALUES (440, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 07:00:28', '2021-01-15 07:00:28');
INSERT INTO `admin_operation_log` VALUES (441, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 07:00:43', '2021-01-15 07:00:43');
INSERT INTO `admin_operation_log` VALUES (442, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 07:03:02', '2021-01-15 07:03:02');
INSERT INTO `admin_operation_log` VALUES (443, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 07:06:02', '2021-01-15 07:06:02');
INSERT INTO `admin_operation_log` VALUES (444, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_UserBet\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\",\"_action\":\"App_Admin_Actions_Bet_PrintBet\"}', '2021-01-15 07:06:07', '2021-01-15 07:06:07');
INSERT INTO `admin_operation_log` VALUES (445, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 07:06:08', '2021-01-15 07:06:08');
INSERT INTO `admin_operation_log` VALUES (446, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_UserBet\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\",\"_action\":\"App_Admin_Actions_Bet_PrintBet\"}', '2021-01-15 07:06:21', '2021-01-15 07:06:21');
INSERT INTO `admin_operation_log` VALUES (447, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 07:06:21', '2021-01-15 07:06:21');
INSERT INTO `admin_operation_log` VALUES (448, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_UserBet\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\",\"_action\":\"App_Admin_Actions_Bet_PrintBet\"}', '2021-01-15 07:06:44', '2021-01-15 07:06:44');
INSERT INTO `admin_operation_log` VALUES (449, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_UserBet\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\",\"_action\":\"App_Admin_Actions_Bet_PrintBet\"}', '2021-01-15 07:06:51', '2021-01-15 07:06:51');
INSERT INTO `admin_operation_log` VALUES (450, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_UserBet\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\",\"_action\":\"App_Admin_Actions_Bet_PrintBet\"}', '2021-01-15 07:12:00', '2021-01-15 07:12:00');
INSERT INTO `admin_operation_log` VALUES (451, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 07:13:10', '2021-01-15 07:13:10');
INSERT INTO `admin_operation_log` VALUES (452, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 07:13:21', '2021-01-15 07:13:21');
INSERT INTO `admin_operation_log` VALUES (453, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 07:14:19', '2021-01-15 07:14:19');
INSERT INTO `admin_operation_log` VALUES (454, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 07:15:39', '2021-01-15 07:15:39');
INSERT INTO `admin_operation_log` VALUES (455, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 07:15:45', '2021-01-15 07:15:45');
INSERT INTO `admin_operation_log` VALUES (456, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_UserBet\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\",\"_action\":\"App_Admin_Actions_Bet_PrintBet\"}', '2021-01-15 07:15:49', '2021-01-15 07:15:49');
INSERT INTO `admin_operation_log` VALUES (457, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 07:15:49', '2021-01-15 07:15:49');
INSERT INTO `admin_operation_log` VALUES (458, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 07:16:11', '2021-01-15 07:16:11');
INSERT INTO `admin_operation_log` VALUES (459, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 07:16:19', '2021-01-15 07:16:19');
INSERT INTO `admin_operation_log` VALUES (460, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 07:35:26', '2021-01-15 07:35:26');
INSERT INTO `admin_operation_log` VALUES (461, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-01-15 08:12:39', '2021-01-15 08:12:39');
INSERT INTO `admin_operation_log` VALUES (462, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-01-15 08:27:02', '2021-01-15 08:27:02');
INSERT INTO `admin_operation_log` VALUES (463, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 08:28:35', '2021-01-15 08:28:35');
INSERT INTO `admin_operation_log` VALUES (464, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 08:28:39', '2021-01-15 08:28:39');
INSERT INTO `admin_operation_log` VALUES (465, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 08:28:43', '2021-01-15 08:28:43');
INSERT INTO `admin_operation_log` VALUES (466, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 08:29:54', '2021-01-15 08:29:54');
INSERT INTO `admin_operation_log` VALUES (467, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 08:30:19', '2021-01-15 08:30:19');
INSERT INTO `admin_operation_log` VALUES (468, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 08:32:34', '2021-01-15 08:32:34');
INSERT INTO `admin_operation_log` VALUES (469, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 08:32:41', '2021-01-15 08:32:41');
INSERT INTO `admin_operation_log` VALUES (470, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 08:33:10', '2021-01-15 08:33:10');
INSERT INTO `admin_operation_log` VALUES (471, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 08:33:24', '2021-01-15 08:33:24');
INSERT INTO `admin_operation_log` VALUES (472, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 08:36:09', '2021-01-15 08:36:09');
INSERT INTO `admin_operation_log` VALUES (473, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 08:36:59', '2021-01-15 08:36:59');
INSERT INTO `admin_operation_log` VALUES (474, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 08:37:18', '2021-01-15 08:37:18');
INSERT INTO `admin_operation_log` VALUES (475, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 08:37:24', '2021-01-15 08:37:24');
INSERT INTO `admin_operation_log` VALUES (476, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 08:37:37', '2021-01-15 08:37:37');
INSERT INTO `admin_operation_log` VALUES (477, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 08:37:46', '2021-01-15 08:37:46');
INSERT INTO `admin_operation_log` VALUES (478, 1, 'admin/user-bets', 'GET', '127.0.0.1', '[]', '2021-01-15 08:37:54', '2021-01-15 08:37:54');
INSERT INTO `admin_operation_log` VALUES (479, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-01-15 09:44:53', '2021-01-15 09:44:53');
INSERT INTO `admin_operation_log` VALUES (480, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 09:44:56', '2021-01-15 09:44:56');
INSERT INTO `admin_operation_log` VALUES (481, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 09:44:59', '2021-01-15 09:44:59');
INSERT INTO `admin_operation_log` VALUES (482, 1, 'admin/user-bets', 'POST', '127.0.0.1', '{\"sum_max\":\"0\",\"sum_min\":\"0\",\"sum_odd\":\"0\",\"sum_even\":\"0\",\"dragon\":\"0\",\"tiger\":\"0\",\"draw\":\"0\",\"before_three_leopard\":\"0\",\"before_three_straight\":\"0\",\"before_three_two_pairs\":\"0\",\"before_three_half_straight\":\"0\",\"before_three_discrete\":\"0\",\"middle_three_leopard\":\"0\",\"middle_three_straight\":\"0\",\"middle_three_two_pairs\":\"0\",\"middle_three_half_straight\":\"0\",\"middle_three_discrete\":\"0\",\"after_three_leopard\":\"0\",\"after_three_straight\":\"0\",\"after_three_two_pairs\":\"0\",\"after_three_half_straight\":\"0\",\"after_three_discrete\":\"0\",\"first_max\":\"0\",\"first_min\":\"0\",\"first_odd\":\"0\",\"first_even\":\"0\",\"first_0\":\"0\",\"first_1\":\"0\",\"first_2\":\"0\",\"first_3\":\"0\",\"first_4\":\"0\",\"first_5\":\"0\",\"first_6\":\"0\",\"first_8\":\"0\",\"first_9\":\"0\",\"second_max\":\"0\",\"second_min\":\"0\",\"second_odd\":\"0\",\"second_even\":\"0\",\"second_0\":\"0\",\"second_1\":\"0\",\"second_2\":\"0\",\"second_3\":\"0\",\"second_4\":\"0\",\"second_5\":\"0\",\"second_6\":\"0\",\"second_8\":\"0\",\"second_9\":\"0\",\"third_max\":\"0\",\"third_min\":\"0\",\"third_odd\":\"0\",\"third_even\":\"0\",\"third_0\":\"0\",\"third_1\":\"0\",\"third_2\":\"0\",\"third_3\":\"0\",\"third_4\":\"0\",\"third_5\":\"0\",\"third_6\":\"0\",\"third_8\":\"0\",\"third_9\":\"0\",\"fourth_max\":\"0\",\"fourth_min\":\"0\",\"fourth_odd\":\"0\",\"fourth_even\":\"0\",\"fourth_0\":\"0\",\"fourth_1\":\"0\",\"fourth_2\":\"0\",\"fourth_3\":\"0\",\"fourth_4\":\"0\",\"fourth_5\":\"0\",\"fourth_6\":\"0\",\"fourth_8\":\"0\",\"fourth_9\":\"0\",\"fifth_max\":\"0\",\"fifth_min\":\"0\",\"fifth_odd\":\"0\",\"fifth_even\":\"0\",\"fifth_0\":\"0\",\"fifth_1\":\"0\",\"fifth_2\":\"0\",\"fifth_3\":\"0\",\"fifth_4\":\"0\",\"fifth_5\":\"0\",\"fifth_6\":\"0\",\"fifth_8\":\"0\",\"fifth_9\":\"0\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/user-bets\"}', '2021-01-15 09:45:09', '2021-01-15 09:45:09');
INSERT INTO `admin_operation_log` VALUES (483, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 09:45:09', '2021-01-15 09:45:09');
INSERT INTO `admin_operation_log` VALUES (484, 1, 'admin/user-bets', 'POST', '127.0.0.1', '{\"sum_max\":\"0\",\"sum_min\":\"0\",\"sum_odd\":\"0\",\"sum_even\":\"0\",\"dragon\":\"0\",\"tiger\":\"0\",\"draw\":\"0\",\"before_three_leopard\":\"0\",\"before_three_straight\":\"0\",\"before_three_two_pairs\":\"0\",\"before_three_half_straight\":\"0\",\"before_three_discrete\":\"0\",\"middle_three_leopard\":\"0\",\"middle_three_straight\":\"0\",\"middle_three_two_pairs\":\"0\",\"middle_three_half_straight\":\"0\",\"middle_three_discrete\":\"0\",\"after_three_leopard\":\"0\",\"after_three_straight\":\"0\",\"after_three_two_pairs\":\"0\",\"after_three_half_straight\":\"0\",\"after_three_discrete\":\"0\",\"first_max\":\"0\",\"first_min\":\"0\",\"first_odd\":\"0\",\"first_even\":\"0\",\"first_0\":\"0\",\"first_1\":\"0\",\"first_2\":\"0\",\"first_3\":\"0\",\"first_4\":\"0\",\"first_5\":\"0\",\"first_6\":\"0\",\"first_8\":\"0\",\"first_9\":\"0\",\"second_max\":\"0\",\"second_min\":\"0\",\"second_odd\":\"0\",\"second_even\":\"0\",\"second_0\":\"0\",\"second_1\":\"0\",\"second_2\":\"0\",\"second_3\":\"0\",\"second_4\":\"0\",\"second_5\":\"0\",\"second_6\":\"0\",\"second_8\":\"0\",\"second_9\":\"0\",\"third_max\":\"0\",\"third_min\":\"0\",\"third_odd\":\"0\",\"third_even\":\"0\",\"third_0\":\"0\",\"third_1\":\"0\",\"third_2\":\"0\",\"third_3\":\"0\",\"third_4\":\"0\",\"third_5\":\"0\",\"third_6\":\"0\",\"third_8\":\"0\",\"third_9\":\"0\",\"fourth_max\":\"0\",\"fourth_min\":\"0\",\"fourth_odd\":\"0\",\"fourth_even\":\"0\",\"fourth_0\":\"0\",\"fourth_1\":\"0\",\"fourth_2\":\"0\",\"fourth_3\":\"0\",\"fourth_4\":\"0\",\"fourth_5\":\"0\",\"fourth_6\":\"0\",\"fourth_8\":\"0\",\"fourth_9\":\"0\",\"fifth_max\":\"0\",\"fifth_min\":\"0\",\"fifth_odd\":\"0\",\"fifth_even\":\"0\",\"fifth_0\":\"0\",\"fifth_1\":\"0\",\"fifth_2\":\"0\",\"fifth_3\":\"0\",\"fifth_4\":\"0\",\"fifth_5\":\"0\",\"fifth_6\":\"0\",\"fifth_8\":\"0\",\"fifth_9\":\"0\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\"}', '2021-01-15 09:45:53', '2021-01-15 09:45:53');
INSERT INTO `admin_operation_log` VALUES (485, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 09:45:53', '2021-01-15 09:45:53');
INSERT INTO `admin_operation_log` VALUES (486, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 09:46:16', '2021-01-15 09:46:16');
INSERT INTO `admin_operation_log` VALUES (487, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 09:46:17', '2021-01-15 09:46:17');
INSERT INTO `admin_operation_log` VALUES (488, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:14:13', '2021-01-15 10:14:13');
INSERT INTO `admin_operation_log` VALUES (489, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:14:25', '2021-01-15 10:14:25');
INSERT INTO `admin_operation_log` VALUES (490, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:14:33', '2021-01-15 10:14:33');
INSERT INTO `admin_operation_log` VALUES (491, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:14:50', '2021-01-15 10:14:50');
INSERT INTO `admin_operation_log` VALUES (492, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:15:54', '2021-01-15 10:15:54');
INSERT INTO `admin_operation_log` VALUES (493, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:17:47', '2021-01-15 10:17:47');
INSERT INTO `admin_operation_log` VALUES (494, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:17:58', '2021-01-15 10:17:58');
INSERT INTO `admin_operation_log` VALUES (495, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:18:06', '2021-01-15 10:18:06');
INSERT INTO `admin_operation_log` VALUES (496, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:18:16', '2021-01-15 10:18:16');
INSERT INTO `admin_operation_log` VALUES (497, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:18:34', '2021-01-15 10:18:34');
INSERT INTO `admin_operation_log` VALUES (498, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:19:37', '2021-01-15 10:19:37');
INSERT INTO `admin_operation_log` VALUES (499, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:19:48', '2021-01-15 10:19:48');
INSERT INTO `admin_operation_log` VALUES (500, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:19:56', '2021-01-15 10:19:56');
INSERT INTO `admin_operation_log` VALUES (501, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:20:05', '2021-01-15 10:20:05');
INSERT INTO `admin_operation_log` VALUES (502, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:20:16', '2021-01-15 10:20:16');
INSERT INTO `admin_operation_log` VALUES (503, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:20:47', '2021-01-15 10:20:47');
INSERT INTO `admin_operation_log` VALUES (504, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:23:23', '2021-01-15 10:23:23');
INSERT INTO `admin_operation_log` VALUES (505, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:23:30', '2021-01-15 10:23:30');
INSERT INTO `admin_operation_log` VALUES (506, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:23:38', '2021-01-15 10:23:38');
INSERT INTO `admin_operation_log` VALUES (507, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:23:45', '2021-01-15 10:23:45');
INSERT INTO `admin_operation_log` VALUES (508, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 10:24:32', '2021-01-15 10:24:32');
INSERT INTO `admin_operation_log` VALUES (509, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 10:24:36', '2021-01-15 10:24:36');
INSERT INTO `admin_operation_log` VALUES (510, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:24:47', '2021-01-15 10:24:47');
INSERT INTO `admin_operation_log` VALUES (511, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:25:00', '2021-01-15 10:25:00');
INSERT INTO `admin_operation_log` VALUES (512, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:25:16', '2021-01-15 10:25:16');
INSERT INTO `admin_operation_log` VALUES (513, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:25:23', '2021-01-15 10:25:23');
INSERT INTO `admin_operation_log` VALUES (514, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:27:13', '2021-01-15 10:27:13');
INSERT INTO `admin_operation_log` VALUES (515, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:27:21', '2021-01-15 10:27:21');
INSERT INTO `admin_operation_log` VALUES (516, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:27:56', '2021-01-15 10:27:56');
INSERT INTO `admin_operation_log` VALUES (517, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:28:31', '2021-01-15 10:28:31');
INSERT INTO `admin_operation_log` VALUES (518, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:28:41', '2021-01-15 10:28:41');
INSERT INTO `admin_operation_log` VALUES (519, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:28:48', '2021-01-15 10:28:48');
INSERT INTO `admin_operation_log` VALUES (520, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:30:26', '2021-01-15 10:30:26');
INSERT INTO `admin_operation_log` VALUES (521, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:31:20', '2021-01-15 10:31:20');
INSERT INTO `admin_operation_log` VALUES (522, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:32:05', '2021-01-15 10:32:05');
INSERT INTO `admin_operation_log` VALUES (523, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:33:57', '2021-01-15 10:33:57');
INSERT INTO `admin_operation_log` VALUES (524, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:34:30', '2021-01-15 10:34:30');
INSERT INTO `admin_operation_log` VALUES (525, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:35:45', '2021-01-15 10:35:45');
INSERT INTO `admin_operation_log` VALUES (526, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:35:56', '2021-01-15 10:35:56');
INSERT INTO `admin_operation_log` VALUES (527, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:35:59', '2021-01-15 10:35:59');
INSERT INTO `admin_operation_log` VALUES (528, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:36:02', '2021-01-15 10:36:02');
INSERT INTO `admin_operation_log` VALUES (529, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:36:12', '2021-01-15 10:36:12');
INSERT INTO `admin_operation_log` VALUES (530, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:39:27', '2021-01-15 10:39:27');
INSERT INTO `admin_operation_log` VALUES (531, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:40:38', '2021-01-15 10:40:38');
INSERT INTO `admin_operation_log` VALUES (532, 1, 'admin/user-bets', 'POST', '127.0.0.1', '{\"sum_max\":\"0\",\"sum_min\":\"0\",\"sum_odd\":\"0\",\"sum_even\":\"0\",\"dragon\":\"0\",\"tiger\":\"0\",\"draw\":\"0\",\"before_three_leopard\":\"0\",\"before_three_straight\":\"0\",\"before_three_two_pairs\":\"0\",\"before_three_half_straight\":\"0\",\"before_three_discrete\":\"0\",\"middle_three_leopard\":\"0\",\"middle_three_straight\":\"0\",\"middle_three_two_pairs\":\"0\",\"middle_three_half_straight\":\"0\",\"middle_three_discrete\":\"0\",\"after_three_leopard\":\"0\",\"after_three_straight\":\"0\",\"after_three_two_pairs\":\"0\",\"after_three_half_straight\":\"0\",\"after_three_discrete\":\"0\",\"first_max\":\"0\",\"first_min\":\"0\",\"first_odd\":\"0\",\"first_even\":\"0\",\"first_0\":\"0\",\"first_1\":\"0\",\"first_2\":\"0\",\"first_3\":\"0\",\"first_4\":\"0\",\"first_5\":\"0\",\"first_6\":\"0\",\"first_8\":\"0\",\"first_9\":\"0\",\"second_max\":\"0\",\"second_min\":\"0\",\"second_odd\":\"0\",\"second_even\":\"0\",\"second_0\":\"0\",\"second_1\":\"0\",\"second_2\":\"0\",\"second_3\":\"0\",\"second_4\":\"0\",\"second_5\":\"0\",\"second_6\":\"0\",\"second_8\":\"0\",\"second_9\":\"0\",\"third_max\":\"0\",\"third_min\":\"0\",\"third_odd\":\"0\",\"third_even\":\"0\",\"third_0\":\"0\",\"third_1\":\"0\",\"third_2\":\"0\",\"third_3\":\"0\",\"third_4\":\"0\",\"third_5\":\"0\",\"third_6\":\"0\",\"third_8\":\"0\",\"third_9\":\"0\",\"fourth_max\":\"0\",\"fourth_min\":\"0\",\"fourth_odd\":\"0\",\"fourth_even\":\"0\",\"fourth_0\":\"0\",\"fourth_1\":\"0\",\"fourth_2\":\"0\",\"fourth_3\":\"0\",\"fourth_4\":\"0\",\"fourth_5\":\"0\",\"fourth_6\":\"0\",\"fourth_8\":\"0\",\"fourth_9\":\"0\",\"fifth_max\":\"0\",\"fifth_min\":\"0\",\"fifth_odd\":\"0\",\"fifth_even\":\"0\",\"fifth_0\":\"0\",\"fifth_1\":\"0\",\"fifth_2\":\"0\",\"fifth_3\":\"0\",\"fifth_4\":\"0\",\"fifth_5\":\"0\",\"fifth_6\":\"0\",\"fifth_8\":\"0\",\"fifth_9\":\"0\",\"_token\":\"ASuMxqglELcDm4kk1vaUsGsjlTip7aXiEvHcmeae\"}', '2021-01-15 10:43:56', '2021-01-15 10:43:56');
INSERT INTO `admin_operation_log` VALUES (533, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:43:56', '2021-01-15 10:43:56');
INSERT INTO `admin_operation_log` VALUES (534, 1, 'admin/user-bets/create', 'GET', '127.0.0.1', '[]', '2021-01-15 10:45:05', '2021-01-15 10:45:05');
INSERT INTO `admin_operation_log` VALUES (535, 1, 'admin/user-bets', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-01-15 10:45:10', '2021-01-15 10:45:10');

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
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `phase_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '期数',
  `first_ball` int(11) UNSIGNED NOT NULL COMMENT '第一球',
  `second_ball` int(11) UNSIGNED NOT NULL COMMENT '第二球',
  `third_ball` int(11) UNSIGNED NOT NULL COMMENT '第三球',
  `fourth_ball` int(11) UNSIGNED NOT NULL COMMENT '第四球',
  `fifth_ball` int(11) UNSIGNED NOT NULL COMMENT '第五球',
  `open_method` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0=>算法开奖 1=>正常开奖,2 =>人工开奖',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_bet
-- ----------------------------
INSERT INTO `user_bet` VALUES (1, 123, '123', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.00, '2021-01-15 15:51:17', '2021-01-15 15:51:17');

-- ----------------------------
-- Table structure for user_bet_odds
-- ----------------------------
DROP TABLE IF EXISTS `user_bet_odds`;
CREATE TABLE `user_bet_odds`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'azxy5' COMMENT '彩种',
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
INSERT INTO `user_bet_odds` VALUES (7, 'azxy5', 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 0.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 0.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 0.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 0.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 0.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, '2021-01-15 14:24:26', '2021-01-15 06:24:26');

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
