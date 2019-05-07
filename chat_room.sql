-- MySQL dump 10.13  Distrib 5.7.23, for macos10.13 (x86_64)
--
-- Host: 127.0.0.1    Database: chat_room
-- ------------------------------------------------------
-- Server version	5.7.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chat_content`
--

DROP TABLE IF EXISTS `chat_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(256) NOT NULL,
  `message` longtext NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_content`
--

LOCK TABLES `chat_content` WRITE;
/*!40000 ALTER TABLE `chat_content` DISABLE KEYS */;
INSERT INTO `chat_content` VALUES (2,'f528764d624db129b32c21fbca0cb8d6','asdasd',1557127456,1557127456,'åŸƒç“¦å°” Eibar8259'),(5,'f528764d624db129b32c21fbca0cb8d6','asdkjas;a;sjdajs;djas;j;æ’’æ‰“ç®—',1557128208,1557128208,'åŸƒç“¦å°” Eibar8259'),(6,'f528764d624db129b32c21fbca0cb8d6','123213',1557128945,1557128945,'åŸƒç“¦å°” Eibar8259'),(7,'f528764d624db129b32c21fbca0cb8d6','1231å•Šæ‰“ç®—æ’’',1557129252,1557129252,'åŸƒç“¦å°” Eibar8259'),(8,'f528764d624db129b32c21fbca0cb8d6','æ’’æ‰“ç®—å¤§',1557129259,1557129259,'åŸƒç“¦å°” Eibar8259'),(9,'f528764d624db129b32c21fbca0cb8d6','æ’’æ‰“ç®—å¤§',1557129268,1557129268,'åŸƒç“¦å°” Eibar8259'),(10,'f528764d624db129b32c21fbca0cb8d6','æ’’æ‰“ç®—å¤§',1557129277,1557129277,'åŸƒç“¦å°” Eibar8259'),(11,'f528764d624db129b32c21fbca0cb8d6','12312312',1557129696,1557129696,'åŸƒç“¦å°” Eibar8259'),(12,'f528764d624db129b32c21fbca0cb8d6','dasdas',1557129786,1557129786,'åŸƒç“¦å°” Eibar8259'),(13,'f528764d624db129b32c21fbca0cb8d6','sdasdasda',1557129811,1557129811,'åŸƒç“¦å°” Eibar8259'),(14,'f528764d624db129b32c21fbca0cb8d6','12312312',1557129824,1557129824,'åŸƒç“¦å°” Eibar8259'),(15,'f528764d624db129b32c21fbca0cb8d6','asdasdas',1557129859,1557129859,'åŸƒç“¦å°” Eibar8259'),(16,'f528764d624db129b32c21fbca0cb8d6','1231231',1557129924,1557129924,'åŸƒç“¦å°” Eibar8259'),(17,'f528764d624db129b32c21fbca0cb8d6','123123',1557129944,1557129944,'åŸƒç“¦å°” Eibar8259'),(18,'f528764d624db129b32c21fbca0cb8d6','æ’’æ‰“ç®—å¤§',1557129977,1557129977,'åŸƒç“¦å°” Eibar8259'),(19,'f528764d624db129b32c21fbca0cb8d6','1231231',1557132715,1557132715,'åŸƒç“¦å°” Eibar8259'),(20,'f528764d624db129b32c21fbca0cb8d6','aé˜¿æ–¯é¡¿çœ‹è§é˜¿æ–¯é¡¿æŽ¥å£æ’’',1557134059,1557134059,'åŸƒç“¦å°” Eibar8259'),(21,'f528764d624db129b32c21fbca0cb8d6','ðŸ˜‚ðŸ˜„ðŸ˜„ðŸ˜‚',1557135674,1557135674,'åŸƒç“¦å°” Eibar8259'),(22,'f528764d624db129b32c21fbca0cb8d6','ðŸ‘ŒðŸ¯',1557135700,1557135700,'åŸƒç“¦å°” Eibar8259'),(23,'f528764d624db129b32c21fbca0cb8d6','asdasd',1557199773,1557199773,'åŸƒç“¦å°” Eibar8259'),(24,'f528764d624db129b32c21fbca0cb8d6','asdas',1557199790,1557199790,'åŸƒç“¦å°” Eibar8259'),(25,'f528764d624db129b32c21fbca0cb8d6','ä½ å“ˆçš®ï¼Œå•Š',1557200552,1557200552,'åŸƒç“¦å°” Eibar8259'),(26,'f528764d624db129b32c21fbca0cb8d6','æˆ‘å“ˆå°¼å—å•Š',1557200559,1557200559,'åŸƒç“¦å°” Eibar8259'),(27,'f528764d624db129b32c21fbca0cb8d6','ä½ è¯´å•¥',1557208445,1557208445,'åŸƒç“¦å°” Eibar8259'),(28,'f528764d624db129b32c21fbca0cb8d6','asdasd',1557210205,1557210205,'åŸƒç“¦å°” Eibar8259'),(29,'f528764d624db129b32c21fbca0cb8d6','ä½ å¥½ç˜¦å•Šå“ˆ',1557210428,1557210428,'åŸƒç“¦å°” Eibar8259'),(30,'f528764d624db129b32c21fbca0cb8d6','014-4-29â€‚Â·â€‚å¦‚ä½•å°†åŸŸåæŒ‡å‘æœ¬åœ°æœåŠ¡å™¨,å»ºè®¾ç½‘ç«™çš„æ—¶å€™ï¼Œæˆ‘ä»¬å¸¸å¸¸éœ€è¦å°†æ³¨å†Œå¥½çš„åŸŸåå…ˆæŒ‡å‘æœ¬åœ°ä»£ç ï¼Œç”¨äºŽä»£ç è°ƒè¯•çš„éœ€è¦ï¼Œä½†æœ¬åœ°æœåŠ¡å™¨é…ç½®çš„é»˜è®¤åœ°å€æ˜¯localhotæˆ–127 ...  jingyan.baidu.com â€º ç™¾åº¦ç»éªŒ â€º æ¸¸æˆ/æ•°ç  â€º ç”µè„‘ â€º å°å¼æœº æ€Žæ ·å°†åŸŸåæŒ‡å‘æœ¬åœ°æœåŠ¡å™¨é¡¹ç›®IPåœ°å€â€‚Â·â€‚2016.12.26 ç½‘ç«™æœåŠ¡å™¨æ€Žä¹ˆç»‘å®šåŸŸåâ€‚Â·â€‚2018.04.12 æœåŠ¡å™¨åŸŸåè§£æžæ•™ç¨‹â€‚Â·â€‚2016.09.08 å¦‚ä½•è®©å¤–ç½‘è®¿é—®æœ¬åœ°WEBæœåŠ¡å™¨ - ty0415çš„ä¸“æ  - CSDNåšå®¢ 2013-2-27â€‚Â·â€‚Http://localhost/ æˆ–è€…åŽé¢å¸¦ç«¯å£ï¼Œå±€åŸŸç½‘çš„ç”¨æˆ·åˆ™æ˜¯é€šè¿‡ç”µè„‘çš„å†…ç½‘IPè®¿é—®WebæœåŠ¡å™¨ï¼Œä¾‹å¦‚ï¼ŒWebæœåŠ¡å™¨ç”µè„‘çš„IPæ˜¯ 192.168 ... å¦‚ä½•è®©æ‰‹æœºè®¿é—®ç”µè„‘æœ¬åœ°æœåŠ¡å™¨ çš„ç½‘é¡µè¶… ...  https://blog.csdn.net/ty0415/article/details/8616870 æœ¬åœ°FTPæœåŠ¡å™¨å¦‚ä½•è®¿é—® - ç™¾åº¦çŸ¥é“ - å…¨çƒæœ€å¤§ä¸­æ–‡äº’åŠ¨é—®ç­”å¹³å°  ä¸å¤ªæ˜Žç™½ä½ çš„é—®é¢˜ï¼Œæˆ‘æ˜¯è¿™æ ·ç†è§£ï¼ŒçŽ°æœ‰Aã€Bä¸¤å°æœºå­ï¼Œéƒ½æŽ¥æœ‰è·¯ç”±å™¨ä¸Šï¼Œç½‘æ®µä¸º192 â€¦ æŸ¥çœ‹å…¨éƒ¨å›žç­”è¯¦æƒ… https://zâ€¦â€‚Â·â€‚å…± 4 æ¡å›žç­”â€‚Â·â€‚2013-04-08  æœ¬åœ°æœåŠ¡å™¨å¦‚ â€¦ å…± 5 æ¡å›žç­”â€‚Â·â€‚2018-10-22 åŽ»å¿…åº”ç½‘å…¸æŸ¥çœ‹æ›´å¤š å¦‚ä½•æ­å»ºå¹¶è®¿é—®æœ¬åœ°çš„ftpæœåŠ¡å™¨ - andyçš„åšå®¢ - CSDNåšå®¢ 2016-12-14â€‚Â·â€‚1ã€é¦–å…ˆç¡®ä¿ftpçš„æœåŠ¡å™¨è®¾ç½®æ²¡æœ‰é—®é¢˜ï¼Œä¹Ÿå°±æ˜¯æœåŠ¡å™¨ç»‘å®šçš„IPåœ°å€å’Œç›‘å¬çš„ç«¯å£å·ã€‚ ... å¦‚ä½•è®©å¤–ç½‘è®¿é—®æœ¬åœ°æœåŠ¡å™¨ 05-18 é˜…è¯»æ•° 2891 é¦–è¡Œä½ è¦åŽ»æ³¨å†Œä¸€ä¸ªèŠ±ç”Ÿå£³ ...  https://blog.csdn.net/u010694764/article/details/53637226 å¤–ç½‘å¦‚ä½•è®¿é—®æœ¬åœ°tomcat webæœåŠ¡å™¨ã€è½¬ ... 2015-7-13â€‚Â·â€‚å¯ä»¥ä¿®æ”¹ä¸€ä¸‹ç«¯å£å·ï¼Œä¸ä¿®æ”¹ä¹Ÿå¯ä»¥ï¼Œåªä¸è¿‡ç«¯å£å¦‚æžœæ˜¯80ï¼Œé‚£ä¹ˆå¤–ç½‘ç›´æŽ¥è®¿é—®æœ¬åœ°æœåŠ¡å™¨ç½‘ç«™ ... è™šæ‹ŸæœåŠ¡åç§°å¯ä»¥è‡ªå®šä¹‰è®¾ç½®ï¼Œå†… ç½‘ä¸»æœºIPè®¾ç½®ä¸ºæœåŠ¡å™¨çš„IP ...  https://www.cnblogs.com/cheneasternsun/p/5075042.html å¦‚ä½•è®©å¤–ç½‘çš„äººç”¨åŸŸåæ¥è®¿é—®æˆ‘ä¸»æœºä¸Šçš„ç½‘ç«™-CSDNè®ºå› 2012-2',1557210523,1557210523,'åŸƒç“¦å°” Eibar8259'),(31,'f528764d624db129b32c21fbca0cb8d6','asdasdada',1557217019,1557217019,'åŸƒç“¦å°” Eibar8259'),(32,'eccbc87e4b5ce2fe28308fd9f2a7baf3','aasdsad',1557217561,1557217561,'ç“¦ä¼¦è¥¿äºšValencia Club de Fotbol9578'),(33,'c4ca4238a0b923820dcc509a6f75849b','asd',1557217600,1557217600,'æ‹œä»æ…•å°¼é»‘4696'),(34,'f528764d624db129b32c21fbca0cb8d6','æ’’æ‰“ç®—æ‰“ç®—æ‰“ç®—æ‰“ç®—å¤§',1557219510,1557219510,'åŸƒç“¦å°” Eibar8259'),(35,'f528764d624db129b32c21fbca0cb8d6','æ’’æ‰“ç®—å¤§',1557219528,1557219528,'åŸƒç“¦å°” Eibar8259'),(36,'f528764d624db129b32c21fbca0cb8d6','æ’’æ‰“ç®—æ‰“ç®—å¤§',1557219530,1557219530,'åŸƒç“¦å°” Eibar8259'),(37,'f528764d624db129b32c21fbca0cb8d6','å•Šæ‰“ç®—æ‰“ç®—å¤§',1557219626,1557219626,'åŸƒç“¦å°” Eibar8259'),(38,'f528764d624db129b32c21fbca0cb8d6','æ’’æ‰“ç®—æ‰“ç®—çš„3213123 ',1557219631,1557219631,'åŸƒç“¦å°” Eibar8259');
/*!40000 ALTER TABLE `chat_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(256) DEFAULT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `ip` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COMMENT='聊天用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (10,'f528764d624db129b32c21fbca0cb8d6','åŸƒç“¦å°” Eibar8259',1557125985,1557125985,'127.0.0.1'),(11,'eccbc87e4b5ce2fe28308fd9f2a7baf3','ç“¦ä¼¦è¥¿äºšValencia Club de Fotbol9578',1557217475,1557217475,'127.0.0.1'),(12,'c4ca4238a0b923820dcc509a6f75849b','æ‹œä»æ…•å°¼é»‘4696',1557217494,1557217494,'127.0.0.1'),(13,'c81e728d9d4c2f636f067f89cc14862c','çš‡å®¶é©¬å¾·é‡ŒReal Madrid5296',1557217502,1557217502,'127.0.0.1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-07 17:01:02
