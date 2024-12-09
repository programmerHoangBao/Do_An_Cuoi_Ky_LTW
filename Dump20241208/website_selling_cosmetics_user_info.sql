-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: website_selling_cosmetics
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `otp` int DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,'22110388@hcmute.student.edu.vn',_binary '','nhan',NULL,'$2a$10$PbonrNx0OjuexVqdJt755ObWERdfqLGRFHltvTOZH4XNrGakPA5Qy','ROLE_ADMIN'),(2,'user1@example.com',_binary '','user1',NULL,'$2a$10$pGKmUcFE37JUhW4jrOUPvOIMFVtwoLrHN26G51L9UgO56SN9CGtti','ROLE_USER'),(3,'vendor1@example.com',_binary '','vendor1',NULL,'$2a$10$y/D2sPSlW4wGdeXD2oPNyOcz4RjT9hwcJ/D/y/CgQzy.S./Hj.GfG','ROLE_VENDOR'),(4,'admin2@example.com',_binary '','admin2',NULL,'$2a$12$mZoXSrTW8IP2xLX5GUiRXeuOJutPSN1xjsrTRrBM7nJGYKVrsSadW','ROLE_ADMIN'),(5,'user2@example.com',_binary '','user2',NULL,'$2a$12$mZoXSrTW8IP2xLX5GUiRXeuOJutPSN1xjsrTRrBM7nJGYKVrsSadW','ROLE_USER'),(6,'vendor2@example.com',_binary '','vendor2',NULL,'$2a$12$mZoXSrTW8IP2xLX5GUiRXeuOJutPSN1xjsrTRrBM7nJGYKVrsSadW','ROLE_VENDOR'),(7,'admin3@example.com',_binary '','admin3',NULL,'$2a$12$mZoXSrTW8IP2xLX5GUiRXeuOJutPSN1xjsrTRrBM7nJGYKVrsSadW','ROLE_ADMIN'),(8,'user3@example.com',_binary '','user3',NULL,'$2a$12$mZoXSrTW8IP2xLX5GUiRXeuOJutPSN1xjsrTRrBM7nJGYKVrsSadW','ROLE_USER'),(9,'vendor3@example.com',_binary '','vendor3',NULL,'$2a$12$mZoXSrTW8IP2xLX5GUiRXeuOJutPSN1xjsrTRrBM7nJGYKVrsSadW','ROLE_VENDOR'),(10,'user4@example.com',_binary '','user4',NULL,'$2a$12$mZoXSrTW8IP2xLX5GUiRXeuOJutPSN1xjsrTRrBM7nJGYKVrsSadW','ROLE_USER');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-09 10:27:51
