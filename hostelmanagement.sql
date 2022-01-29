-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2022 at 06:35 AM
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
('TGA-H1-R1-P1', 'Tun Gemala A', 1, 1, 'Available'),
('TGA-H1-R1-P2', 'Tun Gemala A', 1, 1, 'Available'),
('TGA-H1-R2-P1', 'Tun Gemala A', 1, 1, 'Available'),
('TGA-H1-R2-P2', 'Tun Gemala A', 1, 1, 'Available'),
('TSLA-H1-R1-P1', 'Tun Sri Lanang A', 1, 1, 'Unavailable'),
('TSLA-H1-R1-P2', 'Tun Sri Lanang A', 1, 1, 'Unavailable'),
('TSLA-H1-R2-P1', 'Tun Sri Lanang A', 1, 1, 'Unavailable'),
('TSLA-H1-R2-P2', 'Tun Sri Lanang A', 1, 1, 'Available'),
('TSLB-H1-R1-P1', 'Tun Sri Lanang B', 1, 1, 'Available'),
('TSLB-H1-R1-P2', 'Tun Sri Lanang B', 1, 1, 'Available'),
('TSLB-H1-R2-P1', 'Tun Sri Lanang B', 1, 1, 'Available'),
('TSLB-H1-R2-P2', 'Tun Sri Lanang B', 1, 1, 'Available');

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `college`
--
ALTER TABLE `college`
  ADD PRIMARY KEY (`coll_no`) USING BTREE;

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`stf_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
