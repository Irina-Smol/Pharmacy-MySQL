CREATE DATABASE  IF NOT EXISTS `rk6_schema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `rk6_schema`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: rk6_schema
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
-- Table structure for table `drug`
--

DROP TABLE IF EXISTS `drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drug` (
  `id_d` int NOT NULL AUTO_INCREMENT,
  `firm` varchar(70) NOT NULL,
  `name` varchar(70) NOT NULL,
  `group` varchar(70) NOT NULL,
  `country` varchar(70) NOT NULL,
  PRIMARY KEY (`id_d`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug`
--

LOCK TABLES `drug` WRITE;
/*!40000 ALTER TABLE `drug` DISABLE KEYS */;
INSERT INTO `drug` VALUES (1,'ООО Здоровье','Парацетамол','Обезболивающие','Израиль'),(2,'ООО Жизнь','Морфий','Обезболивающие','США');
/*!40000 ALTER TABLE `drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `now_in_store`
--

DROP TABLE IF EXISTS `now_in_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `now_in_store` (
  `id_st` int NOT NULL AUTO_INCREMENT,
  `price` int NOT NULL,
  `amount` int NOT NULL,
  `id_a` int NOT NULL,
  PRIMARY KEY (`id_st`),
  KEY `dddd_idx` (`id_a`),
  CONSTRAINT `dddd` FOREIGN KEY (`id_a`) REFERENCES `drug` (`id_d`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `now_in_store`
--

LOCK TABLES `now_in_store` WRITE;
/*!40000 ALTER TABLE `now_in_store` DISABLE KEYS */;
INSERT INTO `now_in_store` VALUES (1,200,10,1),(2,300,20,1),(3,400,3,2);
/*!40000 ALTER TABLE `now_in_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id_o` int NOT NULL AUTO_INCREMENT,
  `price` int NOT NULL,
  `date_preparation` date NOT NULL,
  `date_get` date NOT NULL,
  `date_fact` date NOT NULL,
  `id_a` int DEFAULT NULL,
  PRIMARY KEY (`id_o`),
  KEY `id_a_idx` (`id_a`),
  CONSTRAINT `aaaa` FOREIGN KEY (`id_a`) REFERENCES `supplier` (`id_s`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,400,'2022-03-28','2022-03-29','2022-04-03',1),(2,200,'2022-03-20','2022-03-25','2022-04-12',2),(3,300,'2022-04-01','2022-04-12','2022-04-20',1),(4,600,'2022-04-01','2022-04-13','2022-04-21',2);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line`
--

DROP TABLE IF EXISTS `order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_line` (
  `id_ol` int NOT NULL AUTO_INCREMENT,
  `price` int NOT NULL,
  `amount` int NOT NULL,
  `id_a` int NOT NULL,
  `id_b` int NOT NULL,
  PRIMARY KEY (`id_ol`),
  KEY `bbbb_idx` (`id_a`),
  KEY `cccc_idx` (`id_b`),
  CONSTRAINT `bbbb` FOREIGN KEY (`id_a`) REFERENCES `order` (`id_o`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cccc` FOREIGN KEY (`id_b`) REFERENCES `drug` (`id_d`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line`
--

LOCK TABLES `order_line` WRITE;
/*!40000 ALTER TABLE `order_line` DISABLE KEYS */;
INSERT INTO `order_line` VALUES (1,200,2,1,1);
/*!40000 ALTER TABLE `order_line` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigg` AFTER INSERT ON `order_line` FOR EACH ROW BEGIN
    UPDATE `order`
    SET price = price + new.price*new.amount
    WHERE id_o=new.id_a;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `raport`
--

DROP TABLE IF EXISTS `raport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raport` (
  `summ` int DEFAULT NULL,
  `dat` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raport`
--

LOCK TABLES `raport` WRITE;
/*!40000 ALTER TABLE `raport` DISABLE KEYS */;
/*!40000 ALTER TABLE `raport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `summ` int DEFAULT NULL,
  `dat` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (900,'2022-04-01');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id_s` int NOT NULL AUTO_INCREMENT,
  `agreement_date` date DEFAULT NULL,
  `name` varchar(70) NOT NULL,
  `city` varchar(70) NOT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id_s`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'2022-01-03','Газпром','Москва','2022-03-24'),(2,'2021-09-12','Пятерочка','Улан-Удэ','2027-12-31');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'rk6_schema'
--
/*!50003 DROP PROCEDURE IF EXISTS `daily_cost` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `daily_cost`(d DATE)
BEGIN
	DECLARE suma INT;
    DECLARE flag INT;
    
    /*проверяем, были ли уже записи для этой даты*/
    SELECT COUNT(*)
    FROM report 
    WHERE dat = d 
    INTO flag; 
    
    SELECT SUM(price) FROM `order` /*суммируем суммы заказов*/
    WHERE DATE_preparation = d  /*сделанных в нужный день*/
    INTO suma; /* и заносим в переменную*/
    
    IF (flag <> 0)  /*если запись за этот день уже была*/
    THEN /*тогда*/
		UPDATE report  
        SET summ = suma /*обновляем отчет*/
        WHERE dat = d;
	END IF;
    IF (flag = 0) /*если записи не было*/
    THEN
		INSERT INTO report values (SUMa, d); /*то создаем ее*/
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-29  4:23:43
