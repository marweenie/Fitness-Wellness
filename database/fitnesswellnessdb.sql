-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 5, 2024 at 09:18 PM
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
(3, '2024-12-03', 'Broccoli', 20, 14),
(4, '2024-12-20', 'Orange', 80, 15),
(5, '2024-12-05', 'Chicken Salad', 450, 15),
(6, '2024-12-15', 'Chicken Salad', 300, 15),
(7, '2024-12-16', 'Egg Salad', 400, 1),
(8, '2024-12-17', 'Chicken Wrap', 550, 1),
(9, '2024-12-18', 'Pasta with Pesto', 600, 1),
(10, '2024-12-19', 'Bowl of Rice', 350, 1),
(11, '2024-12-16', 'Pancakes', 500, 2),
(12, '2024-12-17', 'Burrito', 650, 2),
(13, '2024-12-18', 'Chicken Stir Fry', 700, 2),
(14, '2024-12-19', 'Greek Yogurt', 200, 2),
(15, '2024-12-16', 'Chicken Sandwich', 450, 3),
(16, '2024-12-17', 'Salad with Tuna', 400, 3),
(17, '2024-12-18', 'Pizza', 800, 3),
(18, '2024-12-19', 'Grilled Fish', 350, 3),
(19, '2024-12-16', 'Omelette', 300, 4),
(20, '2024-12-17', 'Veggie Burger', 500, 4),
(21, '2024-12-18', 'Spaghetti', 650, 4),
(22, '2024-12-19', 'Cucumber Salad', 200, 4),
(23, '2024-12-16', 'Fruit Salad', 350, 5),
(24, '2024-12-17', 'Eggs and Toast', 400, 5),
(25, '2024-12-18', 'Chicken Salad', 500, 5),
(26, '2024-12-19', 'Rice and Beans', 450, 5),
(27, '2024-12-16', 'Salmon', 500, 6),
(28, '2024-12-17', 'Steak', 700, 6),
(29, '2024-12-18', 'Chicken Soup', 350, 6),
(30, '2024-12-19', 'Grilled Vegetables', 300, 6),
(31, '2024-12-16', 'Sandwich', 450, 7),
(32, '2024-12-17', 'Pasta', 600, 7),
(33, '2024-12-18', 'Sushi', 550, 7),
(34, '2024-12-19', 'Vegetable Soup', 300, 7),
(35, '2024-12-16', 'Fruit Smoothie', 250, 8),
(36, '2024-12-17', 'Cereal', 300, 8),
(37, '2024-12-18', 'Grilled Chicken', 500, 8),
(38, '2024-12-19', 'Falafel', 350, 8),
(39, '2024-12-16', 'Eggs and Avocado', 400, 9),
(40, '2024-12-17', 'Pasta Salad', 500, 9),
(41, '2024-12-18', 'Bowl of Noodles', 600, 9),
(42, '2024-12-19', 'Chicken Tacos', 550, 9),
(43, '2024-12-16', 'Steak Salad', 700, 10),
(44, '2024-12-17', 'Bacon and Eggs', 600, 10),
(45, '2024-12-18', 'Salmon with Veggies', 650, 10),
(46, '2024-12-19', 'Grilled Chicken', 500, 10),
(47, '2024-12-16', 'Pasta Bolognese', 750, 11),
(48, '2024-12-17', 'Chicken Wings', 500, 11),
(49, '2024-12-18', 'Rice and Chicken', 600, 11),
(50, '2024-12-19', 'Spinach Salad', 200, 11),
(51, '2024-12-16', 'Bowl of Oats', 300, 12),
(52, '2024-12-17', 'Grilled Salmon', 500, 12),
(53, '2024-12-18', 'Chicken Stir Fry', 600, 12),
(54, '2024-12-19', 'Vegetable Soup', 350, 12),
(55, '2024-12-16', 'Fruit Salad', 300, 13),
(56, '2024-12-17', 'Grilled Shrimp', 400, 13),
(57, '2024-12-18', 'Salmon with Quinoa', 650, 13),
(58, '2024-12-19', 'Roast Beef', 500, 13),
(59, '2024-12-16', 'Chicken Salad', 450, 14),
(60, '2024-12-17', 'Steak', 600, 14),
(61, '2024-12-18', 'Salmon', 500, 14),
(62, '2024-12-19', 'Spaghetti', 550, 14),
(63, '2024-12-16', 'Pasta', 700, 15),
(64, '2024-12-17', 'Chicken Wrap', 500, 15),
(65, '2024-12-18', 'Steak with Veggies', 650, 15),
(66, '2024-12-19', 'Eggs with Toast', 400, 15),
(67, '2024-12-19', 'Egg Salad', 400, 1),
(68, '2024-12-18', 'Chicken Wrap', 550, 1),
(69, '2024-12-17', 'Pasta with Pesto', 600, 1),
(70, '2024-12-16', 'Bowl of Rice', 350, 1),
(71, '2024-12-19', 'Pancakes', 500, 2),
(72, '2024-12-16', 'Burrito', 650, 2),
(73, '2024-12-17', 'Chicken Stir Fry', 700, 2),
(74, '2024-12-18', 'Greek Yogurt', 200, 2),
(75, '2024-12-14', 'Chicken Sandwich', 450, 3),
(76, '2024-12-15', 'Salad with Tuna', 400, 3),
(77, '2024-12-16', 'Pizza', 800, 3),
(78, '2024-12-16', 'Grilled Fish', 350, 3),
(79, '2024-12-17', 'Grilled Salmon', 350, 3),
(80, '2024-12-17', 'Mac & Cheese', 300, 3),
(81, '2024-12-19', 'Omelette', 300, 4),
(82, '2024-12-15', 'Veggie Burger', 500, 4),
(83, '2024-12-15', 'Spaghetti', 650, 4),
(84, '2024-12-14', 'Cucumber Salad', 200, 4),
(85, '2024-12-13', 'Fruit Salad', 350, 5),
(86, '2024-12-18', 'Eggs and Toast', 400, 5),
(87, '2024-12-19', 'Chicken Salad', 500, 5),
(88, '2024-12-15', 'Rice and Beans', 450, 5),
(89, '2024-12-15', 'Salmon', 500, 6),
(90, '2024-12-15', 'Steak', 700, 6),
(91, '2024-12-14', 'Chicken Soup', 350, 6),
(92, '2024-12-13', 'Grilled Vegetables', 300, 6),
(93, '2024-12-11', 'Sandwich', 450, 7),
(94, '2024-12-12', 'Pasta', 600, 7),
(95, '2024-12-11', 'Sushi', 550, 7),
(96, '2024-12-12', 'Vegetable Soup', 300, 7),
(97, '2024-12-14', 'Fruit Smoothie', 250, 8),
(98, '2024-12-15', 'Cereal', 300, 8),
(99, '2024-12-01', 'Grilled Chicken', 500, 8),
(100, '2024-12-14', 'Falafel', 350, 8),
(101, '2024-12-14', 'Eggs and Avocado', 400, 9),
(102, '2024-12-15', 'Pasta Salad', 500, 9),
(103, '2024-12-16', 'Bowl of Noodles', 600, 9),
(104, '2024-12-17', 'Chicken Tacos', 550, 9),
(105, '2024-12-07', 'Steak Salad', 700, 10),
(106, '2024-12-07', 'Bacon and Eggs', 600, 10),
(107, '2024-12-08', 'Salmon with Veggies', 650, 10),
(108, '2024-12-15', 'Grilled Chicken', 500, 10),
(109, '2024-12-15', 'Pasta Bolognese', 750, 11),
(110, '2024-12-15', 'Chicken Wings', 500, 11),
(111, '2024-12-15', 'Rice and Chicken', 600, 11),
(112, '2024-12-15', 'Spinach Salad', 200, 11),
(113, '2024-12-15', 'Bowl of Oats', 300, 12),
(114, '2024-12-15', 'Grilled Salmon', 500, 12),
(115, '2024-12-15', 'Chicken Stir Fry', 600, 12),
(116, '2024-12-14', 'Vegetable Soup', 350, 12),
(117, '2024-12-16', 'Fruit Salad', 300, 13),
(118, '2024-12-17', 'Grilled Broccoli', 40, 13),
(119, '2024-12-18', 'Salmon', 400, 13),
(120, '2024-12-19', 'Roasted Potatoes', 500, 13),
(121, '2024-12-16', 'Cereal', 450, 14),
(122, '2024-12-17', 'Vegan Steak', 600, 14),
(123, '2024-12-18', 'Gordon Ramsey Soup', 500, 14),
(124, '2024-12-19', 'Spaghetti', 550, 14),
(125, '2024-12-15', 'Pasta', 700, 15),
(126, '2024-12-15', 'Chicken Wrap', 500, 15),
(127, '2024-12-15', 'Cereal', 350, 15),
(128, '2024-12-18', 'Eggs with Toast', 400, 15),
(129, '2024-12-17', 'Eggs with Ranch', 400, 15);

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
(6, 'd062ffaf195e2aa01a511119a2f07f57', 'Jason Scott', 90, 'Male', 220.00, 91.30),
(7, '92ec16a714838e4b6f186ec6acdc5da7', 'David Wilson', 33, 'Male', 175.00, 90.00),
(8, '165894661c333dbbaa15c1cebc7c5331', 'Olivia Martinez', 27, 'Female', 160.00, 50.00),
(9, 'e846fb8a4f365ca8e84393d4f34e1b07', 'Daniel Garcia', 38, 'Male', 182.50, 78.00),
(10, '671aa2b583078eadd5feb20f55476313', 'Sophia Clark', 26, 'Female', 165.50, 63.00),
(11, '81dc9bdb52d04dc20036dbd8313ed055', 'Michael Sepsey', 99, 'Male', 200.00, 100.00),
(12, '751a05a5866f165678bec1052684cd46', 'John Doe', 25, 'Male', 175.50, 70.00),
(13, 'd8578edf8458ce06fbc5bb76a58c5ca4', 'Michelle Ramsey', 34, 'Female', 153.00, 67.00),
(14, '8fd82b8864d71ed7fa12b59e6e34cd1c', 'Gordon Ramsey', 23, 'Male', -2.00, 60.00),
(15, '39e427721132e62162d3a0a56fe6a526', 'Marwa Chbeir', 90, 'Female', 200.00, 60.00);

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
(1, '2024-12-11', 14, 3, 40.00),
(2, '2024-12-05', 14, 1, 45.00),
(3, '2024-12-05', 14, 1, 45.00),
(4, '2024-11-28', 14, 9, 56.00),
(5, '2024-12-05', 15, 1, 30.00),
(6, '2024-12-15', 15, 8, 10.00),
(7, '2024-12-16', 1, 1, 45.00),
(8, '2024-12-17', 1, 2, 50.00),
(9, '2024-12-18', 1, 3, 30.00),
(10, '2024-12-16', 2, 4, 60.00),
(11, '2024-12-17', 2, 5, 30.00),
(12, '2024-12-18', 2, 6, 45.00),
(13, '2024-12-16', 3, 7, 50.00),
(14, '2024-12-17', 3, 8, 60.00),
(15, '2024-12-18', 3, 9, 40.00),
(16, '2024-12-16', 4, 1, 45.00),
(17, '2024-12-17', 4, 3, 50.00),
(18, '2024-12-18', 4, 2, 60.00),
(19, '2024-12-16', 5, 4, 60.00),
(20, '2024-12-17', 5, 5, 40.00),
(21, '2024-12-18', 5, 6, 30.00),
(22, '2024-12-16', 6, 7, 50.00),
(23, '2024-12-17', 6, 8, 60.00),
(24, '2024-12-18', 6, 9, 40.00),
(25, '2024-12-16', 7, 1, 40.00),
(26, '2024-12-17', 7, 3, 45.00),
(27, '2024-12-18', 7, 2, 50.00),
(28, '2024-12-16', 8, 4, 55.00),
(29, '2024-12-17', 8, 5, 60.00),
(30, '2024-12-18', 8, 6, 40.00),
(31, '2024-12-16', 9, 7, 45.00),
(32, '2024-12-17', 9, 8, 50.00),
(33, '2024-12-18', 9, 9, 40.00),
(34, '2024-12-16', 10, 1, 60.00),
(35, '2024-12-17', 10, 3, 50.00),
(36, '2024-12-18', 10, 2, 45.00),
(37, '2024-12-16', 11, 4, 55.00),
(38, '2024-12-17', 11, 5, 40.00),
(39, '2024-12-18', 11, 6, 50.00),
(40, '2024-12-16', 12, 7, 45.00),
(41, '2024-12-17', 12, 8, 60.00),
(42, '2024-12-18', 12, 9, 40.00),
(43, '2024-12-16', 13, 1, 50.00),
(44, '2024-12-17', 13, 3, 45.00),
(45, '2024-12-18', 13, 2, 60.00),
(46, '2024-12-16', 14, 4, 60.00),
(47, '2024-12-17', 14, 5, 30.00),
(48, '2024-12-18', 14, 6, 50.00),
(49, '2024-12-16', 15, 7, 40.00),
(50, '2024-12-17', 15, 8, 55.00),
(51, '2024-12-18', 15, 9, 60.00),
(52, '2024-12-15', 1, 1, 30.00),
(53, '2024-12-15', 1, 3, 45.00),
(54, '2024-12-16', 1, 2, 50.00),
(55, '2024-12-17', 1, 5, 60.00),
(56, '2024-12-18', 1, 7, 40.00),
(57, '2024-12-19', 1, 4, 55.00),
(58, '2024-12-15', 2, 1, 40.00),
(59, '2024-12-15', 2, 4, 60.00),
(60, '2024-12-16', 2, 3, 45.00),
(61, '2024-12-17', 2, 5, 50.00),
(62, '2024-12-18', 2, 7, 55.00),
(63, '2024-12-19', 2, 2, 60.00),
(64, '2024-12-15', 3, 6, 30.00),
(65, '2024-12-15', 3, 8, 50.00),
(66, '2024-12-16', 3, 1, 40.00),
(67, '2024-12-17', 3, 2, 45.00),
(68, '2024-12-18', 3, 7, 60.00),
(69, '2024-12-19', 3, 4, 30.00),
(70, '2024-12-15', 4, 9, 45.00),
(71, '2024-12-15', 4, 5, 55.00),
(72, '2024-12-16', 4, 3, 50.00),
(73, '2024-12-17', 4, 8, 40.00),
(74, '2024-12-18', 4, 2, 60.00),
(75, '2024-12-19', 4, 1, 35.00),
(76, '2024-12-15', 5, 6, 40.00),
(77, '2024-12-15', 5, 10, 50.00),
(78, '2024-12-16', 5, 3, 55.00),
(79, '2024-12-17', 5, 2, 60.00),
(80, '2024-12-18', 5, 1, 45.00),
(81, '2024-12-19', 5, 7, 50.00),
(82, '2024-12-15', 6, 9, 30.00),
(83, '2024-12-15', 6, 8, 60.00),
(84, '2024-12-16', 6, 4, 40.00),
(85, '2024-12-17', 6, 1, 50.00),
(86, '2024-12-18', 6, 3, 55.00),
(87, '2024-12-19', 6, 2, 60.00),
(88, '2024-12-15', 7, 7, 40.00),
(89, '2024-12-15', 7, 6, 45.00),
(90, '2024-12-16', 7, 10, 50.00),
(91, '2024-12-17', 7, 5, 60.00),
(92, '2024-12-18', 7, 4, 30.00),
(93, '2024-12-19', 7, 9, 55.00),
(94, '2024-12-15', 8, 2, 60.00),
(95, '2024-12-15', 8, 5, 40.00),
(96, '2024-12-16', 8, 1, 50.00),
(97, '2024-12-17', 8, 4, 45.00),
(98, '2024-12-18', 8, 10, 55.00),
(99, '2024-12-19', 8, 7, 60.00),
(100, '2024-12-15', 9, 6, 40.00),
(101, '2024-12-15', 9, 3, 50.00),
(102, '2024-12-16', 9, 9, 60.00),
(103, '2024-12-17', 9, 8, 40.00),
(104, '2024-12-18', 9, 7, 45.00),
(105, '2024-12-19', 9, 4, 55.00),
(106, '2024-12-15', 10, 1, 50.00),
(107, '2024-12-15', 10, 4, 40.00),
(108, '2024-12-16', 10, 2, 45.00),
(109, '2024-12-17', 10, 3, 60.00),
(110, '2024-12-18', 10, 8, 55.00),
(111, '2024-12-19', 10, 5, 50.00),
(112, '2024-12-15', 15, 1, 50.00),
(113, '2024-12-15', 15, 4, 40.00),
(114, '2024-12-16', 15, 2, 45.00),
(115, '2024-12-17', 15, 3, 60.00);

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
  MODIFY `MealID` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `oneuser`
--
ALTER TABLE `oneuser`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `SessionID` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

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
