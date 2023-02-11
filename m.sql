-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2022 at 08:08 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `m`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendence`
--

CREATE TABLE `attendence` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `month` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `working_day` int(11) NOT NULL,
  `absent` int(11) NOT NULL,
  `total_salary` int(11) NOT NULL,
  `attended` int(11) NOT NULL,
  `bonus` int(11) NOT NULL,
  `is_paid` int(11) NOT NULL DEFAULT 0,
  `provident_fund` int(11) NOT NULL,
  `professional_tax` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendence`
--

INSERT INTO `attendence` (`id`, `employee_id`, `month`, `year`, `working_day`, `absent`, `total_salary`, `attended`, `bonus`, `is_paid`, `provident_fund`, `professional_tax`) VALUES
(1, 51, '02', '2022', 24, 1, 38667, 23, 0, 0, 0, 0),
(2, 36, '02', '2022', 25, 1, 3867, 24, 0, 0, 0, 0),
(3, 51, '04', '2022', 24, 0, 40000, 24, 0, 0, 0, 0),
(4, 36, '04', '2022', 25, 0, 4000, 25, 0, 0, 0, 0),
(5, 50, '04', '2022', 25, 0, 400000, 25, 0, 1, 0, 0),
(6, 51, '05', '2022', 24, 0, 40000, 24, 0, 1, 0, 0),
(7, 36, '05', '2022', 25, 0, 4000, 25, 0, 0, 0, 0),
(8, 50, '05', '2022', 25, 0, 3679578, 25, 0, 0, 0, 0),
(9, 51, '12', '2022', 24, 2, 37334, 22, 0, 0, 0, 0),
(10, 36, '12', '2022', 25, 2, 3734, 23, 0, 0, 0, 0),
(11, 50, '12', '2022', 26, 0, 4000, 26, 0, 1, 900, 450),
(12, 51, '11', '2022', 24, 0, 40000, 24, 0, 0, 0, 0),
(13, 36, '11', '2022', 25, 0, 4000, 25, 0, 0, 0, 0),
(14, 50, '11', '2022', 26, 0, 4000, 26, 0, 1, 900, 450);

-- --------------------------------------------------------

--
-- Table structure for table `employee_leave`
--

CREATE TABLE `employee_leave` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date NOT NULL,
  `reason` text CHARACTER SET utf8 NOT NULL,
  `is_approve` int(11) NOT NULL,
  `leave_days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_leave`
--

INSERT INTO `employee_leave` (`id`, `emp_id`, `start_date`, `end_date`, `reason`, `is_approve`, `leave_days`) VALUES
(13, '47', '2022-04-25', '2022-04-28', 'family issue', 1, 3),
(14, '36', '2022-08-09', '2022-08-10', 'Sick', 0, 1),
(15, '36', '2022-08-17', '2022-08-18', 'uygyg', 0, 1),
(16, '36', '2022-08-26', '2022-08-29', 'uytr6r6', 1, 3),
(17, '50', '2022-08-29', '2022-08-30', 'None', 0, 1),
(18, '49', '2022-08-21', '2022-08-24', 'sick', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `employee_id` int(128) NOT NULL,
  `project_name` varchar(128) NOT NULL,
  `date` date NOT NULL,
  `project_file` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `is_completed` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `employee_id`, `project_name`, `date`, `project_file`, `remarks`, `created_at`, `updated_at`, `is_completed`) VALUES
(2, 49, 'Project1', '2022-08-18', '1660836950.pdf', NULL, '2022-08-18 15:35:49', '2022-08-18 15:35:49', 0),
(3, 48, 'First', '2022-08-18', '1660837188.txt', NULL, '2022-08-18 15:39:48', '2022-08-18 15:39:48', 0),
(4, 51, 'Lols', '2022-08-19', '1660881972.pdf', 'read it ', '2022-08-19 04:06:11', '2022-08-19 04:06:11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `id` int(11) NOT NULL,
  `employee_id` int(128) NOT NULL,
  `expire_date` date DEFAULT NULL,
  `total_salary` int(11) NOT NULL,
  `join_date` date DEFAULT current_timestamp(),
  `medical_allowance` int(255) NOT NULL,
  `house_rent` int(255) NOT NULL,
  `travel_allowance` int(255) NOT NULL,
  `basic_salary` int(255) NOT NULL,
  `working_days` int(255) NOT NULL,
  `deduction_rate` int(11) NOT NULL,
  `status` enum('active','cancel') CHARACTER SET utf8 NOT NULL DEFAULT 'active',
  `bonus` int(11) NOT NULL,
  `provident_fund` int(11) NOT NULL,
  `professional_tax` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`id`, `employee_id`, `expire_date`, `total_salary`, `join_date`, `medical_allowance`, `house_rent`, `travel_allowance`, `basic_salary`, `working_days`, `deduction_rate`, `status`, `bonus`, `provident_fund`, `professional_tax`) VALUES
(40, 51, '2023-07-01', 31000, '2022-07-12', 10000, 10000, 1000, 10000, 24, 1033, 'cancel', 10000, 0, 0),
(41, 51, '2023-07-01', 27000, '2022-07-12', 5000, 10000, 2000, 10000, 20, 900, 'cancel', 10000, 0, 0),
(42, 51, '2023-01-05', 40000, '2022-07-12', 10000, 10000, 10000, 10000, 24, 1333, 'active', 10000, 0, 0),
(43, 36, '2022-12-31', 4000, '2022-07-22', 1000, 1000, 1000, 1000, 25, 133, 'active', 1000, 0, 0),
(44, 50, '2022-08-31', 400000, '2022-08-19', 100000, 100000, 100000, 100000, 25, 13333, 'cancel', 0, 0, 0),
(45, 50, '2022-08-19', 3679578, '2022-08-19', 132154, 215, 3546544, 665, 25, 122653, 'cancel', 0, 0, 0),
(46, 50, '2022-08-25', 4000, '2022-08-25', 1000, 1000, 1000, 1000, 26, 133, 'active', 100, 900, 450);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `phone_number` varchar(128) NOT NULL,
  `username` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp(),
  `role` varchar(128) NOT NULL DEFAULT 'employee',
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone_number`, `username`, `email`, `password`, `created_at`, `updated_at`, `role`, `address`) VALUES
(36, 'kazi', 'nahid', '01990346764', 'neom', 'kazineom@gmail.com', '1234', '2022-04-20 08:35:29', '2022-04-20 08:35:29', 'admin', NULL),
(46, 'abir', 'jaman', '01926635576', 'abirp', 'abir@gmail.com', '1234', NULL, NULL, 'employee', NULL),
(47, 'asif', 'shanto', '01956634543', 'shanto', 'asif@gmail.com', '1234', NULL, NULL, 'employee', NULL),
(48, 'kazi', 'leon', '01913665853', 'leon', 'leon@gmail.com', '1234', NULL, NULL, 'employee', NULL),
(49, 'bijoy', 'khannn', '01765434565', 'bijoy', 'bijoy@gmail.com', '1234', NULL, NULL, 'employee', NULL),
(50, 'K1', 'H1', '0123456761', 'Admin', 'admin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2022-07-01 16:49:06', '2022-07-01 12:49:05', 'admin', 'Dhaka'),
(51, 'Moinul', 'Hasan', '+8801624032690', 'Moin', 'moin360@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2022-07-12 07:13:00', '2022-07-12 11:13:56', 'employee', 'Dhaka'),
(52, 'Mana', 'Ger', '+8801624032691', 'dms', 'abc@dmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '2022-08-12 15:32:00', '2022-08-12 19:32:30', 'manager', 'Dhaka'),
(53, 'a', 's', '+8801624032691', '10a', 'd@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2022-08-18 11:37:00', '2022-08-18 15:37:04', 'employee', 'Dhaka');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendence`
--
ALTER TABLE `attendence`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_leave`
--
ALTER TABLE `employee_leave`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `in_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendence`
--
ALTER TABLE `attendence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `employee_leave`
--
ALTER TABLE `employee_leave`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
