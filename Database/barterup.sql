-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: barterup
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `category`
--
CREATE DATABASE barterup;
USE barterup;
DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  `category_quantity` int DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name_UNIQUE` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1000,'music',1),(1001,'movies',2),(1002,'video_games',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `item_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `description` tinytext,
  `item_condition` varchar(45) DEFAULT NULL,
  `item_name` varchar(45) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `category_id_idx` (`category_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3006 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (3000,2,1001,'                ','excellent','Titanic'),(3003,2,1000,'','excellent','gravity'),(3004,2,1002,'new out of the box.','excellent','Mario'),(3005,1,1001,'Its badass','excellent','Unhinged');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `item_movie_id` smallint unsigned NOT NULL,
  `director_name` varchar(45) NOT NULL,
  `movie_genre` varchar(45) NOT NULL,
  UNIQUE KEY `item_id_UNIQUE` (`item_movie_id`),
  CONSTRAINT `item_movie_id` FOREIGN KEY (`item_movie_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (3005,'MJ','Thriller');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `music` (
  `artist_name` varchar(45) NOT NULL,
  `item_music_id` smallint unsigned NOT NULL,
  `music_genre` varchar(45) DEFAULT NULL,
  UNIQUE KEY `item_id_UNIQUE` (`item_music_id`),
  CONSTRAINT `item_music_id` FOREIGN KEY (`item_music_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade_history`
--

DROP TABLE IF EXISTS `trade_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trade_history` (
  `trade_id` smallint unsigned NOT NULL,
  `item_history_id_initiator` smallint unsigned NOT NULL,
  `item_history_id_tradee` smallint unsigned NOT NULL,
  `user_history_id_initiator` bigint unsigned NOT NULL,
  `user_history_id_tradee` bigint unsigned NOT NULL,
  UNIQUE KEY `trade_id_UNIQUE` (`trade_id`),
  KEY `user_id_tradee_idx` (`user_history_id_tradee`),
  KEY `user_id_initiator_idx` (`user_history_id_initiator`),
  KEY `item_id_tradee_idx` (`item_history_id_tradee`),
  KEY `item_id_initiator_idx` (`item_history_id_initiator`),
  CONSTRAINT `item_history_id_initiator` FOREIGN KEY (`item_history_id_initiator`) REFERENCES `item` (`item_id`),
  CONSTRAINT `item_history_id_tradee` FOREIGN KEY (`item_history_id_tradee`) REFERENCES `item` (`item_id`),
  CONSTRAINT `user_history_id_initiator` FOREIGN KEY (`user_history_id_initiator`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_history_id_tradee` FOREIGN KEY (`user_history_id_tradee`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade_history`
--

LOCK TABLES `trade_history` WRITE;
/*!40000 ALTER TABLE `trade_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `trade_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trades`
--

DROP TABLE IF EXISTS `trades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trades` (
  `trade_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `item_id_initiator` smallint unsigned NOT NULL,
  `item_id_tradee` smallint unsigned DEFAULT NULL,
  `user_id_initiator` bigint unsigned NOT NULL,
  `user_id_tradee` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`trade_id`),
  UNIQUE KEY `trade_id_UNIQUE` (`trade_id`),
  KEY `item_id_initiator_idx` (`item_id_initiator`),
  KEY `item_id_tradee_idx` (`item_id_tradee`),
  KEY `user_id_initiator_idx` (`user_id_initiator`),
  KEY `user_id_tradee_idx` (`user_id_tradee`),
  CONSTRAINT `item_id_initiator` FOREIGN KEY (`item_id_initiator`) REFERENCES `item` (`item_id`),
  CONSTRAINT `item_id_tradee` FOREIGN KEY (`item_id_tradee`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_id_initiator` FOREIGN KEY (`user_id_initiator`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_id_tradee` FOREIGN KEY (`user_id_tradee`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4002 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trades`
--

LOCK TABLES `trades` WRITE;
/*!40000 ALTER TABLE `trades` DISABLE KEYS */;
INSERT INTO `trades` VALUES (4001,3004,3005,2,1);
/*!40000 ALTER TABLE `trades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Farce4wrd','rubberducky'),(2,'jrizzle1','abcd');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_game`
--

DROP TABLE IF EXISTS `video_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_game` (
  `item_game_id` smallint unsigned NOT NULL,
  `game_platform` varchar(45) NOT NULL,
  `game_genre` varchar(45) DEFAULT NULL,
  UNIQUE KEY `item_game_id_UNIQUE` (`item_game_id`),
  CONSTRAINT `item_game_id` FOREIGN KEY (`item_game_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_game`
--

LOCK TABLES `video_game` WRITE;
/*!40000 ALTER TABLE `video_game` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_game` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-12 20:20:33
