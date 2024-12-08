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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `creation_time` datetime(6) NOT NULL,
  `quantity` int NOT NULL,
  `status_order` varchar(100) NOT NULL,
  `total` double DEFAULT NULL,
  `id_product` int NOT NULL,
  `id_product_color` int NOT NULL,
  `id_user` int NOT NULL,
  `id_shop` int NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `FKsoclk60d46iorvowq8wpud2bc` (`id_product`),
  KEY `FKrw3mieegboiwta76t75uhxj11` (`id_product_color`),
  KEY `FKtb6jdc061vu6ydv1445lrigtb` (`id_user`),
  KEY `FKop4m3d13dm46n4b28r8wkgprb` (`id_shop`),
  CONSTRAINT `FKop4m3d13dm46n4b28r8wkgprb` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id_shop`),
  CONSTRAINT `FKrw3mieegboiwta76t75uhxj11` FOREIGN KEY (`id_product_color`) REFERENCES `product_color` (`id_product_color`),
  CONSTRAINT `FKsoclk60d46iorvowq8wpud2bc` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`),
  CONSTRAINT `FKtb6jdc061vu6ydv1445lrigtb` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2024-12-07 12:59:19.205000',1,'Đã nhận',19.99,1,1,5,1),(2,'2024-12-07 12:59:19.297000',1,'Đã nhận',29.99,2,5,5,1),(3,'2024-12-07 13:13:08.342000',1,'Đã nhận',19.99,1,1,5,2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
