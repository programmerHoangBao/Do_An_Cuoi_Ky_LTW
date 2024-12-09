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
-- Table structure for table `product_color`
--

DROP TABLE IF EXISTS `product_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_color` (
  `id_product_color` int NOT NULL AUTO_INCREMENT,
  `color` varchar(100) DEFAULT NULL,
  `image_product` varchar(500) NOT NULL,
  `id_product` int NOT NULL,
  PRIMARY KEY (`id_product_color`),
  KEY `FKktjhgqgbxctxtdlxopux4ifve` (`id_product`),
  CONSTRAINT `FKktjhgqgbxctxtdlxopux4ifve` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_color`
--

LOCK TABLES `product_color` WRITE;
/*!40000 ALTER TABLE `product_color` DISABLE KEYS */;
INSERT INTO `product_color` VALUES (7,'Xanh','/templates/images/08-12-24 21-10-41Neutrogena-Hydro-Boost-Water-Gel-15gr.jpg',1),(8,'Vàng','/templates/images/08-12-24 21-11-29a1(1).jpg',2),(9,'Đỏ','/templates/images/08-12-24 21-13-27Dầu-gội-Tsubaki-Premium.jpg',3),(10,'Vàng','/templates/images/08-12-24 21-13-27Dầu-gội-Tsubaki-Premium.jpg',3),(11,'Đỏ','/templates/images/08-12-24 21-14-52Nuoc-hoa-The Body-Shop-Japanese-Cherry-Blossom-Eau-De-Toilette-hinh-1.jpg',4),(12,'Hồng','/templates/images/08-12-24 21-14-52nuoc-hoa-The-Body-Shop-Atlas-Mountain-Rose.jpg',4),(13,'Đỏ','/templates/images/09-12-24 07-25-53Vaseline-Body-Lotion-725ml.jpg',5),(14,'Xanh','/templates/images/09-12-24 07-28-25mat-na-ngu-Laneige-Water-Sleeping-Mask-15ml1.jpg',7),(15,'Xanh','/templates/images/09-12-24 07-29-49srm-greentea.jpg',8),(16,'Vàng','/templates/images/09-12-24 07-30-24Olexrs-Hair-Salon-Collagen-Complex-Repair-Conditioner-500ml.jpg',9),(17,'Xanh','/templates/images/09-12-24 07-32-13facebook-dynamic-bo-cham-soc-toc-cocoon-dau-goi-500ml-dau-xa-310ml-nuoc-duong-toc-tinh-dau-buoi-140ml-1721967557_img_385x385_622873_fit_center.jpg',10),(18,'Hồng','/templates/images/09-12-24 07-32-46hinh-anh-son-duong-co-mau-Vacosi-Color-Lip-Balm112.jpg',11),(19,'Hồng','/templates/images/09-12-24 07-33-35facebook-dynamic-phan-ma-hong-maybelline-min-li-chuan-mau-30-fierce-4-5g-1724052130_img_385x385_622873_fit_center.jpg',12),(20,'Hồng','/templates/images/09-12-24 07-34-18promotions-auto-combo-judydoll-bang-highlight-va-tao-khoi-01-tong-lanh-phan-ma-hong-44-hong-sua-9g-2g_ZkdbwmCiL1TTs6i9_img_385x385_622873_fit_center.png',13),(21,'Hồng','/templates/images/09-12-24 07-40-02facebook-dynamic-250900072-1705722101_img_385x385_622873_fit_center.png',14),(22,'Vàng','/templates/images/09-12-24 07-40-37facebook-dynamic-347800034-1730079314_img_385x385_622873_fit_center.jpg',15),(23,'Hồng','/templates/images/09-12-24 07-41-13facebook-dynamic-nuoc-hoa-nu-armaf-club-de-nuit-woman-105ml-1723431690_img_385x385_622873_fit_center.jpg',16),(24,'Xanh','/templates/images/09-12-24 07-42-02promotions-auto-nuoc-hoa-nam-laura-anne-diamond-homme-dark-blue-edp-45ml_d6Wu4mHzhzfhpe4R_img_385x385_622873_fit_center.png',17),(25,'Hồng','/templates/images/09-12-24 07-42-49facebook-dynamic-206800009-1733380052_img_385x385_622873_fit_center.jpg',18),(26,'Xanh','/templates/images/09-12-24 07-44-03promotions-auto-gel-tay-te-bao-chet-bio-essence-tinh-chat-sua-ong-chua-60g_VBx3hpZyCwBfNYAk_img_385x385_622873_fit_center.png',19),(27,'Đỏ','/templates/images/09-12-24 07-45-14promotions-auto-sua-tam-on-the-body-huong-nuoc-hoa-classic-pink-1000g_PY1okYQMcDDAtY9R_img_385x385_622873_fit_center.png',20),(32,'Đỏ','/templates/images/09-12-24 09-17-29a1(1).jpg',22),(33,'Vàng','/templates/images/09-12-24 09-17-29Dầu-gội-Tsubaki-Premium.jpg',22),(34,'Đỏ','/templates/images/09-12-24 09-32-36Dầu-gội-Tsubaki-Premium.jpg',23),(36,'Đỏ','/templates/images/09-12-24 09-54-16facebook-dynamic-bo-cham-soc-toc-cocoon-dau-goi-500ml-dau-xa-310ml-nuoc-duong-toc-tinh-dau-buoi-140ml-1721967557_img_385x385_622873_fit_center.jpg',24),(37,'Hồng','/templates/images/09-12-24 09-54-16facebook-dynamic-nuoc-hoa-nu-armaf-club-de-nuit-woman-105ml-1723431690_img_385x385_622873_fit_center.jpg',24),(39,'Đỏ','/templates/images/09-12-24 10-03-08facebook-dynamic-bo-cham-soc-toc-cocoon-dau-goi-500ml-dau-xa-310ml-nuoc-duong-toc-tinh-dau-buoi-140ml-1721967557_img_385x385_622873_fit_center.jpg',25),(40,'Đỏ','/templates/images/09-12-24 10-08-30facebook-dynamic-347800034-1730079314_img_385x385_622873_fit_center.jpg',26),(41,'Đỏ','/templates/images/09-12-24 10-09-01facebook-dynamic-bo-cham-soc-toc-cocoon-dau-goi-500ml-dau-xa-310ml-nuoc-duong-toc-tinh-dau-buoi-140ml-1721967557_img_385x385_622873_fit_center.jpg',21);
/*!40000 ALTER TABLE `product_color` ENABLE KEYS */;
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
