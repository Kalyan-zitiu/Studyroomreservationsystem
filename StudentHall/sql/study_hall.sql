/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80200
 Source Host           : localhost:3306
 Source Schema         : study_hall

 Target Server Type    : MySQL
 Target Server Version : 80200
 File Encoding         : 65001

 Date: 12/05/2024 22:03:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `permission_id` int NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(255) NOT NULL,
  `permission_simplify` varchar(20) NOT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of permission
-- ----------------------------
BEGIN;
INSERT INTO `permission` (`permission_id`, `permission_name`, `permission_simplify`) VALUES (1, '（注册，修改，注销）用户', 'user');
INSERT INTO `permission` (`permission_id`, `permission_name`, `permission_simplify`) VALUES (2, '（添加、删除、修改）自习室', 'study_room');
INSERT INTO `permission` (`permission_id`, `permission_name`, `permission_simplify`) VALUES (3, '（预约，取消、查看）自习室', 'study_cancel');
INSERT INTO `permission` (`permission_id`, `permission_name`, `permission_simplify`) VALUES (4, '审核自习室', 'check_room');
INSERT INTO `permission` (`permission_id`, `permission_name`, `permission_simplify`) VALUES (5, '查看自习室的使用率', 'usage_rate');
INSERT INTO `permission` (`permission_id`, `permission_name`, `permission_simplify`) VALUES (6, '对用户进行操作', 'operation');
COMMIT;

-- ----------------------------
-- Table structure for reservation
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `reservation_id` int NOT NULL AUTO_INCREMENT COMMENT '预约ID',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `study_details_id` int DEFAULT NULL COMMENT '自习室ID',
  `reservation_time` datetime DEFAULT NULL COMMENT '预约时间',
  `reservation_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '预约状态，0:已通过，1:审核中，2:已拒绝，3:已取消',
  `end_time` datetime DEFAULT NULL COMMENT '截止时间',
  `reason` varchar(50) DEFAULT NULL COMMENT '申请原因',
  PRIMARY KEY (`reservation_id`),
  KEY `user_id` (`user_id`),
  KEY `reservation_ibfk_2` (`study_details_id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`study_details_id`) REFERENCES `study_room_details` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of reservation
-- ----------------------------
BEGIN;
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (10, 7, 220, '2024-06-16 22:11:25', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (11, 7, 130, '2024-06-06 11:08:56', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (12, 6, 90, '2024-05-28 21:07:42', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (13, 7, 223, '2024-06-15 19:27:56', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (14, 5, 175, '2024-06-17 20:21:19', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (15, 6, 23, '2024-06-28 17:12:30', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (16, 6, 190, '2024-06-26 10:48:06', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (17, 6, 35, '2024-06-03 22:06:05', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (18, 5, 126, '2024-05-30 20:26:33', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (19, 5, 107, '2024-05-29 17:41:17', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (20, 7, 21, '2024-06-05 22:20:03', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (21, 6, 43, '2024-05-27 11:07:48', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (22, 5, 96, '2024-06-27 07:27:19', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (23, 6, 104, '2024-06-11 11:23:42', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (24, 7, 119, '2024-06-19 06:45:06', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (25, 7, 17, '2024-06-19 07:53:41', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (26, 6, 28, '2024-06-10 11:00:14', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (27, 5, 217, '2024-06-12 07:08:37', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (28, 7, 99, '2024-06-23 14:26:21', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (29, 5, 19, '2024-06-03 07:33:31', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (30, 6, 23, '2024-05-31 18:39:10', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (31, 6, 77, '2024-06-02 09:40:44', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (32, 7, 225, '2024-06-15 21:23:22', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (33, 7, 197, '2024-06-18 06:05:01', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (34, 5, 193, '2024-06-27 05:17:23', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (35, 7, 32, '2024-05-31 16:12:52', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (36, 5, 182, '2024-06-09 09:03:26', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (37, 5, 169, '2024-06-15 05:20:59', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (38, 6, 212, '2024-05-31 10:29:36', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (39, 7, 194, '2024-06-23 10:51:13', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (40, 5, 165, '2024-06-04 14:19:34', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (41, 7, 32, '2024-06-01 21:45:37', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (42, 5, 164, '2024-06-28 02:45:53', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (43, 7, 168, '2024-06-14 09:01:46', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (44, 7, 92, '2024-06-02 12:17:04', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (45, 6, 20, '2024-06-17 02:55:31', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (46, 5, 190, '2024-06-16 02:22:43', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (47, 7, 180, '2024-06-11 01:31:04', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (48, 6, 45, '2024-06-25 01:15:19', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (49, 5, 184, '2024-06-12 16:31:40', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (50, 6, 187, '2024-05-29 15:13:26', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (51, 6, 126, '2024-06-08 12:55:45', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (52, 6, 170, '2024-06-10 06:07:20', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (53, 6, 121, '2024-06-01 11:34:44', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (54, 7, 199, '2024-06-12 16:07:50', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (55, 5, 130, '2024-05-31 16:25:40', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (56, 6, 192, '2024-06-02 17:19:03', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (57, 5, 106, '2024-06-03 11:25:59', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (58, 5, 6, '2024-06-09 08:53:32', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (59, 5, 219, '2024-06-27 18:19:59', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (60, 5, 149, '2024-06-17 18:52:37', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (61, 5, 133, '2024-06-28 02:18:54', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (62, 5, 110, '2024-06-13 17:20:13', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (63, 5, 49, '2024-06-02 15:46:03', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (64, 7, 15, '2024-06-16 10:24:30', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (65, 6, 152, '2024-06-13 14:56:45', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (66, 5, 104, '2024-06-10 15:15:01', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (67, 6, 102, '2024-06-27 06:21:59', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (68, 7, 36, '2024-06-13 16:45:44', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (69, 6, 133, '2024-06-17 14:49:37', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (70, 7, 60, '2024-06-28 22:57:24', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (71, 7, 185, '2024-06-22 10:12:05', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (72, 6, 136, '2024-06-03 04:37:04', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (73, 5, 64, '2024-06-17 04:36:21', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (74, 6, 121, '2024-06-15 15:34:11', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (75, 6, 167, '2024-06-10 13:06:43', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (76, 7, 104, '2024-06-05 11:31:26', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (77, 6, 30, '2024-06-04 17:37:02', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (78, 7, 188, '2024-06-05 20:38:19', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (79, 6, 5, '2024-06-24 09:49:47', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (80, 5, 171, '2024-06-12 14:45:41', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (81, 7, 115, '2024-06-15 14:17:50', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (82, 7, 85, '2024-06-03 02:13:30', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (83, 6, 48, '2024-06-12 23:48:21', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (84, 6, 22, '2024-06-01 14:24:09', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (85, 5, 116, '2024-06-19 18:07:53', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (86, 6, 207, '2024-06-08 05:20:45', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (87, 7, 221, '2024-06-21 04:44:33', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (88, 5, 96, '2024-06-06 14:56:28', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (89, 7, 89, '2024-06-19 17:20:20', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (90, 7, 206, '2024-06-20 04:26:52', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (91, 6, 189, '2024-06-03 19:27:22', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (92, 6, 75, '2024-06-20 04:45:01', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (93, 6, 3, '2024-06-06 06:04:12', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (94, 6, 223, '2024-06-09 07:16:58', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (95, 5, 184, '2024-06-18 10:11:30', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (96, 6, 147, '2024-05-27 00:08:08', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (97, 6, 206, '2024-06-08 17:15:54', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (98, 6, 86, '2024-05-28 20:10:33', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (99, 6, 134, '2024-06-07 11:43:25', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (100, 6, 166, '2024-06-10 01:58:22', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (101, 5, 179, '2024-06-25 02:17:01', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (102, 5, 54, '2024-05-27 00:46:59', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (103, 6, 176, '2024-06-01 10:37:05', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (104, 5, 213, '2024-05-28 20:17:50', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (105, 7, 157, '2024-06-26 09:50:46', '1', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (106, 5, 132, '2024-06-15 16:54:32', '0', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (107, 6, 199, '2024-06-14 06:12:40', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (108, 7, 15, '2024-06-11 12:33:21', '2', NULL, NULL);
INSERT INTO `reservation` (`reservation_id`, `user_id`, `study_details_id`, `reservation_time`, `reservation_status`, `end_time`, `reason`) VALUES (109, 5, 216, '2024-06-28 09:32:37', '1', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  `role_sign` varchar(30) DEFAULT NULL COMMENT '角色标识',
  `status` tinyint DEFAULT NULL COMMENT '角色状态，0：不启用，1：启用',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` (`role_id`, `role_name`, `role_sign`, `status`) VALUES (1, 'a超级管理员', 'system', 1);
INSERT INTO `role` (`role_id`, `role_name`, `role_sign`, `status`) VALUES (2, '自习室管理员', 'admin', 1);
INSERT INTO `role` (`role_id`, `role_name`, `role_sign`, `status`) VALUES (3, '普通用户', 'user', 1);
COMMIT;

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` int NOT NULL,
  `role_id` int NOT NULL COMMENT ' 角色 ID',
  `permission_id` int NOT NULL COMMENT '权限 ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
BEGIN;
INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`) VALUES (1, 1, 2);
INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`) VALUES (2, 1, 6);
INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`) VALUES (3, 1, 5);
INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`) VALUES (4, 2, 2);
INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`) VALUES (5, 2, 4);
INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`) VALUES (6, 3, 1);
INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`) VALUES (7, 3, 3);
COMMIT;

-- ----------------------------
-- Table structure for study_room
-- ----------------------------
DROP TABLE IF EXISTS `study_room`;
CREATE TABLE `study_room` (
  `study_room_id` int NOT NULL AUTO_INCREMENT COMMENT '自习室ID',
  `study_room_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '自习室可用数量',
  `capacity` int DEFAULT NULL COMMENT '总容量',
  `facilities` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '自习室设施',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '自习室名称',
  PRIMARY KEY (`study_room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of study_room
-- ----------------------------
BEGIN;
INSERT INTO `study_room` (`study_room_id`, `study_room_number`, `capacity`, `facilities`, `type`) VALUES (1, '47', 47, '投影仪+普通电脑', '教室');
INSERT INTO `study_room` (`study_room_id`, `study_room_number`, `capacity`, `facilities`, `type`) VALUES (2, '58', 58, '音响+学生上机电脑', '电脑机房');
INSERT INTO `study_room` (`study_room_id`, `study_room_number`, `capacity`, `facilities`, `type`) VALUES (3, '42', 42, '设计设备', '设计室');
INSERT INTO `study_room` (`study_room_id`, `study_room_number`, `capacity`, `facilities`, `type`) VALUES (4, '40', 40, '实验用品', '实验室');
INSERT INTO `study_room` (`study_room_id`, `study_room_number`, `capacity`, `facilities`, `type`) VALUES (6, '42', 42, '机械器件', '操作厂');
COMMIT;

-- ----------------------------
-- Table structure for study_room_admin
-- ----------------------------
DROP TABLE IF EXISTS `study_room_admin`;
CREATE TABLE `study_room_admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `study_room_id` int DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `user_id` (`user_id`),
  KEY `study_room_id` (`study_room_id`),
  CONSTRAINT `study_room_admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `study_room_admin_ibfk_2` FOREIGN KEY (`study_room_id`) REFERENCES `study_room` (`study_room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of study_room_admin
-- ----------------------------
BEGIN;
INSERT INTO `study_room_admin` (`admin_id`, `user_id`, `study_room_id`) VALUES (9, 5, 1);
INSERT INTO `study_room_admin` (`admin_id`, `user_id`, `study_room_id`) VALUES (10, 6, 2);
INSERT INTO `study_room_admin` (`admin_id`, `user_id`, `study_room_id`) VALUES (11, 7, 1);
COMMIT;

-- ----------------------------
-- Table structure for study_room_details
-- ----------------------------
DROP TABLE IF EXISTS `study_room_details`;
CREATE TABLE `study_room_details` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自习室 ID',
  `location` varchar(70) NOT NULL COMMENT '自习室地址',
  `study_room_id` int NOT NULL COMMENT '自习室归属',
  `reservation_frequency` int DEFAULT NULL COMMENT '自习室预约次数',
  `usage_frequency` int DEFAULT NULL COMMENT '自习室使用次数',
  PRIMARY KEY (`id`),
  KEY `fk_details_room` (`study_room_id`),
  CONSTRAINT `fk_details_room` FOREIGN KEY (`study_room_id`) REFERENCES `study_room` (`study_room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='自习室详细地址';

-- ----------------------------
-- Records of study_room_details
-- ----------------------------
BEGIN;
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (1, 'A2-209', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (2, 'A3-210', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (3, 'A3-209', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (4, 'チェコ共和国', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (5, 'インド', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (6, 'ベネズエラ（ボリバル共和国）', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (7, 'スロバキア', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (8, 'クロアチア', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (9, 'ジブチ', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (10, 'ハイチ', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (11, 'トーゴ', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (12, 'イラク', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (13, 'ウルグアイ', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (14, 'ポルトガル', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (15, 'ギニア', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (16, 'スロベニア', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (17, 'コモロ', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (18, 'エルサルバドル', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (19, 'ベリーズ', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (20, 'ハンガリー', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (21, 'モザンビーク', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (22, 'チリ', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (23, 'ニカラグア', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (24, 'ジョージア', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (25, 'ソロモン諸島', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (26, '大韓民国', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (27, '中国', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (28, 'トーゴ', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (29, 'ウルグアイ', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (30, '南スーダン', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (31, 'シリアアラブ共和国', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (32, 'シリアアラブ共和国', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (33, 'ウズベキスタン', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (34, 'ジブチ', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (35, 'ハイチ', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (36, 'スロバキア', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (37, 'ナウル', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (38, 'コートジボワール', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (39, 'イラン（イスラム共和国）', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (40, 'モルディブ', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (41, 'モザンビーク', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (42, 'バルバドス', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (43, 'カメルーン', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (44, 'シエラレオネ', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (45, 'グアテマラ', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (46, 'マリ', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (47, 'モロッコ', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (48, 'モナコ', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (49, 'ネパール', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (50, 'パナマ', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (51, 'マーシャル諸島', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (52, '大韓民国', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (53, 'モザンビーク', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (54, 'シンガポール', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (55, '朝鮮民主主義人民共和国', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (56, 'ニジェール', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (57, 'ギリシャ', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (58, 'ミャンマー', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (59, 'コンゴ', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (60, 'トルコ', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (61, 'ウガンダ', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (62, 'レソト', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (63, 'ブルガリア', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (64, 'フィリピン', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (65, 'チャド', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (66, 'コロンビア', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (67, 'オーストラリア', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (68, 'マーシャル諸島', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (69, 'セイシェル', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (70, 'シンガポール', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (71, 'ハンガリー', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (72, 'サウジアラビア', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (73, 'アルバニア\nアルバニア\nアルバニア', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (74, 'リビア', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (75, 'マーシャル諸島', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (76, 'スロバキア', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (77, 'フィジー', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (78, 'エクアドル', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (79, 'ミクロネシア（連邦）', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (80, 'ギニア', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (81, 'チェコ共和国', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (82, 'オーストラリア', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (83, 'ジブチ', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (84, 'オーストラリア', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (85, 'ツバル', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (86, 'エジプト', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (87, 'モルドバ共和国', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (88, 'ドイツ', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (89, 'アンティグアバーブーダ', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (90, 'カナダ', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (91, 'ミャンマー', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (92, 'ラトビア', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (93, '南スーダン', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (94, '大韓民国', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (95, 'モンゴル', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (96, 'エチオピア', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (97, 'リビア', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (98, '中国', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (99, 'マーシャル諸島', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (100, 'ドミニカ', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (101, 'バーレーン', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (102, 'インドネシア', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (103, 'ウルグアイ', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (104, 'コートジボワール', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (105, 'ボツワナ', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (106, 'ニカラグア', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (107, 'ペルー', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (108, 'セルビア', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (109, 'キプロス', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (110, 'デンマーク', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (111, 'アンティグアバーブーダ', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (112, 'カタール', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (113, '日本', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (114, 'キリバス', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (115, 'スリナム', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (116, 'エチオピア', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (117, 'ニュージーランド', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (118, 'ポルトガル', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (119, 'バハマ', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (120, 'ベラルーシ', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (121, 'セネガル', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (122, 'モンゴル', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (123, 'オーストリア', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (124, 'ガーナ', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (125, 'マルタ', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (126, 'マダガスカル', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (127, 'セルビア', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (128, 'ナミビア', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (129, 'セントクリストファーネイビス', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (130, 'ベラルーシ', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (131, 'リビア', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (132, 'アメリカ', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (133, 'マレーシア', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (134, '南アフリカ', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (135, 'コンゴ', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (136, 'マラウイ', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (137, 'ポルトガル', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (138, 'シエラレオネ', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (139, 'セントクリストファーネイビス', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (140, 'タンザニア連合共和国', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (141, 'ジブチ', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (142, 'インド', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (143, 'ニカラグア', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (144, 'トンガ', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (145, 'ウクライナ', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (146, 'リトアニア', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (147, 'セントルシア', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (148, 'チャド', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (149, 'カーボベルデ', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (150, 'グレナダ', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (151, 'ソロモン諸島', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (152, 'ボツワナ', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (153, 'シンガポール', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (154, 'アンドラ', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (155, '赤道ギニア', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (156, 'バヌアツ', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (157, 'ジャマイカ', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (158, 'オランダ', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (159, 'レソト', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (160, 'ベルギー', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (161, 'アルゼンチン', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (162, 'ドミニカ', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (163, 'ジンバブエ', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (164, 'ニジェール', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (165, 'デンマーク', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (166, 'ポルトガル', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (167, 'サウジアラビア', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (168, 'トリニダード・トバゴ', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (169, 'アルゼンチン', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (170, 'パプアニューギニア', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (171, 'カタール', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (172, 'ソロモン諸島', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (173, 'シンガポール', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (174, 'モロッコ', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (175, 'エスワティニ', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (176, 'キプロス', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (177, 'スイス', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (178, 'ハイチ', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (179, 'モルドバ共和国', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (180, 'イエメン', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (181, 'モンゴル', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (182, 'シンガポール', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (183, '中国', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (184, 'モーリシャス', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (185, 'モザンビーク', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (186, 'ギニア', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (187, 'ベネズエラ（ボリバル共和国）', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (188, 'イタリア', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (189, 'グアテマラ', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (190, 'モロッコ', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (191, 'マラウイ', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (192, 'アルジェリア', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (193, 'モンゴル', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (194, 'セントルシア', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (195, 'ハイチ', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (196, '朝鮮民主主義人民共和国', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (197, 'インドネシア', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (198, 'カーボベルデ', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (199, 'ザンビア', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (200, 'ガボン', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (201, 'ベリーズ', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (202, 'セントビンセントおよびグレナディーン諸島', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (203, 'ガンビア', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (204, 'ソロモン諸島', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (205, '南アフリカ', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (206, 'ホンジュラス', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (207, '南スーダン', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (208, 'カメルーン', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (209, 'セントクリストファーネイビス', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (210, 'ハンガリー', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (211, 'クロアチア', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (212, '北マケドニア', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (213, 'ブラジル', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (214, 'エクアドル', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (215, 'アフガニスタン', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (216, 'セイシェル', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (217, 'マラウイ', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (218, 'フィジー', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (219, 'ニジェール', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (220, 'ルワンダ', 3, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (221, 'リビア', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (222, 'ブルガリア', 1, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (223, 'ジブチ', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (224, 'パナマ', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (225, 'アンドラ', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (226, 'アンゴラ', 2, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (227, 'キルギスタン', 4, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (228, 'ブルネイダルサラーム', 6, 0, 0);
INSERT INTO `study_room_details` (`id`, `location`, `study_room_id`, `reservation_frequency`, `usage_frequency`) VALUES (229, 'ブータン', 6, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` mediumtext COMMENT '用户手机号码',
  `email` varchar(30) NOT NULL COMMENT '用户邮箱',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`user_id`, `user_name`, `password`, `phone`, `email`) VALUES (5, 'b老刘', '$2a$10$voNoJwViej2v4K.vmG0VMuo.u3MAcdvgAWPhXE07VVpJO8DGUPhzm', '1234567890', 'johndoe@example.com');
INSERT INTO `user` (`user_id`, `user_name`, `password`, `phone`, `email`) VALUES (6, '爱丽丝', '$2a$10$AvVX9FXTuAPwKXAPs5R60eqvkaq1CyYtqvVt1LIpx0tIppSkPUAUu', '17273829381', '1846558211@qq.com');
INSERT INTO `user` (`user_id`, `user_name`, `password`, `phone`, `email`) VALUES (7, '张三', '$2a$10$V9/Oy8Vl53k25u.wWHagv.OLI1tnz.wIF0wThge4XIwp6Oiaffkn2', '18272938293', '1846558331@qq.com');
INSERT INTO `user` (`user_id`, `user_name`, `password`, `phone`, `email`) VALUES (19, 'aduiaso', '$2a$10$TQlM7HZBkHWxK1ZVpMlwRe7VbZ9Lu.c99Lzmj7DimxbzwuQ9hi8C2', '122', 'iodia');
INSERT INTO `user` (`user_id`, `user_name`, `password`, `phone`, `email`) VALUES (21, 'sssss', '$2a$10$Wa37C3L91f8hIYsrNq1oPe5cQkxJA3lobh9QGXzBa.4ebtcIT3eQG', '18272638912', '2010661521@qq.com');
COMMIT;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_user_role_user` (`user_id`),
  KEY `fk_user_role_role` (`role_id`),
  CONSTRAINT `fk_user_role_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `fk_user_role_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_role
-- ----------------------------
BEGIN;
INSERT INTO `user_role` (`user_id`, `role_id`, `id`) VALUES (5, 1, 1);
INSERT INTO `user_role` (`user_id`, `role_id`, `id`) VALUES (6, 2, 2);
INSERT INTO `user_role` (`user_id`, `role_id`, `id`) VALUES (7, 3, 3);
INSERT INTO `user_role` (`user_id`, `role_id`, `id`) VALUES (19, 3, 18);
INSERT INTO `user_role` (`user_id`, `role_id`, `id`) VALUES (21, 3, 21);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
