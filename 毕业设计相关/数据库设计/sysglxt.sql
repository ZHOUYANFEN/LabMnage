/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : sysglxt

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-03-21 21:48:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sy01
-- ----------------------------
DROP TABLE IF EXISTS `sy01`;
CREATE TABLE `sy01` (
  `CSY010` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '人员类型ID',
  `CSY011` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '人员类型名称',
  `CSY012` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`CSY010`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sy01
-- ----------------------------
INSERT INTO `sy01` VALUES ('0', '管理员', '0');
INSERT INTO `sy01` VALUES ('1', '学生', '0');
INSERT INTO `sy01` VALUES ('2', '教师', '0');
INSERT INTO `sy01` VALUES ('3', '科研人员', '0');

-- ----------------------------
-- Table structure for sy02
-- ----------------------------
DROP TABLE IF EXISTS `sy02`;
CREATE TABLE `sy02` (
  `CSY020` int(11) NOT NULL AUTO_INCREMENT COMMENT '人员ID',
  `CSY010` tinyint(4) DEFAULT '0' COMMENT '类型ID',
  `CSY021` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名称',
  `CSY022` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '登陆密码',
  `CSY023` tinyint(4) NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`CSY020`),
  KEY `FK_Relationship_1` (`CSY010`),
  CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`CSY010`) REFERENCES `sy01` (`CSY010`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sy02
-- ----------------------------
INSERT INTO `sy02` VALUES ('1', '0', 'admin', 'admin', '0');
INSERT INTO `sy02` VALUES ('2', '1', '631306050218', '050218', '0');
INSERT INTO `sy02` VALUES ('3', '1', '631306050219', '050219', '0');
INSERT INTO `sy02` VALUES ('4', '2', '20170313', '170313', '0');
INSERT INTO `sy02` VALUES ('5', '2', '20170314', '170314', '0');
INSERT INTO `sy02` VALUES ('6', '3', '20170201', '170201', '0');

-- ----------------------------
-- Table structure for sy03
-- ----------------------------
DROP TABLE IF EXISTS `sy03`;
CREATE TABLE `sy03` (
  `CSY030` int(11) NOT NULL AUTO_INCREMENT COMMENT '科研人员ID',
  `CSY020` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '人员ID',
  `CSY031` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `CSY032` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '职称',
  PRIMARY KEY (`CSY030`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sy03
-- ----------------------------

-- ----------------------------
-- Table structure for sy04
-- ----------------------------
DROP TABLE IF EXISTS `sy04`;
CREATE TABLE `sy04` (
  `CSY020` int(11) DEFAULT NULL COMMENT '人员ID',
  `CSY040` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '学号',
  `CSY041` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `CSY042` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '学院',
  `CSY043` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '班级',
  PRIMARY KEY (`CSY040`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sy04
-- ----------------------------

-- ----------------------------
-- Table structure for sy05
-- ----------------------------
DROP TABLE IF EXISTS `sy05`;
CREATE TABLE `sy05` (
  `CSY020` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '人员ID',
  `CSY050` int(11) NOT NULL AUTO_INCREMENT COMMENT '教师ID',
  `CSY051` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `CSY052` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '学院',
  `CSY053` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '职称',
  PRIMARY KEY (`CSY050`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sy05
-- ----------------------------

-- ----------------------------
-- Table structure for sy06
-- ----------------------------
DROP TABLE IF EXISTS `sy06`;
CREATE TABLE `sy06` (
  `CSY060` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `CSY050` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '教师ID',
  `CSY061` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '课程名称',
  `CSY062` int(11) DEFAULT NULL COMMENT '课时',
  `CSY063` tinyint(4) DEFAULT NULL COMMENT '学分',
  `CSY064` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '开放时间',
  `CSY065` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '是否开放',
  `CSY066` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '课程地点',
  `CSY067` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`CSY060`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sy06
-- ----------------------------

-- ----------------------------
-- Table structure for sy07
-- ----------------------------
DROP TABLE IF EXISTS `sy07`;
CREATE TABLE `sy07` (
  `CSY040` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '学号',
  `CSY060` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '课程ID',
  `CSY071` int(11) DEFAULT '0' COMMENT '成绩'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sy07
-- ----------------------------

-- ----------------------------
-- Table structure for sy08
-- ----------------------------
DROP TABLE IF EXISTS `sy08`;
CREATE TABLE `sy08` (
  `CSY040` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '学号',
  `CSY060` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '课程ID',
  `CSY080` int(11) NOT NULL AUTO_INCREMENT COMMENT '实验ID',
  `CSY050` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '教师ID',
  `CSY081` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '实验名称',
  `CSY082` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '实验内容',
  `CSY083` date DEFAULT NULL COMMENT '布置时间',
  `CSY084` date DEFAULT NULL COMMENT '完成时间',
  `CSY085` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`CSY080`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sy08
-- ----------------------------

-- ----------------------------
-- Table structure for sy09
-- ----------------------------
DROP TABLE IF EXISTS `sy09`;
CREATE TABLE `sy09` (
  `CSY040` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '学号',
  `CSY080` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '课程ID',
  `CSY091` varchar(5000) COLLATE utf8_bin DEFAULT NULL COMMENT '实验完成内容',
  `CSY092` date DEFAULT NULL COMMENT '实验完成时间',
  `CSY093` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '附件地址',
  `CSY094` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '完成情况',
  `CSY090` int(11) NOT NULL AUTO_INCREMENT COMMENT '实验提交ID',
  `CSY095` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`CSY090`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sy09
-- ----------------------------

-- ----------------------------
-- Table structure for sy10
-- ----------------------------
DROP TABLE IF EXISTS `sy10`;
CREATE TABLE `sy10` (
  `CSY100` int(11) NOT NULL AUTO_INCREMENT COMMENT '实验室类别ID',
  `CSY101` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '实验室类别名称',
  `CSY102` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`CSY100`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sy10
-- ----------------------------

-- ----------------------------
-- Table structure for sy11
-- ----------------------------
DROP TABLE IF EXISTS `sy11`;
CREATE TABLE `sy11` (
  `CSY110` int(11) NOT NULL AUTO_INCREMENT COMMENT '实验室ID',
  `CSY100` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '实验室类别ID',
  `CSY111` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '实验室名称',
  `CSY112` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '实验室位置',
  `CSY113` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '开放时间',
  `CSY114` tinyint(4) DEFAULT NULL COMMENT '是否开放',
  `CSY115` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '实验室描述',
  `CSY116` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`CSY110`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sy11
-- ----------------------------

-- ----------------------------
-- Table structure for sy12
-- ----------------------------
DROP TABLE IF EXISTS `sy12`;
CREATE TABLE `sy12` (
  `CSY110` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '实验室ID',
  `CSY120` int(11) NOT NULL AUTO_INCREMENT COMMENT '实验室安排流水ID',
  `CSY020` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '人员ID',
  `CSY121` date DEFAULT NULL COMMENT '申请时间',
  `CSY122` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '申请目的',
  `CSY123` longtext COLLATE utf8_bin COMMENT '备注',
  `CSY124` date DEFAULT NULL COMMENT '审核时间',
  `CSY125` tinyint(4) DEFAULT NULL COMMENT '是否通过',
  `CSY126` date DEFAULT NULL COMMENT '安排时间',
  `CSY127` tinyint(4) DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`CSY120`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sy12
-- ----------------------------

-- ----------------------------
-- Table structure for sy13
-- ----------------------------
DROP TABLE IF EXISTS `sy13`;
CREATE TABLE `sy13` (
  `CSY020` int(11) DEFAULT NULL COMMENT '人员ID',
  `CSY130` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `CSY131` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '资源名称',
  `CSY132` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '资源类型',
  `CSY133` varchar(5000) COLLATE utf8_bin DEFAULT NULL COMMENT '资源类容',
  `CSY134` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '资源附件地址',
  `CSY135` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`CSY130`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sy13
-- ----------------------------

-- ----------------------------
-- Table structure for sy14
-- ----------------------------
DROP TABLE IF EXISTS `sy14`;
CREATE TABLE `sy14` (
  `CSY140` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `CSY141` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '公告名称',
  `CSY142` date DEFAULT NULL COMMENT '公告发布时间',
  `CSY143` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '公告内容',
  `CSY144` date DEFAULT NULL COMMENT '公告截止时间',
  `CSY145` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`CSY140`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sy14
-- ----------------------------

-- ----------------------------
-- Table structure for sy15
-- ----------------------------
DROP TABLE IF EXISTS `sy15`;
CREATE TABLE `sy15` (
  `CSY150` int(11) NOT NULL AUTO_INCREMENT COMMENT '功能ID',
  `CSY010` tinyint(4) DEFAULT NULL COMMENT '类型ID',
  `CSY151` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '功能名称',
  `CSY152` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '功能事件',
  `CSY153` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '指向页面',
  `CSY154` tinyint(4) DEFAULT NULL COMMENT '层级',
  `CSY155` tinyint(4) DEFAULT NULL COMMENT '父级',
  `CSY156` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `CSY157` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '页面元素ID',
  PRIMARY KEY (`CSY150`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sy15
-- ----------------------------
INSERT INTO `sy15` VALUES ('1', '1', '个人信息', 'selectMenu(\"slpt_personnal\",1)', null, '1', null, '0', 'slpt_personnal');
INSERT INTO `sy15` VALUES ('2', '1', '查看信息', 'openPage(\"student/student_info.jsp\")', 'student_info.jsp', '2', '1', '0', 'studentinfo');
INSERT INTO `sy15` VALUES ('3', '1', '修改密码', 'openPage(\"student/change_password.jsp\")', 'change_password.jsp', '2', '1', '0', 'changepassword');
INSERT INTO `sy15` VALUES ('4', '1', '学习资源', 'selectMenu(\"slpt_resource\",4)', null, '1', null, '0', 'slpt_resource');
INSERT INTO `sy15` VALUES ('5', '1', '资源查看', null, null, '2', '4', '0', '');
INSERT INTO `sy15` VALUES ('6', '1', '实验安排', null, null, '2', '4', '0', '');
INSERT INTO `sy15` VALUES ('7', '1', '作业安排', null, null, '2', '4', '0', '');
INSERT INTO `sy15` VALUES ('8', '1', '实验报告提交 ', 'openPage(\"student/student_info.jsp\")', null, '1', null, '0', 'slpt_report');
INSERT INTO `sy15` VALUES ('9', '1', '课程安排', 'openPage(\"student/student_info.jsp\")', null, '1', null, '0', 'slpt_class');
INSERT INTO `sy15` VALUES ('10', '1', '课程表', '', null, '2', '9', '0', '');
INSERT INTO `sy15` VALUES ('11', '1', '成绩查看', 'openPage(\"student/student_info.jsp\")', null, '1', '9', '0', 'slpt_score');
INSERT INTO `sy15` VALUES ('12', '1', '公告中心', 'openPage(\"student/student_info.jsp\")', null, '1', null, '0', 'slpt_announcement');
INSERT INTO `sy15` VALUES ('13', '1', '帮助中心', 'openPage(\"student/student_info.jsp\")', null, '1', null, '0', 'slpt_help');
INSERT INTO `sy15` VALUES ('17', '0', '用户管理', 'selectMenu(\"slpt_usermanage\",17)', null, '1', null, '0', 'slpt_usermanage');
INSERT INTO `sy15` VALUES ('18', '0', '用户添加', null, null, '2', '17', '0', '');
INSERT INTO `sy15` VALUES ('19', '0', '用户删除', null, null, '2', '17', '0', '');
INSERT INTO `sy15` VALUES ('20', '0', '用户查询', null, null, '2', '17', '0', '');
INSERT INTO `sy15` VALUES ('21', '0', '菜单管理', 'selectMenu(\"slpt_menumanage\",21)', null, '1', null, '0', 'slpt_menumanage');
INSERT INTO `sy15` VALUES ('22', '0', '菜单添加', 'openPage(\"manager/menuoperate.jsp\")', 'manager/menuoperate.jsp', '2', '21', '0', '');
INSERT INTO `sy15` VALUES ('23', '0', '菜单修改', null, null, '2', '21', '0', '');
INSERT INTO `sy15` VALUES ('24', '0', '菜单删除', null, null, '2', '21', '0', '');
INSERT INTO `sy15` VALUES ('25', '0', '资源管理', 'selectMenu(\"slpt_resourcemanage\",25)', null, '1', null, '0', 'slpt_resourcemanage');
INSERT INTO `sy15` VALUES ('26', '0', '实验室申请审核及分配', null, null, '2', '25', '0', '');
INSERT INTO `sy15` VALUES ('27', '0', '公告管理', null, null, '2', '25', '0', '');
INSERT INTO `sy15` VALUES ('28', '0', '实验课程检查', null, null, '2', '25', '0', '');
INSERT INTO `sy15` VALUES ('29', '0', '资源查看', null, null, '2', '25', '0', '');
INSERT INTO `sy15` VALUES ('30', '0', '资源统计', 'selectMenu(\"slpt_statistics\",30)', null, '1', null, '0', 'slpt_statistics');
INSERT INTO `sy15` VALUES ('31', '0', '实验课程统计', null, null, '2', '30', '0', '');
INSERT INTO `sy15` VALUES ('32', '0', '学生成绩统计', null, null, '2', '30', '0', '');
INSERT INTO `sy15` VALUES ('33', '0', '学生完成情况统计', null, null, '2', '30', '0', '');
INSERT INTO `sy15` VALUES ('34', '0', '教师实验安排统计', null, null, '2', '30', '0', '');
INSERT INTO `sy15` VALUES ('35', '0', '实验室安排统计', null, null, '2', '30', '0', '');
INSERT INTO `sy15` VALUES ('36', '3', '个人信息管理', 'selectMenu(\"slpt_personnal\",36)', null, '1', null, '0', 'slpt_personnal');
INSERT INTO `sy15` VALUES ('37', '3', '个人信息查看', null, null, '2', '36', '0', '');
INSERT INTO `sy15` VALUES ('38', '3', '密码修改', null, null, '2', '36', '0', '');
INSERT INTO `sy15` VALUES ('39', '3', '实验室申请', '', null, '1', null, '0', 'slpt_labapply');
INSERT INTO `sy15` VALUES ('40', '3', '资源管理', 'selectMenu(\"slpt_resourcemanage\",40)', null, '1', null, '0', 'slpt_resourcemanage');
INSERT INTO `sy15` VALUES ('41', '3', '论文管理', null, null, '2', '40', '0', '');
INSERT INTO `sy15` VALUES ('42', '3', '代码管理', null, null, '2', '40', '0', '');
INSERT INTO `sy15` VALUES ('43', '3', '通知公告', null, null, '1', null, '0', 'slpt_announcement');
INSERT INTO `sy15` VALUES ('44', '3', '帮助中心', null, null, '1', null, '0', 'slpt_help');
INSERT INTO `sy15` VALUES ('45', '2', '个人信息管理', 'selectMenu(\"slpt_personnal\",45)', null, '1', null, '0', 'slpt_personnal');
INSERT INTO `sy15` VALUES ('46', '2', '个人信息查看', null, null, '2', '45', '0', '');
INSERT INTO `sy15` VALUES ('47', '2', '密码设置', null, null, '2', '45', '0', '');
INSERT INTO `sy15` VALUES ('48', '2', '实验管理', 'selectMenu(\"slpt_expmanager\",48)', null, '1', null, '0', 'slpt_expmanager');
INSERT INTO `sy15` VALUES ('49', '2', '实验室申请', null, null, '2', '48', '0', '');
INSERT INTO `sy15` VALUES ('50', '2', '实验安排', null, null, '2', '48', '0', '');
INSERT INTO `sy15` VALUES ('51', '2', '实验报告评分', null, null, '2', '48', '0', '');
INSERT INTO `sy15` VALUES ('52', '2', '实验成绩评分', null, null, '2', '48', '0', '');
INSERT INTO `sy15` VALUES ('53', '2', '资源管理', 'selectMenu(\"slpt_resourcemanage\",53)', null, '1', null, '0', 'slpt_resourcemanage');
INSERT INTO `sy15` VALUES ('54', '2', '课程资源', null, null, '2', '53', '0', '');
INSERT INTO `sy15` VALUES ('55', '2', '其他资源', null, null, '2', '53', '0', '');
INSERT INTO `sy15` VALUES ('56', '2', '学生管理', null, null, '1', null, '0', 'slpt_stumanage');
INSERT INTO `sy15` VALUES ('57', '2', '通知公告', null, null, '1', null, '0', '');
INSERT INTO `sy15` VALUES ('58', '2', '帮助中心', null, null, '1', null, '0', '');
INSERT INTO `sy15` VALUES ('59', '0', '实验室管理', null, null, '2', '25', '0', '');
INSERT INTO `sy15` VALUES ('60', '0', '菜单列表', 'openPage(\"manager/menulist.jsp\")', 'manager/menulist.jsp', '2', '21', '0', '');
SET FOREIGN_KEY_CHECKS=1;
