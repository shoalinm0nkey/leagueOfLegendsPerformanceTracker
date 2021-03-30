-- MySQL dump 10.13  Distrib 8.0.23, for macos10.15 (x86_64)
--
-- Host: localhost    Database: LeaguePerformanceTracker
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Current Database: `LeaguePerformanceTracker`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `LeaguePerformanceTracker` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `LeaguePerformanceTracker`;

--
-- Table structure for table `AverageScoreLine`
--

DROP TABLE IF EXISTS `AverageScoreLine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AverageScoreLine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rank_id` int DEFAULT NULL,
  `kda` decimal(4,2) DEFAULT NULL,
  `csMin` decimal-- MySQL dump 10.13  Distrib 8.0.23, for macos10.15 (x86_64)
--
-- Host: localhost    Database: LeaguePerformanceTracker
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Current Database: `LeaguePerformanceTracker`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `LeaguePerformanceTracker` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `LeaguePerformanceTracker`;

--
-- Table structure for table `AverageScoreLine`
--

DROP TABLE IF EXISTS `AverageScoreLine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AverageScoreLine` (
                                    `id` int NOT NULL AUTO_INCREMENT,
                                    `rank_id` int DEFAULT NULL,
                                    `kda` decimal(4,2) DEFAULT NULL,
                                    `csMin` decimal(4,2) DEFAULT NULL,
                                    `goldMin` decimal(5,2) DEFAULT NULL,
                                    `wardsPurchasedMin` decimal(4,2) DEFAULT NULL,
                                    `roleId` int DEFAULT NULL,
                                    PRIMARY KEY (`id`),
                                    KEY `rank_id` (`rank_id`),
                                    KEY `roleId` (`roleId`),
                                    CONSTRAINT `averagescoreline_ibfk_1` FOREIGN KEY (`rank_id`) REFERENCES `ranks` (`id`),
                                    CONSTRAINT `averagescoreline_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `roleNames` (`id`),
                                    CONSTRAINT `rankId` FOREIGN KEY (`id`) REFERENCES `ranks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AverageScoreLine`
--

LOCK TABLES `AverageScoreLine` WRITE;
/*!40000 ALTER TABLE `AverageScoreLine` DISABLE KEYS */;
INSERT INTO `AverageScoreLine` VALUES (1,2,2.22,4.70,345.19,0.20,1),(2,3,2.38,5.12,351.38,0.21,1),(3,4,2.46,5.46,356.55,0.22,1),(4,5,2.53,5.69,360.74,0.23,1),(5,6,2.58,5.86,364.85,0.24,1),(6,7,2.70,5.99,368.01,0.27,1),(7,8,2.66,6.01,368.45,0.27,1),(8,9,2.79,6.05,368.92,0.27,1),(9,2,2.22,1.72,346.62,0.21,2);
/*!40000 ALTER TABLE `AverageScoreLine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranks`
--

DROP TABLE IF EXISTS `ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ranks` (
                         `id` int NOT NULL AUTO_INCREMENT,
                         `rank_name` varchar(50) DEFAULT NULL,
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranks`
--

LOCK TABLES `ranks` WRITE;
/*!40000 ALTER TABLE `ranks` DISABLE KEYS */;
INSERT INTO `ranks` VALUES (1,'iron'),(2,'bronze'),(3,'silver'),(4,'gold'),(5,'platinum'),(6,'diamond'),(7,'masters'),(8,'grand masters'),(9,'challenger');
/*!40000 ALTER TABLE `ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleNames`
--

DROP TABLE IF EXISTS `roleNames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roleNames` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `roleName` varchar(10) DEFAULT NULL,
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleNames`
--

LOCK TABLES `roleNames` WRITE;
/*!40000 ALTER TABLE `roleNames` DISABLE KEYS */;
INSERT INTO `roleNames` VALUES (1,'top'),(2,'jungle'),(3,'mid'),(4,'adc'),(5,'support');
/*!40000 ALTER TABLE `roleNames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
                              `id` int NOT NULL AUTO_INCREMENT,
                              `role_name` varchar(25) DEFAULT NULL,
                              `userId` int DEFAULT NULL,
                              `user_name` varchar(250) DEFAULT NULL,
                              PRIMARY KEY (`id`),
                              KEY `userId` (`userId`),
                              CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'general',1,'banderson'),(2,'admin',1,'banderson'),(3,NULL,NULL,'banderson');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
                         `id` int NOT NULL AUTO_INCREMENT,
                         `user_name` varchar(100) DEFAULT NULL,
                         `user_password` varchar(100) DEFAULT NULL,
                         `firstName` varchar(50) DEFAULT NULL,
                         `lastName` varchar(50) DEFAULT NULL,
                         `email` varchar(150) DEFAULT NULL,
                         PRIMARY KEY (`id`),
                         CONSTRAINT `roleId` FOREIGN KEY (`id`) REFERENCES `user_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'banderson','banderson','Beck','Anderson','random@gmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userScores`
--

DROP TABLE IF EXISTS `userScores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userScores` (
                              `id` int NOT NULL AUTO_INCREMENT,
                              `kda` decimal(5,2) DEFAULT NULL,
                              `csMin` decimal(5,2) DEFAULT NULL,
                              `goldMin` decimal(5,2) DEFAULT NULL,
                              `wardsPurchased` decimal(5,2) DEFAULT NULL,
                              `roleId` int DEFAULT NULL,
                              PRIMARY KEY (`id`),
                              KEY `roleId` (`roleId`),
                              CONSTRAINT `userscores_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roleNames` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userScores`
--

LOCK TABLES `userScores` WRITE;
/*!40000 ALTER TABLE `userScores` DISABLE KEYS */;
/*!40000 ALTER TABLE `userScores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- Dump completed on 2021-03-29 16:44:42
(4,2) DEFAULT NULL,
  `goldMin` decimal(5,2) DEFAULT NULL,
  `wardsPurchasedMin` decimal(4,2) DEFAULT NULL,
  `roleId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rank_id` (`rank_id`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `averagescoreline_ibfk_1` FOREIGN KEY (`rank_id`) REFERENCES `ranks` (`id`),
  CONSTRAINT `averagescoreline_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `roleNames` (`id`),
  CONSTRAINT `rankId` FOREIGN KEY (`id`) REFERENCES `ranks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AverageScoreLine`
--

LOCK TABLES `AverageScoreLine` WRITE;
/*!40000 ALTER TABLE `AverageScoreLine` DISABLE KEYS */;
INSERT INTO `AverageScoreLine` VALUES (1,2,2.22,4.70,345.19,0.20,1),(2,3,2.38,5.12,351.38,0.21,1),(3,4,2.46,5.46,356.55,0.22,1),(4,5,2.53,5.69,360.74,0.23,1),(5,6,2.58,5.86,364.85,0.24,1),(6,7,2.70,5.99,368.01,0.27,1),(7,8,2.66,6.01,368.45,0.27,1),(8,9,2.79,6.05,368.92,0.27,1),(9,2,2.22,1.72,346.62,0.21,2);
/*!40000 ALTER TABLE `AverageScoreLine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranks`
--

DROP TABLE IF EXISTS `ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ranks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranks`
--

LOCK TABLES `ranks` WRITE;
/*!40000 ALTER TABLE `ranks` DISABLE KEYS */;
INSERT INTO `ranks` VALUES (1,'iron'),(2,'bronze'),(3,'silver'),(4,'gold'),(5,'platinum'),(6,'diamond'),(7,'masters'),(8,'grand masters'),(9,'challenger');
/*!40000 ALTER TABLE `ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleNames`
--

DROP TABLE IF EXISTS `roleNames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roleNames` (
  `id` int NOT NULL AUTO_INCREMENT,
  `roleName` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleNames`
--

LOCK TABLES `roleNames` WRITE;
/*!40000 ALTER TABLE `roleNames` DISABLE KEYS */;
INSERT INTO `roleNames` VALUES (1,'top'),(2,'jungle'),(3,'mid'),(4,'adc'),(5,'support');
/*!40000 ALTER TABLE `roleNames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(25) DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `user_name` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'general',1,'banderson'),(2,'admin',1,'banderson'),(3,NULL,NULL,'banderson');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `user_password` varchar(100) DEFAULT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `roleId` FOREIGN KEY (`id`) REFERENCES `user_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'banderson','banderson','Beck','Anderson','random@gmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userScores`
--

DROP TABLE IF EXISTS `userScores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userScores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kda` decimal(5,2) DEFAULT NULL,
  `csMin` decimal(5,2) DEFAULT NULL,
  `goldMin` decimal(5,2) DEFAULT NULL,
  `wardsPurchased` decimal(5,2) DEFAULT NULL,
  `roleId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `userscores_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roleNames` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userScores`
--

LOCK TABLES `userScores` WRITE;
/*!40000 ALTER TABLE `userScores` DISABLE KEYS */;
/*!40000 ALTER TABLE `userScores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-29 16:44:42
