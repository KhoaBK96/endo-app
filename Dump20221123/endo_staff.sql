-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (x86_64)
--
-- Host: localhost    Database: endo
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5bbdfuitxii0b63v2v3f0r22x` (`role_id`),
  CONSTRAINT `FK5bbdfuitxii0b63v2v3f0r22x` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,_binary '','Tran Xuan Khoa','$2a$10$ITWV/2mvTq92mfqbDXCdgOSyww8QbIbdQkaVrHwn1GUzo4k3V7/ne','0123456789','khoa28',4),(2,_binary '','Nguyen Hoang Quan','$2a$10$t0gjj5rPuXChescp2fhT2epDbSDRe3k2o7rkXGXwhIFEWi9qd7Yje','0333223743','hoang2',3),(3,_binary '','Tran Van Nhan','$2a$10$kfOpzp/KU3YxmHN05kzPg.LXJbwHSVqdxhnoobZ/hZ2PRxyINRr9C','0122233344','nhan22',5),(4,_binary '','Kim Oanh','$2a$10$eBDa3UTriQyg3r3dLNpSFOYhuW0xP7G77AuhnrVaCg2J5xaDngK.6','0893288333','Oanh',6),(5,_binary '\0','tran xuan khoa','$2a$10$pY0nedrT6unoYWTMcoW7feQvOQO6Aywj8eQIXvx7vJrwK6pZ1qfdK','07727900323','khoa123',4),(6,_binary '\0','nguyen van tung','$2a$10$FYiLPPEPhWjVXDRzgjFCv.H9MCZ6OOAipt2yzCmw2PCqBRTlFhdji','0312312333','tung1234',5),(7,_binary '\0','le thi loan','$2a$10$zI9rd/Hj/BXDF1Kv9KiIkuWO5r/SpHwlkNG3b05NCy2WZlIC/eDv.','0321321333','loan122',6),(8,_binary '','tran van nhan','$2a$10$C6KTeAeunTfp4F9xOyFDOuiQsbv01.byE7B2U4saWrfW1i4Y8GMbW','09993838838','nhan234',6);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-23 15:16:25
