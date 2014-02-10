-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 10, 2014 at 03:56 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lectureloot`
--
CREATE DATABASE IF NOT EXISTS `lectureloot` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `lectureloot`;

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE IF NOT EXISTS `buildings` (
  `BUILDING_CODE` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `BUILDING_NAME` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `BUILDING LOCATION_ARRAY` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`BUILDING_CODE`),
  KEY `BUILDING_NAME` (`BUILDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` (`BUILDING_CODE`, `BUILDING_NAME`, `BUILDING LOCATION_ARRAY`) VALUES
('LAR', 'Larson Hall', ''),
('LIT', 'Little Hall', ''),
('NEB', 'New Engineering Building', ''),
('NPB', 'New Physics Building', '');

-- --------------------------------------------------------

--
-- Table structure for table `class_actions`
--

CREATE TABLE IF NOT EXISTS `class_actions` (
  `CLASS_ACTION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLASS_ACTION_USER` int(11) NOT NULL,
  `CLASS_ACTION_DEPT` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS_ACTION_COURSE` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS_ACTION_SECTION` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS_ACTION_MEETING_DAY` enum('M','T','W','R','F') COLLATE utf8_unicode_ci NOT NULL,
  `CLASS_ACTION_PERIOD` enum('1','2','3','4','5','6','7','8','9','10','11','E1','E2','E3') COLLATE utf8_unicode_ci NOT NULL,
  `CLASS_ACTION_CHECKIN` tinyint(1) NOT NULL,
  `CLASS_ACTION_CANCELLED` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CLASS_ACTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `COURSE_DEPT_CODE` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `COURSE_SECTION` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `COURSE_CREDIT` smallint(2) NOT NULL,
  `COURSE_TITLE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `COURSE_INSTRUCTOR` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `COURSE_LOCATION_ARRAY` text COLLATE utf8_unicode_ci NOT NULL,
  `COURSE_PERIOD_ARRAY` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `COURSE_ROOM_ARRAY` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`COURSE_DEPT_CODE`,`COURSE_SECTION`),
  KEY `COURSE_SETION` (`COURSE_SECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`COURSE_DEPT_CODE`, `COURSE_SECTION`, `COURSE_CREDIT`, `COURSE_TITLE`, `COURSE_INSTRUCTOR`, `COURSE_LOCATION_ARRAY`, `COURSE_PERIOD_ARRAY`, `COURSE_ROOM_ARRAY`) VALUES
('CEN 3031', '5841', 3, 'Intro to Software Engineering', 'Dr. bacon', '', '[0,2,4]', ''),
('COP 3530', '1234', 3, 'Data structures', 'Dr. bob', '', '[0,2,4]', '["PUGH 170","PUGH 170","PUGH 170"]'),
('COP 3530', '9876', 3, 'Data structures', 'Dr. steve', '', '[5,7,9]', '["PUGH 170","PUGH 170","PUGH 170"]'),
('EEL 4744', '4586', 4, 'Micro Processors ', 'Dr. cheese', '', '[10,12,14,1', '["NEB 102","NEB 102","NEB 102", "NEB 236"]');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `LOG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOG_KEY` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `LOG_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LOG_CALL` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`LOG_ID`, `LOG_KEY`, `LOG_TIME`, `LOG_CALL`) VALUES
(1, 'd3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d', '2014-02-09 20:15:47', '{"call":"course_search","param":"%%e%e%l%%","key":"d3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d"}'),
(2, 'd3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d', '2014-02-09 20:16:02', '{"call":"course_search","param":"%%c%o%p%+%3%%","key":"d3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d"}'),
(3, 'd3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d', '2014-02-09 20:16:14', '{"call":"course_search","param":"%%c%o%p%%","key":"d3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d"}'),
(4, 'd3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d', '2014-02-09 20:58:10', '{"call":"points","key":"d3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d"}'),
(5, 'd3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d', '2014-02-09 21:07:13', '{"call":"points","key":"d3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d"}'),
(6, 'd3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d', '2014-02-09 21:07:15', '{"call":"points","key":"d3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d"}'),
(7, 'd3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d', '2014-02-09 21:07:15', '{"call":"points","key":"d3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d"}'),
(8, 'd3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d', '2014-02-09 21:12:01', '{"call":"points","key":"d3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d"}'),
(9, 'd3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d', '2014-02-09 21:13:38', '{"call":"points","key":"d3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d"}'),
(10, 'd3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d', '2014-02-10 03:32:02', '{"call":"building_search","param":"%N%","key":"d3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d"}'),
(11, 'd3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d', '2014-02-10 03:45:53', '{"call":"building_search","param":"%N%","key":"d3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d"}'),
(12, 'd3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d', '2014-02-10 03:45:59', '{"call":"building_search","param":"%N%e%","key":"d3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d"}');

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE IF NOT EXISTS `registrations` (
  `REGISTRATION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REGISTRATION_USER` int(11) NOT NULL,
  `REGISTRATION_COURSE_DEPT` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `REGISTRATION_COURSE_SECTION` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`REGISTRATION_ID`),
  KEY `REGISTRATION_USER` (`REGISTRATION_USER`),
  KEY `REGISTRATION_COURSE_DEPT` (`REGISTRATION_COURSE_DEPT`),
  KEY `REGISTRATION_COURSE_SECTION` (`REGISTRATION_COURSE_SECTION`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`REGISTRATION_ID`, `REGISTRATION_USER`, `REGISTRATION_COURSE_DEPT`, `REGISTRATION_COURSE_SECTION`) VALUES
(1, 2, 'COP 3530', '1234'),
(2, 2, 'EEL 4744', '4586'),
(3, 3, 'CEN 3031', '5841');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `SESSION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SESSION_START` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SESSION_END` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SESSION_ACTIVE` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SESSION_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`SESSION_ID`, `SESSION_START`, `SESSION_END`, `SESSION_ACTIVE`) VALUES
(1, '2014-02-09 05:00:00', '2014-02-16 04:59:59', 1),
(2, '2014-02-09 05:00:00', '2014-02-16 04:59:59', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `USER_PASSWORD` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `USER_API_KEY` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `USER_EMAIL` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `USER_FIRST_NAME` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `USER_LAST_NAME` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ACTIVE` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `USER_NAME` (`USER_NAME`,`USER_EMAIL`),
  KEY `USER_API_KEY` (`USER_API_KEY`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`USER_ID`, `USER_NAME`, `USER_PASSWORD`, `USER_API_KEY`, `USER_EMAIL`, `USER_FIRST_NAME`, `USER_LAST_NAME`, `USER_ACTIVE`) VALUES
(2, 'bob78964', '3a2a8b4e12d0228e03bb51a80b1110efbb24c25f5d4c446f4d8dd80e51a0ba3da699505265426b0dd5e1cb6ad5b10016cc1cc579419424dbeb9be12156b54c3a', 'd3e74a80bfd8c3fc6c6d0056147c185634a13232138cb127fd2451529d1f0ada01dd19554155caf6e10df2b03f9e1d799341c16642519a48b110a4fe19611d5d', 'yes@ufl.edu', 'bob', 'bobert', 1),
(3, 'catbug987', '6b1fa0e1d7d267f1baad1268b278957fa700b421b3e754a3c2f38d1252551ea8892513e72a6bcd56f931d81394376e7da281004a364b23c5144603e73bed525b', '63acd5ebc1f1c2fa3c5cf896f852a5971732e5184e5e3216031be504ed3c34f9d55b74904d7e30a61ffaf1752914323fe5d6cd6cabb89647fc4a0ad70387695d', 'yes@ufl.edu', 'cat', 'bug', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_points`
--

CREATE TABLE IF NOT EXISTS `user_points` (
  `USER_POINTS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_POINTS_TOTAL` int(11) NOT NULL,
  PRIMARY KEY (`USER_POINTS_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user_points`
--

INSERT INTO `user_points` (`USER_POINTS_ID`, `USER_POINTS_TOTAL`) VALUES
(2, 100),
(3, 100);

-- --------------------------------------------------------

--
-- Table structure for table `wagers`
--

CREATE TABLE IF NOT EXISTS `wagers` (
  `WAGER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `WAGER_USER` int(11) NOT NULL,
  `WAGER_SESSION` int(11) NOT NULL,
  `WAGER_UNIT` int(11) NOT NULL,
  `WAGER_TOTAL` int(11) NOT NULL,
  `WAGER_LOST` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`WAGER_ID`),
  KEY `WAGER_USER` (`WAGER_USER`,`WAGER_SESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `registrations`
--
ALTER TABLE `registrations`
  ADD CONSTRAINT `registrations_ibfk_3` FOREIGN KEY (`REGISTRATION_COURSE_SECTION`) REFERENCES `courses` (`COURSE_SECTION`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registrations_ibfk_1` FOREIGN KEY (`REGISTRATION_USER`) REFERENCES `users` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registrations_ibfk_2` FOREIGN KEY (`REGISTRATION_COURSE_DEPT`) REFERENCES `courses` (`COURSE_DEPT_CODE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_points`
--
ALTER TABLE `user_points`
  ADD CONSTRAINT `user_points_ibfk_1` FOREIGN KEY (`USER_POINTS_ID`) REFERENCES `users` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
