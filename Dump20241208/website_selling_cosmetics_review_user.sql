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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_user`
--

LOCK TABLES `review_user` WRITE;
/*!40000 ALTER TABLE `review_user` DISABLE KEYS */;
INSERT INTO `review_user` VALUES (1,'2024-01-15 12:00:00.000000',5,'Kem dưỡng ẩm rất tốt, rất đáng mua!',1,1,NULL),(2,'2024-01-16 14:00:00.000000',4,'Kem nền dễ tán nhưng hơi đắt.',2,1,NULL),(3,'2024-01-16 14:00:00.000000',3,'Ổn',1,1,NULL),(4,'2024-12-06 11:48:50.541000',1,'tệ',1,2,'/templates/images/1733460530534_logo.png'),(5,'2024-12-06 11:52:22.131000',5,'tuyệt vời',3,2,''),(6,'2024-12-06 11:53:55.577000',3,'tạm được',4,2,''),(7,'2024-12-06 13:16:54.180000',4,'a',1,2,''),(8,'2024-12-06 13:17:50.389000',1,'a',1,2,''),(9,'2024-12-06 13:59:47.529000',3,'tạm',1,2,''),(10,'2024-12-08 21:49:23.302000',4,'Thấy cũng đẹp nhưng chưa mua ',1,5,''),(12,'2024-12-08 22:32:48.275000',5,'đẹp',1,5,'/templates/images/1733671968269_Nuoc-hoa-The Body-Shop-Japanese-Cherry-Blossom-Eau-De-Toilette-hinh-1.jpg;'),(13,'2024-12-08 22:34:54.685000',1,'xấu',2,5,''),(14,'2024-12-08 22:36:23.128000',3,'xấu',2,5,'/templates/images/1733672183124_Neutrogena-Hydro-Boost-Water-Gel-15gr.jpg'),(15,'2024-12-09 08:04:27.019000',4,'Sản phẩm đẹp',3,5,'/templates/images/1733706267005_a1(1).jpg'),(16,'2024-12-09 08:20:23.097000',4,'a',7,5,''),(17,'2024-12-09 08:53:31.366000',4,'đẸP',7,5,'/templates/images/1733709211358_a1(1).jpg'),(18,'2024-12-09 09:42:44.873000',4,'rẤT TỐT',2,5,'/templates/images/1733712164873_a1(1).jpg'),(19,'2024-12-09 10:12:09.665000',1,'Tệ',2,5,'/templates/images/1733713929665_a1(1).jpg');
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

-- Dump completed on 2024-12-09 10:27:49
