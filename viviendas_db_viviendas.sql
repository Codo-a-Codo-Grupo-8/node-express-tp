-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: viviendas_db
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `viviendas`
--

DROP TABLE IF EXISTS `viviendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viviendas` (
  `idvivienda` int NOT NULL AUTO_INCREMENT,
  `mcuadrados` int DEFAULT NULL,
  `valorm2` decimal(10,2) DEFAULT NULL,
  `calle` varchar(255) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `provincia` varchar(255) DEFAULT NULL,
  `imagen` char(100) DEFAULT NULL,
  PRIMARY KEY (`idvivienda`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viviendas`
--

LOCK TABLES `viviendas` WRITE;
/*!40000 ALTER TABLE `viviendas` DISABLE KEYS */;
INSERT INTO `viviendas` VALUES (1,100,111111.50,'Avenida Urquiza',2111,'Quilmes','Bs As',NULL),(2,100,150000.50,'Avenida Urquiza',2,'Quilmes','Bs As',NULL),(4,100,200011.50,'Avenida Urquiza',11,'Berazategui','Bs As',NULL),(7,100,150000.00,'Avenida Calchaqui',11,'Quilmes','Bs As',NULL),(8,100,150000.00,'Avenida Calcaaqui',10,'quilmes','Buenos AIRES',NULL),(9,100,150000.00,'Avenida Calcaaqui',10,'quilmes','Buenos AIRES',NULL),(10,100,150000.00,'Avenida Calcaaqui',10,'quilmes','Buenos AIRES',NULL),(11,50,75000.00,'Urquiza',457,'Bernal','Buenos AIRES','1719409976381.PNG'),(12,50,75000.00,'Urquiza',457,'Quilmes','Buenos AIRES','1719352866404.jpg'),(13,50,75000.00,'Urquiza',457,'Bernal','Buenos AIRES','1719410513135.jpg'),(14,120,75000.00,'Rivadavia',457,'Avellaneda','Buenos AIRES','1719428057380.jpg'),(15,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `viviendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-01 12:19:28
