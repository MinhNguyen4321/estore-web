CREATE DATABASE IF NOT EXISTS `estore` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `estore`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: estore
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authority` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `UserId` bigint NOT NULL,
  `RoleId` bigint NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Authority_User` (`UserId`),
  KEY `FK_Authority_Role` (`RoleId`),
  CONSTRAINT `FK_Authority_Role` FOREIGN KEY (`RoleId`) REFERENCES `role` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Authority_User` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES (1,1,1),(22,1,2),(28,1,1),(35,3,2),(41,3,1),(42,3,3),(43,2,2);
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Brand_Slug` (`Slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Apple','apple'),(2,'Samsung','samsung'),(3,'Asus','asus'),(4,'HP','hp'),(5,'Xiaomi','xiaomi'),(6,'BeU','beu');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `NameVI` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NameEN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Category_Slug` (`Slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'??i???n tho???i','Phone','phone'),(2,'M??y t??nh b???ng','Tablet','tablet'),(3,'M??y t??nh x??ch tay','Laptop','laptop'),(4,'M??y t??nh ????? b??n','PC','pc'),(5,'?????ng h??? th??ng minh','Smartwatch','smartwatch'),(6,'Tai nghe','Headphone','headphone');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `SaleOff` double NOT NULL,
  `StartDate` datetime(6) NOT NULL,
  `EndDate` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (1,'Khuy???n m??i ?????u n??m',10,'2022-01-10 10:04:58.000000','2022-02-22 12:50:34.000000',0,'2022-02-18 20:04:58'),(3,'Khuy???n m??i th??ng 2',10,'2022-02-10 00:00:00.000000','2022-04-05 07:29:21.052000',0,'2022-02-21 14:41:16'),(6,'Khuy???n m??i th??ng 3',15,'2022-03-03 23:05:00.558000','2022-04-05 05:47:40.914000',0,'2022-04-03 16:05:17'),(7,'Khuy???n m??i th??ng 4',5,'2022-04-01 00:00:00.867000','2022-04-30 12:00:00.867000',1,'2022-04-04 22:47:30'),(14,'Khuy???n m??i th??ng 4',10,'2022-04-09 00:00:00.957000','2022-04-30 12:30:00.957000',1,'2022-04-09 03:54:22'),(15,'Khuy???n m??i th??ng 4',15,'2022-04-09 00:00:00.484000','2022-04-30 12:30:00.484000',1,'2022-04-09 03:54:43');
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `OrderCode` varchar(11) NOT NULL,
  `UserId` bigint NOT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` int NOT NULL DEFAULT '0',
  `Fullname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email` varchar(128) NOT NULL,
  `PhoneNumber` varchar(10) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Order_OrderCode` (`OrderCode`),
  KEY `FK_Order_User` (`UserId`),
  CONSTRAINT `FK_Order_User` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (3,'d3htmb6yask',1,'2021-12-10 21:13:00',1,'Nguy???n Th??? Mai','????? R??n - ????n D????ng - L??m ?????ng','maint@gmail.com','0389894357'),(4,'N7CKkltEtzD',1,'2021-10-04 21:13:58',1,'Nguy???n Th??? Mai','????? R??n - ????n D????ng - L??m ?????ng','maint@gmail.com','0389894357'),(5,'PA52heWJsvR',2,'2021-12-15 21:14:50',2,'Phan Th??? Qu???nh Anh','Trung M??? T??y, Qu???n 12, TP.HCM','anhptq@gmail.com','0389894357'),(7,'dawsOF3L5Us',3,'2022-04-06 14:23:09',1,'Admin','Ph?????ng Trung M??? T??y, Qu???n 12, TP.HCM','admin@gmail.com','0345679898'),(9,'HrPFCR4RH8U',3,'2022-04-08 04:07:18',2,'Admin','Ph?????ng Trung M??? T??y, Qu???n 12, TP.HCM','admin@gmail.com','0345679898'),(10,'l9O0i3l3bLX',3,'2022-04-09 07:51:15',0,'Admin','Ph?????ng Trung M??? T??y, Qu???n 12, TP.HCM','admin@gmail.com','0345679898'),(11,'gljmuhe3rLK',2,'2022-04-09 15:55:18',0,'Phan Th??? Qu???nh Anh','Trung M??? T??y, Qu???n 12, TP.HCM','anhptq@gmail.com','0389894357'),(12,'VQnUGuXI3We',3,'2022-04-09 16:44:26',3,'Admin','Ph?????ng Trung M??? T??y, Qu???n 12, TP.HCM','admin@gmail.com','0345679898');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `OrderId` bigint NOT NULL,
  `ProductId` bigint NOT NULL,
  `Quantity` int NOT NULL,
  `Price` double NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_OrderDetail_Order` (`OrderId`),
  KEY `FK_OrderDetail_Product` (`ProductId`),
  CONSTRAINT `FK_OrderDetail_Order` FOREIGN KEY (`OrderId`) REFERENCES `order` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_OrderDetail_Product` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (3,3,3,1,29440500),(4,4,10,1,31290000),(5,5,13,1,4990000),(7,7,12,2,8990000),(9,9,3,1,29440500),(10,10,3,1,29440500),(11,10,9,1,17850500),(12,11,3,2,30990000),(13,12,18,1,1990000);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persistent_logins`
--

DROP TABLE IF EXISTS `persistent_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persistent_logins` (
  `username` varchar(100) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` datetime(6) NOT NULL,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Image` varchar(150) NOT NULL,
  `ImagePreview1` varchar(150) NOT NULL,
  `ImagePreview2` varchar(150) DEFAULT NULL,
  `ImagePreview3` varchar(150) DEFAULT NULL,
  `ImagePreview4` varchar(150) DEFAULT NULL,
  `VideoPreview` varchar(150) DEFAULT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Quantity` int DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Available` int NOT NULL DEFAULT '0',
  `CategoryId` bigint NOT NULL,
  `BrandId` bigint NOT NULL,
  `DiscountId` bigint DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Product_Slug` (`Slug`),
  KEY `FK_Product_Brand` (`BrandId`),
  KEY `FK_Product_Category` (`CategoryId`),
  KEY `FK_Product_Discount` (`DiscountId`),
  CONSTRAINT `FK_Product_Brand` FOREIGN KEY (`BrandId`) REFERENCES `brand` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Product_Category` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Product_Discount` FOREIGN KEY (`DiscountId`) REFERENCES `discount` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'iPhone 13 128GB','iphone-13-128gb','https://cdn.cellphones.com.vn/media/catalog/product/cache/7/small_image/9df78eab33525d08d6e5fb8d27136e95/i/p/ip13-pro_2.jpg','https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-black-1.jpg','https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-black-2.jpg','https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-black-3.jpg','https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-white-2.jpg','RF6F5vwbyok','M???i l???n ra m???t phi??n b???n m???i l?? m???i l???n iPhone chi???m s??ng tr??n kh???p c??c m???t tr???n v?? l???n n??y c??i t??n khi???n v?? s??? ng?????i \"s???c s??i\" l?? iPhone 13 Pro, chi???c ??i???n tho???i th??ng minh v???n gi??? nguy??n thi???t k??? cao c???p, c???m 3 camera ???????c n??ng c???p, c???u h??nh m???nh m??? c??ng th???i l?????ng pin l???n ???n t?????ng.',100,32490000,'2022-04-02 17:00:00',0,1,1,NULL),(2,'iPhone XR 128GB','iphone-xr-128gb','https://cdn.cellphones.com.vn/media/catalog/product/cache/7/small_image/9df78eab33525d08d6e5fb8d27136e95/i/p/iphone_xr_red_1.png','https://cdn.tgdd.vn/Products/Images/42/191483/iphone-xr-128gb-trang-1-1-org.jpg','https://cdn.tgdd.vn/Products/Images/42/191483/iphone-xr-128gb-trang-2-org.jpg','https://cdn.tgdd.vn/Products/Images/42/191483/iphone-xr-128gb-trang-3-org.jpg','https://cdn.tgdd.vn/Products/Images/42/191483/iphone-xr-128gb-trang-4-org.jpg','9LpyLziSSK0','???????c xem l?? phi??n b???n iPhone gi?? r??? ?????y ho??n h???o, iPhone Xr 128GB khi???n ng?????i d??ng c?? nhi???u s??? l???a ch???n h??n v??? m??u s???c ??a d???ng nh??ng v???n s??? h???u c???u h??nh m???nh m??? v?? thi???t k??? sang tr???ng.',100,17490000,'2022-04-02 17:00:00',0,1,1,NULL),(3,'Apple MacBook Air M1 2020 16GB/256GB/7-core GPU','apple-macbook-air-m1-2020-16gb256gb7-core-gpu','https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-1-org.jpg','https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-1-org.jpg','https://cdn.tgdd.vn/Products/Images/44/239552/macbook-air-m1-2020-silver-02-org.jpg','https://cdn.tgdd.vn/Products/Images/44/239552/macbook-air-m1-2020-silver-03-org.jpg','https://cdn.tgdd.vn/Products/Images/44/239552/macbook-air-m1-2020-silver-04-org.jpg','YqLueJ0hDV8','Laptop Apple MacBook Air M1 2020 c?? thi???t k??? ?????p, sang tr???ng v???i CPU M1 ?????c quy???n t??? Apple cho hi???u n??ng ????? h???a cao, m??n h??nh Retina hi???n th??? si??u n??t c??ng v???i h??? th???ng b???o m???t t???i ??u.',344,30990000,'2022-04-09 16:43:37',0,3,1,7),(4,'iPhone 12 Pro Max 512GB','iphone-12-pro-max-512gb','https://cdn.cellphones.com.vn/media/catalog/product/cache/7/small_image/9df78eab33525d08d6e5fb8d27136e95/i/p/iphone_12_pro_max_white.png','https://cdn.tgdd.vn/Products/Images/42/228744/iphone-12-pro-max-512gb-1-org.jpg','https://cdn.tgdd.vn/Products/Images/42/228744/iphone-12-pro-max-512gb-2-org.jpg','https://cdn.tgdd.vn/Products/Images/42/228744/iphone-12-pro-max-512gb-3-org.jpg','https://cdn.tgdd.vn/Products/Images/42/228744/iphone-12-pro-max-512gb-5-org.jpg','DQgPImbgiKg','iPhone 12 Pro Max 512GB - ?????ng c???p t??? t??n g???i ?????n t???ng chi ti???t. Ngay t??? khi ch??? l?? tin ?????n th?? chi???c smartphone n??y ???? l??m ?????ng ng???i kh??ng y??n bao ???fan c???ng??? nh?? Apple, v???i nh???ng n??ng c???p v?? c??ng n???i b???t h???a h???n s??? mang ?????n nh???ng tr???i nghi???m t???t nh???t v??? m???i m???t m?? ch??a m???t chi???c iPhone ti???n nhi???m n??o c?? ???????c.',100,41990000,'2022-04-02 17:00:00',0,1,1,NULL),(5,'Samsung Galaxy Z Fold3 5G 256GB','samsung-galaxy-z-fold3-5g-256gb','https://cdn.tgdd.vn/Products/Images/42/226935/samsung-galaxy-z-fold-3-silver-1-600x600.jpg','https://cdn.tgdd.vn/Products/Images/42/226935/samsung-galaxy-z-fold-3-1-1-org.jpg','https://cdn.tgdd.vn/Products/Images/42/226935/samsung-galaxy-z-fold-3-2-1-org.jpg','https://cdn.tgdd.vn/Products/Images/42/226935/samsung-galaxy-z-fold-3-3-1-org.jpg','https://cdn.tgdd.vn/Products/Images/42/226935/samsung-galaxy-z-fold-3-4-1-org.jpg','bASu58FOYDQ','Kh??ng d???ng l???i ??? m???t chi???c ??i???n tho???i th??ng minh cao c???p, m?? n?? c??n b???n b??? v?? k???t n???i si??u t???c v???i 5G. K??? ?????n l?? m??n h??nh tr??n vi???n l???n v???i tr???i nghi???m g???p m??? ?????c nh???t ????? b???n c?? th??? gi???i tr?? v?? l??m vi???c ??? m???t c??ch ho??n h???o.<br/><br/>Nh??? ch??? ????? g???p m??? ??a g??c ????? Flex Mode, Galaxy Z Fold3 5G m??? ra m???t th??? gi???i tuy???t v???i v???i kh??? n??ng ?????ng th???ng ?????c ????o.2 Thi???t k??? c??n ?????i ho??n h???o cho b???n th???a s???c kh??m ph?? k??? nguy??n ti???p theo c???a t????ng lai ??i???n tho???i th??ng minh.',100,41990000,'2022-04-02 17:00:00',0,1,2,NULL),(6,'Samsung Galaxy S21 FE 5G 128GB','samsung-galaxy-s21-fe-5g-128gb','https://cdn.tgdd.vn/Products/Images/42/267211/Samsung-Galaxy-S21-FE-tim-600x600.jpg','https://cdn.tgdd.vn/Products/Images/42/267211/samsung-galaxy-s21-fe-trang-4.jpg','https://cdn.tgdd.vn/Products/Images/42/267211/samsung-galaxy-s21-fe-tim-1.jpg','https://cdn.tgdd.vn/Products/Images/42/267211/samsung-galaxy-s21-fe-tim-2.jpg','https://cdn.tgdd.vn/Products/Images/42/267211/samsung-galaxy-s21-fe-tim-3.jpg','7MEpNQpd2hU','Ti???p n???i s??? th??nh c??ng c???a Galaxy S20 FE, g?? kh???ng l??? H??n Qu???c ti???p t???c cho ra m???t Samsung S21 FE v???i ?????nh h?????ng t???t v??? gi?? ??? m???nh v??? hi???u n??ng c???a m??nh cho ph??n kh??c cao c???p. S???n ph???m l?? s??? k???t h???p ho??n h???o c???a m???t thi???t k??? th???i trang, c???u h??nh v?? hi???u n??ng m???nh m??? ??i k??m m???c gi?? t???t cho ng?????i d??ng.',50,15990000,'2022-04-09 03:55:29',0,1,2,15),(7,'Samsung Galaxy A03s','samsung-galaxy-a03s','https://cdn.tgdd.vn/Products/Images/42/241049/samsung-galaxy-a03s-black-600x600.jpg','https://cdn.tgdd.vn/Products/Images/42/241049/samsung-galaxy-a03s-black-gc-org.jpg','https://cdn.tgdd.vn/Products/Images/42/241049/samsung-galaxy-a03s-black-4.jpg','https://cdn.tgdd.vn/Products/Images/42/241049/samsung-galaxy-a03s-black-5.jpg','https://cdn.tgdd.vn/Products/Images/42/241049/samsung-galaxy-a03s-black-3.jpg','6zhdoERt_AM','Nh???m ??em ?????n cho ng?????i d??ng th??m s??? l???a ch???n trong ph??n kh??c, Samsung ???? cho ra m???t th??m m???t chi???c ??i???n tho???i gi?? r??? v???i t??n g???i Galaxy A03s. So v???i ng?????i ti???n nhi???m Galaxy A02s, thi???t b??? s??? c?? m???t s??? n??ng c???p m???i, ????y h???a h???n s??? l?? s???n ph???m ????ng ????? b???n tr???i nghi???m.',100,3690000,'2022-04-02 17:00:00',0,1,2,NULL),(8,'Samsung Galaxy Z Flip3 5G 128GB','samsung-galaxy-z-flip3-5g-128gb','https://cdn.tgdd.vn/Products/Images/42/241049/samsung-galaxy-a03s-black-600x600.jpg','https://cdn.tgdd.vn/Products/Images/42/229949/samsung-galaxy-z-flip-3-black-gc-org.jpg','https://cdn.tgdd.vn/Products/Images/42/229949/samsung-galaxy-z-flip3-black-1-org.jpg','https://cdn.tgdd.vn/Products/Images/42/229949/samsung-galaxy-z-flip3-black-2-org.jpg','https://cdn.tgdd.vn/Products/Images/42/229949/samsung-galaxy-z-flip3-black-3-org.jpg','jECDdUHO-Fw','Trong s??? ki???n Galaxy Unpacked h???i 11/8, Samsung ???? ch??nh th???c tr??nh l??ng m???u ??i???n tho???i m??n h??nh g???p th??? h??? m???i mang t??n Galaxy Z Flip3 5G 128GB. ????y l?? m???t si??u ph???m v???i m??n h??nh g???p d???ng v??? s?? c??ng nhi???u ??i???m c???i ti???n v?? th??ng s??? ???n t?????ng, s???n ph???m ch???c ch???n s??? thu h??t ???????c r???t nhi???u s??? quan t??m c???a ng?????i d??ng, ?????c bi???t l?? ph??i n???.',80,24990000,'2022-04-06 10:06:31',0,1,2,NULL),(9,'Asus VivoBook A415EA i5 1135G7 (AM1637W)','asus-vivobook-a415ea-i5-1135g7-am1637w','https://cdn.tgdd.vn/Products/Images/44/266203/asus-vivobook-a415ea-i5-1135g7-8gb-512gb-600x600.jpg','https://cdn.tgdd.vn/Products/Images/44/266203/asus-vivobook-a415ea-i5-am1637w-6.jpg','https://cdn.tgdd.vn/Products/Images/44/266203/asus-vivobook-a415ea-i5-am1637w-7.jpg','https://cdn.tgdd.vn/Products/Images/44/266203/asus-vivobook-a415ea-i5-am1637w-8.jpg','https://cdn.tgdd.vn/Products/Images/44/266203/asus-vivobook-a415ea-i5-am1637w-1.jpg','76kx8zeIeuk','Laptop VivoBook A415EA (AM1637W) ???????c nh?? Asus cho ra m???t v???i vai tr?? l?? ng?????i b???n ?????ng h??nh ?????c l???c trong ph??n kh??c laptop h???c t???p - v??n ph??ng khi s??? h???u l???i thi???t k??? ????n gi???n nh??ng kh??ng k??m ph???n thanh l???ch c??ng nh???ng th??ng s??? k??? thu???t ???n ?????nh ????p ???ng t???t ??a t??c v??? thi???t y???u cho ng?????i d??ng.',98,18790000,'2022-04-09 03:53:42',0,3,3,7),(10,'iPad Pro M1 12.9 inch 5G','ipad-pro-m1-129-inch-5g','https://cdn.tgdd.vn/Products/Images/522/238649/ipad-pro-2021-129-inch-gray-600x600.jpg','https://cdn.tgdd.vn/Products/Images/522/238649/ipad-pro-m1-129-inch-wifi-cellular-128gb-2021-xam-1-org.jpg','https://cdn.tgdd.vn/Products/Images/522/238649/ipad-pro-m1-129-inch-wifi-cellular-128gb-2021-xam-2-org.jpg','https://cdn.tgdd.vn/Products/Images/522/238649/ipad-pro-m1-129-inch-wifi-cellular-512gb-2021-xam-3.jpeg','https://cdn.tgdd.vn/Products/Images/522/238649/ipad-pro-129-inch-wifi-cellular-13.jpeg','oTB1T_Z0d9k','B???n c?? ??ang mong ch??? nh???ng s???n ph???m ch???t l?????ng ?????n t??? Apple? Sau h??ng lo???t c??c s???n ph???m ????nh ????m nh?? iPhone 12 series th?? h??ng ???? tung ra chi???c iPad Pro M1 12.9 inch Wifi Cellular 128GB (2021) trang b??? nh???ng t??nh n??ng ng??y c??ng v?????t tr???i v?? th???i th?????ng.',100,31290000,'2022-04-02 17:00:00',0,2,1,NULL),(11,'HP AIO 24 df1030d i5 1135G7/8GB/512GB/23.8','hp-aio-24-df1030d-i5-1135g7-8gb-512gb-238f','https://cdn.tgdd.vn/Products/Images/5698/265511/hp-aio-24-df1030d-i5-4b6e3pa-2.jpg','https://cdn.tgdd.vn/Products/Images/5698/265511/hp-aio-24-df1030d-i5-4b6e3pa-2.jpg','https://cdn.tgdd.vn/Products/Images/5698/265511/hp-aio-24-df1030d-i5-4b6e3pa-1.jpg','https://cdn.tgdd.vn/Products/Images/5698/265511/hp-aio-24-df1030d-i5-4b6e3pa-3.jpg','https://hanoicomputercdn.com/media/product/60735_pc_hp_all_in_one_24_df1028d_4.jpg','dTL9p0OSHe8','N???u b???n ??ang t??m ki???m m???t chi???c m??y t??nh ????? b??n t??ch h???p ?????y ????? m???i t??nh n??ng tr??n m???t m??n h??nh l???n bao g???m CPU, ??? c???ng, loa, camera v?? c?? c??? chu???t c??ng b??n ph??m ??i k??m, HP AIO 24 df1030d i5 (4B6E3PA) s??? l?? m???t s??? l???a ch???n s??ng gi?? ????p ???ng m???i nhu c???u h???c t???p, v??n ph??ng c?? b???n cho ng?????i d??ng.',50,20590000,'2022-04-06 10:12:54',0,4,4,NULL),(12,'Apple Watch SE 40mm vi???n nh??m d??y silicon','apple-watch-se-40mm','https://cdn.tgdd.vn/Products/Images/7077/234918/se-40mm-vien-nhom-day-cao-su-den-thumb-600x600.jpg','https://cdn.tgdd.vn/Products/Images/7077/234918/Slider/vi-vn-se-40mm-vien-nhom-day-cao-su-hong-slider-fix.jpg','https://cdn.tgdd.vn/Products/Images/7077/234918/Slider/se-40mm-vien-nhom-day-cao-su-hong-080221-0347530.jpg','https://cdn.tgdd.vn/Products/Images/7077/234918/Slider/vi-vn-se-40mm-vien-nhom-day-cao-su-hong-hbv-fix.jpg','https://cdn.tgdd.vn/Products/Images/7077/234918/Slider/se-40mm-vien-nhom-day-cao-su-hong-080221-0348059.jpg','npToOhjFot8','Apple Watch SE 40mm vi???n nh??m d??y cao su h???ng c?? khung vi???n ch???c ch???n, thi???t k??? bo tr??n 4 g??c gi??p thao t??c vu???t ch???m tho???i m??i h??n. M???t k??nh c?????ng l???c Ion-X strengthened glass v???i k??ch th?????c 1.57 inch, hi???n th??? r?? r??ng. Khung vi???n nh??m ch???c ch???n c??ng d??y ??eo cao su c?? ????? ????n h???i cao, ??m ??i, t???o c???m gi??c tho???i m??i khi ??eo.',80,8990000,'2022-04-06 09:50:50',0,5,1,NULL),(13,'Bluetooth AirPods Pro MagSafe Charge Apple MLWK3','bluetooth-airpods-pro-magsafe-charge-apple-mlwk3','https://cdn.tgdd.vn/Products/Images/54/253802/bluetooth-airpods-pro-magsafe-charge-apple-mlwk3-1.jpg','https://cdn.tgdd.vn/Products/Images/54/253802/bluetooth-airpods-pro-magsafe-charge-apple-mlwk3-1.jpg','https://cdn.tgdd.vn/Products/Images/54/253802/bluetooth-airpods-pro-magsafe-charge-apple-mlwk3-2.jpg','https://cdn.tgdd.vn/Products/Images/54/253802/bluetooth-airpods-pro-magsafe-charge-apple-mlwk3-3.jpg','https://cdn.tgdd.vn/Products/Images/54/253802/bluetooth-airpods-pro-magsafe-charge-apple-mlwk3-4.jpg','emL289uOTRY','Tai nghe Bluetooth AirPods Pro MagSafe Charge Apple MLWK3 tr???ng ???????c ch??? t??c v???i v??? ngo??i tinh gi???n, gam m??u tr???ng tr??? trung, s??ng ?????p, ph???i h???p tuy???t v???i v???i m???i trang ph???c t??? ?????i th?????ng ?????n c??ng s???, d??? ti???c c???a b???n. ',90,4990000,'2022-04-06 10:06:38',0,6,1,NULL),(14,'Xiaomi 11 Lite 5G NE','xiaomi-11-lite-5g-ne','https://cdn.tgdd.vn/Products/Images/42/249427/xiaomi-11-lite-5g-ne-pink-600x600.jpg','https://cdn.tgdd.vn/Products/Images/42/249427/xiaomi-11-lite-5g-ne-1-1.jpg','https://cdn.tgdd.vn/Products/Images/42/249427/xiaomi-11-lite-5g-ne-black-gc-1.jpg','https://cdn.tgdd.vn/Products/Images/42/249427/xiaomi-11-lite-5g-ne-tr-1.jpg','https://cdn.tgdd.vn/Products/Images/42/249427/xiaomi-11-lite-5g-ne-blue-gc.jpg','bvlqH2kiNMI','Xiaomi 11 Lite 5G NE m???t phi??n b???n c?? ngo???i h??nh r???t gi???ng v???i Mi 11 Lite ???????c ra m???t tr?????c ????y. Chi???c smartphone n??y c???a Xiaomi mang trong m??nh m???t hi???u n??ng ???n ?????nh, thi???t k??? sang tr???ng v?? m??n h??nh l???n ????p ???ng t???t c??c t??c v??? h???ng ng??y c???a b???n m???t c??ch d??? d??ng.',1500,9490000,'2022-04-04 03:37:34',0,1,5,NULL),(15,'BeU B2','beu-b2','https://cdn.tgdd.vn/Products/Images/7077/231681/beu-b2-hong-moi3-org.jpg','https://cdn.tgdd.vn/Products/Images/7077/231681/beu-b2-hong-moi3-org.jpg','https://cdn.tgdd.vn/Products/Images/7077/231681/beu-b2-hong-moi1-org.jpg','https://cdn.tgdd.vn/Products/Images/7077/231681/beu-b2-hong-4-org.jpg','https://cdn.tgdd.vn/Products/Images/7077/231681/beu-b2-hong-3-org.jpg','XWymK4iNXzo','?????ng h??? th??ng minh BeU t??? h??o l?? d??ng s???n ph???m mang th????ng hi???u Vi???t Nam, s??? h???u ?????y ????? nh???ng t??nh n??ng h???u ??ch v?? c???n thi???t nh??: theo d??i gi???c ng???, ??o nh???p tim, trang b??? nhi???u b??i luy???n t???p th??? thao,... ??i k??m v???i gi?? th??nh r???, ph?? h???p v???i th??? tr?????ng ng?????i ti??u d??ng Vi???t',0,490000,'2022-04-09 04:10:54',1,5,6,7),(16,'Xiaomi 11T Pro 5G','xiaomi-11t-pro-5g','https://cdn.tgdd.vn/Products/Images/42/262566/xiaomi-11t-pro-5g-8gb-thumb-600x600.jpeg','https://cdn.tgdd.vn/Products/Images/42/262566/xiaomi-11t-pro-5g-8gb-thumb-600x600.jpeg','https://firebasestorage.googleapis.com/v0/b/poly-java-6-43318.appspot.com/o/box-512.png?alt=media&token=8f9eb547-8a18-44be-a35d-f5b74edcaf48','https://firebasestorage.googleapis.com/v0/b/poly-java-6-43318.appspot.com/o/box-512.png?alt=media&token=8f9eb547-8a18-44be-a35d-f5b74edcaf48','https://firebasestorage.googleapis.com/v0/b/poly-java-6-43318.appspot.com/o/box-512.png?alt=media&token=8f9eb547-8a18-44be-a35d-f5b74edcaf48','lb0DZ1O8Z08','Xiaomi 11T ?????y n???i b???t v???i thi???t k??? v?? c??ng tr??? trung, m??n h??nh AMOLED, b??? 3 camera s???c n??t v?? vi??n pin l???n ????y s??? l?? m???u smartphone c???a Xiaomi th???a m??n m???i nhu c???u gi???i tr??, l??m vi???c v?? l?? ni???m ??am m?? s??ng t???o c???a b???n.',500,10990000,'2022-04-04 04:20:41',0,1,5,NULL),(18,'Samsung Galaxy Buds Live R180 Gold','samsung-galaxy-buds-live-r180-gold','https://cdn.tgdd.vn/Products/Images/54/252124/ai-nghe-bluetooth-true-wireless-samsung-galaxy-buds-live-r180-gold-thumb-600x600.jpeg','https://cdn.tgdd.vn/Products/Images/54/252124/true-wireless-samsung-galaxy-buds-live-r180-3.jpg','https://cdn.tgdd.vn/Products/Images/54/252124/true-wireless-samsung-galaxy-buds-live-r180-10.jpg','https://cdn.tgdd.vn/Products/Images/54/252124/true-wireless-samsung-galaxy-buds-live-r180-11.jpg','https://cdn.tgdd.vn/Products/Images/54/252124/true-wireless-samsung-galaxy-buds-live-r180-13.jpg',NULL,'Vi???c s??? d???ng tai nghe t??? l??u ???? tr??? th??nh m???t th??i quen c???a nhi???u ng?????i b???i s??? ti???n l???i m?? thi???t b??? n??y mang l???i. Nh??ng ng??y nay, ng?????i d??ng ????i h???i ng??y c??ng cao h??n ?????i v???i m???t chi???c tai nghe kh??ng ch??? ??? thi???t k??? m?? c??? s??? c???i thi???n v??? t??nh n??ng. ????p ???ng ??i???u ????, Samsung ???? cho ra m???t Samsung Galaxy Buds Live gi??p tr???i nghi???m s??? d???ng tai nghe c???a ng?????i d??ng tr??? n??n tuy???t v???i h??n',297,1990000,'2022-04-09 16:44:44',0,6,2,7);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_CUSTOMER'),(2,'ROLE_STAFF'),(3,'ROLE_DIRECTOR');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `UserId` bigint NOT NULL,
  `ProductId` bigint NOT NULL,
  `Quantity` int DEFAULT '1',
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_ShoppingCart_Product` (`ProductId`),
  KEY `FK_ShoppingCart_User` (`UserId`),
  CONSTRAINT `FK_ShoppingCart_Product` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ShoppingCart_User` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (78,3,3,1,'2022-04-11 12:09:18');
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(128) NOT NULL,
  `Fullname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email` varchar(128) NOT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PhoneNumber` varchar(10) DEFAULT NULL,
  `Photo` varchar(128) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_User_Username` (`Username`),
  UNIQUE KEY `UQ_User_Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'MaiNT','$2a$10$LuRi1lmkBg/3c/bg./EcbeC1DeT2.BZfXsTVCrA8nDYr4hPYNnqbq','Nguy???n Th??? Mai','maint@gmail.com','????? R??n - ????n D????ng - L??m ?????ng','0389894357','MaiNT.jpg','2022-02-21 02:42:23',1),(2,'AnhPTQ','$2a$10$z/mpc04bezbLWwxodoQb9OXA0cVO0Pr1p2reAT/6zFSpwJnIFuuIy','Phan Th??? Qu???nh Anh','anhptq@gmail.com','Trung M??? T??y, Qu???n 12, TP.HCM','0389894357','AnhPTQ.jpg','2022-02-21 02:37:04',1),(3,'Admin','$2a$10$kL0UEwTe2Q2fSf8TfXYahOPLtC.Q1k7ZX1ynbgiwgw7A0.1pmaaSG','Admin','admin@gmail.com','Ph?????ng Trung M??? T??y, Qu???n 12, TP.HCM','0345679898','Admin.jpeg','2022-02-21 02:53:32',1);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verification_token`
--

DROP TABLE IF EXISTS `verification_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verification_token` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `Token` varchar(30) NOT NULL,
  `UserId` bigint NOT NULL,
  `ExpiryDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_Verification_User` (`UserId`),
  CONSTRAINT `FK_Verification_User` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verification_token`
--

LOCK TABLES `verification_token` WRITE;
/*!40000 ALTER TABLE `verification_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `verification_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-12 16:04:28
