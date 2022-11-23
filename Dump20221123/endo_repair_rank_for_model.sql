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
-- Table structure for table `repair_rank_for_model`
--

DROP TABLE IF EXISTS `repair_rank_for_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair_rank_for_model` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `create_time` time DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_time` time DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `model_id` int DEFAULT NULL,
  `part_id` int DEFAULT NULL,
  `repair_rank_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKklrr2apqb66wjdwnm3t6v6i14` (`model_id`),
  KEY `FK2lbie2ypdpcqwiea6np6r4hev` (`part_id`),
  KEY `FKb5q2luk4yihr60hqbfp6ajkn3` (`repair_rank_id`),
  CONSTRAINT `FK2lbie2ypdpcqwiea6np6r4hev` FOREIGN KEY (`part_id`) REFERENCES `part` (`id`),
  CONSTRAINT `FKb5q2luk4yihr60hqbfp6ajkn3` FOREIGN KEY (`repair_rank_id`) REFERENCES `repair_rank` (`id`),
  CONSTRAINT `FKklrr2apqb66wjdwnm3t6v6i14` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_rank_for_model`
--

LOCK TABLES `repair_rank_for_model` WRITE;
/*!40000 ALTER TABLE `repair_rank_for_model` DISABLE KEYS */;
INSERT INTO `repair_rank_for_model` VALUES (1,_binary '',NULL,NULL,NULL,NULL,2,2,1,1),(2,_binary '\0',NULL,NULL,NULL,NULL,2,2,3,1),(3,_binary '\0',NULL,NULL,NULL,NULL,2,2,4,1),(4,_binary '',NULL,NULL,NULL,NULL,1,2,2,1),(5,_binary '\0',NULL,NULL,NULL,NULL,1,6,1,4),(6,_binary '\0',NULL,NULL,NULL,NULL,1,6,4,4),(7,_binary '\0',NULL,NULL,NULL,NULL,1,2,5,1),(8,_binary '',NULL,NULL,NULL,NULL,1,2,7,1),(9,_binary '',NULL,NULL,NULL,NULL,1,2,8,1),(10,_binary '',NULL,NULL,NULL,NULL,1,7,7,1),(11,_binary '\0',NULL,NULL,NULL,NULL,2,7,8,1),(12,_binary '\0',NULL,NULL,NULL,NULL,3,7,9,1),(13,_binary '\0',NULL,NULL,NULL,NULL,4,7,1,1),(14,_binary '',NULL,NULL,NULL,NULL,1,8,7,4),(15,_binary '\0',NULL,NULL,NULL,NULL,1,8,8,4),(16,_binary '\0',NULL,NULL,NULL,NULL,3,8,9,4),(17,_binary '\0',NULL,NULL,NULL,NULL,4,8,1,4),(18,_binary '\0',NULL,NULL,NULL,NULL,3,6,1,1),(19,_binary '\0',NULL,NULL,NULL,NULL,1,6,3,1),(20,_binary '\0',NULL,NULL,NULL,NULL,1,6,7,1),(21,_binary '\0',NULL,NULL,NULL,NULL,1,6,8,1),(22,_binary '\0',NULL,NULL,NULL,NULL,2,6,9,1),(23,_binary '',NULL,NULL,NULL,NULL,3,2,9,1),(24,_binary '\0',NULL,NULL,NULL,NULL,2,2,10,1),(25,_binary '',NULL,NULL,NULL,NULL,1,2,16,1),(26,_binary '\0',NULL,NULL,NULL,NULL,3,2,17,1),(27,_binary '',NULL,NULL,NULL,NULL,2,2,13,1),(28,_binary '',NULL,NULL,NULL,NULL,2,2,14,1),(29,_binary '\0',NULL,NULL,NULL,NULL,3,2,6,1),(30,_binary '\0',NULL,NULL,NULL,NULL,2,2,11,1);
/*!40000 ALTER TABLE `repair_rank_for_model` ENABLE KEYS */;
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
