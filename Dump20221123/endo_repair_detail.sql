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
-- Table structure for table `repair_detail`
--

DROP TABLE IF EXISTS `repair_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `create_time` time DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_time` time DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `part_id` int DEFAULT NULL,
  `repair_order_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5yfycc6oqmcbrf2h5jwuf6d6y` (`part_id`),
  KEY `FKbk7806y3whetyy4nimx5pgcq6` (`repair_order_id`),
  CONSTRAINT `FK5yfycc6oqmcbrf2h5jwuf6d6y` FOREIGN KEY (`part_id`) REFERENCES `part` (`id`),
  CONSTRAINT `FKbk7806y3whetyy4nimx5pgcq6` FOREIGN KEY (`repair_order_id`) REFERENCES `repair_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_detail`
--

LOCK TABLES `repair_detail` WRITE;
/*!40000 ALTER TABLE `repair_detail` DISABLE KEYS */;
INSERT INTO `repair_detail` VALUES (1,_binary '',NULL,NULL,NULL,NULL,NULL,4,1,1),(2,_binary '\0',NULL,NULL,NULL,NULL,NULL,5,3,1),(3,_binary '',NULL,NULL,NULL,NULL,NULL,2,4,1),(4,_binary '\0',NULL,NULL,NULL,NULL,NULL,3,5,1),(5,_binary '',NULL,NULL,NULL,NULL,NULL,1,7,1),(6,_binary '',NULL,NULL,NULL,NULL,NULL,1,8,1),(7,_binary '',NULL,NULL,NULL,NULL,NULL,3,9,1),(8,_binary '\0',NULL,NULL,NULL,NULL,NULL,1,7,2),(9,_binary '\0',NULL,NULL,NULL,NULL,NULL,2,8,2),(10,_binary '\0',NULL,NULL,NULL,NULL,NULL,3,9,2),(11,_binary '',NULL,NULL,NULL,NULL,NULL,2,1,2),(12,_binary '\0',NULL,NULL,NULL,NULL,NULL,3,1,7),(13,_binary '\0',NULL,NULL,NULL,NULL,NULL,1,3,7),(14,_binary '\0',NULL,NULL,NULL,NULL,NULL,4,6,7),(15,_binary '\0',NULL,NULL,NULL,NULL,NULL,1,7,7),(16,_binary '\0',NULL,NULL,NULL,NULL,NULL,1,8,7),(17,_binary '\0',NULL,NULL,NULL,NULL,NULL,2,9,7),(18,_binary '',NULL,NULL,NULL,NULL,NULL,2,4,7),(19,_binary '',NULL,NULL,NULL,NULL,NULL,2,5,7),(20,_binary '\0',NULL,NULL,NULL,NULL,NULL,3,1,8),(21,_binary '\0',NULL,NULL,NULL,NULL,NULL,1,3,8),(22,_binary '\0',NULL,NULL,NULL,NULL,NULL,1,7,8),(23,_binary '\0',NULL,NULL,NULL,NULL,NULL,1,8,8),(24,_binary '\0',NULL,NULL,NULL,NULL,NULL,2,9,8),(25,_binary '',NULL,NULL,NULL,NULL,NULL,2,7,6),(26,_binary '',NULL,NULL,NULL,NULL,NULL,4,8,6),(27,_binary '',NULL,NULL,NULL,NULL,NULL,1,9,6),(28,_binary '\0',NULL,NULL,NULL,NULL,NULL,5,6,1),(29,_binary '\0',NULL,NULL,NULL,NULL,NULL,3,10,1),(30,_binary '',NULL,NULL,NULL,NULL,NULL,2,16,1),(31,_binary '',NULL,NULL,NULL,NULL,NULL,2,11,1),(32,_binary '\0',NULL,NULL,NULL,NULL,NULL,4,17,1),(33,_binary '\0',NULL,NULL,NULL,NULL,NULL,4,13,1),(34,_binary '\0',NULL,NULL,NULL,NULL,NULL,3,15,1);
/*!40000 ALTER TABLE `repair_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-23 15:16:24
