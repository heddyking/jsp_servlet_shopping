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
# Source for table ordertable
#

DROP TABLE IF EXISTS `ordertable`;
CREATE TABLE `ordertable` (
  `orderid` varchar(20) NOT NULL DEFAULT '',
  `username` varchar(20) DEFAULT NULL,
  `orderdate` date DEFAULT NULL,
  `orderstate` int(2) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `receivename` varchar(20) DEFAULT NULL,
  `tele` char(12) DEFAULT NULL,
  `zipcode` char(50) DEFAULT NULL,
  `paymode` char(20) DEFAULT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

#
# Dumping data for table ordertable
#

/*!40000 ALTER TABLE `ordertable` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordertable` ENABLE KEYS */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
