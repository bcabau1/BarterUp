-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2021 at 02:18 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3
CREATE DATABASE barterup;
USE barterup;
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

CREATE TABLE `category` (
  `category_id` bigint(5) UNSIGNED NOT NULL,
  `category_name` varchar(45) NOT NULL,
  `category_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_quantity`) VALUES
(1000, 'music', 0),
(1001, 'movies', 0),
(1002, 'video_games', 0);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` smallint(5) UNSIGNED NOT NULL,
  `user_id` bigint(4) UNSIGNED NOT NULL,
  `category_id` bigint(5) UNSIGNED NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `item_condition` varchar(45) DEFAULT NULL,
  `item_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `item_movie_id` smallint(5) UNSIGNED NOT NULL,
  `director_name` varchar(45) NOT NULL,
  `movie_genre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `music`
--

CREATE TABLE `music` (
  `artist_name` varchar(45) NOT NULL,
  `item_music_id` smallint(5) UNSIGNED NOT NULL,
  `music_genre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `trades`
--

CREATE TABLE `trades` (
  `trade_id` smallint(4) UNSIGNED NOT NULL,
  `item_id_initiator` smallint(5) UNSIGNED NOT NULL,
  `item_id_tradee` smallint(5) UNSIGNED NOT NULL,
  `user_id_initiator` bigint(4) UNSIGNED NOT NULL,
  `user_id_tradee` bigint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `trade_history`
--

CREATE TABLE `trade_history` (
  `trade_id` smallint(4) UNSIGNED NOT NULL,
  `item_history_id_initiator` smallint(5) UNSIGNED NOT NULL,
  `item_history_id_tradee` smallint(5) UNSIGNED NOT NULL,
  `user_history_id_initiator` bigint(4) UNSIGNED NOT NULL,
  `user_history_id_tradee` bigint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` bigint(4) UNSIGNED NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `video_game` (
  `item_game_id` smallint(5) UNSIGNED NOT NULL,
  `game_platform` varchar(45) NOT NULL,
  `game_genre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name_UNIQUE` (`category_name`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `category_id_idx` (`category_id`),
  ADD KEY `user_id_idx` (`user_id`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD UNIQUE KEY `item_id_UNIQUE` (`item_movie_id`);

--
-- Indexes for table `music`
--
ALTER TABLE `music`
  ADD UNIQUE KEY `item_id_UNIQUE` (`item_music_id`);

--
-- Indexes for table `trades`
--
ALTER TABLE `trades`
  ADD PRIMARY KEY (`trade_id`),
  ADD KEY `item_id_initiator_idx` (`item_id_initiator`),
  ADD KEY `item_id_tradee_idx` (`item_id_tradee`),
  ADD KEY `user_id_initiator_idx` (`user_id_initiator`),
  ADD KEY `user_id_tradee_idx` (`user_id_tradee`);

--
-- Indexes for table `trade_history`
--
ALTER TABLE `trade_history`
  ADD UNIQUE KEY `trade_id_UNIQUE` (`trade_id`),
  ADD KEY `user_id_tradee_idx` (`user_history_id_tradee`),
  ADD KEY `user_id_initiator_idx` (`user_history_id_initiator`),
  ADD KEY `item_id_tradee_idx` (`item_history_id_tradee`),
  ADD KEY `item_id_initiator_idx` (`item_history_id_initiator`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- Indexes for table `video_game`
--
ALTER TABLE `video_game`
  ADD UNIQUE KEY `item_game_id_UNIQUE` (`item_game_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` bigint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1009;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3000;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` bigint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  ADD CONSTRAINT `item_movie_id` FOREIGN KEY (`item_movie_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `music`
--
ALTER TABLE `music`
  ADD CONSTRAINT `item_music_id` FOREIGN KEY (`item_music_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `item_game_id` FOREIGN KEY (`item_game_id`) REFERENCES `item` (`item_id`);
COMMIT;

delimiter //
CREATE TRIGGER update_seperate_cats AFTER INSERT ON item FOR EACH ROW
  BEGIN
    IF NEW.category_id = 1000 THEN
        INSERT INTO music (item_music_id) VALUES (NEW.item_id);
    ELSE IF NEW.category_id = 1001 THEN
        INSERT INTO movie (item_movie_id) VALUES (NEW.item_id);
    ELSE IF NEW.category_id = 1002 THEN
        INSERT INTO video_game (item_game_id) VALUES (NEW.item_id);
    END IF;
    UPDATE category as C SET C.category_quantity = C.category_quantity + 1 
    WHERE NEW.category_id = C.category_id;
  END;
delimiter ;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
