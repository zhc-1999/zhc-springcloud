/*
 Navicat Premium Data Transfer

 Source Server         : 192.144.238.212zhc
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 192.144.238.212:3306
 Source Schema         : zhc

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 05/05/2022 15:24:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `deleted` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 0, '0', '北京总公司', 0, 'zhc', '17521746738', '17521746738@163.com', '0', '0', '1', '2022-01-29 21:56:46', '1', '2022-01-29 21:56:46');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (101, 1, '0,1', '北京公司1', 1, 'zhc', '17521746738', '17521746738@163.com', '0', '0', '1', '2022-01-29 21:56:46', '1', '2022-01-29 21:56:46');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (102, 1, '0,1', '北京公司2', 2, 'zhc', '17521746738', '17521746738@163.com', '0', '0', '1', '2022-01-29 21:56:46', '1', '2022-01-29 21:56:46');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (10101, 101, '0,1,101', '丰台公司1', 1, 'zhc', '17521746738', '17521746738@163.com', '0', '0', '1', '2022-01-29 21:56:46', '1', '2022-01-29 21:56:46');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (10102, 101, '0,1,101', '丰台公司2', 2, 'zhc', '17521746738', '17521746738@163.com', '0', '0', '1', '2022-01-29 21:56:46', '1', '2022-01-29 21:56:46');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (10201, 102, '0,1,102', '昌平公司1', 1, 'zhc', '17521746738', '17521746738@163.com', '0', '0', '1', '2022-01-29 21:56:46', '1', '2022-01-29 21:56:46');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (10202, 102, '0,1,102', '昌平公司2', 2, 'zhc', '17521746738', '17521746738@163.com', '0', '0', '1', '2022-01-29 21:56:46', '1', '2022-01-29 21:56:46');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `deleted` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', '性别男', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', '性别女', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', '性别未知', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', '显示菜单', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', '隐藏菜单', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', '正常状态', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', '停用状态', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', '正常状态', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', '停用状态', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', '默认分组', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', '系统分组', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', '系统默认是', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', '系统默认否', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', '通知', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', '公告', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', '正常状态', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', '关闭状态', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', '新增操作', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', '修改操作', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', '删除操作', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', '授权操作', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', '导出操作', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', '导入操作', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', '强退操作', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', '生成操作', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', '清空操作', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', '正常状态', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', '停用状态', '0', '', NULL, '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `deleted` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, '用户性别', 'sys_user_sex', '0', '用户性别列表', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, '菜单状态', 'sys_show_hide', '0', '菜单状态列表', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (3, '系统开关', 'sys_normal_disable', '0', '系统开关列表', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (4, '任务状态', 'sys_job_status', '0', '任务状态列表', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (5, '任务分组', 'sys_job_group', '0', '任务分组列表', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (6, '系统是否', 'sys_yes_no', '0', '系统是否列表', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (7, '通知类型', 'sys_notice_type', '0', '通知类型列表', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (8, '通知状态', 'sys_notice_status', '0', '通知状态列表', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (9, '操作类型', 'sys_oper_type', '0', '操作类型列表', '0', '', NULL, '', NULL);
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (10, '系统状态', 'sys_common_status', '0', '登录状态列表', '0', '', NULL, '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_id` bigint DEFAULT NULL COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示信息',
  `access_time` datetime DEFAULT NULL COMMENT '访问时间',
  `create_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=653 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (129, 1, '127.0.0.1', '0', '登录成功', '2022-01-31 16:10:39', '1', '2022-01-31 16:10:44', '1', '2022-01-31 16:10:44');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (130, 1, '127.0.0.1', '0', '登录成功', '2022-02-04 17:03:08', '1', '2022-02-04 17:03:08', '1', '2022-02-04 17:03:08');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (131, 1, '127.0.0.1', '0', '登录成功', '2022-02-04 17:03:35', '1', '2022-02-04 17:03:35', '1', '2022-02-04 17:03:35');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (132, 1, '127.0.0.1', '0', '登录成功', '2022-02-04 17:06:34', '1', '2022-02-04 17:06:34', '1', '2022-02-04 17:06:34');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (133, 1, '127.0.0.1', '0', '登录成功', '2022-02-04 17:10:15', '1', '2022-02-04 17:10:15', '1', '2022-02-04 17:10:15');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (134, 1, '127.0.0.1', '0', '登录成功', '2022-02-04 17:15:00', '1', '2022-02-04 17:15:00', '1', '2022-02-04 17:15:00');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (135, 1, '127.0.0.1', '0', '登录成功', '2022-02-04 17:15:16', '1', '2022-02-04 17:15:16', '1', '2022-02-04 17:15:16');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (136, 1, '127.0.0.1', '0', '登录成功', '2022-02-04 17:16:16', '1', '2022-02-04 17:16:16', '1', '2022-02-04 17:16:16');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (137, 1, '127.0.0.1', '0', '登录成功', '2022-02-04 17:16:23', '1', '2022-02-04 17:16:23', '1', '2022-02-04 17:16:23');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (138, 1, '127.0.0.1', '0', '登录成功', '2022-02-04 17:17:36', '1', '2022-02-04 17:17:36', '1', '2022-02-04 17:17:36');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (139, 1, '127.0.0.1', '0', '登录成功', '2022-02-04 17:17:38', '1', '2022-02-04 17:17:38', '1', '2022-02-04 17:17:38');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (140, 1, '127.0.0.1', '0', '登录成功', '2022-02-04 17:22:44', '1', '2022-02-04 17:22:44', '1', '2022-02-04 17:22:44');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (141, 1, '127.0.0.1', '0', '登录成功', '2022-02-04 17:22:52', '1', '2022-02-04 17:22:52', '1', '2022-02-04 17:22:52');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (142, 1, '127.0.0.1', '0', '登录成功', '2022-02-04 17:23:10', '1', '2022-02-04 17:23:10', '1', '2022-02-04 17:23:10');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (143, 1, '127.0.0.1', '0', '登录成功', '2022-02-04 19:02:42', '1', '2022-02-04 19:02:42', '1', '2022-02-04 19:02:42');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (144, 1, '127.0.0.1', '0', '登录成功', '2022-02-04 19:03:49', '1', '2022-02-04 19:03:49', '1', '2022-02-04 19:03:49');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (145, 1, '127.0.0.1', '0', '登录成功', '2022-02-04 19:05:36', '1', '2022-02-04 19:05:36', '1', '2022-02-04 19:05:36');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (146, 1, '127.0.0.1', '0', '登录成功', '2022-02-04 19:06:04', '1', '2022-02-04 19:06:04', '1', '2022-02-04 19:06:04');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (147, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 07:52:29', '1', '2022-02-05 07:52:29', '1', '2022-02-05 07:52:29');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (148, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 07:52:29', '1', '2022-02-05 07:52:29', '1', '2022-02-05 07:52:29');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (149, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 07:52:41', '1', '2022-02-05 07:52:41', '1', '2022-02-05 07:52:41');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (150, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 07:53:03', '1', '2022-02-05 07:53:03', '1', '2022-02-05 07:53:03');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (151, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 07:53:12', '1', '2022-02-05 07:53:12', '1', '2022-02-05 07:53:12');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (152, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 07:53:14', '1', '2022-02-05 07:53:14', '1', '2022-02-05 07:53:14');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (153, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 07:53:15', '1', '2022-02-05 07:53:15', '1', '2022-02-05 07:53:15');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (154, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 07:53:16', '1', '2022-02-05 07:53:16', '1', '2022-02-05 07:53:16');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (155, 1, '127.0.0.1', '0', '登录成功', '2022-02-05 07:53:25', '1', '2022-02-05 07:53:25', '1', '2022-02-05 07:53:25');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (156, 1, '127.0.0.1', '0', '登录成功', '2022-02-05 07:53:47', '1', '2022-02-05 07:53:47', '1', '2022-02-05 07:53:47');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (157, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 07:53:58', '1', '2022-02-05 07:53:58', '1', '2022-02-05 07:53:58');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (158, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 07:54:33', '1', '2022-02-05 07:54:33', '1', '2022-02-05 07:54:33');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (159, 1, '127.0.0.1', '0', '登录成功', '2022-02-05 07:59:45', '1', '2022-02-05 07:59:45', '1', '2022-02-05 07:59:45');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (160, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 08:01:13', '1', '2022-02-05 08:01:13', '1', '2022-02-05 08:01:13');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (161, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 08:01:15', '1', '2022-02-05 08:01:15', '1', '2022-02-05 08:01:15');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (162, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 08:01:15', '1', '2022-02-05 08:01:15', '1', '2022-02-05 08:01:15');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (163, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 08:01:52', '1', '2022-02-05 08:01:52', '1', '2022-02-05 08:01:52');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (164, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 08:02:18', '1', '2022-02-05 08:02:18', '1', '2022-02-05 08:02:18');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (165, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 08:02:20', '1', '2022-02-05 08:02:20', '1', '2022-02-05 08:02:20');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (166, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 08:02:20', '1', '2022-02-05 08:02:20', '1', '2022-02-05 08:02:20');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (167, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 08:02:21', '1', '2022-02-05 08:02:21', '1', '2022-02-05 08:02:21');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (168, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 08:02:21', '1', '2022-02-05 08:02:21', '1', '2022-02-05 08:02:21');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (169, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 08:02:21', '1', '2022-02-05 08:02:21', '1', '2022-02-05 08:02:21');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (170, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 08:03:25', '1', '2022-02-05 08:03:25', '1', '2022-02-05 08:03:25');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (171, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 08:03:27', '1', '2022-02-05 08:03:27', '1', '2022-02-05 08:03:27');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (172, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 08:03:28', '1', '2022-02-05 08:03:28', '1', '2022-02-05 08:03:28');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (173, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-02-05 08:03:54', '1', '2022-02-05 08:03:54', '1', '2022-02-05 08:03:54');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (174, 1, '127.0.0.1', '0', '登录成功', '2022-02-05 08:05:20', '1', '2022-02-05 08:05:20', '1', '2022-02-05 08:05:20');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (175, 1, '127.0.0.1', '0', '登录成功', '2022-02-05 08:07:50', '1', '2022-02-05 08:07:50', '1', '2022-02-05 08:07:50');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (176, 1, '127.0.0.1', '0', '登录成功', '2022-02-05 08:08:01', '1', '2022-02-05 08:08:01', '1', '2022-02-05 08:08:01');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (177, 1, '127.0.0.1', '0', '登录成功', '2022-02-05 08:12:08', '1', '2022-02-05 08:12:08', '1', '2022-02-05 08:12:08');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (178, 1, '127.0.0.1', '0', '登录成功', '2022-02-05 08:17:36', '1', '2022-02-05 08:17:37', '1', '2022-02-05 08:17:37');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (179, 1, '127.0.0.1', '0', '登录成功', '2022-02-05 08:17:36', '1', '2022-02-05 08:17:37', '1', '2022-02-05 08:17:37');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (180, 1, '127.0.0.1', '0', '登录成功', '2022-02-05 08:18:42', '1', '2022-02-05 08:18:42', '1', '2022-02-05 08:18:42');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (181, 1, '127.0.0.1', '0', '登录成功', '2022-02-15 11:19:39', '1', '2022-02-15 11:19:39', '1', '2022-02-15 11:19:39');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (182, 1, '127.0.0.1', '0', '登录成功', '2022-02-15 13:59:17', '1', '2022-02-15 13:59:17', '1', '2022-02-15 13:59:17');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (183, 1, '127.0.0.1', '0', '登录成功', '2022-02-21 14:30:11', '1', '2022-02-21 14:30:11', '1', '2022-02-21 14:30:11');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (184, 1, '127.0.0.1', '0', '登录成功', '2022-02-21 14:30:57', '1', '2022-02-21 14:30:57', '1', '2022-02-21 14:30:57');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (185, 1, '127.0.0.1', '0', '登录成功', '2022-02-21 15:11:13', '1', '2022-02-21 15:11:13', '1', '2022-02-21 15:11:13');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (186, 1, '127.0.0.1', '0', '登录成功', '2022-02-21 15:18:00', '1', '2022-02-21 15:18:00', '1', '2022-02-21 15:18:00');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (187, 1, '127.0.0.1', '0', '登录成功', '2022-02-21 15:24:11', '1', '2022-02-21 15:24:11', '1', '2022-02-21 15:24:11');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (188, 1, '127.0.0.1', '0', '登录成功', '2022-02-21 16:24:54', '1', '2022-02-21 16:24:54', '1', '2022-02-21 16:24:54');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (189, 1, '127.0.0.1', '0', '登录成功', '2022-02-21 17:01:49', '1', '2022-02-21 17:01:49', '1', '2022-02-21 17:01:49');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (190, 1, '127.0.0.1', '0', '登录成功', '2022-02-21 17:01:50', '1', '2022-02-21 17:01:50', '1', '2022-02-21 17:01:50');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (191, 1, '127.0.0.1', '0', '登录成功', '2022-02-21 17:01:51', '1', '2022-02-21 17:01:51', '1', '2022-02-21 17:01:51');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (192, 1, '127.0.0.1', '0', '登录成功', '2022-02-21 17:01:52', '1', '2022-02-21 17:01:52', '1', '2022-02-21 17:01:52');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (193, 1, '127.0.0.1', '0', '登录成功', '2022-02-21 17:02:26', '1', '2022-02-21 17:02:26', '1', '2022-02-21 17:02:26');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (194, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 11:35:36', '1', '2022-02-22 11:35:36', '1', '2022-02-22 11:35:36');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (195, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:19:55', '1', '2022-02-22 12:19:55', '1', '2022-02-22 12:19:55');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (196, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:23:30', '1', '2022-02-22 12:23:30', '1', '2022-02-22 12:23:30');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (197, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:27:35', '1', '2022-02-22 12:27:35', '1', '2022-02-22 12:27:35');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (198, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:28:27', '1', '2022-02-22 12:28:27', '1', '2022-02-22 12:28:27');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (199, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:30:45', '1', '2022-02-22 12:30:45', '1', '2022-02-22 12:30:45');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (200, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:30:46', '1', '2022-02-22 12:30:46', '1', '2022-02-22 12:30:46');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (201, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:31:25', '1', '2022-02-22 12:31:25', '1', '2022-02-22 12:31:25');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (202, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:31:31', '1', '2022-02-22 12:31:31', '1', '2022-02-22 12:31:31');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (203, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:32:47', '1', '2022-02-22 12:32:47', '1', '2022-02-22 12:32:47');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (204, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:33:40', '1', '2022-02-22 12:33:40', '1', '2022-02-22 12:33:40');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (205, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:35:27', '1', '2022-02-22 12:35:27', '1', '2022-02-22 12:35:27');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (206, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:35:39', '1', '2022-02-22 12:35:39', '1', '2022-02-22 12:35:39');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (207, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:39:11', '1', '2022-02-22 12:39:11', '1', '2022-02-22 12:39:11');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (208, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:40:33', '1', '2022-02-22 12:40:33', '1', '2022-02-22 12:40:33');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (209, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:40:35', '1', '2022-02-22 12:40:35', '1', '2022-02-22 12:40:35');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (210, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:40:35', '1', '2022-02-22 12:40:35', '1', '2022-02-22 12:40:35');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (211, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:40:36', '1', '2022-02-22 12:40:36', '1', '2022-02-22 12:40:36');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (212, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:40:36', '1', '2022-02-22 12:40:36', '1', '2022-02-22 12:40:36');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (213, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:40:36', '1', '2022-02-22 12:40:36', '1', '2022-02-22 12:40:36');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (214, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:40:36', '1', '2022-02-22 12:40:36', '1', '2022-02-22 12:40:36');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (215, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:40:36', '1', '2022-02-22 12:40:36', '1', '2022-02-22 12:40:36');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (216, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:40:46', '1', '2022-02-22 12:40:46', '1', '2022-02-22 12:40:46');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (217, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:41:02', '1', '2022-02-22 12:41:02', '1', '2022-02-22 12:41:02');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (218, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:50:22', '1', '2022-02-22 12:50:22', '1', '2022-02-22 12:50:22');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (219, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:58:50', '1', '2022-02-22 12:58:50', '1', '2022-02-22 12:58:50');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (220, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:58:52', '1', '2022-02-22 12:58:52', '1', '2022-02-22 12:58:52');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (221, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 12:59:09', '1', '2022-02-22 12:59:09', '1', '2022-02-22 12:59:09');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (222, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 13:17:15', '1', '2022-02-22 13:17:15', '1', '2022-02-22 13:17:15');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (223, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 13:18:44', '1', '2022-02-22 13:18:44', '1', '2022-02-22 13:18:44');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (224, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 13:38:42', '1', '2022-02-22 13:38:42', '1', '2022-02-22 13:38:42');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (225, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 13:40:24', '1', '2022-02-22 13:40:24', '1', '2022-02-22 13:40:24');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (226, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 13:47:37', '1', '2022-02-22 13:47:37', '1', '2022-02-22 13:47:37');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (227, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 13:51:06', '1', '2022-02-22 13:51:06', '1', '2022-02-22 13:51:06');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (228, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 13:53:49', '1', '2022-02-22 13:53:49', '1', '2022-02-22 13:53:49');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (229, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 14:09:10', '1', '2022-02-22 14:09:10', '1', '2022-02-22 14:09:10');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (230, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 14:10:12', '1', '2022-02-22 14:10:12', '1', '2022-02-22 14:10:12');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (231, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 14:13:25', '1', '2022-02-22 14:13:25', '1', '2022-02-22 14:13:25');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (232, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 14:23:10', '1', '2022-02-22 14:23:10', '1', '2022-02-22 14:23:10');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (233, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 14:24:39', '1', '2022-02-22 14:24:39', '1', '2022-02-22 14:24:39');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (234, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 14:25:15', '1', '2022-02-22 14:25:15', '1', '2022-02-22 14:25:15');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (235, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 14:26:23', '1', '2022-02-22 14:26:23', '1', '2022-02-22 14:26:23');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (236, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 14:38:43', '1', '2022-02-22 14:38:43', '1', '2022-02-22 14:38:43');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (237, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 16:17:06', '1', '2022-02-22 16:17:06', '1', '2022-02-22 16:17:06');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (238, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 16:28:31', '1', '2022-02-22 16:28:31', '1', '2022-02-22 16:28:31');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (239, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 16:32:40', '1', '2022-02-22 16:32:40', '1', '2022-02-22 16:32:40');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (240, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 16:46:50', '1', '2022-02-22 16:46:50', '1', '2022-02-22 16:46:50');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (241, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 16:47:12', '1', '2022-02-22 16:47:12', '1', '2022-02-22 16:47:12');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (242, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 17:28:59', '1', '2022-02-22 17:28:59', '1', '2022-02-22 17:28:59');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (243, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 17:30:06', '1', '2022-02-22 17:30:06', '1', '2022-02-22 17:30:06');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (244, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 17:45:10', '1', '2022-02-22 17:45:10', '1', '2022-02-22 17:45:10');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (245, 1, '127.0.0.1', '0', '登录成功', '2022-02-22 17:47:53', '1', '2022-02-22 17:47:53', '1', '2022-02-22 17:47:53');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (246, 1, '127.0.0.1', '0', '登录成功', '2022-02-23 10:22:36', '1', '2022-02-23 10:22:36', '1', '2022-02-23 10:22:36');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (247, 1, '127.0.0.1', '0', '登录成功', '2022-03-07 20:01:31', '1', '2022-03-07 20:01:31', '1', '2022-03-07 20:01:31');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (248, 1, '127.0.0.1', '0', '登录成功', '2022-03-07 20:03:11', '1', '2022-03-07 20:03:11', '1', '2022-03-07 20:03:11');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (249, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-03-07 20:03:19', '1', '2022-03-07 20:03:19', '1', '2022-03-07 20:03:19');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (250, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-03-07 23:24:09', '1', '2022-03-07 23:24:09', '1', '2022-03-07 23:24:09');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (251, 1, '127.0.0.1', '0', '登录成功', '2022-03-07 23:24:25', '1', '2022-03-07 23:24:25', '1', '2022-03-07 23:24:25');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (252, 1, '127.0.0.1', '1', '用户不存在/密码错误', '2022-03-08 14:39:55', '1', '2022-03-08 14:39:55', '1', '2022-03-08 14:39:55');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (253, 1, '127.0.0.1', '0', '登录成功', '2022-03-08 14:40:32', '1', '2022-03-08 14:40:32', '1', '2022-03-08 14:40:32');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (254, 1, '127.0.0.1', '0', '登录成功', '2022-03-09 23:25:30', '1', '2022-03-09 23:25:30', '1', '2022-03-09 23:25:30');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (255, 1, '127.0.0.1', '0', '登录成功', '2022-03-09 23:27:29', '1', '2022-03-09 23:27:29', '1', '2022-03-09 23:27:29');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (256, 1, '127.0.0.1', '0', '登录成功', '2022-03-09 23:36:08', '1', '2022-03-09 23:36:08', '1', '2022-03-09 23:36:08');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (257, 1, '127.0.0.1', '0', '登录成功', '2022-03-09 23:37:48', '1', '2022-03-09 23:37:48', '1', '2022-03-09 23:37:48');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (258, 1, '127.0.0.1', '0', '登录成功', '2022-03-09 23:50:42', '1', '2022-03-09 23:50:42', '1', '2022-03-09 23:50:42');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (259, 1, '127.0.0.1', '0', '登录成功', '2022-03-09 23:51:30', '1', '2022-03-09 23:51:30', '1', '2022-03-09 23:51:30');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (260, 1, '127.0.0.1', '0', '登录成功', '2022-03-09 23:51:57', '1', '2022-03-09 23:51:57', '1', '2022-03-09 23:51:57');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (261, 1, '127.0.0.1', '0', '登录成功', '2022-03-09 23:56:16', '1', '2022-03-09 23:56:16', '1', '2022-03-09 23:56:16');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (262, 1, '127.0.0.1', '0', '登录成功', '2022-03-10 00:06:49', '1', '2022-03-10 00:06:49', '1', '2022-03-10 00:06:49');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (263, 1, '127.0.0.1', '0', '登录成功', '2022-03-10 00:07:00', '1', '2022-03-10 00:07:00', '1', '2022-03-10 00:07:00');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (264, 1, '127.0.0.1', '0', '登录成功', '2022-03-10 00:07:04', '1', '2022-03-10 00:07:04', '1', '2022-03-10 00:07:04');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (265, 1, '127.0.0.1', '0', '登录成功', '2022-03-10 00:07:05', '1', '2022-03-10 00:07:05', '1', '2022-03-10 00:07:05');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (266, 1, '127.0.0.1', '0', '登录成功', '2022-03-10 00:08:13', '1', '2022-03-10 00:08:13', '1', '2022-03-10 00:08:13');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (267, 1, '127.0.0.1', '0', '登录成功', '2022-03-10 00:08:58', '1', '2022-03-10 00:08:58', '1', '2022-03-10 00:08:58');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (268, 1, '127.0.0.1', '0', '登录成功', '2022-03-10 00:10:33', '1', '2022-03-10 00:10:33', '1', '2022-03-10 00:10:33');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (269, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:46:31', '1', '2022-03-11 23:46:31', '1', '2022-03-11 23:46:31');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (270, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:46:33', '1', '2022-03-11 23:46:33', '1', '2022-03-11 23:46:33');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (271, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:48:08', '1', '2022-03-11 23:48:08', '1', '2022-03-11 23:48:08');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (272, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:48:15', '1', '2022-03-11 23:48:15', '1', '2022-03-11 23:48:15');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (273, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:48:33', '1', '2022-03-11 23:48:33', '1', '2022-03-11 23:48:33');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (274, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:48:58', '1', '2022-03-11 23:48:58', '1', '2022-03-11 23:48:58');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (275, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:48:59', '1', '2022-03-11 23:48:59', '1', '2022-03-11 23:48:59');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (276, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:49:00', '1', '2022-03-11 23:49:00', '1', '2022-03-11 23:49:00');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (277, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:49:12', '1', '2022-03-11 23:49:12', '1', '2022-03-11 23:49:12');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (278, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:49:28', '1', '2022-03-11 23:49:28', '1', '2022-03-11 23:49:28');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (279, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:49:39', '1', '2022-03-11 23:49:39', '1', '2022-03-11 23:49:39');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (280, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:49:41', '1', '2022-03-11 23:49:41', '1', '2022-03-11 23:49:41');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (281, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:49:42', '1', '2022-03-11 23:49:42', '1', '2022-03-11 23:49:42');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (282, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:49:43', '1', '2022-03-11 23:49:43', '1', '2022-03-11 23:49:43');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (283, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:49:43', '1', '2022-03-11 23:49:43', '1', '2022-03-11 23:49:43');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (284, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:49:44', '1', '2022-03-11 23:49:44', '1', '2022-03-11 23:49:44');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (285, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:49:52', '1', '2022-03-11 23:49:52', '1', '2022-03-11 23:49:52');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (286, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:50:19', '1', '2022-03-11 23:50:19', '1', '2022-03-11 23:50:19');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (287, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:50:19', '1', '2022-03-11 23:50:19', '1', '2022-03-11 23:50:19');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (288, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:50:37', '1', '2022-03-11 23:50:37', '1', '2022-03-11 23:50:37');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (289, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:51:14', '1', '2022-03-11 23:51:14', '1', '2022-03-11 23:51:14');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (290, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:51:17', '1', '2022-03-11 23:51:17', '1', '2022-03-11 23:51:17');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (291, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:51:18', '1', '2022-03-11 23:51:18', '1', '2022-03-11 23:51:18');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (292, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:51:18', '1', '2022-03-11 23:51:18', '1', '2022-03-11 23:51:18');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (293, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:51:19', '1', '2022-03-11 23:51:19', '1', '2022-03-11 23:51:19');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (294, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:51:19', '1', '2022-03-11 23:51:19', '1', '2022-03-11 23:51:19');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (295, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:51:19', '1', '2022-03-11 23:51:19', '1', '2022-03-11 23:51:19');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (296, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:51:23', '1', '2022-03-11 23:51:23', '1', '2022-03-11 23:51:23');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (297, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:51:24', '1', '2022-03-11 23:51:24', '1', '2022-03-11 23:51:24');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (298, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:51:24', '1', '2022-03-11 23:51:24', '1', '2022-03-11 23:51:24');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (299, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:51:33', '1', '2022-03-11 23:51:33', '1', '2022-03-11 23:51:33');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (300, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:51:34', '1', '2022-03-11 23:51:34', '1', '2022-03-11 23:51:34');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (301, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:51:35', '1', '2022-03-11 23:51:35', '1', '2022-03-11 23:51:35');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (302, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:52:00', '1', '2022-03-11 23:52:00', '1', '2022-03-11 23:52:00');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (303, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:52:02', '1', '2022-03-11 23:52:02', '1', '2022-03-11 23:52:02');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (304, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:52:03', '1', '2022-03-11 23:52:03', '1', '2022-03-11 23:52:03');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (305, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:52:09', '1', '2022-03-11 23:52:09', '1', '2022-03-11 23:52:09');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (306, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:52:10', '1', '2022-03-11 23:52:10', '1', '2022-03-11 23:52:10');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (307, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:52:10', '1', '2022-03-11 23:52:10', '1', '2022-03-11 23:52:10');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (308, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:52:11', '1', '2022-03-11 23:52:11', '1', '2022-03-11 23:52:11');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (309, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:52:18', '1', '2022-03-11 23:52:18', '1', '2022-03-11 23:52:18');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (310, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:52:19', '1', '2022-03-11 23:52:19', '1', '2022-03-11 23:52:19');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (311, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:52:25', '1', '2022-03-11 23:52:25', '1', '2022-03-11 23:52:25');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (312, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:52:26', '1', '2022-03-11 23:52:26', '1', '2022-03-11 23:52:26');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (313, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:52:26', '1', '2022-03-11 23:52:26', '1', '2022-03-11 23:52:26');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (314, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:52:39', '1', '2022-03-11 23:52:39', '1', '2022-03-11 23:52:39');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (315, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:52:43', '1', '2022-03-11 23:52:43', '1', '2022-03-11 23:52:43');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (316, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:52:44', '1', '2022-03-11 23:52:44', '1', '2022-03-11 23:52:44');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (317, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:52:44', '1', '2022-03-11 23:52:44', '1', '2022-03-11 23:52:44');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (318, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:52:45', '1', '2022-03-11 23:52:45', '1', '2022-03-11 23:52:45');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (319, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:52:52', '1', '2022-03-11 23:52:52', '1', '2022-03-11 23:52:52');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (320, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:52:53', '1', '2022-03-11 23:52:53', '1', '2022-03-11 23:52:53');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (321, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:52:54', '1', '2022-03-11 23:52:54', '1', '2022-03-11 23:52:54');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (322, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:52:54', '1', '2022-03-11 23:52:54', '1', '2022-03-11 23:52:54');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (323, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:52:58', '1', '2022-03-11 23:52:58', '1', '2022-03-11 23:52:58');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (324, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:53:00', '1', '2022-03-11 23:53:00', '1', '2022-03-11 23:53:00');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (325, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:53:01', '1', '2022-03-11 23:53:01', '1', '2022-03-11 23:53:01');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (326, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:53:01', '1', '2022-03-11 23:53:01', '1', '2022-03-11 23:53:01');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (327, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:53:02', '1', '2022-03-11 23:53:02', '1', '2022-03-11 23:53:02');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (328, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:53:02', '1', '2022-03-11 23:53:02', '1', '2022-03-11 23:53:02');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (329, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:53:02', '1', '2022-03-11 23:53:02', '1', '2022-03-11 23:53:02');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (330, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:53:16', '1', '2022-03-11 23:53:16', '1', '2022-03-11 23:53:16');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (331, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:53:17', '1', '2022-03-11 23:53:17', '1', '2022-03-11 23:53:17');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (332, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:53:17', '1', '2022-03-11 23:53:17', '1', '2022-03-11 23:53:17');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (333, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:53:33', '1', '2022-03-11 23:53:33', '1', '2022-03-11 23:53:33');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (334, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:53:34', '1', '2022-03-11 23:53:34', '1', '2022-03-11 23:53:34');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (335, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:53:44', '1', '2022-03-11 23:53:44', '1', '2022-03-11 23:53:44');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (336, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:53:45', '1', '2022-03-11 23:53:45', '1', '2022-03-11 23:53:45');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (337, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:53:48', '1', '2022-03-11 23:53:48', '1', '2022-03-11 23:53:48');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (338, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:53:49', '1', '2022-03-11 23:53:49', '1', '2022-03-11 23:53:49');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (339, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:53:49', '1', '2022-03-11 23:53:49', '1', '2022-03-11 23:53:49');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (340, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:53:50', '1', '2022-03-11 23:53:50', '1', '2022-03-11 23:53:50');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (341, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:53:54', '1', '2022-03-11 23:53:54', '1', '2022-03-11 23:53:54');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (342, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:53:55', '1', '2022-03-11 23:53:55', '1', '2022-03-11 23:53:55');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (343, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:53:56', '1', '2022-03-11 23:53:56', '1', '2022-03-11 23:53:56');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (344, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:53:56', '1', '2022-03-11 23:53:56', '1', '2022-03-11 23:53:56');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (345, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:53:59', '1', '2022-03-11 23:53:59', '1', '2022-03-11 23:53:59');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (346, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:54:05', '1', '2022-03-11 23:54:05', '1', '2022-03-11 23:54:05');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (347, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:54:06', '1', '2022-03-11 23:54:06', '1', '2022-03-11 23:54:06');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (348, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:54:06', '1', '2022-03-11 23:54:06', '1', '2022-03-11 23:54:06');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (349, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:54:09', '1', '2022-03-11 23:54:09', '1', '2022-03-11 23:54:09');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (350, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:54:09', '1', '2022-03-11 23:54:09', '1', '2022-03-11 23:54:09');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (351, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:54:10', '1', '2022-03-11 23:54:10', '1', '2022-03-11 23:54:10');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (352, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:54:10', '1', '2022-03-11 23:54:10', '1', '2022-03-11 23:54:10');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (353, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:54:18', '1', '2022-03-11 23:54:18', '1', '2022-03-11 23:54:18');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (354, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:54:18', '1', '2022-03-11 23:54:18', '1', '2022-03-11 23:54:18');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (355, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:54:19', '1', '2022-03-11 23:54:19', '1', '2022-03-11 23:54:19');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (356, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:54:41', '1', '2022-03-11 23:54:41', '1', '2022-03-11 23:54:41');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (357, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:54:45', '1', '2022-03-11 23:54:45', '1', '2022-03-11 23:54:45');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (358, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:54:46', '1', '2022-03-11 23:54:46', '1', '2022-03-11 23:54:46');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (359, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:54:47', '1', '2022-03-11 23:54:47', '1', '2022-03-11 23:54:47');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (360, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:54:48', '1', '2022-03-11 23:54:48', '1', '2022-03-11 23:54:48');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (361, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:54:48', '1', '2022-03-11 23:54:48', '1', '2022-03-11 23:54:48');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (362, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:54:49', '1', '2022-03-11 23:54:49', '1', '2022-03-11 23:54:49');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (363, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:55:04', '1', '2022-03-11 23:55:04', '1', '2022-03-11 23:55:04');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (364, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:55:05', '1', '2022-03-11 23:55:05', '1', '2022-03-11 23:55:05');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (365, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:55:05', '1', '2022-03-11 23:55:05', '1', '2022-03-11 23:55:05');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (366, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:55:14', '1', '2022-03-11 23:55:14', '1', '2022-03-11 23:55:14');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (367, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:58:38', '1', '2022-03-11 23:58:38', '1', '2022-03-11 23:58:38');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (368, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:58:46', '1', '2022-03-11 23:58:46', '1', '2022-03-11 23:58:46');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (369, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:59:47', '1', '2022-03-11 23:59:47', '1', '2022-03-11 23:59:47');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (370, 1, '127.0.0.1', '0', '登录成功', '2022-03-11 23:59:48', '1', '2022-03-11 23:59:48', '1', '2022-03-11 23:59:48');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (371, 1, '127.0.0.1', '0', '登录成功', '2022-03-12 00:00:24', '1', '2022-03-12 00:00:24', '1', '2022-03-12 00:00:24');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (372, 1, '127.0.0.1', '0', '登录成功', '2022-03-12 13:12:13', '1', '2022-03-12 13:12:13', '1', '2022-03-12 13:12:13');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (373, 1, '127.0.0.1', '0', '登录成功', '2022-03-12 13:12:52', '1', '2022-03-12 13:12:52', '1', '2022-03-12 13:12:52');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (374, 1, '127.0.0.1', '0', '登录成功', '2022-03-12 13:12:57', '1', '2022-03-12 13:12:57', '1', '2022-03-12 13:12:57');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (375, 1, '127.0.0.1', '0', '登录成功', '2022-03-12 13:13:13', '1', '2022-03-12 13:13:13', '1', '2022-03-12 13:13:13');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (376, 1, '127.0.0.1', '0', '登录成功', '2022-03-12 13:15:30', '1', '2022-03-12 13:15:30', '1', '2022-03-12 13:15:30');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (377, 1, '127.0.0.1', '0', '登录成功', '2022-03-12 13:15:39', '1', '2022-03-12 13:15:39', '1', '2022-03-12 13:15:39');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (378, 1, '127.0.0.1', '0', '登录成功', '2022-03-12 13:15:59', '1', '2022-03-12 13:15:59', '1', '2022-03-12 13:15:59');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (379, 1, '127.0.0.1', '0', '登录成功', '2022-03-12 13:16:00', '1', '2022-03-12 13:16:00', '1', '2022-03-12 13:16:00');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (380, 1, '127.0.0.1', '0', '登录成功', '2022-03-12 13:20:02', '1', '2022-03-12 13:20:02', '1', '2022-03-12 13:20:02');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (381, 1, '127.0.0.1', '0', '登录成功', '2022-03-12 15:35:36', '1', '2022-03-12 15:35:36', '1', '2022-03-12 15:35:36');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (382, 1, '127.0.0.1', '0', '登录成功', '2022-03-12 15:36:40', '1', '2022-03-12 15:36:40', '1', '2022-03-12 15:36:40');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (383, 1, '127.0.0.1', '0', '登录成功', '2022-03-13 05:22:40', '1', '2022-03-13 05:22:40', '1', '2022-03-13 05:22:40');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (384, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 15:45:06', '1', '2022-03-15 15:45:06', '1', '2022-03-15 15:45:06');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (385, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 15:53:03', '1', '2022-03-15 15:53:03', '1', '2022-03-15 15:53:03');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (386, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 15:55:08', '1', '2022-03-15 15:55:08', '1', '2022-03-15 15:55:08');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (387, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 15:55:59', '1', '2022-03-15 15:55:59', '1', '2022-03-15 15:55:59');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (388, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 16:34:28', '1', '2022-03-15 16:34:28', '1', '2022-03-15 16:34:28');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (389, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 16:37:26', '1', '2022-03-15 16:37:26', '1', '2022-03-15 16:37:26');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (390, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 16:37:34', '1', '2022-03-15 16:37:34', '1', '2022-03-15 16:37:34');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (391, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 16:41:04', '1', '2022-03-15 16:41:04', '1', '2022-03-15 16:41:04');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (392, 1, '127.0.0.1', '0', '退出成功', '2022-03-15 16:42:24', '1', '2022-03-15 16:42:24', '1', '2022-03-15 16:42:24');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (393, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 16:42:28', '1', '2022-03-15 16:42:28', '1', '2022-03-15 16:42:28');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (394, 1, '127.0.0.1', '0', '退出成功', '2022-03-15 16:42:29', '1', '2022-03-15 16:42:29', '1', '2022-03-15 16:42:29');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (395, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 16:44:57', '1', '2022-03-15 16:44:57', '1', '2022-03-15 16:44:57');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (396, 1, '127.0.0.1', '0', '退出成功', '2022-03-15 16:46:08', '1', '2022-03-15 16:46:08', '1', '2022-03-15 16:46:08');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (397, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 16:49:23', '1', '2022-03-15 16:49:23', '1', '2022-03-15 16:49:23');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (398, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 16:49:27', '1', '2022-03-15 16:49:27', '1', '2022-03-15 16:49:27');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (399, 1, '127.0.0.1', '0', '退出成功', '2022-03-15 16:49:40', '1', '2022-03-15 16:49:40', '1', '2022-03-15 16:49:40');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (400, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 16:49:58', '1', '2022-03-15 16:49:58', '1', '2022-03-15 16:49:58');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (401, 1, '127.0.0.1', '0', '退出成功', '2022-03-15 16:50:01', '1', '2022-03-15 16:50:01', '1', '2022-03-15 16:50:01');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (402, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 16:56:21', '1', '2022-03-15 16:56:21', '1', '2022-03-15 16:56:21');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (403, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 17:00:47', '1', '2022-03-15 17:00:47', '1', '2022-03-15 17:00:47');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (404, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 17:40:23', '1', '2022-03-15 17:40:23', '1', '2022-03-15 17:40:23');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (405, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 17:49:12', '1', '2022-03-15 17:49:12', '1', '2022-03-15 17:49:12');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (406, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 17:54:30', '1', '2022-03-15 17:54:30', '1', '2022-03-15 17:54:30');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (407, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 19:13:36', '1', '2022-03-15 19:13:36', '1', '2022-03-15 19:13:36');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (408, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 19:14:48', '1', '2022-03-15 19:14:48', '1', '2022-03-15 19:14:48');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (409, 1, '127.0.0.1', '0', '退出成功', '2022-03-15 19:49:31', '1', '2022-03-15 19:49:31', '1', '2022-03-15 19:49:31');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (410, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 19:49:34', '1', '2022-03-15 19:49:34', '1', '2022-03-15 19:49:34');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (411, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 19:50:17', '1', '2022-03-15 19:50:17', '1', '2022-03-15 19:50:17');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (412, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 19:52:24', '1', '2022-03-15 19:52:24', '1', '2022-03-15 19:52:24');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (413, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 19:59:27', '1', '2022-03-15 19:59:27', '1', '2022-03-15 19:59:27');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (414, 1, '127.0.0.1', '0', '退出成功', '2022-03-15 20:06:37', '1', '2022-03-15 20:06:37', '1', '2022-03-15 20:06:37');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (415, 1, '127.0.0.1', '0', '登录成功', '2022-03-15 20:07:26', '1', '2022-03-15 20:07:26', '1', '2022-03-15 20:07:26');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (416, 1, '127.0.0.1', '0', '登录成功', '2022-03-16 10:41:30', '1', '2022-03-16 10:41:30', '1', '2022-03-16 10:41:30');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (417, 1, '127.0.0.1', '0', '退出成功', '2022-03-16 11:26:24', '1', '2022-03-16 11:26:25', '1', '2022-03-16 11:26:25');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (418, 1, '127.0.0.1', '0', '登录成功', '2022-03-16 11:26:30', '1', '2022-03-16 11:26:30', '1', '2022-03-16 11:26:30');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (419, 1, '127.0.0.1', '0', '登录成功', '2022-03-16 11:31:58', '1', '2022-03-16 11:31:58', '1', '2022-03-16 11:31:58');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (420, 1, '127.0.0.1', '0', '退出成功', '2022-03-16 15:07:52', '1', '2022-03-16 15:07:52', '1', '2022-03-16 15:07:52');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (421, 1, '127.0.0.1', '0', '登录成功', '2022-03-16 15:36:32', '1', '2022-03-16 15:36:32', '1', '2022-03-16 15:36:32');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (422, 1, '127.0.0.1', '0', '退出成功', '2022-03-16 16:34:43', '1', '2022-03-16 16:34:43', '1', '2022-03-16 16:34:43');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (423, 1, '127.0.0.1', '0', '登录成功', '2022-03-16 16:35:44', '1', '2022-03-16 16:35:44', '1', '2022-03-16 16:35:44');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (424, 1, '127.0.0.1', '0', '退出成功', '2022-03-16 16:37:13', '1', '2022-03-16 16:37:13', '1', '2022-03-16 16:37:13');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (425, 1, '127.0.0.1', '0', '登录成功', '2022-03-16 16:37:14', '1', '2022-03-16 16:37:14', '1', '2022-03-16 16:37:14');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (426, 1, '127.0.0.1', '0', '退出成功', '2022-03-16 16:37:57', '1', '2022-03-16 16:37:57', '1', '2022-03-16 16:37:57');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (427, 1, '127.0.0.1', '0', '登录成功', '2022-03-16 16:37:59', '1', '2022-03-16 16:37:59', '1', '2022-03-16 16:37:59');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (428, 1, '127.0.0.1', '0', '退出成功', '2022-03-16 17:36:42', '1', '2022-03-16 17:36:42', '1', '2022-03-16 17:36:42');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (429, 2, '127.0.0.1', '0', '登录成功', '2022-03-16 17:37:25', '2', '2022-03-16 17:37:25', '2', '2022-03-16 17:37:25');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (430, 2, '127.0.0.1', '0', '退出成功', '2022-03-16 17:38:31', '2', '2022-03-16 17:38:31', '2', '2022-03-16 17:38:31');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (431, 2, '127.0.0.1', '0', '登录成功', '2022-03-16 17:38:35', '2', '2022-03-16 17:38:35', '2', '2022-03-16 17:38:35');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (432, 1, '127.0.0.1', '0', '登录成功', '2022-03-17 17:12:12', '1', '2022-03-17 17:12:12', '1', '2022-03-17 17:12:12');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (433, 1, '127.0.0.1', '0', '登录成功', '2022-03-17 19:39:52', '1', '2022-03-17 19:39:52', '1', '2022-03-17 19:39:52');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (434, 1, '127.0.0.1', '0', '登录成功', '2022-03-17 19:40:03', '1', '2022-03-17 19:40:03', '1', '2022-03-17 19:40:03');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (435, 1, '127.0.0.1', '0', '登录成功', '2022-03-17 19:47:25', '1', '2022-03-17 19:47:25', '1', '2022-03-17 19:47:25');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (436, 1, '127.0.0.1', '0', '登录成功', '2022-03-18 11:31:23', '1', '2022-03-18 11:31:23', '1', '2022-03-18 11:31:23');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (437, 1, '127.0.0.1', '0', '登录成功', '2022-03-18 17:41:37', '1', '2022-03-18 17:41:37', '1', '2022-03-18 17:41:37');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (438, 1, '127.0.0.1', '0', '登录成功', '2022-03-18 18:43:19', '1', '2022-03-18 18:43:19', '1', '2022-03-18 18:43:19');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (439, 1, '127.0.0.1', '0', '登录成功', '2022-03-18 18:47:09', '1', '2022-03-18 18:47:09', '1', '2022-03-18 18:47:09');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (440, 2, '127.0.0.1', '0', '登录成功', '2022-03-18 18:52:38', '2', '2022-03-18 18:52:38', '2', '2022-03-18 18:52:38');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (441, 1, '127.0.0.1', '0', '登录成功', '2022-03-19 14:08:00', '1', '2022-03-19 14:08:00', '1', '2022-03-19 14:08:00');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (442, 1, '127.0.0.1', '0', '登录成功', '2022-03-19 14:08:36', '1', '2022-03-19 14:08:36', '1', '2022-03-19 14:08:36');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (443, 1, '127.0.0.1', '0', '退出成功', '2022-03-19 14:09:56', '1', '2022-03-19 14:09:56', '1', '2022-03-19 14:09:56');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (444, 1, '127.0.0.1', '0', '登录成功', '2022-03-19 14:10:01', '1', '2022-03-19 14:10:01', '1', '2022-03-19 14:10:01');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (445, 1, '127.0.0.1', '0', '退出成功', '2022-03-19 14:10:32', '1', '2022-03-19 14:10:32', '1', '2022-03-19 14:10:32');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (446, 2, '127.0.0.1', '0', '登录成功', '2022-03-19 14:10:38', '2', '2022-03-19 14:10:38', '2', '2022-03-19 14:10:38');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (447, 1, '127.0.0.1', '0', '登录成功', '2022-03-20 03:38:23', '1', '2022-03-20 03:38:23', '1', '2022-03-20 03:38:23');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (448, 1, '127.0.0.1', '0', '退出成功', '2022-03-20 03:38:55', '1', '2022-03-20 03:38:55', '1', '2022-03-20 03:38:55');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (449, 2, '127.0.0.1', '0', '登录成功', '2022-03-20 03:39:00', '2', '2022-03-20 03:39:00', '2', '2022-03-20 03:39:00');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (450, 1, '127.0.0.1', '0', '登录成功', '2022-03-20 04:01:58', '1', '2022-03-20 04:01:58', '1', '2022-03-20 04:01:58');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (451, 1, '127.0.0.1', '0', '退出成功', '2022-03-20 04:02:26', '1', '2022-03-20 04:02:26', '1', '2022-03-20 04:02:26');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (452, 2, '127.0.0.1', '0', '登录成功', '2022-03-20 04:02:31', '2', '2022-03-20 04:02:31', '2', '2022-03-20 04:02:31');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (453, 2, '127.0.0.1', '0', '登录成功', '2022-03-20 05:33:39', '2', '2022-03-20 05:33:39', '2', '2022-03-20 05:33:39');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (454, 2, '127.0.0.1', '0', '登录成功', '2022-03-20 05:33:47', '2', '2022-03-20 05:33:47', '2', '2022-03-20 05:33:47');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (455, 2, '127.0.0.1', '0', '登录成功', '2022-03-20 13:37:21', '2', '2022-03-20 13:37:21', '2', '2022-03-20 13:37:21');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (456, 2, '127.0.0.1', '0', '登录成功', '2022-03-20 13:38:06', '2', '2022-03-20 13:38:06', '2', '2022-03-20 13:38:06');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (457, 1, '127.0.0.1', '0', '登录成功', '2022-03-20 14:38:38', '1', '2022-03-20 14:38:38', '1', '2022-03-20 14:38:38');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (458, 1, '127.0.0.1', '0', '登录成功', '2022-03-20 14:41:59', '1', '2022-03-20 14:41:59', '1', '2022-03-20 14:41:59');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (459, 1, '127.0.0.1', '0', '登录成功', '2022-03-20 14:53:01', '1', '2022-03-20 14:53:01', '1', '2022-03-20 14:53:01');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (460, 1, '127.0.0.1', '0', '登录成功', '2022-03-21 16:36:44', '1', '2022-03-21 16:36:44', '1', '2022-03-21 16:36:44');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (461, 1, '127.0.0.1', '0', '登录成功', '2022-03-21 16:36:55', '1', '2022-03-21 16:36:55', '1', '2022-03-21 16:36:55');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (462, 2, '127.0.0.1', '0', '登录成功', '2022-03-21 16:37:31', '2', '2022-03-21 16:37:31', '2', '2022-03-21 16:37:31');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (463, 2, '127.0.0.1', '0', '登录成功', '2022-03-21 16:44:38', '', '2022-03-21 16:44:38', '', '2022-03-21 16:44:38');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (464, 2, '127.0.0.1', '0', '登录成功', '2022-03-21 17:09:38', '', '2022-03-21 17:09:38', '', '2022-03-21 17:09:38');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (465, 2, '127.0.0.1', '1', '对不起，您的账号：zhc 组织机构不存在', '2022-03-21 17:37:31', '', '2022-03-21 17:37:31', '', '2022-03-21 17:37:31');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (466, 2, '127.0.0.1', '0', '登录成功', '2022-03-21 17:38:07', '', '2022-03-21 17:38:07', '', '2022-03-21 17:38:07');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (467, 2, '127.0.0.1', '0', '登录成功', '2022-03-21 17:38:51', '', '2022-03-21 17:38:51', '', '2022-03-21 17:38:51');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (468, 2, '127.0.0.1', '0', '登录成功', '2022-03-21 20:08:06', '', '2022-03-21 20:08:06', '', '2022-03-21 20:08:06');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (469, 1, '127.0.0.1', '0', '登录成功', '2022-03-21 20:12:24', '', '2022-03-21 20:12:24', '', '2022-03-21 20:12:24');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (470, 1, '127.0.0.1', '0', '退出成功', '2022-03-21 20:48:57', '', '2022-03-21 20:48:57', '', '2022-03-21 20:48:57');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (471, 1, '127.0.0.1', '0', '登录成功', '2022-03-21 20:49:01', '', '2022-03-21 20:49:01', '', '2022-03-21 20:49:01');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (472, 1, '127.0.0.1', '0', '退出成功', '2022-03-21 20:49:45', '', '2022-03-21 20:49:45', '', '2022-03-21 20:49:45');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (473, 1, '127.0.0.1', '0', '登录成功', '2022-03-21 20:49:48', '', '2022-03-21 20:49:48', '', '2022-03-21 20:49:48');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (474, 1, '127.0.0.1', '0', '退出成功', '2022-03-21 21:43:12', '', '2022-03-21 21:43:12', '', '2022-03-21 21:43:12');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (475, 1, '127.0.0.1', '0', '登录成功', '2022-03-21 21:43:19', '', '2022-03-21 21:43:19', '', '2022-03-21 21:43:19');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (476, 1, '127.0.0.1', '0', '退出成功', '2022-03-21 21:43:48', '', '2022-03-21 21:43:48', '', '2022-03-21 21:43:48');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (477, 2, '127.0.0.1', '0', '登录成功', '2022-03-21 21:43:54', '', '2022-03-21 21:43:54', '', '2022-03-21 21:43:54');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (478, 2, '127.0.0.1', '0', '退出成功', '2022-03-21 21:44:44', '', '2022-03-21 21:44:44', '', '2022-03-21 21:44:44');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (479, 2, '127.0.0.1', '0', '登录成功', '2022-03-21 21:44:50', '', '2022-03-21 21:44:50', '', '2022-03-21 21:44:50');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (480, 2, '127.0.0.1', '0', '退出成功', '2022-03-21 21:46:56', '', '2022-03-21 21:46:57', '', '2022-03-21 21:46:57');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (481, 1, '127.0.0.1', '0', '登录成功', '2022-03-21 21:47:01', '', '2022-03-21 21:47:01', '', '2022-03-21 21:47:01');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (482, 1, '127.0.0.1', '0', '退出成功', '2022-03-21 21:47:10', '', '2022-03-21 21:47:10', '', '2022-03-21 21:47:10');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (483, 2, '127.0.0.1', '0', '登录成功', '2022-03-21 21:47:15', '', '2022-03-21 21:47:15', '', '2022-03-21 21:47:15');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (484, 2, '127.0.0.1', '0', '退出成功', '2022-03-21 22:41:15', '', '2022-03-21 22:41:15', '', '2022-03-21 22:41:15');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (485, 1, '127.0.0.1', '0', '登录成功', '2022-03-21 22:41:18', '', '2022-03-21 22:41:18', '', '2022-03-21 22:41:18');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (486, 1, '127.0.0.1', '0', '退出成功', '2022-03-21 23:23:36', '', '2022-03-21 23:23:36', '', '2022-03-21 23:23:36');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (487, 1, '127.0.0.1', '0', '登录成功', '2022-03-21 23:23:41', '', '2022-03-21 23:23:41', '', '2022-03-21 23:23:41');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (488, 1, '127.0.0.1', '0', '退出成功', '2022-03-21 23:42:26', NULL, '2022-03-21 23:42:26', NULL, '2022-03-21 23:42:26');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (489, 104, '127.0.0.1', '0', '登录成功', '2022-03-21 23:42:36', NULL, '2022-03-21 23:42:36', NULL, '2022-03-21 23:42:36');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (490, 104, '127.0.0.1', '0', '退出成功', '2022-03-21 23:43:08', NULL, '2022-03-21 23:43:08', NULL, '2022-03-21 23:43:08');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (491, 1, '127.0.0.1', '0', '登录成功', '2022-03-21 23:44:18', NULL, '2022-03-21 23:44:18', NULL, '2022-03-21 23:44:18');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (492, 2, '127.0.0.1', '0', '登录成功', '2022-03-22 14:01:17', NULL, '2022-03-22 14:01:17', NULL, '2022-03-22 14:01:17');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (493, 2, '127.0.0.1', '0', '退出成功', '2022-03-22 14:10:41', NULL, '2022-03-22 14:10:41', NULL, '2022-03-22 14:10:41');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (494, 2, '127.0.0.1', '0', '登录成功', '2022-03-22 14:10:46', NULL, '2022-03-22 14:10:46', NULL, '2022-03-22 14:10:46');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (495, 2, '127.0.0.1', '0', '退出成功', '2022-03-22 14:10:55', NULL, '2022-03-22 14:10:55', NULL, '2022-03-22 14:10:55');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (496, 1, '127.0.0.1', '0', '登录成功', '2022-03-22 14:10:59', NULL, '2022-03-22 14:10:59', NULL, '2022-03-22 14:10:59');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (497, 1, '127.0.0.1', '0', '退出成功', '2022-03-22 14:11:25', NULL, '2022-03-22 14:11:25', NULL, '2022-03-22 14:11:25');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (498, 2, '127.0.0.1', '0', '登录成功', '2022-03-22 14:11:29', NULL, '2022-03-22 14:11:29', NULL, '2022-03-22 14:11:29');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (499, 2, '127.0.0.1', '0', '退出成功', '2022-03-22 15:51:05', NULL, '2022-03-22 15:51:05', NULL, '2022-03-22 15:51:05');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (500, 2, '127.0.0.1', '0', '登录成功', '2022-03-22 15:51:08', NULL, '2022-03-22 15:51:08', NULL, '2022-03-22 15:51:08');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (501, 2, '127.0.0.1', '0', '退出成功', '2022-03-22 17:39:59', NULL, '2022-03-22 17:39:59', NULL, '2022-03-22 17:39:59');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (502, 1, '127.0.0.1', '0', '登录成功', '2022-03-22 17:40:03', NULL, '2022-03-22 17:40:03', NULL, '2022-03-22 17:40:03');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (503, 1, '127.0.0.1', '0', '退出成功', '2022-03-22 17:40:38', NULL, '2022-03-22 17:40:38', NULL, '2022-03-22 17:40:38');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (504, 2, '127.0.0.1', '0', '登录成功', '2022-03-22 17:40:41', NULL, '2022-03-22 17:40:41', NULL, '2022-03-22 17:40:41');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (505, 2, '127.0.0.1', '0', '退出成功', '2022-03-22 18:13:09', NULL, '2022-03-22 18:13:09', NULL, '2022-03-22 18:13:09');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (506, 1, '127.0.0.1', '0', '登录成功', '2022-03-22 18:13:14', NULL, '2022-03-22 18:13:14', NULL, '2022-03-22 18:13:14');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (507, 1, '127.0.0.1', '0', '登录成功', '2022-03-22 20:30:07', NULL, '2022-03-22 20:30:07', NULL, '2022-03-22 20:30:07');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (508, 1, '127.0.0.1', '0', '登录成功', '2022-03-22 20:54:05', NULL, '2022-03-22 20:54:05', NULL, '2022-03-22 20:54:05');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (509, 1, '127.0.0.1', '0', '登录成功', '2022-03-23 18:07:18', NULL, '2022-03-23 18:07:18', NULL, '2022-03-23 18:07:18');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (510, 1, '127.0.0.1', '0', '登录成功', '2022-03-23 18:07:21', NULL, '2022-03-23 18:07:21', NULL, '2022-03-23 18:07:21');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (511, 1, '127.0.0.1', '0', '退出成功', '2022-03-23 18:08:14', NULL, '2022-03-23 18:08:14', NULL, '2022-03-23 18:08:14');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (512, 107, '127.0.0.1', '0', '登录成功', '2022-03-23 18:08:18', NULL, '2022-03-23 18:08:18', NULL, '2022-03-23 18:08:18');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (513, 107, '127.0.0.1', '0', '退出成功', '2022-03-23 18:09:49', NULL, '2022-03-23 18:09:49', NULL, '2022-03-23 18:09:49');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (514, 107, '127.0.0.1', '0', '登录成功', '2022-03-23 18:09:52', NULL, '2022-03-23 18:09:52', NULL, '2022-03-23 18:09:52');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (515, 107, '127.0.0.1', '0', '退出成功', '2022-03-23 18:16:18', NULL, '2022-03-23 18:16:18', NULL, '2022-03-23 18:16:18');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (516, 2, '127.0.0.1', '0', '登录成功', '2022-03-23 18:16:22', NULL, '2022-03-23 18:16:22', NULL, '2022-03-23 18:16:22');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (517, 2, '127.0.0.1', '0', '退出成功', '2022-03-23 18:17:02', NULL, '2022-03-23 18:17:02', NULL, '2022-03-23 18:17:02');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (518, 1, '127.0.0.1', '0', '登录成功', '2022-03-23 18:17:06', NULL, '2022-03-23 18:17:06', NULL, '2022-03-23 18:17:06');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (519, 1, '127.0.0.1', '0', '登录成功', '2022-03-23 20:50:51', NULL, '2022-03-23 20:50:51', NULL, '2022-03-23 20:50:51');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (520, 1, '127.0.0.1', '0', '退出成功', '2022-03-23 20:51:19', NULL, '2022-03-23 20:51:19', NULL, '2022-03-23 20:51:19');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (521, 107, '127.0.0.1', '0', '登录成功', '2022-03-23 20:51:27', NULL, '2022-03-23 20:51:27', NULL, '2022-03-23 20:51:27');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (522, 107, '127.0.0.1', '0', '退出成功', '2022-03-23 20:52:11', NULL, '2022-03-23 20:52:11', NULL, '2022-03-23 20:52:11');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (523, 1, '127.0.0.1', '0', '登录成功', '2022-03-23 20:52:14', NULL, '2022-03-23 20:52:14', NULL, '2022-03-23 20:52:14');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (524, 1, '127.0.0.1', '0', '退出成功', '2022-03-23 20:52:20', NULL, '2022-03-23 20:52:20', NULL, '2022-03-23 20:52:20');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (525, 1, '127.0.0.1', '0', '登录成功', '2022-03-23 20:52:24', NULL, '2022-03-23 20:52:24', NULL, '2022-03-23 20:52:24');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (526, 1, '127.0.0.1', '0', '退出成功', '2022-03-23 20:52:30', NULL, '2022-03-23 20:52:30', NULL, '2022-03-23 20:52:30');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (527, 107, '127.0.0.1', '0', '登录成功', '2022-03-23 20:52:38', NULL, '2022-03-23 20:52:38', NULL, '2022-03-23 20:52:38');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (528, 107, '127.0.0.1', '0', '退出成功', '2022-03-23 20:54:46', NULL, '2022-03-23 20:54:46', NULL, '2022-03-23 20:54:46');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (529, 107, '127.0.0.1', '0', '登录成功', '2022-03-23 20:54:55', NULL, '2022-03-23 20:54:55', NULL, '2022-03-23 20:54:55');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (530, 107, '127.0.0.1', '0', '退出成功', '2022-03-23 20:56:56', NULL, '2022-03-23 20:56:56', NULL, '2022-03-23 20:56:56');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (531, 1, '127.0.0.1', '0', '登录成功', '2022-03-23 20:56:59', NULL, '2022-03-23 20:56:59', NULL, '2022-03-23 20:56:59');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (532, 1, '127.0.0.1', '0', '退出成功', '2022-03-23 21:28:19', NULL, '2022-03-23 21:28:19', NULL, '2022-03-23 21:28:19');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (533, 1, '127.0.0.1', '0', '登录成功', '2022-03-23 21:29:22', NULL, '2022-03-23 21:29:22', NULL, '2022-03-23 21:29:22');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (534, 1, '127.0.0.1', '0', '退出成功', '2022-03-23 21:53:19', NULL, '2022-03-23 21:53:19', NULL, '2022-03-23 21:53:19');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (535, 1, '127.0.0.1', '0', '登录成功', '2022-03-23 21:54:39', NULL, '2022-03-23 21:54:39', NULL, '2022-03-23 21:54:39');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (536, 1, '127.0.0.1', '0', '退出成功', '2022-03-23 23:16:32', NULL, '2022-03-23 23:16:32', NULL, '2022-03-23 23:16:32');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (537, 2, '127.0.0.1', '0', '登录成功', '2022-03-23 23:16:39', NULL, '2022-03-23 23:16:39', NULL, '2022-03-23 23:16:39');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (538, 2, '127.0.0.1', '0', '退出成功', '2022-03-23 23:39:15', NULL, '2022-03-23 23:39:15', NULL, '2022-03-23 23:39:15');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (539, 2, '127.0.0.1', '1', '用户不存在/密码错误', '2022-03-23 23:39:21', NULL, '2022-03-23 23:39:21', NULL, '2022-03-23 23:39:21');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (540, 2, '127.0.0.1', '0', '登录成功', '2022-03-23 23:39:24', NULL, '2022-03-23 23:39:24', NULL, '2022-03-23 23:39:24');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (541, 2, '127.0.0.1', '0', '退出成功', '2022-03-23 23:46:03', NULL, '2022-03-23 23:46:03', NULL, '2022-03-23 23:46:03');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (542, 1, '127.0.0.1', '0', '登录成功', '2022-03-23 23:46:05', NULL, '2022-03-23 23:46:05', NULL, '2022-03-23 23:46:05');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (543, 2, '127.0.0.1', '0', '登录成功', '2022-03-23 23:47:05', NULL, '2022-03-23 23:47:05', NULL, '2022-03-23 23:47:05');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (544, 1, '127.0.0.1', '0', '退出成功', '2022-03-23 23:52:52', NULL, '2022-03-23 23:52:52', NULL, '2022-03-23 23:52:52');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (545, 1, '127.0.0.1', '0', '登录成功', '2022-03-23 23:52:55', NULL, '2022-03-23 23:52:55', NULL, '2022-03-23 23:52:55');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (546, 1, '127.0.0.1', '0', '退出成功', '2022-03-23 23:53:00', NULL, '2022-03-23 23:53:00', NULL, '2022-03-23 23:53:00');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (547, 104, '127.0.0.1', '0', '登录成功', '2022-03-23 23:53:13', NULL, '2022-03-23 23:53:13', NULL, '2022-03-23 23:53:13');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (548, 104, '127.0.0.1', '0', '退出成功', '2022-03-23 23:53:26', NULL, '2022-03-23 23:53:26', NULL, '2022-03-23 23:53:26');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (549, 1, '127.0.0.1', '0', '登录成功', '2022-03-23 23:53:29', NULL, '2022-03-23 23:53:29', NULL, '2022-03-23 23:53:29');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (550, 2, '127.0.0.1', '0', '退出成功', '2022-03-23 23:55:21', NULL, '2022-03-23 23:55:21', NULL, '2022-03-23 23:55:21');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (551, 2, '127.0.0.1', '0', '登录成功', '2022-03-23 23:55:28', NULL, '2022-03-23 23:55:28', NULL, '2022-03-23 23:55:28');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (552, 1, '127.0.0.1', '0', '登录成功', '2022-03-24 14:22:17', NULL, '2022-03-24 14:22:17', NULL, '2022-03-24 14:22:17');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (553, 1, '127.0.0.1', '0', '退出成功', '2022-03-24 14:23:09', NULL, '2022-03-24 14:23:09', NULL, '2022-03-24 14:23:09');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (554, 2, '127.0.0.1', '0', '登录成功', '2022-03-24 14:23:14', NULL, '2022-03-24 14:23:14', NULL, '2022-03-24 14:23:14');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (555, 2, '127.0.0.1', '0', '退出成功', '2022-03-24 17:04:06', NULL, '2022-03-24 17:04:06', NULL, '2022-03-24 17:04:06');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (556, 2, '127.0.0.1', '0', '登录成功', '2022-03-24 17:04:08', NULL, '2022-03-24 17:04:08', NULL, '2022-03-24 17:04:08');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (557, 2, '127.0.0.1', '0', '退出成功', '2022-03-24 17:38:32', NULL, '2022-03-24 17:38:32', NULL, '2022-03-24 17:38:32');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (558, 2, '127.0.0.1', '0', '登录成功', '2022-03-24 17:38:35', NULL, '2022-03-24 17:38:35', NULL, '2022-03-24 17:38:35');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (559, 1, '127.0.0.1', '0', '登录成功', '2022-03-24 22:39:50', NULL, '2022-03-24 22:39:50', NULL, '2022-03-24 22:39:50');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (560, 1, '127.0.0.1', '0', '退出成功', '2022-03-24 22:40:06', NULL, '2022-03-24 22:40:06', NULL, '2022-03-24 22:40:06');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (561, 2, '127.0.0.1', '0', '登录成功', '2022-03-24 22:40:12', NULL, '2022-03-24 22:40:12', NULL, '2022-03-24 22:40:12');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (562, 2, '127.0.0.1', '0', '退出成功', '2022-03-24 23:07:21', NULL, '2022-03-24 23:07:21', NULL, '2022-03-24 23:07:21');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (563, 1, '127.0.0.1', '0', '登录成功', '2022-03-24 23:07:25', NULL, '2022-03-24 23:07:25', NULL, '2022-03-24 23:07:25');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (564, 1, '127.0.0.1', '0', '退出成功', '2022-03-24 23:07:36', NULL, '2022-03-24 23:07:36', NULL, '2022-03-24 23:07:36');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (565, 104, '127.0.0.1', '0', '登录成功', '2022-03-24 23:07:40', NULL, '2022-03-24 23:07:40', NULL, '2022-03-24 23:07:40');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (566, 104, '127.0.0.1', '0', '退出成功', '2022-03-24 23:18:22', NULL, '2022-03-24 23:18:22', NULL, '2022-03-24 23:18:22');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (567, 1, '127.0.0.1', '0', '登录成功', '2022-03-24 23:18:25', NULL, '2022-03-24 23:18:25', NULL, '2022-03-24 23:18:25');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (568, 1, '127.0.0.1', '0', '退出成功', '2022-03-24 23:20:28', NULL, '2022-03-24 23:20:28', NULL, '2022-03-24 23:20:28');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (569, 2, '127.0.0.1', '0', '登录成功', '2022-03-24 23:20:34', NULL, '2022-03-24 23:20:34', NULL, '2022-03-24 23:20:34');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (570, 2, '127.0.0.1', '0', '退出成功', '2022-03-24 23:20:53', NULL, '2022-03-24 23:20:53', NULL, '2022-03-24 23:20:53');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (571, 2, '127.0.0.1', '0', '登录成功', '2022-03-24 23:21:00', NULL, '2022-03-24 23:21:00', NULL, '2022-03-24 23:21:00');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (572, 1, '127.0.0.1', '0', '登录成功', '2022-03-25 10:52:12', NULL, '2022-03-25 10:52:12', NULL, '2022-03-25 10:52:12');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (573, 1, '127.0.0.1', '0', '登录成功', '2022-03-25 10:52:13', NULL, '2022-03-25 10:52:13', NULL, '2022-03-25 10:52:13');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (574, 1, '127.0.0.1', '0', '退出成功', '2022-03-25 10:52:30', NULL, '2022-03-25 10:52:30', NULL, '2022-03-25 10:52:30');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (575, 2, '127.0.0.1', '0', '登录成功', '2022-03-25 10:52:39', NULL, '2022-03-25 10:52:39', NULL, '2022-03-25 10:52:39');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (576, 2, '127.0.0.1', '0', '退出成功', '2022-03-25 10:58:39', NULL, '2022-03-25 10:58:39', NULL, '2022-03-25 10:58:39');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (577, 1, '127.0.0.1', '0', '登录成功', '2022-03-25 10:58:42', NULL, '2022-03-25 10:58:42', NULL, '2022-03-25 10:58:42');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (578, 1, '127.0.0.1', '0', '退出成功', '2022-03-25 10:58:51', NULL, '2022-03-25 10:58:51', NULL, '2022-03-25 10:58:51');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (579, 2, '127.0.0.1', '0', '登录成功', '2022-03-25 10:58:56', NULL, '2022-03-25 10:58:56', NULL, '2022-03-25 10:58:56');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (580, 1, '127.0.0.1', '0', '登录成功', '2022-03-25 16:47:50', '1', '2022-03-25 16:47:50', '1', '2022-03-25 16:47:50');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (581, 1, '127.0.0.1', '0', '退出成功', '2022-03-25 16:49:35', '1', '2022-03-25 16:49:35', '1', '2022-03-25 16:49:35');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (582, 105, '127.0.0.1', '0', '登录成功', '2022-03-25 16:49:38', '105', '2022-03-25 16:49:38', '105', '2022-03-25 16:49:38');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (583, 105, '127.0.0.1', '0', '登录成功', '2022-03-25 16:56:09', '105', '2022-03-25 16:56:09', '105', '2022-03-25 16:56:09');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (584, 105, '127.0.0.1', '0', '退出成功', '2022-03-25 16:56:33', '105', '2022-03-25 16:56:33', '105', '2022-03-25 16:56:33');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (585, 1, '127.0.0.1', '0', '登录成功', '2022-03-25 16:56:36', '1', '2022-03-25 16:56:36', '1', '2022-03-25 16:56:36');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (586, 1, '127.0.0.1', '0', '退出成功', '2022-03-25 16:57:34', '1', '2022-03-25 16:57:34', '1', '2022-03-25 16:57:34');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (587, 105, '127.0.0.1', '0', '登录成功', '2022-03-25 16:57:40', '105', '2022-03-25 16:57:40', '105', '2022-03-25 16:57:40');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (588, 105, '127.0.0.1', '0', '退出成功', '2022-03-25 16:59:30', '105', '2022-03-25 16:59:30', '105', '2022-03-25 16:59:30');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (589, 105, '127.0.0.1', '0', '登录成功', '2022-03-25 16:59:35', '105', '2022-03-25 16:59:35', '105', '2022-03-25 16:59:35');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (590, 105, '127.0.0.1', '0', '退出成功', '2022-03-25 16:59:44', '105', '2022-03-25 16:59:44', '105', '2022-03-25 16:59:44');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (591, 1, '127.0.0.1', '0', '登录成功', '2022-03-25 16:59:46', '1', '2022-03-25 16:59:46', '1', '2022-03-25 16:59:46');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (592, 1, '127.0.0.1', '0', '退出成功', '2022-03-25 16:59:55', '1', '2022-03-25 16:59:55', '1', '2022-03-25 16:59:55');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (593, 105, '127.0.0.1', '0', '登录成功', '2022-03-25 17:00:01', '105', '2022-03-25 17:00:01', '105', '2022-03-25 17:00:01');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (594, 105, '127.0.0.1', '0', '退出成功', '2022-03-25 17:02:23', '105', '2022-03-25 17:02:23', '105', '2022-03-25 17:02:23');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (595, 1, '127.0.0.1', '0', '登录成功', '2022-03-25 17:02:31', '1', '2022-03-25 17:02:31', '1', '2022-03-25 17:02:31');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (596, 1, '127.0.0.1', '0', '退出成功', '2022-03-25 17:02:43', '1', '2022-03-25 17:02:43', '1', '2022-03-25 17:02:43');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (597, 2, '127.0.0.1', '0', '登录成功', '2022-03-25 17:02:48', '2', '2022-03-25 17:02:48', '2', '2022-03-25 17:02:48');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (598, 2, '127.0.0.1', '0', '退出成功', '2022-03-25 17:03:02', '2', '2022-03-25 17:03:02', '2', '2022-03-25 17:03:02');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (599, 1, '127.0.0.1', '0', '登录成功', '2022-03-25 17:03:04', '1', '2022-03-25 17:03:04', '1', '2022-03-25 17:03:04');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (600, 1, '127.0.0.1', '0', '退出成功', '2022-03-25 17:04:23', '1', '2022-03-25 17:04:23', '1', '2022-03-25 17:04:23');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (601, 105, '127.0.0.1', '0', '登录成功', '2022-03-25 17:04:29', '105', '2022-03-25 17:04:29', '105', '2022-03-25 17:04:29');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (602, 105, '127.0.0.1', '0', '退出成功', '2022-03-25 17:04:37', '105', '2022-03-25 17:04:37', '105', '2022-03-25 17:04:37');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (603, 1, '127.0.0.1', '0', '登录成功', '2022-03-25 17:04:40', '1', '2022-03-25 17:04:40', '1', '2022-03-25 17:04:40');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (604, 105, '127.0.0.1', '0', '登录成功', '2022-03-25 17:04:58', '105', '2022-03-25 17:04:58', '105', '2022-03-25 17:04:58');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (605, 1, '127.0.0.1', '0', '退出成功', '2022-03-25 17:05:42', '1', '2022-03-25 17:05:42', '1', '2022-03-25 17:05:42');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (606, 1, '127.0.0.1', '0', '登录成功', '2022-03-25 17:05:45', '1', '2022-03-25 17:05:45', '1', '2022-03-25 17:05:45');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (607, 105, '127.0.0.1', '0', '退出成功', '2022-03-25 17:19:23', '105', '2022-03-25 17:19:23', '105', '2022-03-25 17:19:23');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (608, 108, '127.0.0.1', '0', '登录成功', '2022-03-25 17:19:25', '108', '2022-03-25 17:19:25', '108', '2022-03-25 17:19:25');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (609, 108, '127.0.0.1', '0', '退出成功', '2022-03-25 17:19:58', '108', '2022-03-25 17:19:58', '108', '2022-03-25 17:19:58');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (610, 109, '127.0.0.1', '0', '登录成功', '2022-03-25 17:20:01', '109', '2022-03-25 17:20:01', '109', '2022-03-25 17:20:01');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (611, 109, '127.0.0.1', '0', '退出成功', '2022-03-25 17:20:14', '109', '2022-03-25 17:20:14', '109', '2022-03-25 17:20:14');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (612, 110, '127.0.0.1', '0', '登录成功', '2022-03-25 17:20:17', '110', '2022-03-25 17:20:17', '110', '2022-03-25 17:20:17');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (613, 110, '127.0.0.1', '0', '退出成功', '2022-03-25 17:20:27', '110', '2022-03-25 17:20:27', '110', '2022-03-25 17:20:27');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (614, 109, '127.0.0.1', '0', '登录成功', '2022-03-25 17:20:30', '109', '2022-03-25 17:20:30', '109', '2022-03-25 17:20:30');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (615, 109, '127.0.0.1', '0', '退出成功', '2022-03-25 17:20:50', '109', '2022-03-25 17:20:50', '109', '2022-03-25 17:20:50');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (616, 110, '127.0.0.1', '0', '登录成功', '2022-03-25 17:21:02', '110', '2022-03-25 17:21:02', '110', '2022-03-25 17:21:02');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (617, 110, '127.0.0.1', '0', '退出成功', '2022-03-25 17:21:08', '110', '2022-03-25 17:21:08', '110', '2022-03-25 17:21:08');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (618, 109, '127.0.0.1', '0', '登录成功', '2022-03-25 17:21:13', '109', '2022-03-25 17:21:13', '109', '2022-03-25 17:21:13');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (619, 109, '127.0.0.1', '0', '登录成功', '2022-03-25 17:23:28', '109', '2022-03-25 17:23:28', '109', '2022-03-25 17:23:28');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (620, 109, '127.0.0.1', '0', '退出成功', '2022-03-25 17:23:48', '109', '2022-03-25 17:23:48', '109', '2022-03-25 17:23:48');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (621, 109, '127.0.0.1', '0', '登录成功', '2022-03-25 17:23:55', '109', '2022-03-25 17:23:55', '109', '2022-03-25 17:23:55');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (622, 109, '127.0.0.1', '0', '退出成功', '2022-03-25 17:24:14', '109', '2022-03-25 17:24:14', '109', '2022-03-25 17:24:14');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (623, 109, '127.0.0.1', '0', '登录成功', '2022-03-25 17:24:19', '109', '2022-03-25 17:24:19', '109', '2022-03-25 17:24:19');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (624, 109, '127.0.0.1', '0', '退出成功', '2022-03-25 17:24:37', '109', '2022-03-25 17:24:37', '109', '2022-03-25 17:24:37');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (625, 109, '127.0.0.1', '0', '登录成功', '2022-03-25 17:24:43', '109', '2022-03-25 17:24:43', '109', '2022-03-25 17:24:43');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (626, 109, '127.0.0.1', '0', '退出成功', '2022-03-25 17:24:48', '109', '2022-03-25 17:24:48', '109', '2022-03-25 17:24:48');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (627, 109, '127.0.0.1', '0', '登录成功', '2022-03-25 17:24:52', '109', '2022-03-25 17:24:52', '109', '2022-03-25 17:24:52');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (628, 109, '127.0.0.1', '0', '退出成功', '2022-03-25 17:24:56', '109', '2022-03-25 17:24:56', '109', '2022-03-25 17:24:56');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (629, 109, '127.0.0.1', '0', '登录成功', '2022-03-25 17:25:02', '109', '2022-03-25 17:25:02', '109', '2022-03-25 17:25:02');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (630, 109, '127.0.0.1', '0', '退出成功', '2022-03-25 17:25:48', '109', '2022-03-25 17:25:48', '109', '2022-03-25 17:25:48');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (631, 109, '127.0.0.1', '0', '登录成功', '2022-03-25 17:26:33', '109', '2022-03-25 17:26:33', '109', '2022-03-25 17:26:33');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (632, 109, '127.0.0.1', '0', '登录成功', '2022-03-25 17:26:39', '109', '2022-03-25 17:26:39', '109', '2022-03-25 17:26:39');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (633, 2, '127.0.0.1', '0', '登录成功', '2022-04-01 15:29:32', '2', '2022-04-01 15:29:32', '2', '2022-04-01 15:29:32');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (634, 2, '127.0.0.1', '0', '登录成功', '2022-04-01 15:30:15', '2', '2022-04-01 15:30:15', '2', '2022-04-01 15:30:15');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (635, 2, '127.0.0.1', '0', '登录成功', '2022-04-01 15:55:20', '2', '2022-04-01 15:55:20', '2', '2022-04-01 15:55:20');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (636, 2, '127.0.0.1', '0', '登录成功', '2022-04-01 16:38:43', '2', '2022-04-01 16:38:43', '2', '2022-04-01 16:38:43');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (637, 2, '127.0.0.1', '0', '登录成功', '2022-04-02 23:37:54', '2', '2022-04-02 23:37:55', '2', '2022-04-02 23:37:55');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (638, 2, '127.0.0.1', '0', '退出成功', '2022-04-02 23:38:11', '2', '2022-04-02 23:38:11', '2', '2022-04-02 23:38:11');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (639, 1, '127.0.0.1', '0', '登录成功', '2022-04-02 23:38:15', '1', '2022-04-02 23:38:15', '1', '2022-04-02 23:38:15');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (640, 1, '127.0.0.1', '0', '退出成功', '2022-04-02 23:38:24', '1', '2022-04-02 23:38:24', '1', '2022-04-02 23:38:24');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (641, 107, '127.0.0.1', '0', '登录成功', '2022-04-02 23:38:28', '107', '2022-04-02 23:38:28', '107', '2022-04-02 23:38:28');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (642, 107, '127.0.0.1', '0', '退出成功', '2022-04-02 23:38:38', '107', '2022-04-02 23:38:38', '107', '2022-04-02 23:38:38');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (643, 108, '127.0.0.1', '0', '登录成功', '2022-04-02 23:38:42', '108', '2022-04-02 23:38:42', '108', '2022-04-02 23:38:42');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (644, 108, '127.0.0.1', '0', '退出成功', '2022-04-02 23:40:12', '108', '2022-04-02 23:40:12', '108', '2022-04-02 23:40:12');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (645, 109, '127.0.0.1', '0', '登录成功', '2022-04-02 23:40:18', '109', '2022-04-02 23:40:18', '109', '2022-04-02 23:40:18');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (646, 109, '127.0.0.1', '0', '退出成功', '2022-04-02 23:40:31', '109', '2022-04-02 23:40:31', '109', '2022-04-02 23:40:31');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (647, 110, '127.0.0.1', '0', '登录成功', '2022-04-02 23:40:35', '110', '2022-04-02 23:40:35', '110', '2022-04-02 23:40:35');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (648, 110, '127.0.0.1', '0', '退出成功', '2022-04-02 23:40:46', '110', '2022-04-02 23:40:46', '110', '2022-04-02 23:40:46');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (649, 104, '127.0.0.1', '0', '登录成功', '2022-04-02 23:40:53', '104', '2022-04-02 23:40:53', '104', '2022-04-02 23:40:53');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (650, 104, '127.0.0.1', '0', '退出成功', '2022-04-02 23:41:13', '104', '2022-04-02 23:41:13', '104', '2022-04-02 23:41:13');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (651, 1, '127.0.0.1', '0', '登录成功', '2022-04-02 23:41:17', '1', '2022-04-02 23:41:17', '1', '2022-04-02 23:41:17');
INSERT INTO `sys_login_log` (`info_id`, `user_id`, `ipaddr`, `status`, `msg`, `access_time`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (652, 2, '127.0.0.1', '0', '登录成功', '2022-04-13 10:20:10', '2', '2022-04-13 10:20:10', '2', '2022-04-13 10:20:10');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮 J接口）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '菜单图标',
  `create_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
  `deleted` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1, '系统管理', 0, 1, 'system', '', '', 1, 0, 'M', '0', '0', '', 'system', '1', '2022-01-27 09:35:50', '1', NULL, '系统管理目录', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (2, '系统监控', 0, 2, 'monitor', '', '', 1, 0, 'M', '0', '0', '', 'monitor', '1', '2022-01-27 09:35:50', '1', NULL, '系统监控目录', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (3, '系统工具', 0, 3, 'zhc-business-service/test', '', '', 1, 0, 'M', '0', '0', '', 'tool', '1', '2022-01-27 09:35:50', '1', NULL, '系统工具目录', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (4, '菜单列表', 0, 4, 'zhc-system-service/menu/getMenus', '', '', 1, 0, 'J', '0', '0', '', 'guide', '1', '2022-01-27 09:35:50', '1', NULL, '菜单列表', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (6, '退出', 0, 0, 'zhc-system-service/user/logOut', '', NULL, 1, 0, 'J', '0', '0', NULL, '#', '', NULL, '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (7, '获取用户信息', 0, 0, 'zhc-system-service/user/getInfo', '', NULL, 1, 0, 'J', '0', '0', NULL, '#', '', NULL, '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (8, '获取菜单', 0, 0, 'zhc-system-service/menu/getMenus', '', NULL, 0, 0, 'J', '0', '0', NULL, '#', '', NULL, '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (9, '根据字典类型查询字典数据信息', 0, 0, 'zhc-system-service/dictData/type/*', '', NULL, 0, 0, 'J', '0', '0', NULL, '#', '', NULL, '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (10, '理获取部门下拉树列表', 0, 0, 'zhc-system-service/dept/treeselect', '', NULL, 0, 0, 'J', '0', '0', NULL, '#', '', NULL, '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (11, '用户管理修改页面信息', 0, 0, 'zhc-system-service/user/', '', NULL, 0, 0, 'J', '0', '0', NULL, '#', '', NULL, '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (12, '用户管理添加页面信息', 0, 0, 'zhc-system-service/user/*', '', NULL, 0, 0, 'J', '0', '0', NULL, '#', '', NULL, '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (100, '用户管理', 1, 1, 'zhc-system-service/user/list', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', '1', '2022-01-27 09:35:50', '1', NULL, '用户管理菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', '1', '2022-01-27 09:35:50', '1', NULL, '角色管理菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', '1', '2022-01-27 09:35:50', '1', NULL, '菜单管理菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', '1', '2022-01-27 09:35:50', '1', NULL, '部门管理菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', '1', '2022-01-27 09:35:50', '1', NULL, '岗位管理菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', '1', '2022-01-27 09:35:50', '1', NULL, '字典管理菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', '1', '2022-01-27 09:35:50', '1', NULL, '参数设置菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', '1', '2022-01-27 09:35:50', '1', NULL, '通知公告菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', '1', '2022-01-27 09:35:50', '1', NULL, '日志管理菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', '1', '2022-01-27 09:35:50', '1', NULL, '在线用户菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', '1', '2022-01-27 09:35:51', '1', NULL, '定时任务菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (111, 'Sentinel控制台', 2, 3, 'http://localhost:8718', '', '', 0, 0, 'C', '0', '0', 'monitor:sentinel:list', 'sentinel', '1', '2022-01-27 09:35:51', '1', NULL, '流量控制菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (112, 'Nacos控制台', 2, 4, 'http://localhost:8848/nacos', '', '', 0, 0, 'C', '0', '0', 'monitor:nacos:list', 'nacos', '1', '2022-01-27 09:35:51', '1', NULL, '服务治理菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (113, 'Admin控制台', 2, 5, 'http://localhost:9100/login', '', '', 0, 0, 'C', '0', '0', 'monitor:server:list', 'server', '1', '2022-01-27 09:35:51', '1', NULL, '服务监控菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', '1', '2022-01-27 09:35:51', '1', NULL, '表单构建菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', '1', '2022-01-27 09:35:51', '1', NULL, '代码生成菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (116, '系统接口', 3, 3, 'http://localhost:8080/swagger-ui/index.html', '', '', 0, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', '1', '2022-01-27 09:35:51', '1', NULL, '系统接口菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', '1', '2022-01-27 09:35:51', '1', NULL, '操作日志菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', '1', '2022-01-27 09:35:51', '1', NULL, '登录日志菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1002, '用户新增', 100, 2, 'zhc-system-service/user/insertOrEdit', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1004, '用户删除', 100, 4, 'zhc-system-service/user/*', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1005, '用户导出', 100, 5, 'zhc-system-service/user/export', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', '1', '2022-01-27 09:35:51', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1054, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', '1', '2022-01-27 09:35:52', '1', NULL, '', '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `deleted` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `deleted` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (1, 'ceo', '董事长', 1, '0', '1', '2022-01-27 09:35:50', '1', '2022-01-27 09:35:50', '', '0');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`, `deleted`) VALUES (2, '测试', '测试', 2, '0', '1', '2022-01-27 09:35:50', '1', '2022-01-27 09:35:50', '', '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `deleted` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`) VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', '1', '2022-01-27 09:35:50', '1', '2022-01-27 09:35:50', '超级管理员');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`) VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', '1', '2022-01-27 09:35:50', '1', '2022-01-27 09:35:50', '普通角色');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`) VALUES (3, '部门权限', 'bumen', 3, '3', 1, 1, '0', '0', '1', NULL, '1', NULL, '部门权限');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`) VALUES (4, '部门及以下数据权限', 'bumenxia', 4, '4', 1, 1, '0', '0', '1', NULL, '1', NULL, '部门及以下数据权限');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `deleted`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`) VALUES (5, '本人数据', 'benren', 5, '5', 1, 1, '0', '0', '1', NULL, '1', NULL, '本人数据');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  `create_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1, '', NULL, '', NULL);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 101, '', NULL, '', NULL);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 102, '', NULL, '', NULL);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 10101, '', NULL, '', NULL);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 10102, '', NULL, '', NULL);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 10201, '', NULL, '', NULL);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 10202, '', NULL, '', NULL);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 101, '', NULL, '', NULL);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 102, '', NULL, '', NULL);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 10101, '', NULL, '', NULL);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 10102, '', NULL, '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `create_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 3, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 4, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 5, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 6, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 7, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 8, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 9, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 10, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 11, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 12, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 100, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 101, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 102, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 103, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 104, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 105, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 106, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 107, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 108, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 109, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 110, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 111, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 112, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 113, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 114, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 115, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 116, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 500, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 501, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1001, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1002, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1003, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1004, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1005, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1006, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1007, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1008, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1009, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1010, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1011, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1012, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1013, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1014, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1015, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1016, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1017, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1018, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1019, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1020, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1021, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1022, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1023, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1024, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1025, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1026, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1027, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1028, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1029, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1030, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1031, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1032, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1033, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1034, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1035, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1036, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1037, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1038, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1039, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1040, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1041, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1042, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1043, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1044, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1045, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1046, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1047, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1048, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1049, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1050, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1051, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1052, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1053, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1054, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1055, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1056, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1057, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1058, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1059, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1060, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 1, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 2, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 3, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 4, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 5, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 6, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 7, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 8, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 9, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 10, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 100, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 1001, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 1002, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 1003, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 1004, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 1005, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (3, 1, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (3, 2, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (3, 3, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (3, 4, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (3, 5, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (3, 6, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (3, 7, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (3, 8, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (3, 9, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (3, 10, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (3, 100, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (4, 1, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (4, 2, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (4, 3, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (4, 4, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (4, 5, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (4, 6, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (4, 7, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (4, 8, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (4, 9, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (4, 10, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (4, 100, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (5, 1, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (5, 2, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (5, 3, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (5, 4, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (5, 5, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (5, 6, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (5, 7, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (5, 8, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (5, 9, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (5, 10, '', NULL, '', NULL);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (5, 100, '', NULL, '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户邮箱',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `deleted` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phone`, `sex`, `avatar`, `password`, `status`, `deleted`, `login_ip`, `login_date`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`) VALUES (1, 1, 'admin', 'admin', '00', '17521746738@163.com', '17521746738', '1', '', '$2a$10$whcwJs/JkAXA8hCcpBQfx.fjdCNwsgAtx0Y88//VJbMj.TjWR8iX6', '0', '0', '127.0.0.1', '2022-01-27 09:35:50', '1', '2022-01-27 09:35:50', '1', '2022-01-28 11:07:52', '管理员');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phone`, `sex`, `avatar`, `password`, `status`, `deleted`, `login_ip`, `login_date`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`) VALUES (2, 10101, 'zhc', 'zhc', '00', '17521746737@163.com', '17521746737', '1', '', '$2a$10$4GPv4LhZ2rILZLXU7aubE.N47z2.ER6h9pBgDJfG7Ah0eIGTt74qu', '0', '0', '127.0.0.1', '2022-01-27 09:35:50', '1', '2022-01-27 09:35:50', '1', '2022-01-28 11:07:52', '管理员');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phone`, `sex`, `avatar`, `password`, `status`, `deleted`, `login_ip`, `login_date`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`) VALUES (104, 101, 'zhc1', 'zhc1', '00', '17150133331@163.com', '17150133331', '1', '', '$2a$10$MkV.Eo9ssgK5dENaS8zuLOBcePgrPYXK.gYE0Bw8Ex9qZWJee9aJG', '0', '0', '', NULL, NULL, '2022-03-21 23:42:13', '1', '2022-03-21 23:42:13', 'zhc1');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phone`, `sex`, `avatar`, `password`, `status`, `deleted`, `login_ip`, `login_date`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`) VALUES (105, 102, 'test1', 'test1', '00', '17112311234@163.com', '17112311234', '0', '', '$2a$10$.aQFx5rnSCqUcd5Y9cd0p.1Dyn.TJkQxB2yfukftY97IA5IZ9fNOa', '0', '1', '', NULL, NULL, '2022-03-22 20:50:37', '2', '2022-03-22 20:50:37', 'test1');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phone`, `sex`, `avatar`, `password`, `status`, `deleted`, `login_ip`, `login_date`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`) VALUES (106, 1, 'test1', 'test1', '00', '17112311231@163.com', '17112311231', '0', '', '$2a$10$Sx33lbbTBjgnzdvLRbOKvu2WyoklyGudNupTvtYMrFrhLigODHzcu', '0', '1', '', NULL, NULL, '2022-03-22 21:01:49', NULL, '2022-03-22 21:01:49', 'test1');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phone`, `sex`, `avatar`, `password`, `status`, `deleted`, `login_ip`, `login_date`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`) VALUES (107, 10201, 'zhc2', 'zhc2', '00', '17150133332@163.com', '17150133332', '0', '', '$2a$10$nN50VcqTkhi2f1GswJlbXun46UAcyzu4xzFfXVV7PvRvhMzhKgS3K', '0', '0', '', NULL, NULL, '2022-03-23 18:08:08', '1', '2022-03-23 18:08:08', 'zhc2');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phone`, `sex`, `avatar`, `password`, `status`, `deleted`, `login_ip`, `login_date`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`) VALUES (108, 102, 'zhc3', 'zhc3', '00', '17150133333@163.com', '17150133333', '0', '', '$2a$10$RCgRaNm01oMcnPnLJ1OH0uXiWm/BzGoNylEeKN5ar/AvS5v1NvJoW', '0', '0', '', NULL, '1', '2022-03-25 17:16:24', '1', '2022-03-25 17:16:24', NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phone`, `sex`, `avatar`, `password`, `status`, `deleted`, `login_ip`, `login_date`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`) VALUES (109, 102, 'zhc4', 'zhc4', '00', '17150133334@163.com', '17150133334', '0', '', '$2a$10$b4fzo3./rIxUi.zoDtkYuOO4Xwee/Hj7UTnUH/alS5WHP12bAqYpe', '0', '0', '', NULL, '1', '2022-03-25 17:17:30', '1', '2022-03-25 17:17:30', NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phone`, `sex`, `avatar`, `password`, `status`, `deleted`, `login_ip`, `login_date`, `create_id`, `create_time`, `update_id`, `update_time`, `remark`) VALUES (110, 10201, 'zhc5', 'zhc5', '00', '17150133335@163.com', '17150133335', '0', '', '$2a$10$NRmwGkah4g9r96Uc.q14puFpxLDfSQ5bDcX1ZWEt5TVPlhfCooOOO', '0', '0', '', NULL, '1', '2022-03-25 17:18:06', '1', '2022-03-25 17:18:06', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  `create_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` (`user_id`, `post_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1, '', NULL, '', NULL);
INSERT INTO `sys_user_post` (`user_id`, `post_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 1, NULL, '2022-03-24 23:20:50', NULL, '2022-03-24 23:20:50');
INSERT INTO `sys_user_post` (`user_id`, `post_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (104, 2, '1', '2022-03-25 17:18:55', '1', '2022-03-25 17:18:55');
INSERT INTO `sys_user_post` (`user_id`, `post_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (107, 1, '1', '2022-03-25 17:19:07', '1', '2022-03-25 17:19:07');
INSERT INTO `sys_user_post` (`user_id`, `post_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (108, 1, '1', '2022-03-25 17:18:45', '1', '2022-03-25 17:18:45');
INSERT INTO `sys_user_post` (`user_id`, `post_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (109, 2, '1', '2022-03-25 17:17:30', '1', '2022-03-25 17:17:30');
INSERT INTO `sys_user_post` (`user_id`, `post_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (110, 2, '1', '2022-03-25 17:18:07', '1', '2022-03-25 17:18:07');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `create_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`user_id`, `role_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (1, 1, '', NULL, '', NULL);
INSERT INTO `sys_user_role` (`user_id`, `role_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (2, 2, NULL, '2022-03-24 23:20:50', NULL, '2022-03-24 23:20:50');
INSERT INTO `sys_user_role` (`user_id`, `role_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (104, 2, '1', '2022-03-25 17:18:55', '1', '2022-03-25 17:18:55');
INSERT INTO `sys_user_role` (`user_id`, `role_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (107, 2, '1', '2022-03-25 17:19:07', '1', '2022-03-25 17:19:07');
INSERT INTO `sys_user_role` (`user_id`, `role_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (108, 3, '1', '2022-03-25 17:18:45', '1', '2022-03-25 17:18:45');
INSERT INTO `sys_user_role` (`user_id`, `role_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (109, 4, '1', '2022-03-25 17:17:30', '1', '2022-03-25 17:17:30');
INSERT INTO `sys_user_role` (`user_id`, `role_id`, `create_id`, `create_time`, `update_id`, `update_time`) VALUES (110, 5, '1', '2022-03-25 17:18:07', '1', '2022-03-25 17:18:07');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
