-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 21, 2021 at 12:22 AM
-- Server version: 8.0.23
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `barterup`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  `category_quantity` int DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name_UNIQUE` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_quantity`) VALUES
(1000, 'music', 3),
(1001, 'movies', 4),
(1002, 'video_games', 5);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `item_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `description` tinytext,
  `item_condition` varchar(45) DEFAULT NULL,
  `item_name` varchar(45) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `category_id_idx` (`category_id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3019 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `user_id`, `category_id`, `description`, `item_condition`, `item_name`) VALUES
(3000, 1, 1001, '                ', 'excellent', 'Titanic'),
(3003, 2, 1000, '', 'excellent', 'gravity'),
(3004, 2, 1002, 'new out of the box.', 'excellent', 'Mario'),
(3006, 2, 1001, 'Its badass', 'excellent', 'Blade Runner'),
(3007, 2, 1002, 'Best of the Best', 'excellent', 'Uncharted'),
(3008, 2, 1002, 'Naruto is Console! Amazing!', 'excellent', 'UNS4'),
(3009, 1, 1001, 'Badass Folks', 'excellent', 'Avengers'),
(3010, 1, 1002, 'Burn Rubber', 'excellent', 'Burnout'),
(3011, 1, 1000, 'Stuff', 'excellent', 'Barbish');

--
-- Triggers `item`
--
DROP TRIGGER IF EXISTS `Decrement`;
DELIMITER $$
CREATE TRIGGER `Decrement` AFTER DELETE ON `item` FOR EACH ROW UPDATE category as C SET C.category_quantity = C.category_quantity - 1 
    WHERE OLD.category_id = C.category_id
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `update_seperate_cats`;
DELIMITER $$
CREATE TRIGGER `update_seperate_cats` AFTER INSERT ON `item` FOR EACH ROW BEGIN
    UPDATE category as C SET C.category_quantity = C.category_quantity + 1 
    WHERE NEW.category_id = C.category_id;
  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
CREATE TABLE IF NOT EXISTS `movie` (
  `item_movie_id` smallint UNSIGNED NOT NULL,
  `director_name` varchar(45) NOT NULL,
  `movie_genre` varchar(45) NOT NULL,
  UNIQUE KEY `item_id_UNIQUE` (`item_movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`item_movie_id`, `director_name`, `movie_genre`) VALUES
(3006, 'BrIAN', 'Thriller');

-- --------------------------------------------------------

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
CREATE TABLE IF NOT EXISTS `music` (
  `artist_name` varchar(45) NOT NULL,
  `item_music_id` smallint UNSIGNED NOT NULL,
  `music_genre` varchar(45) DEFAULT NULL,
  UNIQUE KEY `item_id_UNIQUE` (`item_music_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trades`
--

DROP TABLE IF EXISTS `trades`;
CREATE TABLE IF NOT EXISTS `trades` (
  `trade_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `item_id_initiator` smallint UNSIGNED NOT NULL,
  `item_id_tradee` smallint UNSIGNED DEFAULT NULL,
  `user_id_initiator` bigint UNSIGNED NOT NULL,
  `user_id_tradee` bigint UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`trade_id`),
  UNIQUE KEY `trade_id_UNIQUE` (`trade_id`),
  KEY `item_id_initiator_idx` (`item_id_initiator`),
  KEY `item_id_tradee_idx` (`item_id_tradee`),
  KEY `user_id_initiator_idx` (`user_id_initiator`),
  KEY `user_id_tradee_idx` (`user_id_tradee`)
) ENGINE=InnoDB AUTO_INCREMENT=4008 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `trades`
--

INSERT INTO `trades` (`trade_id`, `item_id_initiator`, `item_id_tradee`, `user_id_initiator`, `user_id_tradee`) VALUES
(4005, 3003, 3009, 2, 1),
(4006, 3010, 3003, 1, 2),
(4007, 3011, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trade_history`
--

DROP TABLE IF EXISTS `trade_history`;
CREATE TABLE IF NOT EXISTS `trade_history` (
  `trade_id` smallint UNSIGNED NOT NULL,
  `item_history_id_initiator` smallint UNSIGNED NOT NULL,
  `item_history_id_tradee` smallint UNSIGNED NOT NULL,
  `user_history_id_initiator` bigint UNSIGNED NOT NULL,
  `user_history_id_tradee` bigint UNSIGNED NOT NULL,
  UNIQUE KEY `trade_id_UNIQUE` (`trade_id`),
  KEY `user_id_tradee_idx` (`user_history_id_tradee`),
  KEY `user_id_initiator_idx` (`user_history_id_initiator`),
  KEY `item_id_tradee_idx` (`item_history_id_tradee`),
  KEY `item_id_initiator_idx` (`item_history_id_initiator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `trade_history`
--

INSERT INTO `trade_history` (`trade_id`, `item_history_id_initiator`, `item_history_id_tradee`, `user_history_id_initiator`, `user_history_id_tradee`) VALUES
(4004, 3006, 3000, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`) VALUES
(1, 'Farce4wrd', 'rubberducky'),
(2, 'jrizzle1', 'abcd');

-- --------------------------------------------------------

--
-- Table structure for table `video_game`
--

DROP TABLE IF EXISTS `video_game`;
CREATE TABLE IF NOT EXISTS `video_game` (
  `item_game_id` smallint UNSIGNED NOT NULL,
  `game_platform` varchar(45) NOT NULL,
  `game_genre` varchar(45) DEFAULT NULL,
  UNIQUE KEY `item_game_id_UNIQUE` (`item_game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `video_game`
--

INSERT INTO `video_game` (`item_game_id`, `game_platform`, `game_genre`) VALUES
(3007, 'PS4', 'Action'),
(3008, 'PS4', 'Fighting'),
(3010, 'PS3', 'Racing');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie delete` FOREIGN KEY (`item_movie_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `music`
--
ALTER TABLE `music`
  ADD CONSTRAINT `music delete` FOREIGN KEY (`item_music_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trades`
--
ALTER TABLE `trades`
  ADD CONSTRAINT `item_id_initiator` FOREIGN KEY (`item_id_initiator`) REFERENCES `item` (`item_id`),
  ADD CONSTRAINT `item_id_tradee` FOREIGN KEY (`item_id_tradee`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_id_initiator` FOREIGN KEY (`user_id_initiator`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `user_id_tradee` FOREIGN KEY (`user_id_tradee`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trade_history`
--
ALTER TABLE `trade_history`
  ADD CONSTRAINT `item_history_id_initiator` FOREIGN KEY (`item_history_id_initiator`) REFERENCES `item` (`item_id`),
  ADD CONSTRAINT `item_history_id_tradee` FOREIGN KEY (`item_history_id_tradee`) REFERENCES `item` (`item_id`),
  ADD CONSTRAINT `user_history_id_initiator` FOREIGN KEY (`user_history_id_initiator`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `user_history_id_tradee` FOREIGN KEY (`user_history_id_tradee`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `video_game`
--
ALTER TABLE `video_game`
  ADD CONSTRAINT `game delete` FOREIGN KEY (`item_game_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
