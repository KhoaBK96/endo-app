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
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `create_time` time DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_time` time DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES (1,_binary '',NULL,NULL,NULL,NULL,'GIF-Q180F'),(2,_binary '\0',NULL,NULL,NULL,NULL,'GIF-H180'),(3,_binary '\0',NULL,NULL,NULL,NULL,'CF-Q180'),(4,_binary '\0',NULL,NULL,NULL,NULL,'GIF-HQ190'),(5,_binary '\0',NULL,NULL,NULL,NULL,'CF-H180'),(6,_binary '\0',NULL,NULL,NULL,NULL,'GIF-Q160');
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part`
--

LOCK TABLES `part` WRITE;
/*!40000 ALTER TABLE `part` DISABLE KEYS */;
INSERT INTO `part` VALUES (1,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,3,'F12345','Thân ống soi '),(2,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,100,'G1234','Dây dẫn sáng'),(3,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,50,'A1234','Bộ phận kết nối '),(4,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,99,'B1234','EL-connector');
/*!40000 ALTER TABLE `part` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_detail`
--

LOCK TABLES `repair_detail` WRITE;
/*!40000 ALTER TABLE `repair_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `repair_detail` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_order`
--

LOCK TABLES `repair_order` WRITE;
/*!40000 ALTER TABLE `repair_order` DISABLE KEYS */;
INSERT INTO `repair_order` VALUES (1,_binary '\0','TW HUE',NULL,NULL,NULL,NULL,0,2,1,'A1234');
/*!40000 ALTER TABLE `repair_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair_rank`
--

DROP TABLE IF EXISTS `repair_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair_rank` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `create_time` time DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_time` time DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `rank_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_rank`
--

LOCK TABLES `repair_rank` WRITE;
/*!40000 ALTER TABLE `repair_rank` DISABLE KEYS */;
INSERT INTO `repair_rank` VALUES (1,_binary '\0',NULL,NULL,NULL,NULL,NULL,'A1'),(2,_binary '\0',NULL,NULL,NULL,NULL,NULL,'B'),(3,_binary '',NULL,NULL,NULL,NULL,NULL,'C'),(4,_binary '\0',NULL,NULL,NULL,NULL,NULL,'C'),(5,_binary '\0',NULL,NULL,NULL,NULL,NULL,'B+');
/*!40000 ALTER TABLE `repair_rank` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_rank_for_model`
--

LOCK TABLES `repair_rank_for_model` WRITE;
/*!40000 ALTER TABLE `repair_rank_for_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `repair_rank_for_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'MANAGER',_binary '\0','Quan ly'),(2,'MANAGER',_binary '','Quan ly'),(3,'MANAGER',_binary '\0','ky su edit');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,_binary '\0','Tran Xuan Khoa','$2a$10$ITWV/2mvTq92mfqbDXCdgOSyww8QbIbdQkaVrHwn1GUzo4k3V7/ne','0123456789','khoa28',1),(2,_binary '','Nguyen Hoang Quan','$2a$10$t0gjj5rPuXChescp2fhT2epDbSDRe3k2o7rkXGXwhIFEWi9qd7Yje','0333223743','hoang2',3),(3,_binary '\0','Tran Van Nhan','$2a$10$kfOpzp/KU3YxmHN05kzPg.LXJbwHSVqdxhnoobZ/hZ2PRxyINRr9C','0122233344','nhan22',3);
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

-- Dump completed on 2022-11-04 16:41:53
