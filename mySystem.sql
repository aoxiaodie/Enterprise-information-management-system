-- ----------------------------
-- create table base_admin_user
-- ----------------------------
CREATE TABLE `base_admin_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sys_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统用户名称',
  `sys_user_pwd` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '系统用户密码',
  `role_id` int(255) DEFAULT NULL COMMENT '角色',
  `reg_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登记时间',
  `user_status` int(1) NOT NULL DEFAULT 0 COMMENT '状态（0：无效；1：有效）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统管理员帐号' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_admin_user
-- ----------------------------
INSERT INTO `base_admin_user` VALUES (1, 'admin', '3ef7164d1f6167cb9f2658c07d3c2f0a', 1, '2018-11-22 10:57:33', 1);
SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- create table base_admin_role
-- ----------------------------
CREATE TABLE `base_admin_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色描述',
  `permissions` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限',
  `create_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新时间',
  `role_status` int(1) NOT NULL DEFAULT 1 COMMENT '1：有效 \r\n            0：无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_admin_role
-- ----------------------------
INSERT INTO `base_admin_role` VALUES (1, '系统管理员', '系统管理员', '1,15,17', '2018-11-21 15:54:07', '2018-11-21 15:54:07', 1);

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- create table base_admin_permission
-- ----------------------------
CREATE TABLE `base_admin_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单名称',
  `pid` int(11) DEFAULT NULL COMMENT '父菜单id',
  `descpt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单url',
  `create_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '添加时间',
  `update_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新时间',
  `del_flag` int(1) DEFAULT NULL COMMENT '删除标志（0:删除 1：存在）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of base_admin_permission
-- ----------------------------
INSERT INTO `base_admin_permission` VALUES (1, '系统管理', 0, '系统管理', '', '2018-11-30 10:27:34', '2018-11-30 10:27:34', 1);
INSERT INTO `base_admin_permission` VALUES (2, '账号管理', 1, '账号管理', '/user/userManage', '2018-11-30 11:44:41', '2018-11-30 11:56:34', 1);
INSERT INTO `base_admin_permission` VALUES (3, '角色管理', 1, '角色管理', '/role/roleManage', '2018-11-30 11:45:27', '2018-11-30 11:45:27', 1);
INSERT INTO `base_admin_permission` VALUES (7, '权限管理', 1, '权限管理', '/permission/permissionManage', '2018-11-30 11:48:35', '2018-11-30 15:13:38', 1);

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- create table base_staff
-- ----------------------------
CREATE TABLE `base_staff`  (
  `s_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工号',
  `s_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `s_sex` char(2) CHECK(ee_sex='男' OR ee_sex='女'),
  `s_birthday` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '出生日期',
  `s_number` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号码',
  `s_address` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `s_section` int(255) DEFAULT NULL COMMENT '部门',
  `s_job` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '职位',
  `s_salary` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '薪水',
  `s_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '手机号码',
  `s_school` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '学校',
  `s_major` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '专业',
  `s_status` int(1) NOT NULL DEFAULT 1 COMMENT '状态（0：无效；1：有效）',
  PRIMARY KEY (`s_id`) USING BTREE
);

-- ----------------------------
-- Records of base_staff
-- ----------------------------
INSERT INTO `base_staff` VALUES (1, '许嵩', '男', '1986-05-14', '250124198605144672',
 '安徽合肥',1,'音乐总监','20000','13687094415','安徽医科大学','临床医学',1);
SET FOREIGN_KEY_CHECKS = 1;


-- ----------------------------
-- create table base_section
-- ----------------------------
CREATE TABLE `base_section`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门名称',
  `pid` int(11) DEFAULT NULL COMMENT '父菜单id',
  `del_flag` int(1)NOT NULL DEFAULT 1 COMMENT '删除标志（0:删除 1：存在）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of base_section
-- ----------------------------
INSERT INTO `base_section` VALUES (1, '总公司', 0, 1);
INSERT INTO `base_section` VALUES (2, '测试中心', 1, 1);
INSERT INTO `base_section` VALUES (3, '开发中心', 1, 1);

SET FOREIGN_KEY_CHECKS = 1;

use mysystem;
-- ----------------------------
-- create table leave_staff
-- ----------------------------
CREATE TABLE `leave_staff`  (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL COMMENT '员工号，外键',
  `leave_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '离职时间',
  `leave_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '离职原因',
  `salary` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '薪水',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


alter table leave_staff add foreign key(id) references base_staff(s_id);