-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 5, 2024 at 08:09 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fitnesswellnessdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `meal`
--

CREATE TABLE `meal` (
  `MealID` int(1) NOT NULL,
  `Date` date NOT NULL,
  `Food` varchar(100) NOT NULL,
  `Calories` int(11) NOT NULL CHECK (`Calories` > 0),
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meal`
--

INSERT INTO `meal` (`MealID`, `Date`, `Food`, `Calories`, `UserID`) VALUES
(1, '2024-12-04', 'Chicken Salad', 450, 14),
(2, '2024-12-03', 'Salmon', 200, 14),
(3, '2024-12-03', 'Broccoli', 20, 14);

-- --------------------------------------------------------

--
-- Table structure for table `oneuser`
--

CREATE TABLE `oneuser` (
  `UserID` int(11) NOT NULL,
  `UserPW` varchar(32) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Age` int(11) DEFAULT 18 CHECK (`Age` > 0),
  `Gender` varchar(6) DEFAULT NULL,
  `Height` decimal(5,2) DEFAULT NULL,
  `Weight` decimal(5,2) NOT NULL DEFAULT 60.00 CHECK (`Weight` > 20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `oneuser`
--

INSERT INTO `oneuser` (`UserID`, `UserPW`, `Name`, `Age`, `Gender`, `Height`, `Weight`) VALUES
(1, '39c5e84d7380e098bdce5e08cd28b7d6', 'Adam Rudolph', 18, 'Male', 190.00, 90.00),
(2, '4cce760cab5f8766408e85ed9737c9a9', 'Jane Smith', 30, 'Female', 160.20, 55.00),
(3, '81dc9bdb52d04dc20036dbd8313ed055', 'Sarah Connor', 40, 'Female', 165.70, 65.00),
(4, 'c3caecd497691d2ee3abe3cd427c1948', 'Nathan Oaks', 30, 'Male', 185.30, 90.00),
(5, 'b3e6cd1003ea324236109238a5ec379c', 'Noura Shear', 28, 'Female', 160.40, 55.00),
(6, 'd062ffaf195e2aa01a511119a2f07f57', 'Marwa Chbeir', 90, 'Female', 200.40, 60.00),
(7, '92ec16a714838e4b6f186ec6acdc5da7', 'David Wilson', 33, 'Male', 175.00, 90.00),
(8, '165894661c333dbbaa15c1cebc7c5331', 'Olivia Martinez', 27, 'Female', 160.00, 50.00),
(9, 'e846fb8a4f365ca8e84393d4f34e1b07', 'Daniel Garcia', 38, 'Male', 182.50, 78.00),
(10, '671aa2b583078eadd5feb20f55476313', 'Sophia Clark', 26, 'Female', 165.50, 63.00),
(11, '81dc9bdb52d04dc20036dbd8313ed055', 'Michael Sepsey', 99, 'Male', 200.00, 100.00),
(12, '751a05a5866f165678bec1052684cd46', 'John Doe', 25, 'Male', 175.50, 70.00),
(13, 'd8578edf8458ce06fbc5bb76a58c5ca4', 'Michelle Ramsey', 34, 'Female', 153.00, 67.00),
(14, '8fd82b8864d71ed7fa12b59e6e34cd1c', 'Gordon Ramsey', 44, 'Male', -2.00, 60.00);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `SessionID` int(1) NOT NULL,
  `Date` date NOT NULL,
  `UserID` int(11) NOT NULL,
  `TypeID` int(11) NOT NULL,
  `Duration` decimal(5,2) NOT NULL DEFAULT 30.00 CHECK (`Duration` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`SessionID`, `Date`, `UserID`, `TypeID`, `Duration`) VALUES
(1, '2024-12-11', 14, 3, 40.00);

-- --------------------------------------------------------

--
-- Table structure for table `workouttype`
--

CREATE TABLE `workouttype` (
  `TypeID` int(11) NOT NULL,
  `ExerciseType` varchar(100) NOT NULL,
  `MET` decimal(4,2) DEFAULT 1.00 CHECK (`MET` > 0),
  `ExerciseMultiplier` decimal(4,2) DEFAULT 1.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workouttype`
--

INSERT INTO `workouttype` (`TypeID`, `ExerciseType`, `MET`, `ExerciseMultiplier`) VALUES
(1, 'Jogging', 7.00, 1.00),
(2, 'Running', 10.00, 1.20),
(3, 'Swimming', 8.00, 1.00),
(4, 'Cycling', 6.00, 1.10),
(5, 'Walking', 3.80, 1.00),
(6, 'Yoga', 3.00, 1.00),
(7, 'Aerobics', 6.50, 1.00),
(8, 'Weightlifting', 3.00, 1.20),
(9, 'Pilates', 4.50, 1.00),
(10, 'Dance', 6.00, 1.10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `meal`
--
ALTER TABLE `meal`
  ADD PRIMARY KEY (`MealID`),
  ADD KEY `meal_ibfk_1` (`UserID`);

--
-- Indexes for table `oneuser`
--
ALTER TABLE `oneuser`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`SessionID`),
  ADD KEY `TypeID` (`TypeID`),
  ADD KEY `sessions_ibfk_1` (`UserID`);

--
-- Indexes for table `workouttype`
--
ALTER TABLE `workouttype`
  ADD PRIMARY KEY (`TypeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `meal`
--
ALTER TABLE `meal`
  MODIFY `MealID` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oneuser`
--
ALTER TABLE `oneuser`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `SessionID` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `meal`
--
ALTER TABLE `meal`
  ADD CONSTRAINT `meal_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `oneuser` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `oneuser` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sessions_ibfk_2` FOREIGN KEY (`TypeID`) REFERENCES `workouttype` (`TypeID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
