-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.50-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema db_mediaplayer
--

CREATE DATABASE IF NOT EXISTS db_mediaplayer;
USE db_mediaplayer;

--
-- Definition of table `tb_media`
--

DROP TABLE IF EXISTS `tb_media`;
CREATE TABLE `tb_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) NOT NULL COMMENT '视频名称',
  `src` varchar(200) NOT NULL COMMENT '视频存放地址',
  `picture` varchar(200) NOT NULL COMMENT '视频截图',
  `descript` varchar(400) DEFAULT NULL COMMENT '视频描述',
  `uptime` varchar(40) DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_media`
--

/*!40000 ALTER TABLE `tb_media` DISABLE KEYS */;
INSERT INTO `tb_media` (`id`,`title`,`src`,`picture`,`descript`,`uptime`) VALUES 
 (32,'jjjjjjj','videos/1384911930238.flv','videos/images/1384911930238.jpg','jjjjjjjjjjj','1384911930279'),
 (33,'kkkkkkkk','videos/1384912072969.flv','videos/images/1384912072969.jpg','kkkkkkkkkk','1384912072999'),
 (34,'jjjjjjj','videos/1384912176573.flv','videos/images/1384912176573.jpg','jjjjjj','1384912176605'),
 (35,'hhhh','videos/1384912297155.flv','videos/images/1384912297155.jpg','hhhh','1384912297190'),
 (36,'ddddddddddddd','videos/1384912363784.flv','videos/images/1384912363784.jpg','ddddddddddd','1384912363813'),
 (37,'hhhhhhhhh','videos/1384920006704.flv','videos/images/1384920006704.jpg','hhhhhhhhhhhh','1384920006734');
/*!40000 ALTER TABLE `tb_media` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
