-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 12, 2018 at 05:08 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crm`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`) VALUES
(1, 'ΓΑΜΠΕΣ'),
(4, 'ΔΙΚΕΦΑΛΟΙ'),
(12, 'ΚΟΙΛΙΑΚΟΙ'),
(2, 'ΜΗΡΟΙ'),
(16, 'ΠΛΑΤΗ'),
(13, 'ΡΑΧΙΑΙΟΙ'),
(15, 'ΣΤΗΘΟΣ'),
(7, 'ΤΡΙΚΕΦΑΛΟΙ'),
(14, 'ΩΜΟΙ');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` longtext,
  `birthdate` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(30) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `registerdate` datetime DEFAULT NULL,
  `role` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `address`, `birthdate`, `email`, `phonenumber`, `name`, `password`, `username`, `registerdate`, `role`) VALUES
(1, 'ΧΙΟΥ 41 ΧΟΛΑΡΓΟΣ ΑΘΗΝΑ', '1988-09-25 23:00:00', 'theodosia.charmpi@gmail.com', '6947139366', 'Θεοδοσία Χαρμπή', NULL, NULL, '2016-12-28 00:00:00', 'ROLE_CUSTOMER'),
(19, NULL, NULL, NULL, NULL, 'Go-Go Gym', '$2a$10$NZ0s/78owi0SSVkNdDcEQ.EPW4u5r.HDSqjXZbOOzYUBc1JrzGbHC', 'admin', NULL, 'ROLE_ADMIN'),
(21, 'ΦΑΝΕΡΩΜΕΝΗΣ 13 ΧΟΛΑΡΓΟΣ', NULL, 'komaragos@yahoo.gr', '6958149381', 'ΜΑΡΑΓΚΟΣ ΚΩΣΤΑΣ', NULL, NULL, '2018-02-16 00:00:00', NULL),
(23, NULL, NULL, NULL, NULL, 'metal', '$2a$10$KQZ6aYuduRuvWNqqQP0kQuweLy.jVSVH6/vHJ4jKb8umoOgh11A5e', 'metal', NULL, 'ROLE_ADMIN'),
(24, NULL, NULL, NULL, NULL, 'metal2', '$2a$10$iL3czdMAnouTMQolW4qykuGUWwDu227pQCUy6F3vu1a432EryTF4m', 'metal2', NULL, 'ROLE_ADMIN'),
(25, NULL, NULL, NULL, NULL, 'xaxa', '$2a$10$tEH6T5DMF3Nh8e1LlgCtW.froluw5mi5brVjRoezUr3qo1E8iIt7u', 'xaxa', NULL, 'ROLE_ADMIN'),
(26, NULL, NULL, NULL, NULL, 'ccc', NULL, 'cccc', NULL, 'ROLE_ADMIN'),
(27, NULL, NULL, NULL, NULL, 'google', NULL, NULL, NULL, 'ROLE_CUSTOMER'),
(28, NULL, NULL, NULL, NULL, 'andreas', '$2a$10$Z4W5fWGnM5cyBiVcZGq6Ru3VRPSkahwaEoH2nA95qEnt0c0lPZ.Oe', 'metal1', NULL, 'ROLE_TRAINER'),
(29, NULL, NULL, NULL, NULL, 'Χρίστος ρηγάλος', '$2a$10$p8RLAyrIRRKkfdgitczmiOGJZlCjkIytXB3OuUeL.ZxCXDnUi.azi', 'xristos', NULL, 'ROLE_TRAINER'),
(30, NULL, NULL, NULL, NULL, 'thanassis', NULL, NULL, NULL, 'ROLE_CUSTOMER');

-- --------------------------------------------------------

--
-- Table structure for table `entry`
--

DROP TABLE IF EXISTS `entry`;
CREATE TABLE IF NOT EXISTS `entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(255) DEFAULT NULL,
  `exerciseid` int(11) DEFAULT NULL,
  `programid` int(11) DEFAULT NULL,
  `repeats` int(11) DEFAULT NULL,
  `sets` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK328q1s72hn80b4i2v67b5fmj3` (`programid`),
  KEY `FKoqrnwts5xt4i6ykn2wlckphnr` (`exerciseid`)
) ENGINE=InnoDB AUTO_INCREMENT=540 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entry`
--

INSERT INTO `entry` (`id`, `day`, `exerciseid`, `programid`, `repeats`, `sets`) VALUES
(39, '', 28, 4, 30, 3),
(40, '', 29, 4, 10, 3),
(41, '', 30, 4, 15, 3),
(42, NULL, 53, 4, 15, 3),
(43, 'Ημέρα 1η', 31, 4, 10, 3),
(44, 'Ημέρα 1η', 32, 4, 10, 3),
(45, 'Ημέρα 1η', 33, 4, 10, 3),
(46, 'Ημέρα 1η', 35, 4, 12, 3),
(47, 'Ημέρα 1η', 19, 4, 25, 3),
(48, 'Ημέρα 1η', 36, 4, 12, 3),
(49, 'Ημέρα 1η', 37, 4, 12, 3),
(50, 'Ημέρα 1η', 38, 4, 12, 3),
(51, 'Ημέρα 2η', 39, 4, 12, 3),
(52, 'Ημέρα 2η', 40, 4, 12, 3),
(53, 'Ημέρα 2η', 45, 4, 12, 3),
(54, 'Ημέρα 2η', 46, 4, 12, 3),
(55, 'Ημέρα 2η', 20, 4, 12, 3),
(56, 'Ημέρα 2η', 18, 4, 12, 3),
(57, 'Ημέρα 3η', 21, 4, 10, 3),
(58, 'Ημέρα 3η', 22, 4, 10, 3),
(59, 'Ημέρα 3η', 47, 4, 12, 3),
(60, 'Ημέρα 3η', 48, 4, 12, 3),
(61, 'Ημέρα 4η', 49, 4, 12, 3),
(62, 'Ημέρα 4η', 50, 4, 12, 3),
(63, 'Ημέρα 4η', 51, 4, 12, 3),
(64, 'Ημέρα 4η', 52, 4, 12, 3),
(65, 'Ημέρα 4η', 23, 4, 12, 3),
(66, 'Ημέρα 4η', 24, 4, 12, 3),
(310, 'Ημέρα 1η', 18, 4, 4, 1),
(311, 'Ημέρα 1η', 20, 4, 5, 1),
(321, '', 28, 60, 30, 3),
(322, '', 29, 60, 10, 3),
(323, '', 30, 60, 15, 3),
(324, '', 53, 60, 15, 3),
(325, 'Ημέρα 1η', 31, 60, 10, 3),
(326, 'Ημέρα 1η', 32, 60, 10, 3),
(327, 'Ημέρα 1η', 33, 60, 10, 3),
(328, 'Ημέρα 1η', 35, 60, 12, 3),
(329, 'Ημέρα 1η', 19, 60, 25, 3),
(330, 'Ημέρα 1η', 36, 60, 12, 3),
(331, 'Ημέρα 1η', 37, 60, 12, 3),
(332, 'Ημέρα 1η', 38, 60, 12, 3),
(333, 'Ημέρα 2η', 39, 60, 12, 3),
(334, 'Ημέρα 2η', 40, 60, 12, 3),
(335, 'Ημέρα 2η', 45, 60, 12, 3),
(336, 'Ημέρα 2η', 46, 60, 12, 3),
(337, 'Ημέρα 2η', 20, 60, 12, 3),
(338, 'Ημέρα 2η', 18, 60, 12, 3),
(339, 'Ημέρα 3η', 21, 60, 10, 3),
(340, 'Ημέρα 3η', 22, 60, 10, 3),
(341, 'Ημέρα 3η', 47, 60, 12, 3),
(342, 'Ημέρα 3η', 48, 60, 12, 3),
(343, 'Ημέρα 4η', 49, 60, 12, 3),
(344, 'Ημέρα 4η', 50, 60, 12, 3),
(345, 'Ημέρα 4η', 51, 60, 12, 3),
(346, 'Ημέρα 4η', 52, 60, 12, 3),
(347, 'Ημέρα 4η', 23, 60, 12, 3),
(348, 'Ημέρα 4η', 24, 60, 12, 3),
(349, 'Ημέρα 1η', 18, 60, 4, 1),
(350, 'Ημέρα 1η', 20, 60, 5, 1),
(528, '', 30, 69, 15, 3),
(529, '', 28, 69, 30, 3),
(530, '', 29, 69, 15, 3),
(531, 'Ημέρα 1η', 32, 69, 10, 3),
(532, 'Ημέρα 1η', 21, 69, 10, 3),
(533, 'Ημέρα 1η', 35, 69, 10, 3),
(534, 'Ημέρα 1η', 33, 69, 10, 3),
(535, 'Ημέρα 1η', 48, 69, 10, 3),
(536, 'Ημέρα 2η', 38, 69, 10, 3),
(537, 'Ημέρα 2η', 36, 69, 10, 3),
(538, 'Ημέρα 3η', 20, 69, 10, 3),
(539, 'Ημέρα 3η', 18, 69, 10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
CREATE TABLE IF NOT EXISTS `exercise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKa3dih6jk1e4kqn5onn23o2da1` (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exercise`
--

INSERT INTO `exercise` (`id`, `title`, `categoryid`) VALUES
(18, 'Κάμψεις σφυριά', 4),
(19, '\'Αρσεις γαμπων όριος χωρίς βάρος', 1),
(20, 'Κάμψεις Larry Scott', 4),
(21, 'Squat στο Smith', 2),
(22, 'Προβολές στο Smith', 2),
(23, 'Πιέσεις τροχαλίας-ισια αναστροφή λαβή', 7),
(24, 'Πιέσεις τροχαλίας-τριγωνική λαβή', 7),
(28, 'Σανίδα ακίνητος/η', 12),
(29, 'Άρσεις ποδιών σε ψηλή καρέκλα (με στροφή)', 12),
(30, 'Κράνσις', 12),
(31, 'Leg-Press', 2),
(32, 'Leg-extension', 2),
(33, 'Leg-Curl', 2),
(35, 'Προβολές με αλτήρες', 2),
(36, 'Εκτάσεις με αλτήρες', 14),
(37, 'Προτάσεις αλτήρων-εναλλαξ', 14),
(38, 'Εμπροσθολαίμιες πιέσεισ με μπάρα όρθιος', 14),
(39, 'Πιέσεις πάγκου', 15),
(40, 'Πιέσεις επικλινη πάγκου', 15),
(45, 'Εκτάσεις με αλτήρες', 15),
(46, 'Pull-Over', 15),
(47, 'Πιέσεις προσαγωγών', 2),
(48, 'Πιέσεις απαγωγών', 2),
(49, 'Εμπροσθολαίμιες τροχαλίας', 16),
(50, 'Οπισθολαίμιες τροχαλίας', 16),
(51, 'Χαμηλή κοπηλατική κλειστή λαβή', 16),
(52, 'Καθιστή κοπηλατική', 16),
(53, 'Εκτάσεις κορμού στον πάγκο', 13),
(54, 'Καμψεις', 4);

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
CREATE TABLE IF NOT EXISTS `program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` longtext,
  `dateend` datetime DEFAULT NULL,
  `datestart` datetime DEFAULT NULL,
  `duration` datetime DEFAULT NULL,
  `contactid` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `history` bit(1) DEFAULT NULL,
  `admincontact` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK93ltl9jd9dsq4gwe40ey3dckq` (`contactid`),
  KEY `FK55kydqt5g37fg2psf5dbxlhv2` (`admincontact`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`id`, `comment`, `dateend`, `datestart`, `duration`, `contactid`, `title`, `history`, `admincontact`) VALUES
(4, 'Διατάσεις πάντα', '2019-02-01 00:00:00', '2018-02-01 00:00:00', NULL, 1, 'Βασικό', b'1', NULL),
(60, 'Διατάσεις πάντα', NULL, NULL, NULL, 19, 'Πρότυπο', NULL, NULL),
(69, 'ΜΙΚΡΑ ΔΙΑΛΛΕΙΜΑΤΑ', NULL, NULL, NULL, 21, 'ΕΝΔΥΝΑΜΩΣΗ', NULL, NULL),
(74, NULL, NULL, NULL, NULL, 1, 'xaxa', NULL, 19),
(78, NULL, NULL, NULL, NULL, 1, 'χαχαχα', NULL, 29),
(79, NULL, NULL, NULL, NULL, 30, 'you', NULL, 29);

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
CREATE TABLE IF NOT EXISTS `userrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  `contactid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKjpxoimo8qsrdmsjyq3e0nnv72` (`role`,`contactid`),
  KEY `FKfg4dkasoftibb836swdmawljb` (`contactid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`id`, `role`, `contactid`) VALUES
(1, 'ROLE_ADMIN', 19),
(2, 'ROLE_ADMIN', 23);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `entry`
--
ALTER TABLE `entry`
  ADD CONSTRAINT `FK328q1s72hn80b4i2v67b5fmj3` FOREIGN KEY (`programid`) REFERENCES `program` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKoqrnwts5xt4i6ykn2wlckphnr` FOREIGN KEY (`exerciseid`) REFERENCES `exercise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exercise`
--
ALTER TABLE `exercise`
  ADD CONSTRAINT `FKa3dih6jk1e4kqn5onn23o2da1` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `program`
--
ALTER TABLE `program`
  ADD CONSTRAINT `FK55kydqt5g37fg2psf5dbxlhv2` FOREIGN KEY (`admincontact`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK93ltl9jd9dsq4gwe40ey3dckq` FOREIGN KEY (`contactid`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userrole`
--
ALTER TABLE `userrole`
  ADD CONSTRAINT `FKfg4dkasoftibb836swdmawljb` FOREIGN KEY (`contactid`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
