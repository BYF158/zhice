/*
 Navicat Premium Dump SQL

 Source Server         : mysql-local
 Source Server Type    : MySQL
 Source Server Version : 80038 (8.0.38)
 Source Host           : localhost:3306
 Source Schema         : ry-vue2

 Target Server Type    : MySQL
 Target Server Version : 80038 (8.0.38)
 File Encoding         : 65001

 Date: 25/07/2025 14:11:47
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'topic_id', '题目序号', 'int', 'Long', 'topicId', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-07-01 19:27:24', '', '2025-07-01 19:29:23');
INSERT INTO `gen_table_column` VALUES (2, 1, 'topic_content', '题干', 'text', 'String', 'topicContent', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'editor', '', 2, 'admin', '2025-07-01 19:27:24', '', '2025-07-01 19:29:23');
INSERT INTO `gen_table_column` VALUES (3, 1, 'prototype_id', '题目类别', 'int', 'Long', 'prototypeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-07-01 19:27:24', '', '2025-07-01 19:29:23');

-- ----------------------------
-- Table structure for personality_answers
-- ----------------------------
DROP TABLE IF EXISTS `personality_answers`;
CREATE TABLE `personality_answers`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `record_id` bigint NOT NULL,
  `option_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `record_id`(`record_id` ASC) USING BTREE,
  INDEX `option_id`(`option_id` ASC) USING BTREE,
  CONSTRAINT `personality_answers_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `personality_records` (`record_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `personality_answers_ibfk_2` FOREIGN KEY (`option_id`) REFERENCES `personality_options` (`option_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 271 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personality_answers
-- ----------------------------
INSERT INTO `personality_answers` VALUES (171, 6, 1);
INSERT INTO `personality_answers` VALUES (172, 6, 6);
INSERT INTO `personality_answers` VALUES (173, 6, 10);
INSERT INTO `personality_answers` VALUES (174, 6, 15);
INSERT INTO `personality_answers` VALUES (175, 6, 18);
INSERT INTO `personality_answers` VALUES (176, 6, 23);
INSERT INTO `personality_answers` VALUES (177, 6, 27);
INSERT INTO `personality_answers` VALUES (178, 6, 30);
INSERT INTO `personality_answers` VALUES (179, 6, 35);
INSERT INTO `personality_answers` VALUES (180, 6, 38);
INSERT INTO `personality_answers` VALUES (181, 6, 41);
INSERT INTO `personality_answers` VALUES (182, 6, 45);
INSERT INTO `personality_answers` VALUES (183, 6, 49);
INSERT INTO `personality_answers` VALUES (184, 6, 53);
INSERT INTO `personality_answers` VALUES (185, 6, 58);
INSERT INTO `personality_answers` VALUES (186, 6, 62);
INSERT INTO `personality_answers` VALUES (187, 6, 66);
INSERT INTO `personality_answers` VALUES (188, 6, 70);
INSERT INTO `personality_answers` VALUES (189, 6, 73);
INSERT INTO `personality_answers` VALUES (190, 6, 78);
INSERT INTO `personality_answers` VALUES (191, 6, 82);
INSERT INTO `personality_answers` VALUES (192, 6, 85);
INSERT INTO `personality_answers` VALUES (193, 6, 90);
INSERT INTO `personality_answers` VALUES (194, 6, 93);
INSERT INTO `personality_answers` VALUES (195, 6, 98);
INSERT INTO `personality_answers` VALUES (196, 6, 103);
INSERT INTO `personality_answers` VALUES (197, 6, 108);
INSERT INTO `personality_answers` VALUES (198, 6, 111);
INSERT INTO `personality_answers` VALUES (199, 6, 116);
INSERT INTO `personality_answers` VALUES (200, 6, 119);
INSERT INTO `personality_answers` VALUES (201, 6, 122);
INSERT INTO `personality_answers` VALUES (202, 6, 127);
INSERT INTO `personality_answers` VALUES (203, 6, 130);
INSERT INTO `personality_answers` VALUES (204, 6, 135);
INSERT INTO `personality_answers` VALUES (205, 6, 138);
INSERT INTO `personality_answers` VALUES (206, 6, 143);
INSERT INTO `personality_answers` VALUES (207, 6, 146);
INSERT INTO `personality_answers` VALUES (208, 6, 151);
INSERT INTO `personality_answers` VALUES (209, 6, 154);
INSERT INTO `personality_answers` VALUES (210, 6, 159);
INSERT INTO `personality_answers` VALUES (211, 7, 1);
INSERT INTO `personality_answers` VALUES (212, 7, 6);
INSERT INTO `personality_answers` VALUES (213, 7, 10);
INSERT INTO `personality_answers` VALUES (214, 7, 13);
INSERT INTO `personality_answers` VALUES (215, 7, 18);
INSERT INTO `personality_answers` VALUES (216, 7, 23);
INSERT INTO `personality_answers` VALUES (217, 7, 26);
INSERT INTO `personality_answers` VALUES (218, 7, 31);
INSERT INTO `personality_answers` VALUES (219, 7, 34);
INSERT INTO `personality_answers` VALUES (220, 7, 39);
INSERT INTO `personality_answers` VALUES (221, 7, 42);
INSERT INTO `personality_answers` VALUES (222, 7, 47);
INSERT INTO `personality_answers` VALUES (223, 7, 50);
INSERT INTO `personality_answers` VALUES (224, 7, 55);
INSERT INTO `personality_answers` VALUES (225, 7, 58);
INSERT INTO `personality_answers` VALUES (226, 7, 63);
INSERT INTO `personality_answers` VALUES (227, 7, 66);
INSERT INTO `personality_answers` VALUES (228, 7, 71);
INSERT INTO `personality_answers` VALUES (229, 7, 74);
INSERT INTO `personality_answers` VALUES (230, 7, 77);
INSERT INTO `personality_answers` VALUES (231, 7, 84);
INSERT INTO `personality_answers` VALUES (232, 7, 88);
INSERT INTO `personality_answers` VALUES (233, 7, 92);
INSERT INTO `personality_answers` VALUES (234, 7, 96);
INSERT INTO `personality_answers` VALUES (235, 7, 100);
INSERT INTO `personality_answers` VALUES (236, 7, 104);
INSERT INTO `personality_answers` VALUES (237, 7, 108);
INSERT INTO `personality_answers` VALUES (238, 7, 112);
INSERT INTO `personality_answers` VALUES (239, 7, 116);
INSERT INTO `personality_answers` VALUES (240, 7, 120);
INSERT INTO `personality_answers` VALUES (241, 7, 124);
INSERT INTO `personality_answers` VALUES (242, 7, 128);
INSERT INTO `personality_answers` VALUES (243, 7, 132);
INSERT INTO `personality_answers` VALUES (244, 7, 136);
INSERT INTO `personality_answers` VALUES (245, 7, 140);
INSERT INTO `personality_answers` VALUES (246, 7, 144);
INSERT INTO `personality_answers` VALUES (247, 7, 148);
INSERT INTO `personality_answers` VALUES (248, 7, 152);
INSERT INTO `personality_answers` VALUES (249, 7, 156);
INSERT INTO `personality_answers` VALUES (250, 7, 160);
INSERT INTO `personality_answers` VALUES (251, 8, 82);
INSERT INTO `personality_answers` VALUES (252, 8, 86);
INSERT INTO `personality_answers` VALUES (253, 8, 90);
INSERT INTO `personality_answers` VALUES (254, 8, 94);
INSERT INTO `personality_answers` VALUES (255, 8, 98);
INSERT INTO `personality_answers` VALUES (256, 8, 102);
INSERT INTO `personality_answers` VALUES (257, 8, 106);
INSERT INTO `personality_answers` VALUES (258, 8, 110);
INSERT INTO `personality_answers` VALUES (259, 8, 114);
INSERT INTO `personality_answers` VALUES (260, 8, 118);
INSERT INTO `personality_answers` VALUES (261, 8, 122);
INSERT INTO `personality_answers` VALUES (262, 8, 126);
INSERT INTO `personality_answers` VALUES (263, 8, 130);
INSERT INTO `personality_answers` VALUES (264, 8, 134);
INSERT INTO `personality_answers` VALUES (265, 8, 138);
INSERT INTO `personality_answers` VALUES (266, 8, 142);
INSERT INTO `personality_answers` VALUES (267, 8, 146);
INSERT INTO `personality_answers` VALUES (268, 8, 150);
INSERT INTO `personality_answers` VALUES (269, 8, 154);
INSERT INTO `personality_answers` VALUES (270, 8, 158);

-- ----------------------------
-- Table structure for personality_options
-- ----------------------------
DROP TABLE IF EXISTS `personality_options`;
CREATE TABLE `personality_options`  (
  `option_id` bigint NOT NULL AUTO_INCREMENT,
  `option_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `option_type` enum('S','M','C','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `option_definition` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `question_number` int NULL DEFAULT NULL,
  PRIMARY KEY (`option_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 161 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personality_options
-- ----------------------------
INSERT INTO `personality_options` VALUES (1, '富于冒险', 'C', '愿意面对新事物并敢于下决心掌握的人。', 1);
INSERT INTO `personality_options` VALUES (2, '适应力强', 'P', '轻松自如适应任何环境。', 1);
INSERT INTO `personality_options` VALUES (3, '生动', 'S', '充满活力，表情生动，多手势。', 1);
INSERT INTO `personality_options` VALUES (4, '善于分析', 'M', '喜欢研究各部分之间的逻辑和正确的关系。', 1);
INSERT INTO `personality_options` VALUES (5, '坚持不懈', 'M', '要完成一事才接着做新事。', 2);
INSERT INTO `personality_options` VALUES (6, '喜好娱乐', 'S', '开心，充满乐趣与幽默感。', 2);
INSERT INTO `personality_options` VALUES (7, '善于说服', 'C', '用逻辑与事实而不用威严和权力服人。', 2);
INSERT INTO `personality_options` VALUES (8, '平和', 'P', '在任何冲突中，不受干扰，保持平静。', 2);
INSERT INTO `personality_options` VALUES (9, '顺服', 'P', '易接受他人的观点或喜好，不坚持己见。', 3);
INSERT INTO `personality_options` VALUES (10, '自我牺牲', 'M', '为他人利益愿意放弃个人意见。', 3);
INSERT INTO `personality_options` VALUES (11, '善于社交', 'S', '认为与人相处是好玩，是参与的机会，而不是挑战或商业机会。', 3);
INSERT INTO `personality_options` VALUES (12, '意志坚定', 'C', '决心依自己的方式做事的人。', 3);
INSERT INTO `personality_options` VALUES (13, '体贴', 'M', '关心别人的感觉与需要。', 4);
INSERT INTO `personality_options` VALUES (14, '自控性', 'P', '控制自己的情感，极少流露。', 4);
INSERT INTO `personality_options` VALUES (15, '竞争性', 'C', '把一切当成竞赛，总是有强烈的赢的欲望。', 4);
INSERT INTO `personality_options` VALUES (16, '使人认同', 'S', '因个人魅力或性格使人认同。', 4);
INSERT INTO `personality_options` VALUES (17, '使人振作', 'S', '给他人清新振奋的刺激。', 5);
INSERT INTO `personality_options` VALUES (18, '受尊重', 'M', '对人诚实尊重。', 5);
INSERT INTO `personality_options` VALUES (19, '含蓄', 'P', '自我约束情绪与热忱。', 5);
INSERT INTO `personality_options` VALUES (20, '善于应变', 'C', '对任何情况都能很快做出有效的反应。', 5);
INSERT INTO `personality_options` VALUES (21, '满足', 'P', '容易接受任何情况和环境的人。', 6);
INSERT INTO `personality_options` VALUES (22, '敏感', 'M', '对周围的人事过分关心。', 6);
INSERT INTO `personality_options` VALUES (23, '自立', 'C', '独立性强，只依靠自己的能力、判断与才智。', 6);
INSERT INTO `personality_options` VALUES (24, '生气勃勃', 'S', '充满生命力与兴奋。', 6);
INSERT INTO `personality_options` VALUES (25, '计划者', 'M', '为完成工程和目标事前做详尽计划，宁愿依计划进行工作，而不愿执行任务。', 7);
INSERT INTO `personality_options` VALUES (26, '耐性', 'P', '不因延误而懊恼，冷静且能容忍。', 7);
INSERT INTO `personality_options` VALUES (27, '积极', 'C', '相信自己有转危为安的能力。', 7);
INSERT INTO `personality_options` VALUES (28, '推动者', 'S', '动用性格魅力或鼓励或逼迫别人参予或投资。', 7);
INSERT INTO `personality_options` VALUES (29, '肯定', 'C', '自信极少犹豫或动摇。', 8);
INSERT INTO `personality_options` VALUES (30, '无拘无束', 'S', '不喜预先计划，或受计划牵制。', 8);
INSERT INTO `personality_options` VALUES (31, '有时间性', 'M', '生活与处事均依照时间表，不喜欢计划被人干扰。', 8);
INSERT INTO `personality_options` VALUES (32, '羞涩', 'P', '安静、不善于交谈的人。', 8);
INSERT INTO `personality_options` VALUES (33, '井井有条', 'M', '有系统有条理安排事情的人。', 9);
INSERT INTO `personality_options` VALUES (34, '迁就', 'P', '改变自己，使自己与他人协调，短时间内按他人的方式行事。', 9);
INSERT INTO `personality_options` VALUES (35, '坦率', 'C', '毫无保留，坦率发言。', 9);
INSERT INTO `personality_options` VALUES (36, '乐观', 'S', '愉快的性情令自己和他人相信任何事都会转好的人。', 9);
INSERT INTO `personality_options` VALUES (37, '友善', 'P', '不主动交谈，经常是被动的回答者。', 10);
INSERT INTO `personality_options` VALUES (38, '忠诚', 'M', '一贯可靠，忠心不移，有时甚至毫无理由地奉献。', 10);
INSERT INTO `personality_options` VALUES (39, '有趣', 'S', '风趣，很强的幽默感，使任何事情都能变成精彩的故事。', 10);
INSERT INTO `personality_options` VALUES (40, '强迫性', 'C', '发号施令者，别人从不反对。', 10);
INSERT INTO `personality_options` VALUES (41, '勇敢', 'C', '敢于冒险，勇敢，无所畏惧。', 11);
INSERT INTO `personality_options` VALUES (42, '可爱', 'S', '开心，与他相处充满乐趣的人。', 11);
INSERT INTO `personality_options` VALUES (43, '外交手腕', 'P', '待人得体有耐性。', 11);
INSERT INTO `personality_options` VALUES (44, '注意细节', 'M', '对事情记忆清晰，做事有条不紊。', 11);
INSERT INTO `personality_options` VALUES (45, '令人高兴', 'S', '一向充满活力，并将快乐感染他人。', 12);
INSERT INTO `personality_options` VALUES (46, '贯彻始终', 'P', '情绪平稳，容易反应，如人所料。', 12);
INSERT INTO `personality_options` VALUES (47, '文化修养', 'M', '对学术，艺术特别爱好，如戏剧、交响乐、芭蕾舞等。', 12);
INSERT INTO `personality_options` VALUES (48, '自信', 'C', '确信自己个人能力与成功。', 12);
INSERT INTO `personality_options` VALUES (49, '理想主义', 'M', '以自己完美的标准来设想衡量事情。', 13);
INSERT INTO `personality_options` VALUES (50, '独立', 'C', '自给自足，自己生活，自信，无需他人帮忙。', 13);
INSERT INTO `personality_options` VALUES (51, '无攻击性', 'P', '从不说或做引起别人不满和反对的事。', 13);
INSERT INTO `personality_options` VALUES (52, '富激励性', 'S', '鼓励别人参与、加人并能将每件事变得有趣。', 13);
INSERT INTO `personality_options` VALUES (53, '感情外露', 'S', '从不掩饰自己的情感、喜好，与人交谈时常身不由己地接触他人。', 14);
INSERT INTO `personality_options` VALUES (54, '果断', 'C', '有很快做出判断与结论的能力。', 14);
INSERT INTO `personality_options` VALUES (55, '尖刻幽默', 'P', '近乎讽刺的幽默。', 14);
INSERT INTO `personality_options` VALUES (56, '深沉', 'M', '深刻并常常内省，对肤浅的交谈、消遣的厌恶。', 14);
INSERT INTO `personality_options` VALUES (57, '调解者', 'P', '经常居中调解不同的意见，以避免双方冲突。', 15);
INSERT INTO `personality_options` VALUES (58, '音乐性', 'M', '爱好参与并有较深的鉴赏力，因音乐的艺术性，而不单是为表演的乐趣。', 15);
INSERT INTO `personality_options` VALUES (59, '发起者', 'C', '被高效率的需要所推动，是别人跟随的领导者，闲不住。', 15);
INSERT INTO `personality_options` VALUES (60, '喜交朋友', 'S', '喜好周旋于宴会中，喜欢结交新朋友，不把任何人当作陌生人。', 15);
INSERT INTO `personality_options` VALUES (61, '考虑周到', 'M', '善解人意，能记住特别的日子，不吝于帮助别人。', 16);
INSERT INTO `personality_options` VALUES (62, '执着', 'C', '不达到目的誓不休者。', 16);
INSERT INTO `personality_options` VALUES (63, '多言', 'S', '不断地说话、讲笑话来娱乐周围的人，觉得应避免沉默而使他人尴尬。', 16);
INSERT INTO `personality_options` VALUES (64, '容忍', 'P', '易接受别人的想法或方法，不需要反对或改变他人。', 16);
INSERT INTO `personality_options` VALUES (65, '聆听者', 'P', '愿意听别人倾诉。', 17);
INSERT INTO `personality_options` VALUES (66, '忠心', 'M', '对自己的理想、朋友、工作都绝对忠实，有时甚至无需任何理由。', 17);
INSERT INTO `personality_options` VALUES (67, '领导者', 'C', '天生的带领者，不相信别人的工作能力比得上自己。', 17);
INSERT INTO `personality_options` VALUES (68, '活力充沛', 'S', '充满活力，精力充沛。', 17);
INSERT INTO `personality_options` VALUES (69, '知足', 'P', '满足自己拥有的，甚少羡慕别人。', 18);
INSERT INTO `personality_options` VALUES (70, '首领', 'C', '要求领导地位及别人跟随。', 18);
INSERT INTO `personality_options` VALUES (71, '制图者', 'M', '用图表、数字来组织生活，解决问题。', 18);
INSERT INTO `personality_options` VALUES (72, '惹人喜爱', 'S', '人们注意的中心，令人爱慕。', 18);
INSERT INTO `personality_options` VALUES (73, '完美主义者', 'M', '对别人、对自己订高标准，一切事情都有秩序。', 19);
INSERT INTO `personality_options` VALUES (74, '和气', 'P', '易相处型，易说话，易让人接近。', 19);
INSERT INTO `personality_options` VALUES (75, '勤劳', 'C', '不停地工作，完成任务，不愿休息。', 19);
INSERT INTO `personality_options` VALUES (76, '受欢迎', 'S', '是聚会时的灵魂人物，受欢迎的宾客。', 19);
INSERT INTO `personality_options` VALUES (77, '跳跃型', 'S', '充满活力和生气的性格。', 20);
INSERT INTO `personality_options` VALUES (78, '无畏', 'C', '大无畏，大胆前进，不怕冒险。', 20);
INSERT INTO `personality_options` VALUES (79, '规范型', 'M', '时时坚持自己举止合乎认同的道德规范。', 20);
INSERT INTO `personality_options` VALUES (80, '平衡', 'P', '稳定，中间路线。', 20);
INSERT INTO `personality_options` VALUES (81, '乏味', 'M', '面上极少流露表情或情绪。', 21);
INSERT INTO `personality_options` VALUES (82, '忸怩', 'P', '躲避别人的注意力。', 21);
INSERT INTO `personality_options` VALUES (83, '露骨', 'S', '好表现，华而不实，声音大。', 21);
INSERT INTO `personality_options` VALUES (84, '专横', 'C', '喜命令支配，有时略傲慢。', 21);
INSERT INTO `personality_options` VALUES (85, '散漫', 'S', '生活任性无秩序。', 22);
INSERT INTO `personality_options` VALUES (86, '无同情心', 'C', '不易理解别人的问题与麻烦。', 22);
INSERT INTO `personality_options` VALUES (87, '缺乏热情', 'P', '不易兴奋，经常感到喜事难成。', 22);
INSERT INTO `personality_options` VALUES (88, '不宽恕', 'M', '不易宽恕或忘记别人对自己的伤害，易妒忌。', 22);
INSERT INTO `personality_options` VALUES (89, '保留', 'P', '不愿意参与，尤其当事物复杂时。', 23);
INSERT INTO `personality_options` VALUES (90, '怨恨', 'M', '把实际或自己想象的别人的冒犯经常放在心中。', 23);
INSERT INTO `personality_options` VALUES (91, '逆反', 'C', '抗拒、犹豫或拒不接受别人的方法，固执己见。', 23);
INSERT INTO `personality_options` VALUES (92, '唠叨', 'S', '重复讲同一件事或故事，忘记自己已经重复多次，总是不断找话题说话。', 23);
INSERT INTO `personality_options` VALUES (93, '挑剔', 'M', '坚持琐事细节，要求注意细节。', 24);
INSERT INTO `personality_options` VALUES (94, '胆小', 'P', '经常感到强烈的担心、焦虑、悲戚。', 24);
INSERT INTO `personality_options` VALUES (95, '健忘', 'S', '由于缺乏自我约束，导致健忘，不愿意记无趣的事。', 24);
INSERT INTO `personality_options` VALUES (96, '率直', 'C', '直言不讳，不介意把自己的看法直接表露出来。', 24);
INSERT INTO `personality_options` VALUES (97, '没耐性', 'C', '难以忍受等待别人。', 25);
INSERT INTO `personality_options` VALUES (98, '无安全感', 'M', '感到担心且无自信心。', 25);
INSERT INTO `personality_options` VALUES (99, '优柔寡断', 'P', '很难下定决心。', 25);
INSERT INTO `personality_options` VALUES (100, '好插嘴', 'S', '是一个滔滔不绝的发言者，不是好听众，不留意别人也在讲话。', 25);
INSERT INTO `personality_options` VALUES (101, '不受欢迎', 'M', '由于强烈要求完美，而拒人千里之外。', 26);
INSERT INTO `personality_options` VALUES (102, '不参与', 'P', '不愿倾听，也不愿意参予或加入任何团体活动，对别人的生活不感兴趣。', 26);
INSERT INTO `personality_options` VALUES (103, '难预测', 'S', '时而兴奋、时而低落，或总是不能兑现其诺言。', 26);
INSERT INTO `personality_options` VALUES (104, '缺同情心', 'C', '很难用语言或动作当众表达感情。', 26);
INSERT INTO `personality_options` VALUES (105, '固执', 'C', '坚持依自己的意见行事。', 27);
INSERT INTO `personality_options` VALUES (106, '即兴', 'S', '做事从无一贯性。', 27);
INSERT INTO `personality_options` VALUES (107, '难于取悦', 'M', '因要求太高而使别人很难取悦。', 27);
INSERT INTO `personality_options` VALUES (108, '犹豫不决', 'P', '迟迟才有行动，不易参予。', 27);
INSERT INTO `personality_options` VALUES (109, '平淡', 'P', '中间性格，无高低之分，很少表露感情。', 28);
INSERT INTO `personality_options` VALUES (110, '悲观', 'M', '尽管期待最好的但往往首先看到事情的不利之处。', 28);
INSERT INTO `personality_options` VALUES (111, '自负', 'C', '自我评价高，认为自己是最好的人选。', 28);
INSERT INTO `personality_options` VALUES (112, '放任', 'S', '允许别人（包括孩子）做他喜欢的事，为的是讨好别人，令别人鼓吹自己。', 28);
INSERT INTO `personality_options` VALUES (113, '易怒', 'S', '善变，有小孩子似的情绪，易激动，过后马上又忘了。', 29);
INSERT INTO `personality_options` VALUES (114, '无目标', 'P', '不喜订目标，也无意订目标。', 29);
INSERT INTO `personality_options` VALUES (115, '好争吵', 'C', '易与人争吵，不管怎样对任何事情都感到自己是对的。', 29);
INSERT INTO `personality_options` VALUES (116, '孤芳自赏', 'M', '容易感到被人疏离，经常无安全感或担心别人不喜欢与自己相处。', 29);
INSERT INTO `personality_options` VALUES (117, '天真', 'S', '孩子般的单纯，不理解生命的真谛。', 30);
INSERT INTO `personality_options` VALUES (118, '消极', 'P', '往往只看到事物消极面、黑暗面，而少有积极的态度。', 30);
INSERT INTO `personality_options` VALUES (119, '鲁莽', 'C', '充满自信、坚韧不拔与胆识，但总不恰当。', 30);
INSERT INTO `personality_options` VALUES (120, '冷漠', 'M', '漠不关心，得过且过。', 30);
INSERT INTO `personality_options` VALUES (121, '担忧', 'M', '时时感到不确定、焦虑、心烦。', 31);
INSERT INTO `personality_options` VALUES (122, '退缩', 'P', '感到需要大量时间独处。', 31);
INSERT INTO `personality_options` VALUES (123, '工作狂', 'C', '为了回报或成就感，而不是为了完美，设立雄伟目标，不断工作，耻于休息。', 31);
INSERT INTO `personality_options` VALUES (124, '喜获认同', 'S', '需要旁人认同、赞赏，就如同演艺家，需要观众的掌声、笑声与接受。', 31);
INSERT INTO `personality_options` VALUES (125, '过分敏感', 'M', '对事情过分反应，被人误解时感到被冒犯。', 32);
INSERT INTO `personality_options` VALUES (126, '不圆滑老练', 'C', '经常用冒犯或没考虑周到的方式表达自己。', 32);
INSERT INTO `personality_options` VALUES (127, '胆怯', 'P', '遇到困难退缩。', 32);
INSERT INTO `personality_options` VALUES (128, '喋喋不休', 'S', '难以自控，滔滔不绝，不能倾听别人。', 32);
INSERT INTO `personality_options` VALUES (129, '腼腆', 'P', '事事不确定，又对所做之事缺乏信心。', 33);
INSERT INTO `personality_options` VALUES (130, '生活紊乱', 'S', '缺乏安排生活的能力。', 33);
INSERT INTO `personality_options` VALUES (131, '跋扈', 'C', '冲动地控制事情或别人，指挥他人。', 33);
INSERT INTO `personality_options` VALUES (132, '抑郁', 'M', '常情绪低落的人。', 33);
INSERT INTO `personality_options` VALUES (133, '缺乏毅力', 'S', '反复无常，互相予盾，情绪与行动不合逻辑。', 34);
INSERT INTO `personality_options` VALUES (134, '内向', 'M', '思想与兴趣放在心里，活在自己的世界里。', 34);
INSERT INTO `personality_options` VALUES (135, '不容忍', 'C', '不能忍受他人的态度、观点、做事的方法。', 34);
INSERT INTO `personality_options` VALUES (136, '无异议', 'P', '对多数事情均漠不关心的人。', 34);
INSERT INTO `personality_options` VALUES (137, '杂乱无章', 'S', '生活环境无秩序，经常找不到东西。', 35);
INSERT INTO `personality_options` VALUES (138, '情绪化', 'M', '情绪不易高涨，当感到不被欣赏时很容易低落。', 35);
INSERT INTO `personality_options` VALUES (139, '喃喃自语', 'P', '低声说话，不在乎说不清楚。', 35);
INSERT INTO `personality_options` VALUES (140, '喜操纵', 'C', '精明处事，操纵事情，使自己得利。', 35);
INSERT INTO `personality_options` VALUES (141, '缓慢', 'P', '行动思想均比较慢，过分麻烦。', 36);
INSERT INTO `personality_options` VALUES (142, '顽固', 'C', '决心依自己的意愿行事，不易被说服。', 36);
INSERT INTO `personality_options` VALUES (143, '好表现', 'S', '要吸引人，需要自己成为别人注意的中心。', 36);
INSERT INTO `personality_options` VALUES (144, '有戒心', 'M', '不易相信别人，对所有语言背后真正的动机存有疑问。', 36);
INSERT INTO `personality_options` VALUES (145, '孤僻', 'M', '需要大量时间独处，避开人群。', 37);
INSERT INTO `personality_options` VALUES (146, '统治欲', 'C', '毫不犹豫地表示自己的正确或控制能力。', 37);
INSERT INTO `personality_options` VALUES (147, '懒惰', 'P', '总是先估量做每一件事要耗费多少精力。', 37);
INSERT INTO `personality_options` VALUES (148, '大嗓门', 'S', '说话声与笑声总是盖过他人。', 37);
INSERT INTO `personality_options` VALUES (149, '拖延', 'P', '凡事起步慢，需要推动力。', 38);
INSERT INTO `personality_options` VALUES (150, '多疑', 'M', '凡事怀疑，不相信别人。', 38);
INSERT INTO `personality_options` VALUES (151, '易怒', 'C', '当别人行动不够快，不能完成指定的工作时，易感到不耐烦或发怒。', 38);
INSERT INTO `personality_options` VALUES (152, '不专注', 'S', '无法专心或集中注意力。', 38);
INSERT INTO `personality_options` VALUES (153, '报复型', 'C', '记恨并惩罚冒犯自己的人。', 39);
INSERT INTO `personality_options` VALUES (154, '烦躁', 'M', '喜新厌旧，不喜欢长期做相同的事。', 39);
INSERT INTO `personality_options` VALUES (155, '勉强', 'P', '不愿参与或投入。', 39);
INSERT INTO `personality_options` VALUES (156, '轻率', 'S', '因没耐性，不经思考，草率行动。', 39);
INSERT INTO `personality_options` VALUES (157, '妥协', 'P', '为避免矛盾，即使自己是对的也不惜放弃自己的立场。', 40);
INSERT INTO `personality_options` VALUES (158, '好批评', 'M', '不断地衡量和下判断，经常考虑提出反面的意见。', 40);
INSERT INTO `personality_options` VALUES (159, '狡猾', 'C', '精明，总是有办法达到目的。', 40);
INSERT INTO `personality_options` VALUES (160, '善变', 'S', '像孩子般注意力短暂，需要各种变化，怕无聊。', 40);

-- ----------------------------
-- Table structure for personality_records
-- ----------------------------
DROP TABLE IF EXISTS `personality_records`;
CREATE TABLE `personality_records`  (
  `record_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `test_time` datetime NOT NULL,
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `personality_records_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personality_records
-- ----------------------------
INSERT INTO `personality_records` VALUES (6, 1, '2025-07-25 10:27:08');
INSERT INTO `personality_records` VALUES (7, 1, '2025-07-25 10:29:03');
INSERT INTO `personality_records` VALUES (8, 103, '2025-07-25 13:18:20');

-- ----------------------------
-- Table structure for personality_results
-- ----------------------------
DROP TABLE IF EXISTS `personality_results`;
CREATE TABLE `personality_results`  (
  `result_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `test_date` datetime NULL DEFAULT NULL,
  `type_s_score` bigint NULL DEFAULT 0,
  `type_m_score` bigint NULL DEFAULT 0,
  `type_c_score` bigint NULL DEFAULT 0,
  `type_p_score` bigint NULL DEFAULT 0,
  PRIMARY KEY (`result_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `personality_results_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personality_results
-- ----------------------------
INSERT INTO `personality_results` VALUES (6, 1, '2025-07-25 10:27:08', 8, 13, 15, 4);
INSERT INTO `personality_results` VALUES (7, 1, '2025-07-25 10:29:03', 14, 13, 7, 6);
INSERT INTO `personality_results` VALUES (8, 103, '2025-07-25 13:18:20', 4, 15, 9, 12);

-- ----------------------------
-- Table structure for personality_types
-- ----------------------------
DROP TABLE IF EXISTS `personality_types`;
CREATE TABLE `personality_types`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type_code` enum('S','M','C','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `core_traits` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `emotional_strengths` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `work_strengths` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `friend_strengths` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `parent_strengths` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type_code`(`type_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personality_types
-- ----------------------------
INSERT INTO `personality_types` VALUES (1, 'S', '活泼型性格', '外向、多言、乐观', '予人好感，健谈，是聚会的灵魂。富有幽默感，有美好的回忆，能自如地控制听众。情绪化及感情外露，热情洋溢，好表现。高兴、得意洋洋，好奇，是舞台上人才。天真无邪，现实，性情善变，诚挚，孩子气。', '工作主动，找寻新事务，注重表面。富有创造性、多姿多彩，充满干劲、积极性。闪电式开始，鼓励他人参与，吸引他人工作。', '容易交朋友，热爱别人。喜欢赞扬，看似兴奋，令人羡慕。不怀恨，很快道歉，避免沉闷。喜欢即兴的活动。', '能给家庭带来欢乐，被孩子的朋友喜爱。以苦为乐，像马戏团团长。', '2025-07-25 09:24:48', '2025-07-25 09:24:48');
INSERT INTO `personality_types` VALUES (2, 'M', '完美型性格', '内向、思考者、悲观', '深思熟虑、善于分析，严肃、有目标。有天分，富有创造能力，是富音乐艺术细胞。冷静富有诗意，追求完美，对他人反应敏感。自我牺牲，有责任心，理想主义。', '预先作计划，完美主义、高标准。注重细节，善始善终，有条理有组织。整洁，讲求经济效益，善于发现问题。有创造性的解决方法，勤俭节约。善用图表、数据、目录分析问题。', '交友谨慎，甘愿留在幕后。避免引起注意，忠诚可靠。会聆听抱怨，解决别人的问题。很关心他人，情感丰富，易受感动，寻求理想伴侣。', '订立高标准，希望一切都做对。保持家里井井有条，帮孩子收拾。为他人牺牲是自己的意愿，鼓励奖学金及才华。', '2025-07-25 09:24:48', '2025-07-25 09:24:48');
INSERT INTO `personality_types` VALUES (3, 'C', '力量型性格', '外向、行动者、乐观', '天生领导者，活力充沛及主动。急迫需要改变，不容有错。意志坚决、果断，非情绪化。不易气馁，自立自足，充满自信，能运作一切。', '目标主导，纵观全局，善于管理。寻求实际的解决方法，行动迅速。委派工作，坚持生产，设定目标。促成行动，越挫越奋。', '不大需要朋友，为团体而工作。会领导及组织，总是正确，善于应变。', '行使领导权，设定目标。促动家人行动，知道正确答案。管理家务。', '2025-07-25 09:24:48', '2025-07-25 09:24:48');
INSERT INTO `personality_types` VALUES (4, 'P', '和平型性格', '内向、旁观者、悲观', '性格低调，易相处、轻松。平静、镇静、泰然自若，耐心、易适应。一成不变的生活，平静但诙谐。仁慈善良，隐藏内心的情绪。乐天知命，面面俱备。', '熟悉可靠，平和无异议。有行政能力，调解问题。避免冲突，善于面对压力。寻求容易的解决方法。', '容易相处，开心愉快。无攻击性，好的聆听者。尖刻的幽默，喜欢旁观。有很多朋友，同情、关心。', '好父母，为孩子花时间。不急躁，宽容，不易生气。', '2025-07-25 09:24:48', '2025-07-25 09:24:48');

-- ----------------------------
-- Table structure for prototype
-- ----------------------------
DROP TABLE IF EXISTS `prototype`;
CREATE TABLE `prototype`  (
  `prototype_id` int NOT NULL,
  `prototype_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`prototype_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 149 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of prototype_score
-- ----------------------------
INSERT INTO `prototype_score` VALUES (113, 12, 1, 30);
INSERT INTO `prototype_score` VALUES (114, 12, 2, 30);
INSERT INTO `prototype_score` VALUES (115, 12, 3, 30);
INSERT INTO `prototype_score` VALUES (116, 12, 4, 30);
INSERT INTO `prototype_score` VALUES (117, 12, 5, 30);
INSERT INTO `prototype_score` VALUES (118, 12, 6, 30);
INSERT INTO `prototype_score` VALUES (119, 12, 7, 30);
INSERT INTO `prototype_score` VALUES (120, 12, 8, 30);
INSERT INTO `prototype_score` VALUES (121, 12, 9, 30);
INSERT INTO `prototype_score` VALUES (122, 12, 10, 30);
INSERT INTO `prototype_score` VALUES (123, 12, 11, 30);
INSERT INTO `prototype_score` VALUES (124, 12, 12, 30);
INSERT INTO `prototype_score` VALUES (125, 13, 1, 19);
INSERT INTO `prototype_score` VALUES (126, 13, 2, 20);
INSERT INTO `prototype_score` VALUES (127, 13, 3, 25);
INSERT INTO `prototype_score` VALUES (128, 13, 4, 17);
INSERT INTO `prototype_score` VALUES (129, 13, 5, 25);
INSERT INTO `prototype_score` VALUES (130, 13, 6, 16);
INSERT INTO `prototype_score` VALUES (131, 13, 7, 17);
INSERT INTO `prototype_score` VALUES (132, 13, 8, 18);
INSERT INTO `prototype_score` VALUES (133, 13, 9, 21);
INSERT INTO `prototype_score` VALUES (134, 13, 10, 26);
INSERT INTO `prototype_score` VALUES (135, 13, 11, 20);
INSERT INTO `prototype_score` VALUES (136, 13, 12, 20);
INSERT INTO `prototype_score` VALUES (137, 14, 1, 12);
INSERT INTO `prototype_score` VALUES (138, 14, 2, 12);
INSERT INTO `prototype_score` VALUES (139, 14, 3, 11);
INSERT INTO `prototype_score` VALUES (140, 14, 4, 12);
INSERT INTO `prototype_score` VALUES (141, 14, 5, 12);
INSERT INTO `prototype_score` VALUES (142, 14, 6, 12);
INSERT INTO `prototype_score` VALUES (143, 14, 7, 11);
INSERT INTO `prototype_score` VALUES (144, 14, 8, 12);
INSERT INTO `prototype_score` VALUES (145, 14, 9, 11);
INSERT INTO `prototype_score` VALUES (146, 14, 10, 12);
INSERT INTO `prototype_score` VALUES (147, 14, 11, 11);
INSERT INTO `prototype_score` VALUES (148, 14, 12, 12);

-- ----------------------------
-- Table structure for score_mapping
-- ----------------------------
DROP TABLE IF EXISTS `score_mapping`;
CREATE TABLE `score_mapping`  (
  `score_value` int NOT NULL,
  `score_desc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`score_value`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '心理测试', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-01 16:21:30', 'admin', '2025-07-25 10:32:56');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '测试小组', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-01 16:21:30', 'admin', '2025-07-25 10:33:07');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-07-01 16:21:30', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '测试一组', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-01 16:21:30', 'admin', '2025-07-25 10:33:32');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '测试二组', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-01 16:21:30', 'admin', '2025-07-25 10:33:39');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-01 16:21:30', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-07-01 16:21:30', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-07-01 16:21:30', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-07-01 16:21:30', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-07-01 16:21:30', '', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 188 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 12:30:00');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 12:42:24');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 12:57:35');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 13:00:39');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 13:17:58');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 16:53:39');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 16:54:14');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 08:33:33');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 08:42:03');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 09:06:44');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 09:14:06');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-07-03 09:23:06');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 09:36:47');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 09:37:52');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 09:46:03');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 09:53:23');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 09:55:24');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 09:58:44');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 10:03:37');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 10:11:36');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 10:20:10');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 11:15:23');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 12:08:20');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-03 12:13:50');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 12:13:55');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 13:23:02');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 13:24:21');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 13:28:57');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-03 13:34:14');
INSERT INTO `sys_logininfor` VALUES (143, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 13:34:24');
INSERT INTO `sys_logininfor` VALUES (144, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-03 13:34:49');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 13:34:56');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-03 13:44:40');
INSERT INTO `sys_logininfor` VALUES (147, '心理测试2', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-07-03 13:44:47');
INSERT INTO `sys_logininfor` VALUES (148, 'zz', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 13:46:27');
INSERT INTO `sys_logininfor` VALUES (149, 'zz', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 13:59:45');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 14:31:48');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-03 14:32:11');
INSERT INTO `sys_logininfor` VALUES (152, 'zz', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 14:32:21');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 15:40:38');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-03 15:41:08');
INSERT INTO `sys_logininfor` VALUES (155, 'zz', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 15:41:16');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 16:09:31');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-07-03 16:42:40');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 16:42:45');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 12:31:02');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-07 17:03:08');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-07-07 22:37:41');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-07 22:37:54');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-08 08:47:01');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-08 09:21:39');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-08 15:12:33');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-08 15:12:44');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-08 15:48:02');
INSERT INTO `sys_logininfor` VALUES (168, '12', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-07-08 15:48:18');
INSERT INTO `sys_logininfor` VALUES (169, '12', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-07-08 15:48:27');
INSERT INTO `sys_logininfor` VALUES (170, '12', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2025-07-08 15:48:45');
INSERT INTO `sys_logininfor` VALUES (171, '12', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-08 15:48:55');
INSERT INTO `sys_logininfor` VALUES (172, '123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2025-07-25 08:43:03');
INSERT INTO `sys_logininfor` VALUES (173, '123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-07-25 08:43:14');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-07-25 08:43:39');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-25 08:44:31');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-25 09:38:34');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-25 09:52:01');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-25 09:52:10');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-25 10:34:46');
INSERT INTO `sys_logininfor` VALUES (180, 'wang', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-25 10:34:57');
INSERT INTO `sys_logininfor` VALUES (181, 'wang', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-25 10:40:36');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-25 10:40:49');
INSERT INTO `sys_logininfor` VALUES (183, 'wang', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-25 10:43:21');
INSERT INTO `sys_logininfor` VALUES (184, 'wang', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-25 13:08:44');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-25 13:14:46');
INSERT INTO `sys_logininfor` VALUES (186, '1234', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2025-07-25 13:54:12');
INSERT INTO `sys_logininfor` VALUES (187, '1234', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-25 13:54:22');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3014 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-07-01 16:21:31', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-07-01 16:21:31', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-07-01 16:21:31', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '原型测试', 0, 0, 'psychological', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'checkbox', 'admin', '2025-07-01 16:51:40', 'admin', '2025-07-25 09:39:53', '');
INSERT INTO `sys_menu` VALUES (5, '若依官网', 0, 5, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2025-07-01 16:21:31', '', NULL, '若依官网地址');
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
INSERT INTO `sys_menu` VALUES (2001, '题目管理', 4, 1, 'topic', 'questions/topic/index', NULL, '', 1, 0, 'C', '0', '0', 'questions:topic:list', 'list', 'admin', '2025-07-01 20:46:26', 'admin', '2025-07-25 08:57:07', '题目管理菜单');
INSERT INTO `sys_menu` VALUES (2002, '题目管理查询', 2001, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'questions:topic:query', '#', 'admin', '2025-07-01 20:46:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '题目管理新增', 2001, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'questions:topic:add', '#', 'admin', '2025-07-01 20:46:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '题目管理修改', 2001, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'questions:topic:edit', '#', 'admin', '2025-07-01 20:46:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '题目管理删除', 2001, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'questions:topic:remove', '#', 'admin', '2025-07-01 20:46:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '题目管理导出', 2001, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'questions:topic:export', '#', 'admin', '2025-07-01 20:46:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '原型量表测试', 4, 0, 'questions', 'questions/topic/questions', NULL, '', 1, 0, 'M', '0', '0', 'questions:topic:questions', 'date-range', 'admin', '2025-07-01 21:11:51', 'admin', '2025-07-01 21:13:51', '');
INSERT INTO `sys_menu` VALUES (3000, '得分管理', 4, 1, 'score', 'questions/score/index', NULL, '', 1, 0, 'C', '0', '0', 'questions:score:list', 'star', 'admin', '2025-07-01 20:46:26', 'admin', '2025-07-25 08:57:18', '题目管理菜单');
INSERT INTO `sys_menu` VALUES (3002, '得分管理删除', 3000, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'questions:score:remove', '#', 'admin', '2025-07-01 20:46:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3004, '原型测试结果', 4, 0, 'result', 'questions/topic/result', NULL, '', 1, 0, 'M', '0', '0', '', 'checkbox', 'admin', '2025-07-08 15:10:57', 'admin', '2025-07-25 08:46:52', '');
INSERT INTO `sys_menu` VALUES (3005, '性格测试', 0, 0, 'personality', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'peoples', 'admin', '2025-07-25 09:40:23', 'admin', '2025-07-25 09:43:52', '');
INSERT INTO `sys_menu` VALUES (3006, '性格测试结果', 3005, 1, 'result', 'personality/result/result', NULL, '', 1, 0, 'M', '0', '0', '', 'row', 'admin', '2025-07-25 09:41:58', 'admin', '2025-07-25 09:44:05', '');
INSERT INTO `sys_menu` VALUES (3007, '性格测试', 3005, 0, 'test', 'personality/options/personality', NULL, '', 1, 0, 'M', '0', '0', '', 'clipboard', 'admin', '2025-07-25 09:43:12', 'admin', '2025-07-25 09:44:01', '');
INSERT INTO `sys_menu` VALUES (3008, '选项管理', 3005, 2, 'options', 'options/options/index', NULL, '', 1, 0, 'M', '0', '0', NULL, 'edit', 'admin', '2025-07-25 09:44:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3009, '得分管理', 3005, 3, 'scores', 'personality/result/resultManagement', NULL, '', 1, 0, 'M', '0', '0', 'personality:personality:list', 'list', 'admin', '2025-07-25 09:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3010, '选项管理新增', 3005, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'options:options:add', '#', 'admin', '2025-07-25 13:07:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3011, '选项管理修改', 3005, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'options:options:edit', '#', 'admin', '2025-07-25 13:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3012, '选项管理删除', 3005, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'options:options:remove', '#', 'admin', '2025-07-25 13:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3013, '选项管理导出', 3005, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'options:options:export', '#', 'admin', '2025-07-25 13:08:12', '', NULL, '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 158 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.etsong.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"心理测试\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"questions\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-01 16:51:40', 38);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 6, 'com.etsong.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"topic\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-01 19:27:24', 99);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 2, 'com.etsong.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"topic\",\"className\":\"Topic\",\"columns\":[{\"capJavaField\":\"TopicId\",\"columnComment\":\"题目序号\",\"columnId\":1,\"columnName\":\"topic_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-07-01 19:27:24\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"topicId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TopicContent\",\"columnComment\":\"题干\",\"columnId\":2,\"columnName\":\"topic_content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-07-01 19:27:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"topicContent\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PrototypeId\",\"columnComment\":\"题目类别\",\"columnId\":3,\"columnName\":\"prototype_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-07-01 19:27:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"prototypeId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"题目管理\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"questions\",\"options\":\"{\\\"parentMenuId\\\":2000}\",\"packageName\":\"com.etsong.questions\",\"params\":{\"parentMenuId\":2000},\"parentMenuId\":2000,\"sub\":false,\"tableComment\":\"题目信息表\",\"tableId\":1,\"tableName\":\"topic\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-u', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-01 19:29:23', 35);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 8, 'com.etsong.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"topic\"}', NULL, 0, NULL, '2025-07-01 19:29:28', 326);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.etsong.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"原型量表测试\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"questions/topic/questions\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-01 21:11:51', 109);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.etsong.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-07-01 21:11:51\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"原型量表测试\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"questions/topic/questions\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-01 21:13:51', 22);
INSERT INTO `sys_oper_log` VALUES (106, '得分管理', 3, 'com.etsong.web.controller.system.SysPrototypeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/questions/prototype/3', '127.0.0.1', '内网IP', '[3]', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue2`.`prototype_score`, CONSTRAINT `prototype_score_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `test_record` (`record_id`))\r\n### The error may exist in file [D:\\data\\JavaProject\\Vue3\\zhice\\zhice-system\\target\\classes\\mapper\\system\\SysTestRecordMapper.xml]\r\n### The error may involve com.etsong.system.mapper.SysTestRecordMapper.deleteTestRecordByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from test_record where record_id in    (      ?    )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue2`.`prototype_score`, CONSTRAINT `prototype_score_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `test_record` (`record_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue2`.`prototype_score`, CONSTRAINT `prototype_score_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `test_record` (`record_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue2`.`prototype_score`, CONSTRAINT `prototype_score_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `test_record` (`record_id`))', '2025-07-02 16:56:14', 73);
INSERT INTO `sys_oper_log` VALUES (107, '得分管理', 3, 'com.etsong.web.controller.system.SysPrototypeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/questions/prototype/3', '127.0.0.1', '内网IP', '[3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-02 16:59:13', 30);
INSERT INTO `sys_oper_log` VALUES (108, '得分管理', 3, 'com.etsong.web.controller.system.SysPrototypeScoreController.remove()', 'DELETE', 1, 'admin', '研发部门', '/questions/prototype/3', '127.0.0.1', '内网IP', '[3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 13:23:50', 26);
INSERT INTO `sys_oper_log` VALUES (109, '得分管理', 3, 'com.etsong.web.controller.system.SysPrototypeScoreController.remove()', 'DELETE', 1, 'admin', '研发部门', '/questions/prototype/3', '127.0.0.1', '内网IP', '[3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 13:29:07', 28);
INSERT INTO `sys_oper_log` VALUES (110, '题目管理', 1, 'com.etsong.questions.controller.TopicController.add()', 'POST', 1, 'admin', '研发部门', '/questions/topic', '127.0.0.1', '内网IP', '{\"params\":{},\"prototypeId\":1,\"topicContent\":\"<p>1</p>\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'topic_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ThinkPad\\Desktop\\ZhiCe\\zhice-system\\target\\classes\\mapper\\questions\\TopicMapper.xml]\r\n### The error may involve com.etsong.questions.mapper.TopicMapper.insertTopic-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into topic          ( topic_content,             prototype_id )           values ( ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'topic_id\' doesn\'t have a default value\n; Field \'topic_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'topic_id\' doesn\'t have a default value', '2025-07-07 22:38:46', 153);
INSERT INTO `sys_oper_log` VALUES (111, '题目管理', 1, 'com.etsong.questions.controller.TopicController.add()', 'POST', 1, 'admin', '研发部门', '/questions/topic', '127.0.0.1', '内网IP', '{\"params\":{},\"prototypeId\":1,\"topicContent\":\"<p>12</p>\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'topic_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ThinkPad\\Desktop\\ZhiCe\\zhice-system\\target\\classes\\mapper\\questions\\TopicMapper.xml]\r\n### The error may involve com.etsong.questions.mapper.TopicMapper.insertTopic-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into topic          ( topic_content,             prototype_id )           values ( ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'topic_id\' doesn\'t have a default value\n; Field \'topic_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'topic_id\' doesn\'t have a default value', '2025-07-08 09:27:47', 151);
INSERT INTO `sys_oper_log` VALUES (112, '题目管理', 1, 'com.etsong.questions.controller.TopicController.add()', 'POST', 1, 'admin', '研发部门', '/questions/topic', '127.0.0.1', '内网IP', '{\"params\":{},\"prototypeId\":1,\"topicContent\":\"<p>12</p>\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'topic_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ThinkPad\\Desktop\\ZhiCe\\zhice-system\\target\\classes\\mapper\\questions\\TopicMapper.xml]\r\n### The error may involve com.etsong.questions.mapper.TopicMapper.insertTopic-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into topic          ( topic_content,             prototype_id )           values ( ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'topic_id\' doesn\'t have a default value\n; Field \'topic_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'topic_id\' doesn\'t have a default value', '2025-07-08 09:27:51', 8);
INSERT INTO `sys_oper_log` VALUES (113, '题目管理', 1, 'com.etsong.questions.controller.TopicController.add()', 'POST', 1, 'admin', '研发部门', '/questions/topic', '127.0.0.1', '内网IP', '{\"params\":{},\"prototypeId\":1,\"topicContent\":\"<p>1</p>\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'topic_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ThinkPad\\Desktop\\ZhiCe\\zhice-system\\target\\classes\\mapper\\questions\\TopicMapper.xml]\r\n### The error may involve com.etsong.questions.mapper.TopicMapper.insertTopic-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into topic          ( topic_content,             prototype_id )           values ( ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'topic_id\' doesn\'t have a default value\n; Field \'topic_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'topic_id\' doesn\'t have a default value', '2025-07-08 09:36:58', 8);
INSERT INTO `sys_oper_log` VALUES (114, '题目管理', 2, 'com.etsong.questions.controller.TopicController.edit()', 'PUT', 1, 'admin', '研发部门', '/questions/topic', '127.0.0.1', '内网IP', '{\"params\":{},\"prototypeId\":11,\"topicContent\":\"<p>我会不加判断地就接受外来的消息。</p>\",\"topicId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-08 09:37:27', 36);
INSERT INTO `sys_oper_log` VALUES (115, '题目管理', 2, 'com.etsong.questions.controller.TopicController.edit()', 'PUT', 1, 'admin', '研发部门', '/questions/topic', '127.0.0.1', '内网IP', '{\"params\":{},\"prototypeId\":11,\"topicContent\":\"<p>我会不加判断地就接受外来的消息。</p>\",\"topicId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-08 09:37:53', 5);
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 1, 'com.etsong.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"原型测试结果\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":4,\"path\":\"/result\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-08 15:10:57', 278);
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 2, 'com.etsong.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-07-01 16:51:40\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":4,\"menuName\":\"心理测试\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"questions\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 08:45:45', 54);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 3, 'com.etsong.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/3003', '127.0.0.1', '内网IP', '3003', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 08:45:55', 45);
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 2, 'com.etsong.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-07-08 15:10:57\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3004,\"menuName\":\"原型测试结果\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":4,\"path\":\"questions/topic/result\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 08:46:53', 38);
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 2, 'com.etsong.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"questions/topic/index\",\"createTime\":\"2025-07-01 20:46:26\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"题目管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":4,\"path\":\"topic\",\"perms\":\"questions:topic:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 08:57:07', 11);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 2, 'com.etsong.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"questions/score/index\",\"createTime\":\"2025-07-01 20:46:26\",\"icon\":\"star\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3000,\"menuName\":\"得分管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":4,\"path\":\"score\",\"perms\":\"questions:score:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 08:57:18', 14);
INSERT INTO `sys_oper_log` VALUES (122, '题目管理', 2, 'com.etsong.questions.controller.TopicController.edit()', 'PUT', 1, 'admin', '研发部门', '/questions/topic', '127.0.0.1', '内网IP', '{\"params\":{},\"prototypeId\":11,\"topicContent\":\"<p>我会不加判断地就接受外来的消息。</p>\",\"topicId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 09:38:53', 22);
INSERT INTO `sys_oper_log` VALUES (123, '题目管理', 2, 'com.etsong.questions.controller.TopicController.edit()', 'PUT', 1, 'admin', '研发部门', '/questions/topic', '127.0.0.1', '内网IP', '{\"params\":{},\"prototypeId\":11,\"topicContent\":\"我会不加判断地就接受外来的消息.\",\"topicId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 09:39:04', 34);
INSERT INTO `sys_oper_log` VALUES (124, '题目管理', 2, 'com.etsong.questions.controller.TopicController.edit()', 'PUT', 1, 'admin', '研发部门', '/questions/topic', '127.0.0.1', '内网IP', '{\"params\":{},\"prototypeId\":11,\"topicContent\":\"我会不加判断地就接受外来的消息。\",\"topicId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 09:39:12', 32);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 2, 'com.etsong.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-07-01 16:51:40\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":4,\"menuName\":\"原型测试\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"psychological\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 09:39:53', 27);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 1, 'com.etsong.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"性格测试\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"personality\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 09:40:23', 37);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 2, 'com.etsong.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-07-25 09:40:23\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3005,\"menuName\":\"性格测试\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"personality\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 09:40:35', 21);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 1, 'com.etsong.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"row\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"性格测试结果\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":3005,\"path\":\"result\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 09:41:58', 22);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 1, 'com.etsong.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"性格测试\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":3005,\"path\":\"test\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 09:43:12', 38);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 2, 'com.etsong.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-07-25 09:40:23\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3005,\"menuName\":\"得分管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"scores\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 09:43:33', 36);
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 2, 'com.etsong.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-07-25 09:40:23\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3005,\"menuName\":\"性格测试\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"personality\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 09:43:53', 40);
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.etsong.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-07-25 09:43:12\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3007,\"menuName\":\"性格测试\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":3005,\"path\":\"test\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 09:44:01', 29);
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 2, 'com.etsong.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-07-25 09:41:58\",\"icon\":\"row\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3006,\"menuName\":\"性格测试结果\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":3005,\"path\":\"result\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 09:44:05', 20);
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 1, 'com.etsong.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"选项管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":3005,\"path\":\"options\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 09:44:25', 20);
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 1, 'com.etsong.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"得分管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":3005,\"path\":\"scores\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 09:44:59', 35);
INSERT INTO `sys_oper_log` VALUES (136, '角色管理', 1, 'com.etsong.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,4,2007,3004,2001,2002,2003,2004,2005,2006,3000,3002,3005,3007,3006,3008,3009,100,1000,1001,1002,1003,1004,1005,1006,108,500,1039,1040,1041,501,1042,1043,1044,1045,109,1046,1047,1048,111,113,114],\"params\":{},\"roleId\":101,\"roleKey\":\"mangement\",\"roleName\":\"管理员\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 10:30:28', 35);
INSERT INTO `sys_oper_log` VALUES (137, '角色管理', 1, 'com.etsong.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,4,2007,3004,2001,2002,2003,2004,2005,2006,3000,3002,3005,3007,3006,3008,3009,100,1000,1001,1002,1003,1004,1005,1006,108,500,1039,1040,1041,501,1042,1043,1044,1045,109,1046,1047,1048,112,113,114],\"params\":{},\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"新增角色\'管理员\'失败，角色名称已存在\",\"code\":500}', 0, NULL, '2025-07-25 10:31:10', 2);
INSERT INTO `sys_oper_log` VALUES (138, '角色管理', 1, 'com.etsong.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,4,2007,3004,2001,2002,2003,2004,2005,2006,3000,3002,3005,3007,3006,3008,3009,100,1000,1001,1002,1003,1004,1005,1006,108,500,1039,1040,1041,501,1042,1043,1044,1045,109,1046,1047,1048,112,113,114],\"params\":{},\"roleKey\":\"admin\",\"roleName\":\"管理\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"新增角色\'管理\'失败，角色权限已存在\",\"code\":500}', 0, NULL, '2025-07-25 10:31:16', 4);
INSERT INTO `sys_oper_log` VALUES (139, '角色管理', 1, 'com.etsong.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,4,2007,3004,2001,2002,2003,2004,2005,2006,3000,3002,3005,3007,3006,3008,3009,100,1000,1001,1002,1003,1004,1005,1006,108,500,1039,1040,1041,501,1042,1043,1044,1045,109,1046,1047,1048,112,113,114],\"params\":{},\"roleId\":102,\"roleKey\":\"manage\",\"roleName\":\"管理\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 10:31:31', 42);
INSERT INTO `sys_oper_log` VALUES (140, '角色管理', 2, 'com.etsong.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-07-25 10:30:28\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4,3005,2007,3004,3007,3006],\"params\":{},\"roleId\":101,\"roleKey\":\"test\",\"roleName\":\"心理测试用户\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 10:32:17', 38);
INSERT INTO `sys_oper_log` VALUES (141, '部门管理', 3, 'com.etsong.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/102', '127.0.0.1', '内网IP', '102', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2025-07-25 10:32:37', 3);
INSERT INTO `sys_oper_log` VALUES (142, '部门管理', 3, 'com.etsong.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/109', '127.0.0.1', '内网IP', '109', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 10:32:40', 32);
INSERT INTO `sys_oper_log` VALUES (143, '部门管理', 3, 'com.etsong.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/108', '127.0.0.1', '内网IP', '108', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 10:32:42', 36);
INSERT INTO `sys_oper_log` VALUES (144, '部门管理', 3, 'com.etsong.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/102', '127.0.0.1', '内网IP', '102', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 10:32:47', 32);
INSERT INTO `sys_oper_log` VALUES (145, '部门管理', 2, 'com.etsong.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"心理测试\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 10:32:56', 20);
INSERT INTO `sys_oper_log` VALUES (146, '部门管理', 2, 'com.etsong.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"测试小组\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"心理测试\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 10:33:07', 28);
INSERT INTO `sys_oper_log` VALUES (147, '部门管理', 3, 'com.etsong.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/105', '127.0.0.1', '内网IP', '105', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2025-07-25 10:33:13', 6);
INSERT INTO `sys_oper_log` VALUES (148, '部门管理', 3, 'com.etsong.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/106', '127.0.0.1', '内网IP', '106', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 10:33:15', 36);
INSERT INTO `sys_oper_log` VALUES (149, '部门管理', 3, 'com.etsong.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/107', '127.0.0.1', '内网IP', '107', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 10:33:18', 37);
INSERT INTO `sys_oper_log` VALUES (150, '部门管理', 2, 'com.etsong.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"测试一组\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"测试小组\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 10:33:32', 22);
INSERT INTO `sys_oper_log` VALUES (151, '部门管理', 2, 'com.etsong.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"测试二组\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"测试小组\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 10:33:39', 17);
INSERT INTO `sys_oper_log` VALUES (152, '用户管理', 1, 'com.etsong.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"wang\",\"params\":{},\"postIds\":[],\"roleIds\":[102],\"status\":\"0\",\"userId\":103,\"userName\":\"wang\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 10:34:24', 86);
INSERT INTO `sys_oper_log` VALUES (153, '用户管理', 1, 'com.etsong.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"test\",\"params\":{},\"postIds\":[],\"roleIds\":[102],\"status\":\"0\",\"userId\":104,\"userName\":\"test\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 10:34:41', 101);
INSERT INTO `sys_oper_log` VALUES (154, '角色管理', 2, 'com.etsong.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '测试一组', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-07-25 10:31:31\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,4,2007,3004,2001,2002,2003,2004,2005,2006,3000,3002,3005,3007,3006,3008,3009,100,1000,1001,1002,1003,1004,1005,1006,108,500,1039,1040,1041,501,1042,1043,1044,1045,109,1046,1047,1048,112,113,114],\"params\":{},\"roleId\":102,\"roleKey\":\"admin\",\"roleName\":\"管理\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"修改角色\'管理\'失败，角色权限已存在\",\"code\":500}', 0, NULL, '2025-07-25 10:46:39', 7);
INSERT INTO `sys_oper_log` VALUES (155, '角色管理', 2, 'com.etsong.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '测试一组', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-07-25 10:30:28\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4,3005,2007,3004,3007,3006],\"params\":{},\"roleId\":101,\"roleKey\":\"admin\",\"roleName\":\"心理测试用户\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"修改角色\'心理测试用户\'失败，角色权限已存在\",\"code\":500}', 0, NULL, '2025-07-25 11:00:46', 9);
INSERT INTO `sys_oper_log` VALUES (156, '题目管理', 2, 'com.etsong.questions.controller.TopicController.edit()', 'PUT', 1, 'wang', NULL, '/questions/topic', '127.0.0.1', '内网IP', '{\"params\":{},\"prototypeId\":11,\"topicContent\":\"我会不加判断地就接受外来的消息\",\"topicId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 13:17:07', 35);
INSERT INTO `sys_oper_log` VALUES (157, '题目管理', 2, 'com.etsong.questions.controller.TopicController.edit()', 'PUT', 1, 'wang', NULL, '/questions/topic', '127.0.0.1', '内网IP', '{\"params\":{},\"prototypeId\":11,\"topicContent\":\"我会不加判断地就接受外来的消息。\",\"topicId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-25 13:17:12', 33);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-07-01 16:21:31', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-07-01 16:21:31', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (3, '普通角色', 'common', 3, '2', 1, 1, '0', '0', 'admin', '2025-07-01 16:21:31', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (101, '心理测试用户', 'test', 0, '1', 1, 1, '0', '0', 'admin', '2025-07-25 10:30:28', 'admin', '2025-07-25 10:32:16', NULL);
INSERT INTO `sys_role` VALUES (102, '管理', 'manage', 0, '1', 1, 1, '0', '0', 'admin', '2025-07-25 10:31:31', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 5);
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
INSERT INTO `sys_role_menu` VALUES (3, 4);
INSERT INTO `sys_role_menu` VALUES (3, 3000);
INSERT INTO `sys_role_menu` VALUES (3, 3001);
INSERT INTO `sys_role_menu` VALUES (3, 3002);
INSERT INTO `sys_role_menu` VALUES (101, 4);
INSERT INTO `sys_role_menu` VALUES (101, 2007);
INSERT INTO `sys_role_menu` VALUES (101, 3004);
INSERT INTO `sys_role_menu` VALUES (101, 3005);
INSERT INTO `sys_role_menu` VALUES (101, 3006);
INSERT INTO `sys_role_menu` VALUES (101, 3007);
INSERT INTO `sys_role_menu` VALUES (102, 1);
INSERT INTO `sys_role_menu` VALUES (102, 2);
INSERT INTO `sys_role_menu` VALUES (102, 4);
INSERT INTO `sys_role_menu` VALUES (102, 100);
INSERT INTO `sys_role_menu` VALUES (102, 108);
INSERT INTO `sys_role_menu` VALUES (102, 109);
INSERT INTO `sys_role_menu` VALUES (102, 112);
INSERT INTO `sys_role_menu` VALUES (102, 113);
INSERT INTO `sys_role_menu` VALUES (102, 114);
INSERT INTO `sys_role_menu` VALUES (102, 500);
INSERT INTO `sys_role_menu` VALUES (102, 501);
INSERT INTO `sys_role_menu` VALUES (102, 1000);
INSERT INTO `sys_role_menu` VALUES (102, 1001);
INSERT INTO `sys_role_menu` VALUES (102, 1002);
INSERT INTO `sys_role_menu` VALUES (102, 1003);
INSERT INTO `sys_role_menu` VALUES (102, 1004);
INSERT INTO `sys_role_menu` VALUES (102, 1005);
INSERT INTO `sys_role_menu` VALUES (102, 1006);
INSERT INTO `sys_role_menu` VALUES (102, 1039);
INSERT INTO `sys_role_menu` VALUES (102, 1040);
INSERT INTO `sys_role_menu` VALUES (102, 1041);
INSERT INTO `sys_role_menu` VALUES (102, 1042);
INSERT INTO `sys_role_menu` VALUES (102, 1043);
INSERT INTO `sys_role_menu` VALUES (102, 1044);
INSERT INTO `sys_role_menu` VALUES (102, 1045);
INSERT INTO `sys_role_menu` VALUES (102, 1046);
INSERT INTO `sys_role_menu` VALUES (102, 1047);
INSERT INTO `sys_role_menu` VALUES (102, 1048);
INSERT INTO `sys_role_menu` VALUES (102, 2001);
INSERT INTO `sys_role_menu` VALUES (102, 2002);
INSERT INTO `sys_role_menu` VALUES (102, 2003);
INSERT INTO `sys_role_menu` VALUES (102, 2004);
INSERT INTO `sys_role_menu` VALUES (102, 2005);
INSERT INTO `sys_role_menu` VALUES (102, 2006);
INSERT INTO `sys_role_menu` VALUES (102, 2007);
INSERT INTO `sys_role_menu` VALUES (102, 3000);
INSERT INTO `sys_role_menu` VALUES (102, 3002);
INSERT INTO `sys_role_menu` VALUES (102, 3004);
INSERT INTO `sys_role_menu` VALUES (102, 3005);
INSERT INTO `sys_role_menu` VALUES (102, 3006);
INSERT INTO `sys_role_menu` VALUES (102, 3007);
INSERT INTO `sys_role_menu` VALUES (102, 3008);
INSERT INTO `sys_role_menu` VALUES (102, 3009);

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
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-07-25 13:14:46', '2025-07-01 16:21:31', 'admin', '2025-07-01 16:21:31', '', '2025-07-25 13:14:46', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-07-03 13:34:24', '2025-07-01 16:21:31', 'admin', '2025-07-01 16:21:31', '', '2025-07-03 13:34:24', '测试员');
INSERT INTO `sys_user` VALUES (3, NULL, 'zz', 'zz', '00', '', '', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-07-03 15:41:16', '2025-07-01 17:02:21', '', '2025-07-01 17:02:20', '', '2025-07-03 15:41:16', NULL);
INSERT INTO `sys_user` VALUES (100, NULL, '心理测试1', '心理测试1', '00', '', '', '0', '', '$2a$10$IdRs9sy7/pgd5YaPu0khAOBVk1JDsWVhKX87B7B2//WutrV58kUWe', '0', '0', '127.0.0.1', '2025-07-01 17:02:35', '2025-07-01 17:02:21', '', '2025-07-01 17:02:20', '', '2025-07-01 17:02:35', '测试员');
INSERT INTO `sys_user` VALUES (101, NULL, '12', '12', '00', '', '', '0', '', '$2a$10$NepADPcKx6U.12TksTlQl.IAZYb1QvrgDDEC.8f3hUsxlDIfoTwOy', '0', '0', '127.0.0.1', '2025-07-08 15:48:56', '2025-07-08 15:48:45', '', '2025-07-08 15:48:45', '', '2025-07-08 15:48:55', NULL);
INSERT INTO `sys_user` VALUES (102, NULL, '123', '123', '00', '', '', '0', '', '$2a$10$qlGyk81DaK8lkCptEJn5c.BFP8sGHQHuuMny0JSVzkZ2.2Vc4R7bq', '0', '0', '', NULL, '2025-07-25 08:43:03', '', '2025-07-25 08:43:03', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (103, NULL, 'wang', 'wang', '00', '', '', '0', '', '$2a$10$SKcNCtPj6zO6MdFbHFXOLe4BTUDSm0hTld64RjyU3p5TMvO6.ZqMW', '0', '0', '127.0.0.1', '2025-07-25 13:08:45', NULL, 'admin', '2025-07-25 10:34:24', '', '2025-07-25 13:08:44', NULL);
INSERT INTO `sys_user` VALUES (104, NULL, 'test', 'test', '00', '', '', '0', '', '$2a$10$LT1ckknsfU2Yk8Tzd2V83.JHI6oij6XuXC12HESjLwI0uj1Dh3vz2', '0', '0', '', NULL, NULL, 'admin', '2025-07-25 10:34:41', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (105, NULL, '1234', '1234', '00', '', '', '0', '', '$2a$10$o1rfSyEtVfKf3gV7s9HnjeuGjSJj8N/6.uH9D5Nu/8yM/nzR/2t/K', '0', '0', '127.0.0.1', '2025-07-25 13:54:22', '2025-07-25 13:54:12', '', '2025-07-25 13:54:12', '', '2025-07-25 13:54:22', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 3);
INSERT INTO `sys_user_role` VALUES (101, 101);
INSERT INTO `sys_user_role` VALUES (103, 102);
INSERT INTO `sys_user_role` VALUES (104, 102);
INSERT INTO `sys_user_role` VALUES (105, 101);

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of test_record
-- ----------------------------
INSERT INTO `test_record` VALUES (12, 1, '2025-07-08 15:20:22');
INSERT INTO `test_record` VALUES (13, 103, '2025-07-25 13:13:27');
INSERT INTO `test_record` VALUES (14, 103, '2025-07-25 13:16:50');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 289 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of topic_answer
-- ----------------------------
INSERT INTO `topic_answer` VALUES (73, 12, 1, 5);
INSERT INTO `topic_answer` VALUES (74, 12, 2, 5);
INSERT INTO `topic_answer` VALUES (75, 12, 3, 5);
INSERT INTO `topic_answer` VALUES (76, 12, 4, 5);
INSERT INTO `topic_answer` VALUES (77, 12, 5, 5);
INSERT INTO `topic_answer` VALUES (78, 12, 6, 5);
INSERT INTO `topic_answer` VALUES (79, 12, 7, 5);
INSERT INTO `topic_answer` VALUES (80, 12, 8, 5);
INSERT INTO `topic_answer` VALUES (81, 12, 9, 5);
INSERT INTO `topic_answer` VALUES (82, 12, 10, 5);
INSERT INTO `topic_answer` VALUES (83, 12, 11, 5);
INSERT INTO `topic_answer` VALUES (84, 12, 12, 5);
INSERT INTO `topic_answer` VALUES (85, 12, 13, 5);
INSERT INTO `topic_answer` VALUES (86, 12, 14, 5);
INSERT INTO `topic_answer` VALUES (87, 12, 15, 5);
INSERT INTO `topic_answer` VALUES (88, 12, 16, 5);
INSERT INTO `topic_answer` VALUES (89, 12, 17, 5);
INSERT INTO `topic_answer` VALUES (90, 12, 18, 5);
INSERT INTO `topic_answer` VALUES (91, 12, 19, 5);
INSERT INTO `topic_answer` VALUES (92, 12, 20, 5);
INSERT INTO `topic_answer` VALUES (93, 12, 21, 5);
INSERT INTO `topic_answer` VALUES (94, 12, 22, 5);
INSERT INTO `topic_answer` VALUES (95, 12, 23, 5);
INSERT INTO `topic_answer` VALUES (96, 12, 24, 5);
INSERT INTO `topic_answer` VALUES (97, 12, 25, 5);
INSERT INTO `topic_answer` VALUES (98, 12, 26, 5);
INSERT INTO `topic_answer` VALUES (99, 12, 27, 5);
INSERT INTO `topic_answer` VALUES (100, 12, 28, 5);
INSERT INTO `topic_answer` VALUES (101, 12, 29, 5);
INSERT INTO `topic_answer` VALUES (102, 12, 30, 5);
INSERT INTO `topic_answer` VALUES (103, 12, 31, 5);
INSERT INTO `topic_answer` VALUES (104, 12, 32, 5);
INSERT INTO `topic_answer` VALUES (105, 12, 33, 5);
INSERT INTO `topic_answer` VALUES (106, 12, 34, 5);
INSERT INTO `topic_answer` VALUES (107, 12, 35, 5);
INSERT INTO `topic_answer` VALUES (108, 12, 36, 5);
INSERT INTO `topic_answer` VALUES (109, 12, 37, 5);
INSERT INTO `topic_answer` VALUES (110, 12, 38, 5);
INSERT INTO `topic_answer` VALUES (111, 12, 39, 5);
INSERT INTO `topic_answer` VALUES (112, 12, 40, 5);
INSERT INTO `topic_answer` VALUES (113, 12, 41, 5);
INSERT INTO `topic_answer` VALUES (114, 12, 42, 5);
INSERT INTO `topic_answer` VALUES (115, 12, 43, 5);
INSERT INTO `topic_answer` VALUES (116, 12, 44, 5);
INSERT INTO `topic_answer` VALUES (117, 12, 45, 5);
INSERT INTO `topic_answer` VALUES (118, 12, 46, 5);
INSERT INTO `topic_answer` VALUES (119, 12, 47, 5);
INSERT INTO `topic_answer` VALUES (120, 12, 48, 5);
INSERT INTO `topic_answer` VALUES (121, 12, 49, 5);
INSERT INTO `topic_answer` VALUES (122, 12, 50, 5);
INSERT INTO `topic_answer` VALUES (123, 12, 51, 5);
INSERT INTO `topic_answer` VALUES (124, 12, 52, 5);
INSERT INTO `topic_answer` VALUES (125, 12, 53, 5);
INSERT INTO `topic_answer` VALUES (126, 12, 54, 5);
INSERT INTO `topic_answer` VALUES (127, 12, 55, 5);
INSERT INTO `topic_answer` VALUES (128, 12, 56, 5);
INSERT INTO `topic_answer` VALUES (129, 12, 57, 5);
INSERT INTO `topic_answer` VALUES (130, 12, 58, 5);
INSERT INTO `topic_answer` VALUES (131, 12, 59, 5);
INSERT INTO `topic_answer` VALUES (132, 12, 60, 5);
INSERT INTO `topic_answer` VALUES (133, 12, 61, 5);
INSERT INTO `topic_answer` VALUES (134, 12, 62, 5);
INSERT INTO `topic_answer` VALUES (135, 12, 63, 5);
INSERT INTO `topic_answer` VALUES (136, 12, 64, 5);
INSERT INTO `topic_answer` VALUES (137, 12, 65, 5);
INSERT INTO `topic_answer` VALUES (138, 12, 66, 5);
INSERT INTO `topic_answer` VALUES (139, 12, 67, 5);
INSERT INTO `topic_answer` VALUES (140, 12, 68, 5);
INSERT INTO `topic_answer` VALUES (141, 12, 69, 5);
INSERT INTO `topic_answer` VALUES (142, 12, 70, 5);
INSERT INTO `topic_answer` VALUES (143, 12, 71, 5);
INSERT INTO `topic_answer` VALUES (144, 12, 72, 5);
INSERT INTO `topic_answer` VALUES (145, 13, 1, 2);
INSERT INTO `topic_answer` VALUES (146, 13, 2, 1);
INSERT INTO `topic_answer` VALUES (147, 13, 3, 2);
INSERT INTO `topic_answer` VALUES (148, 13, 4, 3);
INSERT INTO `topic_answer` VALUES (149, 13, 5, 2);
INSERT INTO `topic_answer` VALUES (150, 13, 6, 3);
INSERT INTO `topic_answer` VALUES (151, 13, 7, 2);
INSERT INTO `topic_answer` VALUES (152, 13, 8, 3);
INSERT INTO `topic_answer` VALUES (153, 13, 9, 2);
INSERT INTO `topic_answer` VALUES (154, 13, 10, 3);
INSERT INTO `topic_answer` VALUES (155, 13, 11, 2);
INSERT INTO `topic_answer` VALUES (156, 13, 12, 3);
INSERT INTO `topic_answer` VALUES (157, 13, 13, 2);
INSERT INTO `topic_answer` VALUES (158, 13, 14, 3);
INSERT INTO `topic_answer` VALUES (159, 13, 15, 2);
INSERT INTO `topic_answer` VALUES (160, 13, 16, 3);
INSERT INTO `topic_answer` VALUES (161, 13, 17, 2);
INSERT INTO `topic_answer` VALUES (162, 13, 18, 3);
INSERT INTO `topic_answer` VALUES (163, 13, 19, 2);
INSERT INTO `topic_answer` VALUES (164, 13, 20, 3);
INSERT INTO `topic_answer` VALUES (165, 13, 21, 2);
INSERT INTO `topic_answer` VALUES (166, 13, 22, 3);
INSERT INTO `topic_answer` VALUES (167, 13, 23, 2);
INSERT INTO `topic_answer` VALUES (168, 13, 24, 3);
INSERT INTO `topic_answer` VALUES (169, 13, 25, 2);
INSERT INTO `topic_answer` VALUES (170, 13, 26, 3);
INSERT INTO `topic_answer` VALUES (171, 13, 27, 2);
INSERT INTO `topic_answer` VALUES (172, 13, 28, 3);
INSERT INTO `topic_answer` VALUES (173, 13, 29, 2);
INSERT INTO `topic_answer` VALUES (174, 13, 30, 3);
INSERT INTO `topic_answer` VALUES (175, 13, 31, 4);
INSERT INTO `topic_answer` VALUES (176, 13, 32, 5);
INSERT INTO `topic_answer` VALUES (177, 13, 33, 4);
INSERT INTO `topic_answer` VALUES (178, 13, 34, 5);
INSERT INTO `topic_answer` VALUES (179, 13, 35, 4);
INSERT INTO `topic_answer` VALUES (180, 13, 36, 5);
INSERT INTO `topic_answer` VALUES (181, 13, 37, 4);
INSERT INTO `topic_answer` VALUES (182, 13, 38, 5);
INSERT INTO `topic_answer` VALUES (183, 13, 39, 4);
INSERT INTO `topic_answer` VALUES (184, 13, 40, 5);
INSERT INTO `topic_answer` VALUES (185, 13, 41, 4);
INSERT INTO `topic_answer` VALUES (186, 13, 42, 5);
INSERT INTO `topic_answer` VALUES (187, 13, 43, 4);
INSERT INTO `topic_answer` VALUES (188, 13, 44, 5);
INSERT INTO `topic_answer` VALUES (189, 13, 45, 4);
INSERT INTO `topic_answer` VALUES (190, 13, 46, 5);
INSERT INTO `topic_answer` VALUES (191, 13, 47, 4);
INSERT INTO `topic_answer` VALUES (192, 13, 48, 5);
INSERT INTO `topic_answer` VALUES (193, 13, 49, 4);
INSERT INTO `topic_answer` VALUES (194, 13, 50, 4);
INSERT INTO `topic_answer` VALUES (195, 13, 51, 5);
INSERT INTO `topic_answer` VALUES (196, 13, 52, 4);
INSERT INTO `topic_answer` VALUES (197, 13, 53, 5);
INSERT INTO `topic_answer` VALUES (198, 13, 54, 4);
INSERT INTO `topic_answer` VALUES (199, 13, 55, 4);
INSERT INTO `topic_answer` VALUES (200, 13, 56, 3);
INSERT INTO `topic_answer` VALUES (201, 13, 57, 4);
INSERT INTO `topic_answer` VALUES (202, 13, 58, 3);
INSERT INTO `topic_answer` VALUES (203, 13, 59, 4);
INSERT INTO `topic_answer` VALUES (204, 13, 60, 3);
INSERT INTO `topic_answer` VALUES (205, 13, 61, 3);
INSERT INTO `topic_answer` VALUES (206, 13, 62, 3);
INSERT INTO `topic_answer` VALUES (207, 13, 63, 3);
INSERT INTO `topic_answer` VALUES (208, 13, 64, 4);
INSERT INTO `topic_answer` VALUES (209, 13, 65, 3);
INSERT INTO `topic_answer` VALUES (210, 13, 66, 4);
INSERT INTO `topic_answer` VALUES (211, 13, 67, 4);
INSERT INTO `topic_answer` VALUES (212, 13, 68, 3);
INSERT INTO `topic_answer` VALUES (213, 13, 69, 2);
INSERT INTO `topic_answer` VALUES (214, 13, 70, 5);
INSERT INTO `topic_answer` VALUES (215, 13, 71, 5);
INSERT INTO `topic_answer` VALUES (216, 13, 72, 4);
INSERT INTO `topic_answer` VALUES (217, 14, 1, 1);
INSERT INTO `topic_answer` VALUES (218, 14, 2, 1);
INSERT INTO `topic_answer` VALUES (219, 14, 3, 1);
INSERT INTO `topic_answer` VALUES (220, 14, 4, 2);
INSERT INTO `topic_answer` VALUES (221, 14, 5, 2);
INSERT INTO `topic_answer` VALUES (222, 14, 6, 1);
INSERT INTO `topic_answer` VALUES (223, 14, 7, 2);
INSERT INTO `topic_answer` VALUES (224, 14, 8, 2);
INSERT INTO `topic_answer` VALUES (225, 14, 9, 2);
INSERT INTO `topic_answer` VALUES (226, 14, 10, 2);
INSERT INTO `topic_answer` VALUES (227, 14, 11, 2);
INSERT INTO `topic_answer` VALUES (228, 14, 12, 2);
INSERT INTO `topic_answer` VALUES (229, 14, 13, 2);
INSERT INTO `topic_answer` VALUES (230, 14, 14, 2);
INSERT INTO `topic_answer` VALUES (231, 14, 15, 2);
INSERT INTO `topic_answer` VALUES (232, 14, 16, 2);
INSERT INTO `topic_answer` VALUES (233, 14, 17, 2);
INSERT INTO `topic_answer` VALUES (234, 14, 18, 2);
INSERT INTO `topic_answer` VALUES (235, 14, 19, 2);
INSERT INTO `topic_answer` VALUES (236, 14, 20, 2);
INSERT INTO `topic_answer` VALUES (237, 14, 21, 2);
INSERT INTO `topic_answer` VALUES (238, 14, 22, 2);
INSERT INTO `topic_answer` VALUES (239, 14, 23, 2);
INSERT INTO `topic_answer` VALUES (240, 14, 24, 2);
INSERT INTO `topic_answer` VALUES (241, 14, 25, 2);
INSERT INTO `topic_answer` VALUES (242, 14, 26, 2);
INSERT INTO `topic_answer` VALUES (243, 14, 27, 2);
INSERT INTO `topic_answer` VALUES (244, 14, 28, 2);
INSERT INTO `topic_answer` VALUES (245, 14, 29, 2);
INSERT INTO `topic_answer` VALUES (246, 14, 30, 2);
INSERT INTO `topic_answer` VALUES (247, 14, 31, 2);
INSERT INTO `topic_answer` VALUES (248, 14, 32, 2);
INSERT INTO `topic_answer` VALUES (249, 14, 33, 2);
INSERT INTO `topic_answer` VALUES (250, 14, 34, 2);
INSERT INTO `topic_answer` VALUES (251, 14, 35, 2);
INSERT INTO `topic_answer` VALUES (252, 14, 36, 2);
INSERT INTO `topic_answer` VALUES (253, 14, 37, 2);
INSERT INTO `topic_answer` VALUES (254, 14, 38, 2);
INSERT INTO `topic_answer` VALUES (255, 14, 39, 2);
INSERT INTO `topic_answer` VALUES (256, 14, 40, 2);
INSERT INTO `topic_answer` VALUES (257, 14, 41, 2);
INSERT INTO `topic_answer` VALUES (258, 14, 42, 2);
INSERT INTO `topic_answer` VALUES (259, 14, 43, 2);
INSERT INTO `topic_answer` VALUES (260, 14, 44, 2);
INSERT INTO `topic_answer` VALUES (261, 14, 45, 2);
INSERT INTO `topic_answer` VALUES (262, 14, 46, 2);
INSERT INTO `topic_answer` VALUES (263, 14, 47, 2);
INSERT INTO `topic_answer` VALUES (264, 14, 48, 2);
INSERT INTO `topic_answer` VALUES (265, 14, 49, 2);
INSERT INTO `topic_answer` VALUES (266, 14, 50, 2);
INSERT INTO `topic_answer` VALUES (267, 14, 51, 2);
INSERT INTO `topic_answer` VALUES (268, 14, 52, 2);
INSERT INTO `topic_answer` VALUES (269, 14, 53, 2);
INSERT INTO `topic_answer` VALUES (270, 14, 54, 2);
INSERT INTO `topic_answer` VALUES (271, 14, 55, 2);
INSERT INTO `topic_answer` VALUES (272, 14, 56, 2);
INSERT INTO `topic_answer` VALUES (273, 14, 57, 2);
INSERT INTO `topic_answer` VALUES (274, 14, 58, 2);
INSERT INTO `topic_answer` VALUES (275, 14, 59, 2);
INSERT INTO `topic_answer` VALUES (276, 14, 60, 2);
INSERT INTO `topic_answer` VALUES (277, 14, 61, 2);
INSERT INTO `topic_answer` VALUES (278, 14, 62, 2);
INSERT INTO `topic_answer` VALUES (279, 14, 63, 2);
INSERT INTO `topic_answer` VALUES (280, 14, 64, 2);
INSERT INTO `topic_answer` VALUES (281, 14, 65, 2);
INSERT INTO `topic_answer` VALUES (282, 14, 66, 2);
INSERT INTO `topic_answer` VALUES (283, 14, 67, 2);
INSERT INTO `topic_answer` VALUES (284, 14, 68, 2);
INSERT INTO `topic_answer` VALUES (285, 14, 69, 2);
INSERT INTO `topic_answer` VALUES (286, 14, 70, 2);
INSERT INTO `topic_answer` VALUES (287, 14, 71, 2);
INSERT INTO `topic_answer` VALUES (288, 14, 72, 2);

SET FOREIGN_KEY_CHECKS = 1;
