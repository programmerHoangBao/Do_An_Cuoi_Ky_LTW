-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: website_selling_cosmetics
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
-- Table structure for table `review_user`
--

DROP TABLE IF EXISTS `review_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_user` (
  `id_review_user` int NOT NULL AUTO_INCREMENT,
  `creation_time` datetime(6) DEFAULT NULL,
  `product_quality` int DEFAULT NULL,
  `review_content` text,
  `id_product` int NOT NULL,
  `id_user` int NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_review_user`),
  KEY `FKr8i93kka2kiucja0m2fhb42i8` (`id_product`),
  KEY `FKhvm1igg7mw76gtiskljaf9t6b` (`id_user`),
  CONSTRAINT `FKhvm1igg7mw76gtiskljaf9t6b` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `FKr8i93kka2kiucja0m2fhb42i8` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_user`
--

LOCK TABLES `review_user` WRITE;
/*!40000 ALTER TABLE `review_user` DISABLE KEYS */;
INSERT INTO `review_user` VALUES (1,'2024-01-15 12:00:00.000000',5,'Kem dưỡng ẩm rất tốt, rất đáng mua!',1,1,NULL),(2,'2024-01-16 14:00:00.000000',4,'Kem nền dễ tán nhưng hơi đắt.',2,1,NULL),(3,'2024-01-16 14:00:00.000000',3,'Ổn',1,1,NULL),(4,'2024-12-06 11:48:50.541000',1,'tệ',1,2,'/templates/images/1733460530534_logo.png'),(5,'2024-12-06 11:52:22.131000',5,'tuyệt vời',3,2,''),(6,'2024-12-06 11:53:55.577000',3,'tạm được',4,2,''),(7,'2024-12-06 13:16:54.180000',4,'a',1,2,''),(8,'2024-12-06 13:17:50.389000',1,'a',1,2,''),(9,'2024-12-06 13:59:47.529000',3,'tạm',1,2,'');
/*!40000 ALTER TABLE `review_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-08 23:25:04
