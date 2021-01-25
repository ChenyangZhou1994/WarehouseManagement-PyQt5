/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : warehousemanagement-pyqt5

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 25/01/2021 09:54:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for delivery
-- ----------------------------
DROP TABLE IF EXISTS `delivery`;
CREATE TABLE `delivery`  (
  `p_no` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '零件编号',
  `d_no` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门编号',
  `e_sum` int unsigned NOT NULL COMMENT '出库量',
  PRIMARY KEY (`p_no`, `d_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of delivery
-- ----------------------------
INSERT INTO `delivery` VALUES ('P00001', '1', 456);
INSERT INTO `delivery` VALUES ('P00001', '2', 1);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `d_no` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门编号',
  `d_name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门名称',
  PRIMARY KEY (`d_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '研发部');
INSERT INTO `department` VALUES ('2', '采购部');

-- ----------------------------
-- Table structure for partslist
-- ----------------------------
DROP TABLE IF EXISTS `partslist`;
CREATE TABLE `partslist`  (
  `p_no` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '零件编号',
  `p_name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '零件名称 ',
  `p_model` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规格',
  `p_price` int unsigned NOT NULL COMMENT '价格',
  PRIMARY KEY (`p_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of partslist
-- ----------------------------
INSERT INTO `partslist` VALUES ('P00001', '热线枪', '不详', 2000);
INSERT INTO `partslist` VALUES ('P00002', '助熔扇叶', '不详', 1500);
INSERT INTO `partslist` VALUES ('P00003', '引力弹射器', '不详', 1780);
INSERT INTO `partslist` VALUES ('P00006', '卡隆加压器', '不详', 134);
INSERT INTO `partslist` VALUES ('P00007', '离子推进器', '不详', 123);
INSERT INTO `partslist` VALUES ('P00008', '蜂式传感器', '不详', 12);
INSERT INTO `partslist` VALUES ('P00010', '牵引力增强引擎', '不详', 12);
INSERT INTO `partslist` VALUES ('P00011', '阵列传感器', '不详', 12);
INSERT INTO `partslist` VALUES ('P00012', '阿波罗反应器', '不详', 165);

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock`  (
  `p_no` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '零件编号',
  `w_no` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '仓库编号',
  `s_sum` int unsigned NOT NULL COMMENT '库存量',
  PRIMARY KEY (`p_no`, `w_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('P00001', '1', 1000);
INSERT INTO `stock` VALUES ('P00002', '1', 1000);
INSERT INTO `stock` VALUES ('P00003', '1', 1000);
INSERT INTO `stock` VALUES ('P00006', '1', 1000);
INSERT INTO `stock` VALUES ('P00007', '1', 1000);
INSERT INTO `stock` VALUES ('P00008', '1', 1000);
INSERT INTO `stock` VALUES ('P00011', '1', 1000);
INSERT INTO `stock` VALUES ('P00012', '1', 1000);

-- ----------------------------
-- Table structure for storage
-- ----------------------------
DROP TABLE IF EXISTS `storage`;
CREATE TABLE `storage`  (
  `s_no` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '供应商编号',
  `p_no` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '零件编号',
  `i_sum` int unsigned NOT NULL COMMENT '入库量',
  PRIMARY KEY (`s_no`, `p_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of storage
-- ----------------------------
INSERT INTO `storage` VALUES ('1', 'P00002', 1);
INSERT INTO `storage` VALUES ('1', 'P00006', 189);
INSERT INTO `storage` VALUES ('1', 'P00007', 1);
INSERT INTO `storage` VALUES ('1', 'P00012', 120);
INSERT INTO `storage` VALUES ('2', 'P00001', 12);
INSERT INTO `storage` VALUES ('2', 'P00011', 179);
INSERT INTO `storage` VALUES ('3', 'P00008', 980);
INSERT INTO `storage` VALUES ('4', 'P00010', 123);

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `s_no` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '供应商编号',
  `s_name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '供应商名称',
  PRIMARY KEY (`s_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', '洛克希德·马丁');
INSERT INTO `supplier` VALUES ('2', '雷神');
INSERT INTO `supplier` VALUES ('3', '波音');
INSERT INTO `supplier` VALUES ('4', '通用动力');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `identity` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin', 'admin', '1');
INSERT INTO `user` VALUES ('test', 'test', '0');

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse`  (
  `w_no` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '仓库编号',
  `w_area` bigint unsigned NOT NULL COMMENT '仓库面积',
  PRIMARY KEY (`w_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
