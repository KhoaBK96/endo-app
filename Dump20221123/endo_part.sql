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
-- Table structure for table `part`
--

DROP TABLE IF EXISTS `part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `create_time` time DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_time` time DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `part_code` varchar(255) DEFAULT NULL,
  `part_name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part`
--

LOCK TABLES `part` WRITE;
/*!40000 ALTER TABLE `part` DISABLE KEYS */;
INSERT INTO `part` VALUES (1,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,3,'F12345','Thân ống soi 3'),(2,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,100,'G1234','Dây dẫn sáng'),(3,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,50,'A1234','Bộ phận kết nối '),(4,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,99,'B1234','EL-connector'),(5,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,22,'D4452','Dây dẫn sáng'),(6,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,100,'H1435','Camera'),(7,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,50,'I8823','Dây dẫn chung'),(8,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,10,'L1223','Bộ phận điều khiển'),(9,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,80,'O3342','Scope connector'),(10,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'G3334','Thấu kính dẫn sáng'),(11,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'H5566','Thấu kính dẫn hình'),(12,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'K4433','Cáp điều khiển'),(13,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'L3322','Núm xoay'),(14,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'L4433','Cao su di động'),(15,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O3322','Lưới di động'),(16,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'U3223','Vòi phun khí nước'),(17,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'R3321','Tay cầm điêu khiển');
/*!40000 ALTER TABLE `part` ENABLE KEYS */;
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
