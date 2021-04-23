-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2021 at 01:23 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

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
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(45) NOT NULL,
  `category_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_quantity`) VALUES
(1000, 'music', 16),
(1001, 'movies', 12),
(1002, 'video_games', 12);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` smallint(5) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `description` tinytext DEFAULT NULL,
  `item_condition` varchar(45) DEFAULT NULL,
  `item_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `user_id`, `category_id`, `description`, `item_condition`, `item_name`) VALUES
(3020, 1, 1001, 'dog ate it.', 'excellent', 'Titanic'),
(3021, 1, 1002, 'Had it for years.', 'excellent', 'Mario'),
(3022, 7, 1000, 'My favorite.', 'excellent', 'Gravity'),
(3023, 5, 1001, 'Family Fun!', 'excellent', 'Frozen'),
(3024, 3, 1002, 'Best fps.', 'excellent', 'Battlefield 4'),
(3025, 3, 1000, 'Teenage love song.', 'excellent', 'Sorry'),
(3026, 4, 1001, 'Chris Pratt is in this.', 'excellent', 'Jurassic World'),
(3027, 4, 1002, 'Zagreus is cool.', 'excellent', 'Hades'),
(3028, 5, 1000, 'Roy Rogers Mcfly can move!!!', 'excellent', 'El Perro'),
(3029, 2, 1002, 'Its real old.', 'excellent', 'Oregon Trail'),
(3030, 2, 1002, 'Original box.', 'very nice', 'Doom II'),
(3031, 10, 1000, 'No scratches.', 'excellent', 'Simple Pleasures'),
(3032, 1, 1000, 'Couple scratches.', 'excellent', 'Off the Wall'),
(3034, 9, 1000, 'Never touched', 'excellent', 'Led Zeppelin IV'),
(3035, 9, 1000, 'Signed by all four.', 'excellent', 'Jump Back'),
(3036, 2, 1000, 'bought at 1974 concert.', 'excellent', 'See Emily Play'),
(3037, 2, 1000, 'Played many times, worn out.', 'excellent', 'I Wanna Hold Your Hand'),
(3038, 10, 1002, 'Comes with controller.', 'excellent', 'Pac Man'),
(3039, 10, 1000, 'no case, just disk.', 'excellent', 'All Along the Watchtower'),
(3040, 9, 1000, 'Brand new.', 'excellent', 'In America'),
(3041, 9, 1002, 'Still inside the plastic.', 'excellent', 'Pokemon Sapphire'),
(3042, 10, 1002, 'memories...', 'excellent', 'Call of Duty IV'),
(3043, 8, 1002, 'Been a while.', 'average', 'Nintendogs'),
(3044, 8, 1002, 'Rage inducing.', 'very nice', 'Fall Guys'),
(3045, 8, 1001, 'joe peschi', 'excellent', 'My Cousin Vinny'),
(3046, 8, 1001, 'shia is cool.', 'excellent', 'Transformers'),
(3047, 2, 1001, '3 hours long.', 'excellent', 'The Irishman'),
(3048, 7, 1001, 'not that great a movie.', 'excellent', 'The Day After Tomorrow'),
(3049, 2, 1001, 'Leo Decaprio in here.', 'excellent', 'Django'),
(3050, 9, 1001, 'classic.', 'excellent', 'Bambi'),
(3051, 7, 1001, 'Deniro is in this.', 'excellent', 'The Intern'),
(3052, 1, 1001, 'old one is best one.', 'excellent', 'Jurassic Park'),
(3053, 1, 1000, 'Listened many times.', 'excellent', 'Stairway To Heaven'),
(3054, 2, 1002, 'played as a kid.', 'excellent', 'Battle of Bikini Bottom'),
(3055, 2, 1000, 'love song.', 'excellent', 'Everybody loves somebody'),
(3056, 2, 1000, 'loved this.', 'excellent', 'Under My Skin'),
(3057, 7, 1000, 'metro vibes.', 'excellent', 'Astroworld');

--
-- Triggers `item`
--
DELIMITER $$
CREATE TRIGGER `Decrement` AFTER DELETE ON `item` FOR EACH ROW UPDATE category as C SET C.category_quantity = C.category_quantity - 1 
    WHERE OLD.category_id = C.category_id
$$
DELIMITER ;
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

CREATE TABLE `movie` (
  `item_movie_id` smallint(5) UNSIGNED NOT NULL,
  `director_name` varchar(45) NOT NULL,
  `movie_genre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`item_movie_id`, `director_name`, `movie_genre`) VALUES
(3020, 'James Cameron', 'Sad Drama'),
(3023, 'Disney', 'Kids'),
(3026, 'Colin Trevorrow', 'Action'),
(3045, 'Johnathan Lynn', 'Comedy'),
(3046, 'Michael Bay', 'action'),
(3047, 'Netflix', 'Drama'),
(3048, 'Michael Beasley', 'Thriller'),
(3049, 'Quentin Tarentino', 'Historical Fiction'),
(3050, 'Disney', 'Kids'),
(3051, 'Zack Mcallister', 'Comedy'),
(3052, 'spielberg', 'Action');

-- --------------------------------------------------------

--
-- Table structure for table `music`
--

CREATE TABLE `music` (
  `artist_name` varchar(45) NOT NULL,
  `item_music_id` smallint(5) UNSIGNED NOT NULL,
  `music_genre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `music`
--

INSERT INTO `music` (`artist_name`, `item_music_id`, `music_genre`) VALUES
('Lecrae', 3022, 'Rap'),
('Justin Bieber', 3025, 'Pop'),
('Cilantro', 3028, 'American Dad'),
('Bobby McFerrin', 3031, '80s'),
('Michael Jackson', 3032, 'Pop'),
('Led Zeppelin', 3034, 'rock'),
('The Rolling Stones', 3035, 'Rock'),
('Pink Floyd', 3036, 'Rock'),
('The Beatles', 3037, 'Pop'),
('Jimi Hendrix', 3039, 'Rock'),
('Lecrae', 3040, 'Rap'),
('Led Zeppelin', 3053, 'Rock'),
('Dean Martin', 3055, 'Swing'),
('Frank Sinatra', 3056, 'Jazz'),
('Travis Scott', 3057, 'rap');

-- --------------------------------------------------------

--
-- Table structure for table `trades`
--

CREATE TABLE `trades` (
  `trade_id` smallint(5) UNSIGNED NOT NULL,
  `item_id_initiator` smallint(5) UNSIGNED NOT NULL,
  `item_id_tradee` smallint(5) UNSIGNED DEFAULT NULL,
  `user_id_initiator` bigint(20) UNSIGNED NOT NULL,
  `user_id_tradee` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trades`
--

INSERT INTO `trades` (`trade_id`, `item_id_initiator`, `item_id_tradee`, `user_id_initiator`, `user_id_tradee`) VALUES
(4011, 3020, NULL, 1, NULL),
(4013, 3025, 3021, 3, 1),
(4014, 3027, NULL, 4, NULL),
(4015, 3028, 3047, 5, 2),
(4022, 3044, NULL, 8, NULL),
(4023, 3045, NULL, 8, NULL),
(4024, 3046, NULL, 8, NULL),
(4025, 3049, NULL, 2, NULL),
(4028, 3030, NULL, 2, NULL),
(4030, 3052, 3057, 1, 7),
(4031, 3053, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trade_history`
--

CREATE TABLE `trade_history` (
  `trade_id` smallint(5) UNSIGNED NOT NULL,
  `item_history_id_initiator` smallint(5) UNSIGNED NOT NULL,
  `item_history_id_tradee` smallint(5) UNSIGNED NOT NULL,
  `user_history_id_initiator` bigint(20) UNSIGNED NOT NULL,
  `user_history_id_tradee` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trade_history`
--

INSERT INTO `trade_history` (`trade_id`, `item_history_id_initiator`, `item_history_id_tradee`, `user_history_id_initiator`, `user_history_id_tradee`) VALUES
(4012, 3023, 3029, 2, 5),
(4016, 3031, 3037, 2, 10),
(4017, 3033, 3031, 1, 2),
(4018, 3036, 3050, 10, 2),
(4019, 3042, 3034, 9, 10),
(4020, 3039, 3035, 9, 10),
(4021, 3038, 3050, 9, 10),
(4026, 3048, 3055, 2, 7),
(4027, 3051, 3054, 2, 7),
(4029, 3022, 3056, 2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`) VALUES
(1, 'Farce4wrd', 'rubberducky'),
(2, 'jrizzle1', 'abcd'),
(3, 'razzle1', '1234'),
(4, 'dazzle1', '1234'),
(5, 'Roger', '1234'),
(6, 'abizzle', '1234'),
(7, 'gmoney', '1234'),
(8, 'bfizzle', '1234'),
(9, 'foshizzle', 'efghij'),
(10, 'qsizzle', 'superduper');

-- --------------------------------------------------------

--
-- Table structure for table `video_game`
--

CREATE TABLE `video_game` (
  `item_game_id` smallint(5) UNSIGNED NOT NULL,
  `game_platform` varchar(45) NOT NULL,
  `game_genre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `video_game`
--

INSERT INTO `video_game` (`item_game_id`, `game_platform`, `game_genre`) VALUES
(3021, 'Nintendo', 'Casual'),
(3024, 'PlayStation 4', 'Action'),
(3027, 'PC', 'Arcade'),
(3029, 'PC', 'Educational'),
(3030, 'Gameboy', 'Action'),
(3038, 'Pinball', 'Classic'),
(3041, 'Nintendo DS', 'Casual'),
(3042, 'Xbox 360', 'FPS'),
(3043, 'Gameboy', 'Casual'),
(3044, 'PC', 'Casual'),
(3054, 'PS2', 'casual');

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
  ADD UNIQUE KEY `trade_id_UNIQUE` (`trade_id`),
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
  MODIFY `category_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1009;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3058;

--
-- AUTO_INCREMENT for table `trades`
--
ALTER TABLE `trades`
  MODIFY `trade_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4032;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
-- Constraints for table `video_game`
--
ALTER TABLE `video_game`
  ADD CONSTRAINT `game delete` FOREIGN KEY (`item_game_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
