-- MySQL dump 10.13  Distrib 8.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `massage`
--

DROP TABLE IF EXISTS `massage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `massage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `massage_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `registration` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `massage`
--

LOCK TABLES `massage` WRITE;
/*!40000 ALTER TABLE `massage` DISABLE KEYS */;
/*!40000 ALTER TABLE `massage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(32) DEFAULT NULL,
  `PASSWORD` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES (1,'dsasada','dasdsadas'),(2,'adsadas','asdasdasd'),(3,'dsadas','dsadasd'),(4,'sadasdas','asd'),(5,'dklsandlas','fsakfasf'),(6,'dsadas','dsadas'),(7,'dsadas','dasdas'),(8,'dsahjdasjkd','dasdsad'),(9,'fadsfdfdsf','dfdsfdsfsdfd'),(10,'dasda','dasda'),(11,'mirsamad','7348327984'),(12,'sardor ','475854'),(13,'jamshid','2345543'),(14,'fazliw','dsadasda'),(15,'husan','45555'),(16,'kamron','778478923'),(17,'javohir','19001992'),(18,'sattarovelaman06@gmail.com','sca'),(19,'dsad','dsad'),(20,'dsad','dsada'),(21,'dsadas','dsadas'),(22,'asSa','asS'),(23,'asSa','asS'),(24,'DSADA','DASDASD'),(25,'dasdas@dasda','sdadas'),(26,'saddas','dsadas'),(27,'sASa','asSA'),(28,'saSA','asSas'),(29,'sattarovelaman06@gmail.com','dsad'),(30,'dsaasd','dsadsad'),(31,'aSa','saS'),(32,'dasdas','dsadas'),(33,'dsadas','dsadas'),(34,'sattarovelaman06@gmail.com','2595r'),(35,'dada','dasda'),(36,'sattarovelaman06@gmail.com','essddf'),(37,'dsadas','dsadas'),(38,'dsadas','dsadas'),(39,'dsadsa','dsadas'),(40,'dsadas','dsadsa'),(41,'dasdas','sdasd'),(42,'dsadas','dasda'),(43,'sattarovelaman06@gmail.com','1234'),(44,'sattarovelaman06@gmail.com','1234');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Firstname` varchar(32) NOT NULL,
  `Lastname` varchar(32) NOT NULL,
  `Age` int DEFAULT NULL,
  `Sex` char(1) NOT NULL,
  `USER_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `registration` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'dsa','dsa',32,'M',38),(2,'dsad','dsadas',12,'M',42),(3,'nfdlkjf','fsaf',15,'M',43),(4,'dsad','fsaf',12,'M',44);
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

-- Dump completed on 2024-05-20 15:50:07
