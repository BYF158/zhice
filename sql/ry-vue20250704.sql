/*
 Navicat Premium Dump SQL

 Source Server         : mysql-local
 Source Server Type    : MySQL
 Source Server Version : 80038 (8.0.38)
 Source Host           : localhost:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 80038 (8.0.38)
 File Encoding         : 65001

 Date: 07/07/2025 08:48:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'topic', '题目信息表', NULL, NULL, 'Topic', 'crud', 'element-ui', 'com.etsong.questions', 'questions', 'topic', '题目管理', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2025-07-01 19:27:24', '', '2025-07-01 19:29:23', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'topic_id', '题目序号', 'int', 'Long', 'topicId', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-07-01 19:27:24', '', '2025-07-01 19:29:23');
INSERT INTO `gen_table_column` VALUES (2, 1, 'topic_content', '题干', 'text', 'String', 'topicContent', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'editor', '', 2, 'admin', '2025-07-01 19:27:24', '', '2025-07-01 19:29:23');
INSERT INTO `gen_table_column` VALUES (3, 1, 'prototype_id', '题目类别', 'int', 'Long', 'prototypeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-07-01 19:27:24', '', '2025-07-01 19:29:23');

-- ----------------------------
-- Table structure for prototype
-- ----------------------------
DROP TABLE IF EXISTS `prototype`;
CREATE TABLE `prototype`  (
  `prototype_id` int NOT NULL,
  `prototype_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`prototype_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of prototype
-- ----------------------------
INSERT INTO `prototype` VALUES (1, '天真者', NULL);
INSERT INTO `prototype` VALUES (2, '孤儿', NULL);
INSERT INTO `prototype` VALUES (3, '战士', NULL);
INSERT INTO `prototype` VALUES (4, '照顾者', NULL);
INSERT INTO `prototype` VALUES (5, '追寻者', NULL);
INSERT INTO `prototype` VALUES (6, '爱人者', NULL);
INSERT INTO `prototype` VALUES (7, '破坏者', NULL);
INSERT INTO `prototype` VALUES (8, '创造者', NULL);
INSERT INTO `prototype` VALUES (9, '魔术师', NULL);
INSERT INTO `prototype` VALUES (10, '统治者', NULL);
INSERT INTO `prototype` VALUES (11, '智者', NULL);
INSERT INTO `prototype` VALUES (12, '愚者', NULL);

-- ----------------------------
-- Table structure for prototype_score
-- ----------------------------
DROP TABLE IF EXISTS `prototype_score`;
CREATE TABLE `prototype_score`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `record_id` int NOT NULL,
  `prototype_id` int NOT NULL,
  `score` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `record_id`(`record_id` ASC) USING BTREE,
  INDEX `prototype_id`(`prototype_id` ASC) USING BTREE,
  CONSTRAINT `prototype_score_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `test_record` (`record_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `prototype_score_ibfk_2` FOREIGN KEY (`prototype_id`) REFERENCES `prototype` (`prototype_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 302 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of prototype_score
-- ----------------------------
INSERT INTO `prototype_score` VALUES (2, 2, 1, 30);
INSERT INTO `prototype_score` VALUES (3, 2, 2, 30);
INSERT INTO `prototype_score` VALUES (4, 2, 3, 30);
INSERT INTO `prototype_score` VALUES (5, 2, 4, 30);
INSERT INTO `prototype_score` VALUES (6, 2, 5, 30);
INSERT INTO `prototype_score` VALUES (7, 2, 6, 30);
INSERT INTO `prototype_score` VALUES (8, 2, 7, 30);
INSERT INTO `prototype_score` VALUES (9, 2, 8, 30);
INSERT INTO `prototype_score` VALUES (10, 2, 9, 30);
INSERT INTO `prototype_score` VALUES (11, 2, 10, 30);
INSERT INTO `prototype_score` VALUES (12, 2, 11, 30);
INSERT INTO `prototype_score` VALUES (13, 2, 12, 30);
INSERT INTO `prototype_score` VALUES (14, 5, 1, 30);
INSERT INTO `prototype_score` VALUES (15, 5, 2, 30);
INSERT INTO `prototype_score` VALUES (16, 5, 3, 30);
INSERT INTO `prototype_score` VALUES (17, 5, 4, 30);
INSERT INTO `prototype_score` VALUES (18, 5, 5, 30);
INSERT INTO `prototype_score` VALUES (19, 5, 6, 30);
INSERT INTO `prototype_score` VALUES (20, 5, 7, 30);
INSERT INTO `prototype_score` VALUES (21, 5, 8, 30);
INSERT INTO `prototype_score` VALUES (22, 5, 9, 30);
INSERT INTO `prototype_score` VALUES (23, 5, 10, 30);
INSERT INTO `prototype_score` VALUES (24, 5, 11, 30);
INSERT INTO `prototype_score` VALUES (25, 5, 12, 30);
INSERT INTO `prototype_score` VALUES (38, 7, 1, 30);
INSERT INTO `prototype_score` VALUES (39, 7, 2, 30);
INSERT INTO `prototype_score` VALUES (40, 7, 3, 30);
INSERT INTO `prototype_score` VALUES (41, 7, 4, 30);
INSERT INTO `prototype_score` VALUES (42, 7, 5, 30);
INSERT INTO `prototype_score` VALUES (43, 7, 6, 30);
INSERT INTO `prototype_score` VALUES (44, 7, 7, 30);
INSERT INTO `prototype_score` VALUES (45, 7, 8, 30);
INSERT INTO `prototype_score` VALUES (46, 7, 9, 30);
INSERT INTO `prototype_score` VALUES (47, 7, 10, 30);
INSERT INTO `prototype_score` VALUES (48, 7, 11, 30);
INSERT INTO `prototype_score` VALUES (49, 7, 12, 30);
INSERT INTO `prototype_score` VALUES (50, 8, 1, 30);
INSERT INTO `prototype_score` VALUES (51, 8, 2, 30);
INSERT INTO `prototype_score` VALUES (52, 8, 3, 30);
INSERT INTO `prototype_score` VALUES (53, 8, 4, 30);
INSERT INTO `prototype_score` VALUES (54, 8, 5, 30);
INSERT INTO `prototype_score` VALUES (55, 8, 6, 30);
INSERT INTO `prototype_score` VALUES (56, 8, 7, 30);
INSERT INTO `prototype_score` VALUES (57, 8, 8, 30);
INSERT INTO `prototype_score` VALUES (58, 8, 9, 30);
INSERT INTO `prototype_score` VALUES (59, 8, 10, 30);
INSERT INTO `prototype_score` VALUES (60, 8, 11, 30);
INSERT INTO `prototype_score` VALUES (61, 8, 12, 30);
INSERT INTO `prototype_score` VALUES (62, 9, 1, 30);
INSERT INTO `prototype_score` VALUES (63, 9, 2, 30);
INSERT INTO `prototype_score` VALUES (64, 9, 3, 30);
INSERT INTO `prototype_score` VALUES (65, 9, 4, 30);
INSERT INTO `prototype_score` VALUES (66, 9, 5, 30);
INSERT INTO `prototype_score` VALUES (67, 9, 6, 30);
INSERT INTO `prototype_score` VALUES (68, 9, 7, 30);
INSERT INTO `prototype_score` VALUES (69, 9, 8, 30);
INSERT INTO `prototype_score` VALUES (70, 9, 9, 30);
INSERT INTO `prototype_score` VALUES (71, 9, 10, 30);
INSERT INTO `prototype_score` VALUES (72, 9, 11, 30);
INSERT INTO `prototype_score` VALUES (73, 9, 12, 30);
INSERT INTO `prototype_score` VALUES (74, 10, 1, 30);
INSERT INTO `prototype_score` VALUES (75, 10, 2, 30);
INSERT INTO `prototype_score` VALUES (76, 10, 3, 30);
INSERT INTO `prototype_score` VALUES (77, 10, 4, 30);
INSERT INTO `prototype_score` VALUES (78, 10, 5, 30);
INSERT INTO `prototype_score` VALUES (79, 10, 6, 30);
INSERT INTO `prototype_score` VALUES (80, 10, 7, 30);
INSERT INTO `prototype_score` VALUES (81, 10, 8, 30);
INSERT INTO `prototype_score` VALUES (82, 10, 9, 30);
INSERT INTO `prototype_score` VALUES (83, 10, 10, 30);
INSERT INTO `prototype_score` VALUES (84, 10, 11, 30);
INSERT INTO `prototype_score` VALUES (85, 10, 12, 30);
INSERT INTO `prototype_score` VALUES (86, 11, 1, 6);
INSERT INTO `prototype_score` VALUES (87, 11, 2, 6);
INSERT INTO `prototype_score` VALUES (88, 11, 3, 6);
INSERT INTO `prototype_score` VALUES (89, 11, 4, 6);
INSERT INTO `prototype_score` VALUES (90, 11, 5, 6);
INSERT INTO `prototype_score` VALUES (91, 11, 6, 6);
INSERT INTO `prototype_score` VALUES (92, 11, 7, 6);
INSERT INTO `prototype_score` VALUES (93, 11, 8, 6);
INSERT INTO `prototype_score` VALUES (94, 11, 9, 6);
INSERT INTO `prototype_score` VALUES (95, 11, 10, 6);
INSERT INTO `prototype_score` VALUES (96, 11, 11, 6);
INSERT INTO `prototype_score` VALUES (97, 11, 12, 6);
INSERT INTO `prototype_score` VALUES (98, 12, 1, 6);
INSERT INTO `prototype_score` VALUES (99, 12, 2, 6);
INSERT INTO `prototype_score` VALUES (100, 12, 3, 6);
INSERT INTO `prototype_score` VALUES (101, 12, 4, 6);
INSERT INTO `prototype_score` VALUES (102, 12, 5, 6);
INSERT INTO `prototype_score` VALUES (103, 12, 6, 6);
INSERT INTO `prototype_score` VALUES (104, 12, 7, 6);
INSERT INTO `prototype_score` VALUES (105, 12, 8, 6);
INSERT INTO `prototype_score` VALUES (106, 12, 9, 6);
INSERT INTO `prototype_score` VALUES (107, 12, 10, 6);
INSERT INTO `prototype_score` VALUES (108, 12, 11, 6);
INSERT INTO `prototype_score` VALUES (109, 12, 12, 6);
INSERT INTO `prototype_score` VALUES (110, 13, 1, 6);
INSERT INTO `prototype_score` VALUES (111, 13, 2, 6);
INSERT INTO `prototype_score` VALUES (112, 13, 3, 6);
INSERT INTO `prototype_score` VALUES (113, 13, 4, 6);
INSERT INTO `prototype_score` VALUES (114, 13, 5, 6);
INSERT INTO `prototype_score` VALUES (115, 13, 6, 6);
INSERT INTO `prototype_score` VALUES (116, 13, 7, 6);
INSERT INTO `prototype_score` VALUES (117, 13, 8, 6);
INSERT INTO `prototype_score` VALUES (118, 13, 9, 6);
INSERT INTO `prototype_score` VALUES (119, 13, 10, 6);
INSERT INTO `prototype_score` VALUES (120, 13, 11, 6);
INSERT INTO `prototype_score` VALUES (121, 13, 12, 6);
INSERT INTO `prototype_score` VALUES (122, 14, 1, 6);
INSERT INTO `prototype_score` VALUES (123, 14, 2, 6);
INSERT INTO `prototype_score` VALUES (124, 14, 3, 6);
INSERT INTO `prototype_score` VALUES (125, 14, 4, 6);
INSERT INTO `prototype_score` VALUES (126, 14, 5, 6);
INSERT INTO `prototype_score` VALUES (127, 14, 6, 6);
INSERT INTO `prototype_score` VALUES (128, 14, 7, 6);
INSERT INTO `prototype_score` VALUES (129, 14, 8, 6);
INSERT INTO `prototype_score` VALUES (130, 14, 9, 6);
INSERT INTO `prototype_score` VALUES (131, 14, 10, 6);
INSERT INTO `prototype_score` VALUES (132, 14, 11, 6);
INSERT INTO `prototype_score` VALUES (133, 14, 12, 6);
INSERT INTO `prototype_score` VALUES (134, 15, 1, 6);
INSERT INTO `prototype_score` VALUES (135, 15, 2, 6);
INSERT INTO `prototype_score` VALUES (136, 15, 3, 6);
INSERT INTO `prototype_score` VALUES (137, 15, 4, 6);
INSERT INTO `prototype_score` VALUES (138, 15, 5, 6);
INSERT INTO `prototype_score` VALUES (139, 15, 6, 6);
INSERT INTO `prototype_score` VALUES (140, 15, 7, 6);
INSERT INTO `prototype_score` VALUES (141, 15, 8, 6);
INSERT INTO `prototype_score` VALUES (142, 15, 9, 6);
INSERT INTO `prototype_score` VALUES (143, 15, 10, 6);
INSERT INTO `prototype_score` VALUES (144, 15, 11, 6);
INSERT INTO `prototype_score` VALUES (145, 15, 12, 6);
INSERT INTO `prototype_score` VALUES (146, 16, 1, 6);
INSERT INTO `prototype_score` VALUES (147, 16, 2, 6);
INSERT INTO `prototype_score` VALUES (148, 16, 3, 6);
INSERT INTO `prototype_score` VALUES (149, 16, 4, 6);
INSERT INTO `prototype_score` VALUES (150, 16, 5, 6);
INSERT INTO `prototype_score` VALUES (151, 16, 6, 6);
INSERT INTO `prototype_score` VALUES (152, 16, 7, 6);
INSERT INTO `prototype_score` VALUES (153, 16, 8, 6);
INSERT INTO `prototype_score` VALUES (154, 16, 9, 6);
INSERT INTO `prototype_score` VALUES (155, 16, 10, 6);
INSERT INTO `prototype_score` VALUES (156, 16, 11, 6);
INSERT INTO `prototype_score` VALUES (157, 16, 12, 6);
INSERT INTO `prototype_score` VALUES (158, 17, 1, 6);
INSERT INTO `prototype_score` VALUES (159, 17, 2, 6);
INSERT INTO `prototype_score` VALUES (160, 17, 3, 6);
INSERT INTO `prototype_score` VALUES (161, 17, 4, 6);
INSERT INTO `prototype_score` VALUES (162, 17, 5, 6);
INSERT INTO `prototype_score` VALUES (163, 17, 6, 6);
INSERT INTO `prototype_score` VALUES (164, 17, 7, 6);
INSERT INTO `prototype_score` VALUES (165, 17, 8, 6);
INSERT INTO `prototype_score` VALUES (166, 17, 9, 6);
INSERT INTO `prototype_score` VALUES (167, 17, 10, 6);
INSERT INTO `prototype_score` VALUES (168, 17, 11, 6);
INSERT INTO `prototype_score` VALUES (169, 17, 12, 6);
INSERT INTO `prototype_score` VALUES (170, 18, 1, 19);
INSERT INTO `prototype_score` VALUES (171, 18, 2, 19);
INSERT INTO `prototype_score` VALUES (172, 18, 3, 19);
INSERT INTO `prototype_score` VALUES (173, 18, 4, 17);
INSERT INTO `prototype_score` VALUES (174, 18, 5, 21);
INSERT INTO `prototype_score` VALUES (175, 18, 6, 16);
INSERT INTO `prototype_score` VALUES (176, 18, 7, 17);
INSERT INTO `prototype_score` VALUES (177, 18, 8, 21);
INSERT INTO `prototype_score` VALUES (178, 18, 9, 22);
INSERT INTO `prototype_score` VALUES (179, 18, 10, 20);
INSERT INTO `prototype_score` VALUES (180, 18, 11, 19);
INSERT INTO `prototype_score` VALUES (181, 18, 12, 19);
INSERT INTO `prototype_score` VALUES (182, 19, 1, 16);
INSERT INTO `prototype_score` VALUES (183, 19, 2, 19);
INSERT INTO `prototype_score` VALUES (184, 19, 3, 16);
INSERT INTO `prototype_score` VALUES (185, 19, 4, 16);
INSERT INTO `prototype_score` VALUES (186, 19, 5, 18);
INSERT INTO `prototype_score` VALUES (187, 19, 6, 19);
INSERT INTO `prototype_score` VALUES (188, 19, 7, 20);
INSERT INTO `prototype_score` VALUES (189, 19, 8, 20);
INSERT INTO `prototype_score` VALUES (190, 19, 9, 16);
INSERT INTO `prototype_score` VALUES (191, 19, 10, 19);
INSERT INTO `prototype_score` VALUES (192, 19, 11, 18);
INSERT INTO `prototype_score` VALUES (193, 19, 12, 19);
INSERT INTO `prototype_score` VALUES (194, 20, 1, 16);
INSERT INTO `prototype_score` VALUES (195, 20, 2, 19);
INSERT INTO `prototype_score` VALUES (196, 20, 3, 16);
INSERT INTO `prototype_score` VALUES (197, 20, 4, 16);
INSERT INTO `prototype_score` VALUES (198, 20, 5, 18);
INSERT INTO `prototype_score` VALUES (199, 20, 6, 19);
INSERT INTO `prototype_score` VALUES (200, 20, 7, 20);
INSERT INTO `prototype_score` VALUES (201, 20, 8, 20);
INSERT INTO `prototype_score` VALUES (202, 20, 9, 16);
INSERT INTO `prototype_score` VALUES (203, 20, 10, 19);
INSERT INTO `prototype_score` VALUES (204, 20, 11, 18);
INSERT INTO `prototype_score` VALUES (205, 20, 12, 19);
INSERT INTO `prototype_score` VALUES (206, 21, 1, 16);
INSERT INTO `prototype_score` VALUES (207, 21, 2, 19);
INSERT INTO `prototype_score` VALUES (208, 21, 3, 16);
INSERT INTO `prototype_score` VALUES (209, 21, 4, 16);
INSERT INTO `prototype_score` VALUES (210, 21, 5, 18);
INSERT INTO `prototype_score` VALUES (211, 21, 6, 19);
INSERT INTO `prototype_score` VALUES (212, 21, 7, 20);
INSERT INTO `prototype_score` VALUES (213, 21, 8, 20);
INSERT INTO `prototype_score` VALUES (214, 21, 9, 16);
INSERT INTO `prototype_score` VALUES (215, 21, 10, 19);
INSERT INTO `prototype_score` VALUES (216, 21, 11, 18);
INSERT INTO `prototype_score` VALUES (217, 21, 12, 19);
INSERT INTO `prototype_score` VALUES (218, 22, 1, 16);
INSERT INTO `prototype_score` VALUES (219, 22, 2, 19);
INSERT INTO `prototype_score` VALUES (220, 22, 3, 16);
INSERT INTO `prototype_score` VALUES (221, 22, 4, 16);
INSERT INTO `prototype_score` VALUES (222, 22, 5, 18);
INSERT INTO `prototype_score` VALUES (223, 22, 6, 19);
INSERT INTO `prototype_score` VALUES (224, 22, 7, 20);
INSERT INTO `prototype_score` VALUES (225, 22, 8, 20);
INSERT INTO `prototype_score` VALUES (226, 22, 9, 16);
INSERT INTO `prototype_score` VALUES (227, 22, 10, 19);
INSERT INTO `prototype_score` VALUES (228, 22, 11, 18);
INSERT INTO `prototype_score` VALUES (229, 22, 12, 19);
INSERT INTO `prototype_score` VALUES (230, 23, 1, 16);
INSERT INTO `prototype_score` VALUES (231, 23, 2, 19);
INSERT INTO `prototype_score` VALUES (232, 23, 3, 16);
INSERT INTO `prototype_score` VALUES (233, 23, 4, 16);
INSERT INTO `prototype_score` VALUES (234, 23, 5, 18);
INSERT INTO `prototype_score` VALUES (235, 23, 6, 19);
INSERT INTO `prototype_score` VALUES (236, 23, 7, 20);
INSERT INTO `prototype_score` VALUES (237, 23, 8, 20);
INSERT INTO `prototype_score` VALUES (238, 23, 9, 16);
INSERT INTO `prototype_score` VALUES (239, 23, 10, 19);
INSERT INTO `prototype_score` VALUES (240, 23, 11, 18);
INSERT INTO `prototype_score` VALUES (241, 23, 12, 19);
INSERT INTO `prototype_score` VALUES (242, 24, 1, 16);
INSERT INTO `prototype_score` VALUES (243, 24, 2, 19);
INSERT INTO `prototype_score` VALUES (244, 24, 3, 16);
INSERT INTO `prototype_score` VALUES (245, 24, 4, 16);
INSERT INTO `prototype_score` VALUES (246, 24, 5, 18);
INSERT INTO `prototype_score` VALUES (247, 24, 6, 19);
INSERT INTO `prototype_score` VALUES (248, 24, 7, 20);
INSERT INTO `prototype_score` VALUES (249, 24, 8, 20);
INSERT INTO `prototype_score` VALUES (250, 24, 9, 16);
INSERT INTO `prototype_score` VALUES (251, 24, 10, 19);
INSERT INTO `prototype_score` VALUES (252, 24, 11, 18);
INSERT INTO `prototype_score` VALUES (253, 24, 12, 19);
INSERT INTO `prototype_score` VALUES (254, 25, 1, 6);
INSERT INTO `prototype_score` VALUES (255, 25, 2, 6);
INSERT INTO `prototype_score` VALUES (256, 25, 3, 6);
INSERT INTO `prototype_score` VALUES (257, 25, 4, 6);
INSERT INTO `prototype_score` VALUES (258, 25, 5, 6);
INSERT INTO `prototype_score` VALUES (259, 25, 6, 6);
INSERT INTO `prototype_score` VALUES (260, 25, 7, 6);
INSERT INTO `prototype_score` VALUES (261, 25, 8, 6);
INSERT INTO `prototype_score` VALUES (262, 25, 9, 6);
INSERT INTO `prototype_score` VALUES (263, 25, 10, 6);
INSERT INTO `prototype_score` VALUES (264, 25, 11, 6);
INSERT INTO `prototype_score` VALUES (265, 25, 12, 6);
INSERT INTO `prototype_score` VALUES (266, 26, 1, 24);
INSERT INTO `prototype_score` VALUES (267, 26, 2, 28);
INSERT INTO `prototype_score` VALUES (268, 26, 3, 26);
INSERT INTO `prototype_score` VALUES (269, 26, 4, 20);
INSERT INTO `prototype_score` VALUES (270, 26, 5, 30);
INSERT INTO `prototype_score` VALUES (271, 26, 6, 22);
INSERT INTO `prototype_score` VALUES (272, 26, 7, 22);
INSERT INTO `prototype_score` VALUES (273, 26, 8, 26);
INSERT INTO `prototype_score` VALUES (274, 26, 9, 26);
INSERT INTO `prototype_score` VALUES (275, 26, 10, 30);
INSERT INTO `prototype_score` VALUES (276, 26, 11, 24);
INSERT INTO `prototype_score` VALUES (277, 26, 12, 22);
INSERT INTO `prototype_score` VALUES (278, 27, 1, 30);
INSERT INTO `prototype_score` VALUES (279, 27, 2, 25);
INSERT INTO `prototype_score` VALUES (280, 27, 3, 30);
INSERT INTO `prototype_score` VALUES (281, 27, 4, 30);
INSERT INTO `prototype_score` VALUES (282, 27, 5, 30);
INSERT INTO `prototype_score` VALUES (283, 27, 6, 30);
INSERT INTO `prototype_score` VALUES (284, 27, 7, 30);
INSERT INTO `prototype_score` VALUES (285, 27, 8, 30);
INSERT INTO `prototype_score` VALUES (286, 27, 9, 30);
INSERT INTO `prototype_score` VALUES (287, 27, 10, 30);
INSERT INTO `prototype_score` VALUES (288, 27, 11, 30);
INSERT INTO `prototype_score` VALUES (289, 27, 12, 30);
INSERT INTO `prototype_score` VALUES (290, 28, 1, 6);
INSERT INTO `prototype_score` VALUES (291, 28, 2, 7);
INSERT INTO `prototype_score` VALUES (292, 28, 3, 6);
INSERT INTO `prototype_score` VALUES (293, 28, 4, 6);
INSERT INTO `prototype_score` VALUES (294, 28, 5, 10);
INSERT INTO `prototype_score` VALUES (295, 28, 6, 6);
INSERT INTO `prototype_score` VALUES (296, 28, 7, 6);
INSERT INTO `prototype_score` VALUES (297, 28, 8, 6);
INSERT INTO `prototype_score` VALUES (298, 28, 9, 6);
INSERT INTO `prototype_score` VALUES (299, 28, 10, 6);
INSERT INTO `prototype_score` VALUES (300, 28, 11, 6);
INSERT INTO `prototype_score` VALUES (301, 28, 12, 6);

-- ----------------------------
-- Table structure for score_mapping
-- ----------------------------
DROP TABLE IF EXISTS `score_mapping`;
CREATE TABLE `score_mapping`  (
  `score_value` int NOT NULL,
  `score_desc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`score_value`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of score_mapping
-- ----------------------------
INSERT INTO `score_mapping` VALUES (1, '从来没有');
INSERT INTO `score_mapping` VALUES (2, '很少');
INSERT INTO `score_mapping` VALUES (3, '有时');
INSERT INTO `score_mapping` VALUES (4, '时常');
INSERT INTO `score_mapping` VALUES (5, '总是');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-07-01 16:21:32', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-07-01 16:21:32', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-07-01 16:21:32', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2025-07-01 16:21:32', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-07-01 16:21:32', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-07-01 16:21:32', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2025-07-01 16:21:32', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2025-07-01 16:21:32', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-01 16:21:30', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-01 16:21:30', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-01 16:21:30', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-01 16:21:30', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-01 16:21:30', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-01 16:21:30', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-01 16:21:30', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-01 16:21:30', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-01 16:21:30', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-01 16:21:30', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-07-01 16:21:32', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-07-01 16:21:32', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-07-01 16:21:32', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-07-01 16:21:32', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 218 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-01 16:28:21');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-01 17:00:17');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-01 17:02:01');
INSERT INTO `sys_logininfor` VALUES (103, '心理测试1', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2025-07-01 17:02:20');
INSERT INTO `sys_logininfor` VALUES (104, '心理测试1', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-01 17:02:35');
INSERT INTO `sys_logininfor` VALUES (105, '心理测试1', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-01 17:02:44');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-01 17:02:50');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-01 19:26:56');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-01 20:45:39');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-07-01 21:58:59');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-01 22:59:04');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 00:01:01');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-07-02 08:37:43');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 08:55:02');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 10:55:53');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 11:10:25');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 11:17:29');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 12:07:06');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 13:16:24');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 13:56:16');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 16:11:36');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '1', '验证码错误', '2025-07-02 19:34:00');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '1', '验证码错误', '2025-07-02 19:34:11');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '1', '验证码已失效', '2025-07-02 19:34:11');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-07-02 19:34:19');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 08:27:06');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-03 08:36:15');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-07-03 08:36:19');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 08:36:23');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 08:36:26');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-07-03 08:36:27');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-07-03 08:36:27');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 08:36:31');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-03 08:37:31');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 08:37:34');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-03 08:37:39');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 08:37:52');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-07-03 08:43:03');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-07-03 08:43:04');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 08:43:07');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 08:43:13');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-07-03 08:45:43');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 08:45:48');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 08:47:17');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 08:47:23');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 08:48:12');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-07-03 08:48:24');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-07-03 08:51:05');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 08:51:10');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-07-03 08:54:09');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 08:54:15');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 08:55:56');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 08:56:58');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-03 08:57:03');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-07-03 08:57:07');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 08:57:11');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-03 09:01:13');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 09:01:19');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-03 09:03:07');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 09:03:12');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-03 09:16:26');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 09:16:35');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-03 09:17:07');
INSERT INTO `sys_logininfor` VALUES (163, '心理测试1', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-07-03 09:17:16');
INSERT INTO `sys_logininfor` VALUES (164, '心理测试1', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-07-03 09:17:46');
INSERT INTO `sys_logininfor` VALUES (165, 'test1', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2025-07-03 09:18:09');
INSERT INTO `sys_logininfor` VALUES (166, 'test1', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 09:18:21');
INSERT INTO `sys_logininfor` VALUES (167, 'test1', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-03 09:18:56');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 09:19:04');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-03 09:21:05');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 09:21:10');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-03 09:26:38');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 09:26:43');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-03 09:27:12');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 09:27:16');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-03 09:27:32');
INSERT INTO `sys_logininfor` VALUES (176, 'test1', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 09:27:43');
INSERT INTO `sys_logininfor` VALUES (177, 'test1', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-03 09:27:53');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 09:27:58');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 10:03:04');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 13:07:22');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '192.168.0.102', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2025-07-03 15:15:33');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-07-03 16:19:41');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 16:19:49');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 08:51:48');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 09:34:03');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-04 09:43:42');
INSERT INTO `sys_logininfor` VALUES (187, 'wang', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-07-04 09:43:50');
INSERT INTO `sys_logininfor` VALUES (188, 'wang', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 09:44:08');
INSERT INTO `sys_logininfor` VALUES (189, 'wang', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-04 09:45:06');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 09:45:12');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-04 09:46:23');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 09:46:29');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-04 09:46:33');
INSERT INTO `sys_logininfor` VALUES (194, '心理测试者', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-07-04 09:46:47');
INSERT INTO `sys_logininfor` VALUES (195, '心理测试1', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 09:47:01');
INSERT INTO `sys_logininfor` VALUES (196, '心理测试1', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-04 09:47:18');
INSERT INTO `sys_logininfor` VALUES (197, '12', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2025-07-04 10:24:23');
INSERT INTO `sys_logininfor` VALUES (198, '12', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 10:24:47');
INSERT INTO `sys_logininfor` VALUES (199, '12', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-04 10:30:21');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 10:30:34');
INSERT INTO `sys_logininfor` VALUES (201, '12', '192.168.0.102', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2025-07-04 10:37:58');
INSERT INTO `sys_logininfor` VALUES (202, '12', '192.168.0.102', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2025-07-04 10:41:32');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '192.168.0.102', '内网IP', 'Chrome Mobile', 'Android 1.x', '1', '用户不存在/密码错误', '2025-07-04 10:41:48');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '192.168.0.102', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2025-07-04 10:41:56');
INSERT INTO `sys_logininfor` VALUES (205, '12', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-07-04 10:43:52');
INSERT INTO `sys_logininfor` VALUES (206, '12', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 10:43:58');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2025-07-04 11:08:34');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-07-04 12:13:41');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-04 12:19:47');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 12:20:48');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-04 12:20:48');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-07-04 12:21:33');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2025-07-04 12:21:33');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 12:31:20');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-04 12:31:20');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 12:31:51');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '192.168.0.102', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2025-07-04 12:33:01');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3004 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-07-01 16:21:31', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-07-01 16:21:31', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-07-01 16:21:31', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2025-07-01 16:21:31', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-07-01 16:21:31', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-07-01 16:21:31', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-07-01 16:21:31', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-07-01 16:21:31', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-07-01 16:21:31', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-07-01 16:21:31', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-07-01 16:21:31', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-07-01 16:21:31', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-07-01 16:21:31', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-07-01 16:21:31', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-07-01 16:21:31', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-07-01 16:21:31', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-07-01 16:21:31', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-07-01 16:21:31', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-07-01 16:21:31', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-07-01 16:21:31', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-07-01 16:21:31', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-07-01 16:21:31', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-07-01 16:21:31', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-07-01 16:21:31', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '心理测试', 0, 0, 'questions', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'checkbox', 'admin', '2025-07-01 16:51:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '题目管理', 2000, 1, 'topic', 'questions/topic/index', NULL, '', 1, 0, 'C', '0', '0', 'questions:topic:list', '#', 'admin', '2025-07-01 20:46:26', '', NULL, '题目管理菜单');
INSERT INTO `sys_menu` VALUES (2002, '题目管理查询', 2001, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'questions:topic:query', '#', 'admin', '2025-07-01 20:46:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '题目管理新增', 2001, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'questions:topic:add', '#', 'admin', '2025-07-01 20:46:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '题目管理修改', 2001, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'questions:topic:edit', '#', 'admin', '2025-07-01 20:46:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '题目管理删除', 2001, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'questions:topic:remove', '#', 'admin', '2025-07-01 20:46:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '题目管理导出', 2001, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'questions:topic:export', '#', 'admin', '2025-07-01 20:46:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '原型量表测试', 2000, 0, 'questions/topic/questions', 'questions/topic/questions', NULL, '', 1, 0, 'M', '0', '0', 'questions:topic:questions', 'date-range', 'admin', '2025-07-01 21:11:51', 'admin', '2025-07-01 21:13:51', '');
INSERT INTO `sys_menu` VALUES (2008, '测评得分管理', 2000, 1, 'topic', 'questions/topic/index2', NULL, '', 1, 0, 'C', '0', '0', 'questions:topic:list2', '#', 'admin', '2025-07-01 20:46:26', '', NULL, '题目管理菜单');
INSERT INTO `sys_menu` VALUES (2009, '原型测试结果', 2000, 0, '/result', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'build', 'admin', '2025-07-03 14:35:47', 'admin', '2025-07-03 14:36:11', '');
INSERT INTO `sys_menu` VALUES (3000, '得分管理', 2000, 1, 'score', 'questions/score/index', NULL, '', 1, 0, 'C', '0', '0', 'questions:score:list', '#', 'admin', '2025-07-01 20:46:26', '', NULL, '题目管理菜单');
INSERT INTO `sys_menu` VALUES (3002, '得分管理删除', 3000, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'questions:score:remove', '#', 'admin', '2025-07-01 20:46:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3003, '得分管理1', 2000, 1, 'score2', 'questions/score2/index2', NULL, '', 1, 0, 'C', '0', '0', 'questions:score2:list', '#', 'admin', '2025-07-01 20:46:26', '', NULL, '题目管理菜单');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-07-01 16:21:32', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-07-01 16:21:32', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.etsong.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"心理测试\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"questions\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-01 16:51:40', 38);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 6, 'com.etsong.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"topic\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-01 19:27:24', 99);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 2, 'com.etsong.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"topic\",\"className\":\"Topic\",\"columns\":[{\"capJavaField\":\"TopicId\",\"columnComment\":\"题目序号\",\"columnId\":1,\"columnName\":\"topic_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-07-01 19:27:24\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"topicId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TopicContent\",\"columnComment\":\"题干\",\"columnId\":2,\"columnName\":\"topic_content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-07-01 19:27:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"topicContent\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PrototypeId\",\"columnComment\":\"题目类别\",\"columnId\":3,\"columnName\":\"prototype_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-07-01 19:27:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"prototypeId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"题目管理\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"questions\",\"options\":\"{\\\"parentMenuId\\\":2000}\",\"packageName\":\"com.etsong.questions\",\"params\":{\"parentMenuId\":2000},\"parentMenuId\":2000,\"sub\":false,\"tableComment\":\"题目信息表\",\"tableId\":1,\"tableName\":\"topic\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-u', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-01 19:29:23', 35);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 8, 'com.etsong.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"topic\"}', NULL, 0, NULL, '2025-07-01 19:29:28', 326);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.etsong.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"原型量表测试\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"questions/topic/questions\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-01 21:11:51', 109);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.etsong.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-07-01 21:11:51\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"原型量表测试\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"questions/topic/questions\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-01 21:13:51', 22);
INSERT INTO `sys_oper_log` VALUES (106, '角色管理', 2, 'com.etsong.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-07-01 16:21:31\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2007,2001,2002,2003,2004,2005,2006,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-02 10:17:10', 328);
INSERT INTO `sys_oper_log` VALUES (107, '个人信息', 2, 'com.etsong.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 13:07:51', 41);
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 1, 'com.etsong.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"原型测试结果\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"/result\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 14:35:47', 106);
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 2, 'com.etsong.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-07-03 14:35:47\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"原型测试结果\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"/result\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 14:36:11', 41);
INSERT INTO `sys_oper_log` VALUES (110, '角色管理', 1, 'com.etsong.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2007,2009,2008,3000,3002],\"params\":{},\"roleId\":100,\"roleKey\":\"wang\",\"roleName\":\"wang\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 09:42:59', 309);
INSERT INTO `sys_oper_log` VALUES (111, '用户管理', 1, 'com.etsong.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"wang\",\"params\":{},\"postIds\":[],\"roleIds\":[100],\"status\":\"0\",\"userId\":102,\"userName\":\"wang\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 09:43:29', 185);
INSERT INTO `sys_oper_log` VALUES (112, '角色管理', 1, 'com.etsong.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2007,2009],\"params\":{},\"roleId\":101,\"roleKey\":\"test\",\"roleName\":\"心理测试者\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 09:45:54', 37);
INSERT INTO `sys_oper_log` VALUES (113, '用户管理', 2, 'com.etsong.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2025-07-01 17:02:20\",\"delFlag\":\"0\",\"email\":\"\",\"loginDate\":\"2025-07-01 17:02:35\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"心理测试1\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"pwdUpdateDate\":\"2025-07-01 17:02:21\",\"roleIds\":[101],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"心理测试1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 09:46:18', 37);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-07-01 16:21:31', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-07-01 16:21:31', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-07-01 16:21:31', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-07-01 16:21:31', 'admin', '2025-07-02 10:17:10', '普通角色');
INSERT INTO `sys_role` VALUES (100, 'wang', 'wang', 0, '1', 1, 1, '0', '0', 'admin', '2025-07-04 09:42:59', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (101, '心理测试者', 'test', 0, '1', 1, 1, '0', '0', 'admin', '2025-07-04 09:45:54', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 3000);
INSERT INTO `sys_role_menu` VALUES (100, 3002);
INSERT INTO `sys_role_menu` VALUES (101, 2000);
INSERT INTO `sys_role_menu` VALUES (101, 2007);
INSERT INTO `sys_role_menu` VALUES (101, 2009);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '192.168.0.102', '2025-07-04 12:33:01', '2025-07-01 16:21:31', 'admin', '2025-07-01 16:21:31', '', '2025-07-04 12:33:01', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-07-01 16:21:31', '2025-07-01 16:21:31', 'admin', '2025-07-01 16:21:31', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, NULL, '心理测试1', '心理测试1', '00', '', '', '0', '', '$2a$10$IdRs9sy7/pgd5YaPu0khAOBVk1JDsWVhKX87B7B2//WutrV58kUWe', '0', '0', '127.0.0.1', '2025-07-04 09:47:01', '2025-07-01 17:02:21', '', '2025-07-01 17:02:20', 'admin', '2025-07-04 09:47:01', NULL);
INSERT INTO `sys_user` VALUES (101, NULL, 'test1', 'test1', '00', '', '', '0', '', '$2a$10$tc1J2gcs/sa/m6b9IoWLoOFOREL9t5sHazSjlgGtHV0nykJZQDHTC', '0', '0', '127.0.0.1', '2025-07-03 09:27:44', '2025-07-03 09:18:09', '', '2025-07-03 09:18:09', '', '2025-07-03 09:27:43', NULL);
INSERT INTO `sys_user` VALUES (102, NULL, 'wang', 'wang', '00', '', '', '0', '', '$2a$10$zDijI25Upmd3AbMVqLXK0urVK2TQyncnq4tY2mavnP4Rh6d1jBBIq', '0', '0', '127.0.0.1', '2025-07-04 09:44:08', NULL, 'admin', '2025-07-04 09:43:29', '', '2025-07-04 09:44:08', NULL);
INSERT INTO `sys_user` VALUES (103, NULL, '12', '12', '00', '', '', '0', '', '$2a$10$VME14QK/rN00g6xHhKDzzOeFbCkduyEImWZn7GX40rMPFLFGHHGd.', '0', '0', '127.0.0.1', '2025-07-04 10:43:58', '2025-07-04 10:24:23', '', '2025-07-04 10:24:23', '', '2025-07-04 10:43:58', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 101);
INSERT INTO `sys_user_role` VALUES (102, 100);
INSERT INTO `sys_user_role` VALUES (103, 101);

-- ----------------------------
-- Table structure for test_record
-- ----------------------------
DROP TABLE IF EXISTS `test_record`;
CREATE TABLE `test_record`  (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `submit_time` datetime NOT NULL,
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `test_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_record
-- ----------------------------
INSERT INTO `test_record` VALUES (2, 1, '2025-07-03 10:03:26');
INSERT INTO `test_record` VALUES (5, 1, '2025-07-03 10:21:19');
INSERT INTO `test_record` VALUES (7, 1, '2025-07-03 10:32:08');
INSERT INTO `test_record` VALUES (8, 1, '2025-07-03 10:40:01');
INSERT INTO `test_record` VALUES (9, 1, '2025-07-03 10:42:35');
INSERT INTO `test_record` VALUES (10, 1, '2025-07-03 13:30:33');
INSERT INTO `test_record` VALUES (11, 1, '2025-07-03 13:33:51');
INSERT INTO `test_record` VALUES (12, 1, '2025-07-03 13:43:02');
INSERT INTO `test_record` VALUES (13, 1, '2025-07-03 14:06:42');
INSERT INTO `test_record` VALUES (14, 1, '2025-07-03 14:19:49');
INSERT INTO `test_record` VALUES (15, 1, '2025-07-03 14:38:02');
INSERT INTO `test_record` VALUES (16, 1, '2025-07-03 15:04:14');
INSERT INTO `test_record` VALUES (17, 1, '2025-07-03 15:13:58');
INSERT INTO `test_record` VALUES (18, 1, '2025-07-03 16:21:25');
INSERT INTO `test_record` VALUES (19, 1, '2025-07-03 16:24:40');
INSERT INTO `test_record` VALUES (20, 1, '2025-07-03 16:26:49');
INSERT INTO `test_record` VALUES (21, 1, '2025-07-03 16:33:44');
INSERT INTO `test_record` VALUES (22, 1, '2025-07-03 16:37:09');
INSERT INTO `test_record` VALUES (23, 1, '2025-07-03 16:40:56');
INSERT INTO `test_record` VALUES (24, 1, '2025-07-03 16:50:59');
INSERT INTO `test_record` VALUES (25, 1, '2025-07-03 17:01:10');
INSERT INTO `test_record` VALUES (26, 1, '2025-07-04 08:53:26');
INSERT INTO `test_record` VALUES (27, 103, '2025-07-04 10:27:28');
INSERT INTO `test_record` VALUES (28, 103, '2025-07-04 10:33:40');

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic`  (
  `topic_id` int NOT NULL,
  `topic_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prototype_id` int NOT NULL,
  PRIMARY KEY (`topic_id`) USING BTREE,
  INDEX `prototype_id`(`prototype_id` ASC) USING BTREE,
  CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`prototype_id`) REFERENCES `prototype` (`prototype_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES (1, '我会不加判断地就接受外来的消息。', 11);
INSERT INTO `topic` VALUES (2, '生命中太多的变化，会使我迷失方向。', 7);
INSERT INTO `topic` VALUES (3, '自我治疗的过程，能够使我有能力去帮助他人。', 9);
INSERT INTO `topic` VALUES (4, '我会让人悲伤失望。', 7);
INSERT INTO `topic` VALUES (5, '我觉得很安全。', 1);
INSERT INTO `topic` VALUES (6, '我会将恐惧放到一边，去做该做的事。', 3);
INSERT INTO `topic` VALUES (7, '我将别人的需要放在自己的需要之前。', 4);
INSERT INTO `topic` VALUES (8, '无论在哪里，我都尽可能的真实无伪。', 8);
INSERT INTO `topic` VALUES (9, '当生活枯燥无味时，我喜欢改变它，使它有点花样。', 12);
INSERT INTO `topic` VALUES (10, '照顾他人能够令我感到快乐和满足。', 4);
INSERT INTO `topic` VALUES (11, '别人会觉得我很有趣。', 12);
INSERT INTO `topic` VALUES (12, '我觉得自己很感性。', 6);
INSERT INTO `topic` VALUES (13, '我相信人不会故意彼此伤害。', 1);
INSERT INTO `topic` VALUES (14, '童年时，我会有被忽视、被虐待或缺乏父母照顾的经验。', 2);
INSERT INTO `topic` VALUES (15, '施比受更能令我快乐。', 4);
INSERT INTO `topic` VALUES (16, '我同意“曾经爱过而失去，比从未爱过要好。”', 6);
INSERT INTO `topic` VALUES (17, '我完全接纳生命。', 6);
INSERT INTO `topic` VALUES (18, '我会以长远的眼光来看事情。', 11);
INSERT INTO `topic` VALUES (19, '我正在开创自己的生命。', 8);
INSERT INTO `topic` VALUES (20, '我相信我们可以用许多不同的角度，去发现事情美好的一面。', 11);
INSERT INTO `topic` VALUES (21, '我不再是我过去以为的我。', 7);
INSERT INTO `topic` VALUES (22, '生命是一次又一次的心碎。', 2);
INSERT INTO `topic` VALUES (23, '灵修方式(祈祷、静坐)能帮助我，使我的生命过得更好。', 9);
INSERT INTO `topic` VALUES (24, '我发现为别人做事比为自己做事更容易。', 4);
INSERT INTO `topic` VALUES (25, '我很喜欢并满足于自己的人际关系。', 6);
INSERT INTO `topic` VALUES (26, '人们信赖我的指导。', 10);
INSERT INTO `topic` VALUES (27, '我害怕那些有权威的人。', 2);
INSERT INTO `topic` VALUES (28, '我不太把规矩当一回事。', 12);
INSERT INTO `topic` VALUES (29, '我喜欢让人彼此有所关联。', 6);
INSERT INTO `topic` VALUES (30, '我觉得自己被遗弃。', 2);
INSERT INTO `topic` VALUES (31, '即使有很高的成就，我仍会觉得自己未尽全力。', 8);
INSERT INTO `topic` VALUES (32, '我具有领袖的特质。', 10);
INSERT INTO `topic` VALUES (33, '我正在找寻进步的方针。', 5);
INSERT INTO `topic` VALUES (34, '我可以相信别人对我的照顾。', 1);
INSERT INTO `topic` VALUES (35, '我比较喜欢负责任。', 10);
INSERT INTO `topic` VALUES (36, '我试着摆脱幻象、找寻真理。', 11);
INSERT INTO `topic` VALUES (37, '改变内在的思想就会改变我的外在生活。', 9);
INSERT INTO `topic` VALUES (38, '我使别人觉得他们自己很好，或是努力维护增加自然资源。', 10);
INSERT INTO `topic` VALUES (39, '为了维护个人信念，我愿意冒险。', 3);
INSERT INTO `topic` VALUES (40, '我无法坐着并眼睁睁地看着错误发生。', 3);
INSERT INTO `topic` VALUES (41, '我努力使自己更加客观。', 11);
INSERT INTO `topic` VALUES (42, '我的出现常会促使环境或别人有所改变。', 9);
INSERT INTO `topic` VALUES (43, '我喜欢带给别人欢乐。', 12);
INSERT INTO `topic` VALUES (44, '我靠着纪律获得成功。', 3);
INSERT INTO `topic` VALUES (45, '一般而言，我对人们存有好感。', 6);
INSERT INTO `topic` VALUES (46, '我擅长赋予人们适合于他们能力的工作。', 10);
INSERT INTO `topic` VALUES (47, '保持我的独立是很重要的。', 5);
INSERT INTO `topic` VALUES (48, '我相信世上的每个人、每件事都彼此息息相关。', 9);
INSERT INTO `topic` VALUES (49, '世界是个安全的地方。', 1);
INSERT INTO `topic` VALUES (50, '我信赖的人曾抛弃过我。', 2);
INSERT INTO `topic` VALUES (51, '我的内心中觉得骚动不安。', 5);
INSERT INTO `topic` VALUES (52, '我能够扬弃那些不再适合我的事情。', 7);
INSERT INTO `topic` VALUES (53, '我喜欢使严肃的人轻松起来。', 12);
INSERT INTO `topic` VALUES (54, '一点小混乱对灵魂的成长有益。', 12);
INSERT INTO `topic` VALUES (55, '牺牲自己帮助别人，能够使我变成一个比较好的人。', 4);
INSERT INTO `topic` VALUES (56, '我感到很平静。', 11);
INSERT INTO `topic` VALUES (57, '对无礼冒犯的人，我会起来加以对抗。', 3);
INSERT INTO `topic` VALUES (58, '我喜欢改变情势。', 9);
INSERT INTO `topic` VALUES (59, '要使生活全面获得成功的关键是纪律与训练。', 3);
INSERT INTO `topic` VALUES (60, '我的灵感来得很容易。', 8);
INSERT INTO `topic` VALUES (61, '我不靠期待而活。', 7);
INSERT INTO `topic` VALUES (62, '我觉得在某处有个更好的世界在等着我。', 5);
INSERT INTO `topic` VALUES (63, '我相信我所遇到的人都值得信任。', 1);
INSERT INTO `topic` VALUES (64, '我正在将梦想变为事实。', 8);
INSERT INTO `topic` VALUES (65, '我知道我的需要将会被满足。', 1);
INSERT INTO `topic` VALUES (66, '我觉得自己想要突破某些事情。', 7);
INSERT INTO `topic` VALUES (67, '我试着以全心善意来处理事情。', 10);
INSERT INTO `topic` VALUES (68, '我很难拒绝别人。', 4);
INSERT INTO `topic` VALUES (69, '我有许多很棒的主意，却很少去实现它们。', 8);
INSERT INTO `topic` VALUES (70, '我期待生命中会有更美好的事物发生。', 5);
INSERT INTO `topic` VALUES (71, '生命中某个重要的人会让我伤心。', 2);
INSERT INTO `topic` VALUES (72, '对我而言，找寻的过程与结果同等重要。', 5);

-- ----------------------------
-- Table structure for topic_answer
-- ----------------------------
DROP TABLE IF EXISTS `topic_answer`;
CREATE TABLE `topic_answer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `record_id` int NOT NULL,
  `topic_id` int NOT NULL,
  `score` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `record_id`(`record_id` ASC) USING BTREE,
  INDEX `topic_id`(`topic_id` ASC) USING BTREE,
  CONSTRAINT `topic_answer_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `test_record` (`record_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `topic_answer_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1871 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topic_answer
-- ----------------------------
INSERT INTO `topic_answer` VALUES (143, 5, 1, 5);
INSERT INTO `topic_answer` VALUES (144, 5, 2, 5);
INSERT INTO `topic_answer` VALUES (145, 5, 3, 5);
INSERT INTO `topic_answer` VALUES (146, 5, 4, 5);
INSERT INTO `topic_answer` VALUES (147, 5, 5, 5);
INSERT INTO `topic_answer` VALUES (148, 5, 6, 5);
INSERT INTO `topic_answer` VALUES (149, 5, 7, 5);
INSERT INTO `topic_answer` VALUES (150, 5, 8, 5);
INSERT INTO `topic_answer` VALUES (151, 5, 9, 5);
INSERT INTO `topic_answer` VALUES (152, 5, 10, 5);
INSERT INTO `topic_answer` VALUES (153, 5, 11, 5);
INSERT INTO `topic_answer` VALUES (154, 5, 12, 5);
INSERT INTO `topic_answer` VALUES (155, 5, 13, 5);
INSERT INTO `topic_answer` VALUES (156, 5, 14, 5);
INSERT INTO `topic_answer` VALUES (157, 5, 15, 5);
INSERT INTO `topic_answer` VALUES (158, 5, 16, 5);
INSERT INTO `topic_answer` VALUES (159, 5, 17, 5);
INSERT INTO `topic_answer` VALUES (160, 5, 18, 5);
INSERT INTO `topic_answer` VALUES (161, 5, 19, 5);
INSERT INTO `topic_answer` VALUES (162, 5, 20, 5);
INSERT INTO `topic_answer` VALUES (163, 5, 21, 5);
INSERT INTO `topic_answer` VALUES (164, 5, 22, 5);
INSERT INTO `topic_answer` VALUES (165, 5, 23, 5);
INSERT INTO `topic_answer` VALUES (166, 5, 24, 5);
INSERT INTO `topic_answer` VALUES (167, 5, 25, 5);
INSERT INTO `topic_answer` VALUES (168, 5, 26, 5);
INSERT INTO `topic_answer` VALUES (169, 5, 27, 5);
INSERT INTO `topic_answer` VALUES (170, 5, 28, 5);
INSERT INTO `topic_answer` VALUES (171, 5, 29, 5);
INSERT INTO `topic_answer` VALUES (172, 5, 30, 5);
INSERT INTO `topic_answer` VALUES (173, 5, 31, 5);
INSERT INTO `topic_answer` VALUES (174, 5, 32, 5);
INSERT INTO `topic_answer` VALUES (175, 5, 33, 5);
INSERT INTO `topic_answer` VALUES (176, 5, 34, 5);
INSERT INTO `topic_answer` VALUES (177, 5, 35, 5);
INSERT INTO `topic_answer` VALUES (178, 5, 36, 5);
INSERT INTO `topic_answer` VALUES (179, 5, 37, 5);
INSERT INTO `topic_answer` VALUES (180, 5, 38, 5);
INSERT INTO `topic_answer` VALUES (181, 5, 39, 5);
INSERT INTO `topic_answer` VALUES (182, 5, 40, 5);
INSERT INTO `topic_answer` VALUES (183, 5, 41, 5);
INSERT INTO `topic_answer` VALUES (184, 5, 42, 5);
INSERT INTO `topic_answer` VALUES (185, 5, 43, 5);
INSERT INTO `topic_answer` VALUES (186, 5, 44, 5);
INSERT INTO `topic_answer` VALUES (187, 5, 45, 5);
INSERT INTO `topic_answer` VALUES (188, 5, 46, 5);
INSERT INTO `topic_answer` VALUES (189, 5, 47, 5);
INSERT INTO `topic_answer` VALUES (190, 5, 48, 5);
INSERT INTO `topic_answer` VALUES (191, 5, 49, 5);
INSERT INTO `topic_answer` VALUES (192, 5, 50, 5);
INSERT INTO `topic_answer` VALUES (193, 5, 51, 5);
INSERT INTO `topic_answer` VALUES (194, 5, 52, 5);
INSERT INTO `topic_answer` VALUES (195, 5, 53, 5);
INSERT INTO `topic_answer` VALUES (196, 5, 54, 5);
INSERT INTO `topic_answer` VALUES (197, 5, 55, 5);
INSERT INTO `topic_answer` VALUES (198, 5, 56, 5);
INSERT INTO `topic_answer` VALUES (199, 5, 57, 5);
INSERT INTO `topic_answer` VALUES (200, 5, 58, 5);
INSERT INTO `topic_answer` VALUES (201, 5, 59, 5);
INSERT INTO `topic_answer` VALUES (202, 5, 60, 5);
INSERT INTO `topic_answer` VALUES (203, 5, 61, 5);
INSERT INTO `topic_answer` VALUES (204, 5, 62, 5);
INSERT INTO `topic_answer` VALUES (205, 5, 63, 5);
INSERT INTO `topic_answer` VALUES (206, 5, 64, 5);
INSERT INTO `topic_answer` VALUES (207, 5, 65, 5);
INSERT INTO `topic_answer` VALUES (208, 5, 66, 5);
INSERT INTO `topic_answer` VALUES (209, 5, 67, 5);
INSERT INTO `topic_answer` VALUES (210, 5, 68, 5);
INSERT INTO `topic_answer` VALUES (211, 5, 69, 5);
INSERT INTO `topic_answer` VALUES (212, 5, 70, 5);
INSERT INTO `topic_answer` VALUES (213, 5, 71, 5);
INSERT INTO `topic_answer` VALUES (214, 5, 72, 5);
INSERT INTO `topic_answer` VALUES (287, 7, 1, 5);
INSERT INTO `topic_answer` VALUES (288, 7, 2, 5);
INSERT INTO `topic_answer` VALUES (289, 7, 3, 5);
INSERT INTO `topic_answer` VALUES (290, 7, 4, 5);
INSERT INTO `topic_answer` VALUES (291, 7, 5, 5);
INSERT INTO `topic_answer` VALUES (292, 7, 6, 5);
INSERT INTO `topic_answer` VALUES (293, 7, 7, 5);
INSERT INTO `topic_answer` VALUES (294, 7, 8, 5);
INSERT INTO `topic_answer` VALUES (295, 7, 9, 5);
INSERT INTO `topic_answer` VALUES (296, 7, 10, 5);
INSERT INTO `topic_answer` VALUES (297, 7, 11, 5);
INSERT INTO `topic_answer` VALUES (298, 7, 12, 5);
INSERT INTO `topic_answer` VALUES (299, 7, 13, 5);
INSERT INTO `topic_answer` VALUES (300, 7, 14, 5);
INSERT INTO `topic_answer` VALUES (301, 7, 15, 5);
INSERT INTO `topic_answer` VALUES (302, 7, 16, 5);
INSERT INTO `topic_answer` VALUES (303, 7, 17, 5);
INSERT INTO `topic_answer` VALUES (304, 7, 18, 5);
INSERT INTO `topic_answer` VALUES (305, 7, 19, 5);
INSERT INTO `topic_answer` VALUES (306, 7, 20, 5);
INSERT INTO `topic_answer` VALUES (307, 7, 21, 5);
INSERT INTO `topic_answer` VALUES (308, 7, 22, 5);
INSERT INTO `topic_answer` VALUES (309, 7, 23, 5);
INSERT INTO `topic_answer` VALUES (310, 7, 24, 5);
INSERT INTO `topic_answer` VALUES (311, 7, 25, 5);
INSERT INTO `topic_answer` VALUES (312, 7, 26, 5);
INSERT INTO `topic_answer` VALUES (313, 7, 27, 5);
INSERT INTO `topic_answer` VALUES (314, 7, 28, 5);
INSERT INTO `topic_answer` VALUES (315, 7, 29, 5);
INSERT INTO `topic_answer` VALUES (316, 7, 30, 5);
INSERT INTO `topic_answer` VALUES (317, 7, 31, 5);
INSERT INTO `topic_answer` VALUES (318, 7, 32, 5);
INSERT INTO `topic_answer` VALUES (319, 7, 33, 5);
INSERT INTO `topic_answer` VALUES (320, 7, 34, 5);
INSERT INTO `topic_answer` VALUES (321, 7, 35, 5);
INSERT INTO `topic_answer` VALUES (322, 7, 36, 5);
INSERT INTO `topic_answer` VALUES (323, 7, 37, 5);
INSERT INTO `topic_answer` VALUES (324, 7, 38, 5);
INSERT INTO `topic_answer` VALUES (325, 7, 39, 5);
INSERT INTO `topic_answer` VALUES (326, 7, 40, 5);
INSERT INTO `topic_answer` VALUES (327, 7, 41, 5);
INSERT INTO `topic_answer` VALUES (328, 7, 42, 5);
INSERT INTO `topic_answer` VALUES (329, 7, 43, 5);
INSERT INTO `topic_answer` VALUES (330, 7, 44, 5);
INSERT INTO `topic_answer` VALUES (331, 7, 45, 5);
INSERT INTO `topic_answer` VALUES (332, 7, 46, 5);
INSERT INTO `topic_answer` VALUES (333, 7, 47, 5);
INSERT INTO `topic_answer` VALUES (334, 7, 48, 5);
INSERT INTO `topic_answer` VALUES (335, 7, 49, 5);
INSERT INTO `topic_answer` VALUES (336, 7, 50, 5);
INSERT INTO `topic_answer` VALUES (337, 7, 51, 5);
INSERT INTO `topic_answer` VALUES (338, 7, 52, 5);
INSERT INTO `topic_answer` VALUES (339, 7, 53, 5);
INSERT INTO `topic_answer` VALUES (340, 7, 54, 5);
INSERT INTO `topic_answer` VALUES (341, 7, 55, 5);
INSERT INTO `topic_answer` VALUES (342, 7, 56, 5);
INSERT INTO `topic_answer` VALUES (343, 7, 57, 5);
INSERT INTO `topic_answer` VALUES (344, 7, 58, 5);
INSERT INTO `topic_answer` VALUES (345, 7, 59, 5);
INSERT INTO `topic_answer` VALUES (346, 7, 60, 5);
INSERT INTO `topic_answer` VALUES (347, 7, 61, 5);
INSERT INTO `topic_answer` VALUES (348, 7, 62, 5);
INSERT INTO `topic_answer` VALUES (349, 7, 63, 5);
INSERT INTO `topic_answer` VALUES (350, 7, 64, 5);
INSERT INTO `topic_answer` VALUES (351, 7, 65, 5);
INSERT INTO `topic_answer` VALUES (352, 7, 66, 5);
INSERT INTO `topic_answer` VALUES (353, 7, 67, 5);
INSERT INTO `topic_answer` VALUES (354, 7, 68, 5);
INSERT INTO `topic_answer` VALUES (355, 7, 69, 5);
INSERT INTO `topic_answer` VALUES (356, 7, 70, 5);
INSERT INTO `topic_answer` VALUES (357, 7, 71, 5);
INSERT INTO `topic_answer` VALUES (358, 7, 72, 5);
INSERT INTO `topic_answer` VALUES (359, 8, 1, 5);
INSERT INTO `topic_answer` VALUES (360, 8, 2, 5);
INSERT INTO `topic_answer` VALUES (361, 8, 3, 5);
INSERT INTO `topic_answer` VALUES (362, 8, 4, 5);
INSERT INTO `topic_answer` VALUES (363, 8, 5, 5);
INSERT INTO `topic_answer` VALUES (364, 8, 6, 5);
INSERT INTO `topic_answer` VALUES (365, 8, 7, 5);
INSERT INTO `topic_answer` VALUES (366, 8, 8, 5);
INSERT INTO `topic_answer` VALUES (367, 8, 9, 5);
INSERT INTO `topic_answer` VALUES (368, 8, 10, 5);
INSERT INTO `topic_answer` VALUES (369, 8, 11, 5);
INSERT INTO `topic_answer` VALUES (370, 8, 12, 5);
INSERT INTO `topic_answer` VALUES (371, 8, 13, 5);
INSERT INTO `topic_answer` VALUES (372, 8, 14, 5);
INSERT INTO `topic_answer` VALUES (373, 8, 15, 5);
INSERT INTO `topic_answer` VALUES (374, 8, 16, 5);
INSERT INTO `topic_answer` VALUES (375, 8, 17, 5);
INSERT INTO `topic_answer` VALUES (376, 8, 18, 5);
INSERT INTO `topic_answer` VALUES (377, 8, 19, 5);
INSERT INTO `topic_answer` VALUES (378, 8, 20, 5);
INSERT INTO `topic_answer` VALUES (379, 8, 21, 5);
INSERT INTO `topic_answer` VALUES (380, 8, 22, 5);
INSERT INTO `topic_answer` VALUES (381, 8, 23, 5);
INSERT INTO `topic_answer` VALUES (382, 8, 24, 5);
INSERT INTO `topic_answer` VALUES (383, 8, 25, 5);
INSERT INTO `topic_answer` VALUES (384, 8, 26, 5);
INSERT INTO `topic_answer` VALUES (385, 8, 27, 5);
INSERT INTO `topic_answer` VALUES (386, 8, 28, 5);
INSERT INTO `topic_answer` VALUES (387, 8, 29, 5);
INSERT INTO `topic_answer` VALUES (388, 8, 30, 5);
INSERT INTO `topic_answer` VALUES (389, 8, 31, 5);
INSERT INTO `topic_answer` VALUES (390, 8, 32, 5);
INSERT INTO `topic_answer` VALUES (391, 8, 33, 5);
INSERT INTO `topic_answer` VALUES (392, 8, 34, 5);
INSERT INTO `topic_answer` VALUES (393, 8, 35, 5);
INSERT INTO `topic_answer` VALUES (394, 8, 36, 5);
INSERT INTO `topic_answer` VALUES (395, 8, 37, 5);
INSERT INTO `topic_answer` VALUES (396, 8, 38, 5);
INSERT INTO `topic_answer` VALUES (397, 8, 39, 5);
INSERT INTO `topic_answer` VALUES (398, 8, 40, 5);
INSERT INTO `topic_answer` VALUES (399, 8, 41, 5);
INSERT INTO `topic_answer` VALUES (400, 8, 42, 5);
INSERT INTO `topic_answer` VALUES (401, 8, 43, 5);
INSERT INTO `topic_answer` VALUES (402, 8, 44, 5);
INSERT INTO `topic_answer` VALUES (403, 8, 45, 5);
INSERT INTO `topic_answer` VALUES (404, 8, 46, 5);
INSERT INTO `topic_answer` VALUES (405, 8, 47, 5);
INSERT INTO `topic_answer` VALUES (406, 8, 48, 5);
INSERT INTO `topic_answer` VALUES (407, 8, 49, 5);
INSERT INTO `topic_answer` VALUES (408, 8, 50, 5);
INSERT INTO `topic_answer` VALUES (409, 8, 51, 5);
INSERT INTO `topic_answer` VALUES (410, 8, 52, 5);
INSERT INTO `topic_answer` VALUES (411, 8, 53, 5);
INSERT INTO `topic_answer` VALUES (412, 8, 54, 5);
INSERT INTO `topic_answer` VALUES (413, 8, 55, 5);
INSERT INTO `topic_answer` VALUES (414, 8, 56, 5);
INSERT INTO `topic_answer` VALUES (415, 8, 57, 5);
INSERT INTO `topic_answer` VALUES (416, 8, 58, 5);
INSERT INTO `topic_answer` VALUES (417, 8, 59, 5);
INSERT INTO `topic_answer` VALUES (418, 8, 60, 5);
INSERT INTO `topic_answer` VALUES (419, 8, 61, 5);
INSERT INTO `topic_answer` VALUES (420, 8, 62, 5);
INSERT INTO `topic_answer` VALUES (421, 8, 63, 5);
INSERT INTO `topic_answer` VALUES (422, 8, 64, 5);
INSERT INTO `topic_answer` VALUES (423, 8, 65, 5);
INSERT INTO `topic_answer` VALUES (424, 8, 66, 5);
INSERT INTO `topic_answer` VALUES (425, 8, 67, 5);
INSERT INTO `topic_answer` VALUES (426, 8, 68, 5);
INSERT INTO `topic_answer` VALUES (427, 8, 69, 5);
INSERT INTO `topic_answer` VALUES (428, 8, 70, 5);
INSERT INTO `topic_answer` VALUES (429, 8, 71, 5);
INSERT INTO `topic_answer` VALUES (430, 8, 72, 5);
INSERT INTO `topic_answer` VALUES (431, 9, 1, 5);
INSERT INTO `topic_answer` VALUES (432, 9, 2, 5);
INSERT INTO `topic_answer` VALUES (433, 9, 3, 5);
INSERT INTO `topic_answer` VALUES (434, 9, 4, 5);
INSERT INTO `topic_answer` VALUES (435, 9, 5, 5);
INSERT INTO `topic_answer` VALUES (436, 9, 6, 5);
INSERT INTO `topic_answer` VALUES (437, 9, 7, 5);
INSERT INTO `topic_answer` VALUES (438, 9, 8, 5);
INSERT INTO `topic_answer` VALUES (439, 9, 9, 5);
INSERT INTO `topic_answer` VALUES (440, 9, 10, 5);
INSERT INTO `topic_answer` VALUES (441, 9, 11, 5);
INSERT INTO `topic_answer` VALUES (442, 9, 12, 5);
INSERT INTO `topic_answer` VALUES (443, 9, 13, 5);
INSERT INTO `topic_answer` VALUES (444, 9, 14, 5);
INSERT INTO `topic_answer` VALUES (445, 9, 15, 5);
INSERT INTO `topic_answer` VALUES (446, 9, 16, 5);
INSERT INTO `topic_answer` VALUES (447, 9, 17, 5);
INSERT INTO `topic_answer` VALUES (448, 9, 18, 5);
INSERT INTO `topic_answer` VALUES (449, 9, 19, 5);
INSERT INTO `topic_answer` VALUES (450, 9, 20, 5);
INSERT INTO `topic_answer` VALUES (451, 9, 21, 5);
INSERT INTO `topic_answer` VALUES (452, 9, 22, 5);
INSERT INTO `topic_answer` VALUES (453, 9, 23, 5);
INSERT INTO `topic_answer` VALUES (454, 9, 24, 5);
INSERT INTO `topic_answer` VALUES (455, 9, 25, 5);
INSERT INTO `topic_answer` VALUES (456, 9, 26, 5);
INSERT INTO `topic_answer` VALUES (457, 9, 27, 5);
INSERT INTO `topic_answer` VALUES (458, 9, 28, 5);
INSERT INTO `topic_answer` VALUES (459, 9, 29, 5);
INSERT INTO `topic_answer` VALUES (460, 9, 30, 5);
INSERT INTO `topic_answer` VALUES (461, 9, 31, 5);
INSERT INTO `topic_answer` VALUES (462, 9, 32, 5);
INSERT INTO `topic_answer` VALUES (463, 9, 33, 5);
INSERT INTO `topic_answer` VALUES (464, 9, 34, 5);
INSERT INTO `topic_answer` VALUES (465, 9, 35, 5);
INSERT INTO `topic_answer` VALUES (466, 9, 36, 5);
INSERT INTO `topic_answer` VALUES (467, 9, 37, 5);
INSERT INTO `topic_answer` VALUES (468, 9, 38, 5);
INSERT INTO `topic_answer` VALUES (469, 9, 39, 5);
INSERT INTO `topic_answer` VALUES (470, 9, 40, 5);
INSERT INTO `topic_answer` VALUES (471, 9, 41, 5);
INSERT INTO `topic_answer` VALUES (472, 9, 42, 5);
INSERT INTO `topic_answer` VALUES (473, 9, 43, 5);
INSERT INTO `topic_answer` VALUES (474, 9, 44, 5);
INSERT INTO `topic_answer` VALUES (475, 9, 45, 5);
INSERT INTO `topic_answer` VALUES (476, 9, 46, 5);
INSERT INTO `topic_answer` VALUES (477, 9, 47, 5);
INSERT INTO `topic_answer` VALUES (478, 9, 48, 5);
INSERT INTO `topic_answer` VALUES (479, 9, 49, 5);
INSERT INTO `topic_answer` VALUES (480, 9, 50, 5);
INSERT INTO `topic_answer` VALUES (481, 9, 51, 5);
INSERT INTO `topic_answer` VALUES (482, 9, 52, 5);
INSERT INTO `topic_answer` VALUES (483, 9, 53, 5);
INSERT INTO `topic_answer` VALUES (484, 9, 54, 5);
INSERT INTO `topic_answer` VALUES (485, 9, 55, 5);
INSERT INTO `topic_answer` VALUES (486, 9, 56, 5);
INSERT INTO `topic_answer` VALUES (487, 9, 57, 5);
INSERT INTO `topic_answer` VALUES (488, 9, 58, 5);
INSERT INTO `topic_answer` VALUES (489, 9, 59, 5);
INSERT INTO `topic_answer` VALUES (490, 9, 60, 5);
INSERT INTO `topic_answer` VALUES (491, 9, 61, 5);
INSERT INTO `topic_answer` VALUES (492, 9, 62, 5);
INSERT INTO `topic_answer` VALUES (493, 9, 63, 5);
INSERT INTO `topic_answer` VALUES (494, 9, 64, 5);
INSERT INTO `topic_answer` VALUES (495, 9, 65, 5);
INSERT INTO `topic_answer` VALUES (496, 9, 66, 5);
INSERT INTO `topic_answer` VALUES (497, 9, 67, 5);
INSERT INTO `topic_answer` VALUES (498, 9, 68, 5);
INSERT INTO `topic_answer` VALUES (499, 9, 69, 5);
INSERT INTO `topic_answer` VALUES (500, 9, 70, 5);
INSERT INTO `topic_answer` VALUES (501, 9, 71, 5);
INSERT INTO `topic_answer` VALUES (502, 9, 72, 5);
INSERT INTO `topic_answer` VALUES (503, 10, 1, 5);
INSERT INTO `topic_answer` VALUES (504, 10, 2, 5);
INSERT INTO `topic_answer` VALUES (505, 10, 3, 5);
INSERT INTO `topic_answer` VALUES (506, 10, 4, 5);
INSERT INTO `topic_answer` VALUES (507, 10, 5, 5);
INSERT INTO `topic_answer` VALUES (508, 10, 6, 5);
INSERT INTO `topic_answer` VALUES (509, 10, 7, 5);
INSERT INTO `topic_answer` VALUES (510, 10, 8, 5);
INSERT INTO `topic_answer` VALUES (511, 10, 9, 5);
INSERT INTO `topic_answer` VALUES (512, 10, 10, 5);
INSERT INTO `topic_answer` VALUES (513, 10, 11, 5);
INSERT INTO `topic_answer` VALUES (514, 10, 12, 5);
INSERT INTO `topic_answer` VALUES (515, 10, 13, 5);
INSERT INTO `topic_answer` VALUES (516, 10, 14, 5);
INSERT INTO `topic_answer` VALUES (517, 10, 15, 5);
INSERT INTO `topic_answer` VALUES (518, 10, 16, 5);
INSERT INTO `topic_answer` VALUES (519, 10, 17, 5);
INSERT INTO `topic_answer` VALUES (520, 10, 18, 5);
INSERT INTO `topic_answer` VALUES (521, 10, 19, 5);
INSERT INTO `topic_answer` VALUES (522, 10, 20, 5);
INSERT INTO `topic_answer` VALUES (523, 10, 21, 5);
INSERT INTO `topic_answer` VALUES (524, 10, 22, 5);
INSERT INTO `topic_answer` VALUES (525, 10, 23, 5);
INSERT INTO `topic_answer` VALUES (526, 10, 24, 5);
INSERT INTO `topic_answer` VALUES (527, 10, 25, 5);
INSERT INTO `topic_answer` VALUES (528, 10, 26, 5);
INSERT INTO `topic_answer` VALUES (529, 10, 27, 5);
INSERT INTO `topic_answer` VALUES (530, 10, 28, 5);
INSERT INTO `topic_answer` VALUES (531, 10, 29, 5);
INSERT INTO `topic_answer` VALUES (532, 10, 30, 5);
INSERT INTO `topic_answer` VALUES (533, 10, 31, 5);
INSERT INTO `topic_answer` VALUES (534, 10, 32, 5);
INSERT INTO `topic_answer` VALUES (535, 10, 33, 5);
INSERT INTO `topic_answer` VALUES (536, 10, 34, 5);
INSERT INTO `topic_answer` VALUES (537, 10, 35, 5);
INSERT INTO `topic_answer` VALUES (538, 10, 36, 5);
INSERT INTO `topic_answer` VALUES (539, 10, 37, 5);
INSERT INTO `topic_answer` VALUES (540, 10, 38, 5);
INSERT INTO `topic_answer` VALUES (541, 10, 39, 5);
INSERT INTO `topic_answer` VALUES (542, 10, 40, 5);
INSERT INTO `topic_answer` VALUES (543, 10, 41, 5);
INSERT INTO `topic_answer` VALUES (544, 10, 42, 5);
INSERT INTO `topic_answer` VALUES (545, 10, 43, 5);
INSERT INTO `topic_answer` VALUES (546, 10, 44, 5);
INSERT INTO `topic_answer` VALUES (547, 10, 45, 5);
INSERT INTO `topic_answer` VALUES (548, 10, 46, 5);
INSERT INTO `topic_answer` VALUES (549, 10, 47, 5);
INSERT INTO `topic_answer` VALUES (550, 10, 48, 5);
INSERT INTO `topic_answer` VALUES (551, 10, 49, 5);
INSERT INTO `topic_answer` VALUES (552, 10, 50, 5);
INSERT INTO `topic_answer` VALUES (553, 10, 51, 5);
INSERT INTO `topic_answer` VALUES (554, 10, 52, 5);
INSERT INTO `topic_answer` VALUES (555, 10, 53, 5);
INSERT INTO `topic_answer` VALUES (556, 10, 54, 5);
INSERT INTO `topic_answer` VALUES (557, 10, 55, 5);
INSERT INTO `topic_answer` VALUES (558, 10, 56, 5);
INSERT INTO `topic_answer` VALUES (559, 10, 57, 5);
INSERT INTO `topic_answer` VALUES (560, 10, 58, 5);
INSERT INTO `topic_answer` VALUES (561, 10, 59, 5);
INSERT INTO `topic_answer` VALUES (562, 10, 60, 5);
INSERT INTO `topic_answer` VALUES (563, 10, 61, 5);
INSERT INTO `topic_answer` VALUES (564, 10, 62, 5);
INSERT INTO `topic_answer` VALUES (565, 10, 63, 5);
INSERT INTO `topic_answer` VALUES (566, 10, 64, 5);
INSERT INTO `topic_answer` VALUES (567, 10, 65, 5);
INSERT INTO `topic_answer` VALUES (568, 10, 66, 5);
INSERT INTO `topic_answer` VALUES (569, 10, 67, 5);
INSERT INTO `topic_answer` VALUES (570, 10, 68, 5);
INSERT INTO `topic_answer` VALUES (571, 10, 69, 5);
INSERT INTO `topic_answer` VALUES (572, 10, 70, 5);
INSERT INTO `topic_answer` VALUES (573, 10, 71, 5);
INSERT INTO `topic_answer` VALUES (574, 10, 72, 5);
INSERT INTO `topic_answer` VALUES (575, 11, 1, 1);
INSERT INTO `topic_answer` VALUES (576, 11, 2, 1);
INSERT INTO `topic_answer` VALUES (577, 11, 3, 1);
INSERT INTO `topic_answer` VALUES (578, 11, 4, 1);
INSERT INTO `topic_answer` VALUES (579, 11, 5, 1);
INSERT INTO `topic_answer` VALUES (580, 11, 6, 1);
INSERT INTO `topic_answer` VALUES (581, 11, 7, 1);
INSERT INTO `topic_answer` VALUES (582, 11, 8, 1);
INSERT INTO `topic_answer` VALUES (583, 11, 9, 1);
INSERT INTO `topic_answer` VALUES (584, 11, 10, 1);
INSERT INTO `topic_answer` VALUES (585, 11, 11, 1);
INSERT INTO `topic_answer` VALUES (586, 11, 12, 1);
INSERT INTO `topic_answer` VALUES (587, 11, 13, 1);
INSERT INTO `topic_answer` VALUES (588, 11, 14, 1);
INSERT INTO `topic_answer` VALUES (589, 11, 15, 1);
INSERT INTO `topic_answer` VALUES (590, 11, 16, 1);
INSERT INTO `topic_answer` VALUES (591, 11, 17, 1);
INSERT INTO `topic_answer` VALUES (592, 11, 18, 1);
INSERT INTO `topic_answer` VALUES (593, 11, 19, 1);
INSERT INTO `topic_answer` VALUES (594, 11, 20, 1);
INSERT INTO `topic_answer` VALUES (595, 11, 21, 1);
INSERT INTO `topic_answer` VALUES (596, 11, 22, 1);
INSERT INTO `topic_answer` VALUES (597, 11, 23, 1);
INSERT INTO `topic_answer` VALUES (598, 11, 24, 1);
INSERT INTO `topic_answer` VALUES (599, 11, 25, 1);
INSERT INTO `topic_answer` VALUES (600, 11, 26, 1);
INSERT INTO `topic_answer` VALUES (601, 11, 27, 1);
INSERT INTO `topic_answer` VALUES (602, 11, 28, 1);
INSERT INTO `topic_answer` VALUES (603, 11, 29, 1);
INSERT INTO `topic_answer` VALUES (604, 11, 30, 1);
INSERT INTO `topic_answer` VALUES (605, 11, 31, 1);
INSERT INTO `topic_answer` VALUES (606, 11, 32, 1);
INSERT INTO `topic_answer` VALUES (607, 11, 33, 1);
INSERT INTO `topic_answer` VALUES (608, 11, 34, 1);
INSERT INTO `topic_answer` VALUES (609, 11, 35, 1);
INSERT INTO `topic_answer` VALUES (610, 11, 36, 1);
INSERT INTO `topic_answer` VALUES (611, 11, 37, 1);
INSERT INTO `topic_answer` VALUES (612, 11, 38, 1);
INSERT INTO `topic_answer` VALUES (613, 11, 39, 1);
INSERT INTO `topic_answer` VALUES (614, 11, 40, 1);
INSERT INTO `topic_answer` VALUES (615, 11, 41, 1);
INSERT INTO `topic_answer` VALUES (616, 11, 42, 1);
INSERT INTO `topic_answer` VALUES (617, 11, 43, 1);
INSERT INTO `topic_answer` VALUES (618, 11, 44, 1);
INSERT INTO `topic_answer` VALUES (619, 11, 45, 1);
INSERT INTO `topic_answer` VALUES (620, 11, 46, 1);
INSERT INTO `topic_answer` VALUES (621, 11, 47, 1);
INSERT INTO `topic_answer` VALUES (622, 11, 48, 1);
INSERT INTO `topic_answer` VALUES (623, 11, 49, 1);
INSERT INTO `topic_answer` VALUES (624, 11, 50, 1);
INSERT INTO `topic_answer` VALUES (625, 11, 51, 1);
INSERT INTO `topic_answer` VALUES (626, 11, 52, 1);
INSERT INTO `topic_answer` VALUES (627, 11, 53, 1);
INSERT INTO `topic_answer` VALUES (628, 11, 54, 1);
INSERT INTO `topic_answer` VALUES (629, 11, 55, 1);
INSERT INTO `topic_answer` VALUES (630, 11, 56, 1);
INSERT INTO `topic_answer` VALUES (631, 11, 57, 1);
INSERT INTO `topic_answer` VALUES (632, 11, 58, 1);
INSERT INTO `topic_answer` VALUES (633, 11, 59, 1);
INSERT INTO `topic_answer` VALUES (634, 11, 60, 1);
INSERT INTO `topic_answer` VALUES (635, 11, 61, 1);
INSERT INTO `topic_answer` VALUES (636, 11, 62, 1);
INSERT INTO `topic_answer` VALUES (637, 11, 63, 1);
INSERT INTO `topic_answer` VALUES (638, 11, 64, 1);
INSERT INTO `topic_answer` VALUES (639, 11, 65, 1);
INSERT INTO `topic_answer` VALUES (640, 11, 66, 1);
INSERT INTO `topic_answer` VALUES (641, 11, 67, 1);
INSERT INTO `topic_answer` VALUES (642, 11, 68, 1);
INSERT INTO `topic_answer` VALUES (643, 11, 69, 1);
INSERT INTO `topic_answer` VALUES (644, 11, 70, 1);
INSERT INTO `topic_answer` VALUES (645, 11, 71, 1);
INSERT INTO `topic_answer` VALUES (646, 11, 72, 1);
INSERT INTO `topic_answer` VALUES (647, 12, 1, 1);
INSERT INTO `topic_answer` VALUES (648, 12, 2, 1);
INSERT INTO `topic_answer` VALUES (649, 12, 3, 1);
INSERT INTO `topic_answer` VALUES (650, 12, 4, 1);
INSERT INTO `topic_answer` VALUES (651, 12, 5, 1);
INSERT INTO `topic_answer` VALUES (652, 12, 6, 1);
INSERT INTO `topic_answer` VALUES (653, 12, 7, 1);
INSERT INTO `topic_answer` VALUES (654, 12, 8, 1);
INSERT INTO `topic_answer` VALUES (655, 12, 9, 1);
INSERT INTO `topic_answer` VALUES (656, 12, 10, 1);
INSERT INTO `topic_answer` VALUES (657, 12, 11, 1);
INSERT INTO `topic_answer` VALUES (658, 12, 12, 1);
INSERT INTO `topic_answer` VALUES (659, 12, 13, 1);
INSERT INTO `topic_answer` VALUES (660, 12, 14, 1);
INSERT INTO `topic_answer` VALUES (661, 12, 15, 1);
INSERT INTO `topic_answer` VALUES (662, 12, 16, 1);
INSERT INTO `topic_answer` VALUES (663, 12, 17, 1);
INSERT INTO `topic_answer` VALUES (664, 12, 18, 1);
INSERT INTO `topic_answer` VALUES (665, 12, 19, 1);
INSERT INTO `topic_answer` VALUES (666, 12, 20, 1);
INSERT INTO `topic_answer` VALUES (667, 12, 21, 1);
INSERT INTO `topic_answer` VALUES (668, 12, 22, 1);
INSERT INTO `topic_answer` VALUES (669, 12, 23, 1);
INSERT INTO `topic_answer` VALUES (670, 12, 24, 1);
INSERT INTO `topic_answer` VALUES (671, 12, 25, 1);
INSERT INTO `topic_answer` VALUES (672, 12, 26, 1);
INSERT INTO `topic_answer` VALUES (673, 12, 27, 1);
INSERT INTO `topic_answer` VALUES (674, 12, 28, 1);
INSERT INTO `topic_answer` VALUES (675, 12, 29, 1);
INSERT INTO `topic_answer` VALUES (676, 12, 30, 1);
INSERT INTO `topic_answer` VALUES (677, 12, 31, 1);
INSERT INTO `topic_answer` VALUES (678, 12, 32, 1);
INSERT INTO `topic_answer` VALUES (679, 12, 33, 1);
INSERT INTO `topic_answer` VALUES (680, 12, 34, 1);
INSERT INTO `topic_answer` VALUES (681, 12, 35, 1);
INSERT INTO `topic_answer` VALUES (682, 12, 36, 1);
INSERT INTO `topic_answer` VALUES (683, 12, 37, 1);
INSERT INTO `topic_answer` VALUES (684, 12, 38, 1);
INSERT INTO `topic_answer` VALUES (685, 12, 39, 1);
INSERT INTO `topic_answer` VALUES (686, 12, 40, 1);
INSERT INTO `topic_answer` VALUES (687, 12, 41, 1);
INSERT INTO `topic_answer` VALUES (688, 12, 42, 1);
INSERT INTO `topic_answer` VALUES (689, 12, 43, 1);
INSERT INTO `topic_answer` VALUES (690, 12, 44, 1);
INSERT INTO `topic_answer` VALUES (691, 12, 45, 1);
INSERT INTO `topic_answer` VALUES (692, 12, 46, 1);
INSERT INTO `topic_answer` VALUES (693, 12, 47, 1);
INSERT INTO `topic_answer` VALUES (694, 12, 48, 1);
INSERT INTO `topic_answer` VALUES (695, 12, 49, 1);
INSERT INTO `topic_answer` VALUES (696, 12, 50, 1);
INSERT INTO `topic_answer` VALUES (697, 12, 51, 1);
INSERT INTO `topic_answer` VALUES (698, 12, 52, 1);
INSERT INTO `topic_answer` VALUES (699, 12, 53, 1);
INSERT INTO `topic_answer` VALUES (700, 12, 54, 1);
INSERT INTO `topic_answer` VALUES (701, 12, 55, 1);
INSERT INTO `topic_answer` VALUES (702, 12, 56, 1);
INSERT INTO `topic_answer` VALUES (703, 12, 57, 1);
INSERT INTO `topic_answer` VALUES (704, 12, 58, 1);
INSERT INTO `topic_answer` VALUES (705, 12, 59, 1);
INSERT INTO `topic_answer` VALUES (706, 12, 60, 1);
INSERT INTO `topic_answer` VALUES (707, 12, 61, 1);
INSERT INTO `topic_answer` VALUES (708, 12, 62, 1);
INSERT INTO `topic_answer` VALUES (709, 12, 63, 1);
INSERT INTO `topic_answer` VALUES (710, 12, 64, 1);
INSERT INTO `topic_answer` VALUES (711, 12, 65, 1);
INSERT INTO `topic_answer` VALUES (712, 12, 66, 1);
INSERT INTO `topic_answer` VALUES (713, 12, 67, 1);
INSERT INTO `topic_answer` VALUES (714, 12, 68, 1);
INSERT INTO `topic_answer` VALUES (715, 12, 69, 1);
INSERT INTO `topic_answer` VALUES (716, 12, 70, 1);
INSERT INTO `topic_answer` VALUES (717, 12, 71, 1);
INSERT INTO `topic_answer` VALUES (718, 12, 72, 1);
INSERT INTO `topic_answer` VALUES (719, 13, 1, 1);
INSERT INTO `topic_answer` VALUES (720, 13, 2, 1);
INSERT INTO `topic_answer` VALUES (721, 13, 3, 1);
INSERT INTO `topic_answer` VALUES (722, 13, 4, 1);
INSERT INTO `topic_answer` VALUES (723, 13, 5, 1);
INSERT INTO `topic_answer` VALUES (724, 13, 6, 1);
INSERT INTO `topic_answer` VALUES (725, 13, 7, 1);
INSERT INTO `topic_answer` VALUES (726, 13, 8, 1);
INSERT INTO `topic_answer` VALUES (727, 13, 9, 1);
INSERT INTO `topic_answer` VALUES (728, 13, 10, 1);
INSERT INTO `topic_answer` VALUES (729, 13, 11, 1);
INSERT INTO `topic_answer` VALUES (730, 13, 12, 1);
INSERT INTO `topic_answer` VALUES (731, 13, 13, 1);
INSERT INTO `topic_answer` VALUES (732, 13, 14, 1);
INSERT INTO `topic_answer` VALUES (733, 13, 15, 1);
INSERT INTO `topic_answer` VALUES (734, 13, 16, 1);
INSERT INTO `topic_answer` VALUES (735, 13, 17, 1);
INSERT INTO `topic_answer` VALUES (736, 13, 18, 1);
INSERT INTO `topic_answer` VALUES (737, 13, 19, 1);
INSERT INTO `topic_answer` VALUES (738, 13, 20, 1);
INSERT INTO `topic_answer` VALUES (739, 13, 21, 1);
INSERT INTO `topic_answer` VALUES (740, 13, 22, 1);
INSERT INTO `topic_answer` VALUES (741, 13, 23, 1);
INSERT INTO `topic_answer` VALUES (742, 13, 24, 1);
INSERT INTO `topic_answer` VALUES (743, 13, 25, 1);
INSERT INTO `topic_answer` VALUES (744, 13, 26, 1);
INSERT INTO `topic_answer` VALUES (745, 13, 27, 1);
INSERT INTO `topic_answer` VALUES (746, 13, 28, 1);
INSERT INTO `topic_answer` VALUES (747, 13, 29, 1);
INSERT INTO `topic_answer` VALUES (748, 13, 30, 1);
INSERT INTO `topic_answer` VALUES (749, 13, 31, 1);
INSERT INTO `topic_answer` VALUES (750, 13, 32, 1);
INSERT INTO `topic_answer` VALUES (751, 13, 33, 1);
INSERT INTO `topic_answer` VALUES (752, 13, 34, 1);
INSERT INTO `topic_answer` VALUES (753, 13, 35, 1);
INSERT INTO `topic_answer` VALUES (754, 13, 36, 1);
INSERT INTO `topic_answer` VALUES (755, 13, 37, 1);
INSERT INTO `topic_answer` VALUES (756, 13, 38, 1);
INSERT INTO `topic_answer` VALUES (757, 13, 39, 1);
INSERT INTO `topic_answer` VALUES (758, 13, 40, 1);
INSERT INTO `topic_answer` VALUES (759, 13, 41, 1);
INSERT INTO `topic_answer` VALUES (760, 13, 42, 1);
INSERT INTO `topic_answer` VALUES (761, 13, 43, 1);
INSERT INTO `topic_answer` VALUES (762, 13, 44, 1);
INSERT INTO `topic_answer` VALUES (763, 13, 45, 1);
INSERT INTO `topic_answer` VALUES (764, 13, 46, 1);
INSERT INTO `topic_answer` VALUES (765, 13, 47, 1);
INSERT INTO `topic_answer` VALUES (766, 13, 48, 1);
INSERT INTO `topic_answer` VALUES (767, 13, 49, 1);
INSERT INTO `topic_answer` VALUES (768, 13, 50, 1);
INSERT INTO `topic_answer` VALUES (769, 13, 51, 1);
INSERT INTO `topic_answer` VALUES (770, 13, 52, 1);
INSERT INTO `topic_answer` VALUES (771, 13, 53, 1);
INSERT INTO `topic_answer` VALUES (772, 13, 54, 1);
INSERT INTO `topic_answer` VALUES (773, 13, 55, 1);
INSERT INTO `topic_answer` VALUES (774, 13, 56, 1);
INSERT INTO `topic_answer` VALUES (775, 13, 57, 1);
INSERT INTO `topic_answer` VALUES (776, 13, 58, 1);
INSERT INTO `topic_answer` VALUES (777, 13, 59, 1);
INSERT INTO `topic_answer` VALUES (778, 13, 60, 1);
INSERT INTO `topic_answer` VALUES (779, 13, 61, 1);
INSERT INTO `topic_answer` VALUES (780, 13, 62, 1);
INSERT INTO `topic_answer` VALUES (781, 13, 63, 1);
INSERT INTO `topic_answer` VALUES (782, 13, 64, 1);
INSERT INTO `topic_answer` VALUES (783, 13, 65, 1);
INSERT INTO `topic_answer` VALUES (784, 13, 66, 1);
INSERT INTO `topic_answer` VALUES (785, 13, 67, 1);
INSERT INTO `topic_answer` VALUES (786, 13, 68, 1);
INSERT INTO `topic_answer` VALUES (787, 13, 69, 1);
INSERT INTO `topic_answer` VALUES (788, 13, 70, 1);
INSERT INTO `topic_answer` VALUES (789, 13, 71, 1);
INSERT INTO `topic_answer` VALUES (790, 13, 72, 1);
INSERT INTO `topic_answer` VALUES (791, 14, 1, 1);
INSERT INTO `topic_answer` VALUES (792, 14, 2, 1);
INSERT INTO `topic_answer` VALUES (793, 14, 3, 1);
INSERT INTO `topic_answer` VALUES (794, 14, 4, 1);
INSERT INTO `topic_answer` VALUES (795, 14, 5, 1);
INSERT INTO `topic_answer` VALUES (796, 14, 6, 1);
INSERT INTO `topic_answer` VALUES (797, 14, 7, 1);
INSERT INTO `topic_answer` VALUES (798, 14, 8, 1);
INSERT INTO `topic_answer` VALUES (799, 14, 9, 1);
INSERT INTO `topic_answer` VALUES (800, 14, 10, 1);
INSERT INTO `topic_answer` VALUES (801, 14, 11, 1);
INSERT INTO `topic_answer` VALUES (802, 14, 12, 1);
INSERT INTO `topic_answer` VALUES (803, 14, 13, 1);
INSERT INTO `topic_answer` VALUES (804, 14, 14, 1);
INSERT INTO `topic_answer` VALUES (805, 14, 15, 1);
INSERT INTO `topic_answer` VALUES (806, 14, 16, 1);
INSERT INTO `topic_answer` VALUES (807, 14, 17, 1);
INSERT INTO `topic_answer` VALUES (808, 14, 18, 1);
INSERT INTO `topic_answer` VALUES (809, 14, 19, 1);
INSERT INTO `topic_answer` VALUES (810, 14, 20, 1);
INSERT INTO `topic_answer` VALUES (811, 14, 21, 1);
INSERT INTO `topic_answer` VALUES (812, 14, 22, 1);
INSERT INTO `topic_answer` VALUES (813, 14, 23, 1);
INSERT INTO `topic_answer` VALUES (814, 14, 24, 1);
INSERT INTO `topic_answer` VALUES (815, 14, 25, 1);
INSERT INTO `topic_answer` VALUES (816, 14, 26, 1);
INSERT INTO `topic_answer` VALUES (817, 14, 27, 1);
INSERT INTO `topic_answer` VALUES (818, 14, 28, 1);
INSERT INTO `topic_answer` VALUES (819, 14, 29, 1);
INSERT INTO `topic_answer` VALUES (820, 14, 30, 1);
INSERT INTO `topic_answer` VALUES (821, 14, 31, 1);
INSERT INTO `topic_answer` VALUES (822, 14, 32, 1);
INSERT INTO `topic_answer` VALUES (823, 14, 33, 1);
INSERT INTO `topic_answer` VALUES (824, 14, 34, 1);
INSERT INTO `topic_answer` VALUES (825, 14, 35, 1);
INSERT INTO `topic_answer` VALUES (826, 14, 36, 1);
INSERT INTO `topic_answer` VALUES (827, 14, 37, 1);
INSERT INTO `topic_answer` VALUES (828, 14, 38, 1);
INSERT INTO `topic_answer` VALUES (829, 14, 39, 1);
INSERT INTO `topic_answer` VALUES (830, 14, 40, 1);
INSERT INTO `topic_answer` VALUES (831, 14, 41, 1);
INSERT INTO `topic_answer` VALUES (832, 14, 42, 1);
INSERT INTO `topic_answer` VALUES (833, 14, 43, 1);
INSERT INTO `topic_answer` VALUES (834, 14, 44, 1);
INSERT INTO `topic_answer` VALUES (835, 14, 45, 1);
INSERT INTO `topic_answer` VALUES (836, 14, 46, 1);
INSERT INTO `topic_answer` VALUES (837, 14, 47, 1);
INSERT INTO `topic_answer` VALUES (838, 14, 48, 1);
INSERT INTO `topic_answer` VALUES (839, 14, 49, 1);
INSERT INTO `topic_answer` VALUES (840, 14, 50, 1);
INSERT INTO `topic_answer` VALUES (841, 14, 51, 1);
INSERT INTO `topic_answer` VALUES (842, 14, 52, 1);
INSERT INTO `topic_answer` VALUES (843, 14, 53, 1);
INSERT INTO `topic_answer` VALUES (844, 14, 54, 1);
INSERT INTO `topic_answer` VALUES (845, 14, 55, 1);
INSERT INTO `topic_answer` VALUES (846, 14, 56, 1);
INSERT INTO `topic_answer` VALUES (847, 14, 57, 1);
INSERT INTO `topic_answer` VALUES (848, 14, 58, 1);
INSERT INTO `topic_answer` VALUES (849, 14, 59, 1);
INSERT INTO `topic_answer` VALUES (850, 14, 60, 1);
INSERT INTO `topic_answer` VALUES (851, 14, 61, 1);
INSERT INTO `topic_answer` VALUES (852, 14, 62, 1);
INSERT INTO `topic_answer` VALUES (853, 14, 63, 1);
INSERT INTO `topic_answer` VALUES (854, 14, 64, 1);
INSERT INTO `topic_answer` VALUES (855, 14, 65, 1);
INSERT INTO `topic_answer` VALUES (856, 14, 66, 1);
INSERT INTO `topic_answer` VALUES (857, 14, 67, 1);
INSERT INTO `topic_answer` VALUES (858, 14, 68, 1);
INSERT INTO `topic_answer` VALUES (859, 14, 69, 1);
INSERT INTO `topic_answer` VALUES (860, 14, 70, 1);
INSERT INTO `topic_answer` VALUES (861, 14, 71, 1);
INSERT INTO `topic_answer` VALUES (862, 14, 72, 1);
INSERT INTO `topic_answer` VALUES (863, 15, 1, 1);
INSERT INTO `topic_answer` VALUES (864, 15, 2, 1);
INSERT INTO `topic_answer` VALUES (865, 15, 3, 1);
INSERT INTO `topic_answer` VALUES (866, 15, 4, 1);
INSERT INTO `topic_answer` VALUES (867, 15, 5, 1);
INSERT INTO `topic_answer` VALUES (868, 15, 6, 1);
INSERT INTO `topic_answer` VALUES (869, 15, 7, 1);
INSERT INTO `topic_answer` VALUES (870, 15, 8, 1);
INSERT INTO `topic_answer` VALUES (871, 15, 9, 1);
INSERT INTO `topic_answer` VALUES (872, 15, 10, 1);
INSERT INTO `topic_answer` VALUES (873, 15, 11, 1);
INSERT INTO `topic_answer` VALUES (874, 15, 12, 1);
INSERT INTO `topic_answer` VALUES (875, 15, 13, 1);
INSERT INTO `topic_answer` VALUES (876, 15, 14, 1);
INSERT INTO `topic_answer` VALUES (877, 15, 15, 1);
INSERT INTO `topic_answer` VALUES (878, 15, 16, 1);
INSERT INTO `topic_answer` VALUES (879, 15, 17, 1);
INSERT INTO `topic_answer` VALUES (880, 15, 18, 1);
INSERT INTO `topic_answer` VALUES (881, 15, 19, 1);
INSERT INTO `topic_answer` VALUES (882, 15, 20, 1);
INSERT INTO `topic_answer` VALUES (883, 15, 21, 1);
INSERT INTO `topic_answer` VALUES (884, 15, 22, 1);
INSERT INTO `topic_answer` VALUES (885, 15, 23, 1);
INSERT INTO `topic_answer` VALUES (886, 15, 24, 1);
INSERT INTO `topic_answer` VALUES (887, 15, 25, 1);
INSERT INTO `topic_answer` VALUES (888, 15, 26, 1);
INSERT INTO `topic_answer` VALUES (889, 15, 27, 1);
INSERT INTO `topic_answer` VALUES (890, 15, 28, 1);
INSERT INTO `topic_answer` VALUES (891, 15, 29, 1);
INSERT INTO `topic_answer` VALUES (892, 15, 30, 1);
INSERT INTO `topic_answer` VALUES (893, 15, 31, 1);
INSERT INTO `topic_answer` VALUES (894, 15, 32, 1);
INSERT INTO `topic_answer` VALUES (895, 15, 33, 1);
INSERT INTO `topic_answer` VALUES (896, 15, 34, 1);
INSERT INTO `topic_answer` VALUES (897, 15, 35, 1);
INSERT INTO `topic_answer` VALUES (898, 15, 36, 1);
INSERT INTO `topic_answer` VALUES (899, 15, 37, 1);
INSERT INTO `topic_answer` VALUES (900, 15, 38, 1);
INSERT INTO `topic_answer` VALUES (901, 15, 39, 1);
INSERT INTO `topic_answer` VALUES (902, 15, 40, 1);
INSERT INTO `topic_answer` VALUES (903, 15, 41, 1);
INSERT INTO `topic_answer` VALUES (904, 15, 42, 1);
INSERT INTO `topic_answer` VALUES (905, 15, 43, 1);
INSERT INTO `topic_answer` VALUES (906, 15, 44, 1);
INSERT INTO `topic_answer` VALUES (907, 15, 45, 1);
INSERT INTO `topic_answer` VALUES (908, 15, 46, 1);
INSERT INTO `topic_answer` VALUES (909, 15, 47, 1);
INSERT INTO `topic_answer` VALUES (910, 15, 48, 1);
INSERT INTO `topic_answer` VALUES (911, 15, 49, 1);
INSERT INTO `topic_answer` VALUES (912, 15, 50, 1);
INSERT INTO `topic_answer` VALUES (913, 15, 51, 1);
INSERT INTO `topic_answer` VALUES (914, 15, 52, 1);
INSERT INTO `topic_answer` VALUES (915, 15, 53, 1);
INSERT INTO `topic_answer` VALUES (916, 15, 54, 1);
INSERT INTO `topic_answer` VALUES (917, 15, 55, 1);
INSERT INTO `topic_answer` VALUES (918, 15, 56, 1);
INSERT INTO `topic_answer` VALUES (919, 15, 57, 1);
INSERT INTO `topic_answer` VALUES (920, 15, 58, 1);
INSERT INTO `topic_answer` VALUES (921, 15, 59, 1);
INSERT INTO `topic_answer` VALUES (922, 15, 60, 1);
INSERT INTO `topic_answer` VALUES (923, 15, 61, 1);
INSERT INTO `topic_answer` VALUES (924, 15, 62, 1);
INSERT INTO `topic_answer` VALUES (925, 15, 63, 1);
INSERT INTO `topic_answer` VALUES (926, 15, 64, 1);
INSERT INTO `topic_answer` VALUES (927, 15, 65, 1);
INSERT INTO `topic_answer` VALUES (928, 15, 66, 1);
INSERT INTO `topic_answer` VALUES (929, 15, 67, 1);
INSERT INTO `topic_answer` VALUES (930, 15, 68, 1);
INSERT INTO `topic_answer` VALUES (931, 15, 69, 1);
INSERT INTO `topic_answer` VALUES (932, 15, 70, 1);
INSERT INTO `topic_answer` VALUES (933, 15, 71, 1);
INSERT INTO `topic_answer` VALUES (934, 15, 72, 1);
INSERT INTO `topic_answer` VALUES (935, 16, 1, 1);
INSERT INTO `topic_answer` VALUES (936, 16, 2, 1);
INSERT INTO `topic_answer` VALUES (937, 16, 3, 1);
INSERT INTO `topic_answer` VALUES (938, 16, 4, 1);
INSERT INTO `topic_answer` VALUES (939, 16, 5, 1);
INSERT INTO `topic_answer` VALUES (940, 16, 6, 1);
INSERT INTO `topic_answer` VALUES (941, 16, 7, 1);
INSERT INTO `topic_answer` VALUES (942, 16, 8, 1);
INSERT INTO `topic_answer` VALUES (943, 16, 9, 1);
INSERT INTO `topic_answer` VALUES (944, 16, 10, 1);
INSERT INTO `topic_answer` VALUES (945, 16, 11, 1);
INSERT INTO `topic_answer` VALUES (946, 16, 12, 1);
INSERT INTO `topic_answer` VALUES (947, 16, 13, 1);
INSERT INTO `topic_answer` VALUES (948, 16, 14, 1);
INSERT INTO `topic_answer` VALUES (949, 16, 15, 1);
INSERT INTO `topic_answer` VALUES (950, 16, 16, 1);
INSERT INTO `topic_answer` VALUES (951, 16, 17, 1);
INSERT INTO `topic_answer` VALUES (952, 16, 18, 1);
INSERT INTO `topic_answer` VALUES (953, 16, 19, 1);
INSERT INTO `topic_answer` VALUES (954, 16, 20, 1);
INSERT INTO `topic_answer` VALUES (955, 16, 21, 1);
INSERT INTO `topic_answer` VALUES (956, 16, 22, 1);
INSERT INTO `topic_answer` VALUES (957, 16, 23, 1);
INSERT INTO `topic_answer` VALUES (958, 16, 24, 1);
INSERT INTO `topic_answer` VALUES (959, 16, 25, 1);
INSERT INTO `topic_answer` VALUES (960, 16, 26, 1);
INSERT INTO `topic_answer` VALUES (961, 16, 27, 1);
INSERT INTO `topic_answer` VALUES (962, 16, 28, 1);
INSERT INTO `topic_answer` VALUES (963, 16, 29, 1);
INSERT INTO `topic_answer` VALUES (964, 16, 30, 1);
INSERT INTO `topic_answer` VALUES (965, 16, 31, 1);
INSERT INTO `topic_answer` VALUES (966, 16, 32, 1);
INSERT INTO `topic_answer` VALUES (967, 16, 33, 1);
INSERT INTO `topic_answer` VALUES (968, 16, 34, 1);
INSERT INTO `topic_answer` VALUES (969, 16, 35, 1);
INSERT INTO `topic_answer` VALUES (970, 16, 36, 1);
INSERT INTO `topic_answer` VALUES (971, 16, 37, 1);
INSERT INTO `topic_answer` VALUES (972, 16, 38, 1);
INSERT INTO `topic_answer` VALUES (973, 16, 39, 1);
INSERT INTO `topic_answer` VALUES (974, 16, 40, 1);
INSERT INTO `topic_answer` VALUES (975, 16, 41, 1);
INSERT INTO `topic_answer` VALUES (976, 16, 42, 1);
INSERT INTO `topic_answer` VALUES (977, 16, 43, 1);
INSERT INTO `topic_answer` VALUES (978, 16, 44, 1);
INSERT INTO `topic_answer` VALUES (979, 16, 45, 1);
INSERT INTO `topic_answer` VALUES (980, 16, 46, 1);
INSERT INTO `topic_answer` VALUES (981, 16, 47, 1);
INSERT INTO `topic_answer` VALUES (982, 16, 48, 1);
INSERT INTO `topic_answer` VALUES (983, 16, 49, 1);
INSERT INTO `topic_answer` VALUES (984, 16, 50, 1);
INSERT INTO `topic_answer` VALUES (985, 16, 51, 1);
INSERT INTO `topic_answer` VALUES (986, 16, 52, 1);
INSERT INTO `topic_answer` VALUES (987, 16, 53, 1);
INSERT INTO `topic_answer` VALUES (988, 16, 54, 1);
INSERT INTO `topic_answer` VALUES (989, 16, 55, 1);
INSERT INTO `topic_answer` VALUES (990, 16, 56, 1);
INSERT INTO `topic_answer` VALUES (991, 16, 57, 1);
INSERT INTO `topic_answer` VALUES (992, 16, 58, 1);
INSERT INTO `topic_answer` VALUES (993, 16, 59, 1);
INSERT INTO `topic_answer` VALUES (994, 16, 60, 1);
INSERT INTO `topic_answer` VALUES (995, 16, 61, 1);
INSERT INTO `topic_answer` VALUES (996, 16, 62, 1);
INSERT INTO `topic_answer` VALUES (997, 16, 63, 1);
INSERT INTO `topic_answer` VALUES (998, 16, 64, 1);
INSERT INTO `topic_answer` VALUES (999, 16, 65, 1);
INSERT INTO `topic_answer` VALUES (1000, 16, 66, 1);
INSERT INTO `topic_answer` VALUES (1001, 16, 67, 1);
INSERT INTO `topic_answer` VALUES (1002, 16, 68, 1);
INSERT INTO `topic_answer` VALUES (1003, 16, 69, 1);
INSERT INTO `topic_answer` VALUES (1004, 16, 70, 1);
INSERT INTO `topic_answer` VALUES (1005, 16, 71, 1);
INSERT INTO `topic_answer` VALUES (1006, 16, 72, 1);
INSERT INTO `topic_answer` VALUES (1007, 17, 1, 1);
INSERT INTO `topic_answer` VALUES (1008, 17, 2, 1);
INSERT INTO `topic_answer` VALUES (1009, 17, 3, 1);
INSERT INTO `topic_answer` VALUES (1010, 17, 4, 1);
INSERT INTO `topic_answer` VALUES (1011, 17, 5, 1);
INSERT INTO `topic_answer` VALUES (1012, 17, 6, 1);
INSERT INTO `topic_answer` VALUES (1013, 17, 7, 1);
INSERT INTO `topic_answer` VALUES (1014, 17, 8, 1);
INSERT INTO `topic_answer` VALUES (1015, 17, 9, 1);
INSERT INTO `topic_answer` VALUES (1016, 17, 10, 1);
INSERT INTO `topic_answer` VALUES (1017, 17, 11, 1);
INSERT INTO `topic_answer` VALUES (1018, 17, 12, 1);
INSERT INTO `topic_answer` VALUES (1019, 17, 13, 1);
INSERT INTO `topic_answer` VALUES (1020, 17, 14, 1);
INSERT INTO `topic_answer` VALUES (1021, 17, 15, 1);
INSERT INTO `topic_answer` VALUES (1022, 17, 16, 1);
INSERT INTO `topic_answer` VALUES (1023, 17, 17, 1);
INSERT INTO `topic_answer` VALUES (1024, 17, 18, 1);
INSERT INTO `topic_answer` VALUES (1025, 17, 19, 1);
INSERT INTO `topic_answer` VALUES (1026, 17, 20, 1);
INSERT INTO `topic_answer` VALUES (1027, 17, 21, 1);
INSERT INTO `topic_answer` VALUES (1028, 17, 22, 1);
INSERT INTO `topic_answer` VALUES (1029, 17, 23, 1);
INSERT INTO `topic_answer` VALUES (1030, 17, 24, 1);
INSERT INTO `topic_answer` VALUES (1031, 17, 25, 1);
INSERT INTO `topic_answer` VALUES (1032, 17, 26, 1);
INSERT INTO `topic_answer` VALUES (1033, 17, 27, 1);
INSERT INTO `topic_answer` VALUES (1034, 17, 28, 1);
INSERT INTO `topic_answer` VALUES (1035, 17, 29, 1);
INSERT INTO `topic_answer` VALUES (1036, 17, 30, 1);
INSERT INTO `topic_answer` VALUES (1037, 17, 31, 1);
INSERT INTO `topic_answer` VALUES (1038, 17, 32, 1);
INSERT INTO `topic_answer` VALUES (1039, 17, 33, 1);
INSERT INTO `topic_answer` VALUES (1040, 17, 34, 1);
INSERT INTO `topic_answer` VALUES (1041, 17, 35, 1);
INSERT INTO `topic_answer` VALUES (1042, 17, 36, 1);
INSERT INTO `topic_answer` VALUES (1043, 17, 37, 1);
INSERT INTO `topic_answer` VALUES (1044, 17, 38, 1);
INSERT INTO `topic_answer` VALUES (1045, 17, 39, 1);
INSERT INTO `topic_answer` VALUES (1046, 17, 40, 1);
INSERT INTO `topic_answer` VALUES (1047, 17, 41, 1);
INSERT INTO `topic_answer` VALUES (1048, 17, 42, 1);
INSERT INTO `topic_answer` VALUES (1049, 17, 43, 1);
INSERT INTO `topic_answer` VALUES (1050, 17, 44, 1);
INSERT INTO `topic_answer` VALUES (1051, 17, 45, 1);
INSERT INTO `topic_answer` VALUES (1052, 17, 46, 1);
INSERT INTO `topic_answer` VALUES (1053, 17, 47, 1);
INSERT INTO `topic_answer` VALUES (1054, 17, 48, 1);
INSERT INTO `topic_answer` VALUES (1055, 17, 49, 1);
INSERT INTO `topic_answer` VALUES (1056, 17, 50, 1);
INSERT INTO `topic_answer` VALUES (1057, 17, 51, 1);
INSERT INTO `topic_answer` VALUES (1058, 17, 52, 1);
INSERT INTO `topic_answer` VALUES (1059, 17, 53, 1);
INSERT INTO `topic_answer` VALUES (1060, 17, 54, 1);
INSERT INTO `topic_answer` VALUES (1061, 17, 55, 1);
INSERT INTO `topic_answer` VALUES (1062, 17, 56, 1);
INSERT INTO `topic_answer` VALUES (1063, 17, 57, 1);
INSERT INTO `topic_answer` VALUES (1064, 17, 58, 1);
INSERT INTO `topic_answer` VALUES (1065, 17, 59, 1);
INSERT INTO `topic_answer` VALUES (1066, 17, 60, 1);
INSERT INTO `topic_answer` VALUES (1067, 17, 61, 1);
INSERT INTO `topic_answer` VALUES (1068, 17, 62, 1);
INSERT INTO `topic_answer` VALUES (1069, 17, 63, 1);
INSERT INTO `topic_answer` VALUES (1070, 17, 64, 1);
INSERT INTO `topic_answer` VALUES (1071, 17, 65, 1);
INSERT INTO `topic_answer` VALUES (1072, 17, 66, 1);
INSERT INTO `topic_answer` VALUES (1073, 17, 67, 1);
INSERT INTO `topic_answer` VALUES (1074, 17, 68, 1);
INSERT INTO `topic_answer` VALUES (1075, 17, 69, 1);
INSERT INTO `topic_answer` VALUES (1076, 17, 70, 1);
INSERT INTO `topic_answer` VALUES (1077, 17, 71, 1);
INSERT INTO `topic_answer` VALUES (1078, 17, 72, 1);
INSERT INTO `topic_answer` VALUES (1079, 18, 1, 2);
INSERT INTO `topic_answer` VALUES (1080, 18, 2, 2);
INSERT INTO `topic_answer` VALUES (1081, 18, 3, 2);
INSERT INTO `topic_answer` VALUES (1082, 18, 4, 2);
INSERT INTO `topic_answer` VALUES (1083, 18, 5, 2);
INSERT INTO `topic_answer` VALUES (1084, 18, 6, 3);
INSERT INTO `topic_answer` VALUES (1085, 18, 7, 2);
INSERT INTO `topic_answer` VALUES (1086, 18, 8, 2);
INSERT INTO `topic_answer` VALUES (1087, 18, 9, 2);
INSERT INTO `topic_answer` VALUES (1088, 18, 10, 2);
INSERT INTO `topic_answer` VALUES (1089, 18, 11, 2);
INSERT INTO `topic_answer` VALUES (1090, 18, 12, 2);
INSERT INTO `topic_answer` VALUES (1091, 18, 13, 2);
INSERT INTO `topic_answer` VALUES (1092, 18, 14, 2);
INSERT INTO `topic_answer` VALUES (1093, 18, 15, 2);
INSERT INTO `topic_answer` VALUES (1094, 18, 16, 2);
INSERT INTO `topic_answer` VALUES (1095, 18, 17, 2);
INSERT INTO `topic_answer` VALUES (1096, 18, 18, 2);
INSERT INTO `topic_answer` VALUES (1097, 18, 19, 3);
INSERT INTO `topic_answer` VALUES (1098, 18, 20, 1);
INSERT INTO `topic_answer` VALUES (1099, 18, 21, 2);
INSERT INTO `topic_answer` VALUES (1100, 18, 22, 3);
INSERT INTO `topic_answer` VALUES (1101, 18, 23, 2);
INSERT INTO `topic_answer` VALUES (1102, 18, 24, 3);
INSERT INTO `topic_answer` VALUES (1103, 18, 25, 3);
INSERT INTO `topic_answer` VALUES (1104, 18, 26, 4);
INSERT INTO `topic_answer` VALUES (1105, 18, 27, 3);
INSERT INTO `topic_answer` VALUES (1106, 18, 28, 4);
INSERT INTO `topic_answer` VALUES (1107, 18, 29, 3);
INSERT INTO `topic_answer` VALUES (1108, 18, 30, 4);
INSERT INTO `topic_answer` VALUES (1109, 18, 31, 4);
INSERT INTO `topic_answer` VALUES (1110, 18, 32, 3);
INSERT INTO `topic_answer` VALUES (1111, 18, 33, 2);
INSERT INTO `topic_answer` VALUES (1112, 18, 34, 3);
INSERT INTO `topic_answer` VALUES (1113, 18, 35, 5);
INSERT INTO `topic_answer` VALUES (1114, 18, 36, 4);
INSERT INTO `topic_answer` VALUES (1115, 18, 37, 5);
INSERT INTO `topic_answer` VALUES (1116, 18, 38, 1);
INSERT INTO `topic_answer` VALUES (1117, 18, 39, 2);
INSERT INTO `topic_answer` VALUES (1118, 18, 40, 3);
INSERT INTO `topic_answer` VALUES (1119, 18, 41, 5);
INSERT INTO `topic_answer` VALUES (1120, 18, 42, 3);
INSERT INTO `topic_answer` VALUES (1121, 18, 43, 2);
INSERT INTO `topic_answer` VALUES (1122, 18, 44, 3);
INSERT INTO `topic_answer` VALUES (1123, 18, 45, 4);
INSERT INTO `topic_answer` VALUES (1124, 18, 46, 4);
INSERT INTO `topic_answer` VALUES (1125, 18, 47, 5);
INSERT INTO `topic_answer` VALUES (1126, 18, 48, 5);
INSERT INTO `topic_answer` VALUES (1127, 18, 49, 5);
INSERT INTO `topic_answer` VALUES (1128, 18, 50, 4);
INSERT INTO `topic_answer` VALUES (1129, 18, 51, 4);
INSERT INTO `topic_answer` VALUES (1130, 18, 52, 4);
INSERT INTO `topic_answer` VALUES (1131, 18, 53, 5);
INSERT INTO `topic_answer` VALUES (1132, 18, 54, 4);
INSERT INTO `topic_answer` VALUES (1133, 18, 55, 5);
INSERT INTO `topic_answer` VALUES (1134, 18, 56, 5);
INSERT INTO `topic_answer` VALUES (1135, 18, 57, 4);
INSERT INTO `topic_answer` VALUES (1136, 18, 58, 5);
INSERT INTO `topic_answer` VALUES (1137, 18, 59, 4);
INSERT INTO `topic_answer` VALUES (1138, 18, 60, 5);
INSERT INTO `topic_answer` VALUES (1139, 18, 61, 3);
INSERT INTO `topic_answer` VALUES (1140, 18, 62, 4);
INSERT INTO `topic_answer` VALUES (1141, 18, 63, 3);
INSERT INTO `topic_answer` VALUES (1142, 18, 64, 4);
INSERT INTO `topic_answer` VALUES (1143, 18, 65, 4);
INSERT INTO `topic_answer` VALUES (1144, 18, 66, 4);
INSERT INTO `topic_answer` VALUES (1145, 18, 67, 3);
INSERT INTO `topic_answer` VALUES (1146, 18, 68, 3);
INSERT INTO `topic_answer` VALUES (1147, 18, 69, 3);
INSERT INTO `topic_answer` VALUES (1148, 18, 70, 3);
INSERT INTO `topic_answer` VALUES (1149, 18, 71, 3);
INSERT INTO `topic_answer` VALUES (1150, 18, 72, 3);
INSERT INTO `topic_answer` VALUES (1151, 19, 1, 3);
INSERT INTO `topic_answer` VALUES (1152, 19, 2, 4);
INSERT INTO `topic_answer` VALUES (1153, 19, 3, 4);
INSERT INTO `topic_answer` VALUES (1154, 19, 4, 4);
INSERT INTO `topic_answer` VALUES (1155, 19, 5, 5);
INSERT INTO `topic_answer` VALUES (1156, 19, 6, 4);
INSERT INTO `topic_answer` VALUES (1157, 19, 7, 4);
INSERT INTO `topic_answer` VALUES (1158, 19, 8, 5);
INSERT INTO `topic_answer` VALUES (1159, 19, 9, 4);
INSERT INTO `topic_answer` VALUES (1160, 19, 10, 2);
INSERT INTO `topic_answer` VALUES (1161, 19, 11, 2);
INSERT INTO `topic_answer` VALUES (1162, 19, 12, 3);
INSERT INTO `topic_answer` VALUES (1163, 19, 13, 1);
INSERT INTO `topic_answer` VALUES (1164, 19, 14, 2);
INSERT INTO `topic_answer` VALUES (1165, 19, 15, 2);
INSERT INTO `topic_answer` VALUES (1166, 19, 16, 3);
INSERT INTO `topic_answer` VALUES (1167, 19, 17, 2);
INSERT INTO `topic_answer` VALUES (1168, 19, 18, 3);
INSERT INTO `topic_answer` VALUES (1169, 19, 19, 3);
INSERT INTO `topic_answer` VALUES (1170, 19, 20, 2);
INSERT INTO `topic_answer` VALUES (1171, 19, 21, 3);
INSERT INTO `topic_answer` VALUES (1172, 19, 22, 4);
INSERT INTO `topic_answer` VALUES (1173, 19, 23, 3);
INSERT INTO `topic_answer` VALUES (1174, 19, 24, 3);
INSERT INTO `topic_answer` VALUES (1175, 19, 25, 4);
INSERT INTO `topic_answer` VALUES (1176, 19, 26, 3);
INSERT INTO `topic_answer` VALUES (1177, 19, 27, 4);
INSERT INTO `topic_answer` VALUES (1178, 19, 28, 3);
INSERT INTO `topic_answer` VALUES (1179, 19, 29, 4);
INSERT INTO `topic_answer` VALUES (1180, 19, 30, 5);
INSERT INTO `topic_answer` VALUES (1181, 19, 31, 2);
INSERT INTO `topic_answer` VALUES (1182, 19, 32, 3);
INSERT INTO `topic_answer` VALUES (1183, 19, 33, 2);
INSERT INTO `topic_answer` VALUES (1184, 19, 34, 3);
INSERT INTO `topic_answer` VALUES (1185, 19, 35, 3);
INSERT INTO `topic_answer` VALUES (1186, 19, 36, 4);
INSERT INTO `topic_answer` VALUES (1187, 19, 37, 3);
INSERT INTO `topic_answer` VALUES (1188, 19, 38, 3);
INSERT INTO `topic_answer` VALUES (1189, 19, 39, 2);
INSERT INTO `topic_answer` VALUES (1190, 19, 40, 3);
INSERT INTO `topic_answer` VALUES (1191, 19, 41, 4);
INSERT INTO `topic_answer` VALUES (1192, 19, 42, 3);
INSERT INTO `topic_answer` VALUES (1193, 19, 43, 3);
INSERT INTO `topic_answer` VALUES (1194, 19, 44, 2);
INSERT INTO `topic_answer` VALUES (1195, 19, 45, 3);
INSERT INTO `topic_answer` VALUES (1196, 19, 46, 4);
INSERT INTO `topic_answer` VALUES (1197, 19, 47, 5);
INSERT INTO `topic_answer` VALUES (1198, 19, 48, 1);
INSERT INTO `topic_answer` VALUES (1199, 19, 49, 1);
INSERT INTO `topic_answer` VALUES (1200, 19, 50, 1);
INSERT INTO `topic_answer` VALUES (1201, 19, 51, 2);
INSERT INTO `topic_answer` VALUES (1202, 19, 52, 2);
INSERT INTO `topic_answer` VALUES (1203, 19, 53, 3);
INSERT INTO `topic_answer` VALUES (1204, 19, 54, 4);
INSERT INTO `topic_answer` VALUES (1205, 19, 55, 3);
INSERT INTO `topic_answer` VALUES (1206, 19, 56, 2);
INSERT INTO `topic_answer` VALUES (1207, 19, 57, 2);
INSERT INTO `topic_answer` VALUES (1208, 19, 58, 2);
INSERT INTO `topic_answer` VALUES (1209, 19, 59, 3);
INSERT INTO `topic_answer` VALUES (1210, 19, 60, 4);
INSERT INTO `topic_answer` VALUES (1211, 19, 61, 3);
INSERT INTO `topic_answer` VALUES (1212, 19, 62, 2);
INSERT INTO `topic_answer` VALUES (1213, 19, 63, 3);
INSERT INTO `topic_answer` VALUES (1214, 19, 64, 4);
INSERT INTO `topic_answer` VALUES (1215, 19, 65, 3);
INSERT INTO `topic_answer` VALUES (1216, 19, 66, 4);
INSERT INTO `topic_answer` VALUES (1217, 19, 67, 3);
INSERT INTO `topic_answer` VALUES (1218, 19, 68, 2);
INSERT INTO `topic_answer` VALUES (1219, 19, 69, 2);
INSERT INTO `topic_answer` VALUES (1220, 19, 70, 3);
INSERT INTO `topic_answer` VALUES (1221, 19, 71, 3);
INSERT INTO `topic_answer` VALUES (1222, 19, 72, 4);
INSERT INTO `topic_answer` VALUES (1223, 20, 1, 3);
INSERT INTO `topic_answer` VALUES (1224, 20, 2, 4);
INSERT INTO `topic_answer` VALUES (1225, 20, 3, 4);
INSERT INTO `topic_answer` VALUES (1226, 20, 4, 4);
INSERT INTO `topic_answer` VALUES (1227, 20, 5, 5);
INSERT INTO `topic_answer` VALUES (1228, 20, 6, 4);
INSERT INTO `topic_answer` VALUES (1229, 20, 7, 4);
INSERT INTO `topic_answer` VALUES (1230, 20, 8, 5);
INSERT INTO `topic_answer` VALUES (1231, 20, 9, 4);
INSERT INTO `topic_answer` VALUES (1232, 20, 10, 2);
INSERT INTO `topic_answer` VALUES (1233, 20, 11, 2);
INSERT INTO `topic_answer` VALUES (1234, 20, 12, 3);
INSERT INTO `topic_answer` VALUES (1235, 20, 13, 1);
INSERT INTO `topic_answer` VALUES (1236, 20, 14, 2);
INSERT INTO `topic_answer` VALUES (1237, 20, 15, 2);
INSERT INTO `topic_answer` VALUES (1238, 20, 16, 3);
INSERT INTO `topic_answer` VALUES (1239, 20, 17, 2);
INSERT INTO `topic_answer` VALUES (1240, 20, 18, 3);
INSERT INTO `topic_answer` VALUES (1241, 20, 19, 3);
INSERT INTO `topic_answer` VALUES (1242, 20, 20, 2);
INSERT INTO `topic_answer` VALUES (1243, 20, 21, 3);
INSERT INTO `topic_answer` VALUES (1244, 20, 22, 4);
INSERT INTO `topic_answer` VALUES (1245, 20, 23, 3);
INSERT INTO `topic_answer` VALUES (1246, 20, 24, 3);
INSERT INTO `topic_answer` VALUES (1247, 20, 25, 4);
INSERT INTO `topic_answer` VALUES (1248, 20, 26, 3);
INSERT INTO `topic_answer` VALUES (1249, 20, 27, 4);
INSERT INTO `topic_answer` VALUES (1250, 20, 28, 3);
INSERT INTO `topic_answer` VALUES (1251, 20, 29, 4);
INSERT INTO `topic_answer` VALUES (1252, 20, 30, 5);
INSERT INTO `topic_answer` VALUES (1253, 20, 31, 2);
INSERT INTO `topic_answer` VALUES (1254, 20, 32, 3);
INSERT INTO `topic_answer` VALUES (1255, 20, 33, 2);
INSERT INTO `topic_answer` VALUES (1256, 20, 34, 3);
INSERT INTO `topic_answer` VALUES (1257, 20, 35, 3);
INSERT INTO `topic_answer` VALUES (1258, 20, 36, 4);
INSERT INTO `topic_answer` VALUES (1259, 20, 37, 3);
INSERT INTO `topic_answer` VALUES (1260, 20, 38, 3);
INSERT INTO `topic_answer` VALUES (1261, 20, 39, 2);
INSERT INTO `topic_answer` VALUES (1262, 20, 40, 3);
INSERT INTO `topic_answer` VALUES (1263, 20, 41, 4);
INSERT INTO `topic_answer` VALUES (1264, 20, 42, 3);
INSERT INTO `topic_answer` VALUES (1265, 20, 43, 3);
INSERT INTO `topic_answer` VALUES (1266, 20, 44, 2);
INSERT INTO `topic_answer` VALUES (1267, 20, 45, 3);
INSERT INTO `topic_answer` VALUES (1268, 20, 46, 4);
INSERT INTO `topic_answer` VALUES (1269, 20, 47, 5);
INSERT INTO `topic_answer` VALUES (1270, 20, 48, 1);
INSERT INTO `topic_answer` VALUES (1271, 20, 49, 1);
INSERT INTO `topic_answer` VALUES (1272, 20, 50, 1);
INSERT INTO `topic_answer` VALUES (1273, 20, 51, 2);
INSERT INTO `topic_answer` VALUES (1274, 20, 52, 2);
INSERT INTO `topic_answer` VALUES (1275, 20, 53, 3);
INSERT INTO `topic_answer` VALUES (1276, 20, 54, 4);
INSERT INTO `topic_answer` VALUES (1277, 20, 55, 3);
INSERT INTO `topic_answer` VALUES (1278, 20, 56, 2);
INSERT INTO `topic_answer` VALUES (1279, 20, 57, 2);
INSERT INTO `topic_answer` VALUES (1280, 20, 58, 2);
INSERT INTO `topic_answer` VALUES (1281, 20, 59, 3);
INSERT INTO `topic_answer` VALUES (1282, 20, 60, 4);
INSERT INTO `topic_answer` VALUES (1283, 20, 61, 3);
INSERT INTO `topic_answer` VALUES (1284, 20, 62, 2);
INSERT INTO `topic_answer` VALUES (1285, 20, 63, 3);
INSERT INTO `topic_answer` VALUES (1286, 20, 64, 4);
INSERT INTO `topic_answer` VALUES (1287, 20, 65, 3);
INSERT INTO `topic_answer` VALUES (1288, 20, 66, 4);
INSERT INTO `topic_answer` VALUES (1289, 20, 67, 3);
INSERT INTO `topic_answer` VALUES (1290, 20, 68, 2);
INSERT INTO `topic_answer` VALUES (1291, 20, 69, 2);
INSERT INTO `topic_answer` VALUES (1292, 20, 70, 3);
INSERT INTO `topic_answer` VALUES (1293, 20, 71, 3);
INSERT INTO `topic_answer` VALUES (1294, 20, 72, 4);
INSERT INTO `topic_answer` VALUES (1295, 21, 1, 3);
INSERT INTO `topic_answer` VALUES (1296, 21, 2, 4);
INSERT INTO `topic_answer` VALUES (1297, 21, 3, 4);
INSERT INTO `topic_answer` VALUES (1298, 21, 4, 4);
INSERT INTO `topic_answer` VALUES (1299, 21, 5, 5);
INSERT INTO `topic_answer` VALUES (1300, 21, 6, 4);
INSERT INTO `topic_answer` VALUES (1301, 21, 7, 4);
INSERT INTO `topic_answer` VALUES (1302, 21, 8, 5);
INSERT INTO `topic_answer` VALUES (1303, 21, 9, 4);
INSERT INTO `topic_answer` VALUES (1304, 21, 10, 2);
INSERT INTO `topic_answer` VALUES (1305, 21, 11, 2);
INSERT INTO `topic_answer` VALUES (1306, 21, 12, 3);
INSERT INTO `topic_answer` VALUES (1307, 21, 13, 1);
INSERT INTO `topic_answer` VALUES (1308, 21, 14, 2);
INSERT INTO `topic_answer` VALUES (1309, 21, 15, 2);
INSERT INTO `topic_answer` VALUES (1310, 21, 16, 3);
INSERT INTO `topic_answer` VALUES (1311, 21, 17, 2);
INSERT INTO `topic_answer` VALUES (1312, 21, 18, 3);
INSERT INTO `topic_answer` VALUES (1313, 21, 19, 3);
INSERT INTO `topic_answer` VALUES (1314, 21, 20, 2);
INSERT INTO `topic_answer` VALUES (1315, 21, 21, 3);
INSERT INTO `topic_answer` VALUES (1316, 21, 22, 4);
INSERT INTO `topic_answer` VALUES (1317, 21, 23, 3);
INSERT INTO `topic_answer` VALUES (1318, 21, 24, 3);
INSERT INTO `topic_answer` VALUES (1319, 21, 25, 4);
INSERT INTO `topic_answer` VALUES (1320, 21, 26, 3);
INSERT INTO `topic_answer` VALUES (1321, 21, 27, 4);
INSERT INTO `topic_answer` VALUES (1322, 21, 28, 3);
INSERT INTO `topic_answer` VALUES (1323, 21, 29, 4);
INSERT INTO `topic_answer` VALUES (1324, 21, 30, 5);
INSERT INTO `topic_answer` VALUES (1325, 21, 31, 2);
INSERT INTO `topic_answer` VALUES (1326, 21, 32, 3);
INSERT INTO `topic_answer` VALUES (1327, 21, 33, 2);
INSERT INTO `topic_answer` VALUES (1328, 21, 34, 3);
INSERT INTO `topic_answer` VALUES (1329, 21, 35, 3);
INSERT INTO `topic_answer` VALUES (1330, 21, 36, 4);
INSERT INTO `topic_answer` VALUES (1331, 21, 37, 3);
INSERT INTO `topic_answer` VALUES (1332, 21, 38, 3);
INSERT INTO `topic_answer` VALUES (1333, 21, 39, 2);
INSERT INTO `topic_answer` VALUES (1334, 21, 40, 3);
INSERT INTO `topic_answer` VALUES (1335, 21, 41, 4);
INSERT INTO `topic_answer` VALUES (1336, 21, 42, 3);
INSERT INTO `topic_answer` VALUES (1337, 21, 43, 3);
INSERT INTO `topic_answer` VALUES (1338, 21, 44, 2);
INSERT INTO `topic_answer` VALUES (1339, 21, 45, 3);
INSERT INTO `topic_answer` VALUES (1340, 21, 46, 4);
INSERT INTO `topic_answer` VALUES (1341, 21, 47, 5);
INSERT INTO `topic_answer` VALUES (1342, 21, 48, 1);
INSERT INTO `topic_answer` VALUES (1343, 21, 49, 1);
INSERT INTO `topic_answer` VALUES (1344, 21, 50, 1);
INSERT INTO `topic_answer` VALUES (1345, 21, 51, 2);
INSERT INTO `topic_answer` VALUES (1346, 21, 52, 2);
INSERT INTO `topic_answer` VALUES (1347, 21, 53, 3);
INSERT INTO `topic_answer` VALUES (1348, 21, 54, 4);
INSERT INTO `topic_answer` VALUES (1349, 21, 55, 3);
INSERT INTO `topic_answer` VALUES (1350, 21, 56, 2);
INSERT INTO `topic_answer` VALUES (1351, 21, 57, 2);
INSERT INTO `topic_answer` VALUES (1352, 21, 58, 2);
INSERT INTO `topic_answer` VALUES (1353, 21, 59, 3);
INSERT INTO `topic_answer` VALUES (1354, 21, 60, 4);
INSERT INTO `topic_answer` VALUES (1355, 21, 61, 3);
INSERT INTO `topic_answer` VALUES (1356, 21, 62, 2);
INSERT INTO `topic_answer` VALUES (1357, 21, 63, 3);
INSERT INTO `topic_answer` VALUES (1358, 21, 64, 4);
INSERT INTO `topic_answer` VALUES (1359, 21, 65, 3);
INSERT INTO `topic_answer` VALUES (1360, 21, 66, 4);
INSERT INTO `topic_answer` VALUES (1361, 21, 67, 3);
INSERT INTO `topic_answer` VALUES (1362, 21, 68, 2);
INSERT INTO `topic_answer` VALUES (1363, 21, 69, 2);
INSERT INTO `topic_answer` VALUES (1364, 21, 70, 3);
INSERT INTO `topic_answer` VALUES (1365, 21, 71, 3);
INSERT INTO `topic_answer` VALUES (1366, 21, 72, 4);
INSERT INTO `topic_answer` VALUES (1367, 22, 1, 3);
INSERT INTO `topic_answer` VALUES (1368, 22, 2, 4);
INSERT INTO `topic_answer` VALUES (1369, 22, 3, 4);
INSERT INTO `topic_answer` VALUES (1370, 22, 4, 4);
INSERT INTO `topic_answer` VALUES (1371, 22, 5, 5);
INSERT INTO `topic_answer` VALUES (1372, 22, 6, 4);
INSERT INTO `topic_answer` VALUES (1373, 22, 7, 4);
INSERT INTO `topic_answer` VALUES (1374, 22, 8, 5);
INSERT INTO `topic_answer` VALUES (1375, 22, 9, 4);
INSERT INTO `topic_answer` VALUES (1376, 22, 10, 2);
INSERT INTO `topic_answer` VALUES (1377, 22, 11, 2);
INSERT INTO `topic_answer` VALUES (1378, 22, 12, 3);
INSERT INTO `topic_answer` VALUES (1379, 22, 13, 1);
INSERT INTO `topic_answer` VALUES (1380, 22, 14, 2);
INSERT INTO `topic_answer` VALUES (1381, 22, 15, 2);
INSERT INTO `topic_answer` VALUES (1382, 22, 16, 3);
INSERT INTO `topic_answer` VALUES (1383, 22, 17, 2);
INSERT INTO `topic_answer` VALUES (1384, 22, 18, 3);
INSERT INTO `topic_answer` VALUES (1385, 22, 19, 3);
INSERT INTO `topic_answer` VALUES (1386, 22, 20, 2);
INSERT INTO `topic_answer` VALUES (1387, 22, 21, 3);
INSERT INTO `topic_answer` VALUES (1388, 22, 22, 4);
INSERT INTO `topic_answer` VALUES (1389, 22, 23, 3);
INSERT INTO `topic_answer` VALUES (1390, 22, 24, 3);
INSERT INTO `topic_answer` VALUES (1391, 22, 25, 4);
INSERT INTO `topic_answer` VALUES (1392, 22, 26, 3);
INSERT INTO `topic_answer` VALUES (1393, 22, 27, 4);
INSERT INTO `topic_answer` VALUES (1394, 22, 28, 3);
INSERT INTO `topic_answer` VALUES (1395, 22, 29, 4);
INSERT INTO `topic_answer` VALUES (1396, 22, 30, 5);
INSERT INTO `topic_answer` VALUES (1397, 22, 31, 2);
INSERT INTO `topic_answer` VALUES (1398, 22, 32, 3);
INSERT INTO `topic_answer` VALUES (1399, 22, 33, 2);
INSERT INTO `topic_answer` VALUES (1400, 22, 34, 3);
INSERT INTO `topic_answer` VALUES (1401, 22, 35, 3);
INSERT INTO `topic_answer` VALUES (1402, 22, 36, 4);
INSERT INTO `topic_answer` VALUES (1403, 22, 37, 3);
INSERT INTO `topic_answer` VALUES (1404, 22, 38, 3);
INSERT INTO `topic_answer` VALUES (1405, 22, 39, 2);
INSERT INTO `topic_answer` VALUES (1406, 22, 40, 3);
INSERT INTO `topic_answer` VALUES (1407, 22, 41, 4);
INSERT INTO `topic_answer` VALUES (1408, 22, 42, 3);
INSERT INTO `topic_answer` VALUES (1409, 22, 43, 3);
INSERT INTO `topic_answer` VALUES (1410, 22, 44, 2);
INSERT INTO `topic_answer` VALUES (1411, 22, 45, 3);
INSERT INTO `topic_answer` VALUES (1412, 22, 46, 4);
INSERT INTO `topic_answer` VALUES (1413, 22, 47, 5);
INSERT INTO `topic_answer` VALUES (1414, 22, 48, 1);
INSERT INTO `topic_answer` VALUES (1415, 22, 49, 1);
INSERT INTO `topic_answer` VALUES (1416, 22, 50, 1);
INSERT INTO `topic_answer` VALUES (1417, 22, 51, 2);
INSERT INTO `topic_answer` VALUES (1418, 22, 52, 2);
INSERT INTO `topic_answer` VALUES (1419, 22, 53, 3);
INSERT INTO `topic_answer` VALUES (1420, 22, 54, 4);
INSERT INTO `topic_answer` VALUES (1421, 22, 55, 3);
INSERT INTO `topic_answer` VALUES (1422, 22, 56, 2);
INSERT INTO `topic_answer` VALUES (1423, 22, 57, 2);
INSERT INTO `topic_answer` VALUES (1424, 22, 58, 2);
INSERT INTO `topic_answer` VALUES (1425, 22, 59, 3);
INSERT INTO `topic_answer` VALUES (1426, 22, 60, 4);
INSERT INTO `topic_answer` VALUES (1427, 22, 61, 3);
INSERT INTO `topic_answer` VALUES (1428, 22, 62, 2);
INSERT INTO `topic_answer` VALUES (1429, 22, 63, 3);
INSERT INTO `topic_answer` VALUES (1430, 22, 64, 4);
INSERT INTO `topic_answer` VALUES (1431, 22, 65, 3);
INSERT INTO `topic_answer` VALUES (1432, 22, 66, 4);
INSERT INTO `topic_answer` VALUES (1433, 22, 67, 3);
INSERT INTO `topic_answer` VALUES (1434, 22, 68, 2);
INSERT INTO `topic_answer` VALUES (1435, 22, 69, 2);
INSERT INTO `topic_answer` VALUES (1436, 22, 70, 3);
INSERT INTO `topic_answer` VALUES (1437, 22, 71, 3);
INSERT INTO `topic_answer` VALUES (1438, 22, 72, 4);
INSERT INTO `topic_answer` VALUES (1439, 23, 1, 3);
INSERT INTO `topic_answer` VALUES (1440, 23, 2, 4);
INSERT INTO `topic_answer` VALUES (1441, 23, 3, 4);
INSERT INTO `topic_answer` VALUES (1442, 23, 4, 4);
INSERT INTO `topic_answer` VALUES (1443, 23, 5, 5);
INSERT INTO `topic_answer` VALUES (1444, 23, 6, 4);
INSERT INTO `topic_answer` VALUES (1445, 23, 7, 4);
INSERT INTO `topic_answer` VALUES (1446, 23, 8, 5);
INSERT INTO `topic_answer` VALUES (1447, 23, 9, 4);
INSERT INTO `topic_answer` VALUES (1448, 23, 10, 2);
INSERT INTO `topic_answer` VALUES (1449, 23, 11, 2);
INSERT INTO `topic_answer` VALUES (1450, 23, 12, 3);
INSERT INTO `topic_answer` VALUES (1451, 23, 13, 1);
INSERT INTO `topic_answer` VALUES (1452, 23, 14, 2);
INSERT INTO `topic_answer` VALUES (1453, 23, 15, 2);
INSERT INTO `topic_answer` VALUES (1454, 23, 16, 3);
INSERT INTO `topic_answer` VALUES (1455, 23, 17, 2);
INSERT INTO `topic_answer` VALUES (1456, 23, 18, 3);
INSERT INTO `topic_answer` VALUES (1457, 23, 19, 3);
INSERT INTO `topic_answer` VALUES (1458, 23, 20, 2);
INSERT INTO `topic_answer` VALUES (1459, 23, 21, 3);
INSERT INTO `topic_answer` VALUES (1460, 23, 22, 4);
INSERT INTO `topic_answer` VALUES (1461, 23, 23, 3);
INSERT INTO `topic_answer` VALUES (1462, 23, 24, 3);
INSERT INTO `topic_answer` VALUES (1463, 23, 25, 4);
INSERT INTO `topic_answer` VALUES (1464, 23, 26, 3);
INSERT INTO `topic_answer` VALUES (1465, 23, 27, 4);
INSERT INTO `topic_answer` VALUES (1466, 23, 28, 3);
INSERT INTO `topic_answer` VALUES (1467, 23, 29, 4);
INSERT INTO `topic_answer` VALUES (1468, 23, 30, 5);
INSERT INTO `topic_answer` VALUES (1469, 23, 31, 2);
INSERT INTO `topic_answer` VALUES (1470, 23, 32, 3);
INSERT INTO `topic_answer` VALUES (1471, 23, 33, 2);
INSERT INTO `topic_answer` VALUES (1472, 23, 34, 3);
INSERT INTO `topic_answer` VALUES (1473, 23, 35, 3);
INSERT INTO `topic_answer` VALUES (1474, 23, 36, 4);
INSERT INTO `topic_answer` VALUES (1475, 23, 37, 3);
INSERT INTO `topic_answer` VALUES (1476, 23, 38, 3);
INSERT INTO `topic_answer` VALUES (1477, 23, 39, 2);
INSERT INTO `topic_answer` VALUES (1478, 23, 40, 3);
INSERT INTO `topic_answer` VALUES (1479, 23, 41, 4);
INSERT INTO `topic_answer` VALUES (1480, 23, 42, 3);
INSERT INTO `topic_answer` VALUES (1481, 23, 43, 3);
INSERT INTO `topic_answer` VALUES (1482, 23, 44, 2);
INSERT INTO `topic_answer` VALUES (1483, 23, 45, 3);
INSERT INTO `topic_answer` VALUES (1484, 23, 46, 4);
INSERT INTO `topic_answer` VALUES (1485, 23, 47, 5);
INSERT INTO `topic_answer` VALUES (1486, 23, 48, 1);
INSERT INTO `topic_answer` VALUES (1487, 23, 49, 1);
INSERT INTO `topic_answer` VALUES (1488, 23, 50, 1);
INSERT INTO `topic_answer` VALUES (1489, 23, 51, 2);
INSERT INTO `topic_answer` VALUES (1490, 23, 52, 2);
INSERT INTO `topic_answer` VALUES (1491, 23, 53, 3);
INSERT INTO `topic_answer` VALUES (1492, 23, 54, 4);
INSERT INTO `topic_answer` VALUES (1493, 23, 55, 3);
INSERT INTO `topic_answer` VALUES (1494, 23, 56, 2);
INSERT INTO `topic_answer` VALUES (1495, 23, 57, 2);
INSERT INTO `topic_answer` VALUES (1496, 23, 58, 2);
INSERT INTO `topic_answer` VALUES (1497, 23, 59, 3);
INSERT INTO `topic_answer` VALUES (1498, 23, 60, 4);
INSERT INTO `topic_answer` VALUES (1499, 23, 61, 3);
INSERT INTO `topic_answer` VALUES (1500, 23, 62, 2);
INSERT INTO `topic_answer` VALUES (1501, 23, 63, 3);
INSERT INTO `topic_answer` VALUES (1502, 23, 64, 4);
INSERT INTO `topic_answer` VALUES (1503, 23, 65, 3);
INSERT INTO `topic_answer` VALUES (1504, 23, 66, 4);
INSERT INTO `topic_answer` VALUES (1505, 23, 67, 3);
INSERT INTO `topic_answer` VALUES (1506, 23, 68, 2);
INSERT INTO `topic_answer` VALUES (1507, 23, 69, 2);
INSERT INTO `topic_answer` VALUES (1508, 23, 70, 3);
INSERT INTO `topic_answer` VALUES (1509, 23, 71, 3);
INSERT INTO `topic_answer` VALUES (1510, 23, 72, 4);
INSERT INTO `topic_answer` VALUES (1511, 24, 1, 3);
INSERT INTO `topic_answer` VALUES (1512, 24, 2, 4);
INSERT INTO `topic_answer` VALUES (1513, 24, 3, 4);
INSERT INTO `topic_answer` VALUES (1514, 24, 4, 4);
INSERT INTO `topic_answer` VALUES (1515, 24, 5, 5);
INSERT INTO `topic_answer` VALUES (1516, 24, 6, 4);
INSERT INTO `topic_answer` VALUES (1517, 24, 7, 4);
INSERT INTO `topic_answer` VALUES (1518, 24, 8, 5);
INSERT INTO `topic_answer` VALUES (1519, 24, 9, 4);
INSERT INTO `topic_answer` VALUES (1520, 24, 10, 2);
INSERT INTO `topic_answer` VALUES (1521, 24, 11, 2);
INSERT INTO `topic_answer` VALUES (1522, 24, 12, 3);
INSERT INTO `topic_answer` VALUES (1523, 24, 13, 1);
INSERT INTO `topic_answer` VALUES (1524, 24, 14, 2);
INSERT INTO `topic_answer` VALUES (1525, 24, 15, 2);
INSERT INTO `topic_answer` VALUES (1526, 24, 16, 3);
INSERT INTO `topic_answer` VALUES (1527, 24, 17, 2);
INSERT INTO `topic_answer` VALUES (1528, 24, 18, 3);
INSERT INTO `topic_answer` VALUES (1529, 24, 19, 3);
INSERT INTO `topic_answer` VALUES (1530, 24, 20, 2);
INSERT INTO `topic_answer` VALUES (1531, 24, 21, 3);
INSERT INTO `topic_answer` VALUES (1532, 24, 22, 4);
INSERT INTO `topic_answer` VALUES (1533, 24, 23, 3);
INSERT INTO `topic_answer` VALUES (1534, 24, 24, 3);
INSERT INTO `topic_answer` VALUES (1535, 24, 25, 4);
INSERT INTO `topic_answer` VALUES (1536, 24, 26, 3);
INSERT INTO `topic_answer` VALUES (1537, 24, 27, 4);
INSERT INTO `topic_answer` VALUES (1538, 24, 28, 3);
INSERT INTO `topic_answer` VALUES (1539, 24, 29, 4);
INSERT INTO `topic_answer` VALUES (1540, 24, 30, 5);
INSERT INTO `topic_answer` VALUES (1541, 24, 31, 2);
INSERT INTO `topic_answer` VALUES (1542, 24, 32, 3);
INSERT INTO `topic_answer` VALUES (1543, 24, 33, 2);
INSERT INTO `topic_answer` VALUES (1544, 24, 34, 3);
INSERT INTO `topic_answer` VALUES (1545, 24, 35, 3);
INSERT INTO `topic_answer` VALUES (1546, 24, 36, 4);
INSERT INTO `topic_answer` VALUES (1547, 24, 37, 3);
INSERT INTO `topic_answer` VALUES (1548, 24, 38, 3);
INSERT INTO `topic_answer` VALUES (1549, 24, 39, 2);
INSERT INTO `topic_answer` VALUES (1550, 24, 40, 3);
INSERT INTO `topic_answer` VALUES (1551, 24, 41, 4);
INSERT INTO `topic_answer` VALUES (1552, 24, 42, 3);
INSERT INTO `topic_answer` VALUES (1553, 24, 43, 3);
INSERT INTO `topic_answer` VALUES (1554, 24, 44, 2);
INSERT INTO `topic_answer` VALUES (1555, 24, 45, 3);
INSERT INTO `topic_answer` VALUES (1556, 24, 46, 4);
INSERT INTO `topic_answer` VALUES (1557, 24, 47, 5);
INSERT INTO `topic_answer` VALUES (1558, 24, 48, 1);
INSERT INTO `topic_answer` VALUES (1559, 24, 49, 1);
INSERT INTO `topic_answer` VALUES (1560, 24, 50, 1);
INSERT INTO `topic_answer` VALUES (1561, 24, 51, 2);
INSERT INTO `topic_answer` VALUES (1562, 24, 52, 2);
INSERT INTO `topic_answer` VALUES (1563, 24, 53, 3);
INSERT INTO `topic_answer` VALUES (1564, 24, 54, 4);
INSERT INTO `topic_answer` VALUES (1565, 24, 55, 3);
INSERT INTO `topic_answer` VALUES (1566, 24, 56, 2);
INSERT INTO `topic_answer` VALUES (1567, 24, 57, 2);
INSERT INTO `topic_answer` VALUES (1568, 24, 58, 2);
INSERT INTO `topic_answer` VALUES (1569, 24, 59, 3);
INSERT INTO `topic_answer` VALUES (1570, 24, 60, 4);
INSERT INTO `topic_answer` VALUES (1571, 24, 61, 3);
INSERT INTO `topic_answer` VALUES (1572, 24, 62, 2);
INSERT INTO `topic_answer` VALUES (1573, 24, 63, 3);
INSERT INTO `topic_answer` VALUES (1574, 24, 64, 4);
INSERT INTO `topic_answer` VALUES (1575, 24, 65, 3);
INSERT INTO `topic_answer` VALUES (1576, 24, 66, 4);
INSERT INTO `topic_answer` VALUES (1577, 24, 67, 3);
INSERT INTO `topic_answer` VALUES (1578, 24, 68, 2);
INSERT INTO `topic_answer` VALUES (1579, 24, 69, 2);
INSERT INTO `topic_answer` VALUES (1580, 24, 70, 3);
INSERT INTO `topic_answer` VALUES (1581, 24, 71, 3);
INSERT INTO `topic_answer` VALUES (1582, 24, 72, 4);
INSERT INTO `topic_answer` VALUES (1583, 25, 1, 1);
INSERT INTO `topic_answer` VALUES (1584, 25, 2, 1);
INSERT INTO `topic_answer` VALUES (1585, 25, 3, 1);
INSERT INTO `topic_answer` VALUES (1586, 25, 4, 1);
INSERT INTO `topic_answer` VALUES (1587, 25, 5, 1);
INSERT INTO `topic_answer` VALUES (1588, 25, 6, 1);
INSERT INTO `topic_answer` VALUES (1589, 25, 7, 1);
INSERT INTO `topic_answer` VALUES (1590, 25, 8, 1);
INSERT INTO `topic_answer` VALUES (1591, 25, 9, 1);
INSERT INTO `topic_answer` VALUES (1592, 25, 10, 1);
INSERT INTO `topic_answer` VALUES (1593, 25, 11, 1);
INSERT INTO `topic_answer` VALUES (1594, 25, 12, 1);
INSERT INTO `topic_answer` VALUES (1595, 25, 13, 1);
INSERT INTO `topic_answer` VALUES (1596, 25, 14, 1);
INSERT INTO `topic_answer` VALUES (1597, 25, 15, 1);
INSERT INTO `topic_answer` VALUES (1598, 25, 16, 1);
INSERT INTO `topic_answer` VALUES (1599, 25, 17, 1);
INSERT INTO `topic_answer` VALUES (1600, 25, 18, 1);
INSERT INTO `topic_answer` VALUES (1601, 25, 19, 1);
INSERT INTO `topic_answer` VALUES (1602, 25, 20, 1);
INSERT INTO `topic_answer` VALUES (1603, 25, 21, 1);
INSERT INTO `topic_answer` VALUES (1604, 25, 22, 1);
INSERT INTO `topic_answer` VALUES (1605, 25, 23, 1);
INSERT INTO `topic_answer` VALUES (1606, 25, 24, 1);
INSERT INTO `topic_answer` VALUES (1607, 25, 25, 1);
INSERT INTO `topic_answer` VALUES (1608, 25, 26, 1);
INSERT INTO `topic_answer` VALUES (1609, 25, 27, 1);
INSERT INTO `topic_answer` VALUES (1610, 25, 28, 1);
INSERT INTO `topic_answer` VALUES (1611, 25, 29, 1);
INSERT INTO `topic_answer` VALUES (1612, 25, 30, 1);
INSERT INTO `topic_answer` VALUES (1613, 25, 31, 1);
INSERT INTO `topic_answer` VALUES (1614, 25, 32, 1);
INSERT INTO `topic_answer` VALUES (1615, 25, 33, 1);
INSERT INTO `topic_answer` VALUES (1616, 25, 34, 1);
INSERT INTO `topic_answer` VALUES (1617, 25, 35, 1);
INSERT INTO `topic_answer` VALUES (1618, 25, 36, 1);
INSERT INTO `topic_answer` VALUES (1619, 25, 37, 1);
INSERT INTO `topic_answer` VALUES (1620, 25, 38, 1);
INSERT INTO `topic_answer` VALUES (1621, 25, 39, 1);
INSERT INTO `topic_answer` VALUES (1622, 25, 40, 1);
INSERT INTO `topic_answer` VALUES (1623, 25, 41, 1);
INSERT INTO `topic_answer` VALUES (1624, 25, 42, 1);
INSERT INTO `topic_answer` VALUES (1625, 25, 43, 1);
INSERT INTO `topic_answer` VALUES (1626, 25, 44, 1);
INSERT INTO `topic_answer` VALUES (1627, 25, 45, 1);
INSERT INTO `topic_answer` VALUES (1628, 25, 46, 1);
INSERT INTO `topic_answer` VALUES (1629, 25, 47, 1);
INSERT INTO `topic_answer` VALUES (1630, 25, 48, 1);
INSERT INTO `topic_answer` VALUES (1631, 25, 49, 1);
INSERT INTO `topic_answer` VALUES (1632, 25, 50, 1);
INSERT INTO `topic_answer` VALUES (1633, 25, 51, 1);
INSERT INTO `topic_answer` VALUES (1634, 25, 52, 1);
INSERT INTO `topic_answer` VALUES (1635, 25, 53, 1);
INSERT INTO `topic_answer` VALUES (1636, 25, 54, 1);
INSERT INTO `topic_answer` VALUES (1637, 25, 55, 1);
INSERT INTO `topic_answer` VALUES (1638, 25, 56, 1);
INSERT INTO `topic_answer` VALUES (1639, 25, 57, 1);
INSERT INTO `topic_answer` VALUES (1640, 25, 58, 1);
INSERT INTO `topic_answer` VALUES (1641, 25, 59, 1);
INSERT INTO `topic_answer` VALUES (1642, 25, 60, 1);
INSERT INTO `topic_answer` VALUES (1643, 25, 61, 1);
INSERT INTO `topic_answer` VALUES (1644, 25, 62, 1);
INSERT INTO `topic_answer` VALUES (1645, 25, 63, 1);
INSERT INTO `topic_answer` VALUES (1646, 25, 64, 1);
INSERT INTO `topic_answer` VALUES (1647, 25, 65, 1);
INSERT INTO `topic_answer` VALUES (1648, 25, 66, 1);
INSERT INTO `topic_answer` VALUES (1649, 25, 67, 1);
INSERT INTO `topic_answer` VALUES (1650, 25, 68, 1);
INSERT INTO `topic_answer` VALUES (1651, 25, 69, 1);
INSERT INTO `topic_answer` VALUES (1652, 25, 70, 1);
INSERT INTO `topic_answer` VALUES (1653, 25, 71, 1);
INSERT INTO `topic_answer` VALUES (1654, 25, 72, 1);
INSERT INTO `topic_answer` VALUES (1655, 26, 1, 1);
INSERT INTO `topic_answer` VALUES (1656, 26, 2, 1);
INSERT INTO `topic_answer` VALUES (1657, 26, 3, 1);
INSERT INTO `topic_answer` VALUES (1658, 26, 4, 1);
INSERT INTO `topic_answer` VALUES (1659, 26, 5, 1);
INSERT INTO `topic_answer` VALUES (1660, 26, 6, 1);
INSERT INTO `topic_answer` VALUES (1661, 26, 7, 1);
INSERT INTO `topic_answer` VALUES (1662, 26, 8, 1);
INSERT INTO `topic_answer` VALUES (1663, 26, 9, 1);
INSERT INTO `topic_answer` VALUES (1664, 26, 10, 1);
INSERT INTO `topic_answer` VALUES (1665, 26, 11, 1);
INSERT INTO `topic_answer` VALUES (1666, 26, 12, 1);
INSERT INTO `topic_answer` VALUES (1667, 26, 13, 3);
INSERT INTO `topic_answer` VALUES (1668, 26, 14, 3);
INSERT INTO `topic_answer` VALUES (1669, 26, 15, 3);
INSERT INTO `topic_answer` VALUES (1670, 26, 16, 3);
INSERT INTO `topic_answer` VALUES (1671, 26, 17, 3);
INSERT INTO `topic_answer` VALUES (1672, 26, 18, 3);
INSERT INTO `topic_answer` VALUES (1673, 26, 19, 5);
INSERT INTO `topic_answer` VALUES (1674, 26, 20, 5);
INSERT INTO `topic_answer` VALUES (1675, 26, 21, 5);
INSERT INTO `topic_answer` VALUES (1676, 26, 22, 5);
INSERT INTO `topic_answer` VALUES (1677, 26, 23, 5);
INSERT INTO `topic_answer` VALUES (1678, 26, 24, 5);
INSERT INTO `topic_answer` VALUES (1679, 26, 25, 5);
INSERT INTO `topic_answer` VALUES (1680, 26, 26, 5);
INSERT INTO `topic_answer` VALUES (1681, 26, 27, 5);
INSERT INTO `topic_answer` VALUES (1682, 26, 28, 5);
INSERT INTO `topic_answer` VALUES (1683, 26, 29, 5);
INSERT INTO `topic_answer` VALUES (1684, 26, 30, 5);
INSERT INTO `topic_answer` VALUES (1685, 26, 31, 5);
INSERT INTO `topic_answer` VALUES (1686, 26, 32, 5);
INSERT INTO `topic_answer` VALUES (1687, 26, 33, 5);
INSERT INTO `topic_answer` VALUES (1688, 26, 34, 5);
INSERT INTO `topic_answer` VALUES (1689, 26, 35, 5);
INSERT INTO `topic_answer` VALUES (1690, 26, 36, 5);
INSERT INTO `topic_answer` VALUES (1691, 26, 37, 5);
INSERT INTO `topic_answer` VALUES (1692, 26, 38, 5);
INSERT INTO `topic_answer` VALUES (1693, 26, 39, 5);
INSERT INTO `topic_answer` VALUES (1694, 26, 40, 5);
INSERT INTO `topic_answer` VALUES (1695, 26, 41, 5);
INSERT INTO `topic_answer` VALUES (1696, 26, 42, 5);
INSERT INTO `topic_answer` VALUES (1697, 26, 43, 5);
INSERT INTO `topic_answer` VALUES (1698, 26, 44, 5);
INSERT INTO `topic_answer` VALUES (1699, 26, 45, 5);
INSERT INTO `topic_answer` VALUES (1700, 26, 46, 5);
INSERT INTO `topic_answer` VALUES (1701, 26, 47, 5);
INSERT INTO `topic_answer` VALUES (1702, 26, 48, 5);
INSERT INTO `topic_answer` VALUES (1703, 26, 49, 5);
INSERT INTO `topic_answer` VALUES (1704, 26, 50, 5);
INSERT INTO `topic_answer` VALUES (1705, 26, 51, 5);
INSERT INTO `topic_answer` VALUES (1706, 26, 52, 5);
INSERT INTO `topic_answer` VALUES (1707, 26, 53, 5);
INSERT INTO `topic_answer` VALUES (1708, 26, 54, 5);
INSERT INTO `topic_answer` VALUES (1709, 26, 55, 5);
INSERT INTO `topic_answer` VALUES (1710, 26, 56, 5);
INSERT INTO `topic_answer` VALUES (1711, 26, 57, 5);
INSERT INTO `topic_answer` VALUES (1712, 26, 58, 5);
INSERT INTO `topic_answer` VALUES (1713, 26, 59, 5);
INSERT INTO `topic_answer` VALUES (1714, 26, 60, 5);
INSERT INTO `topic_answer` VALUES (1715, 26, 61, 5);
INSERT INTO `topic_answer` VALUES (1716, 26, 62, 5);
INSERT INTO `topic_answer` VALUES (1717, 26, 63, 5);
INSERT INTO `topic_answer` VALUES (1718, 26, 64, 5);
INSERT INTO `topic_answer` VALUES (1719, 26, 65, 5);
INSERT INTO `topic_answer` VALUES (1720, 26, 66, 5);
INSERT INTO `topic_answer` VALUES (1721, 26, 67, 5);
INSERT INTO `topic_answer` VALUES (1722, 26, 68, 5);
INSERT INTO `topic_answer` VALUES (1723, 26, 69, 5);
INSERT INTO `topic_answer` VALUES (1724, 26, 70, 5);
INSERT INTO `topic_answer` VALUES (1725, 26, 71, 5);
INSERT INTO `topic_answer` VALUES (1726, 26, 72, 5);
INSERT INTO `topic_answer` VALUES (1727, 27, 1, 5);
INSERT INTO `topic_answer` VALUES (1728, 27, 2, 5);
INSERT INTO `topic_answer` VALUES (1729, 27, 3, 5);
INSERT INTO `topic_answer` VALUES (1730, 27, 4, 5);
INSERT INTO `topic_answer` VALUES (1731, 27, 5, 5);
INSERT INTO `topic_answer` VALUES (1732, 27, 6, 5);
INSERT INTO `topic_answer` VALUES (1733, 27, 7, 5);
INSERT INTO `topic_answer` VALUES (1734, 27, 8, 5);
INSERT INTO `topic_answer` VALUES (1735, 27, 9, 5);
INSERT INTO `topic_answer` VALUES (1736, 27, 10, 5);
INSERT INTO `topic_answer` VALUES (1737, 27, 11, 5);
INSERT INTO `topic_answer` VALUES (1738, 27, 12, 5);
INSERT INTO `topic_answer` VALUES (1739, 27, 13, 5);
INSERT INTO `topic_answer` VALUES (1740, 27, 14, 4);
INSERT INTO `topic_answer` VALUES (1741, 27, 15, 5);
INSERT INTO `topic_answer` VALUES (1742, 27, 16, 5);
INSERT INTO `topic_answer` VALUES (1743, 27, 17, 5);
INSERT INTO `topic_answer` VALUES (1744, 27, 18, 5);
INSERT INTO `topic_answer` VALUES (1745, 27, 19, 5);
INSERT INTO `topic_answer` VALUES (1746, 27, 20, 5);
INSERT INTO `topic_answer` VALUES (1747, 27, 21, 5);
INSERT INTO `topic_answer` VALUES (1748, 27, 22, 1);
INSERT INTO `topic_answer` VALUES (1749, 27, 23, 5);
INSERT INTO `topic_answer` VALUES (1750, 27, 24, 5);
INSERT INTO `topic_answer` VALUES (1751, 27, 25, 5);
INSERT INTO `topic_answer` VALUES (1752, 27, 26, 5);
INSERT INTO `topic_answer` VALUES (1753, 27, 27, 5);
INSERT INTO `topic_answer` VALUES (1754, 27, 28, 5);
INSERT INTO `topic_answer` VALUES (1755, 27, 29, 5);
INSERT INTO `topic_answer` VALUES (1756, 27, 30, 5);
INSERT INTO `topic_answer` VALUES (1757, 27, 31, 5);
INSERT INTO `topic_answer` VALUES (1758, 27, 32, 5);
INSERT INTO `topic_answer` VALUES (1759, 27, 33, 5);
INSERT INTO `topic_answer` VALUES (1760, 27, 34, 5);
INSERT INTO `topic_answer` VALUES (1761, 27, 35, 5);
INSERT INTO `topic_answer` VALUES (1762, 27, 36, 5);
INSERT INTO `topic_answer` VALUES (1763, 27, 37, 5);
INSERT INTO `topic_answer` VALUES (1764, 27, 38, 5);
INSERT INTO `topic_answer` VALUES (1765, 27, 39, 5);
INSERT INTO `topic_answer` VALUES (1766, 27, 40, 5);
INSERT INTO `topic_answer` VALUES (1767, 27, 41, 5);
INSERT INTO `topic_answer` VALUES (1768, 27, 42, 5);
INSERT INTO `topic_answer` VALUES (1769, 27, 43, 5);
INSERT INTO `topic_answer` VALUES (1770, 27, 44, 5);
INSERT INTO `topic_answer` VALUES (1771, 27, 45, 5);
INSERT INTO `topic_answer` VALUES (1772, 27, 46, 5);
INSERT INTO `topic_answer` VALUES (1773, 27, 47, 5);
INSERT INTO `topic_answer` VALUES (1774, 27, 48, 5);
INSERT INTO `topic_answer` VALUES (1775, 27, 49, 5);
INSERT INTO `topic_answer` VALUES (1776, 27, 50, 5);
INSERT INTO `topic_answer` VALUES (1777, 27, 51, 5);
INSERT INTO `topic_answer` VALUES (1778, 27, 52, 5);
INSERT INTO `topic_answer` VALUES (1779, 27, 53, 5);
INSERT INTO `topic_answer` VALUES (1780, 27, 54, 5);
INSERT INTO `topic_answer` VALUES (1781, 27, 55, 5);
INSERT INTO `topic_answer` VALUES (1782, 27, 56, 5);
INSERT INTO `topic_answer` VALUES (1783, 27, 57, 5);
INSERT INTO `topic_answer` VALUES (1784, 27, 58, 5);
INSERT INTO `topic_answer` VALUES (1785, 27, 59, 5);
INSERT INTO `topic_answer` VALUES (1786, 27, 60, 5);
INSERT INTO `topic_answer` VALUES (1787, 27, 61, 5);
INSERT INTO `topic_answer` VALUES (1788, 27, 62, 5);
INSERT INTO `topic_answer` VALUES (1789, 27, 63, 5);
INSERT INTO `topic_answer` VALUES (1790, 27, 64, 5);
INSERT INTO `topic_answer` VALUES (1791, 27, 65, 5);
INSERT INTO `topic_answer` VALUES (1792, 27, 66, 5);
INSERT INTO `topic_answer` VALUES (1793, 27, 67, 5);
INSERT INTO `topic_answer` VALUES (1794, 27, 68, 5);
INSERT INTO `topic_answer` VALUES (1795, 27, 69, 5);
INSERT INTO `topic_answer` VALUES (1796, 27, 70, 5);
INSERT INTO `topic_answer` VALUES (1797, 27, 71, 5);
INSERT INTO `topic_answer` VALUES (1798, 27, 72, 5);
INSERT INTO `topic_answer` VALUES (1799, 28, 1, 1);
INSERT INTO `topic_answer` VALUES (1800, 28, 2, 1);
INSERT INTO `topic_answer` VALUES (1801, 28, 3, 1);
INSERT INTO `topic_answer` VALUES (1802, 28, 4, 1);
INSERT INTO `topic_answer` VALUES (1803, 28, 5, 1);
INSERT INTO `topic_answer` VALUES (1804, 28, 6, 1);
INSERT INTO `topic_answer` VALUES (1805, 28, 7, 1);
INSERT INTO `topic_answer` VALUES (1806, 28, 8, 1);
INSERT INTO `topic_answer` VALUES (1807, 28, 9, 1);
INSERT INTO `topic_answer` VALUES (1808, 28, 10, 1);
INSERT INTO `topic_answer` VALUES (1809, 28, 11, 1);
INSERT INTO `topic_answer` VALUES (1810, 28, 12, 1);
INSERT INTO `topic_answer` VALUES (1811, 28, 13, 1);
INSERT INTO `topic_answer` VALUES (1812, 28, 14, 1);
INSERT INTO `topic_answer` VALUES (1813, 28, 15, 1);
INSERT INTO `topic_answer` VALUES (1814, 28, 16, 1);
INSERT INTO `topic_answer` VALUES (1815, 28, 17, 1);
INSERT INTO `topic_answer` VALUES (1816, 28, 18, 1);
INSERT INTO `topic_answer` VALUES (1817, 28, 19, 1);
INSERT INTO `topic_answer` VALUES (1818, 28, 20, 1);
INSERT INTO `topic_answer` VALUES (1819, 28, 21, 1);
INSERT INTO `topic_answer` VALUES (1820, 28, 22, 1);
INSERT INTO `topic_answer` VALUES (1821, 28, 23, 1);
INSERT INTO `topic_answer` VALUES (1822, 28, 24, 1);
INSERT INTO `topic_answer` VALUES (1823, 28, 25, 1);
INSERT INTO `topic_answer` VALUES (1824, 28, 26, 1);
INSERT INTO `topic_answer` VALUES (1825, 28, 27, 1);
INSERT INTO `topic_answer` VALUES (1826, 28, 28, 1);
INSERT INTO `topic_answer` VALUES (1827, 28, 29, 1);
INSERT INTO `topic_answer` VALUES (1828, 28, 30, 1);
INSERT INTO `topic_answer` VALUES (1829, 28, 31, 1);
INSERT INTO `topic_answer` VALUES (1830, 28, 32, 1);
INSERT INTO `topic_answer` VALUES (1831, 28, 33, 1);
INSERT INTO `topic_answer` VALUES (1832, 28, 34, 1);
INSERT INTO `topic_answer` VALUES (1833, 28, 35, 1);
INSERT INTO `topic_answer` VALUES (1834, 28, 36, 1);
INSERT INTO `topic_answer` VALUES (1835, 28, 37, 1);
INSERT INTO `topic_answer` VALUES (1836, 28, 38, 1);
INSERT INTO `topic_answer` VALUES (1837, 28, 39, 1);
INSERT INTO `topic_answer` VALUES (1838, 28, 40, 1);
INSERT INTO `topic_answer` VALUES (1839, 28, 41, 1);
INSERT INTO `topic_answer` VALUES (1840, 28, 42, 1);
INSERT INTO `topic_answer` VALUES (1841, 28, 43, 1);
INSERT INTO `topic_answer` VALUES (1842, 28, 44, 1);
INSERT INTO `topic_answer` VALUES (1843, 28, 45, 1);
INSERT INTO `topic_answer` VALUES (1844, 28, 46, 1);
INSERT INTO `topic_answer` VALUES (1845, 28, 47, 1);
INSERT INTO `topic_answer` VALUES (1846, 28, 48, 1);
INSERT INTO `topic_answer` VALUES (1847, 28, 49, 1);
INSERT INTO `topic_answer` VALUES (1848, 28, 50, 1);
INSERT INTO `topic_answer` VALUES (1849, 28, 51, 1);
INSERT INTO `topic_answer` VALUES (1850, 28, 52, 1);
INSERT INTO `topic_answer` VALUES (1851, 28, 53, 1);
INSERT INTO `topic_answer` VALUES (1852, 28, 54, 1);
INSERT INTO `topic_answer` VALUES (1853, 28, 55, 1);
INSERT INTO `topic_answer` VALUES (1854, 28, 56, 1);
INSERT INTO `topic_answer` VALUES (1855, 28, 57, 1);
INSERT INTO `topic_answer` VALUES (1856, 28, 58, 1);
INSERT INTO `topic_answer` VALUES (1857, 28, 59, 1);
INSERT INTO `topic_answer` VALUES (1858, 28, 60, 1);
INSERT INTO `topic_answer` VALUES (1859, 28, 61, 1);
INSERT INTO `topic_answer` VALUES (1860, 28, 62, 1);
INSERT INTO `topic_answer` VALUES (1861, 28, 63, 1);
INSERT INTO `topic_answer` VALUES (1862, 28, 64, 1);
INSERT INTO `topic_answer` VALUES (1863, 28, 65, 1);
INSERT INTO `topic_answer` VALUES (1864, 28, 66, 1);
INSERT INTO `topic_answer` VALUES (1865, 28, 67, 1);
INSERT INTO `topic_answer` VALUES (1866, 28, 68, 1);
INSERT INTO `topic_answer` VALUES (1867, 28, 69, 1);
INSERT INTO `topic_answer` VALUES (1868, 28, 70, 1);
INSERT INTO `topic_answer` VALUES (1869, 28, 71, 2);
INSERT INTO `topic_answer` VALUES (1870, 28, 72, 5);

SET FOREIGN_KEY_CHECKS = 1;
