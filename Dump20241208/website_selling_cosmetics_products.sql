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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id_product` int NOT NULL AUTO_INCREMENT,
  `name_product` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  `id_category` int NOT NULL,
  `id_shop` int NOT NULL,
  `status_product` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_product`),
  KEY `FKip7b0y8ja7fsm5wl7mhmseh5n` (`id_category`),
  KEY `FKatf5hnpbftujhi0jjlaju6i40` (`id_shop`),
  CONSTRAINT `FKatf5hnpbftujhi0jjlaju6i40` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id_shop`),
  CONSTRAINT `FKip7b0y8ja7fsm5wl7mhmseh5n` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Kem dưỡng ẩm',19.99,100,1,1,1),(2,'Kem nền',29.99,43,2,2,1),(3,'Dầu gội',15.49,75,3,1,1),(4,'Nước hoa',49.99,30,4,1,1),(5,'Sữa dưỡng thể',12.99,120,5,1,1),(7,'Mặt nạ ngủ',18.49,199,1,2,1),(8,'Sữa rửa mặt',12.99,180,1,1,1),(9,'Dầu xả',20.99,75,3,2,1),(10,'Bộ chăm sóc tóc',45.99,50,3,1,1),(11,'Son dưỡng môi',9.99,300,2,1,1),(12,'Phấn má hồng',15.99,150,2,2,1),(13,'Bộ trang điểm',40.99,60,2,1,1),(14,'Shampoo tăng trưởng tóc',19.49,80,3,2,1),(15,'Dầu gội trị rụng tóc',25.99,100,3,1,1),(16,'Nước hoa nữ',79.99,40,4,2,1),(17,'Nước hoa nam',99.99,20,4,1,1),(18,'Sữa dưỡng thể hương hoa',18.99,120,5,1,1),(19,'Tẩy tế bào chết',13.49,200,5,2,1),(20,'Kem chống nắng body',25.99,150,5,1,1),(21,'Dầu rội đầu',30.99,90,1,1,1),(22,'Dầu gội đầu',30.99,90,1,1,1),(23,'Dầu gội đầu',30.99,90,1,1,1),(24,'dàu gồi đầu bao',30.99,90,1,1,1),(25,'Dầu rội đầu',30.99,90,1,1,1),(26,'son 01',30.99,90,1,1,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
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
