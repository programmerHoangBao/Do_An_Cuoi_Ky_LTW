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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `birth_date` date NOT NULL,
  `email` varchar(150) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `password_user` varchar(200) NOT NULL,
  `role_user` varchar(20) NOT NULL,
  `sign_up_date` date NOT NULL,
  `username` varchar(50) NOT NULL,
  `address` varchar(250) DEFAULT NULL,
  `phone` varchar(10) NOT NULL,
  `status_user` int NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'1990-05-15','22110388@hcmute.student.edu.vn','Admin One','/images/admin1.jpg','password1','ROLE_ADMIN','2024-01-01','nhan','123 Admin Street','0901234567',1),(2,'1992-07-20','user1@example.com','User One 1','/images/user1.jpg','password2','ROLE_USER','2024-02-15','user1','456 User Avenue','0912345678',1),(3,'1995-03-12','vendor1@example.com','Vendor One','/images/vendor1.jpg','password3','ROLE_VENDOR','2024-03-10','vendor1','789 Vendor Road','0923456789',1),(4,'1988-11-05','admin2@example.com','Admin Two','/images/admin2.jpg','password4','ROLE_ADMIN','2024-01-10','admin2','321 Admin Blvd','0934567890',1),(5,'1993-09-18','user2@example.com','User Two','/images/user2.jpg','password5','ROLE_USER','2024-02-20','user2','654 User Lane','0945678901',1),(6,'1996-06-22','vendor2@example.com','Vendor Two','/images/vendor2.jpg','password6','ROLE_VENDOR','2024-03-15','vendor2','987 Vendor Court','0956789012',1),(7,'1991-12-30','admin3@example.com','Admin Three','/images/admin3.jpg','password7','ROLE_ADMIN','2024-01-15','admin3','789 Admin Terrace','0967890123',1),(8,'1994-04-14','user3@example.com','User Three','/images/user3.jpg','password8','ROLE_USER','2024-02-25','user3','123 User Square','0978901234',1),(9,'1997-10-28','vendor3@example.com','Vendor Three','/images/vendor3.jpg','password9','ROLE_VENDOR','2024-03-20','vendor3','456 Vendor Circle','0989012345',1),(10,'1989-08-07','user4@example.com','User Four 02','/images/user4.jpg','password10','ROLE_USER','2024-02-28','user4','789 User Place','0990123456',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-09 10:27:50
