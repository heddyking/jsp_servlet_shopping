# MySQL-Front 5.1  (Build 4.2)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: 127.0.0.1    Database: class
# ------------------------------------------------------
# Server version 5.1.44-community

#
# Source for table goods
#

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `cid` varchar(11) NOT NULL DEFAULT '',
  `cname` varchar(30) CHARACTER SET gb2312 DEFAULT NULL,
  `cprice` float(4,2) DEFAULT NULL,
  `cnumber` int(11) DEFAULT NULL,
  `cintro` text,
  `cimage` varchar(50) DEFAULT NULL,
  `cpic` blob,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table goods
#

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES ('5555','小米手环',50,15,NULL,NULL,NULL);
INSERT INTO `goods` VALUES ('6666','playboy男袜',25,20,NULL,NULL,NULL);
INSERT INTO `goods` VALUES ('g000','100点卡',10,4,'44','upload/1464579457062.jpg',NULL);
INSERT INTO `goods` VALUES ('g057','老谭方便面',3.8,20,'','Winter.jsp',NULL);
INSERT INTO `goods` VALUES ('o056','苹果原装耳机',20.5,50,NULL,NULL,NULL);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
