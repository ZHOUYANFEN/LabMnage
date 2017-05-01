/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50537
Source Host           : localhost:3306
Source Database       : sysglxt

Target Server Type    : MYSQL
Target Server Version : 50537
File Encoding         : 65001

Date: 2017-05-01 22:08:54
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
INSERT INTO `sy06` VALUES ('1', '1', '大学物理', '1', '1', '1', '1', '1', '0', '1', '计软1302班', '001');
INSERT INTO `sy06` VALUES ('2', '2', '实验一', '2', '3', '周一', '1', 'B01214', '0', '无', '计软1302班', '002');
INSERT INTO `sy06` VALUES ('3', '1', '实验二', '3', '3', '周二', '1', 'BO1201', '0', '无', '计软1302班', '003');

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
INSERT INTO `sy07` VALUES ('005', '1', '60');
INSERT INTO `sy07` VALUES ('005', '2', '90');

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
INSERT INTO `sy09` VALUES ('123456', '4', '<p>说的</p>', null, 'D://sss.xls', '65', '1', '0', '0');
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
INSERT INTO `sy11` VALUES ('14', '1', '力学实验室', 'B01234', '11:00-12:00', '1', '无一', '0');

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
  `CSY126` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '安排时间',
  `CSY127` tinyint(4) DEFAULT '0' COMMENT '删除标记',
  `CSY128` bit(1) DEFAULT NULL COMMENT '实验室是否已申请',
  PRIMARY KEY (`CSY120`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='实验室安排表';

-- ----------------------------
-- Records of sy12
-- ----------------------------
INSERT INTO `sy12` VALUES ('1', '1', '33', '2017-04-09', '实验课', 0xE697A0, '2017-04-09', '1', '每周二9:00-11:00', '0', '');
INSERT INTO `sy12` VALUES ('2', '2', '33', '2017-04-11', '实验课', 0xE697A0, '2017-04-18', '1', '每周三9:00-11:00', '0', '');
INSERT INTO `sy12` VALUES ('1', '3', '33', '2017-04-02', 'aaa', 0x61, null, null, null, '0', '');
INSERT INTO `sy12` VALUES ('2', '4', '33', '2017-04-10', '', '', null, null, null, '0', '');
INSERT INTO `sy12` VALUES ('2', '5', '33', '2017-04-11', '', '', null, null, null, '0', '');
INSERT INTO `sy12` VALUES ('5', '6', '33', null, '', '', null, null, null, '0', '');
INSERT INTO `sy12` VALUES ('4', '7', '33', '2017-04-11', '', '', null, null, null, '0', '');
INSERT INTO `sy12` VALUES ('2', '49', '33', '2017-04-12', 'AAAAAA', 0x41, null, null, null, '0', '');
INSERT INTO `sy12` VALUES ('2', '50', '33', '2017-04-05', '科学实验', 0xE5AE9EE9AA8CE8AFBE, null, null, null, '0', '');
INSERT INTO `sy12` VALUES ('3', '51', '33', '2017-04-25', 'qqq', 0x61, null, null, null, '0', '');
INSERT INTO `sy12` VALUES ('2', '52', '33', '2017-04-20', '去去去', 0xE5958A, null, null, null, '0', '');
INSERT INTO `sy12` VALUES ('1', '53', '33', '2017-04-18', 'qqq', 0x717171, null, null, null, '0', '');
INSERT INTO `sy12` VALUES ('3', '54', '33', '2017-04-25', '去去去', 0xE5958A, null, null, null, '0', '');
INSERT INTO `sy12` VALUES ('1', '55', '33', '2017-04-19', '请求', 0xE58EBB, null, null, null, '0', '');
INSERT INTO `sy12` VALUES ('1', '56', '33', null, '', '', null, null, null, '0', null);
INSERT INTO `sy12` VALUES ('1', '57', '33', null, '', '', null, null, null, '0', null);
INSERT INTO `sy12` VALUES ('1', '58', '33', null, '', '', null, null, null, '0', null);
INSERT INTO `sy12` VALUES ('2', '59', '33', null, '', '', null, null, null, '0', null);
INSERT INTO `sy12` VALUES ('1', '60', '33', null, '', '', null, null, null, '0', null);
INSERT INTO `sy12` VALUES ('1', '61', '33', null, '', '', null, null, null, '0', null);
INSERT INTO `sy12` VALUES ('1', '62', '33', null, '', '', null, null, null, '0', null);
INSERT INTO `sy12` VALUES ('2', '63', '33', null, '', '', null, null, null, '0', null);
INSERT INTO `sy12` VALUES ('1', '64', '33', null, '', '', null, null, null, '0', null);
INSERT INTO `sy12` VALUES ('1', '65', '33', null, '', '', null, null, null, '0', null);
INSERT INTO `sy12` VALUES ('1', '66', '33', '2017-05-30', 'qqq', 0x71, null, null, null, '0', null);
INSERT INTO `sy12` VALUES ('2', '67', '33', '2017-05-22', 'shiyanke', 0x646464, null, null, null, '0', null);
INSERT INTO `sy12` VALUES ('6', '68', '33', '2017-05-29', '', '', null, null, null, '0', null);
INSERT INTO `sy12` VALUES ('2', '69', '33', '2017-05-15', 'aaa', 0x61, null, null, null, '0', null);
INSERT INTO `sy12` VALUES ('1', '70', '33', '2017-05-15', '', '', null, null, null, '0', null);
INSERT INTO `sy12` VALUES ('6', '71', '33', '2017-05-23', '', '', null, null, null, '0', null);
INSERT INTO `sy12` VALUES ('2', '72', '33', '2017-05-30', 'sss', 0x7373, null, null, null, '0', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单表';

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
INSERT INTO `sy15` VALUES ('56', '2', '学生管理', null, null, '1', null, '0', 'slpt_stumanage');
INSERT INTO `sy15` VALUES ('57', '2', '通知公告', 'openPage(\"common/announcement.jsp\")', 'common/announcement.jsp', '1', null, '0', '');
INSERT INTO `sy15` VALUES ('58', '2', '帮助中心', 'openPage(\"common/help.jsp\")', 'common/help.jsp', '1', null, '0', '');
INSERT INTO `sy15` VALUES ('59', '4', '实验室管理', 'openPage(\"manager/labmanage.jsp\")', 'manager/labmanage.jsp', '2', '25', '0', '');
INSERT INTO `sy15` VALUES ('60', '4', '菜单列表', 'openPage(\"manager/menulist.jsp\")', 'manager/menulist.jsp', '2', '21', '0', '');
INSERT INTO `sy15` VALUES ('61', '4', '系统日志信息', 'openPage(\"manager/recorde.jsp\")', 'manager/recorde.jsp', '2', '62', '0', '');
INSERT INTO `sy15` VALUES ('62', '4', '开发者管理', 'selectMenu(\"slpt_develop\",62)', null, '1', null, '0', 'slpt_develop');
INSERT INTO `sy15` VALUES ('63', '4', '码表管理', 'openPage(\"manager/aa10manage.jsp\")', 'manage/aa10manage.jsp', '2', '62', '0', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=1773 DEFAULT CHARSET=utf8 COMMENT='日志信息';

-- ----------------------------
-- Records of sy17
-- ----------------------------
INSERT INTO `sy17` VALUES ('1607', null, '登陆', '192.168.0.6', '2017-04-27 21:04:07', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 Safari/537.36 SE 2.X MetaSr 1.0', 'HP', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('1608', '001', '登陆', '192.168.0.6', '2017-04-27 21:04:08', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 Safari/537.36 SE 2.X MetaSr 1.0', 'HP', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('1609', '001', '获取用户信息', '192.168.0.6', '2017-04-27 21:04:12', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 Safari/537.36 SE 2.X MetaSr 1.0', 'HP', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('1610', '001', '获取最新公告', '192.168.0.6', '2017-04-27 21:04:12', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 Safari/537.36 SE 2.X MetaSr 1.0', 'HP', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('1611', '001', '查询父级菜单', '192.168.0.6', '2017-04-27 21:04:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 Safari/537.36 SE 2.X MetaSr 1.0', 'HP', 'bc-85-56-78-12-2d');
INSERT INTO `sy17` VALUES ('1612', '001', '登陆', '127.0.0.1', '2017-04-27 21:29:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1613', '001', '获取用户信息', '127.0.0.1', '2017-04-27 21:30:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1614', '001', '获取最新公告', '127.0.0.1', '2017-04-27 21:30:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1615', '001', '查询父级菜单', '127.0.0.1', '2017-04-27 21:30:08', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1616', '001', '获取实验安排的科目', '127.0.0.1', '2017-04-27 21:30:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1617', '001', '登陆', '127.0.0.1', '2017-04-27 21:51:55', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1618', '001', '获取最新公告', '127.0.0.1', '2017-04-27 21:51:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1619', '001', '获取用户信息', '127.0.0.1', '2017-04-27 21:51:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1620', '001', '查询父级菜单', '127.0.0.1', '2017-04-27 21:52:03', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1621', '001', '获取实验安排的科目', '127.0.0.1', '2017-04-27 21:52:41', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1622', 'developer', '登陆', '127.0.0.1', '2017-05-01 20:36:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1623', 'developer', '获取用户信息', '127.0.0.1', '2017-05-01 20:36:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1624', 'developer', '获取最新公告', '127.0.0.1', '2017-05-01 20:36:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1625', 'developer', '查询父级菜单', '127.0.0.1', '2017-05-01 20:36:48', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1626', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-01 20:36:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1627', 'developer', '获取所有学院', '127.0.0.1', '2017-05-01 20:37:04', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1628', 'developer', '获取用户的数量|getUserCount', '127.0.0.1', '2017-05-01 20:37:04', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1629', 'developer', '获取用户信息|getAllUser', '127.0.0.1', '2017-05-01 20:37:04', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1630', 'developer', '获取人员类型', '127.0.0.1', '2017-05-01 20:37:04', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1631', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-01 20:37:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1632', 'developer', '获取用户信息|getAllUser', '127.0.0.1', '2017-05-01 20:37:06', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1633', 'developer', '获取用户的数量|getUserCount', '127.0.0.1', '2017-05-01 20:37:07', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1634', 'developer', '获取人员类型', '127.0.0.1', '2017-05-01 20:37:07', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1635', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-01 20:37:08', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1636', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-01 20:37:12', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1637', 'developer', '获取人员类型', '127.0.0.1', '2017-05-01 20:37:12', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1638', 'developer', '获取用户的数量|getUserCount', '127.0.0.1', '2017-05-01 20:37:12', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1639', 'developer', '获取用户信息|getAllUser', '127.0.0.1', '2017-05-01 20:37:12', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1640', 'developer', '获取所有学院', '127.0.0.1', '2017-05-01 20:37:12', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1641', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-01 20:37:13', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1642', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-01 20:37:17', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1643', 'developer', '获取父级菜单', '127.0.0.1', '2017-05-01 20:37:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1644', 'developer', '获取人员类型', '127.0.0.1', '2017-05-01 20:37:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1645', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-01 20:37:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1646', 'developer', '获取人员类型', '127.0.0.1', '2017-05-01 20:37:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1647', 'developer', '查询所有菜单', '127.0.0.1', '2017-05-01 20:37:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1648', 'developer', '获取菜单数量', '127.0.0.1', '2017-05-01 20:37:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1649', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-01 20:37:25', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1650', 'developer', '查询公告数量', '127.0.0.1', '2017-05-01 20:37:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1651', 'developer', '查询所有公告', '127.0.0.1', '2017-05-01 20:37:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1652', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-01 20:37:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1653', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-01 20:37:37', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1654', 'developer', '查看资源类型', '127.0.0.1', '2017-05-01 20:37:39', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1655', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-01 20:37:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1656', 'developer', '查询实验室类型', '127.0.0.1', '2017-05-01 20:37:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1657', 'developer', '查询码表中的时间', '127.0.0.1', '2017-05-01 20:37:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1658', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-01 20:37:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1659', 'developer', '实验课程统计', '127.0.0.1', '2017-05-01 20:37:57', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1660', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-01 20:37:58', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1661', 'developer', '获取日志数量', '127.0.0.1', '2017-05-01 20:38:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1662', 'developer', '获取日志信息', '127.0.0.1', '2017-05-01 20:38:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1663', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-01 20:38:07', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1664', 'developer', '获取码表的数量', '127.0.0.1', '2017-05-01 20:38:08', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1665', 'developer', '查询码表', '127.0.0.1', '2017-05-01 20:38:08', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1666', 'developer', '查询子级菜单', '127.0.0.1', '2017-05-01 20:38:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1667', 'developer', '获取日志信息', '127.0.0.1', '2017-05-01 20:38:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1668', 'developer', '获取日志数量', '127.0.0.1', '2017-05-01 20:38:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1669', null, '退出', '127.0.0.1', '2017-05-01 20:38:39', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1670', '001', '登陆', '127.0.0.1', '2017-05-01 20:38:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1671', '001', '获取最新公告', '127.0.0.1', '2017-05-01 20:38:56', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1672', '001', '获取用户信息', '127.0.0.1', '2017-05-01 20:38:56', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1673', '001', '查询父级菜单', '127.0.0.1', '2017-05-01 20:39:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1674', '001', '查询子级菜单', '127.0.0.1', '2017-05-01 20:39:06', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1675', '001', '获取实验安排的科目', '127.0.0.1', '2017-05-01 20:39:10', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1676', '001', '查询子级菜单', '127.0.0.1', '2017-05-01 20:39:10', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1677', '001', '查看资源列表', '127.0.0.1', '2017-05-01 20:39:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1678', '001', '获取实验安排的科目', '127.0.0.1', '2017-05-01 20:39:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1679', '001', '获取实验安排的科目', '127.0.0.1', '2017-05-01 20:39:49', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1680', '001', '查询子级菜单', '127.0.0.1', '2017-05-01 20:39:50', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1681', '001', '查询课程表的数量', '127.0.0.1', '2017-05-01 20:39:55', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1682', '001', '获取课程表', '127.0.0.1', '2017-05-01 20:39:55', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1683', '001', '获取实验安排的科目', '127.0.0.1', '2017-05-01 20:40:02', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1684', '001', '查询成绩的数量', '127.0.0.1', '2017-05-01 20:40:06', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1685', null, '退出', '127.0.0.1', '2017-05-01 20:40:09', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1686', '002', '登陆', '127.0.0.1', '2017-05-01 20:40:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1687', '002', '获取用户信息', '127.0.0.1', '2017-05-01 20:40:23', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1688', '002', '获取最新公告', '127.0.0.1', '2017-05-01 20:40:23', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1689', '002', '查询父级菜单', '127.0.0.1', '2017-05-01 20:40:27', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1690', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 20:40:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1691', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 20:40:45', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1692', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 20:40:49', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1693', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 20:40:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1694', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 20:40:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1695', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 20:40:54', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1696', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 20:40:56', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1697', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 20:40:58', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1698', '002', '获取用户信息', '127.0.0.1', '2017-05-01 20:40:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1699', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 20:41:03', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1700', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 20:41:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1701', '002', '获取用户信息', '127.0.0.1', '2017-05-01 20:41:06', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1702', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 20:41:07', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1703', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 20:41:09', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1704', '002', '获取用户信息', '127.0.0.1', '2017-05-01 20:41:10', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1705', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 20:41:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1706', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 20:41:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1707', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 20:41:23', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1708', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 20:41:32', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1709', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 20:41:35', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1710', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 20:42:12', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1711', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:12:22', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1712', '002', '获取用户信息', '127.0.0.1', '2017-05-01 21:12:24', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1713', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:12:24', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1714', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:12:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1715', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:15:01', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1716', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:21:28', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1717', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:22:04', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1718', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:22:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1719', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:22:24', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1720', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:23:04', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1721', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:23:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1722', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:23:08', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1723', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:23:09', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1724', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:23:54', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1725', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:24:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1726', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:26:03', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1727', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:26:04', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1728', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:26:07', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1729', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:26:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1730', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:27:09', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1731', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:27:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1732', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:28:06', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1733', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:29:18', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1734', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:29:19', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1735', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:31:07', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1736', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:31:36', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1737', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:34:47', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1738', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:34:48', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1739', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:34:50', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1740', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:34:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1741', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:34:58', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1742', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:35:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1743', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:35:01', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1744', '002', '获取公告|queryanouncement', '127.0.0.1', '2017-05-01 21:35:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1745', '002', '获取公告|queryanouncement', '127.0.0.1', '2017-05-01 21:35:23', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1746', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:35:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1747', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:35:27', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1748', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:35:28', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1749', '002', '登陆', '127.0.0.1', '2017-05-01 21:50:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1750', '002', '获取用户信息', '127.0.0.1', '2017-05-01 21:50:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1751', '002', '获取最新公告', '127.0.0.1', '2017-05-01 21:50:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1752', '002', '查询父级菜单', '127.0.0.1', '2017-05-01 21:50:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1753', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:50:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1754', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:51:23', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1755', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:51:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1756', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:51:36', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1757', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:51:37', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1758', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:51:43', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1759', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:51:47', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1760', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:57:46', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1761', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:57:46', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1762', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:58:38', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1763', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:58:49', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1764', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 21:58:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1765', null, '退出', '127.0.0.1', '2017-05-01 22:03:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1766', null, '登陆', '127.0.0.1', '2017-05-01 22:03:51', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1767', '002', '登陆', '127.0.0.1', '2017-05-01 22:04:02', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1768', '002', '获取用户信息', '127.0.0.1', '2017-05-01 22:04:06', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1769', '002', '获取最新公告', '127.0.0.1', '2017-05-01 22:04:06', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1770', '002', '查询父级菜单', '127.0.0.1', '2017-05-01 22:04:09', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1771', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 22:04:14', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');
INSERT INTO `sy17` VALUES ('1772', '002', '查询子级菜单', '127.0.0.1', '2017-05-01 22:05:32', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '127.0.0.1', 'c4-36-55-6a-93-b1');

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
