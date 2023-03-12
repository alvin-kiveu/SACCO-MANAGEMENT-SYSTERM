-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2023 at 03:01 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newsacco`
--

-- --------------------------------------------------------

--
-- Table structure for table `borrowers`
--

CREATE TABLE `borrowers` (
  `id` int(30) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `contact_no` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `tax_id` varchar(50) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrowers`
--

INSERT INTO `borrowers` (`id`, `firstname`, `middlename`, `lastname`, `contact_no`, `address`, `email`, `tax_id`, `date_created`) VALUES
(3, 'Kiveu', 'Odari', 'Alvin', '0768168060', 'Nakuru', 'alvo967@gmail.com', '67623', 0);

-- --------------------------------------------------------

--
-- Table structure for table `loan_list`
--

CREATE TABLE `loan_list` (
  `id` int(30) NOT NULL,
  `ref_no` varchar(50) NOT NULL,
  `loan_type_id` int(30) NOT NULL,
  `borrower_id` int(30) NOT NULL,
  `purpose` text NOT NULL,
  `amount` double NOT NULL,
  `amountpaid` int(11) NOT NULL,
  `plan_id` int(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0= request, 1= confrimed,2=released,3=complteted,4=denied\r\n',
  `date_released` datetime NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan_list`
--

INSERT INTO `loan_list` (`id`, `ref_no`, `loan_type_id`, `borrower_id`, `purpose`, `amount`, `amountpaid`, `plan_id`, `status`, `date_released`, `date_created`) VALUES
(7, '5876887', 1, 3, 'cgcg', 1000, 0, 5, 3, '2023-03-10 06:16:00', '2023-03-10 08:16:52');

-- --------------------------------------------------------

--
-- Table structure for table `loan_plan`
--

CREATE TABLE `loan_plan` (
  `id` int(30) NOT NULL,
  `months` int(11) NOT NULL,
  `interest_percentage` float NOT NULL,
  `penalty_rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan_plan`
--

INSERT INTO `loan_plan` (`id`, `months`, `interest_percentage`, `penalty_rate`) VALUES
(1, 36, 8, 3),
(2, 24, 5, 2),
(3, 27, 6, 2),
(4, 5, 12, 100),
(5, 72, 12, 100),
(6, 1, 20, 5);

-- --------------------------------------------------------

--
-- Table structure for table `loan_schedules`
--

CREATE TABLE `loan_schedules` (
  `id` int(30) NOT NULL,
  `loan_id` int(30) NOT NULL,
  `date_due` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan_schedules`
--

INSERT INTO `loan_schedules` (`id`, `loan_id`, `date_due`) VALUES
(1, 1, '2023-04-08'),
(2, 1, '2023-05-08'),
(3, 1, '2023-06-08'),
(4, 1, '2023-07-08'),
(5, 1, '2023-08-08'),
(6, 1, '2023-09-08'),
(7, 1, '2023-10-08'),
(8, 1, '2023-11-08'),
(9, 1, '2023-12-08'),
(10, 1, '2024-01-08'),
(11, 1, '2024-02-08'),
(12, 1, '2024-03-08'),
(13, 1, '2024-04-08'),
(14, 1, '2024-05-08'),
(15, 1, '2024-06-08'),
(16, 1, '2024-07-08'),
(17, 1, '2024-08-08'),
(18, 1, '2024-09-08'),
(19, 1, '2024-10-08'),
(20, 1, '2024-11-08'),
(21, 1, '2024-12-08'),
(22, 1, '2025-01-08'),
(23, 1, '2025-02-08'),
(24, 1, '2025-03-08'),
(25, 1, '2025-04-08'),
(26, 1, '2025-05-08'),
(27, 1, '2025-06-08'),
(28, 1, '2025-07-08'),
(29, 1, '2025-08-08'),
(30, 1, '2025-09-08'),
(31, 1, '2025-10-08'),
(32, 1, '2025-11-08'),
(33, 1, '2025-12-08'),
(34, 1, '2026-01-08'),
(35, 1, '2026-02-08'),
(36, 1, '2026-03-08'),
(37, 1, '2026-04-08'),
(38, 1, '2026-05-08'),
(39, 1, '2026-06-08'),
(40, 1, '2026-07-08'),
(41, 1, '2026-08-08'),
(42, 1, '2026-09-08'),
(43, 1, '2026-10-08'),
(44, 1, '2026-11-08'),
(45, 1, '2026-12-08'),
(46, 1, '2027-01-08'),
(47, 1, '2027-02-08'),
(48, 1, '2027-03-08'),
(49, 1, '2027-04-08'),
(50, 1, '2027-05-08'),
(51, 1, '2027-06-08'),
(52, 1, '2027-07-08'),
(53, 1, '2027-08-08'),
(54, 1, '2027-09-08'),
(55, 1, '2027-10-08'),
(56, 1, '2027-11-08'),
(57, 1, '2027-12-08'),
(58, 1, '2028-01-08'),
(59, 1, '2028-02-08'),
(60, 1, '2028-03-08'),
(61, 1, '2028-04-08'),
(62, 1, '2028-05-08'),
(63, 1, '2028-06-08'),
(64, 1, '2028-07-08'),
(65, 1, '2028-08-08'),
(66, 1, '2028-09-08'),
(67, 1, '2028-10-08'),
(68, 1, '2028-11-08'),
(69, 1, '2028-12-08'),
(70, 1, '2029-01-08'),
(71, 1, '2029-02-08'),
(72, 1, '2029-03-08'),
(73, 2, '2023-04-08'),
(74, 2, '2023-05-08'),
(75, 2, '2023-06-08'),
(76, 2, '2023-07-08'),
(77, 2, '2023-08-08'),
(78, 2, '2023-09-08'),
(79, 2, '2023-10-08'),
(80, 2, '2023-11-08'),
(81, 2, '2023-12-08'),
(82, 2, '2024-01-08'),
(83, 2, '2024-02-08'),
(84, 2, '2024-03-08'),
(85, 2, '2024-04-08'),
(86, 2, '2024-05-08'),
(87, 2, '2024-06-08'),
(88, 2, '2024-07-08'),
(89, 2, '2024-08-08'),
(90, 2, '2024-09-08'),
(91, 2, '2024-10-08'),
(92, 2, '2024-11-08'),
(93, 2, '2024-12-08'),
(94, 2, '2025-01-08'),
(95, 2, '2025-02-08'),
(96, 2, '2025-03-08'),
(97, 2, '2025-04-08'),
(98, 2, '2025-05-08'),
(99, 2, '2025-06-08'),
(100, 2, '2025-07-08'),
(101, 2, '2025-08-08'),
(102, 2, '2025-09-08'),
(103, 2, '2025-10-08'),
(104, 2, '2025-11-08'),
(105, 2, '2025-12-08'),
(106, 2, '2026-01-08'),
(107, 2, '2026-02-08'),
(108, 2, '2026-03-08'),
(109, 2, '2026-04-08'),
(110, 2, '2026-05-08'),
(111, 2, '2026-06-08'),
(112, 2, '2026-07-08'),
(113, 2, '2026-08-08'),
(114, 2, '2026-09-08'),
(115, 2, '2026-10-08'),
(116, 2, '2026-11-08'),
(117, 2, '2026-12-08'),
(118, 2, '2027-01-08'),
(119, 2, '2027-02-08'),
(120, 2, '2027-03-08'),
(121, 2, '2027-04-08'),
(122, 2, '2027-05-08'),
(123, 2, '2027-06-08'),
(124, 2, '2027-07-08'),
(125, 2, '2027-08-08'),
(126, 2, '2027-09-08'),
(127, 2, '2027-10-08'),
(128, 2, '2027-11-08'),
(129, 2, '2027-12-08'),
(130, 2, '2028-01-08'),
(131, 2, '2028-02-08'),
(132, 2, '2028-03-08'),
(133, 2, '2028-04-08'),
(134, 2, '2028-05-08'),
(135, 2, '2028-06-08'),
(136, 2, '2028-07-08'),
(137, 2, '2028-08-08'),
(138, 2, '2028-09-08'),
(139, 2, '2028-10-08'),
(140, 2, '2028-11-08'),
(141, 2, '2028-12-08'),
(142, 2, '2029-01-08'),
(143, 2, '2029-02-08'),
(144, 2, '2029-03-08'),
(145, 5, '2023-04-10'),
(146, 5, '2023-05-10'),
(147, 5, '2023-06-10'),
(148, 5, '2023-07-10'),
(149, 5, '2023-08-10'),
(150, 5, '2023-09-10'),
(151, 5, '2023-10-10'),
(152, 5, '2023-11-10'),
(153, 5, '2023-12-10'),
(154, 5, '2024-01-10'),
(155, 5, '2024-02-10'),
(156, 5, '2024-03-10'),
(157, 5, '2024-04-10'),
(158, 5, '2024-05-10'),
(159, 5, '2024-06-10'),
(160, 5, '2024-07-10'),
(161, 5, '2024-08-10'),
(162, 5, '2024-09-10'),
(163, 5, '2024-10-10'),
(164, 5, '2024-11-10'),
(165, 5, '2024-12-10'),
(166, 5, '2025-01-10'),
(167, 5, '2025-02-10'),
(168, 5, '2025-03-10'),
(169, 5, '2025-04-10'),
(170, 5, '2025-05-10'),
(171, 5, '2025-06-10'),
(172, 5, '2025-07-10'),
(173, 5, '2025-08-10'),
(174, 5, '2025-09-10'),
(175, 5, '2025-10-10'),
(176, 5, '2025-11-10'),
(177, 5, '2025-12-10'),
(178, 5, '2026-01-10'),
(179, 5, '2026-02-10'),
(180, 5, '2026-03-10'),
(181, 5, '2026-04-10'),
(182, 5, '2026-05-10'),
(183, 5, '2026-06-10'),
(184, 5, '2026-07-10'),
(185, 5, '2026-08-10'),
(186, 5, '2026-09-10'),
(187, 5, '2026-10-10'),
(188, 5, '2026-11-10'),
(189, 5, '2026-12-10'),
(190, 5, '2027-01-10'),
(191, 5, '2027-02-10'),
(192, 5, '2027-03-10'),
(193, 5, '2027-04-10'),
(194, 5, '2027-05-10'),
(195, 5, '2027-06-10'),
(196, 5, '2027-07-10'),
(197, 5, '2027-08-10'),
(198, 5, '2027-09-10'),
(199, 5, '2027-10-10'),
(200, 5, '2027-11-10'),
(201, 5, '2027-12-10'),
(202, 5, '2028-01-10'),
(203, 5, '2028-02-10'),
(204, 5, '2028-03-10'),
(205, 5, '2028-04-10'),
(206, 5, '2028-05-10'),
(207, 5, '2028-06-10'),
(208, 5, '2028-07-10'),
(209, 5, '2028-08-10'),
(210, 5, '2028-09-10'),
(211, 5, '2028-10-10'),
(212, 5, '2028-11-10'),
(213, 5, '2028-12-10'),
(214, 5, '2029-01-10'),
(215, 5, '2029-02-10'),
(216, 5, '2029-03-10'),
(217, 7, '2023-04-10'),
(218, 7, '2023-05-10'),
(219, 7, '2023-06-10'),
(220, 7, '2023-07-10'),
(221, 7, '2023-08-10'),
(222, 7, '2023-09-10'),
(223, 7, '2023-10-10'),
(224, 7, '2023-11-10'),
(225, 7, '2023-12-10'),
(226, 7, '2024-01-10'),
(227, 7, '2024-02-10'),
(228, 7, '2024-03-10'),
(229, 7, '2024-04-10'),
(230, 7, '2024-05-10'),
(231, 7, '2024-06-10'),
(232, 7, '2024-07-10'),
(233, 7, '2024-08-10'),
(234, 7, '2024-09-10'),
(235, 7, '2024-10-10'),
(236, 7, '2024-11-10'),
(237, 7, '2024-12-10'),
(238, 7, '2025-01-10'),
(239, 7, '2025-02-10'),
(240, 7, '2025-03-10'),
(241, 7, '2025-04-10'),
(242, 7, '2025-05-10'),
(243, 7, '2025-06-10'),
(244, 7, '2025-07-10'),
(245, 7, '2025-08-10'),
(246, 7, '2025-09-10'),
(247, 7, '2025-10-10'),
(248, 7, '2025-11-10'),
(249, 7, '2025-12-10'),
(250, 7, '2026-01-10'),
(251, 7, '2026-02-10'),
(252, 7, '2026-03-10'),
(253, 7, '2026-04-10'),
(254, 7, '2026-05-10'),
(255, 7, '2026-06-10'),
(256, 7, '2026-07-10'),
(257, 7, '2026-08-10'),
(258, 7, '2026-09-10'),
(259, 7, '2026-10-10'),
(260, 7, '2026-11-10'),
(261, 7, '2026-12-10'),
(262, 7, '2027-01-10'),
(263, 7, '2027-02-10'),
(264, 7, '2027-03-10'),
(265, 7, '2027-04-10'),
(266, 7, '2027-05-10'),
(267, 7, '2027-06-10'),
(268, 7, '2027-07-10'),
(269, 7, '2027-08-10'),
(270, 7, '2027-09-10'),
(271, 7, '2027-10-10'),
(272, 7, '2027-11-10'),
(273, 7, '2027-12-10'),
(274, 7, '2028-01-10'),
(275, 7, '2028-02-10'),
(276, 7, '2028-03-10'),
(277, 7, '2028-04-10'),
(278, 7, '2028-05-10'),
(279, 7, '2028-06-10'),
(280, 7, '2028-07-10'),
(281, 7, '2028-08-10'),
(282, 7, '2028-09-10'),
(283, 7, '2028-10-10'),
(284, 7, '2028-11-10'),
(285, 7, '2028-12-10'),
(286, 7, '2029-01-10'),
(287, 7, '2029-02-10'),
(288, 7, '2029-03-10');

-- --------------------------------------------------------

--
-- Table structure for table `loan_types`
--

CREATE TABLE `loan_types` (
  `id` int(30) NOT NULL,
  `type_name` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan_types`
--

INSERT INTO `loan_types` (`id`, `type_name`, `description`) VALUES
(1, 'Small Business', 'Small Business Loans'),
(2, 'Mortgages', 'Mortgages'),
(3, 'Personal Loans', 'Personal Loans'),
(4, 'Gold Loan', 'Loan by taking gold as Mortgage'),
(5, 'Short Term', 'Short Term');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(30) NOT NULL,
  `loan_id` int(30) NOT NULL,
  `payee` text NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `penalty_amount` float NOT NULL DEFAULT 0,
  `overdue` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=no , 1 = yes',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `loan_id`, `payee`, `amount`, `penalty_amount`, `overdue`, `date_created`) VALUES
(41, 7, '', 1120, 0, 0, '2023-03-10 08:16:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `doctor_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `doctor_id`, `name`, `address`, `contact`, `username`, `password`, `type`) VALUES
(1, 0, 'Administrator', 'kenya', '', 'umeskia', 'umeskia', 1),
(2, 0, 'ALVIN KIVEU', '', '', 'Alvo@46', 'alvinnivla', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrowers`
--
ALTER TABLE `borrowers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_list`
--
ALTER TABLE `loan_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_plan`
--
ALTER TABLE `loan_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_schedules`
--
ALTER TABLE `loan_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_types`
--
ALTER TABLE `loan_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `borrowers`
--
ALTER TABLE `borrowers`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `loan_list`
--
ALTER TABLE `loan_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `loan_plan`
--
ALTER TABLE `loan_plan`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `loan_schedules`
--
ALTER TABLE `loan_schedules`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=289;

--
-- AUTO_INCREMENT for table `loan_types`
--
ALTER TABLE `loan_types`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
