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
-- Table structure for table `repair_order`
--

DROP TABLE IF EXISTS `repair_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `hospital` varchar(255) DEFAULT NULL,
  `create_time` time DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_time` time DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `model_id` int DEFAULT NULL,
  `repair_rank_id` int DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8j58o8t8icekb92qbwtk3k1dy` (`model_id`),
  KEY `FKdxie01xme9ai6f1h0e9sxwfre` (`repair_rank_id`),
  CONSTRAINT `FK8j58o8t8icekb92qbwtk3k1dy` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`),
  CONSTRAINT `FKdxie01xme9ai6f1h0e9sxwfre` FOREIGN KEY (`repair_rank_id`) REFERENCES `repair_rank` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_order`
--

LOCK TABLES `repair_order` WRITE;
/*!40000 ALTER TABLE `repair_order` DISABLE KEYS */;
INSERT INTO `repair_order` VALUES (1,_binary '\0','TW HUE',NULL,NULL,NULL,NULL,2,2,1,'A1234'),(2,_binary '\0','Chợ Rẫy',NULL,NULL,NULL,NULL,2,3,1,'A1235'),(5,_binary '\0','FV',NULL,NULL,NULL,NULL,0,7,NULL,'A5544'),(6,_binary '\0','Gia Dinh',NULL,NULL,NULL,NULL,0,5,1,'A3322'),(7,_binary '\0','Tu Du',NULL,NULL,NULL,NULL,2,6,NULL,'A5643'),(8,_binary '\0','Quan Y 115',NULL,NULL,NULL,NULL,1,6,1,'B1277'),(9,_binary '\0','FV',NULL,NULL,NULL,NULL,0,2,4,'K4342');
/*!40000 ALTER TABLE `repair_order` ENABLE KEYS */;
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
