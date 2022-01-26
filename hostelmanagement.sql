-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2022 at 03:14 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hostelmanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE `college` (
  `coll_no` varchar(255) NOT NULL,
  `coll_name` varchar(255) NOT NULL,
  `coll_floor` int(11) NOT NULL,
  `coll_room` int(11) NOT NULL,
  `coll_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `college_application`
--

CREATE TABLE `college_application` (
  `collap_no` int(11) NOT NULL,
  `collap_date` date NOT NULL,
  `collap_session` varchar(255) NOT NULL,
  `collap_status` tinyint(1) NOT NULL,
  `stu_no` int(10) NOT NULL,
  `stf_no` int(10) NOT NULL,
  `coll_no` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `comp_no` int(11) NOT NULL,
  `comp_type` varchar(255) NOT NULL,
  `comp_date` date NOT NULL,
  `comp_description` varchar(255) NOT NULL,
  `comp_status` tinyint(1) NOT NULL,
  `stu_no` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `stf_no` int(10) NOT NULL,
  `stf_name` varchar(255) NOT NULL,
  `stf_pass` varchar(255) NOT NULL,
  `stf_position` varchar(255) NOT NULL,
  `stf_birthdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `stu_no` int(10) NOT NULL,
  `stu_name` varchar(255) NOT NULL,
  `stu_ic` varchar(12) NOT NULL,
  `stu_pass` varchar(255) NOT NULL,
  `stu_program` varchar(255) NOT NULL,
  `stu_state` varchar(255) NOT NULL,
  `stu_part` int(11) NOT NULL,
  `stu_gender` varchar(255) NOT NULL,
  `stu_email` varchar(255) NOT NULL,
  `stu_phoneno` varchar(255) NOT NULL,
  `stu_blood` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `college`
--
ALTER TABLE `college`
  ADD PRIMARY KEY (`coll_no`);

--
-- Indexes for table `college_application`
--
ALTER TABLE `college_application`
  ADD PRIMARY KEY (`collap_no`),
  ADD KEY `stu_no` (`stu_no`),
  ADD KEY `stf_no` (`stf_no`),
  ADD KEY `coll_no` (`coll_no`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`comp_no`),
  ADD KEY `matrixno` (`stu_no`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`stf_no`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`stu_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `college_application`
--
ALTER TABLE `college_application`
  MODIFY `collap_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `comp_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `college_application`
--
ALTER TABLE `college_application`
  ADD CONSTRAINT `college_application_ibfk_1` FOREIGN KEY (`stf_no`) REFERENCES `staff` (`stf_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `college_application_ibfk_2` FOREIGN KEY (`stu_no`) REFERENCES `student` (`stu_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `college_application_ibfk_3` FOREIGN KEY (`coll_no`) REFERENCES `college` (`coll_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`stu_no`) REFERENCES `student` (`stu_no`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
