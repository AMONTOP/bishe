/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : consume

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 08/03/2019 16:41:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_info
-- ----------------------------
DROP TABLE IF EXISTS `account_info`;
CREATE TABLE `account_info`  (
  `accountInfoId` int(11) NOT NULL AUTO_INCREMENT,
  `empId` int(11) NULL DEFAULT NULL,
  `infoName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `infoNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `infoDate` datetime NULL DEFAULT NULL,
  `infoBank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `infoAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `accountStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`accountInfoId`) USING BTREE,
  INDEX `FK_brcof2k5ae0l2hrg6its5xjyk`(`empId`) USING BTREE,
  CONSTRAINT `FK_brcof2k5ae0l2hrg6its5xjyk` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account_info
-- ----------------------------
INSERT INTO `account_info` VALUES (1, 1, '杭州金马房地产有限公司', '632083927382928', '2018-11-20 14:55:44', '中国工商银行北碚支行', '重庆市北碚区', NULL, '未审核');
INSERT INTO `account_info` VALUES (2, 2, '重庆螺丝生产厂', '620130452948392', '2018-11-13 14:56:39', '建设银行成都成华支行', '成都市成华区', NULL, '未审核');
INSERT INTO `account_info` VALUES (3, 2, '苏州华硕电子厂', '445286575896541', '2019-02-18 00:00:00', '中国建设银行', '深圳市', NULL, '未审核');

-- ----------------------------
-- Table structure for account_pay
-- ----------------------------
DROP TABLE IF EXISTS `account_pay`;
CREATE TABLE `account_pay`  (
  `payId` int(11) NOT NULL AUTO_INCREMENT,
  `empId` int(11) NULL DEFAULT NULL,
  `proId` int(11) NULL DEFAULT NULL,
  `supplierId` int(11) NULL DEFAULT NULL,
  `accountInfoId` int(11) NULL DEFAULT NULL,
  `payNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payDept` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payDate` datetime NULL DEFAULT NULL,
  `payMoney` decimal(19, 2) NULL DEFAULT NULL,
  `payItem` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`payId`) USING BTREE,
  INDEX `FK_murinparle2k9resmpmn3qixm`(`accountInfoId`) USING BTREE,
  INDEX `FK_o65ii65hqoat9mmyb1on15cs`(`proId`) USING BTREE,
  INDEX `FK_qinucxg4umrcx6bq4dw96itmf`(`supplierId`) USING BTREE,
  INDEX `FK_tid8mki6x3m4gb45ykrxqvu8e`(`empId`) USING BTREE,
  CONSTRAINT `FK_murinparle2k9resmpmn3qixm` FOREIGN KEY (`accountInfoId`) REFERENCES `account_info` (`accountInfoId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_o65ii65hqoat9mmyb1on15cs` FOREIGN KEY (`proId`) REFERENCES `project` (`proId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_qinucxg4umrcx6bq4dw96itmf` FOREIGN KEY (`supplierId`) REFERENCES `supplier` (`supplierId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tid8mki6x3m4gb45ykrxqvu8e` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account_pay
-- ----------------------------
INSERT INTO `account_pay` VALUES (1, 5, 22, 3, 1, 'FK162803', '财务部', '2019-03-08 00:00:00', 1590.00, '劳务付款', NULL, '未提交');

-- ----------------------------
-- Table structure for account_petty
-- ----------------------------
DROP TABLE IF EXISTS `account_petty`;
CREATE TABLE `account_petty`  (
  `accountPettyId` int(11) NOT NULL AUTO_INCREMENT,
  `empId` int(11) NULL DEFAULT NULL,
  `proId` int(11) NULL DEFAULT NULL,
  `pettyNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pettyDept` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pettyMoney` decimal(19, 2) NULL DEFAULT NULL,
  `useDate` datetime NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pettyStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`accountPettyId`) USING BTREE,
  INDEX `FK_32hww6eaelocvo2ku3m5ow5wo`(`proId`) USING BTREE,
  INDEX `FK_kei4xs2eipn2bifrbbj2xgb1k`(`empId`) USING BTREE,
  CONSTRAINT `FK_32hww6eaelocvo2ku3m5ow5wo` FOREIGN KEY (`proId`) REFERENCES `project` (`proId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_kei4xs2eipn2bifrbbj2xgb1k` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account_petty
-- ----------------------------
INSERT INTO `account_petty` VALUES (1, 3, 22, 'BYJ1627473', '财务部', 3200.00, '2019-03-08 00:00:00', NULL, '未提交');

-- ----------------------------
-- Table structure for account_project
-- ----------------------------
DROP TABLE IF EXISTS `account_project`;
CREATE TABLE `account_project`  (
  `accountId` int(11) NOT NULL AUTO_INCREMENT,
  `empId` int(11) NULL DEFAULT NULL,
  `proId` int(11) NULL DEFAULT NULL,
  `accountNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `accountName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adate` datetime NULL DEFAULT NULL,
  `accountMoney` decimal(19, 2) NULL DEFAULT NULL,
  `accountDept` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`accountId`) USING BTREE,
  INDEX `FK_31wipttghw2smw4a95x7ajb37`(`proId`) USING BTREE,
  INDEX `FK_d07ln0x7i58paxi0musv3nmgd`(`empId`) USING BTREE,
  CONSTRAINT `FK_31wipttghw2smw4a95x7ajb37` FOREIGN KEY (`proId`) REFERENCES `project` (`proId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_d07ln0x7i58paxi0musv3nmgd` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account_project
-- ----------------------------
INSERT INTO `account_project` VALUES (1, 1, 22, 'AI1627304', '订单生产', '2019-03-08 00:00:00', 1500.00, '财务部', '未审核');

-- ----------------------------
-- Table structure for account_repay
-- ----------------------------
DROP TABLE IF EXISTS `account_repay`;
CREATE TABLE `account_repay`  (
  `repayId` int(11) NOT NULL AUTO_INCREMENT,
  `empId` int(11) NULL DEFAULT NULL,
  `proId` int(11) NULL DEFAULT NULL,
  `supplierId` int(11) NULL DEFAULT NULL,
  `accountInfoId` int(11) NULL DEFAULT NULL,
  `repayNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `repayDept` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `repayDate` datetime NULL DEFAULT NULL,
  `repayMoney` decimal(19, 2) NULL DEFAULT NULL,
  `repayItem` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `repayStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`repayId`) USING BTREE,
  INDEX `FK_5n2jkvyoevdw6wryijyvje84g`(`proId`) USING BTREE,
  INDEX `FK_8r56clarekhsxx7gl1htm3gfg`(`accountInfoId`) USING BTREE,
  INDEX `FK_d7lkxo8qmrpnv9iu0ybvkqjq0`(`empId`) USING BTREE,
  INDEX `FK_oornxc71s08chk15hgbiqw0or`(`supplierId`) USING BTREE,
  CONSTRAINT `FK_5n2jkvyoevdw6wryijyvje84g` FOREIGN KEY (`proId`) REFERENCES `project` (`proId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_8r56clarekhsxx7gl1htm3gfg` FOREIGN KEY (`accountInfoId`) REFERENCES `account_info` (`accountInfoId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_d7lkxo8qmrpnv9iu0ybvkqjq0` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_oornxc71s08chk15hgbiqw0or` FOREIGN KEY (`supplierId`) REFERENCES `supplier` (`supplierId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account_repay
-- ----------------------------
INSERT INTO `account_repay` VALUES (1, 2, NULL, 3, 1, 'SK1628142', NULL, '2019-03-08 00:00:00', 1560.00, NULL, NULL, '未提交');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `admin_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `admin_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client`  (
  `clientId` int(11) NOT NULL AUTO_INCREMENT,
  `clientName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contactPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `postcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `corporation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createAt` datetime NULL DEFAULT NULL,
  `empId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`clientId`) USING BTREE,
  INDEX `FK_64kuomoq8y03pvts0inaht72i`(`empId`) USING BTREE,
  CONSTRAINT `FK_64kuomoq8y03pvts0inaht72i` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES (1, '深圳市金顺诚电子科技有限公司', '李小雄', '13670153633', '天津天津市河北区大同路202号', '518000', '123@jsc.com', '李琳琳', '0577-4513575', '2018-12-24 16:35:39', 2);
INSERT INTO `client` VALUES (2, '深圳市万宏电子实业有限公司', '张小莉', '15842654751', '上海上海市嘉定区大同路202号', '519520', '235@wh.com', '罗科', '0755-4562147', '2018-12-12 16:37:52', 3);
INSERT INTO `client` VALUES (7, '深圳市奥明科电子有限公司', '刘庆章', '15784501364', '广东省深圳市罗湖区大明路520号', '513547', '965741@qq.com', '李军', '057-4513575', '2019-02-20 00:00:00', 2);
INSERT INTO `client` VALUES (8, '深圳市汇合电子科技有限公司', '李思敏', '13587452167', '江西省萍乡市芦溪县大同路202号', '518020', '9653@qq.com', '李俊', '057-4513575', '2019-02-20 00:00:00', 2);

-- ----------------------------
-- Table structure for consume
-- ----------------------------
DROP TABLE IF EXISTS `consume`;
CREATE TABLE `consume`  (
  `consume_id` int(11) NOT NULL AUTO_INCREMENT,
  `consume_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `consume_price` double NULL DEFAULT NULL,
  `type_id` int(11) NULL DEFAULT NULL,
  `consumer_id` int(11) NULL DEFAULT NULL,
  `consume_date` datetime NULL DEFAULT NULL,
  `consume_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `consume_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`consume_id`) USING BTREE,
  INDEX `FK_cj9gteyfu8fxgdnhay7ikdoqd`(`type_id`) USING BTREE,
  INDEX `FK_e4g1lhya25bwcg0auf5kfef9k`(`consumer_id`) USING BTREE,
  CONSTRAINT `FK_cj9gteyfu8fxgdnhay7ikdoqd` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_e4g1lhya25bwcg0auf5kfef9k` FOREIGN KEY (`consumer_id`) REFERENCES `consumer` (`consumer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of consume
-- ----------------------------
INSERT INTO `consume` VALUES (1, 'a123456', 12, 1, 1, '2018-10-29 00:00:00', 'aaaa', 'aaaaa');
INSERT INTO `consume` VALUES (2, 'q13456', 45, 1, 1, '2018-10-30 00:00:00', 'aaaa', 'aaaaa');
INSERT INTO `consume` VALUES (3, 'w456489', 34, 3, 1, '2018-10-30 00:00:00', 'aaaa', 'aaaaa');
INSERT INTO `consume` VALUES (4, 'w1654613', 44, 3, 1, '2018-10-30 13:41:24', NULL, NULL);
INSERT INTO `consume` VALUES (5, '165465123', 44, 2, 1, '2018-10-30 13:41:26', NULL, NULL);
INSERT INTO `consume` VALUES (6, '897456', 44, 4, 1, '2018-10-30 13:41:29', NULL, NULL);
INSERT INTO `consume` VALUES (7, '13456', 44, 3, 1, '2018-10-30 13:41:31', NULL, NULL);

-- ----------------------------
-- Table structure for consumer
-- ----------------------------
DROP TABLE IF EXISTS `consumer`;
CREATE TABLE `consumer`  (
  `consumer_id` int(11) NOT NULL AUTO_INCREMENT,
  `consumer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `consumer_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `consumer_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`consumer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of consumer
-- ----------------------------
INSERT INTO `consumer` VALUES (1, 'zxt', 'zxtaaa', '123456');

-- ----------------------------
-- Table structure for draw_material_bill
-- ----------------------------
DROP TABLE IF EXISTS `draw_material_bill`;
CREATE TABLE `draw_material_bill`  (
  `drawbillId` int(11) NOT NULL AUTO_INCREMENT,
  `billNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `empId` int(11) NULL DEFAULT NULL,
  `wareId` int(11) NULL DEFAULT NULL,
  `billId` int(11) NULL DEFAULT NULL,
  `billTime` datetime NULL DEFAULT NULL,
  `drawReason` int(11) NULL DEFAULT NULL,
  `billState` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auditAt` datetime NULL DEFAULT NULL,
  `auditBy` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`drawbillId`) USING BTREE,
  INDEX `FK_3ljk5ac2kffm6sl9emeauy0mw`(`billId`) USING BTREE,
  INDEX `FK_92bhpcvbpqvldvypuhxc283hd`(`empId`) USING BTREE,
  INDEX `FK_j1xe2ffmw4jduvxrewsus46oo`(`wareId`) USING BTREE,
  CONSTRAINT `FK_3ljk5ac2kffm6sl9emeauy0mw` FOREIGN KEY (`billId`) REFERENCES `order_bill` (`billId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_92bhpcvbpqvldvypuhxc283hd` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_j1xe2ffmw4jduvxrewsus46oo` FOREIGN KEY (`wareId`) REFERENCES `mware_house` (`wareId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of draw_material_bill
-- ----------------------------
INSERT INTO `draw_material_bill` VALUES (2, 'DMB1611431', 3, 3, 37, '2019-03-08 00:00:00', 1, 2, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for draw_material_bill_material
-- ----------------------------
DROP TABLE IF EXISTS `draw_material_bill_material`;
CREATE TABLE `draw_material_bill_material`  (
  `billMaterialId` int(11) NOT NULL AUTO_INCREMENT,
  `drawbillId` int(11) NULL DEFAULT NULL,
  `materialId` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`billMaterialId`) USING BTREE,
  INDEX `FK_3mpr5jttwy72d6tv6uemh0orb`(`drawbillId`) USING BTREE,
  INDEX `FK_3oj8vhmqssnkj8fido71wrc51`(`materialId`) USING BTREE,
  CONSTRAINT `FK_3mpr5jttwy72d6tv6uemh0orb` FOREIGN KEY (`drawbillId`) REFERENCES `draw_material_bill` (`drawbillId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_3oj8vhmqssnkj8fido71wrc51` FOREIGN KEY (`materialId`) REFERENCES `material` (`materialId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of draw_material_bill_material
-- ----------------------------
INSERT INTO `draw_material_bill_material` VALUES (2, 2, 9, 6, NULL);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `empId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userPass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(11) NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idCard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`empId`) USING BTREE,
  INDEX `FK_e11gxxlphpxc29c2wqcj86lme`(`roleId`) USING BTREE,
  CONSTRAINT `FK_e11gxxlphpxc29c2wqcj86lme` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, 'zxt', '4QrcOUm6Wau+VuBX8g+IPg==', '李依秋', 1, '13542064789', '57842@qq.com', '440303197303072888', 1);
INSERT INTO `employee` VALUES (2, 'zxt541352090', 'AZICOnu9cyUFFvBp3xi1AA==', '张晓婷', 0, '13820005264', '541352090@qq.com', '440103199506198446', 8);
INSERT INTO `employee` VALUES (3, 'admin1', '4QrcOUm6Wau+VuBX8g+IPg==', '陈浩波', 1, '13820005264', 'web001@163.com', '440103199003075962', 3);
INSERT INTO `employee` VALUES (4, 'admin2', '4QrcOUm6Wau+VuBX8g+IPg==', '林景逸', 1, '13820005264', 'yun@163.com', '440103199003073764', 4);
INSERT INTO `employee` VALUES (5, 'admin3', '4QrcOUm6Wau+VuBX8g+IPg==', '陆永昌', 1, '13820005264', 'ioe@163.com', '440103199003076121', 5);
INSERT INTO `employee` VALUES (6, 'admin4', '4QrcOUm6Wau+VuBX8g+IPg==', '沈怀莲', 1, '13820005264', 'rol@126.com', '440303197303071041', 6);
INSERT INTO `employee` VALUES (7, 'admin5', '4QrcOUm6Wau+VuBX8g+IPg==', '黄惜萍', 1, '13820005264', '8745213@qq.com', '440303197303071308', 2);
INSERT INTO `employee` VALUES (8, 'admin6', '4QrcOUm6Wau+VuBX8g+IPg==', '李燕心', 1, '15746513216', 'moni@163.com', '440103199506198905', 7);

-- ----------------------------
-- Table structure for employee_permission
-- ----------------------------
DROP TABLE IF EXISTS `employee_permission`;
CREATE TABLE `employee_permission`  (
  `rolePermissionId` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NULL DEFAULT NULL,
  `roleId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`rolePermissionId`) USING BTREE,
  INDEX `FK_idah7yrmvylogdduon48723os`(`permissionId`) USING BTREE,
  INDEX `FK_7thslyeo6x6hx9s1blsd83kej`(`roleId`) USING BTREE,
  CONSTRAINT `FK_7thslyeo6x6hx9s1blsd83kej` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_idah7yrmvylogdduon48723os` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`permissionId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of employee_permission
-- ----------------------------
INSERT INTO `employee_permission` VALUES (6, 30, 5);
INSERT INTO `employee_permission` VALUES (13, 7, 4);
INSERT INTO `employee_permission` VALUES (14, 23, 4);
INSERT INTO `employee_permission` VALUES (37, 2, 8);
INSERT INTO `employee_permission` VALUES (38, 3, 8);
INSERT INTO `employee_permission` VALUES (39, 4, 8);
INSERT INTO `employee_permission` VALUES (40, 5, 8);
INSERT INTO `employee_permission` VALUES (41, 6, 8);
INSERT INTO `employee_permission` VALUES (42, 7, 8);
INSERT INTO `employee_permission` VALUES (43, 8, 8);
INSERT INTO `employee_permission` VALUES (44, 9, 8);
INSERT INTO `employee_permission` VALUES (45, 10, 8);
INSERT INTO `employee_permission` VALUES (46, 11, 8);
INSERT INTO `employee_permission` VALUES (47, 12, 8);
INSERT INTO `employee_permission` VALUES (48, 13, 8);
INSERT INTO `employee_permission` VALUES (49, 14, 8);
INSERT INTO `employee_permission` VALUES (50, 15, 8);
INSERT INTO `employee_permission` VALUES (51, 16, 8);
INSERT INTO `employee_permission` VALUES (52, 17, 8);
INSERT INTO `employee_permission` VALUES (53, 18, 8);
INSERT INTO `employee_permission` VALUES (54, 19, 8);
INSERT INTO `employee_permission` VALUES (55, 20, 8);
INSERT INTO `employee_permission` VALUES (56, 21, 8);
INSERT INTO `employee_permission` VALUES (57, 22, 8);
INSERT INTO `employee_permission` VALUES (58, 23, 8);
INSERT INTO `employee_permission` VALUES (59, 24, 8);
INSERT INTO `employee_permission` VALUES (60, 25, 8);
INSERT INTO `employee_permission` VALUES (61, 26, 8);
INSERT INTO `employee_permission` VALUES (62, 27, 8);
INSERT INTO `employee_permission` VALUES (63, 28, 8);
INSERT INTO `employee_permission` VALUES (64, 29, 8);
INSERT INTO `employee_permission` VALUES (65, 30, 8);
INSERT INTO `employee_permission` VALUES (66, 31, 8);
INSERT INTO `employee_permission` VALUES (67, 32, 8);
INSERT INTO `employee_permission` VALUES (68, 33, 8);
INSERT INTO `employee_permission` VALUES (69, 34, 8);
INSERT INTO `employee_permission` VALUES (70, 35, 8);
INSERT INTO `employee_permission` VALUES (74, 36, 8);
INSERT INTO `employee_permission` VALUES (75, 37, 8);
INSERT INTO `employee_permission` VALUES (76, 38, 8);
INSERT INTO `employee_permission` VALUES (77, 39, 8);
INSERT INTO `employee_permission` VALUES (78, 40, 8);
INSERT INTO `employee_permission` VALUES (79, 41, 8);
INSERT INTO `employee_permission` VALUES (80, 42, 8);
INSERT INTO `employee_permission` VALUES (86, 1, 8);
INSERT INTO `employee_permission` VALUES (88, 43, 8);
INSERT INTO `employee_permission` VALUES (93, 16, 2);
INSERT INTO `employee_permission` VALUES (94, 14, 2);
INSERT INTO `employee_permission` VALUES (95, 15, 2);
INSERT INTO `employee_permission` VALUES (96, 38, 2);
INSERT INTO `employee_permission` VALUES (97, 13, 2);
INSERT INTO `employee_permission` VALUES (98, 3, 2);
INSERT INTO `employee_permission` VALUES (99, 10, 1);
INSERT INTO `employee_permission` VALUES (100, 1, 1);
INSERT INTO `employee_permission` VALUES (101, 11, 1);
INSERT INTO `employee_permission` VALUES (102, 10, 3);
INSERT INTO `employee_permission` VALUES (103, 5, 3);
INSERT INTO `employee_permission` VALUES (104, 20, 3);
INSERT INTO `employee_permission` VALUES (105, 11, 3);
INSERT INTO `employee_permission` VALUES (106, 19, 3);
INSERT INTO `employee_permission` VALUES (107, 21, 3);
INSERT INTO `employee_permission` VALUES (108, 26, 4);
INSERT INTO `employee_permission` VALUES (109, 25, 4);
INSERT INTO `employee_permission` VALUES (110, 41, 4);
INSERT INTO `employee_permission` VALUES (111, 24, 4);
INSERT INTO `employee_permission` VALUES (112, 27, 4);
INSERT INTO `employee_permission` VALUES (113, 28, 4);
INSERT INTO `employee_permission` VALUES (114, 29, 4);
INSERT INTO `employee_permission` VALUES (115, 39, 4);
INSERT INTO `employee_permission` VALUES (116, 37, 4);
INSERT INTO `employee_permission` VALUES (117, 4, 5);
INSERT INTO `employee_permission` VALUES (118, 39, 5);
INSERT INTO `employee_permission` VALUES (119, 37, 5);
INSERT INTO `employee_permission` VALUES (120, 8, 5);
INSERT INTO `employee_permission` VALUES (121, 31, 5);
INSERT INTO `employee_permission` VALUES (122, 33, 5);
INSERT INTO `employee_permission` VALUES (123, 32, 5);
INSERT INTO `employee_permission` VALUES (124, 34, 7);
INSERT INTO `employee_permission` VALUES (125, 12, 7);
INSERT INTO `employee_permission` VALUES (126, 2, 7);
INSERT INTO `employee_permission` VALUES (127, 17, 6);
INSERT INTO `employee_permission` VALUES (128, 39, 6);
INSERT INTO `employee_permission` VALUES (129, 18, 6);
INSERT INTO `employee_permission` VALUES (130, 4, 6);
INSERT INTO `employee_permission` VALUES (131, 14, 6);
INSERT INTO `employee_permission` VALUES (132, 44, 8);
INSERT INTO `employee_permission` VALUES (133, 45, 8);
INSERT INTO `employee_permission` VALUES (134, 46, 8);
INSERT INTO `employee_permission` VALUES (135, 46, 5);
INSERT INTO `employee_permission` VALUES (136, 45, 5);

-- ----------------------------
-- Table structure for employee_role
-- ----------------------------
DROP TABLE IF EXISTS `employee_role`;
CREATE TABLE `employee_role`  (
  `employeeRoleId` int(11) NOT NULL AUTO_INCREMENT,
  `empId` int(11) NULL DEFAULT NULL,
  `roleId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`employeeRoleId`) USING BTREE,
  INDEX `FK_bu9p3r0g2d57bf0sp8edvw5rp`(`empId`) USING BTREE,
  INDEX `FK_tex5wvq2tjpmw59lhcjp99xxl`(`roleId`) USING BTREE,
  CONSTRAINT `FK_bu9p3r0g2d57bf0sp8edvw5rp` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_tex5wvq2tjpmw59lhcjp99xxl` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of employee_role
-- ----------------------------
INSERT INTO `employee_role` VALUES (1, 1, 1);
INSERT INTO `employee_role` VALUES (2, 2, 8);
INSERT INTO `employee_role` VALUES (3, 3, 3);
INSERT INTO `employee_role` VALUES (4, 4, 4);
INSERT INTO `employee_role` VALUES (5, 5, 5);
INSERT INTO `employee_role` VALUES (6, 6, 6);
INSERT INTO `employee_role` VALUES (7, 7, 7);
INSERT INTO `employee_role` VALUES (8, 8, 8);

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material`  (
  `materialId` int(11) NOT NULL AUTO_INCREMENT,
  `materialNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `materialName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `categoryId` int(11) NULL DEFAULT NULL,
  `spec` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cost` decimal(19, 2) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`materialId`) USING BTREE,
  INDEX `FK_36kq4idkr61wgirx1m5uhx4gt`(`categoryId`) USING BTREE,
  CONSTRAINT `FK_36kq4idkr61wgirx1m5uhx4gt` FOREIGN KEY (`categoryId`) REFERENCES `material_category` (`categoryId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES (1, 'IC', '集成电路', '个', 1, 'PE', 10.00, NULL);
INSERT INTO `material` VALUES (2, 'RG', '二极管', '个', 1, 'PE', 11.00, NULL);
INSERT INTO `material` VALUES (3, 'CC', '电容器', '个', 1, 'PE', 12.00, NULL);
INSERT INTO `material` VALUES (4, 'JT', '镜头', '个', 2, 'PE', 13.00, NULL);
INSERT INTO `material` VALUES (5, 'BL ', '玻璃', '片', 2, 'PE', 10.00, NULL);
INSERT INTO `material` VALUES (6, 'SG', '塑胶模具', '个', 3, 'PE', 20.00, NULL);
INSERT INTO `material` VALUES (7, 'SJ', '电子密封胶', '桶', 3, 'PE', 10.00, NULL);
INSERT INTO `material` VALUES (8, 'JG', '不锈钢带', '公斤', 4, '0.5*1219*C', 30.00, '304不锈钢是一种通用性的不锈钢，它广泛地用于制作要求良好综合性能（耐腐蚀和成型性）的设备和机件');
INSERT INTO `material` VALUES (9, 'JL', '保护膜', '卷', 5, 'PE', 4.00, '防静电、防尘、防划伤');
INSERT INTO `material` VALUES (11, 'E2345', 'E23电路板', '块', 1, '50*100*200(mm)', 10.00, NULL);

-- ----------------------------
-- Table structure for material_category
-- ----------------------------
DROP TABLE IF EXISTS `material_category`;
CREATE TABLE `material_category`  (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`categoryId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of material_category
-- ----------------------------
INSERT INTO `material_category` VALUES (1, '电子材料');
INSERT INTO `material_category` VALUES (2, '光学材料');
INSERT INTO `material_category` VALUES (3, '塑料材料');
INSERT INTO `material_category` VALUES (4, '金属材料');
INSERT INTO `material_category` VALUES (5, '辅助材料');

-- ----------------------------
-- Table structure for material_check
-- ----------------------------
DROP TABLE IF EXISTS `material_check`;
CREATE TABLE `material_check`  (
  `materialCheckId` int(11) NOT NULL AUTO_INCREMENT,
  `materialId` int(11) NULL DEFAULT NULL,
  `empId` int(11) NULL DEFAULT NULL,
  `checkItem` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `checkNumber` int(11) NULL DEFAULT NULL,
  `cdate` datetime NULL DEFAULT NULL,
  `result` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qualify` double NULL DEFAULT NULL,
  `wid` int(11) NULL DEFAULT NULL,
  `checkNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` bit(1) NULL DEFAULT NULL,
  `billId` int(11) NULL DEFAULT NULL,
  `checkState` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`materialCheckId`) USING BTREE,
  INDEX `FK_6w36twqrvc127sel174jwxrt9`(`materialId`) USING BTREE,
  INDEX `FK_8j0fetjkkowrl1cp4crp28yt`(`wid`) USING BTREE,
  INDEX `FK_j9k7so9xyfxojske7khsn7t1c`(`billId`) USING BTREE,
  INDEX `FK_n7exbbjdui3u7jhbs4g17u9rx`(`empId`) USING BTREE,
  CONSTRAINT `FK_6w36twqrvc127sel174jwxrt9` FOREIGN KEY (`materialId`) REFERENCES `material` (`materialId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_8j0fetjkkowrl1cp4crp28yt` FOREIGN KEY (`wid`) REFERENCES `mware_house_material` (`wid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_j9k7so9xyfxojske7khsn7t1c` FOREIGN KEY (`billId`) REFERENCES `material_instock_bill` (`billId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_n7exbbjdui3u7jhbs4g17u9rx` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of material_check
-- ----------------------------
INSERT INTO `material_check` VALUES (24, 2, 5, '包装外表', 3, '2019-02-21 00:00:00', '优', NULL, 73, NULL, 'WLZ1013224', b'1', 10, b'1');
INSERT INTO `material_check` VALUES (25, 6, 7, '包装外表', 4, '2019-02-21 00:00:00', '优', NULL, 80, NULL, 'WLZ1018133', b'1', 11, b'1');
INSERT INTO `material_check` VALUES (29, 11, 1, '包装外表', 3, '2019-03-06 00:00:00', '优', NULL, 82, NULL, 'WLZ1518554', b'1', 15, b'1');
INSERT INTO `material_check` VALUES (30, 6, 1, '包装外表', 5, '2019-03-06 00:00:00', '优', NULL, 80, NULL, 'WLZ173240', b'1', 16, b'1');
INSERT INTO `material_check` VALUES (35, 9, 1, '包装外表', 5, '2019-03-07 00:00:00', '优', NULL, 84, NULL, 'WLZ133554', b'1', 21, b'1');
INSERT INTO `material_check` VALUES (36, 11, 7, '包装外表', 5, '2019-03-08 00:00:00', '优', NULL, 84, NULL, 'WLZ16864', b'1', 22, b'1');

-- ----------------------------
-- Table structure for material_instock_bill
-- ----------------------------
DROP TABLE IF EXISTS `material_instock_bill`;
CREATE TABLE `material_instock_bill`  (
  `billId` int(11) NOT NULL AUTO_INCREMENT,
  `billNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `empId` int(11) NULL DEFAULT NULL,
  `wareId` int(11) NULL DEFAULT NULL,
  `materialId` int(11) NULL DEFAULT NULL,
  `billTime` datetime NULL DEFAULT NULL,
  `materialSource` int(11) NULL DEFAULT NULL,
  `billState` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auditAt` datetime NULL DEFAULT NULL,
  `auditBy` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `flag` bit(1) NULL DEFAULT NULL,
  `purId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`billId`) USING BTREE,
  INDEX `FK_2f40bi61luoiq9vw6ig8mflkj`(`wareId`) USING BTREE,
  INDEX `FK_qxhf2d4wsht7psj5c622ygx2w`(`empId`) USING BTREE,
  INDEX `FK_r1upw81pxma2yv7l416s1uvrh`(`materialId`) USING BTREE,
  INDEX `FK_isby0pgtmxnw574p0gufuitdg`(`purId`) USING BTREE,
  CONSTRAINT `FK_2f40bi61luoiq9vw6ig8mflkj` FOREIGN KEY (`wareId`) REFERENCES `mware_house` (`wareId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_isby0pgtmxnw574p0gufuitdg` FOREIGN KEY (`purId`) REFERENCES `purchase` (`purId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_qxhf2d4wsht7psj5c622ygx2w` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_r1upw81pxma2yv7l416s1uvrh` FOREIGN KEY (`materialId`) REFERENCES `material` (`materialId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of material_instock_bill
-- ----------------------------
INSERT INTO `material_instock_bill` VALUES (10, 'MI1012270', 5, 1, 2, '2019-02-21 00:00:00', 1, 1, NULL, '2019-02-21 00:00:00', 0, 500, NULL, NULL);
INSERT INTO `material_instock_bill` VALUES (11, 'MI1017412', 7, 1, 6, '2019-02-21 00:00:00', 1, 1, NULL, '2019-02-21 00:00:00', 0, 50, NULL, NULL);
INSERT INTO `material_instock_bill` VALUES (15, 'MI1518384', 1, 3, 11, '2019-03-06 00:00:00', 1, 1, NULL, '2019-03-06 00:00:00', 0, 200, NULL, 1);
INSERT INTO `material_instock_bill` VALUES (16, 'MI17374', 1, 3, 6, '2019-03-06 00:00:00', 1, 1, NULL, '2019-03-06 00:00:00', 0, 100, NULL, 2);
INSERT INTO `material_instock_bill` VALUES (21, 'MI1334164', 1, 3, 9, '2019-03-07 00:00:00', 1, 1, NULL, '2019-03-07 00:00:00', 0, 100, NULL, 9);
INSERT INTO `material_instock_bill` VALUES (22, 'MI167472', 7, 3, 11, '2019-03-08 00:00:00', 1, 1, NULL, '2019-03-08 00:00:00', 0, 100, NULL, 10);

-- ----------------------------
-- Table structure for material_outstock_bill
-- ----------------------------
DROP TABLE IF EXISTS `material_outstock_bill`;
CREATE TABLE `material_outstock_bill`  (
  `billId` int(11) NOT NULL AUTO_INCREMENT,
  `billNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `empId` int(11) NULL DEFAULT NULL,
  `wareId` int(11) NULL DEFAULT NULL,
  `materialId` int(11) NULL DEFAULT NULL,
  `billTime` datetime NULL DEFAULT NULL,
  `materialWhereabouts` int(11) NULL DEFAULT NULL,
  `billState` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auditAt` datetime NULL DEFAULT NULL,
  `auditBy` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `flag` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`billId`) USING BTREE,
  INDEX `FK_netnpqkopue3hgt8rt47pxk4w`(`empId`) USING BTREE,
  INDEX `FK_keb6p8tscr35tev561fbu324a`(`wareId`) USING BTREE,
  INDEX `FK_3w4b79t0xq14nxu6vdgjjquoi`(`materialId`) USING BTREE,
  CONSTRAINT `FK_3w4b79t0xq14nxu6vdgjjquoi` FOREIGN KEY (`materialId`) REFERENCES `material` (`materialId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_keb6p8tscr35tev561fbu324a` FOREIGN KEY (`wareId`) REFERENCES `mware_house` (`wareId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_netnpqkopue3hgt8rt47pxk4w` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of material_outstock_bill
-- ----------------------------
INSERT INTO `material_outstock_bill` VALUES (6, 'OM001', 5, 2, 2, '2019-01-09 14:00:50', 1, 1, '生产出库', '2019-01-19 14:00:58', NULL, 500, NULL);
INSERT INTO `material_outstock_bill` VALUES (8, 'CK1536541', 4, 2, 5, '2019-02-19 00:00:00', 1, 1, NULL, NULL, NULL, 3, NULL);

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module`  (
  `moduleId` int(11) NOT NULL AUTO_INCREMENT,
  `moduleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subModuleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`moduleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES (1, '业务管理', '客户资料');
INSERT INTO `module` VALUES (2, '工程管理', '工程设计');
INSERT INTO `module` VALUES (3, '物控管理', '货品资料');
INSERT INTO `module` VALUES (4, '采购管理', '供应商物料报价');
INSERT INTO `module` VALUES (5, '生产管理', '领料单物料');
INSERT INTO `module` VALUES (6, '品质管理', '物料品质');
INSERT INTO `module` VALUES (7, '仓库管理', '货品入库单');
INSERT INTO `module` VALUES (8, '财务管理', '账户信息');
INSERT INTO `module` VALUES (9, '系统设置', '系统设置');
INSERT INTO `module` VALUES (10, '业务管理', '订单管理');
INSERT INTO `module` VALUES (11, '业务管理', '订单货品');
INSERT INTO `module` VALUES (12, '工程管理', '工程承包');
INSERT INTO `module` VALUES (13, '物控管理', '货品类别');
INSERT INTO `module` VALUES (14, '物控管理', '物料资料');
INSERT INTO `module` VALUES (15, '物控管理', '物料类别');
INSERT INTO `module` VALUES (16, '物控管理', '产品物料详情');
INSERT INTO `module` VALUES (17, '采购管理', '供应商信息');
INSERT INTO `module` VALUES (18, '采购管理', '查看缺料情况');
INSERT INTO `module` VALUES (19, '生产管理', '领料单信息');
INSERT INTO `module` VALUES (20, '生产管理', '退料单信息');
INSERT INTO `module` VALUES (21, '生产管理', '退料单物料信息');
INSERT INTO `module` VALUES (22, '品质管理', '产品品质');
INSERT INTO `module` VALUES (23, '仓库管理', '货品入库单货品');
INSERT INTO `module` VALUES (24, '仓库管理', '货品出库单');
INSERT INTO `module` VALUES (25, '仓库管理', '货品出库单货品');
INSERT INTO `module` VALUES (26, '仓库管理', '物料入库单');
INSERT INTO `module` VALUES (27, '仓库管理', '物料入库单物料');
INSERT INTO `module` VALUES (28, '仓库管理', '物料出库单');
INSERT INTO `module` VALUES (29, '仓库管理', '物料出库单物料');
INSERT INTO `module` VALUES (30, '财务管理', '账务项目报销');
INSERT INTO `module` VALUES (31, '财务管理', '备用金发放');
INSERT INTO `module` VALUES (32, '财务管理', '付款单');
INSERT INTO `module` VALUES (33, '财务管理', '收款单');
INSERT INTO `module` VALUES (34, '工程管理', '全部工程');
INSERT INTO `module` VALUES (35, '系统管理', '权限角色设置');
INSERT INTO `module` VALUES (36, '系统管理', '员工信息');
INSERT INTO `module` VALUES (37, '仓库管理', '货品仓库信息');
INSERT INTO `module` VALUES (38, '物控管理', '导出货品资料');
INSERT INTO `module` VALUES (39, '仓库管理', '物料仓库信息');
INSERT INTO `module` VALUES (40, '品质管理', '二次加工货品');
INSERT INTO `module` VALUES (41, '仓库管理', '导入货品入库单');
INSERT INTO `module` VALUES (42, '仓库管理', '导入货品出库单');
INSERT INTO `module` VALUES (43, '品质管理', '二次加工物料');
INSERT INTO `module` VALUES (44, '采购管理', '采购单');
INSERT INTO `module` VALUES (45, '财务管理', '工资报表');
INSERT INTO `module` VALUES (46, '财务管理', '盈利报表');

-- ----------------------------
-- Table structure for mware_house
-- ----------------------------
DROP TABLE IF EXISTS `mware_house`;
CREATE TABLE `mware_house`  (
  `wareId` int(11) NOT NULL AUTO_INCREMENT,
  `wareNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wareCapacity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `materialId` int(11) NULL DEFAULT NULL,
  `empId` int(11) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`wareId`) USING BTREE,
  INDEX `FK_9xybep4w04pm6qocfrqbqxbem`(`materialId`) USING BTREE,
  INDEX `FK_q75eg0orxmrh2bew6hd4abd4p`(`empId`) USING BTREE,
  CONSTRAINT `FK_9xybep4w04pm6qocfrqbqxbem` FOREIGN KEY (`materialId`) REFERENCES `material` (`materialId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_q75eg0orxmrh2bew6hd4abd4p` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mware_house
-- ----------------------------
INSERT INTO `mware_house` VALUES (1, 'M仓库001', '500', 4, 2, '广东省深圳市龙岗区');
INSERT INTO `mware_house` VALUES (2, 'M仓库002', '76', NULL, 6, '维吾尔博尔塔拉蒙古温泉县123456');
INSERT INTO `mware_house` VALUES (3, 'M仓库003', '97', NULL, 7, '广东省深圳市宝安区大同路202号');

-- ----------------------------
-- Table structure for mware_house_material
-- ----------------------------
DROP TABLE IF EXISTS `mware_house_material`;
CREATE TABLE `mware_house_material`  (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `materialId` int(11) NULL DEFAULT NULL,
  `wareId` int(11) NULL DEFAULT NULL,
  `flag` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`wid`) USING BTREE,
  INDEX `FK_1839msi7yyprrgeulgt0f65gs`(`materialId`) USING BTREE,
  INDEX `FK_kiao4koq1mx1wdx0gau6d93yn`(`wareId`) USING BTREE,
  CONSTRAINT `FK_1839msi7yyprrgeulgt0f65gs` FOREIGN KEY (`materialId`) REFERENCES `material` (`materialId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_kiao4koq1mx1wdx0gau6d93yn` FOREIGN KEY (`wareId`) REFERENCES `mware_house` (`wareId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 164 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mware_house_material
-- ----------------------------
INSERT INTO `mware_house_material` VALUES (131, 1000, NULL, 1, 1, NULL);
INSERT INTO `mware_house_material` VALUES (132, 1000, NULL, 2, 1, NULL);
INSERT INTO `mware_house_material` VALUES (133, 1000, NULL, 3, 1, NULL);
INSERT INTO `mware_house_material` VALUES (134, 1000, NULL, 4, 1, NULL);
INSERT INTO `mware_house_material` VALUES (135, 1000, NULL, 5, 1, NULL);
INSERT INTO `mware_house_material` VALUES (136, 1000, NULL, 6, 1, NULL);
INSERT INTO `mware_house_material` VALUES (137, 1000, NULL, 7, 1, NULL);
INSERT INTO `mware_house_material` VALUES (138, 1000, NULL, 8, 1, NULL);
INSERT INTO `mware_house_material` VALUES (139, 1000, NULL, 9, 1, NULL);
INSERT INTO `mware_house_material` VALUES (140, 1000, NULL, 11, 1, NULL);
INSERT INTO `mware_house_material` VALUES (141, 1000, NULL, 1, 2, NULL);
INSERT INTO `mware_house_material` VALUES (142, 1000, NULL, 2, 2, NULL);
INSERT INTO `mware_house_material` VALUES (143, 1000, NULL, 3, 2, NULL);
INSERT INTO `mware_house_material` VALUES (144, 1000, NULL, 4, 2, NULL);
INSERT INTO `mware_house_material` VALUES (145, 1000, NULL, 5, 2, NULL);
INSERT INTO `mware_house_material` VALUES (146, 1000, NULL, 6, 2, NULL);
INSERT INTO `mware_house_material` VALUES (147, 1000, NULL, 7, 2, NULL);
INSERT INTO `mware_house_material` VALUES (148, 1000, NULL, 8, 2, NULL);
INSERT INTO `mware_house_material` VALUES (149, 1000, NULL, 9, 2, NULL);
INSERT INTO `mware_house_material` VALUES (150, 1000, NULL, 11, 2, NULL);
INSERT INTO `mware_house_material` VALUES (151, 1000, NULL, 1, 3, NULL);
INSERT INTO `mware_house_material` VALUES (152, 1000, NULL, 2, 3, NULL);
INSERT INTO `mware_house_material` VALUES (153, 1000, NULL, 3, 3, NULL);
INSERT INTO `mware_house_material` VALUES (154, 1000, NULL, 4, 3, NULL);
INSERT INTO `mware_house_material` VALUES (155, 1000, NULL, 5, 3, NULL);
INSERT INTO `mware_house_material` VALUES (156, 50, NULL, 6, 3, NULL);
INSERT INTO `mware_house_material` VALUES (157, 50, NULL, 7, 3, NULL);
INSERT INTO `mware_house_material` VALUES (158, 50, NULL, 8, 3, NULL);
INSERT INTO `mware_house_material` VALUES (159, 50, NULL, 9, 3, NULL);
INSERT INTO `mware_house_material` VALUES (160, 50, NULL, 11, 3, NULL);
INSERT INTO `mware_house_material` VALUES (161, 100, NULL, 11, 3, NULL);
INSERT INTO `mware_house_material` VALUES (162, -6, NULL, 9, 3, NULL);
INSERT INTO `mware_house_material` VALUES (163, 1, NULL, 9, 3, NULL);

-- ----------------------------
-- Table structure for order_bill
-- ----------------------------
DROP TABLE IF EXISTS `order_bill`;
CREATE TABLE `order_bill`  (
  `billId` int(11) NOT NULL AUTO_INCREMENT,
  `billNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clientId` int(11) NULL DEFAULT NULL,
  `billTime` datetime NULL DEFAULT NULL,
  `billAmount` decimal(19, 2) NULL DEFAULT NULL,
  `billState` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auditAt` datetime NULL DEFAULT NULL,
  `auditBy` int(11) NULL DEFAULT NULL,
  `deliveryAt` datetime NULL DEFAULT NULL,
  `empId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`billId`) USING BTREE,
  INDEX `FK_6podltodr08eplmq9mytp2khk`(`empId`) USING BTREE,
  INDEX `FK_6ryvdnsvs41jsvolg5vnu4f2i`(`clientId`) USING BTREE,
  CONSTRAINT `FK_6podltodr08eplmq9mytp2khk` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_6ryvdnsvs41jsvolg5vnu4f2i` FOREIGN KEY (`clientId`) REFERENCES `client` (`clientId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order_bill
-- ----------------------------
INSERT INTO `order_bill` VALUES (36, 'DD2123491', 1, '2019-03-07 00:00:00', 105000.00, 3, NULL, NULL, NULL, '2019-03-31 00:00:00', 1);
INSERT INTO `order_bill` VALUES (37, 'DD166234', 2, '2019-03-08 00:00:00', 17500.00, 4, NULL, NULL, NULL, '2019-03-31 00:00:00', 2);

-- ----------------------------
-- Table structure for order_bill_product
-- ----------------------------
DROP TABLE IF EXISTS `order_bill_product`;
CREATE TABLE `order_bill_product`  (
  `billProductId` int(11) NOT NULL AUTO_INCREMENT,
  `billId` int(11) NULL DEFAULT NULL,
  `productId` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`billProductId`) USING BTREE,
  INDEX `FK_3wgoe8269p71lryu9ik4fp1qv`(`billId`) USING BTREE,
  INDEX `FK_c276b2ymysrrn0w4qdba2ngq`(`productId`) USING BTREE,
  CONSTRAINT `FK_3wgoe8269p71lryu9ik4fp1qv` FOREIGN KEY (`billId`) REFERENCES `order_bill` (`billId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_c276b2ymysrrn0w4qdba2ngq` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order_bill_product
-- ----------------------------
INSERT INTO `order_bill_product` VALUES (49, 36, 6, 10, NULL);
INSERT INTO `order_bill_product` VALUES (50, 36, 7, 10, NULL);
INSERT INTO `order_bill_product` VALUES (51, 37, 4, 5, NULL);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `permissionId` int(11) NOT NULL AUTO_INCREMENT,
  `moduleId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`permissionId`) USING BTREE,
  INDEX `FK_lpyls1p53qmuemsc70vtcb92o`(`moduleId`) USING BTREE,
  CONSTRAINT `FK_lpyls1p53qmuemsc70vtcb92o` FOREIGN KEY (`moduleId`) REFERENCES `module` (`moduleId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 1);
INSERT INTO `permission` VALUES (2, 2);
INSERT INTO `permission` VALUES (3, 3);
INSERT INTO `permission` VALUES (4, 4);
INSERT INTO `permission` VALUES (5, 5);
INSERT INTO `permission` VALUES (6, 6);
INSERT INTO `permission` VALUES (7, 7);
INSERT INTO `permission` VALUES (8, 8);
INSERT INTO `permission` VALUES (9, 9);
INSERT INTO `permission` VALUES (10, 10);
INSERT INTO `permission` VALUES (11, 11);
INSERT INTO `permission` VALUES (12, 12);
INSERT INTO `permission` VALUES (13, 13);
INSERT INTO `permission` VALUES (14, 14);
INSERT INTO `permission` VALUES (15, 15);
INSERT INTO `permission` VALUES (16, 16);
INSERT INTO `permission` VALUES (17, 17);
INSERT INTO `permission` VALUES (18, 18);
INSERT INTO `permission` VALUES (19, 19);
INSERT INTO `permission` VALUES (20, 20);
INSERT INTO `permission` VALUES (21, 21);
INSERT INTO `permission` VALUES (22, 22);
INSERT INTO `permission` VALUES (23, 23);
INSERT INTO `permission` VALUES (24, 24);
INSERT INTO `permission` VALUES (25, 25);
INSERT INTO `permission` VALUES (26, 26);
INSERT INTO `permission` VALUES (27, 27);
INSERT INTO `permission` VALUES (28, 28);
INSERT INTO `permission` VALUES (29, 29);
INSERT INTO `permission` VALUES (30, 30);
INSERT INTO `permission` VALUES (31, 31);
INSERT INTO `permission` VALUES (32, 32);
INSERT INTO `permission` VALUES (33, 33);
INSERT INTO `permission` VALUES (34, 34);
INSERT INTO `permission` VALUES (35, 35);
INSERT INTO `permission` VALUES (36, 36);
INSERT INTO `permission` VALUES (37, 37);
INSERT INTO `permission` VALUES (38, 38);
INSERT INTO `permission` VALUES (39, 39);
INSERT INTO `permission` VALUES (40, 40);
INSERT INTO `permission` VALUES (41, 41);
INSERT INTO `permission` VALUES (42, 42);
INSERT INTO `permission` VALUES (43, 43);
INSERT INTO `permission` VALUES (44, 44);
INSERT INTO `permission` VALUES (45, 45);
INSERT INTO `permission` VALUES (46, 46);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `productNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `categoryId` int(11) NULL DEFAULT NULL,
  `spec` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(19, 2) NULL DEFAULT NULL,
  `closed` bit(1) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`productId`) USING BTREE,
  INDEX `FK_3yn5ilgef5phy6r8spvvwcmqs`(`categoryId`) USING BTREE,
  CONSTRAINT `FK_3yn5ilgef5phy6r8spvvwcmqs` FOREIGN KEY (`categoryId`) REFERENCES `product_category` (`categoryId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'A0001', '台式电脑', '台', 1, '1600*900', 4520.00, b'0', NULL);
INSERT INTO `product` VALUES (2, 'A0002', '电风扇', '个', 1, '30.5cm×24.4cm', 2399.00, b'0', NULL);
INSERT INTO `product` VALUES (3, 'A0003', '电子手表', '个', 1, 'nlklk', 2000.00, b'0', NULL);
INSERT INTO `product` VALUES (4, 'B0001', '智能手机', '台', 2, '1600*900', 3500.00, b'0', NULL);
INSERT INTO `product` VALUES (5, 'B0002', '卫星通信机', '个', 2, '1600*900', 5000.00, b'0', NULL);
INSERT INTO `product` VALUES (6, 'B0003', '话路终端机', '个', 2, '1600*900', 2500.00, b'0', NULL);
INSERT INTO `product` VALUES (7, 'C0001', '彩色电视机', '台', 3, '1600*900', 8000.00, b'0', NULL);
INSERT INTO `product` VALUES (8, 'C0002', '家庭影院', '个', 3, '1600*900', 2000.00, b'0', NULL);
INSERT INTO `product` VALUES (9, 'D0001', '电子测量仪器', '台', 4, '1600*900', 650.00, b'0', NULL);
INSERT INTO `product` VALUES (10, 'E0001', '平板电脑', '台', 5, '1600*900', 4550.00, b'0', NULL);
INSERT INTO `product` VALUES (11, 'E0002', '音响', '个', 1, '1600*900', 450.00, b'0', NULL);

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`categoryId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (1, '计算机产品');
INSERT INTO `product_category` VALUES (2, '通信类产品');
INSERT INTO `product_category` VALUES (3, '广播电视产品');
INSERT INTO `product_category` VALUES (4, '仪器仪表产品');
INSERT INTO `product_category` VALUES (5, '电子器件产品');
INSERT INTO `product_category` VALUES (7, '相机摄像机');

-- ----------------------------
-- Table structure for product_check
-- ----------------------------
DROP TABLE IF EXISTS `product_check`;
CREATE TABLE `product_check`  (
  `productCheckId` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NULL DEFAULT NULL,
  `empId` int(11) NULL DEFAULT NULL,
  `checkItem` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `checkNumber` int(11) NULL DEFAULT NULL,
  `cdate` datetime NULL DEFAULT NULL,
  `result` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qualify` double NULL DEFAULT NULL,
  `wid` int(11) NULL DEFAULT NULL,
  `checkNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` bit(1) NULL DEFAULT NULL,
  `checkState` bit(1) NULL DEFAULT NULL,
  `billId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`productCheckId`) USING BTREE,
  INDEX `FK_d3psn4mqe1mgak29g6uj1jk4c`(`wid`) USING BTREE,
  INDEX `FK_eun9032l4hl7xdj8o2d1ts9td`(`empId`) USING BTREE,
  INDEX `FK_g2f9jpi4xi4sdnu9u29wvfglx`(`billId`) USING BTREE,
  INDEX `FK_hd0t6hp7m3c2kcy3fsgjfvtup`(`productId`) USING BTREE,
  CONSTRAINT `FK_d3psn4mqe1mgak29g6uj1jk4c` FOREIGN KEY (`wid`) REFERENCES `ware_house_product` (`wid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_eun9032l4hl7xdj8o2d1ts9td` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_g2f9jpi4xi4sdnu9u29wvfglx` FOREIGN KEY (`billId`) REFERENCES `product_instock_bill` (`billId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_hd0t6hp7m3c2kcy3fsgjfvtup` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_check
-- ----------------------------
INSERT INTO `product_check` VALUES (1, 4, 2, '包装外表', 3, '2019-03-08 00:00:00', '优', NULL, 87, NULL, 'CPZ1624233', b'1', b'1', 1);

-- ----------------------------
-- Table structure for product_instock_bill
-- ----------------------------
DROP TABLE IF EXISTS `product_instock_bill`;
CREATE TABLE `product_instock_bill`  (
  `billId` int(11) NOT NULL AUTO_INCREMENT,
  `billNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `billTime` datetime NULL DEFAULT NULL,
  `productSource` int(11) NULL DEFAULT NULL,
  `billState` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auditAt` datetime NULL DEFAULT NULL,
  `auditBy` int(11) NULL DEFAULT NULL,
  `empId` int(11) NULL DEFAULT NULL,
  `wareId` int(11) NULL DEFAULT NULL,
  `productId` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `flag` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`billId`) USING BTREE,
  INDEX `FK_36civlae6imdmdc8mikg76pdu`(`empId`) USING BTREE,
  INDEX `FK_ll8prn6bt8w3fpfrf7fhxgk95`(`productId`) USING BTREE,
  INDEX `FK_rtckm2thmr5ki4wwm8yr3sp7d`(`wareId`) USING BTREE,
  CONSTRAINT `FK_36civlae6imdmdc8mikg76pdu` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_ll8prn6bt8w3fpfrf7fhxgk95` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_rtckm2thmr5ki4wwm8yr3sp7d` FOREIGN KEY (`wareId`) REFERENCES `ware_house` (`wareId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_instock_bill
-- ----------------------------
INSERT INTO `product_instock_bill` VALUES (1, 'PI1623443', '2019-03-08 00:00:00', 1, 1, NULL, '2019-03-08 00:00:00', 0, 6, 1, 4, 5, NULL);

-- ----------------------------
-- Table structure for product_instock_bill_product
-- ----------------------------
DROP TABLE IF EXISTS `product_instock_bill_product`;
CREATE TABLE `product_instock_bill_product`  (
  `billProductId` int(11) NOT NULL AUTO_INCREMENT,
  `billId` int(11) NULL DEFAULT NULL,
  `productId` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `principal` int(11) NULL DEFAULT NULL,
  `place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`billProductId`) USING BTREE,
  INDEX `FK_cpgr64x1110b7ctkuqccyf044`(`productId`) USING BTREE,
  INDEX `FK_grqn48idemjxtejhfs3pkgbca`(`billId`) USING BTREE,
  CONSTRAINT `FK_cpgr64x1110b7ctkuqccyf044` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_grqn48idemjxtejhfs3pkgbca` FOREIGN KEY (`billId`) REFERENCES `product_instock_bill` (`billId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for product_material
-- ----------------------------
DROP TABLE IF EXISTS `product_material`;
CREATE TABLE `product_material`  (
  `productMaterialId` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NULL DEFAULT NULL,
  `materialId` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`productMaterialId`) USING BTREE,
  INDEX `FK_eigyx6npmuc8wfde58sdbk2ut`(`productId`) USING BTREE,
  INDEX `FK_c9jdi0b1649ig4m8q4vp1qefk`(`materialId`) USING BTREE,
  CONSTRAINT `FK_c9jdi0b1649ig4m8q4vp1qefk` FOREIGN KEY (`materialId`) REFERENCES `material` (`materialId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_eigyx6npmuc8wfde58sdbk2ut` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_material
-- ----------------------------
INSERT INTO `product_material` VALUES (1, 1, 1, 2, 'PC机');
INSERT INTO `product_material` VALUES (2, 1, 2, 5, 'PC机');
INSERT INTO `product_material` VALUES (3, 1, 3, 1, 'PC机');
INSERT INTO `product_material` VALUES (4, 5, 2, 6, '156489');
INSERT INTO `product_material` VALUES (7, 2, 1, 7, '123');
INSERT INTO `product_material` VALUES (8, 7, 6, 8, '156489');
INSERT INTO `product_material` VALUES (9, 3, 1, 5, '156489');
INSERT INTO `product_material` VALUES (10, 4, 9, 6, '156489');
INSERT INTO `product_material` VALUES (11, 6, 2, 2, NULL);
INSERT INTO `product_material` VALUES (12, 6, 3, 4, NULL);
INSERT INTO `product_material` VALUES (15, 10, 8, 6, '无');
INSERT INTO `product_material` VALUES (16, 8, 1, 7, NULL);
INSERT INTO `product_material` VALUES (18, 9, 3, 5, NULL);
INSERT INTO `product_material` VALUES (19, 10, 7, 4, NULL);
INSERT INTO `product_material` VALUES (20, 11, 4, 3, NULL);

-- ----------------------------
-- Table structure for product_outstock_bill
-- ----------------------------
DROP TABLE IF EXISTS `product_outstock_bill`;
CREATE TABLE `product_outstock_bill`  (
  `billId` int(11) NOT NULL AUTO_INCREMENT,
  `billNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `billTime` datetime NULL DEFAULT NULL,
  `productWhereabouts` int(11) NULL DEFAULT NULL,
  `billState` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auditAt` datetime NULL DEFAULT NULL,
  `auditBy` int(11) NULL DEFAULT NULL,
  `empId` int(11) NULL DEFAULT NULL,
  `wareId` int(11) NULL DEFAULT NULL,
  `productId` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `flag` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`billId`) USING BTREE,
  INDEX `FK_5o1a5tbeccjkbfa2dqo0yets2`(`wareId`) USING BTREE,
  INDEX `FK_i7rllgitl75c0mwyyw9rlw33e`(`productId`) USING BTREE,
  INDEX `FK_saou7c68bs5rkmesh0sdmjwt8`(`empId`) USING BTREE,
  CONSTRAINT `FK_5o1a5tbeccjkbfa2dqo0yets2` FOREIGN KEY (`wareId`) REFERENCES `ware_house` (`wareId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_i7rllgitl75c0mwyyw9rlw33e` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_saou7c68bs5rkmesh0sdmjwt8` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_outstock_bill
-- ----------------------------
INSERT INTO `product_outstock_bill` VALUES (1, 'CK1625270', '2019-03-08 00:00:00', 1, 1, NULL, '2019-03-08 00:00:00', 0, 5, 1, 4, 5, NULL);

-- ----------------------------
-- Table structure for product_outstock_bill_product
-- ----------------------------
DROP TABLE IF EXISTS `product_outstock_bill_product`;
CREATE TABLE `product_outstock_bill_product`  (
  `billProductId` int(11) NOT NULL AUTO_INCREMENT,
  `billId` int(11) NULL DEFAULT NULL,
  `productId` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `principal` int(11) NULL DEFAULT NULL,
  `warehouse` int(11) NULL DEFAULT NULL,
  `place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`billProductId`) USING BTREE,
  INDEX `FK_2gi9t3lhxrf233yd4tf01dn0g`(`billId`) USING BTREE,
  INDEX `FK_rywu1vc88q6bpg0pn9j9dt9up`(`productId`) USING BTREE,
  CONSTRAINT `FK_2gi9t3lhxrf233yd4tf01dn0g` FOREIGN KEY (`billId`) REFERENCES `product_outstock_bill` (`billId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_rywu1vc88q6bpg0pn9j9dt9up` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for profit
-- ----------------------------
DROP TABLE IF EXISTS `profit`;
CREATE TABLE `profit`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `billProductId` int(11) NULL DEFAULT NULL,
  `taskId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `FK_iuo1mysvc52h4a6xn3midd3dm`(`billProductId`) USING BTREE,
  INDEX `FK_sktdkjsnn2jvhspupbypxx7t7`(`taskId`) USING BTREE,
  CONSTRAINT `FK_sktdkjsnn2jvhspupbypxx7t7` FOREIGN KEY (`taskId`) REFERENCES `project_task` (`taskId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_iuo1mysvc52h4a6xn3midd3dm` FOREIGN KEY (`billProductId`) REFERENCES `order_bill_product` (`billProductId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `proId` int(11) NOT NULL AUTO_INCREMENT,
  `proName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `manId` int(11) NULL DEFAULT NULL,
  `percent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startDate` datetime NULL DEFAULT NULL,
  `endDate` datetime NULL DEFAULT NULL,
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `empId` int(11) NULL DEFAULT NULL,
  `proNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `billId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`proId`) USING BTREE,
  INDEX `FK_l9m7wqt0qkafm0vc18g9yr79h`(`empId`) USING BTREE,
  INDEX `FK_gd3ueu4v800mk1o3ln12evju8`(`billId`) USING BTREE,
  CONSTRAINT `FK_gd3ueu4v800mk1o3ln12evju8` FOREIGN KEY (`billId`) REFERENCES `order_bill` (`billId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_l9m7wqt0qkafm0vc18g9yr79h` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (22, 'DD2123491订单工程生产', 0, '50', '2019-03-07 00:00:00', '2019-03-31 00:00:00', '订单生产', '承包', 1, 'PP2329483', 36);
INSERT INTO `project` VALUES (23, 'DD166234订单工程生产', 0, '100', '2019-03-08 00:00:00', '2019-03-31 00:00:00', '订单生产', '承包', 2, 'PP169252', 37);

-- ----------------------------
-- Table structure for project_task
-- ----------------------------
DROP TABLE IF EXISTS `project_task`;
CREATE TABLE `project_task`  (
  `taskId` int(11) NOT NULL AUTO_INCREMENT,
  `proId` int(11) NULL DEFAULT NULL,
  `taskName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chargeId` int(11) NULL DEFAULT NULL,
  `chargeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startDate` datetime NULL DEFAULT NULL,
  `endDate` datetime NULL DEFAULT NULL,
  `empId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`taskId`) USING BTREE,
  INDEX `FK_2i65488qxq351ariab7csvctd`(`proId`) USING BTREE,
  INDEX `FK_i92vssg2yu45twv57eqiyt3o8`(`empId`) USING BTREE,
  CONSTRAINT `FK_2i65488qxq351ariab7csvctd` FOREIGN KEY (`proId`) REFERENCES `project` (`proId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_i92vssg2yu45twv57eqiyt3o8` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 92 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project_task
-- ----------------------------
INSERT INTO `project_task` VALUES (82, 22, '准备分工', 0, NULL, '准备分工', '2019-03-07 00:00:00', '2019-03-08 00:00:00', 1);
INSERT INTO `project_task` VALUES (83, 22, '领料', 0, NULL, '领料', '2019-03-09 00:00:00', '2019-03-10 00:00:00', 8);
INSERT INTO `project_task` VALUES (84, 22, '制作中', 0, NULL, '制作中', '2019-03-12 00:00:00', '2019-03-19 00:00:00', 1);
INSERT INTO `project_task` VALUES (85, 23, '准备分工', 0, NULL, '准备分工', '2019-03-08 00:00:00', '2019-03-09 00:00:00', 3);
INSERT INTO `project_task` VALUES (86, 23, '领料', 0, NULL, '领料', '2019-03-10 00:00:00', '2019-03-11 00:00:00', 4);
INSERT INTO `project_task` VALUES (88, 23, '制作中', 0, NULL, '制作中', '2019-03-13 00:00:00', '2019-03-19 00:00:00', 5);
INSERT INTO `project_task` VALUES (89, 23, '退料', 0, NULL, '制作中', '2019-03-20 00:00:00', '2019-03-22 00:00:00', 5);
INSERT INTO `project_task` VALUES (90, 23, '货品入库', 0, NULL, '货品入库', '2019-03-23 00:00:00', '2019-03-25 00:00:00', 7);
INSERT INTO `project_task` VALUES (91, 23, '货品出库发货', 0, NULL, '出库发货', '2019-03-26 00:00:00', '2019-03-30 00:00:00', 5);

-- ----------------------------
-- Table structure for purchase
-- ----------------------------
DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase`  (
  `purId` int(11) NOT NULL AUTO_INCREMENT,
  `purNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wid` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `empId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`purId`) USING BTREE,
  INDEX `FK_pqu1ymihl3g1oyg7udggfv309`(`wid`) USING BTREE,
  INDEX `FK_knt8w8snqngjwh2v3rxf5cu98`(`empId`) USING BTREE,
  CONSTRAINT `FK_knt8w8snqngjwh2v3rxf5cu98` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_pqu1ymihl3g1oyg7udggfv309` FOREIGN KEY (`wid`) REFERENCES `mware_house_material` (`wid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of purchase
-- ----------------------------
INSERT INTO `purchase` VALUES (1, 'CG1114430', 160, 100, NULL, '已审核', 2);
INSERT INTO `purchase` VALUES (2, 'CG172581', 156, 100, NULL, '已审核', 2);
INSERT INTO `purchase` VALUES (9, 'CG1334133', 159, 100, NULL, '已审核', 2);
INSERT INTO `purchase` VALUES (10, 'CG167413', 160, 100, NULL, '已审核', 2);

-- ----------------------------
-- Table structure for return_material_bill
-- ----------------------------
DROP TABLE IF EXISTS `return_material_bill`;
CREATE TABLE `return_material_bill`  (
  `returnbillId` int(11) NOT NULL AUTO_INCREMENT,
  `billNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `empId` int(11) NULL DEFAULT NULL,
  `wareId` int(11) NULL DEFAULT NULL,
  `billId` int(11) NULL DEFAULT NULL,
  `billTime` datetime NULL DEFAULT NULL,
  `returnReason` int(11) NULL DEFAULT NULL,
  `billState` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auditAt` datetime NULL DEFAULT NULL,
  `auditBy` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`returnbillId`) USING BTREE,
  INDEX `FK_8cc0ogaapdcxfvly6vuux9o7w`(`empId`) USING BTREE,
  INDEX `FK_iy5vluiit2vynuqa3elbjqgfs`(`wareId`) USING BTREE,
  INDEX `FK_rowuoggoxbqb6m89b1vkeoae6`(`billId`) USING BTREE,
  CONSTRAINT `FK_8cc0ogaapdcxfvly6vuux9o7w` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_iy5vluiit2vynuqa3elbjqgfs` FOREIGN KEY (`wareId`) REFERENCES `mware_house` (`wareId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_rowuoggoxbqb6m89b1vkeoae6` FOREIGN KEY (`billId`) REFERENCES `order_bill` (`billId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of return_material_bill
-- ----------------------------
INSERT INTO `return_material_bill` VALUES (1, 'RMB1621494', 5, 3, 37, '2019-03-08 00:00:00', 1, 2, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for return_material_bill_material
-- ----------------------------
DROP TABLE IF EXISTS `return_material_bill_material`;
CREATE TABLE `return_material_bill_material`  (
  `billMaterialId` int(11) NOT NULL AUTO_INCREMENT,
  `returnbillId` int(11) NULL DEFAULT NULL,
  `materialId` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`billMaterialId`) USING BTREE,
  INDEX `FK_4jgppuiyy7pa2jged4jxjh4gb`(`materialId`) USING BTREE,
  INDEX `FK_rnkh47qitku5ylori8x1pqmg2`(`returnbillId`) USING BTREE,
  CONSTRAINT `FK_4jgppuiyy7pa2jged4jxjh4gb` FOREIGN KEY (`materialId`) REFERENCES `material` (`materialId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_rnkh47qitku5ylori8x1pqmg2` FOREIGN KEY (`returnbillId`) REFERENCES `return_material_bill` (`returnbillId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of return_material_bill_material
-- ----------------------------
INSERT INTO `return_material_bill_material` VALUES (1, 1, 9, 1, NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`roleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '业务管理员');
INSERT INTO `role` VALUES (2, '资料管理员');
INSERT INTO `role` VALUES (3, '生产管理员');
INSERT INTO `role` VALUES (4, '仓库管理员');
INSERT INTO `role` VALUES (5, '财务管理员');
INSERT INTO `role` VALUES (6, '物料采购员');
INSERT INTO `role` VALUES (7, '研发工程师');
INSERT INTO `role` VALUES (8, '系统管理员');

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `empId` int(11) NULL DEFAULT NULL,
  `taskId` int(11) NULL DEFAULT NULL,
  `workDate` int(11) NULL DEFAULT NULL,
  `money` int(11) NULL DEFAULT NULL,
  `salaryState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `FK_cyghl8w5oy97bpc3s6a4rdgqh`(`empId`) USING BTREE,
  INDEX `FK_sd6bn7i0jwrh83kkqvug3stqi`(`taskId`) USING BTREE,
  CONSTRAINT `FK_cyghl8w5oy97bpc3s6a4rdgqh` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_sd6bn7i0jwrh83kkqvug3stqi` FOREIGN KEY (`taskId`) REFERENCES `project_task` (`taskId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES (1, 1, 82, 0, 150, '未审核');
INSERT INTO `salary` VALUES (2, 1, 84, 0, 150, '未审核');

-- ----------------------------
-- Table structure for storage
-- ----------------------------
DROP TABLE IF EXISTS `storage`;
CREATE TABLE `storage`  (
  `stoId` int(11) NOT NULL AUTO_INCREMENT,
  `stoName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stoConnectperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stoPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stoAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stoRemark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`stoId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `supplierId` int(11) NOT NULL AUTO_INCREMENT,
  `supplierName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contactPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createAt` datetime NULL DEFAULT NULL,
  `createBy` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`supplierId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, '东莞市厚勤电子有限公司', '任小姐', '13631766990', '广东省-东莞市-市区', '中堂镇107国道潢涌路口', NULL, NULL);
INSERT INTO `supplier` VALUES (2, '深圳市智慧电子有限公司', '董先生', '13510422059', '广东省-深圳市-宝安区', '石岩北环路官田华丰科技园B4栋4楼', NULL, NULL);
INSERT INTO `supplier` VALUES (3, '深圳市明发兴科电子公司', '李女士', '15919881601', '浙江省-衢州市-常山县', '浙江大新路520号', NULL, NULL);
INSERT INTO `supplier` VALUES (4, '深圳市友进芯城电子有限公司', '李可可', '135642575474', '江西省-新余市-分宜县', '阿萨德撒多撒', NULL, NULL);

-- ----------------------------
-- Table structure for supplier_material
-- ----------------------------
DROP TABLE IF EXISTS `supplier_material`;
CREATE TABLE `supplier_material`  (
  `supplierMaterialId` int(11) NOT NULL AUTO_INCREMENT,
  `supplierId` int(11) NULL DEFAULT NULL,
  `materialId` int(11) NULL DEFAULT NULL,
  `price` decimal(19, 2) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `state` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`supplierMaterialId`) USING BTREE,
  INDEX `FK_jyvw0yc8th12ak09sky40xxsi`(`supplierId`) USING BTREE,
  INDEX `FK_rmuxdap8fgl0kps839dkluary`(`materialId`) USING BTREE,
  CONSTRAINT `FK_jyvw0yc8th12ak09sky40xxsi` FOREIGN KEY (`supplierId`) REFERENCES `supplier` (`supplierId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_rmuxdap8fgl0kps839dkluary` FOREIGN KEY (`materialId`) REFERENCES `material` (`materialId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of supplier_material
-- ----------------------------
INSERT INTO `supplier_material` VALUES (1, 1, 3, 500.00, '0', NULL, b'0');
INSERT INTO `supplier_material` VALUES (2, 2, 4, 500.00, '1', NULL, b'1');
INSERT INTO `supplier_material` VALUES (3, 3, 6, 500.00, '0', NULL, b'0');
INSERT INTO `supplier_material` VALUES (4, 1, 1, 500.00, '1', NULL, b'0');
INSERT INTO `supplier_material` VALUES (5, 2, 2, 500.00, '1', NULL, b'1');
INSERT INTO `supplier_material` VALUES (6, 3, 5, 500.00, '1', NULL, b'1');
INSERT INTO `supplier_material` VALUES (7, 1, 7, 500.00, '1', NULL, b'1');
INSERT INTO `supplier_material` VALUES (8, 2, 8, 500.00, '0', NULL, b'0');
INSERT INTO `supplier_material` VALUES (9, 3, 9, 500.00, '0', NULL, b'0');
INSERT INTO `supplier_material` VALUES (11, 3, 4, 567.00, '无', NULL, NULL);
INSERT INTO `supplier_material` VALUES (12, 4, 1, 566.00, '无', NULL, NULL);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, 'a');
INSERT INTO `type` VALUES (2, 'b');
INSERT INTO `type` VALUES (3, 'c');
INSERT INTO `type` VALUES (4, 'd');

-- ----------------------------
-- Table structure for useless_material
-- ----------------------------
DROP TABLE IF EXISTS `useless_material`;
CREATE TABLE `useless_material`  (
  `useId` int(11) NOT NULL AUTO_INCREMENT,
  `useNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `billId` int(11) NULL DEFAULT NULL,
  `materialCheckId` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`useId`) USING BTREE,
  INDEX `FK_4kpbr3s7k19h5iv0kpxugr0tu`(`materialCheckId`) USING BTREE,
  INDEX `FK_kaugjjruj8ldnjhow5qnxgnc7`(`billId`) USING BTREE,
  CONSTRAINT `FK_4kpbr3s7k19h5iv0kpxugr0tu` FOREIGN KEY (`materialCheckId`) REFERENCES `material_check` (`materialCheckId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_kaugjjruj8ldnjhow5qnxgnc7` FOREIGN KEY (`billId`) REFERENCES `material_instock_bill` (`billId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for useless_product
-- ----------------------------
DROP TABLE IF EXISTS `useless_product`;
CREATE TABLE `useless_product`  (
  `useId` int(11) NOT NULL AUTO_INCREMENT,
  `useNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `billId` int(11) NULL DEFAULT NULL,
  `productCheckId` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`useId`) USING BTREE,
  INDEX `FK_8hbswb7qbaep5yjahaojixr2l`(`productCheckId`) USING BTREE,
  INDEX `FK_d7jqn1o6m4ifbkct5wtkka2f8`(`billId`) USING BTREE,
  CONSTRAINT `FK_8hbswb7qbaep5yjahaojixr2l` FOREIGN KEY (`productCheckId`) REFERENCES `product_check` (`productCheckId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_d7jqn1o6m4ifbkct5wtkka2f8` FOREIGN KEY (`billId`) REFERENCES `product_instock_bill` (`billId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ware_house
-- ----------------------------
DROP TABLE IF EXISTS `ware_house`;
CREATE TABLE `ware_house`  (
  `wareId` int(11) NOT NULL AUTO_INCREMENT,
  `wareNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wareCapacity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productId` int(11) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `empId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`wareId`) USING BTREE,
  INDEX `FK_r2s3y83ssko0fvxri23feyk5i`(`productId`) USING BTREE,
  INDEX `FK_e0ovm5jd5hcmmbydbb2v9yftj`(`empId`) USING BTREE,
  CONSTRAINT `FK_e0ovm5jd5hcmmbydbb2v9yftj` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_r2s3y83ssko0fvxri23feyk5i` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ware_house
-- ----------------------------
INSERT INTO `ware_house` VALUES (1, '仓库1', '10', 2, '深圳市南山区', 1);
INSERT INTO `ware_house` VALUES (2, '仓库2', '50', 1, '东莞市莞城街道', 2);
INSERT INTO `ware_house` VALUES (5, '仓库3', '32', 4, '安徽省铜陵市狮子山区大同路202号', 2);
INSERT INTO `ware_house` VALUES (7, '仓库4', '45', 3, '江西省吉安市井冈山市大同路202号', 5);
INSERT INTO `ware_house` VALUES (8, '仓库5', '36', 7, '江西省宜春市宜丰县大同路211号', 5);

-- ----------------------------
-- Table structure for ware_house_product
-- ----------------------------
DROP TABLE IF EXISTS `ware_house_product`;
CREATE TABLE `ware_house_product`  (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productId` int(11) NULL DEFAULT NULL,
  `wareId` int(11) NULL DEFAULT NULL,
  `flag` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`wid`) USING BTREE,
  INDEX `FK_f2sdmi2l2avpxksb6gi1ppuvs`(`productId`) USING BTREE,
  INDEX `FK_abh5t7dplg0g57wv3yokxisl1`(`wareId`) USING BTREE,
  CONSTRAINT `FK_abh5t7dplg0g57wv3yokxisl1` FOREIGN KEY (`wareId`) REFERENCES `ware_house` (`wareId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_f2sdmi2l2avpxksb6gi1ppuvs` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ware_house_product
-- ----------------------------
INSERT INTO `ware_house_product` VALUES (53, 1000, NULL, 1, 1, b'0');
INSERT INTO `ware_house_product` VALUES (54, 1000, NULL, 2, 1, b'0');
INSERT INTO `ware_house_product` VALUES (55, 1000, NULL, 3, 1, b'0');
INSERT INTO `ware_house_product` VALUES (56, 1000, NULL, 4, 1, b'0');
INSERT INTO `ware_house_product` VALUES (57, 1000, NULL, 5, 1, b'0');
INSERT INTO `ware_house_product` VALUES (58, 1000, NULL, 6, 1, b'0');
INSERT INTO `ware_house_product` VALUES (59, 1000, NULL, 7, 1, b'0');
INSERT INTO `ware_house_product` VALUES (60, 1000, NULL, 8, 1, b'0');
INSERT INTO `ware_house_product` VALUES (61, 1000, NULL, 9, 1, b'0');
INSERT INTO `ware_house_product` VALUES (62, 1000, NULL, 10, 1, b'0');
INSERT INTO `ware_house_product` VALUES (63, 1000, NULL, 11, 1, b'0');
INSERT INTO `ware_house_product` VALUES (64, 1000, NULL, 1, 2, b'0');
INSERT INTO `ware_house_product` VALUES (65, 1000, NULL, 2, 2, b'0');
INSERT INTO `ware_house_product` VALUES (66, 1000, NULL, 3, 2, b'0');
INSERT INTO `ware_house_product` VALUES (67, 1000, NULL, 4, 2, b'0');
INSERT INTO `ware_house_product` VALUES (68, 1000, NULL, 5, 2, b'0');
INSERT INTO `ware_house_product` VALUES (69, 1000, NULL, 6, 2, b'0');
INSERT INTO `ware_house_product` VALUES (70, 1000, NULL, 7, 2, b'0');
INSERT INTO `ware_house_product` VALUES (71, 1000, NULL, 8, 2, b'0');
INSERT INTO `ware_house_product` VALUES (72, 1000, NULL, 9, 2, b'0');
INSERT INTO `ware_house_product` VALUES (73, 1000, NULL, 10, 2, b'0');
INSERT INTO `ware_house_product` VALUES (74, 1000, NULL, 11, 2, b'0');
INSERT INTO `ware_house_product` VALUES (75, 1000, NULL, 1, 5, b'0');
INSERT INTO `ware_house_product` VALUES (76, 1000, NULL, 2, 5, b'0');
INSERT INTO `ware_house_product` VALUES (77, 1000, NULL, 3, 5, b'0');
INSERT INTO `ware_house_product` VALUES (78, 1000, NULL, 4, 5, b'0');
INSERT INTO `ware_house_product` VALUES (79, 1000, NULL, 5, 5, b'0');
INSERT INTO `ware_house_product` VALUES (80, 1000, NULL, 6, 5, b'0');
INSERT INTO `ware_house_product` VALUES (81, 1000, NULL, 7, 5, b'0');
INSERT INTO `ware_house_product` VALUES (82, 1000, NULL, 8, 5, b'0');
INSERT INTO `ware_house_product` VALUES (83, 1000, NULL, 9, 5, b'0');
INSERT INTO `ware_house_product` VALUES (84, 1000, NULL, 10, 5, b'0');
INSERT INTO `ware_house_product` VALUES (85, 1000, NULL, 11, 5, b'0');
INSERT INTO `ware_house_product` VALUES (86, 1000, NULL, 1, 7, b'0');
INSERT INTO `ware_house_product` VALUES (87, 1000, NULL, 2, 7, b'0');
INSERT INTO `ware_house_product` VALUES (88, 1000, NULL, 3, 7, b'0');
INSERT INTO `ware_house_product` VALUES (89, 1000, NULL, 4, 7, b'0');
INSERT INTO `ware_house_product` VALUES (90, 1000, NULL, 5, 7, b'0');
INSERT INTO `ware_house_product` VALUES (91, 1000, NULL, 6, 7, b'0');
INSERT INTO `ware_house_product` VALUES (92, 1000, NULL, 7, 7, b'0');
INSERT INTO `ware_house_product` VALUES (93, 1000, NULL, 8, 7, b'0');
INSERT INTO `ware_house_product` VALUES (94, 1000, NULL, 9, 7, b'0');
INSERT INTO `ware_house_product` VALUES (95, 1000, NULL, 10, 7, b'0');
INSERT INTO `ware_house_product` VALUES (96, 1000, NULL, 11, 7, b'0');
INSERT INTO `ware_house_product` VALUES (97, 1000, NULL, 1, 8, b'0');
INSERT INTO `ware_house_product` VALUES (98, 1000, NULL, 2, 8, b'0');
INSERT INTO `ware_house_product` VALUES (99, 1000, NULL, 3, 8, b'0');
INSERT INTO `ware_house_product` VALUES (100, 1000, NULL, 4, 8, b'0');
INSERT INTO `ware_house_product` VALUES (101, 1000, NULL, 5, 8, b'0');
INSERT INTO `ware_house_product` VALUES (102, 1000, NULL, 6, 8, b'0');
INSERT INTO `ware_house_product` VALUES (103, 1000, NULL, 7, 8, b'0');
INSERT INTO `ware_house_product` VALUES (104, 1000, NULL, 8, 8, b'0');
INSERT INTO `ware_house_product` VALUES (105, 1000, NULL, 9, 8, b'0');
INSERT INTO `ware_house_product` VALUES (106, 1000, NULL, 10, 8, b'0');
INSERT INTO `ware_house_product` VALUES (107, 1000, NULL, 11, 8, b'0');
INSERT INTO `ware_house_product` VALUES (108, 5, NULL, 4, 1, NULL);
INSERT INTO `ware_house_product` VALUES (109, -5, NULL, 4, 1, b'0');

SET FOREIGN_KEY_CHECKS = 1;
