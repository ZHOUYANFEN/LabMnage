/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50537
Source Host           : localhost:3306
Source Database       : sysglxt

Target Server Type    : MYSQL
Target Server Version : 50537
File Encoding         : 65001

Date: 2017-06-18 02:37:23
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
INSERT INTO `aa10` VALUES ('CSY043', '班级', '4', '桥梁1301班', '0', 'CSY042_1');
INSERT INTO `aa10` VALUES ('CSY043', '班级', '5', '桥梁1302班', '0', 'CSY042_1');
INSERT INTO `aa10` VALUES ('TIME', '时间', '0', '所有时间', '1', '');
INSERT INTO `aa10` VALUES ('TIME', '时间', '1', '周一 8:00-10:00', '0', '');
INSERT INTO `aa10` VALUES ('TIME', '时间', '10', '周二 20:00-22:00', '0', '');
INSERT INTO `aa10` VALUES ('TIME', '时间', '2', '周一 10:00-12:00', '0', '');
INSERT INTO `aa10` VALUES ('TIME', '时间', '3', '周一 14:00-16:00', '0', '');
INSERT INTO `aa10` VALUES ('TIME', '时间', '4', '周一 16:00-18:00', '0', '');
INSERT INTO `aa10` VALUES ('TIME', '时间', '5', '周一 20:00-22:00', '0', '');
INSERT INTO `aa10` VALUES ('TIME', '时间', '6', '周二 8:00-10:00', '0', '');
INSERT INTO `aa10` VALUES ('TIME', '时间', '7', '周二 10:00-12', '0', '');
INSERT INTO `aa10` VALUES ('TIME', '时间', '8', '周二 14:00-16:00', '0', '');
INSERT INTO `aa10` VALUES ('TIME', '时间', '9', '周二 16:00-18:00', '0', '');
INSERT INTO `aa10` VALUES ('WEEK', '周数', '1', '第一周', '0', '');
INSERT INTO `aa10` VALUES ('WEEK', '周数', '2', '第二周', '0', '');
INSERT INTO `aa10` VALUES ('WEEK', '周数', '3', '第三周', '0', '');
INSERT INTO `aa10` VALUES ('WEEK', '周数', '4', '第四周', '0', '');
INSERT INTO `aa10` VALUES ('WEEK', '周数', '5', '第五周', '0', '');
INSERT INTO `aa10` VALUES ('WEEK', '周数', '6', '第六周', '0', '');
INSERT INTO `aa10` VALUES ('WEEK', '周数', '7', '第七周', '0', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

-- ----------------------------
-- Records of sy02
-- ----------------------------
INSERT INTO `sy02` VALUES ('46', '4', 'developer', '5e8edd851d2fdfbd7415232c67367cc3', '0');
INSERT INTO `sy02` VALUES ('48', '1', '009', 'dc5c7986daef50c1e02ab09b442ee34f', '1');
INSERT INTO `sy02` VALUES ('49', '1', '001', 'dc5c7986daef50c1e02ab09b442ee34f', '0');
INSERT INTO `sy02` VALUES ('51', '2', '002', '93dd4de5cddba2c733c65f233097f05a', '0');
INSERT INTO `sy02` VALUES ('52', '2', '003', 'e88a49bccde359f0cabb40db83ba6080', '0');
INSERT INTO `sy02` VALUES ('53', '3', '004', '11364907cf269dd2183b64287156072a', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='科研人员表';

-- ----------------------------
-- Records of sy03
-- ----------------------------
INSERT INTO `sy03` VALUES ('6', '53', '王教授', '教授');

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
INSERT INTO `sy04` VALUES ('49', '631306050202', '李四', '信息科学与工程学院', '计软1302班');
INSERT INTO `sy04` VALUES ('48', '631306050218', '张三', '信息科学与工程学院', '计软1302班');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='教师表';

-- ----------------------------
-- Records of sy05
-- ----------------------------
INSERT INTO `sy05` VALUES ('51', '10', '李教授', '信息科学与工程学院', '教授');
INSERT INTO `sy05` VALUES ('52', '11', '张教授', '信息科学与工程学院', '副教授');

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
  `CSY064` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '开放时间',
  `CSY065` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '是否开放',
  `CSY066` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '课程地点',
  `CSY067` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `CSY068` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `CSY069` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '班级',
  `CSY06A` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '课程代码',
  PRIMARY KEY (`CSY060`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='课程表';

-- ----------------------------
-- Records of sy06
-- ----------------------------
INSERT INTO `sy06` VALUES ('10', '10', '大学物理', '2', '2', '2017-06-15-2017-06-30', '1', 'A01234', '0', '', null, 'CQJTDXWL201701');

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
INSERT INTO `sy07` VALUES ('631306050202', '10', '87');
INSERT INTO `sy07` VALUES ('631306050218', '10', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='实验安排表';

-- ----------------------------
-- Records of sy08
-- ----------------------------
INSERT INTO `sy08` VALUES ('10', '5', '10', '物理实验1', '<p>完成实验教材实验一的内容。</p>', '2017-06-08', '2017-06-18', '1');
INSERT INTO `sy08` VALUES ('10', '6', '10', '物理实验2', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;完成实验教材实验二。</p>', '2017-06-01', '2017-06-24', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='实验完成表';

-- ----------------------------
-- Records of sy09
-- ----------------------------
INSERT INTO `sy09` VALUES ('631306050202', '6', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;完成实验内容。</p>', '2017-06-18', 'D://sysglptdir/付政俊.任务书.doc', '90', '4', '0', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='实验室表';

-- ----------------------------
-- Records of sy11
-- ----------------------------
INSERT INTO `sy11` VALUES ('15', '1', '物理实验室1', 'A01123', '周一 8:00-10:00', '0', '无', '0');
INSERT INTO `sy11` VALUES ('16', '1', '物理实验室2', 'A01124', '周二 20:00-22:00', '0', '无', '0');
INSERT INTO `sy11` VALUES ('17', '1', '物理实验室3', 'A01125', '周二 20:00-22:00', '0', '无', '0');
INSERT INTO `sy11` VALUES ('18', '1', '物理实验室4', 'A01126', '周二 20:00-22:00', '0', '无', '0');
INSERT INTO `sy11` VALUES ('19', '2', '化学实验室4', 'A01226', '周一 10:00-12:00', '0', '无', '0');
INSERT INTO `sy11` VALUES ('20', '2', '化学实验室2', 'A01226', '周一 10:00-12:00', '0', '无', '0');

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
  `CSY124` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '审核时间',
  `CSY125` tinyint(4) DEFAULT NULL COMMENT '是否通过',
  `CSY126` varchar(500) COLLATE utf8_bin DEFAULT '' COMMENT '安排时间',
  `CSY127` tinyint(4) DEFAULT '0' COMMENT '删除标记',
  `CSY128` bit(1) DEFAULT NULL COMMENT '实验室是否已申请',
  PRIMARY KEY (`CSY120`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='实验室安排表';

-- ----------------------------
-- Records of sy12
-- ----------------------------
INSERT INTO `sy12` VALUES ('15', '93', '51', '2017-06-18', '上课', '', '', '0', '第一周:,第二周:,第三周:', '0', null);
INSERT INTO `sy12` VALUES ('19', '94', '51', '2017-06-18', '上课', 0xE4BDA0E5A5BD, '2017-06-18', '1', '第一周:周一 8:00-10:00,第二周:周一 8:00-10:00,第三周:周一 8:00-10:00,第四周:周一 8:00-10:00', '0', null);

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
  `CSY138` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`CSY130`),
  KEY `CSY160` (`CSY160`),
  CONSTRAINT `sy13_ibfk_1` FOREIGN KEY (`CSY160`) REFERENCES `sy16` (`csy160`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='资源表';

-- ----------------------------
-- Records of sy13
-- ----------------------------
INSERT INTO `sy13` VALUES ('51', '4', '631306050218_计软_付政俊_上传版改', '1', '631306050218_计软_付政俊_上传版改.docx', 'D://631306050218_计软_付政俊_上传版改.docx', '0', '2017-06-18', '1', '1.898M');
INSERT INTO `sy13` VALUES ('51', '5', '付政俊.任务书', '1', '付政俊.任务书.doc', 'D://付政俊.任务书.doc', '0', '2017-06-18', '1', '208.710KB');
INSERT INTO `sy13` VALUES ('51', '6', '开题报告模版', '1', '开题报告模版.doc', 'D://开题报告模版.doc', '0', '2017-06-18', '1', '60.0KB');
INSERT INTO `sy13` VALUES ('51', '7', '选题汇总表', '1', '选题汇总表.doc', 'D://选题汇总表.doc', '0', '2017-06-18', '1', '40.512KB');
INSERT INTO `sy13` VALUES ('51', '8', '文献综述模版', '1', '文献综述模版.doc', 'D://文献综述模版.doc', '0', '2017-06-18', '1', '56.512KB');
INSERT INTO `sy13` VALUES ('51', '9', '选题审批表', '1', '选题审批表.doc', 'D://选题审批表.doc', '0', '2017-06-18', '1', '36.0KB');
INSERT INTO `sy13` VALUES ('53', '10', 'aaa', '1', 'aaa.xls', 'D://aaa.xls', '0', '2017-06-18', '1', '18.512KB');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='公告表';

-- ----------------------------
-- Records of sy14
-- ----------------------------
INSERT INTO `sy14` VALUES ('1', '公告1', '2017-03-29', '公告2公告公告', '2017-04-07', '0');
INSERT INTO `sy14` VALUES ('2', '公告2', '2017-03-30', '是的撒多撒大所大所多', '2017-04-07', '0');
INSERT INTO `sy14` VALUES ('3', '公告3', '2017-03-29', '萨达撒大所大所大所大所大所大是', '2017-04-08', '0');
INSERT INTO `sy14` VALUES ('4', '公告测试1', '2017-04-09', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公告1<br/></p><p>&nbsp; 测试公告1</p>', '2017-05-01', '0');
INSERT INTO `sy14` VALUES ('5', '测试公告2', '2017-04-09', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;测试公告2<br/></p><p>测试测试时</p>', '2017-04-23', '0');
INSERT INTO `sy14` VALUES ('6', '关于毕业设计通知公告', '2017-06-16', '<p>加快速度</p>', '2017-06-17', '0');
INSERT INTO `sy14` VALUES ('7', '关于答辩公告', '2017-06-17', '<p>大家答辩加油</p>', '2017-06-22', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单表';

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
INSERT INTO `sy15` VALUES ('28', '4', '实验课程检查', null, null, '2', '25', '1', '');
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
INSERT INTO `sy15` VALUES ('39', '3', '实验室申请', 'openPage(\"teacher/LabApply.jsp\")', 'teacher/LabApply.jsp', '1', null, '0', 'slpt_labapply');
INSERT INTO `sy15` VALUES ('40', '3', '资源管理', 'openPage(\"teacher/resourceDownLoad.jsp\")', null, '1', null, '0', 'slpt_resourcemanage');
INSERT INTO `sy15` VALUES ('41', '3', '论文管理', 'openPage(\"teacher/resourceDownLoad.jsp\")', 'teacher/resourceDownLoad.jsp', '2', '40', '1', '');
INSERT INTO `sy15` VALUES ('42', '3', '代码管理', null, null, '2', '40', '1', '');
INSERT INTO `sy15` VALUES ('43', '3', '通知公告', 'openPage(\"common/announcement.jsp\")', 'common/announcement.jsp', '1', null, '0', 'slpt_announcement');
INSERT INTO `sy15` VALUES ('44', '3', '帮助中心', 'openPage(\"common/help.jsp\")', 'common/help.jsp', '1', null, '0', 'slpt_help');
INSERT INTO `sy15` VALUES ('45', '2', '个人信息管理', 'selectMenu(\"slpt_personnal\",45)', null, '1', null, '0', 'slpt_personnal');
INSERT INTO `sy15` VALUES ('46', '2', '个人信息查看', 'openPage(\"common/personalinfo.jsp\")', 'common/personalinfo.jsp', '2', '45', '0', '');
INSERT INTO `sy15` VALUES ('47', '2', '密码设置', 'openPage(\"common/changepassword.jsp\")', 'common/changepassword.jsp', '2', '45', '0', '');
INSERT INTO `sy15` VALUES ('48', '2', '实验管理', 'selectMenu(\"slpt_expmanager\",48)', null, '1', null, '0', 'slpt_expmanager');
INSERT INTO `sy15` VALUES ('49', '2', '实验室申请', 'openPage(\"teacher/LabApply.jsp\")', null, '2', '48', '0', '');
INSERT INTO `sy15` VALUES ('50', '2', '实验安排', 'openPage(\"teacher/ExpManage.jsp\")', null, '2', '48', '0', '');
INSERT INTO `sy15` VALUES ('51', '2', '实验报告评分', 'openPage(\"teacher/reportScore.jsp\")', null, '2', '48', '0', '');
INSERT INTO `sy15` VALUES ('52', '2', '实验成绩评分', 'openPage(\"teacher/classScore.jsp\")', 'teacher/classScore.jsp', '2', '48', '0', '');
INSERT INTO `sy15` VALUES ('53', '2', '资源管理', 'selectMenu(\"slpt_resourcemanage\",53)', null, '1', null, '0', 'slpt_resourcemanage');
INSERT INTO `sy15` VALUES ('54', '2', '课程资源', 'openPage(\"teacher/resourceDownLoad.jsp\")', 'teacher/resourceDownLoad.jsp', '2', '53', '0', '');
INSERT INTO `sy15` VALUES ('55', '2', '其他资源', null, null, '2', '53', '1', '');
INSERT INTO `sy15` VALUES ('56', '2', '学生管理', 'openPage(\"teacher/studentmanage.jsp\")', 'teacher/studentmanage.jsp', '1', null, '0', 'slpt_stumanage');
INSERT INTO `sy15` VALUES ('57', '2', '通知公告', 'openPage(\"common/announcement.jsp\")', 'common/announcement.jsp', '1', null, '0', '');
INSERT INTO `sy15` VALUES ('58', '2', '帮助中心', 'openPage(\"common/help.jsp\")', 'common/help.jsp', '1', null, '0', '');
INSERT INTO `sy15` VALUES ('59', '4', '实验室管理', 'openPage(\"manager/labmanage.jsp\")', 'manager/labmanage.jsp', '2', '25', '0', '');
INSERT INTO `sy15` VALUES ('60', '4', '菜单列表', 'openPage(\"manager/menulist.jsp\")', 'manager/menulist.jsp', '2', '21', '0', '');
INSERT INTO `sy15` VALUES ('61', '4', '系统日志信息', 'openPage(\"manager/recorde.jsp\")', 'manager/recorde.jsp', '2', '62', '0', '');
INSERT INTO `sy15` VALUES ('62', '4', '开发者管理', 'selectMenu(\"slpt_develop\",62)', null, '1', null, '0', 'slpt_develop');
INSERT INTO `sy15` VALUES ('63', '4', '码表管理', 'openPage(\"manager/aa10manage.jsp\")', 'manager/aa10manage.jsp', '2', '62', '0', '');
INSERT INTO `sy15` VALUES ('64', '4', '异常日志管理', 'openPage(\"manager/exceptionrecorde.jsp\")', 'manager/exceptionrecorde.jsp', '2', '62', '0', '');
INSERT INTO `sy15` VALUES ('65', '2', '课程管理', 'openPage(\"teacher/courseManage.jsp\")', 'teacher/courseManage', '2', '48', '0', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=5697 DEFAULT CHARSET=utf8 COMMENT='日志信息';

-- ----------------------------
-- Records of sy17
-- ----------------------------
INSERT INTO `sy17` VALUES ('5629', '002', '登陆', '127.0.0.1', '2017-06-14 19:48:14', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5630', '002', '获取最新公告', '127.0.0.1', '2017-06-14 19:48:17', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5631', '002', '获取用户信息', '127.0.0.1', '2017-06-14 19:48:17', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5632', '002', '查询父级菜单', '127.0.0.1', '2017-06-14 19:48:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5633', '002', '查询子级菜单', '127.0.0.1', '2017-06-14 19:48:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5634', '002', '查询实验室相关信息', '127.0.0.1', '2017-06-14 19:49:39', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5635', '002', '查询实验室数量', '127.0.0.1', '2017-06-14 19:49:39', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5636', '002', '查询实验室数量', '127.0.0.1', '2017-06-14 19:49:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5637', '002', '查询实验室相关信息', '127.0.0.1', '2017-06-14 19:49:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5638', '002', '查询实验室数量', '127.0.0.1', '2017-06-14 19:49:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5639', '002', '查询实验室相关信息', '127.0.0.1', '2017-06-14 19:49:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5640', '002', '查询实验室相关信息', '127.0.0.1', '2017-06-14 19:50:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5641', '002', '查询实验室相关信息', '127.0.0.1', '2017-06-14 19:50:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5642', '002', '查询实验室相关信息', '127.0.0.1', '2017-06-14 19:50:01', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5643', '002', '查询子级菜单', '127.0.0.1', '2017-06-14 19:50:03', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5644', '002', '查询子级菜单', '127.0.0.1', '2017-06-14 19:50:07', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5645', '002', '给学生实验报告评分', '127.0.0.1', '2017-06-14 19:50:10', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5646', '002', '获取所有实验课程', '127.0.0.1', '2017-06-14 19:50:13', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5647', '002', '查询子级菜单', '127.0.0.1', '2017-06-14 19:50:37', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5648', '002', '查询出实验安排', '127.0.0.1', '2017-06-14 19:50:42', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5649', '002', '查询出实验安排', '127.0.0.1', '2017-06-14 19:50:44', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5650', '002', '查询子级菜单', '127.0.0.1', '2017-06-14 19:52:27', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5651', '002', '获取所有实验课程', '127.0.0.1', '2017-06-14 19:52:27', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5652', '002', '按照实验课程查询学生列表', '127.0.0.1', '2017-06-14 19:52:33', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5653', null, '退出', '127.0.0.1', '2017-06-14 19:55:15', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5654', '001', '登陆', '127.0.0.1', '2017-06-14 19:55:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5655', '001', '获取用户信息', '127.0.0.1', '2017-06-14 19:55:37', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5656', '001', '获取最新公告', '127.0.0.1', '2017-06-14 19:55:37', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5657', '001', '查询父级菜单', '127.0.0.1', '2017-06-14 19:55:40', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5658', '001', '查询子级菜单', '127.0.0.1', '2017-06-14 19:55:46', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5659', null, '退出', '127.0.0.1', '2017-06-14 19:59:45', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5660', '001', '登陆', '127.0.0.1', '2017-06-14 20:00:01', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5661', '001', '获取用户信息', '127.0.0.1', '2017-06-14 20:00:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5662', '001', '获取最新公告', '127.0.0.1', '2017-06-14 20:00:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5663', '001', '查询父级菜单', '127.0.0.1', '2017-06-14 20:00:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5664', null, '退出', '127.0.0.1', '2017-06-14 20:02:06', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5665', '001', '登陆', '127.0.0.1', '2017-06-14 20:02:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5666', '001', '获取最新公告', '127.0.0.1', '2017-06-14 20:02:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5667', '001', '获取用户信息', '127.0.0.1', '2017-06-14 20:02:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5668', '001', '查询父级菜单', '127.0.0.1', '2017-06-14 20:02:23', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5669', null, '退出', '127.0.0.1', '2017-06-14 20:04:05', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5670', '001', '登陆', '127.0.0.1', '2017-06-14 20:04:27', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5671', '001', '获取用户信息', '127.0.0.1', '2017-06-14 20:04:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5672', '001', '获取最新公告', '127.0.0.1', '2017-06-14 20:04:31', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5673', '001', '查询父级菜单', '127.0.0.1', '2017-06-14 20:04:34', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5674', '001', '查询子级菜单', '127.0.0.1', '2017-06-14 20:06:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5675', '001', '登陆', '127.0.0.1', '2017-06-14 20:16:53', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5676', '001', '获取用户信息', '127.0.0.1', '2017-06-14 20:16:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5677', '001', '获取最新公告', '127.0.0.1', '2017-06-14 20:16:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5678', '001', '查询父级菜单', '127.0.0.1', '2017-06-14 20:17:11', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5679', null, '退出', '127.0.0.1', '2017-06-14 20:17:46', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5680', '001', '登陆', '127.0.0.1', '2017-06-14 20:17:56', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5681', '001', '获取用户信息', '127.0.0.1', '2017-06-14 20:17:59', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5682', '001', '获取最新公告', '127.0.0.1', '2017-06-14 20:18:00', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5683', '001', '查询父级菜单', '127.0.0.1', '2017-06-14 20:18:03', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5684', null, '退出', '127.0.0.1', '2017-06-14 20:21:01', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5685', '001', '登陆', '127.0.0.1', '2017-06-14 20:21:16', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5686', '001', '获取用户信息', '127.0.0.1', '2017-06-14 20:21:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5687', '001', '获取最新公告', '127.0.0.1', '2017-06-14 20:21:20', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5688', '001', '查询父级菜单', '127.0.0.1', '2017-06-14 20:21:24', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '58-7f-57-b6-e9-3d');
INSERT INTO `sy17` VALUES ('5689', '002', '登陆', '127.0.0.1', '2017-06-15 18:45:11', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '12-08-ca-b1-2b-e3');
INSERT INTO `sy17` VALUES ('5690', '002', '获取用户信息', '127.0.0.1', '2017-06-15 18:45:17', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '12-08-ca-b1-2b-e3');
INSERT INTO `sy17` VALUES ('5691', '002', '获取最新公告', '127.0.0.1', '2017-06-15 18:45:17', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '12-08-ca-b1-2b-e3');
INSERT INTO `sy17` VALUES ('5692', '002', '查询父级菜单', '127.0.0.1', '2017-06-15 18:45:21', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '12-08-ca-b1-2b-e3');
INSERT INTO `sy17` VALUES ('5693', '002', '访问', '127.0.0.1', '2017-06-16 22:57:14', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '12-08-ca-b1-2b-e3');
INSERT INTO `sy17` VALUES ('5694', '002', '访问', '127.0.0.1', '2017-06-16 22:57:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '12-08-ca-b1-2b-e3');
INSERT INTO `sy17` VALUES ('5695', '002', '访问', '127.0.0.1', '2017-06-16 22:57:26', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '12-08-ca-b1-2b-e3');
INSERT INTO `sy17` VALUES ('5696', '002', '访问', '127.0.0.1', '2017-06-16 22:57:30', 'Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36', '127.0.0.1', '12-08-ca-b1-2b-e3');

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
