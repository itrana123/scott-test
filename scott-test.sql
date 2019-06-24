-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 24, 2019 at 09:11 PM
-- Server version: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scott-test`
--

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE IF NOT EXISTS `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `created_at`) VALUES
(1, 'Team 1', '2019-06-25 00:28:10'),
(2, 'Team 2', '2019-06-25 00:28:10'),
(3, 'Team 3', '2019-06-25 00:28:23');

-- --------------------------------------------------------

--
-- Table structure for table `teams_users`
--

DROP TABLE IF EXISTS `teams_users`;
CREATE TABLE IF NOT EXISTS `teams_users` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams_users`
--

INSERT INTO `teams_users` (`id`, `team_id`, `user_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `created_at`) VALUES
(1, 'John', 'Doe', '2019-06-25 00:27:36'),
(2, 'Tim', 'Joseph', '2019-06-25 00:27:36'),
(3, 'Cynthia', 'Anderson', '2019-06-25 00:27:55');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `teams_users`
--
ALTER TABLE `teams_users`
  ADD CONSTRAINT `teams_users_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teams_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
