-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2018 at 12:34 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`) VALUES
(1, 'Γαμπες'),
(4, 'ΔΙΚΕΦΑΛΟΙ'),
(11, 'ΚΑΘΗΜΕΡΙΝΕΣ'),
(12, 'ΚΟΙΛΙΑΚΟΙ'),
(2, 'ΜΗΡΟΙ'),
(16, 'ΠΛΑΤΗ'),
(13, 'ΡΑΧΙΑΙΟΙ'),
(15, 'ΣΤΗΘΟΣ'),
(7, 'ΤΡΙΚΕΦΑΛΟΙ'),
(29, 'ΩΜΟΙ');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `address` longtext,
  `birthdate` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(30) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `registerdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `address`, `birthdate`, `email`, `phonenumber`, `name`, `password`, `username`, `registerdate`) VALUES
(1, 'ΧΙΟΥ 41 ΧΟΛΑΡΓΟΣ', '1990-04-30 00:00:00', 'user1@hotmail.com', '15646546546', 'Θεοδοσία Χαρμπή', NULL, NULL, '2018-02-16 00:00:00'),
(2, 'ΧΙΟΥ 41 ΧΟΛΑΡΓΟΣ', '1990-04-30 00:00:00', 'user2.@hotmail.com', '546546546', 'Christos papadopoulos', NULL, NULL, '2018-02-24 00:00:00'),
(14, '11111', '2018-02-27 00:00:00', NULL, '33544485555', 'Χριστος Σπυρόπουλος', NULL, NULL, '2017-07-25 00:00:00'),
(19, NULL, NULL, NULL, NULL, 'Go-Go Gym', '$2a$10$NZ0s/78owi0SSVkNdDcEQ.EPW4u5r.HDSqjXZbOOzYUBc1JrzGbHC', 'admin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `entry`
--

CREATE TABLE `entry` (
  `id` int(11) NOT NULL,
  `day` varchar(255) DEFAULT NULL,
  `exerciseid` int(11) DEFAULT NULL,
  `programid` int(11) DEFAULT NULL,
  `repeats` int(11) DEFAULT NULL,
  `sets` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(136, '', 28, 24, 30, 3),
(137, '', 29, 24, 10, 3),
(138, '', 30, 24, 15, 3),
(139, '', 53, 24, 15, 3),
(140, 'Ημέρα 1η', 31, 24, 10, 3),
(141, 'Ημέρα 1η', 32, 24, 10, 3),
(142, 'Ημέρα 1η', 33, 24, 10, 3),
(143, 'Ημέρα 1η', 35, 24, 12, 3),
(144, 'Ημέρα 1η', 19, 24, 25, 3),
(148, 'Ημέρα 2η', 39, 24, 12, 3),
(149, 'Ημέρα 2η', 40, 24, 12, 3),
(150, 'Ημέρα 2η', 45, 24, 12, 3),
(151, 'Ημέρα 2η', 46, 24, 12, 3),
(152, 'Ημέρα 2η', 20, 24, 12, 3),
(153, 'Ημέρα 2η', 18, 24, 12, 3),
(154, 'Ημέρα 3η', 21, 24, 10, 3),
(155, 'Ημέρα 3η', 22, 24, 10, 3),
(156, 'Ημέρα 3η', 47, 24, 12, 3),
(157, 'Ημέρα 3η', 48, 24, 12, 3),
(158, 'Ημέρα 4η', 49, 24, 12, 3),
(159, 'Ημέρα 4η', 50, 24, 12, 3),
(160, 'Ημέρα 4η', 51, 24, 12, 3),
(161, 'Ημέρα 4η', 52, 24, 12, 3),
(162, 'Ημέρα 4η', 23, 24, 12, 3),
(163, 'Ημέρα 4η', 24, 24, 12, 3),
(197, '', 28, 27, 30, 3),
(198, '', 29, 27, 10, 3),
(199, '', 30, 27, 15, 3),
(200, '', 53, 27, 15, 3),
(201, 'Ημέρα 1η', 31, 27, 10, 3),
(202, 'Ημέρα 1η', 32, 27, 10, 3),
(203, 'Ημέρα 1η', 33, 27, 10, 3),
(204, 'Ημέρα 1η', 35, 27, 12, 3),
(205, 'Ημέρα 1η', 19, 27, 25, 3),
(209, 'Ημέρα 2η', 39, 27, 12, 3),
(210, 'Ημέρα 2η', 40, 27, 12, 3),
(211, 'Ημέρα 2η', 45, 27, 12, 3),
(212, 'Ημέρα 2η', 46, 27, 12, 3),
(213, 'Ημέρα 2η', 20, 27, 12, 3),
(214, 'Ημέρα 2η', 18, 27, 12, 3),
(215, 'Ημέρα 3η', 21, 27, 10, 3),
(216, 'Ημέρα 3η', 22, 27, 10, 3),
(217, 'Ημέρα 3η', 47, 27, 12, 3),
(218, 'Ημέρα 3η', 48, 27, 12, 3),
(219, 'Ημέρα 4η', 49, 27, 12, 3),
(220, 'Ημέρα 4η', 50, 27, 12, 3),
(221, 'Ημέρα 4η', 51, 27, 12, 3),
(222, 'Ημέρα 4η', 52, 27, 12, 3),
(223, 'Ημέρα 4η', 23, 27, 12, 3),
(224, 'Ημέρα 4η', 24, 27, 12, 3),
(338, 'Ημέρα 4η', 28, 57, 3, 2),
(339, 'Ημέρα 4η', 29, 57, 3, 2),
(341, 'Ημέρα 1η', 20, 59, 2, 1),
(342, 'Ημέρα 1η', 30, 31, 4, 3),
(343, 'Ημέρα 3η', 28, 60, NULL, NULL),
(822, '', 28, 131, 30, 3),
(823, '', 29, 131, 10, 3),
(824, '', 30, 131, 15, 3),
(825, '', 53, 131, 15, 3),
(826, 'Ημέρα 1η', 31, 131, 10, 3),
(827, 'Ημέρα 1η', 32, 131, 10, 3),
(828, 'Ημέρα 1η', 33, 131, 10, 3),
(829, 'Ημέρα 1η', 35, 131, 12, 3),
(830, 'Ημέρα 1η', 19, 131, 25, 3),
(831, 'Ημέρα 2η', 39, 131, 12, 3),
(832, 'Ημέρα 2η', 40, 131, 12, 3),
(833, 'Ημέρα 2η', 45, 131, 12, 3),
(834, 'Ημέρα 2η', 46, 131, 12, 3),
(835, 'Ημέρα 2η', 20, 131, 12, 3),
(836, 'Ημέρα 2η', 18, 131, 12, 3),
(837, 'Ημέρα 3η', 21, 131, 10, 3),
(838, 'Ημέρα 3η', 22, 131, 10, 3),
(839, 'Ημέρα 3η', 47, 131, 12, 3),
(840, 'Ημέρα 3η', 48, 131, 12, 3),
(841, 'Ημέρα 4η', 49, 131, 12, 3),
(842, 'Ημέρα 4η', 50, 131, 12, 3),
(843, 'Ημέρα 4η', 51, 131, 12, 3),
(844, 'Ημέρα 4η', 52, 131, 12, 3),
(845, 'Ημέρα 4η', 23, 131, 12, 3),
(846, 'Ημέρα 4η', 24, 131, 12, 3),
(847, 'Ημέρα 4η', 20, 132, 2, 2),
(850, 'Ημέρα 4η', 20, 133, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `exercise`
--

CREATE TABLE `exercise` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(27, 'Κοιλιακοί1', 11),
(28, 'Σανίδα ακίνητος/η', 12),
(29, 'Άρσεις ποδιών σε ψηλή καρέκλα (με στροφή)', 12),
(30, 'Κράνσις', 12),
(31, 'Leg-Press', 2),
(32, 'Leg-extension', 2),
(33, 'Leg-Curl', 2),
(35, 'Προβολές με αλτήρες', 2),
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
(53, 'Εκτάσεις κορμού στον πάγκο', 13);

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `id` int(11) NOT NULL,
  `comment` longtext,
  `dateend` datetime DEFAULT NULL,
  `datestart` datetime DEFAULT NULL,
  `duration` datetime DEFAULT NULL,
  `contactid` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `history` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`id`, `comment`, `dateend`, `datestart`, `duration`, `contactid`, `title`, `history`) VALUES
(4, 'Διατάσεις πάντα', '2019-02-01 00:00:00', '2018-02-01 00:00:00', NULL, 1, 'Βασικό', NULL),
(24, 'Διατάσεις πάντα', '2019-02-01 00:00:00', '2018-02-01 00:00:00', NULL, 14, 'Βασικό', NULL),
(27, 'Διατάσεις πάντα', '2019-02-01 00:00:00', '2018-02-01 00:00:00', NULL, 2, 'Βασικό', NULL),
(31, NULL, NULL, NULL, NULL, 19, 'Προτυπο 1', NULL),
(41, NULL, '2018-02-28 00:00:00', '2018-02-20 00:00:00', NULL, 14, 'sepultura', b'1'),
(54, NULL, NULL, NULL, NULL, 2, 'Αντιγραφή από google', NULL),
(57, NULL, NULL, NULL, NULL, 14, 'Ανδρεασ', b'1'),
(59, NULL, NULL, NULL, NULL, 2, 'χαχαχα', NULL),
(60, NULL, NULL, NULL, NULL, 19, 'Προτυπο 3', NULL),
(74, NULL, NULL, NULL, NULL, 2, 'Αντίγραφο από Αντιγραφή από google', NULL),
(75, NULL, NULL, NULL, NULL, 2, 'Αντίγραφο από Αντίγραφο από Αντιγραφή από google', NULL),
(131, 'Διατάσεις πάντα', '2019-02-01 00:00:00', '2018-02-01 00:00:00', NULL, 19, 'Αντίγραφο από Βασικό', NULL),
(132, NULL, '2018-02-13 00:00:00', '2018-02-15 00:00:00', NULL, 1, 'sadfasd', b'1'),
(133, NULL, '2018-02-13 00:00:00', '2018-02-15 00:00:00', NULL, 19, 'Αντίγραφο από sadfasd', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

CREATE TABLE `userrole` (
  `id` int(11) NOT NULL,
  `role` varchar(45) NOT NULL,
  `contactid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`id`, `role`, `contactid`) VALUES
(1, 'ROLE_ADMIN', 19);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entry`
--
ALTER TABLE `entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK328q1s72hn80b4i2v67b5fmj3` (`programid`),
  ADD KEY `FKoqrnwts5xt4i6ykn2wlckphnr` (`exerciseid`);

--
-- Indexes for table `exercise`
--
ALTER TABLE `exercise`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKa3dih6jk1e4kqn5onn23o2da1` (`categoryid`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK93ltl9jd9dsq4gwe40ey3dckq` (`contactid`);

--
-- Indexes for table `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKjpxoimo8qsrdmsjyq3e0nnv72` (`role`,`contactid`),
  ADD KEY `FKfg4dkasoftibb836swdmawljb` (`contactid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `entry`
--
ALTER TABLE `entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=851;
--
-- AUTO_INCREMENT for table `exercise`
--
ALTER TABLE `exercise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;
--
-- AUTO_INCREMENT for table `userrole`
--
ALTER TABLE `userrole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
  ADD CONSTRAINT `FK93ltl9jd9dsq4gwe40ey3dckq` FOREIGN KEY (`contactid`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userrole`
--
ALTER TABLE `userrole`
  ADD CONSTRAINT `FKfg4dkasoftibb836swdmawljb` FOREIGN KEY (`contactid`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
