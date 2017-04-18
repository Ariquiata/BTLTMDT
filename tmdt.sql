-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tmdt
-- ------------------------------------------------------
-- Server version	5.7.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attri_pro`
--

DROP TABLE IF EXISTS `attri_pro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attri_pro` (
  `id_attri_value` int(11) NOT NULL,
  `id_pro` int(11) NOT NULL,
  PRIMARY KEY (`id_attri_value`,`id_pro`),
  KEY `q2_idx` (`id_pro`),
  CONSTRAINT `r1` FOREIGN KEY (`id_attri_value`) REFERENCES `attribute_value` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `r2` FOREIGN KEY (`id_pro`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attri_pro`
--

LOCK TABLES `attri_pro` WRITE;
/*!40000 ALTER TABLE `attri_pro` DISABLE KEYS */;
INSERT INTO `attri_pro` VALUES (1,1),(4,1),(2,2),(5,2),(3,3),(6,3),(1,4),(7,4),(2,5),(4,5),(1,6),(2,7),(3,8),(11,9),(12,10),(1,11),(11,11),(2,12),(12,12),(3,13);
/*!40000 ALTER TABLE `attri_pro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute`
--

LOCK TABLES `attribute` WRITE;
/*!40000 ALTER TABLE `attribute` DISABLE KEYS */;
INSERT INTO `attribute` VALUES (1,'age'),(2,'color'),(3,'size'),(4,'weight');
/*!40000 ALTER TABLE `attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_value`
--

DROP TABLE IF EXISTS `attribute_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attri_value` varchar(45) NOT NULL,
  `attri_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `q1_idx` (`attri_id`),
  CONSTRAINT `q1` FOREIGN KEY (`attri_id`) REFERENCES `attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_value`
--

LOCK TABLES `attribute_value` WRITE;
/*!40000 ALTER TABLE `attribute_value` DISABLE KEYS */;
INSERT INTO `attribute_value` VALUES (1,'1',1),(2,'2',1),(3,'3',1),(4,'black',2),(5,'white',2),(6,'brown',2),(7,'multi',2),(8,'big',3),(9,'normal',3),(10,'small',3),(11,'4',1),(12,'5',1);
/*!40000 ALTER TABLE `attribute_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Dog'),(2,'Cat'),(3,'Bird'),(4,'Turtle'),(5,'Mouse');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_order` date NOT NULL,
  `total_price` float NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `user_idx` (`user_email`),
  CONSTRAINT `user` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2017-04-13',199.8,'admin@pet.demo','pending'),(2,'2017-04-13',379.8,'admin@pet.demo','pending'),(3,'2017-04-13',41.55,'test@pet.demo','pending'),(4,'2017-04-13',1014.75,'test@pet.demo','pending'),(5,'2017-04-13',127,'test2@pet.demo','pending'),(6,'2017-04-13',100,'admin@pet.demo','pending'),(7,'2017-04-13',384.55,'test3@pet.demo','pending'),(8,'2017-04-13',36804.8,'test2@pet.demo','pending'),(9,'2017-04-13',24.25,'test@pet.demo','pending');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_pro`
--

DROP TABLE IF EXISTS `order_pro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_pro` (
  `order_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`order_id`,`pro_id`),
  KEY `333_idx` (`pro_id`),
  CONSTRAINT `1112` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `333` FOREIGN KEY (`pro_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_pro`
--

LOCK TABLES `order_pro` WRITE;
/*!40000 ALTER TABLE `order_pro` DISABLE KEYS */;
INSERT INTO `order_pro` VALUES (1,7,1),(2,5,1),(2,7,1),(3,1,1),(3,9,1),(4,1,1),(4,2,1),(4,3,1),(5,1,1),(5,6,1),(6,9,1),(7,1,1),(7,5,1),(7,7,1),(8,1,1),(8,8,1000),(9,1,3),(9,2,1);
/*!40000 ALTER TABLE `order_pro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `link_image` varchar(225) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `discount` float NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '1',
  `cat_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `zzz_idx` (`cat_id`),
  CONSTRAINT `zzz` FOREIGN KEY (`cat_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Jakie','dog','This is a dog',5,5,2,1),(2,'jiker','dog','This is  a dog',10,0,2,1),(3,'Joker','dog','This is a dog',1000,0,2,1),(4,'Mirai','dog','This is a dog ',15,0,2,1),(5,'Annal','dog','um ba la xi bua',200,10,2,1),(6,'Cattie','cat','this is a cat',155,0,3,2),(7,'Aoi','cat','This is a pussy cat',222,10,3,2),(8,'Bob','cat','This is a cat',100,0,1,2),(9,'Death','cat','This is a cat',100,0,3,2),(10,'Feng','cat','This is a cat',50,0,5,2),(11,'Kynkyo','turtle','This is a animal',46,20,10,3),(12,'Luna','turtle','This is a animal',50,10,1,3),(13,'Mei','turtle','this is a animal',70,0,1,3),(14,'Nana','turtle','This is a a......',111,0,1,3),(15,'Angy','bird','let fly and get high',12,0,1,4),(16,'Sophie','bird','let fly and get high',29,0,1,4),(17,'Xamlol','bird','let fly and get high',50,0,1,4),(18,'Upup','bird','let fly and get high',77,0,1,4),(19,'Food1','food','food is important',20,0,5,5),(20,'Food3','food','food is important',24,0,3,5),(21,'Food4','food','food is important',26,0,2,5),(22,'Food 5','food','food is important',28,0,1,5),(23,'Food2','food','food is important',22,0,4,5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `ggg_idx` (`pro_id`),
  CONSTRAINT `ggg` FOREIGN KEY (`pro_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,5,1),(2,2,1),(3,4,2),(4,1,3),(5,1,4),(6,2,5),(7,3,6),(8,4,7),(9,5,8),(10,0,9),(11,1,10),(12,2,11),(13,3,12),(14,4,13),(15,5,14),(16,0,15),(17,1,16),(18,2,17),(19,3,18),(20,4,19),(21,5,20),(22,0,21),(23,1,22),(24,2,23),(25,2,1),(26,5,5),(27,1,5),(28,1,5),(29,4,9),(30,3,9);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `pro_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `ddd_idx` (`pro_id`),
  CONSTRAINT `ddd` FOREIGN KEY (`pro_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (2,'good',5),(3,'bad',5),(4,'san pham nay toi khong thich',9);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `telephone` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `role` enum('0','1') NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('Bui','Dat','admin@pet.demo','admin','NoWhere','NoNumber','SomePlace','0'),('hi','hi','hi@pet.demo','123','Roza','11122233444','Roza','1'),('test2','test2','test2@pet.demo','test2','test2','1111111','test2','1'),('àd','dfadf','test3@pet.demo','test3','212','1212','212','1'),('test','test','test@pet.demo','test','test','11111111','test','1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-13 22:40:10
