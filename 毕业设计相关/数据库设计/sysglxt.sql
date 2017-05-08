/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50537
Source Host           : localhost:3306
Source Database       : sysglxt

Target Server Type    : MYSQL
Target Server Version : 50537
File Encoding         : 65001

Date: 2017-05-08 22:41:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aa10
-- ----------------------------
DROP TABLE IF EXISTS `aa10`;
CREATE TABLE `aa10` (
  `AAA100` varchar(30) NOT NULL DEFAULT '' COMMENT '参数类别',
  `AAA101` varchar(30) NOT NULL DEFAULT '' COMMENT '代码总称',
  `AAA102` varchar(30) NOT NULL DEFAULT '' COMMENT '代码码值',
  `AAA103` varchar(30) NOT NULL DEFAULT '' COMMENT '代码名',
  `AAA104` tinyint(2) DEFAULT '0' COMMENT '删除标记',
  `AAA105` varchar(30) DEFAULT '' COMMENT '预留字段',
  PRIMARY KEY (`AAA100`,`AAA102`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of aa10
-- ----------------------------
INSERT INTO `aa10` VALUES ('CSY042', '学院', '0', '信息科学与工程学院', '0', '');
INSERT INTO `aa10` VALUES ('CSY042', '学院', '1', '土木学院', '0', '');
INSERT INTO `aa10` VALUES ('CSY043', '班级', '0', '计软1301班', '0', 'CSY042_0');
INSERT INTO `aa10` VALUES ('CSY043', '班级', '1', '计软1302班', '0', 'CSY042_0');
INSERT INTO `aa10` VALUES ('CSY043', '班级', '2', '通信1301班', '0', 'CSY042_0');
INSERT INTO `aa10` VALUES ('CSY043', '班级', '3', '通信1302班', '0', 'CSY042_0');
INSERT INTO `aa10` VALUES ('TIME', '时间', '0', '所有时间', '1', '');
INSERT INTO `aa10` VALUES ('TIME', '时间', '1', '周一 8:00-10:00', '0', '');
INSERT INTO `aa10` VALUES ('TIME', '时间', '2', '周一 10:00-12:00', '0', '');
INSERT INTO `aa10` VALUES ('TIME', '时间', '3', '周一 14:00-16:00', '0', '');
INSERT INTO `aa10` VALUES ('TIME', '时间', '4', '周一 16:00-18:00', '0', '');
INSERT INTO `aa10` VALUES ('TIME', '时间', '5', '周一 20:00-22:00', '0', '');
INSERT INTO `aa10` VALUES ('WEEK', '周数', '1', '第一周', '0', '');
INSERT INTO `aa10` VALUES ('WEEK', '周数', '2', '第二周', '0', '');
INSERT INTO `aa10` VALUES ('WEEK', '周数', '3', '第三周', '0', '');

-- ----------------------------
-- Table structure for sy01
-- ----------------------------
DROP TABLE IF EXISTS `sy01`;
CREATE TABLE `sy01` (
  `CSY010` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '人员类型ID',
  `CSY011` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '人员类型名称',
  `CSY012` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`CSY010`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='人员类型表';

-- ----------------------------
-- Records of sy01
-- ----------------------------
INSERT INTO `sy01` VALUES ('1', '学生', '0');
INSERT INTO `sy01` VALUES ('2', '教师', '0');
INSERT INTO `sy01` VALUES ('3', '科研人员', '0');
INSERT INTO `sy01` VALUES ('4', '管理员', '0');

-- ----------------------------
-- Table structure for sy02
-- ----------------------------
DROP TABLE IF EXISTS `sy02`;
CREATE TABLE `sy02` (
  `CSY020` int(11) NOT NULL AUTO_INCREMENT COMMENT '人员ID',
  `CSY010` tinyint(4) DEFAULT '0' COMMENT '类型ID',
  `CSY021` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名称',
  `CSY022` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '登陆密码',
  `CSY023` tinyint(4) NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`CSY020`),
  KEY `FK_Relationship_1` (`CSY010`),
  CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`CSY010`) REFERENCES `sy01` (`CSY010`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

-- ----------------------------
-- Records of sy02
-- ----------------------------
INSERT INTO `sy02` VALUES ('1', '4', 'admin', 'admin', '0');
INSERT INTO `sy02` VALUES ('2', '1', '631306050218', '050218', '0');
INSERT INTO `sy02` VALUES ('3', '1', '631306050219', '050219', '0');
INSERT INTO `sy02` VALUES ('4', '2', '20170313', '170313', '1');
INSERT INTO `sy02` VALUES ('5', '2', '20170314', '170314', '0');
INSERT INTO `sy02` VALUES ('6', '3', '20170201', '170201', '0');
INSERT INTO `sy02` VALUES ('31', '1', 'fuzj', 'fuzj', '0');
INSERT INTO `sy02` VALUES ('32', '1', '001', 'dc5c7986daef50c1e02ab09b442ee34f', '0');
INSERT INTO `sy02` VALUES ('33', '2', '002', '93dd4de5cddba2c733c65f233097f05a', '0');
INSERT INTO `sy02` VALUES ('34', '3', '004', '11364907cf269dd2183b64287156072a', '0');
INSERT INTO `sy02` VALUES ('35', '4', 'developer', '5e8edd851d2fdfbd7415232c67367cc3', '0');
INSERT INTO `sy02` VALUES ('36', '1', '005', 'ce08becc73195df12d99d761bfbba68d', '0');
INSERT INTO `sy02` VALUES ('37', '4', '7788', '866c7ee013c58f01fa153a8d32c9ed57', '0');
INSERT INTO `sy02` VALUES ('38', '3', '2111', '1a0a283bfe7c549dee6c638a05200e32', '0');
INSERT INTO `sy02` VALUES ('39', '2', 'teacher001', '6b6b219e992318c632c912f7f175792f', '0');
INSERT INTO `sy02` VALUES ('40', '1', 'fuzj1', '683d8f8723b173859b5a96714c9a222e', '0');
INSERT INTO `sy02` VALUES ('41', '2', 'teacher01', 'dc5c7986daef50c1e02ab09b442ee34f', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='科研人员表';

-- ----------------------------
-- Records of sy03
-- ----------------------------
INSERT INTO `sy03` VALUES ('1', '23', '2222', '222');
INSERT INTO `sy03` VALUES ('2', '24', '333', '333');
INSERT INTO `sy03` VALUES ('3', '25', '555', '55');
INSERT INTO `sy03` VALUES ('4', '34', '科研004', '教授');
INSERT INTO `sy03` VALUES ('5', '38', '2111', '2111');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='学生表';

-- ----------------------------
-- Records of sy04
-- ----------------------------
INSERT INTO `sy04` VALUES ('32', '001', '测试学生', '信息科学与工程学院', '计软1302班');
INSERT INTO `sy04` VALUES ('36', '005', '学生005', '信息科学与工程学院', '计软1302班');
INSERT INTO `sy04` VALUES ('1', '1111', '1111', '信息科学与工程学院', '计软1302班');
INSERT INTO `sy04` VALUES ('17', '11111', '张三', '信息科学与工程学院', '计软1302班');
INSERT INTO `sy04` VALUES ('40', '22222', 'fuzj1', '信息科学与工程学院', '计软1302班');
INSERT INTO `sy04` VALUES ('31', '631306050210', '付政俊44', '信息科学与工程学院', '计软1302班');
INSERT INTO `sy04` VALUES ('2', '631306050218', '付政俊', '信息科学与工程学院', '计软1302班');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='教师表';

-- ----------------------------
-- Records of sy05
-- ----------------------------
INSERT INTO `sy05` VALUES ('26', '1', '张三', '信息学院', '教师');
INSERT INTO `sy05` VALUES ('27', '2', '李四', '土木学院', '教师');
INSERT INTO `sy05` VALUES ('28', '3', '王五', '人文学院', '教授');
INSERT INTO `sy05` VALUES ('29', '4', '刘梅', '研究院', '教师');
INSERT INTO `sy05` VALUES ('30', '5', '张新', '机电学院', '副教授');
INSERT INTO `sy05` VALUES ('33', '6', '李华', '信息学院', '副教授');
INSERT INTO `sy05` VALUES ('39', '7', '王小明', '信息学院', '教师');
INSERT INTO `sy05` VALUES ('41', '8', '李国栋', '信息科学与工程学院', '教师');

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
  `CSY068` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `CSY069` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '班级',
  `CSY06A` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '课程代码',
  PRIMARY KEY (`CSY060`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='课程表';

-- ----------------------------
-- Records of sy06
-- ----------------------------
INSERT INTO `sy06` VALUES ('1', '6', '大学物理', '1', '1', '1', '1', '1', '0', '1', '计软1302班', '001');
INSERT INTO `sy06` VALUES ('2', '6', '实验一', '2', '3', '周一', '1', 'B01214', '0', '无', '计软1302班', '002');
INSERT INTO `sy06` VALUES ('3', '6', '实验二', '3', '3', '周二', '1', 'BO1201', '0', '无', '计软1302班', '003');

-- ----------------------------
-- Table structure for sy07
-- ----------------------------
DROP TABLE IF EXISTS `sy07`;
CREATE TABLE `sy07` (
  `CSY040` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '学号',
  `CSY060` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '课程ID',
  `CSY071` int(11) DEFAULT '0' COMMENT '成绩'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='成绩表';

-- ----------------------------
-- Records of sy07
-- ----------------------------
INSERT INTO `sy07` VALUES ('123456', '1', '70');
INSERT INTO `sy07` VALUES ('123456', '2', '70');
INSERT INTO `sy07` VALUES ('005', '2', '90');
INSERT INTO `sy07` VALUES ('1111', '1', '0');
INSERT INTO `sy07` VALUES ('001', '2', '0');
INSERT INTO `sy07` VALUES ('1111', '2', '0');
INSERT INTO `sy07` VALUES ('001', '3', '0');
INSERT INTO `sy07` VALUES ('005', '3', '0');
INSERT INTO `sy07` VALUES ('1111', '3', '0');
INSERT INTO `sy07` VALUES ('631306050210', '3', '0');
INSERT INTO `sy07` VALUES ('631306050218', '3', '0');

-- ----------------------------
-- Table structure for sy08
-- ----------------------------
DROP TABLE IF EXISTS `sy08`;
CREATE TABLE `sy08` (
  `CSY060` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '课程ID',
  `CSY080` int(11) NOT NULL AUTO_INCREMENT COMMENT '实验ID',
  `CSY050` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '教师ID',
  `CSY081` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '实验名称',
  `CSY082` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '实验内容',
  `CSY083` date DEFAULT NULL COMMENT '布置时间',
  `CSY084` date DEFAULT NULL COMMENT '完成时间',
  `CSY085` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`CSY080`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='实验安排表';

-- ----------------------------
-- Records of sy08
-- ----------------------------
INSERT INTO `sy08` VALUES ('1', '1', '6', '数据结构', '完成数据结构课后练习题', '2017-03-28', '2017-03-31', '0');
INSERT INTO `sy08` VALUES ('1', '2', '1', 'c++', '完成c++课后练习题', '2017-03-29', '2017-03-30', '0');
INSERT INTO `sy08` VALUES ('1', '3', '2', '土木工程', '绘制学校概括图', '2017-03-08', '2017-03-16', '0');
INSERT INTO `sy08` VALUES ('1', '4', '1', '光学实验', '实现光导体实验内容', '2017-03-16', '2017-03-31', '0');

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
  `CSY096` tinyint(4) DEFAULT '0' COMMENT '完成标记',
  PRIMARY KEY (`CSY090`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='实验完成表';

-- ----------------------------
-- Records of sy09
-- ----------------------------
INSERT INTO `sy09` VALUES ('123456', '4', '<p>说的</p>', null, 'D://sss.xls', '88', '1', '0', '0');
INSERT INTO `sy09` VALUES ('123456', '4', '', null, 'D://sss.xls', '98', '2', '0', '0');
INSERT INTO `sy09` VALUES ('123456', '1', null, '2017-04-01', 'D://sss.xls', null, '3', '0', '0');

-- ----------------------------
-- Table structure for sy10
-- ----------------------------
DROP TABLE IF EXISTS `sy10`;
CREATE TABLE `sy10` (
  `CSY100` int(11) NOT NULL AUTO_INCREMENT COMMENT '实验室类别ID',
  `CSY101` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '实验室类别名称',
  `CSY102` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`CSY100`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='实验室类别表';

-- ----------------------------
-- Records of sy10
-- ----------------------------
INSERT INTO `sy10` VALUES ('1', '物理类', '0');
INSERT INTO `sy10` VALUES ('2', '化学类', '0');
INSERT INTO `sy10` VALUES ('3', '计算机类', '0');
INSERT INTO `sy10` VALUES ('4', '光学类', '0');
INSERT INTO `sy10` VALUES ('5', '电子类', '0');
INSERT INTO `sy10` VALUES ('6', '机电类', '0');
INSERT INTO `sy10` VALUES ('7', '人文类', '0');
INSERT INTO `sy10` VALUES ('8', '测试', '1');
INSERT INTO `sy10` VALUES ('9', '实验室', '1');
INSERT INTO `sy10` VALUES ('11', '物理类', '1');

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
  `CSY114` tinyint(4) DEFAULT '0' COMMENT '是否开放',
  `CSY115` varchar(300) COLLATE utf8_bin DEFAULT '' COMMENT '实验室描述',
  `CSY116` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`CSY110`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='实验室表';

-- ----------------------------
-- Records of sy11
-- ----------------------------
INSERT INTO `sy11` VALUES ('1', '1', '物理实验室1', 'B01201', '9：00-11：00', '0', '第一个实验室', '0');
INSERT INTO `sy11` VALUES ('2', '1', '物理实验室2', 'B01202', '9：00-11：00', '0', '第二个实验室', '0');
INSERT INTO `sy11` VALUES ('3', '2', '化学实验室1', 'B01303', '9：00-11：00', '0', '无', '0');
INSERT INTO `sy11` VALUES ('4', '2', '化学实验室2', 'B01304', '9：00-11：00', '0', '无', '0');
INSERT INTO `sy11` VALUES ('5', '3', '计算机实验室1', 'B01405', '9：00-11：00', '0', '无', '0');
INSERT INTO `sy11` VALUES ('6', '3', '计算机实验室2', 'B01406', '9：00-11：00', '0', '无', '0');
INSERT INTO `sy11` VALUES ('7', '4', '光学实验室11', 'B01503', '9：00-11：00', '0', '无', '0');
INSERT INTO `sy11` VALUES ('8', '4', '光学实验室2', 'B01504', '9：00-11：00', '0', '无', '0');
INSERT INTO `sy11` VALUES ('9', '5', '电子实验室1', 'B01603', '9：00-11：00', '0', '无', '0');
INSERT INTO `sy11` VALUES ('10', '5', '电子实验室2', 'B01604', '9：00-11：00', '0', '无', '0');
INSERT INTO `sy11` VALUES ('11', '6', '机电实验室1', 'B01703', '9：00-11：00', '0', '无', '0');
INSERT INTO `sy11` VALUES ('12', '6', '机电实验室2', 'B01704', '9：00-11：00', '0', '无', '0');
INSERT INTO `sy11` VALUES ('13', '6', '机电实验室3', 'B01705', '9：00-11：00', '0', '', '0');
INSERT INTO `sy11` VALUES ('14', '1', '力学实验室', 'B01234', '11:00-12:00', '0', '无一', '0');

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
  `CSY126` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '安排时间',
  `CSY127` tinyint(4) DEFAULT '0' COMMENT '删除标记',
  `CSY128` bit(1) DEFAULT NULL COMMENT '实验室是否已申请',
  PRIMARY KEY (`CSY120`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='实验室安排表';

-- ----------------------------
-- Records of sy12
-- ----------------------------
INSERT INTO `sy12` VALUES ('1', '1', '33', '2017-04-09', '实验课', 0xE697A0, '2017-04-09', '0', '', '0', '');
INSERT INTO `sy12` VALUES ('2', '2', '33', '2017-04-11', '实验课', 0xE697A0, '2017-04-18', '0', '', '0', '');
INSERT INTO `sy12` VALUES ('1', '3', '33', '2017-04-02', 'aaa', 0x61, null, '0', null, '0', '');
INSERT INTO `sy12` VALUES ('2', '4', '33', '2017-04-10', '', '', null, '0', null, '0', '');
INSERT INTO `sy12` VALUES ('2', '5', '33', '2017-04-11', '', '', null, '0', null, '0', '');
INSERT INTO `sy12` VALUES ('5', '6', '33', null, '', '', null, '0', null, '0', '');
INSERT INTO `sy12` VALUES ('4', '7', '33', '2017-04-11', '', '', null, '0', null, '0', '');
INSERT INTO `sy12` VALUES ('2', '49', '33', '2017-04-12', 'AAAAAA', 0x41, null, '0', null, '0', '');
INSERT INTO `sy12` VALUES ('2', '50', '33', '2017-04-05', '科学实验', 0xE5AE9EE9AA8CE8AFBE, null, '0', null, '0', '');
INSERT INTO `sy12` VALUES ('3', '51', '33', '2017-04-25', 'qqq', 0x61, null, '0', null, '0', '');
INSERT INTO `sy12` VALUES ('2', '52', '33', '2017-04-20', '去去去', 0xE5958A, null, '0', null, '0', '');
INSERT INTO `sy12` VALUES ('1', '53', '33', '2017-04-18', 'qqq', 0x717171, null, '0', null, '0', '');
INSERT INTO `sy12` VALUES ('3', '54', '33', '2017-04-25', '去去去', 0xE5958A, null, '0', null, '0', '');
INSERT INTO `sy12` VALUES ('1', '55', '33', '2017-04-19', '请求', 0xE58EBB, null, '0', null, '0', '');
INSERT INTO `sy12` VALUES ('1', '56', '33', null, '', '', null, '0', null, '0', null);
INSERT INTO `sy12` VALUES ('1', '57', '33', null, '', '', null, '0', null, '0', null);
INSERT INTO `sy12` VALUES ('1', '58', '33', null, '', '', null, '0', null, '0', null);
INSERT INTO `sy12` VALUES ('2', '59', '33', null, '', '', null, '0', null, '0', null);
INSERT INTO `sy12` VALUES ('1', '60', '33', null, '', '', null, '0', null, '0', null);
INSERT INTO `sy12` VALUES ('1', '61', '33', null, '', '', null, '0', null, '0', null);
INSERT INTO `sy12` VALUES ('1', '62', '33', null, '', '', null, '0', null, '0', null);
INSERT INTO `sy12` VALUES ('2', '63', '33', null, '', '', null, '0', null, '0', null);
INSERT INTO `sy12` VALUES ('1', '64', '33', null, '', '', null, '0', null, '0', null);
INSERT INTO `sy12` VALUES ('1', '65', '33', null, '', '', null, '0', null, '0', null);
INSERT INTO `sy12` VALUES ('1', '66', '33', '2017-05-30', 'qqq', 0x71, null, '0', null, '0', null);
INSERT INTO `sy12` VALUES ('2', '67', '33', '2017-05-22', 'shiyanke', 0x646464, null, '0', null, '0', null);
INSERT INTO `sy12` VALUES ('6', '68', '33', '2017-05-29', '', '', null, '0', null, '0', null);
INSERT INTO `sy12` VALUES ('2', '69', '33', '2017-05-15', 'aaa', 0x61, null, '0', null, '0', null);
INSERT INTO `sy12` VALUES ('1', '70', '33', '2017-05-15', '', '', null, '0', null, '0', null);
INSERT INTO `sy12` VALUES ('6', '71', '33', '2017-05-23', '', '', null, '0', null, '0', null);
INSERT INTO `sy12` VALUES ('2', '72', '33', '2017-05-30', 'sss', 0x7373, null, '0', null, '0', null);
INSERT INTO `sy12` VALUES ('1', '73', '33', '2017-05-03', '2442', 0x33343334, null, '0', null, '0', null);
INSERT INTO `sy12` VALUES ('1', '74', '33', '2017-05-02', '上课', 0xE4B88BE58D88, null, '2', null, '0', null);
INSERT INTO `sy12` VALUES ('1', '75', '33', '2017-05-07', '11', 0x3232, null, '0', null, '0', null);
INSERT INTO `sy12` VALUES ('1', '76', '33', '2017-05-07', '323', 0x333132, null, '0', null, '0', null);
INSERT INTO `sy12` VALUES ('2', '77', '33', '2017-05-07', '3213', 0x333132, null, '0', null, '0', null);
INSERT INTO `sy12` VALUES ('1', '78', '33', '2017-05-07', 'qqq', 0x313131, null, '0', '第一周,第二周', '0', null);

-- ----------------------------
-- Table structure for sy13
-- ----------------------------
DROP TABLE IF EXISTS `sy13`;
CREATE TABLE `sy13` (
  `CSY020` int(11) DEFAULT NULL COMMENT '人员ID',
  `CSY130` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `CSY131` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '资源名称',
  `CSY160` tinyint(15) NOT NULL COMMENT '资源类型',
  `CSY133` varchar(5000) COLLATE utf8_bin DEFAULT '' COMMENT '资源类容',
  `CSY134` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '资源附件地址',
  `CSY135` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `CSY136` date DEFAULT NULL COMMENT '上传时间',
  `CSY137` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '资源权限',
  PRIMARY KEY (`CSY130`),
  KEY `CSY160` (`CSY160`),
  CONSTRAINT `sy13_ibfk_1` FOREIGN KEY (`CSY160`) REFERENCES `sy16` (`csy160`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='资源表';

-- ----------------------------
-- Records of sy13
-- ----------------------------
INSERT INTO `sy13` VALUES ('4', '2', '测试', '1', 'aaaa', 'D://sss.mp4', '0', '2017-04-02', '1');
INSERT INTO `sy13` VALUES ('4', '3', '测试1', '1', 'bbb', 'D://sss.xls', '0', '2017-04-18', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='公告表';

-- ----------------------------
-- Records of sy14
-- ----------------------------
INSERT INTO `sy14` VALUES ('1', '公告1', '2017-03-29', '公告2公告公告', '2017-04-07', '0');
INSERT INTO `sy14` VALUES ('2', '公告2', '2017-03-30', '是的撒多撒大所大所多', '2017-04-07', '0');
INSERT INTO `sy14` VALUES ('3', '公告3', '2017-03-29', '萨达撒大所大所大所大所大所大是', '2017-04-08', '0');
INSERT INTO `sy14` VALUES ('4', '公告测试1', '2017-04-09', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公告1<br/></p><p>&nbsp; 测试公告1</p>', '2017-05-01', '0');
INSERT INTO `sy14` VALUES ('5', '测试公告2', '2017-04-09', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;测试公告2<br/></p><p>测试测试时</p>', '2017-04-23', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单表';

-- ----------------------------
-- Records of sy15
-- ----------------------------
INSERT INTO `sy15` VALUES ('1', '1', '个人信息', 'selectMenu(\"slpt_personnal\",1)', null, '1', null, '0', 'slpt_personnal');
INSERT INTO `sy15` VALUES ('2', '1', '查看信息', 'openPage(\"common/personalinfo.jsp\")', 'common/personalinfo.jsp', '2', '1', '0', 'studentinfo');
INSERT INTO `sy15` VALUES ('3', '1', '修改密码', 'openPage(\"common/changepassword.jsp\")', 'common/changepassword.jsp', '2', '1', '0', 'changepassword');
INSERT INTO `sy15` VALUES ('4', '1', '学习资源', 'selectMenu(\"slpt_resource\",4)', null, '1', null, '0', 'slpt_resource');
INSERT INTO `sy15` VALUES ('5', '1', '资源查看', 'openPage(\"student/scanresource.jsp\")', 'student/scanresource.jsp', '2', '4', '0', '');
INSERT INTO `sy15` VALUES ('6', '1', '实验安排', 'openPage(\"student/exparrange.jsp\")', 'student/exparrange.jsp', '2', '4', '0', '');
INSERT INTO `sy15` VALUES ('7', '1', '作业安排', null, null, '2', '4', '1', '');
INSERT INTO `sy15` VALUES ('8', '1', '实验报告提交 ', 'openPage(\"student/submitreport.jsp\")', 'student/submitreport.jsp', '1', null, '0', 'slpt_report');
INSERT INTO `sy15` VALUES ('9', '1', '课程安排', 'selectMenu(\"slpt_class\",9)', null, '1', null, '0', 'slpt_class');
INSERT INTO `sy15` VALUES ('10', '1', '课程表', 'openPage(\"student/syllabus.jsp\")', 'student/syllabus.jsp', '2', '9', '0', '');
INSERT INTO `sy15` VALUES ('11', '1', '成绩查看', 'openPage(\"student/grade.jsp\")', 'student/grade.jsp', '1', null, '0', 'slpt_score');
INSERT INTO `sy15` VALUES ('12', '1', '公告中心', 'openPage(\"common/announcement.jsp\")', 'common/announcement.jsp', '1', null, '0', 'slpt_announcement');
INSERT INTO `sy15` VALUES ('13', '1', '帮助中心', 'openPage(\"common/help.jsp\")', 'common/help.jsp', '1', null, '0', 'slpt_help');
INSERT INTO `sy15` VALUES ('17', '4', '用户管理', 'selectMenu(\"slpt_usermanage\",17)', null, '1', null, '0', 'slpt_usermanage');
INSERT INTO `sy15` VALUES ('18', '4', '用户添加', 'openPage(\"manager/useroperate.jsp\")', 'manager/useroperate.jsp', '2', '17', '0', '');
INSERT INTO `sy15` VALUES ('19', '4', '用户删除', null, null, '2', '17', '1', '');
INSERT INTO `sy15` VALUES ('20', '4', '用户查询', 'openPage(\"manager/userlist.jsp\")', 'manager/userlist.jsp', '2', '17', '0', '');
INSERT INTO `sy15` VALUES ('21', '4', '菜单管理', 'selectMenu(\"slpt_menumanage\",21)', null, '1', null, '0', 'slpt_menumanage');
INSERT INTO `sy15` VALUES ('22', '4', '菜单添加', 'openPage(\"manager/menuoperate.jsp\")', 'manager/menuoperate.jsp', '2', '21', '0', '');
INSERT INTO `sy15` VALUES ('23', '4', '菜单修改', null, null, '2', '21', '1', '');
INSERT INTO `sy15` VALUES ('24', '4', '菜单删除', null, null, '2', '21', '1', '');
INSERT INTO `sy15` VALUES ('25', '4', '资源管理', 'selectMenu(\"slpt_resourcemanage\",25)', null, '1', null, '0', 'slpt_resourcemanage');
INSERT INTO `sy15` VALUES ('26', '4', '实验室申请审核及分配', 'openPage(\"manager/labapply.jsp\")', 'manager/labapply.jsp', '2', '25', '0', '');
INSERT INTO `sy15` VALUES ('27', '4', '公告管理', 'openPage(\"manager/annoucement.jsp\")', 'manager/annoucement.jsp', '2', '25', '0', '');
INSERT INTO `sy15` VALUES ('28', '4', '实验课程检查', null, null, '2', '25', '0', '');
INSERT INTO `sy15` VALUES ('29', '4', '资源查看', 'openPage(\"manager/resoucesmanager.jsp\")', 'manager/resoucesmanager.jsp', '2', '25', '0', '');
INSERT INTO `sy15` VALUES ('30', '4', '资源统计', 'selectMenu(\"slpt_statistics\",30)', null, '1', null, '0', 'slpt_statistics');
INSERT INTO `sy15` VALUES ('31', '4', '实验课程统计', 'openPage(\"manager/coursestatistics.jsp\")', 'manager/coursestatistics.jsp', '2', '30', '0', '');
INSERT INTO `sy15` VALUES ('32', '4', '学生成绩统计', 'openPage(\"manager/gradestatistic.jsp\")', 'manager/gradestatistic.jsp', '2', '30', '0', '');
INSERT INTO `sy15` VALUES ('33', '4', '学生完成情况统计', null, null, '2', '30', '1', '');
INSERT INTO `sy15` VALUES ('34', '4', '教师实验安排统计', 'openPage(\"manager/exparrangestatistic.jsp\")', 'manager/exparrangestatistic.jsp', '2', '30', '0', '');
INSERT INTO `sy15` VALUES ('35', '4', '实验室安排统计', 'openPage(\"manager/labexpstatistic.jsp\")', 'manager/labexpstatistic.jsp', '2', '30', '0', '');
INSERT INTO `sy15` VALUES ('36', '3', '个人信息管理', 'selectMenu(\"slpt_personnal\",36)', null, '1', null, '0', 'slpt_personnal');
INSERT INTO `sy15` VALUES ('37', '3', '个人信息查看', 'openPage(\"common/personalinfo.jsp\")', 'common/personalinfo.jsp', '2', '36', '0', '');
INSERT INTO `sy15` VALUES ('38', '3', '密码修改', 'openPage(\"common/changepassword.jsp\")', 'common/changepassword.jsp', '2', '36', '0', '');
INSERT INTO `sy15` VALUES ('39', '3', '实验室申请', '', null, '1', null, '0', 'slpt_labapply');
INSERT INTO `sy15` VALUES ('40', '3', '资源管理', 'selectMenu(\"slpt_resourcemanage\",40)', null, '1', null, '0', 'slpt_resourcemanage');
INSERT INTO `sy15` VALUES ('41', '3', '论文管理', null, null, '2', '40', '0', '');
INSERT INTO `sy15` VALUES ('42', '3', '代码管理', null, null, '2', '40', '0', '');
INSERT INTO `sy15` VALUES ('43', '3', '通知公告', 'openPage(\"common/announcement.jsp\")', 'common/announcement.jsp', '1', null, '0', 'slpt_announcement');
INSERT INTO `sy15` VALUES ('44', '3', '帮助中心', 'openPage(\"common/help.jsp\")', 'common/help.jsp', '1', null, '0', 'slpt_help');
INSERT INTO `sy15` VALUES ('45', '2', '个人信息管理', 'selectMenu(\"slpt_personnal\",45)', null, '1', null, '0', 'slpt_personnal');
INSERT INTO `sy15` VALUES ('46', '2', '个人信息查看', 'openPage(\"common/personalinfo.jsp\")', 'common/personalinfo.jsp', '2', '45', '0', '');
INSERT INTO `sy15` VALUES ('47', '2', '密码设置', 'openPage(\"common/changepassword.jsp\")', 'common/changepassword.jsp', '2', '45', '0', '');
INSERT INTO `sy15` VALUES ('48', '2', '实验管理', 'selectMenu(\"slpt_expmanager\",48)', null, '1', null, '0', 'slpt_expmanager');
INSERT INTO `sy15` VALUES ('49', '2', '实验室申请', 'openPage(\"teacher/LabApply.jsp\")', null, '2', '48', '0', '');
INSERT INTO `sy15` VALUES ('50', '2', '实验安排', 'openPage(\"teacher/ExpManage.jsp\")', null, '2', '48', '0', '');
INSERT INTO `sy15` VALUES ('51', '2', '实验报告评分', 'openPage(\"teacher/reportScore.jsp\")', null, '2', '48', '0', '');
INSERT INTO `sy15` VALUES ('52', '2', '实验成绩评分', null, null, '2', '48', '0', '');
INSERT INTO `sy15` VALUES ('53', '2', '资源管理', 'selectMenu(\"slpt_resourcemanage\",53)', null, '1', null, '0', 'slpt_resourcemanage');
INSERT INTO `sy15` VALUES ('54', '2', '课程资源', 'openPage(\"teacher/resourceDownLoad.jsp\")', 'teacher/resourceDownLoad.jsp', '2', '53', '0', '');
INSERT INTO `sy15` VALUES ('55', '2', '其他资源', null, null, '2', '53', '0', '');
INSERT INTO `sy15` VALUES ('56', '2', '学生管理', 'openPage(\"teacher/studentmanage.jsp\")', 'teacher/studentmanage.jsp', '1', null, '0', 'slpt_stumanage');
INSERT INTO `sy15` VALUES ('57', '2', '通知公告', 'openPage(\"common/announcement.jsp\")', 'common/announcement.jsp', '1', null, '0', '');
INSERT INTO `sy15` VALUES ('58', '2', '帮助中心', 'openPage(\"common/help.jsp\")', 'common/help.jsp', '1', null, '0', '');
INSERT INTO `sy15` VALUES ('59', '4', '实验室管理', 'openPage(\"manager/labmanage.jsp\")', 'manager/labmanage.jsp', '2', '25', '0', '');
INSERT INTO `sy15` VALUES ('60', '4', '菜单列表', 'openPage(\"manager/menulist.jsp\")', 'manager/menulist.jsp', '2', '21', '0', '');
INSERT INTO `sy15` VALUES ('61', '4', '系统日志信息', 'openPage(\"manager/recorde.jsp\")', 'manager/recorde.jsp', '2', '62', '0', '');
INSERT INTO `sy15` VALUES ('62', '4', '开发者管理', 'selectMenu(\"slpt_develop\",62)', null, '1', null, '0', 'slpt_develop');
INSERT INTO `sy15` VALUES ('63', '4', '码表管理', 'openPage(\"manager/aa10manage.jsp\")', 'manager/aa10manage.jsp', '2', '62', '0', '');
INSERT INTO `sy15` VALUES ('64', '4', '异常日志管理', 'openPage(\"manager/exceptionrecorde.jsp\")', 'manager/exceptionrecorde.jsp', '2', '62', '0', '');

-- ----------------------------
-- Table structure for sy16
-- ----------------------------
DROP TABLE IF EXISTS `sy16`;
CREATE TABLE `sy16` (
  `csy160` tinyint(15) NOT NULL AUTO_INCREMENT COMMENT '资源类型ID',
  `csy161` varchar(50) DEFAULT NULL COMMENT '资源类型名称',
  `csy162` tinyint(4) DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`csy160`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='资源类型表';

-- ----------------------------
-- Records of sy16
-- ----------------------------
INSERT INTO `sy16` VALUES ('1', '工具类', '0');
INSERT INTO `sy16` VALUES ('2', '学习视频', '0');
INSERT INTO `sy16` VALUES ('3', '数据库', '0');

-- ----------------------------
-- Table structure for sy17
-- ----------------------------
DROP TABLE IF EXISTS `sy17`;
CREATE TABLE `sy17` (
  `CSY170` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `CSY171` varchar(30) DEFAULT '' COMMENT '登陆用户',
  `CSY172` varchar(30) DEFAULT '' COMMENT '访问方法',
  `CSY173` varchar(30) DEFAULT '' COMMENT 'ip地址',
  `CSY174` varchar(30) DEFAULT '' COMMENT '时间',
  `CSY175` varchar(30) DEFAULT '' COMMENT '浏览器类型',
  `CSY176` varchar(300) DEFAULT '' COMMENT '访问系统',
  `CSY177` varchar(50) DEFAULT '' COMMENT '主机名称',
  `CSY178` varchar(80) DEFAULT '' COMMENT 'mac地址',
  PRIMARY KEY (`CSY170`)
) ENGINE=InnoDB AUTO_INCREMENT=3440 DEFAULT CHARSET=utf8 COMMENT='日志信息';

-- ----------------------------
-- Records of sy17
-- ----------------------------
INSERT INTO `sy17` VALUES ('2396', null, '退出', '127.0.0.1', '2017-05-05 16:11:37', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2397', '002', '登陆', '127.0.0.1', '2017-05-05 16:11:49', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2398', '002', '获取最新公告', '127.0.0.1', '2017-05-05 16:11:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2399', '002', '获取用户信息', '127.0.0.1', '2017-05-05 16:11:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2400', '002', '查询父级菜单', '127.0.0.1', '2017-05-05 16:11:56', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2401', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:12:02', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2402', null, '退出', '127.0.0.1', '2017-05-05 16:13:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2403', '002', '登陆', '127.0.0.1', '2017-05-05 16:13:56', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2404', '002', '获取用户信息', '127.0.0.1', '2017-05-05 16:14:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2405', '002', '获取最新公告', '127.0.0.1', '2017-05-05 16:14:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2406', '002', '查询父级菜单', '127.0.0.1', '2017-05-05 16:14:03', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2407', '002', '登陆', '127.0.0.1', '2017-05-05 16:14:47', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2408', '002', '获取用户信息', '127.0.0.1', '2017-05-05 16:14:50', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2409', '002', '获取最新公告', '127.0.0.1', '2017-05-05 16:14:50', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2410', '002', '查询父级菜单', '127.0.0.1', '2017-05-05 16:14:54', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2411', null, '退出', '127.0.0.1', '2017-05-05 16:16:10', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2412', '002', '登陆', '127.0.0.1', '2017-05-05 16:16:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2413', '002', '获取最新公告', '127.0.0.1', '2017-05-05 16:16:23', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2414', '002', '获取用户信息', '127.0.0.1', '2017-05-05 16:16:23', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2415', '002', '查询父级菜单', '127.0.0.1', '2017-05-05 16:16:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2416', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:17:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2417', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:17:39', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2418', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:17:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2419', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:17:55', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2420', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:19:03', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2421', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:20:06', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2422', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:20:10', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2423', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:20:39', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2424', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:20:45', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2425', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:20:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2426', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:20:57', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2427', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:21:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2428', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:21:04', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2429', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:21:36', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2430', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:23:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2431', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:23:40', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2432', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:23:46', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2433', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:23:56', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2434', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:24:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2435', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:24:02', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2436', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:24:06', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2437', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:25:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2438', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:25:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2439', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:25:27', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2440', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:25:32', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2441', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:25:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2442', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:25:45', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2443', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:25:48', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2444', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:25:48', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2445', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:25:58', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2446', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:25:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2447', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:26:32', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2448', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:26:32', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2449', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:26:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2450', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:26:38', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2451', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:26:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2452', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:26:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2453', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:26:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2454', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:27:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2455', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:27:24', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2456', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:27:29', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2457', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:27:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2458', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:28:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2459', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:28:18', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2460', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:28:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2461', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:28:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2462', '002', '查询子级菜单', '127.0.0.1', '2017-05-05 16:33:52', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2463', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:33:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2464', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:33:57', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2465', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:34:02', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2466', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:34:06', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2467', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:38:22', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2468', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:38:28', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2469', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:38:29', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2470', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:38:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2471', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:38:40', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2472', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:38:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2473', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:38:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2474', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:38:52', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2475', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:38:58', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2476', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:48:22', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2477', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:49:09', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2478', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:49:14', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2479', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:49:18', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2480', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:49:22', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2481', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:49:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2482', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:50:04', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2483', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:50:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2484', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:50:09', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2485', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:50:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2486', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:50:25', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2487', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:51:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2488', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:52:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2489', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:52:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2490', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:52:40', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2491', '002', '安装班级获取学生列表', '127.0.0.1', '2017-05-05 16:52:45', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2492', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:53:38', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2493', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:53:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2494', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:53:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2495', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:53:47', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2496', '002', '安装班级获取学生列表', '127.0.0.1', '2017-05-05 16:54:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2497', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:55:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2498', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:55:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2499', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:55:25', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2500', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:56:11', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2501', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:56:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2502', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:56:17', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2503', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:56:24', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2504', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:56:57', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2505', '002', '查询子级菜单', '127.0.0.1', '2017-05-05 16:56:57', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2506', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:57:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2507', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:57:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2508', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:57:07', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2509', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:57:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2510', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:57:38', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2511', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:57:39', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2512', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:57:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2513', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 16:58:04', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2514', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 16:58:11', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2515', '002', '获取所有的学院', '127.0.0.1', '2017-05-05 16:58:12', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2516', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-05 16:58:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2517', '002', '安装班级获取学生列表', '127.0.0.1', '2017-05-05 16:58:41', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2518', '002', '安装班级获取学生列表', '127.0.0.1', '2017-05-05 16:58:46', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2519', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 17:07:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2520', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 17:07:50', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2521', '002', '登陆', '127.0.0.1', '2017-05-05 17:40:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2522', '002', '获取用户信息', '127.0.0.1', '2017-05-05 17:40:09', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2523', '002', '获取最新公告', '127.0.0.1', '2017-05-05 17:40:09', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2524', '002', '查询父级菜单', '127.0.0.1', '2017-05-05 17:40:12', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2525', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 17:42:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2526', '002', '获取所有实验课程', '127.0.0.1', '2017-05-05 17:42:28', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2527', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-05 17:42:36', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2528', '002', '删除该课程的学生', '127.0.0.1', '2017-05-05 17:42:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('2529', '002', '登陆', '127.0.0.1', '2017-05-06 14:07:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2530', '002', '获取最新公告', '127.0.0.1', '2017-05-06 14:07:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2531', '002', '获取用户信息', '127.0.0.1', '2017-05-06 14:07:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2532', '002', '查询父级菜单', '127.0.0.1', '2017-05-06 14:07:46', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2533', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 14:07:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2534', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 14:08:13', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2535', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 14:09:38', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2536', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 14:09:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2537', '002', '删除该课程的学生', '127.0.0.1', '2017-05-06 14:09:48', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2538', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 14:10:36', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2539', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 14:10:40', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2540', '002', '删除该课程的学生', '127.0.0.1', '2017-05-06 14:11:18', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2541', '002', '删除该课程的学生', '127.0.0.1', '2017-05-06 14:12:23', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2542', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 14:13:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2543', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 14:13:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2544', '002', '删除该课程的学生', '127.0.0.1', '2017-05-06 14:14:04', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2545', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 14:14:08', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2546', '002', '获取所有的学院', '127.0.0.1', '2017-05-06 14:14:39', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2547', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 14:15:55', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2548', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 14:16:03', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2549', '002', '获取所有的学院', '127.0.0.1', '2017-05-06 14:16:04', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2550', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 14:16:46', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2551', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 14:16:55', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2552', '002', '获取所有的学院', '127.0.0.1', '2017-05-06 14:16:56', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2553', '002', '查询子级菜单', '127.0.0.1', '2017-05-06 14:17:32', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2554', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 14:17:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2555', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 14:17:38', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2556', '002', '获取所有的学院', '127.0.0.1', '2017-05-06 14:17:40', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2557', '002', '获取所有的学院', '127.0.0.1', '2017-05-06 14:17:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2558', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-06 14:17:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2559', '002', '安装班级获取学生列表', '127.0.0.1', '2017-05-06 14:17:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2560', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 14:23:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2561', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 14:23:36', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2562', '002', '获取所有的学院', '127.0.0.1', '2017-05-06 14:23:37', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2563', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-06 14:23:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2564', '002', '安装班级获取学生列表', '127.0.0.1', '2017-05-06 14:23:46', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2565', '002', '安装班级获取学生列表', '127.0.0.1', '2017-05-06 14:23:50', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2566', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 14:26:10', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2567', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 14:26:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2568', '002', '获取所有的学院', '127.0.0.1', '2017-05-06 14:26:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2569', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-06 14:26:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2570', '002', '安装班级获取学生列表', '127.0.0.1', '2017-05-06 14:26:25', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2571', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 14:28:50', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2572', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 14:28:54', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2573', '002', '获取所有的学院', '127.0.0.1', '2017-05-06 14:29:01', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2574', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-06 14:29:10', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2575', '002', '安装班级获取学生列表', '127.0.0.1', '2017-05-06 14:29:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2576', '002', '获取所有的学院', '127.0.0.1', '2017-05-06 14:29:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2577', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 14:31:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2578', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 14:31:39', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2579', '002', '获取所有的学院', '127.0.0.1', '2017-05-06 14:31:41', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2580', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-06 14:31:46', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2581', '002', '安装班级获取学生列表', '127.0.0.1', '2017-05-06 14:31:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2582', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 14:32:38', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2583', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 14:32:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2584', '002', '获取所有的学院', '127.0.0.1', '2017-05-06 14:32:46', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2585', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-06 14:32:52', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2586', '002', '安装班级获取学生列表', '127.0.0.1', '2017-05-06 14:32:57', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2587', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 14:49:08', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2588', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 14:49:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2589', '002', '获取所有的学院', '127.0.0.1', '2017-05-06 14:49:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2590', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-06 14:49:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2591', '002', '安装班级获取学生列表', '127.0.0.1', '2017-05-06 14:49:27', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2592', '002', '添加学生到课程', '127.0.0.1', '2017-05-06 14:49:36', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2593', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 14:49:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2594', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 14:49:57', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2595', '002', '登陆', '127.0.0.1', '2017-05-06 15:20:40', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2596', '002', '获取最新公告', '127.0.0.1', '2017-05-06 15:20:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2597', '002', '获取用户信息', '127.0.0.1', '2017-05-06 15:20:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2598', '002', '查询父级菜单', '127.0.0.1', '2017-05-06 15:20:47', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2599', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 15:20:54', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2600', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 15:20:58', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2601', '002', '获取所有的学院', '127.0.0.1', '2017-05-06 15:21:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2602', '002', '获取所有的学院', '127.0.0.1', '2017-05-06 15:21:03', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2603', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-06 15:21:04', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2604', '002', '安装班级获取学生列表', '127.0.0.1', '2017-05-06 15:21:09', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2605', '002', '验证是否已经有该学生', '127.0.0.1', '2017-05-06 15:21:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2606', '002', '验证是否已经有该学生', '127.0.0.1', '2017-05-06 15:21:28', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2607', '002', '验证是否已经有该学生', '127.0.0.1', '2017-05-06 15:21:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2608', '002', '登陆', '127.0.0.1', '2017-05-06 15:30:55', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2609', '002', '获取用户信息', '127.0.0.1', '2017-05-06 15:31:01', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2610', '002', '获取最新公告', '127.0.0.1', '2017-05-06 15:31:01', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2611', '002', '查询父级菜单', '127.0.0.1', '2017-05-06 15:31:04', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2612', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 15:32:13', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2613', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 15:32:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2614', '002', '获取所有的学院', '127.0.0.1', '2017-05-06 15:32:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2615', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-06 15:32:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2616', '002', '安装班级获取学生列表', '127.0.0.1', '2017-05-06 15:32:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2617', '002', '验证是否已经有该学生', '127.0.0.1', '2017-05-06 15:32:39', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2618', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 15:33:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2619', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 15:34:03', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2620', '002', '获取所有的学院', '127.0.0.1', '2017-05-06 15:34:04', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2621', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-06 15:34:08', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2622', '002', '安装班级获取学生列表', '127.0.0.1', '2017-05-06 15:34:13', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2623', '002', '验证是否已经有该学生', '127.0.0.1', '2017-05-06 15:34:22', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2624', '002', '添加学生到课程', '127.0.0.1', '2017-05-06 15:34:27', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2625', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 15:34:56', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2626', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 15:35:01', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2627', '002', '获取所有的学院', '127.0.0.1', '2017-05-06 15:35:06', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2628', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-06 15:35:11', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2629', '002', '安装班级获取学生列表', '127.0.0.1', '2017-05-06 15:35:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2630', '002', '验证是否已经有该学生', '127.0.0.1', '2017-05-06 15:35:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2631', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 15:37:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2632', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 15:37:25', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2633', '002', '获取所有的学院', '127.0.0.1', '2017-05-06 15:37:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2634', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 15:37:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2635', '002', '获取所有的学院', '127.0.0.1', '2017-05-06 15:37:40', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2636', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-06 15:37:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2637', '002', '安装班级获取学生列表', '127.0.0.1', '2017-05-06 15:37:46', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2638', '002', '验证是否已经有该学生', '127.0.0.1', '2017-05-06 15:37:54', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2639', '002', '验证是否已经有该学生', '127.0.0.1', '2017-05-06 15:38:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2640', '002', '验证是否已经有该学生', '127.0.0.1', '2017-05-06 15:38:24', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2641', '002', '验证是否已经有该学生', '127.0.0.1', '2017-05-06 15:39:12', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2642', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 15:40:07', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2643', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 15:40:12', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2644', '002', '获取所有的学院', '127.0.0.1', '2017-05-06 15:40:13', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2645', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-06 15:40:17', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2646', '002', '安装班级获取学生列表', '127.0.0.1', '2017-05-06 15:40:22', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2647', '002', '验证是否已经有该学生', '127.0.0.1', '2017-05-06 15:40:29', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2648', '002', '验证是否已经有该学生', '127.0.0.1', '2017-05-06 15:41:10', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2649', '002', '添加学生到课程', '127.0.0.1', '2017-05-06 15:41:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2650', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 15:41:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2651', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 15:45:10', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2652', '002', '查询子级菜单', '127.0.0.1', '2017-05-06 15:45:13', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2653', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 15:45:17', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2654', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 15:45:23', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2655', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 15:45:25', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2656', '002', '获取所有的学院', '127.0.0.1', '2017-05-06 15:45:29', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2657', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-06 15:45:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2658', '002', '安装班级获取学生列表', '127.0.0.1', '2017-05-06 15:45:38', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2659', '002', '验证是否已经有该学生', '127.0.0.1', '2017-05-06 15:45:45', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2660', '002', '添加学生到课程', '127.0.0.1', '2017-05-06 15:45:49', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2661', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 15:45:52', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2662', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 15:46:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2663', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 15:46:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2664', '002', '获取所有的学院', '127.0.0.1', '2017-05-06 15:46:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2665', '002', '获取学院下对应的班级', '127.0.0.1', '2017-05-06 15:46:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2666', '002', '安装班级获取学生列表', '127.0.0.1', '2017-05-06 15:46:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2667', '002', '验证是否已经有该学生', '127.0.0.1', '2017-05-06 15:46:41', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2668', '002', '添加学生到课程', '127.0.0.1', '2017-05-06 15:46:56', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2669', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 15:47:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2670', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 15:59:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2671', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 15:59:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2672', '002', '验证是否已经有该学生', '127.0.0.1', '2017-05-06 15:59:38', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2673', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 16:00:10', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2674', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 16:00:17', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2675', '002', '验证是否已经有该学生', '127.0.0.1', '2017-05-06 16:01:02', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2676', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 16:01:50', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2677', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 16:01:54', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2678', '002', '验证是否已经有该学生', '127.0.0.1', '2017-05-06 16:02:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2679', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 16:03:37', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2680', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 16:03:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2681', '002', '验证是否已经有该学生', '127.0.0.1', '2017-05-06 16:04:02', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2682', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 16:04:50', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2683', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 16:04:55', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2684', '002', '验证是否已经有该学生', '127.0.0.1', '2017-05-06 16:05:28', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2685', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-05-06 16:05:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2686', '002', '获取公告|queryanouncement', '127.0.0.1', '2017-05-06 16:28:36', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2687', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 16:28:37', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2688', '001', '登陆', '127.0.0.1', '2017-05-06 16:29:34', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2689', '001', '获取最新公告', '127.0.0.1', '2017-05-06 16:29:38', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2690', '001', '获取用户信息', '127.0.0.1', '2017-05-06 16:29:38', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2691', '001', '查询父级菜单', '127.0.0.1', '2017-05-06 16:29:42', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2692', '001', '获取实验安排的科目', '127.0.0.1', '2017-05-06 16:29:48', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2693', '001', '查询子级菜单', '127.0.0.1', '2017-05-06 16:29:57', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2694', '001', '查询课程表的数量', '127.0.0.1', '2017-05-06 16:30:02', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2695', '001', '获取课程表', '127.0.0.1', '2017-05-06 16:30:02', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2696', '001', '获取实验安排的科目', '127.0.0.1', '2017-05-06 16:30:10', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2697', '001', '查询成绩的数量', '127.0.0.1', '2017-05-06 16:30:12', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2698', '001', '查询子级菜单', '127.0.0.1', '2017-05-06 16:30:19', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2699', '001', '获取课程表', '127.0.0.1', '2017-05-06 16:30:21', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2700', '001', '查询课程表的数量', '127.0.0.1', '2017-05-06 16:30:21', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2701', '001', '查询成绩的数量', '127.0.0.1', '2017-05-06 16:30:26', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2702', '001', '查询子级菜单', '127.0.0.1', '2017-05-06 16:33:11', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2703', '001', '获取课程表', '127.0.0.1', '2017-05-06 16:33:13', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2704', '001', '查询课程表的数量', '127.0.0.1', '2017-05-06 16:33:13', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2705', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 16:38:18', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2706', '001', '查询子级菜单', '127.0.0.1', '2017-05-06 16:38:21', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2707', '001', '查询课程表的数量', '127.0.0.1', '2017-05-06 16:38:22', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2708', '001', '获取课程表', '127.0.0.1', '2017-05-06 16:38:22', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2709', '001', '查询子级菜单', '127.0.0.1', '2017-05-06 16:38:30', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2710', '001', '查询课程表的数量', '127.0.0.1', '2017-05-06 16:38:31', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2711', '001', '获取课程表', '127.0.0.1', '2017-05-06 16:38:31', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2712', '001', '查询成绩的数量', '127.0.0.1', '2017-05-06 16:38:33', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2713', '001', '查询成绩的数量', '127.0.0.1', '2017-05-06 16:38:36', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2714', '001', '查询子级菜单', '127.0.0.1', '2017-05-06 16:38:38', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2715', '001', '查询课程表的数量', '127.0.0.1', '2017-05-06 16:40:56', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2716', '001', '获取课程表', '127.0.0.1', '2017-05-06 16:40:56', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2717', '001', '查询子级菜单', '127.0.0.1', '2017-05-06 16:40:59', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2718', '001', '查询课程表的数量', '127.0.0.1', '2017-05-06 16:41:00', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2719', '001', '获取课程表', '127.0.0.1', '2017-05-06 16:41:00', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2720', '001', '查询成绩的数量', '127.0.0.1', '2017-05-06 16:41:04', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2721', '001', '查询成绩的数量', '127.0.0.1', '2017-05-06 16:41:24', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2722', '002', '获取所有实验课程', '127.0.0.1', '2017-05-06 16:42:08', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2723', '001', '查询成绩的数量', '127.0.0.1', '2017-05-06 16:42:14', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2724', '001', '获取实验安排的科目', '127.0.0.1', '2017-05-06 16:42:28', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2725', '001', '登陆', '127.0.0.1', '2017-05-06 18:41:28', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2726', '001', '获取用户信息', '127.0.0.1', '2017-05-06 18:41:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2727', '001', '获取最新公告', '127.0.0.1', '2017-05-06 18:41:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2728', '001', '查询父级菜单', '127.0.0.1', '2017-05-06 18:41:38', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2729', '001', '登陆', '127.0.0.1', '2017-05-06 20:24:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2730', '001', '获取用户信息', '127.0.0.1', '2017-05-06 20:24:27', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2731', '001', '获取最新公告', '127.0.0.1', '2017-05-06 20:24:27', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2732', '001', '查询父级菜单', '127.0.0.1', '2017-05-06 20:24:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2733', 'developer', '登陆', '127.0.0.1', '2017-05-06 20:27:11', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2734', 'developer', '获取用户信息', '127.0.0.1', '2017-05-06 20:27:17', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2735', 'developer', '获取最新公告', '127.0.0.1', '2017-05-06 20:27:17', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2736', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-06 20:27:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2737', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-06 20:27:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2738', null, '登陆', '127.0.0.1', '2017-05-06 20:32:11', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2739', '001', '登陆', '127.0.0.1', '2017-05-06 20:32:25', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2740', '001', '获取用户信息', '127.0.0.1', '2017-05-06 20:32:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2741', '001', '获取最新公告', '127.0.0.1', '2017-05-06 20:32:32', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2742', '001', '查询父级菜单', '127.0.0.1', '2017-05-06 20:32:36', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2743', '001', '查询子级菜单', '127.0.0.1', '2017-05-06 20:32:47', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2744', null, '登陆', '127.0.0.1', '2017-05-06 20:35:28', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2745', 'developer', '登陆', '127.0.0.1', '2017-05-06 20:35:38', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2746', 'developer', '获取用户信息', '127.0.0.1', '2017-05-06 20:35:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2747', 'developer', '获取最新公告', '127.0.0.1', '2017-05-06 20:35:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2748', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-06 20:35:48', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2749', 'developer', '登陆', '127.0.0.1', '2017-05-06 20:41:38', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2750', 'developer', '获取用户信息', '127.0.0.1', '2017-05-06 20:41:45', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2751', 'developer', '获取最新公告', '127.0.0.1', '2017-05-06 20:41:45', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2752', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-06 20:41:49', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2753', 'developer', '登陆', '127.0.0.1', '2017-05-06 20:42:22', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2754', 'developer', '获取用户信息', '127.0.0.1', '2017-05-06 20:42:28', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2755', 'developer', '获取最新公告', '127.0.0.1', '2017-05-06 20:42:28', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2756', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-06 20:42:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2757', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-06 20:43:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2758', 'developer', '获取人员类型', '127.0.0.1', '2017-05-06 20:43:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2759', 'developer', '获取父级菜单', '127.0.0.1', '2017-05-06 20:43:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2760', 'developer', '登陆', '127.0.0.1', '2017-05-06 22:12:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2761', 'developer', '获取用户信息', '127.0.0.1', '2017-05-06 22:12:29', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2762', 'developer', '获取最新公告', '127.0.0.1', '2017-05-06 22:12:29', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2763', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-06 22:12:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2764', 'developer', '登陆', '127.0.0.1', '2017-05-06 22:12:40', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2765', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-06 22:12:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2766', 'developer', '获取最新公告', '127.0.0.1', '2017-05-06 22:12:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2767', 'developer', '获取用户信息', '127.0.0.1', '2017-05-06 22:12:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2768', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-06 22:12:48', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2769', 'developer', '登陆', '127.0.0.1', '2017-05-06 22:25:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2770', 'developer', '获取用户信息', '127.0.0.1', '2017-05-06 22:26:07', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2771', 'developer', '获取最新公告', '127.0.0.1', '2017-05-06 22:26:07', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2772', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-06 22:26:11', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2773', 'developer', '登陆', '127.0.0.1', '2017-05-06 22:26:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2774', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-06 22:26:22', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2775', 'developer', '登陆', '127.0.0.1', '2017-05-06 22:26:23', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2776', 'developer', '获取用户信息', '127.0.0.1', '2017-05-06 22:26:27', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2777', 'developer', '获取最新公告', '127.0.0.1', '2017-05-06 22:26:27', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2778', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-06 22:26:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2779', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-06 22:28:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2780', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-06 22:28:38', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2781', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-06 22:28:40', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2782', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-06 22:28:41', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2783', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-06 22:28:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2784', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-06 22:28:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2785', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-06 22:28:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2786', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-06 22:28:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2787', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-06 22:28:45', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2788', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-06 22:28:46', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2789', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-06 22:28:48', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2790', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-06 22:28:50', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2791', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-06 22:28:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2792', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-06 22:28:52', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2793', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-06 22:28:54', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2794', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-06 22:29:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2795', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-06 22:29:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2796', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-06 22:29:07', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2797', 'developer', '登陆', '127.0.0.1', '2017-05-06 22:37:27', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2798', 'developer', '获取用户信息', '127.0.0.1', '2017-05-06 22:37:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2799', 'developer', '获取最新公告', '127.0.0.1', '2017-05-06 22:37:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2800', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-06 22:37:38', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2801', 'developer', '登陆', '127.0.0.1', '2017-05-06 22:37:46', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2802', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-06 22:37:48', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2803', 'developer', '登陆', '127.0.0.1', '2017-05-06 22:37:49', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2804', 'developer', '获取最新公告', '127.0.0.1', '2017-05-06 22:37:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2805', 'developer', '获取用户信息', '127.0.0.1', '2017-05-06 22:37:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2806', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-06 22:37:57', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2807', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-06 22:38:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2808', 'developer', '获取所有学院', '127.0.0.1', '2017-05-06 22:38:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2809', 'developer', '获取用户信息|getAllUser', '127.0.0.1', '2017-05-06 22:38:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2810', 'developer', '获取用户的数量|getUserCount', '127.0.0.1', '2017-05-06 22:38:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2811', 'developer', '获取人员类型', '127.0.0.1', '2017-05-06 22:38:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2812', 'developer', '获取用户信息|getAllUser', '127.0.0.1', '2017-05-06 22:39:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2813', 'developer', '获取用户信息|getAllUser', '127.0.0.1', '2017-05-06 22:39:29', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2814', 'developer', '登陆', '127.0.0.1', '2017-05-06 22:40:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2815', 'developer', '获取用户信息', '127.0.0.1', '2017-05-06 22:40:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2816', 'developer', '获取最新公告', '127.0.0.1', '2017-05-06 22:40:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2817', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-06 22:40:38', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2818', 'developer', '登陆', '127.0.0.1', '2017-05-06 22:41:13', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2819', 'developer', '获取用户信息', '127.0.0.1', '2017-05-06 22:41:18', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2820', 'developer', '获取最新公告', '127.0.0.1', '2017-05-06 22:41:18', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2821', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-06 22:41:22', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2822', 'developer', '登陆', '127.0.0.1', '2017-05-07 12:17:52', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2823', 'developer', '获取最新公告', '127.0.0.1', '2017-05-07 12:17:58', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2824', 'developer', '获取用户信息', '127.0.0.1', '2017-05-07 12:17:58', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2825', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-07 12:18:02', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2826', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-07 12:18:07', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2827', 'developer', '登陆', '127.0.0.1', '2017-05-07 12:19:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2828', 'developer', '获取用户信息', '127.0.0.1', '2017-05-07 12:19:41', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2829', 'developer', '获取最新公告', '127.0.0.1', '2017-05-07 12:19:41', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2830', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-07 12:19:45', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2831', 'developer', '登陆', '127.0.0.1', '2017-05-07 12:20:14', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2832', 'developer', '获取用户信息', '127.0.0.1', '2017-05-07 12:20:18', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2833', 'developer', '获取最新公告', '127.0.0.1', '2017-05-07 12:20:18', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2834', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-07 12:20:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2835', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-07 12:23:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2836', 'developer', '获取人员类型', '127.0.0.1', '2017-05-07 12:23:29', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2837', 'developer', '获取用户的数量|getUserCount', '127.0.0.1', '2017-05-07 12:23:29', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2838', 'developer', '获取用户信息|getAllUser', '127.0.0.1', '2017-05-07 12:23:29', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2839', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-07 12:24:02', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2840', 'developer', '获取用户信息|getAllUser', '127.0.0.1', '2017-05-07 12:24:02', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2841', 'developer', '获取人员类型', '127.0.0.1', '2017-05-07 12:24:03', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2842', 'developer', '获取所有学院', '127.0.0.1', '2017-05-07 12:24:03', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2843', 'developer', '获取用户的数量|getUserCount', '127.0.0.1', '2017-05-07 12:24:03', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2844', '001', '登陆', '192.168.0.6', '2017-05-07 12:27:39', 'IE', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 10.0; WOW64; Trident/8.0; .NET4.0C; .NET4.0E; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729; InfoPath.2)', '192.168.0.6', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('2845', '001', '获取最新公告', '192.168.0.6', '2017-05-07 12:27:43', 'IE', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 10.0; WOW64; Trident/8.0; .NET4.0C; .NET4.0E; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729; InfoPath.2)', '192.168.0.6', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('2846', '001', '获取用户信息', '192.168.0.6', '2017-05-07 12:27:43', 'IE', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 10.0; WOW64; Trident/8.0; .NET4.0C; .NET4.0E; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729; InfoPath.2)', '192.168.0.6', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('2847', '001', '登陆', '192.168.0.6', '2017-05-07 12:29:27', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '192.168.0.6', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('2848', '001', '获取最新公告', '192.168.0.6', '2017-05-07 12:29:31', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '192.168.0.6', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('2849', '001', '获取用户信息', '192.168.0.6', '2017-05-07 12:29:31', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '192.168.0.6', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('2850', '001', '查询父级菜单', '192.168.0.6', '2017-05-07 12:29:34', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '192.168.0.6', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('2851', '001', '查询子级菜单', '192.168.0.6', '2017-05-07 12:30:19', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '192.168.0.6', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('2852', '001', '查询子级菜单', '192.168.0.6', '2017-05-07 12:30:22', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '192.168.0.6', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('2853', '001', '查询子级菜单', '192.168.0.6', '2017-05-07 12:30:22', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '192.168.0.6', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('2854', '001', '查询子级菜单', '192.168.0.6', '2017-05-07 12:30:22', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '192.168.0.6', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('2855', '001', '查询子级菜单', '192.168.0.6', '2017-05-07 12:30:23', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '192.168.0.6', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('2856', '001', '查询子级菜单', '192.168.0.6', '2017-05-07 12:30:24', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '192.168.0.6', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('2857', '001', '查看资源列表', '192.168.0.6', '2017-05-07 12:30:29', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '192.168.0.6', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('2858', '001', '查看资源详细信息', '192.168.0.6', '2017-05-07 12:30:36', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '192.168.0.6', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('2859', '001', '查看资源详细信息', '192.168.0.6', '2017-05-07 12:30:36', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '192.168.0.6', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('2860', '001', '查看资源详细信息', '192.168.0.6', '2017-05-07 12:30:45', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '192.168.0.6', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('2861', '001', '查看资源详细信息', '192.168.0.6', '2017-05-07 12:30:45', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '192.168.0.6', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('2862', '001', '查看资源列表', '192.168.0.6', '2017-05-07 12:30:52', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '192.168.0.6', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('2863', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-07 12:31:48', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2864', null, '退出', '127.0.0.1', '2017-05-07 22:01:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2865', '002', '登陆', '127.0.0.1', '2017-05-07 22:01:46', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2866', '002', '获取用户信息', '127.0.0.1', '2017-05-07 22:01:49', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2867', '002', '获取最新公告', '127.0.0.1', '2017-05-07 22:01:49', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2868', '002', '查询父级菜单', '127.0.0.1', '2017-05-07 22:01:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2869', '002', '获取所有实验课程', '127.0.0.1', '2017-05-07 22:02:09', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2870', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:02:09', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2871', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:02:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2872', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:03:06', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2873', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:03:57', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2874', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:04:27', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2875', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:04:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2876', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:04:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2877', '002', '获取所有实验课程', '127.0.0.1', '2017-05-07 22:04:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2878', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:04:39', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2879', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:05:40', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2880', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:06:29', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2881', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:06:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2882', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:06:54', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2883', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:07:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2884', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:07:37', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2885', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:08:01', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2886', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:08:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2887', '002', '获取所有实验课程', '127.0.0.1', '2017-05-07 22:09:56', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2888', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:09:57', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2889', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:09:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2890', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:10:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2891', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:11:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2892', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:12:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2893', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:12:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2894', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:12:24', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2895', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:12:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2896', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:14:41', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2897', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:14:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2898', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:14:55', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2899', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:15:38', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2900', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:16:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2901', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:16:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2902', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:16:48', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2903', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:17:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2904', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:18:57', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2905', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:19:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2906', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:19:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2907', '002', '获取所有实验课程', '127.0.0.1', '2017-05-07 22:19:08', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2908', '002', '获取公告|queryanouncement', '127.0.0.1', '2017-05-07 22:19:09', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2909', '002', '获取所有实验课程', '127.0.0.1', '2017-05-07 22:19:09', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2910', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:19:12', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2911', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:19:13', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2912', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:19:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2913', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:19:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2914', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:19:17', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2915', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:19:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2916', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:20:06', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2917', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:20:09', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2918', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:20:28', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2919', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:20:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2920', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:21:28', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2921', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:21:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2922', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:23:23', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2923', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:23:25', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2924', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:24:32', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2925', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:24:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2926', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:25:07', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2927', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:25:08', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2928', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:25:09', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2929', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:28:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2930', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:28:27', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2931', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:29:45', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2932', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:29:47', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2933', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:30:14', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2934', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:30:17', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2935', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:34:09', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2936', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:34:10', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2937', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:35:07', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2938', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:35:08', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2939', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:35:18', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2940', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:35:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2941', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:40:11', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2942', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:40:13', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2943', '002', '登陆', '127.0.0.1', '2017-05-07 22:51:23', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2944', '002', '获取用户信息', '127.0.0.1', '2017-05-07 22:51:27', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2945', '002', '获取最新公告', '127.0.0.1', '2017-05-07 22:51:27', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2946', '002', '查询父级菜单', '127.0.0.1', '2017-05-07 22:51:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2947', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:51:37', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2948', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:51:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2949', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:52:06', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2950', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:52:07', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2951', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:52:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2952', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:52:37', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2953', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:52:46', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2954', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:52:50', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2955', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:52:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2956', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:52:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2957', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:53:14', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2958', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:53:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2959', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:53:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2960', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:53:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2961', '002', '获取所有实验课程', '127.0.0.1', '2017-05-07 22:53:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2962', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:53:40', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2963', '002', '查询码值中的week', '127.0.0.1', '2017-05-07 22:53:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2964', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:53:50', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2965', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:53:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2966', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:54:01', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2967', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:54:03', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2968', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:54:07', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2969', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:54:11', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2970', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:54:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2971', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:54:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2972', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:54:22', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2973', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:54:24', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2974', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:54:25', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2975', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:54:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2976', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:54:36', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2977', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:54:37', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2978', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:54:38', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2979', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:54:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2980', '002', '获取用户信息', '127.0.0.1', '2017-05-07 22:54:45', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2981', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:54:47', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2982', '002', '查询子级菜单', '127.0.0.1', '2017-05-07 22:54:49', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2983', '002', '获取用户信息', '127.0.0.1', '2017-05-07 22:54:50', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2984', '002', '获取公告|queryanouncement', '127.0.0.1', '2017-05-07 22:55:01', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2985', '002', '获取所有实验课程', '127.0.0.1', '2017-05-07 22:55:03', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2986', 'developer', '登陆', '127.0.0.1', '2017-05-07 22:55:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2987', 'developer', '获取用户信息', '127.0.0.1', '2017-05-07 22:55:24', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2988', 'developer', '获取最新公告', '127.0.0.1', '2017-05-07 22:55:24', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2989', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-07 22:55:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2990', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-07 22:55:39', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2991', 'developer', '获取人员类型', '127.0.0.1', '2017-05-07 22:55:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2992', 'developer', '获取用户信息|getAllUser', '127.0.0.1', '2017-05-07 22:55:45', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2993', 'developer', '获取用户的数量|getUserCount', '127.0.0.1', '2017-05-07 22:55:45', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2994', 'developer', '获取所有学院', '127.0.0.1', '2017-05-07 22:55:45', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2995', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-07 22:55:45', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2996', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-07 22:55:49', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2997', 'developer', '获取用户的数量|getUserCount', '127.0.0.1', '2017-05-07 22:55:50', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2998', 'developer', '获取人员类型', '127.0.0.1', '2017-05-07 22:55:50', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('2999', 'developer', '获取用户信息|getAllUser', '127.0.0.1', '2017-05-07 22:55:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3000', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-07 22:55:52', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3001', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-07 22:55:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3002', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-07 22:55:55', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3003', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-07 22:55:56', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3004', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-07 22:55:56', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3005', 'developer', '获取父级菜单', '127.0.0.1', '2017-05-07 22:55:58', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3006', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-07 22:55:58', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3007', 'developer', '获取人员类型', '127.0.0.1', '2017-05-07 22:55:58', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3008', 'developer', '获取人员类型', '127.0.0.1', '2017-05-07 22:56:01', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3009', 'developer', '获取菜单数量', '127.0.0.1', '2017-05-07 22:56:01', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3010', 'developer', '查询所有菜单', '127.0.0.1', '2017-05-07 22:56:01', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3011', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-07 22:56:08', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3012', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-07 22:56:11', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3013', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-07 22:56:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3014', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-07 22:56:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3015', 'developer', '获取用户信息|getAllUser', '127.0.0.1', '2017-05-07 22:56:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3016', 'developer', '获取人员类型', '127.0.0.1', '2017-05-07 22:56:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3017', 'developer', '获取所有学院', '127.0.0.1', '2017-05-07 22:56:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3018', 'developer', '获取用户的数量|getUserCount', '127.0.0.1', '2017-05-07 22:56:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3019', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-07 22:56:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3020', 'developer', '获取用户信息|getAllUser', '127.0.0.1', '2017-05-07 22:56:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3021', 'developer', '获取人员类型', '127.0.0.1', '2017-05-07 22:56:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3022', 'developer', '获取用户的数量|getUserCount', '127.0.0.1', '2017-05-07 22:56:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3023', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-07 22:56:38', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3024', 'developer', '获取人员类型', '127.0.0.1', '2017-05-07 22:56:39', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3025', 'developer', '获取菜单数量', '127.0.0.1', '2017-05-07 22:56:39', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3026', 'developer', '查询所有菜单', '127.0.0.1', '2017-05-07 22:56:39', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3027', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-07 22:57:04', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3028', 'developer', '获取人员类型', '127.0.0.1', '2017-05-07 22:57:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3029', 'developer', '获取用户信息|getAllUser', '127.0.0.1', '2017-05-07 22:57:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3030', 'developer', '获取用户的数量|getUserCount', '127.0.0.1', '2017-05-07 22:57:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3031', 'developer', '登陆', '127.0.0.1', '2017-05-08 11:26:14', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3032', 'developer', '获取用户信息', '127.0.0.1', '2017-05-08 11:26:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3033', 'developer', '获取最新公告', '127.0.0.1', '2017-05-08 11:26:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3034', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-08 11:26:25', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3035', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 11:26:32', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3036', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 11:27:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3037', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 11:27:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3038', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 11:29:17', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3039', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 11:29:18', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3040', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 11:29:18', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3041', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 11:36:12', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3042', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 11:36:14', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3043', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 11:36:14', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3044', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 11:36:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3045', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 11:36:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3046', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 11:36:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3047', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 11:37:13', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3048', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 11:37:14', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3049', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 11:37:14', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3050', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 11:37:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3051', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 11:37:32', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3052', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 11:37:32', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3053', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 11:38:04', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3054', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 11:38:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3055', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 11:38:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3056', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 11:38:23', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3057', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 11:38:24', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3058', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 11:38:24', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3059', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 11:38:48', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3060', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 11:38:49', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3061', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 11:38:49', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3062', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 11:41:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3063', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 11:41:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3064', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 11:41:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3065', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 11:42:04', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3066', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 11:42:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3067', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 11:42:06', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3068', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 11:43:09', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3069', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 11:43:10', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3070', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 11:43:11', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3071', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 12:00:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3072', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 12:00:28', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3073', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 12:00:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3074', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 12:00:32', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3075', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 12:00:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3076', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 12:02:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3077', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 12:02:45', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3078', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 12:02:47', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3079', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 12:03:01', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3080', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 12:03:02', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3081', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 12:03:08', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3082', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 12:04:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3083', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 12:04:47', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3084', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 12:04:47', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3085', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 12:04:50', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3086', 'developer', '登陆', '127.0.0.1', '2017-05-08 12:40:38', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('3087', 'developer', '获取用户信息', '127.0.0.1', '2017-05-08 12:40:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('3088', 'developer', '获取最新公告', '127.0.0.1', '2017-05-08 12:40:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('3089', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-08 12:40:46', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('3090', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 12:41:01', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('3091', 'developer', '获取异常日志数量', '127.0.0.1', '2017-05-08 12:41:06', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('3092', 'developer', '获取异常日志信息', '127.0.0.1', '2017-05-08 12:41:06', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('3093', 'developer', '登陆', '127.0.0.1', '2017-05-08 12:45:55', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('3094', 'developer', '获取用户信息', '127.0.0.1', '2017-05-08 12:45:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('3095', 'developer', '获取最新公告', '127.0.0.1', '2017-05-08 12:45:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('3096', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-08 12:46:02', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('3097', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 12:46:07', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('3098', 'developer', '获取异常日志信息', '127.0.0.1', '2017-05-08 12:46:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('3099', 'developer', '获取异常日志数量', '127.0.0.1', '2017-05-08 12:46:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('3100', 'developer', '登陆', '127.0.0.1', '2017-05-08 12:55:18', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('3101', 'developer', '获取用户信息', '127.0.0.1', '2017-05-08 12:55:22', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('3102', 'developer', '获取最新公告', '127.0.0.1', '2017-05-08 12:55:22', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('3103', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-08 12:55:25', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('3104', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 12:55:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('3105', 'developer', '获取异常日志数量', '127.0.0.1', '2017-05-08 12:56:22', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3106', 'developer', '获取异常日志信息', '127.0.0.1', '2017-05-08 12:56:22', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3107', 'developer', '登陆', '127.0.0.1', '2017-05-08 13:57:07', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3108', 'developer', '获取用户信息', '127.0.0.1', '2017-05-08 13:57:12', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3109', 'developer', '获取最新公告', '127.0.0.1', '2017-05-08 13:57:12', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3110', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-08 13:57:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3111', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 13:57:29', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3112', 'developer', '获取异常日志数量', '127.0.0.1', '2017-05-08 13:57:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3113', 'developer', '获取异常日志信息', '127.0.0.1', '2017-05-08 13:57:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3114', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 14:00:14', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3115', 'developer', '获取异常日志数量', '127.0.0.1', '2017-05-08 14:00:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3116', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 14:01:28', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3117', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 14:01:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3118', 'developer', '获取日志数量', '127.0.0.1', '2017-05-08 14:01:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3119', 'developer', '获取日志信息', '127.0.0.1', '2017-05-08 14:01:32', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3120', 'developer', '获取异常日志数量', '127.0.0.1', '2017-05-08 14:01:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3121', 'developer', '获取异常日志信息', '127.0.0.1', '2017-05-08 14:01:46', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3122', 'developer', '获取异常日志信息', '127.0.0.1', '2017-05-08 14:02:01', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3123', 'developer', '登陆', '127.0.0.1', '2017-05-08 14:04:07', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3124', 'developer', '获取最新公告', '127.0.0.1', '2017-05-08 14:04:11', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3125', 'developer', '获取用户信息', '127.0.0.1', '2017-05-08 14:04:11', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3126', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-08 14:04:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3127', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 14:04:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3128', 'developer', '获取异常日志数量', '127.0.0.1', '2017-05-08 14:04:56', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3129', 'developer', '获取异常日志信息', '127.0.0.1', '2017-05-08 14:04:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3130', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 14:07:14', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3131', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 14:07:14', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3132', 'developer', '查询码表', '127.0.0.1', '2017-05-08 14:07:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3133', 'developer', '获取码表的数量', '127.0.0.1', '2017-05-08 14:07:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3134', 'developer', '查询码表', '127.0.0.1', '2017-05-08 14:07:28', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3135', 'developer', '登陆', '127.0.0.1', '2017-05-08 15:16:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3136', 'developer', '获取用户信息', '127.0.0.1', '2017-05-08 15:16:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3137', 'developer', '获取最新公告', '127.0.0.1', '2017-05-08 15:16:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3138', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-08 15:16:22', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3139', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:17:32', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3140', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 15:17:37', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3141', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 15:17:37', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3142', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:18:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3143', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:18:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3144', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 15:18:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3145', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 15:18:22', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3146', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:19:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3147', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 15:19:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3148', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 15:19:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3149', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:20:40', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3150', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 15:20:41', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3151', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 15:20:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3152', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:21:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3153', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 15:21:52', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3154', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 15:21:52', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'ff-ff-ff-ff-ff-ff');
INSERT INTO `sy17` VALUES ('3155', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:35:41', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3156', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:35:41', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3157', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 15:35:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3158', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 15:35:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3159', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:38:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3160', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 15:38:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3161', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 15:38:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3162', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:38:49', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3163', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:38:50', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3164', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 15:38:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3165', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 15:38:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3166', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:39:40', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3167', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 15:39:41', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3168', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 15:39:41', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3169', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:40:22', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3170', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 15:40:23', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3171', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 15:40:23', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3172', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:40:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3173', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 15:40:54', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3174', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 15:40:54', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3175', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:43:25', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3176', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 15:43:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3177', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 15:43:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3178', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:44:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3179', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 15:44:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3180', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 15:44:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3181', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:44:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3182', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 15:44:54', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3183', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 15:44:54', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3184', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:45:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3185', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:45:17', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3186', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 15:45:18', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3187', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 15:45:18', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3188', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:45:28', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3189', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 15:45:29', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3190', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 15:45:29', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3191', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:45:55', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3192', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 15:45:56', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3193', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 15:45:56', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3194', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:46:12', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3195', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 15:46:13', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3196', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 15:46:13', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3197', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 15:46:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3198', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 15:47:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3199', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 15:47:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3200', 'developer', '登陆', '127.0.0.1', '2017-05-08 17:36:45', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3201', 'developer', '获取最新公告', '127.0.0.1', '2017-05-08 17:36:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3202', 'developer', '获取用户信息', '127.0.0.1', '2017-05-08 17:36:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3203', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-08 17:36:56', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3204', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 17:37:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3205', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 17:37:25', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3206', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 17:37:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3207', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 17:37:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3208', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 17:37:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3209', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 17:38:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3210', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 17:38:58', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3211', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 17:38:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3212', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 17:38:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3213', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 17:39:01', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3214', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 17:39:01', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3215', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 17:40:29', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3216', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 17:43:36', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3217', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 17:44:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3218', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 17:44:18', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3219', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 17:44:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3220', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 17:44:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3221', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 17:44:27', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3222', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 17:44:27', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3223', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 17:44:39', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3224', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 17:44:39', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3225', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 17:44:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3226', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 17:44:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3227', null, '退出', '127.0.0.1', '2017-05-08 17:46:57', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3228', 'developer', '登陆', '127.0.0.1', '2017-05-08 17:48:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3229', 'developer', '获取最新公告', '127.0.0.1', '2017-05-08 17:48:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3230', 'developer', '获取用户信息', '127.0.0.1', '2017-05-08 17:48:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3231', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-08 17:48:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3232', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 17:48:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', '84-5b-12-4a-bc-3e');
INSERT INTO `sy17` VALUES ('3233', 'developer', '登陆', '127.0.0.1', '2017-05-08 21:25:58', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3234', 'developer', '获取最新公告', '127.0.0.1', '2017-05-08 21:26:08', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3235', 'developer', '获取用户信息', '127.0.0.1', '2017-05-08 21:26:08', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3236', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-08 21:26:12', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3237', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 21:26:23', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3238', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 21:26:28', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3239', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 21:27:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3240', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 21:27:37', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3241', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 21:27:37', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3242', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 21:27:41', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3243', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 21:27:41', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3244', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 21:36:10', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3245', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 21:36:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3246', 'developer', '查询所有公告', '127.0.0.1', '2017-05-08 21:36:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3247', 'developer', '查询公告数量', '127.0.0.1', '2017-05-08 21:36:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3248', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 21:36:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3249', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 21:36:36', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3250', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 21:36:36', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3251', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 21:36:40', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3252', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 21:36:40', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3253', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 21:36:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3254', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 21:37:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3255', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 21:37:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3256', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 21:37:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3257', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 21:37:36', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3258', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 21:37:36', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3259', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 21:37:39', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3260', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 21:37:41', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3261', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 21:37:47', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3262', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 21:37:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3263', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 21:38:27', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3264', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 21:38:27', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3265', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 21:38:27', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3266', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 21:38:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3267', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 21:38:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3268', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 21:38:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3269', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 21:40:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3270', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 21:40:22', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3271', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 21:40:22', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3272', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 21:40:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3273', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 21:40:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3274', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 21:40:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3275', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 21:41:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3276', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 21:41:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3277', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 21:41:38', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3278', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 21:44:50', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3279', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 21:44:54', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3280', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 21:44:55', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3281', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 21:44:56', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3282', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 21:45:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3283', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 21:45:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3284', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 21:45:04', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3285', 'developer', '审核申请信息', '127.0.0.1', '2017-05-08 21:45:06', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3286', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:45:09', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3287', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 21:50:48', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3288', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 21:50:49', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3289', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 21:50:49', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3290', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 21:50:55', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3291', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 21:50:55', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3292', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 21:50:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3293', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:51:02', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3294', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:51:08', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3295', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:51:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3296', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:51:23', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3297', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 21:51:25', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3298', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 21:51:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3299', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:51:28', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3300', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:51:29', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3301', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:51:29', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3302', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 21:51:36', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3303', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:51:39', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3304', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 21:51:40', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3305', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:51:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3306', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:51:45', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3307', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 21:51:54', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3308', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 21:51:54', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3309', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 21:51:57', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3310', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:52:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3311', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 21:56:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3312', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 21:56:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3313', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 21:56:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3314', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 21:56:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3315', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 21:56:25', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3316', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 21:56:25', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3317', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 21:56:28', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3318', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:56:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3319', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:56:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3320', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 21:57:14', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3321', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 21:57:14', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3322', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 21:57:14', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3323', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 21:57:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3324', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 21:57:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3325', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 21:57:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3326', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:57:22', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3327', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:57:24', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3328', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:57:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3329', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 21:59:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3330', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 21:59:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3331', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 21:59:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3332', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 21:59:36', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3333', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 21:59:36', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3334', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 21:59:39', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3335', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:59:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3336', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:59:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3337', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:59:46', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3338', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:59:47', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3339', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:59:50', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3340', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 21:59:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3341', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:59:55', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3342', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:59:57', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3343', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 21:59:58', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3344', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 21:59:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3345', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 22:00:03', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3346', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 22:00:06', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3347', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 22:02:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3348', 'developer', '获取人员类型', '127.0.0.1', '2017-05-08 22:02:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3349', 'developer', '获取父级菜单', '127.0.0.1', '2017-05-08 22:02:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3350', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 22:02:37', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3351', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 22:02:38', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3352', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 22:02:39', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3353', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 22:02:40', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3354', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 22:02:40', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3355', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 22:02:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3356', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 22:02:46', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3357', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 22:06:56', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3358', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 22:06:56', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3359', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 22:06:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3360', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 22:07:02', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3361', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 22:24:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3362', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 22:24:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3363', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 22:24:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3364', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 22:24:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3365', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 22:24:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3366', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 22:24:39', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3367', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 22:24:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3368', 'developer', '按照id查询用户信息|queryUserById', '127.0.0.1', '2017-05-08 22:24:58', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3369', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 22:26:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3370', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 22:26:17', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3371', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 22:26:18', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3372', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 22:26:18', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3373', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 22:26:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3374', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 22:26:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3375', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 22:26:23', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3376', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 22:26:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3377', 'developer', '按照id查询用户信息|queryUserById', '127.0.0.1', '2017-05-08 22:26:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3378', 'developer', '按照id查询用户信息|queryUserById', '127.0.0.1', '2017-05-08 22:27:58', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3379', 'developer', '按照id查询用户信息|queryUserById', '127.0.0.1', '2017-05-08 22:28:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3380', 'developer', '按照id查询用户信息|queryUserById', '127.0.0.1', '2017-05-08 22:28:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3381', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 22:29:08', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3382', 'developer', '获取人员类型', '127.0.0.1', '2017-05-08 22:29:08', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3383', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 22:29:08', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3384', 'developer', '获取父级菜单', '127.0.0.1', '2017-05-08 22:29:08', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3385', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 22:29:09', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3386', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 22:29:09', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3387', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 22:29:10', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3388', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 22:29:10', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3389', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 22:29:13', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3390', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 22:29:17', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3391', 'developer', '按照id查询用户信息|queryUserById', '127.0.0.1', '2017-05-08 22:29:38', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3392', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 22:29:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3393', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 22:29:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3394', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 22:29:55', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3395', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 22:29:58', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3396', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 22:30:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3397', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 22:30:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3398', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 22:30:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3399', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 22:30:54', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3400', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 22:30:54', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3401', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 22:30:57', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3402', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 22:31:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3403', 'developer', '按照id查询用户信息|queryUserById', '127.0.0.1', '2017-05-08 22:31:02', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3404', 'developer', '获取父级菜单', '127.0.0.1', '2017-05-08 22:33:11', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3405', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 22:33:11', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3406', 'developer', '获取人员类型', '127.0.0.1', '2017-05-08 22:33:11', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3407', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 22:33:11', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3408', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 22:33:12', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3409', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 22:33:13', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3410', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 22:33:14', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3411', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 22:33:14', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3412', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 22:33:17', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3413', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 22:33:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3414', 'developer', '按照id查询用户信息|queryUserById', '127.0.0.1', '2017-05-08 22:33:22', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3415', 'developer', '按照id查询用户信息|queryUserById', '127.0.0.1', '2017-05-08 22:33:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3416', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 22:34:55', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3417', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 22:34:55', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3418', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 22:34:55', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3419', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 22:34:55', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3420', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 22:34:56', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3421', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 22:34:56', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3422', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 22:34:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3423', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 22:35:02', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3424', 'developer', '按照id查询用户信息|queryUserById', '127.0.0.1', '2017-05-08 22:35:06', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3425', 'developer', '按照id查询用户信息|queryUserById', '127.0.0.1', '2017-05-08 22:35:12', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3426', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 22:35:41', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3427', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-08 22:35:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3428', 'developer', '查询所有的实验室申请', '127.0.0.1', '2017-05-08 22:35:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3429', 'developer', '获取实验申请数量', '127.0.0.1', '2017-05-08 22:35:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3430', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 22:35:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3431', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 22:35:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3432', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 22:35:48', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3433', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 22:35:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3434', 'developer', '按照id查询用户信息|queryUserById', '127.0.0.1', '2017-05-08 22:35:52', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3435', 'developer', '按照id查询用户信息|queryUserById', '127.0.0.1', '2017-05-08 22:36:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3436', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-08 22:36:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3437', 'developer', '查询码值中的week', '127.0.0.1', '2017-05-08 22:36:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3438', 'developer', '查询对应类型下的实验室列表', '127.0.0.1', '2017-05-08 22:36:29', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('3439', 'developer', '获取该实验室可以安排的时间', '127.0.0.1', '2017-05-08 22:36:32', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');

-- ----------------------------
-- Table structure for sy18
-- ----------------------------
DROP TABLE IF EXISTS `sy18`;
CREATE TABLE `sy18` (
  `CSY180` int(11) NOT NULL AUTO_INCREMENT COMMENT '异常信息表流水编号',
  `CSY181` varchar(100) DEFAULT NULL COMMENT '异常信息',
  `CSY182` varchar(2000) DEFAULT NULL COMMENT '异常详情',
  `CSY183` datetime DEFAULT NULL COMMENT '时间',
  `CSY184` varchar(20) DEFAULT NULL COMMENT '登录ID',
  `CSY185` varchar(200) DEFAULT '' COMMENT '访问方法',
  PRIMARY KEY (`CSY180`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储系统的异常信息';

-- ----------------------------
-- Records of sy18
-- ----------------------------

-- ----------------------------
-- Procedure structure for delete_sy17
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_sy17`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_sy17`()
BEGIN 
TRUNCATE sy17; 
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for test
-- ----------------------------
DROP PROCEDURE IF EXISTS `test`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `test`()
BEGIN 
update examinfo SET endtime = now() WHERE id = 14; 
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for delete_sy17
-- ----------------------------
DROP EVENT IF EXISTS `delete_sy17`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `delete_sy17` ON SCHEDULE EVERY 1 MONTH STARTS '2017-04-19 09:56:52' ON COMPLETION NOT PRESERVE ENABLE COMMENT '每个月定时删除日志表信息' DO delete  from sy17
;;
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
