-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2014 at 07:10 AM
-- Server version: 5.5.36
-- PHP Version: 5.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `seedbase`
--

-- --------------------------------------------------------

--
-- Table structure for table `sb_mobiles`
--

CREATE TABLE IF NOT EXISTS `sb_mobiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `make` varchar(255) NOT NULL,
  `operating_system` varchar(255) NOT NULL,
  `os_version` varchar(255) NOT NULL,
  `resolution` varchar(255) NOT NULL,
  `IMEI` varchar(20) NOT NULL,
  `mother_board_number` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `sb_mobiles`
--

INSERT INTO `sb_mobiles` (`id`, `user_id`, `make`, `operating_system`, `os_version`, `resolution`, `IMEI`, `mother_board_number`) VALUES
(1, 1, 'Samsung', 'Andriod', '4.2.2', '480x320', '213123123123123123', 'ABC123ZXD'),
(2, 1, 'SONY', 'Andriod', '4.2.2', '480x320', '213123123123123123', 'ABC123ZXD'),
(3, 1, 'Nokia', 'Windows', '2.1.1', '480x320', '1312312313231312', 'qweqweq123'),
(4, 2, 'Nokia', 'Windows', '1.2.2', '520x440', '0976545677777', 'ZZZZ123'),
(5, 2, 'SONY', 'Andriod', '4.2.2', '480x320', '213123123123123123', 'ABC123ZXD'),
(6, 2, 'Motorolla', 'Andriod', '3.8.2', '480x320', '23423423423432', 'QWER123'),
(7, 3, 'Micromax', 'Andriod', '1.2.2', '520x440', '234234234244', 'RWERW123'),
(8, 3, 'SONY', 'Andriod', '4.1.1', '480x320', '7897857575', 'ETERT8686'),
(9, 3, 'Motorolla', 'Andriod', '3.8.2', '480x320', '23423423423432', 'QWER123');

-- --------------------------------------------------------

--
-- Table structure for table `sb_roles`
--

CREATE TABLE IF NOT EXISTS `sb_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_name` (`role_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sb_roles`
--

INSERT INTO `sb_roles` (`id`, `role_name`) VALUES
(1, 'Administrator'),
(4, 'Device user'),
(2, 'Super admin'),
(3, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `sb_userinfo`
--

CREATE TABLE IF NOT EXISTS `sb_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `mobile_no` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sb_userinfo`
--

INSERT INTO `sb_userinfo` (`id`, `user_id`, `first_name`, `last_name`, `mobile_no`, `address`, `city`, `state`, `zip`, `created_at`, `modified_at`, `created_by`) VALUES
(1, 1, 'admin', 'seedbase', '9999999', 'Chennai', 'Tamilnadu', 'Tamilnadu', '424234', '2014-06-30 09:00:00', '2014-06-30 09:00:00', 1),
(2, 2, 'Manikanta', 'Suryadevara', '2147483647', 'Hyderabad', 'Hyderabad', 'AP', '52343', '2014-07-02 11:00:00', '2014-07-02 11:00:00', 1),
(3, 3, 'Yogananda', 'Suryadevara', '2342344', 'Hyderabad', 'Tenali', 'AP', '234234', '2014-07-02 11:00:00', '2014-07-02 11:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sb_users`
--

CREATE TABLE IF NOT EXISTS `sb_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `user_role` int(11) NOT NULL,
  `user_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 => active, 0 => locked',
  `user_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 => Not deleted, 1 => Deleted',
  `session_terminated` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 => Not terminated, 1 => Terminated by admin',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_role` (`user_role`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sb_users`
--

INSERT INTO `sb_users` (`id`, `username`, `password`, `email`, `user_role`, `user_status`, `user_deleted`, `session_terminated`, `created_at`) VALUES
(1, 'admin@sb.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin@sb.com', 1, 1, 0, 0, '2014-06-30 09:00:00'),
(2, 'mani@gmail.com', 'c29222e98de6437a383e8d946a9b202298e0aa3a', 'mani@gmail.com', 3, 1, 0, 0, '2014-07-02 12:00:00'),
(3, 'yogi@gmail.com', 'de821a3f3382cfca3998a94342130f762505b738', 'yogi@gmail.com', 3, 1, 0, 0, '2014-07-02 16:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sb_user_licensing`
--

CREATE TABLE IF NOT EXISTS `sb_user_licensing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `IMEI` varchar(255) NOT NULL,
  `UUID` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `expiration_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sb_user_licensing`
--

INSERT INTO `sb_user_licensing` (`id`, `user_id`, `name`, `IMEI`, `UUID`, `location`, `number`, `email`, `expiration_date`) VALUES
(1, 1, 'Admin', '5534535353', '11111111111', 'Hyderabad', '3453534545', 'admin@sb.com', '2014-07-24 08:10:00'),
(2, 2, 'Mani', '5534535353', '11111111111', 'Hyderabad', '3424234242', 'mani@gmail.com', '2014-07-28 08:10:00'),
(3, 3, 'Yogi', '42342342', '456456456456', 'Guntur', '86786786', 'yogi@gmail.com', '2014-07-24 08:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `sb_user_session`
--

CREATE TABLE IF NOT EXISTS `sb_user_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '0 => logged_in, 1 => logged_out',
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `sb_user_session`
--

INSERT INTO `sb_user_session` (`id`, `user_id`, `type`, `time`) VALUES
(1, 2, 0, '2014-07-05 19:54:03'),
(2, 2, 1, '2014-07-06 11:43:33'),
(3, 2, 0, '2014-07-06 22:20:29'),
(4, 2, 1, '2014-07-06 22:52:53'),
(5, 2, 0, '2014-07-09 11:23:40'),
(6, 2, 0, '2014-07-10 11:07:26'),
(7, 2, 0, '2014-07-11 11:15:41'),
(8, 2, 0, '2014-07-12 11:10:23'),
(9, 2, 0, '2014-07-12 16:26:28'),
(10, 2, 0, '2014-07-12 22:49:47'),
(11, 2, 0, '2014-07-14 11:02:46'),
(12, 2, 0, '2014-07-14 13:22:05'),
(13, 1, 0, '2014-07-16 09:00:39');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sb_mobiles`
--
ALTER TABLE `sb_mobiles`
  ADD CONSTRAINT `sb_mobiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sb_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sb_userinfo`
--
ALTER TABLE `sb_userinfo`
  ADD CONSTRAINT `sb_userinfo_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sb_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sb_userinfo_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `sb_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sb_users`
--
ALTER TABLE `sb_users`
  ADD CONSTRAINT `sb_users_ibfk_1` FOREIGN KEY (`user_role`) REFERENCES `sb_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
