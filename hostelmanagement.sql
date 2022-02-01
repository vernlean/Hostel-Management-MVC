-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2022 at 04:19 PM
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
  `coll_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `college`
--

INSERT INTO `college` (`coll_no`, `coll_name`, `coll_floor`, `coll_room`, `coll_status`) VALUES
('TGA-H1-R1-P1', 'Tun Gemala A', 1, 1, 'Unavailable'),
('TGA-H1-R1-P2', 'Tun Gemala A', 1, 1, 'Available'),
('TGA-H1-R2-P1', 'Tun Gemala A', 1, 2, 'Available'),
('TGA-H1-R2-P2', 'Tun Gemala A', 1, 2, 'Available'),
('TGB-H1-R1-P1', 'Tun Gemala B', 1, 1, 'Available'),
('TGB-H1-R1-P2', 'Tun Gemala B', 1, 1, 'Available'),
('TGB-H1-R2-P1', 'Tun Gemala B', 1, 2, 'Available'),
('TGB-H1-R2-P2', 'Tun Gemala B', 1, 2, 'Available'),
('TGC-H1-R1-P1', 'Tun Gemala C', 1, 1, 'Available'),
('TSLA-H1-R1-P1', 'Tun Sri Lanang A', 1, 1, 'Unavailable'),
('TSLA-H1-R1-P2', 'Tun Sri Lanang A', 1, 1, 'Unavailable'),
('TSLA-H1-R2-P1', 'Tun Sri Lanang A', 1, 2, 'Available'),
('TSLA-H1-R2-P2', 'Tun Sri Lanang A', 1, 2, 'Available'),
('TSLB-H1-R1-P1', 'Tun Sri Lanang B', 1, 1, 'Unavailable'),
('TSLB-H1-R1-P2', 'Tun Sri Lanang B', 1, 1, 'Unavailable'),
('TSLB-H1-R2-P1', 'Tun Sri Lanang B', 1, 2, 'Available'),
('TSLB-H1-R2-P2', 'Tun Sri Lanang B', 1, 2, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `college_application`
--

CREATE TABLE `college_application` (
  `collap_no` int(11) NOT NULL,
  `collap_date` date NOT NULL,
  `collap_session` varchar(255) NOT NULL,
  `collap_status` varchar(255) NOT NULL,
  `stu_no` int(10) NOT NULL,
  `stf_no` int(10) NOT NULL,
  `coll_no` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `college_application`
--

INSERT INTO `college_application` (`collap_no`, `collap_date`, `collap_session`, `collap_status`, `stu_no`, `stf_no`, `coll_no`) VALUES
(31, '2022-01-31', 'SESSION 2 20/21', 'Approved', 2021100657, 11223344, 'TSLA-H1-R1-P1'),
(32, '2022-01-31', 'SESSION 2 20/21', 'Approved', 2020566745, 11223344, 'TGA-H1-R1-P1'),
(33, '2022-01-31', 'SESSION 2 20/21', 'Approved', 2021101499, 11223344, 'TSLA-H1-R1-P2'),
(34, '2022-01-31', 'SESSION 2 20/21', 'Processing', 2021126265, 101, 'TSLB-H1-R1-P1'),
(35, '2022-01-31', 'SESSION 1 20/21', 'Processing', 2021103435, 101, 'TSLB-H1-R1-P2');

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `comp_no` int(11) NOT NULL,
  `comp_type` varchar(255) NOT NULL,
  `comp_date` date NOT NULL,
  `comp_description` varchar(255) NOT NULL,
  `comp_status` varchar(255) NOT NULL,
  `stu_no` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`comp_no`, `comp_type`, `comp_date`, `comp_description`, `comp_status`, `stu_no`) VALUES
(41, 'Electrical', '2022-01-31', '2nd plug problem at TSLA-H1-R1-P1', 'Reviewed', 2021100657),
(42, 'Mechanical', '2022-01-31', 'Shower not working at TSLA-H1-R1-P1', 'Fixed', 2021100657),
(43, 'Telecomunication', '2022-01-31', 'Wifi problem at Tun Gemala A', 'Processing', 2020566745),
(44, 'Electrical', '2022-01-31', 'Light switch not working at TSLB-H1-R1-P2', 'Reviewed', 2021103435);

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

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`stf_no`, `stf_name`, `stf_pass`, `stf_position`, `stf_birthdate`) VALUES
(101, 'Null', 'Null', 'Null', '0000-00-00'),
(11223344, 'Abdul Aziz Bin Ali', '1234', 'Superadmin', '1982-04-08');

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
  `stu_email` varchar(255) DEFAULT NULL,
  `stu_phoneno` varchar(255) DEFAULT NULL,
  `stu_blood` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`stu_no`, `stu_name`, `stu_ic`, `stu_pass`, `stu_program`, `stu_state`, `stu_part`, `stu_gender`, `stu_email`, `stu_phoneno`, `stu_blood`) VALUES
(2020566745, 'Nur Amira Binti Ahmad', '000303015436', '000303015436', 'CS110', 'Johor', 3, 'Female', 'amiraAhmad@gmail.com', '01145233211', 'A'),
(2021100656, 'Muhammad Bin Ahmad', '000707012345', '000707012345', 'CS253', 'Johor', 4, 'Male', 'muhammadAhmad@gmail.com', NULL, NULL),
(2021100657, 'Mohamad Amirul Bin Mohd Razaid', '000606011573', '1234', 'CS253', 'Johor', 4, 'Male', 'amirulrazaid@gmail.com', '01139652311', 'A'),
(2021101499, 'Muhammad Afiq Idham Bin Ramlan', '000114014543', '000114014543', 'CS253', 'Johor', 4, 'Male', 'AfiqIdham@gmail.com', '01228828823', 'B'),
(2021101957, 'Muhammad Azzdhiyaa\'ul Faiqin Bin Azlan', '000415075323', '000415075323', 'CS253', 'Selangor', 4, 'Male', 'Faiqin@gmail.com', '0138943679', 'A'),
(2021103435, 'Muhammad Adib Fikri Bin Maarof', '000801040097', '000801040097', 'CS253', 'Pahang', 4, 'Male', 'afikri000@gmail.com', '01137521534', 'A'),
(2021126265, 'Raheisyamarghany Bin Suheimi', '000412015673', '000412015673', 'CS253', 'Johor', 4, 'Male', 'Raheisyamarghany@gmail.com', '0119278734', 'B'),
(2021133452, 'Nur Aliya Binti Yahya', '001203032342', '001203032342', 'CS110', 'Selangor', 3, 'Female', 'AliyaN@gmail.com', '0128839353', 'A'),
(2021165632, 'Mohamad Azim Bin Abu', '000312074533', '000312074533', 'CS110', 'Perak', 4, 'Male', 'azimMd2@gmail.com', '01139652312', 'A');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `college`
--
ALTER TABLE `college`
  ADD PRIMARY KEY (`coll_no`) USING BTREE;

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
  MODIFY `collap_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `comp_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `college_application`
--
ALTER TABLE `college_application`
  ADD CONSTRAINT `college_application_ibfk_2` FOREIGN KEY (`stu_no`) REFERENCES `student` (`stu_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `college_application_ibfk_3` FOREIGN KEY (`coll_no`) REFERENCES `college` (`coll_no`),
  ADD CONSTRAINT `college_application_ibfk_4` FOREIGN KEY (`stf_no`) REFERENCES `staff` (`stf_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`stu_no`) REFERENCES `student` (`stu_no`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
