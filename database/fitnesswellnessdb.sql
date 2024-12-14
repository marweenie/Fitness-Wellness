-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 4, 2024 at 10:57 PM
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
  `MealID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Food` varchar(100) NOT NULL,
  `Calories` int(11) NOT NULL CHECK (`Calories` > 0),
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meal`
--

INSERT INTO `meal` (`MealID`, `Date`, `Food`, `Calories`, `UserID`) VALUES
(1, '2024-11-26', 'Chicken Salad', 300, 1),
(2, '2024-11-26', 'Pasta', 500, 2),
(3, '2024-11-26', 'Grilled Fish', 350, 3),
(4, '2024-11-02', 'Steak', 500, 4),
(5, '2024-11-03', 'Fruit Smoothie', 200, 5),
(6, '2024-11-03', 'Vegetable Stir-Fry', 300, 6),
(7, '2024-11-04', 'Grilled Salmon', 350, 7),
(8, '2024-11-04', 'Chicken Burger', 250, 8),
(9, '2024-11-05', 'Beef Burger', 450, 9),
(10, '2024-11-05', 'Vegan Wrap', 350, 10),
(11, '2024-11-06', 'Turkey Sandwich', 400, 1),
(12, '2024-11-06', 'Eggplant Parmesan', 500, 2),
(13, '2024-11-07', 'Quinoa Bowl', 350, 3),
(14, '2024-11-07', 'Steak and Potatoes', 600, 4),
(15, '2024-11-08', 'Caesar Salad', 300, 5);

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
(1, '751a05a5866f165678bec1052684cd46', 'John Doe', 25, 'Male', 175.50, 70.00),
(2, '4cce760cab5f8766408e85ed9737c9a9', 'Jane Smith', 30, 'Female', 160.20, 55.00),
(3, '81dc9bdb52d04dc20036dbd8313ed055', 'Sarah Connor', 40, 'Female', 165.70, 65.00),
(4, 'c3caecd497691d2ee3abe3cd427c1948', 'Nathan Oaks', 30, 'Male', 185.30, 90.00),
(5, 'b3e6cd1003ea324236109238a5ec379c', 'Noura Shear', 28, 'Female', 160.40, 55.00),
(6, 'd062ffaf195e2aa01a511119a2f07f57', 'Marwa Chbeir', 90, 'Female', 200.40, 60.00),
(7, '92ec16a714838e4b6f186ec6acdc5da7', 'David Wilson', 33, 'Male', 175.00, 90.00),
(8, '165894661c333dbbaa15c1cebc7c5331', 'Olivia Martinez', 27, 'Female', 160.00, 50.00),
(9, 'e846fb8a4f365ca8e84393d4f34e1b07', 'Daniel Garcia', 38, 'Male', 182.50, 78.00),
(10, '671aa2b583078eadd5feb20f55476313', 'Sophia Clark', 26, 'Female', 165.50, 63.00);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `SessionID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `UserID` int(11) NOT NULL,
  `TypeID` int(11) NOT NULL,
  `Duration` decimal(5,2) NOT NULL DEFAULT 30.00 CHECK (`Duration` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`SessionID`, `Date`, `UserID`, `TypeID`, `Duration`) VALUES
(1, '2024-11-17', 1, 1, 30.00),
(2, '2024-11-19', 2, 2, 45.00),
(3, '2024-11-19', 3, 3, 60.00),
(4, '2024-11-20', 3, 5, 20.00),
(5, '2024-11-21', 2, 6, 15.00),
(6, '2024-11-21', 6, 5, 55.00),
(7, '2024-11-21', 10, 10, 105.00),
(8, '2024-11-21', 9, 4, 35.00),
(9, '2024-11-22', 10, 5, 90.00),
(10, '2024-11-22', 7, 8, 45.00),
(11, '2024-11-22', 5, 2, 50.00),
(12, '2024-11-23', 6, 1, 40.00),
(13, '2024-11-24', 7, 8, 70.00),
(14, '2024-11-24', 8, 10, 50.00);

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
  ADD KEY `UserID` (`UserID`);

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
  ADD KEY `UserID` (`UserID`),
  ADD KEY `TypeID` (`TypeID`);

--
-- Indexes for table `workouttype`
--
ALTER TABLE `workouttype`
  ADD PRIMARY KEY (`TypeID`);

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
