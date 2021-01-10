-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2020 at 10:01 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `management_sewa_perumahan`
--

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `id` int(10) UNSIGNED NOT NULL,
  `house_number` varchar(40) NOT NULL,
  `location` varchar(40) NOT NULL,
  `house_type` varchar(40) NOT NULL,
  `rent` varchar(40) NOT NULL,
  `status` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `houses`
--

INSERT INTO `houses` (`id`, `house_number`, `location`, `house_type`, `rent`, `status`) VALUES
(1, 'A20', 'Jalan Margasatwa', 'elit', '11500', 'di tempati'),
(2, 'A21', 'Jalan Margasatwa', 'elit', '25000', 'di tempati'),
(3, 'A22', 'Jalan Margasatwa', 'elit', '18000', 'di tempati'),
(4, 'B54', 'Jalan Candisari', 'menengah', '10000', 'kosong'),
(5, 'B57', 'Jalan Candisari', 'menengah', '10000', 'kosong'),
(6, 'NB135', 'Jalan Timur Utara', 'apartment', '7500', 'kosong'),
(7, 'NB148', 'Jalan Timur Utara', 'apartment', '7500', 'kosong'),
(8, 'NB136', 'Jalan Timur Utara', 'apartment', '7500', 'kosong');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenant` int(10) UNSIGNED NOT NULL,
  `phone` int(10) UNSIGNED DEFAULT NULL,
  `house` int(10) UNSIGNED DEFAULT NULL,
  `year` varchar(40) NOT NULL,
  `month` varchar(40) NOT NULL,
  `particulars` text NOT NULL,
  `total` varchar(40) NOT NULL,
  `comments` text,
  `status` varchar(40) NOT NULL,
  `field10` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `tenant`, `phone`, `house`, `year`, `month`, `particulars`, `total`, `comments`, `status`, `field10`) VALUES
(1, 1, 1, 1, '2020', 'May', 'rent-11500', '11500', '<br>', 'cash receiced', NULL),
(2, 2, 2, 2, '2020', 'Juni', 'rent-25000<div>deposit-5000</div>', '30000', 'pay deposit first', 'cash receiced', NULL),
(3, 3, 3, 3, '2020', 'Juli', 'house rent 18000', '18000', '<br>', 'new', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `membership_grouppermissions`
--

CREATE TABLE `membership_grouppermissions` (
  `permissionID` int(10) UNSIGNED NOT NULL,
  `groupID` int(11) DEFAULT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint(4) DEFAULT NULL,
  `allowView` tinyint(4) NOT NULL DEFAULT '0',
  `allowEdit` tinyint(4) NOT NULL DEFAULT '0',
  `allowDelete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_grouppermissions`
--

INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES
(1, 2, 'houses', 1, 3, 3, 3),
(2, 2, 'tenants', 1, 3, 3, 3),
(3, 2, 'invoices', 1, 3, 3, 3),
(4, 2, 'payments', 1, 3, 3, 3),
(13, 3, 'houses', 0, 3, 0, 0),
(14, 3, 'tenants', 0, 1, 0, 0),
(15, 3, 'invoices', 0, 1, 0, 0),
(16, 3, 'payments', 0, 1, 0, 0),
(21, 4, 'houses', 1, 3, 1, 1),
(22, 4, 'tenants', 1, 3, 1, 1),
(23, 4, 'invoices', 1, 3, 1, 1),
(24, 4, 'payments', 1, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `membership_groups`
--

CREATE TABLE `membership_groups` (
  `groupID` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `description` text,
  `allowSignup` tinyint(4) DEFAULT NULL,
  `needsApproval` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_groups`
--

INSERT INTO `membership_groups` (`groupID`, `name`, `description`, `allowSignup`, `needsApproval`) VALUES
(1, 'anonymous', 'Anonymous group created automatically on 2018-05-10', 0, 0),
(2, 'Admins', 'Admin group created automatically on 2018-05-10', 0, 1),
(3, 'tenants', 'tenants here', 0, 1),
(4, 'users', 'all test users', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `membership_userpermissions`
--

CREATE TABLE `membership_userpermissions` (
  `permissionID` int(10) UNSIGNED NOT NULL,
  `memberID` varchar(20) NOT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint(4) DEFAULT NULL,
  `allowView` tinyint(4) NOT NULL DEFAULT '0',
  `allowEdit` tinyint(4) NOT NULL DEFAULT '0',
  `allowDelete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `membership_userrecords`
--

CREATE TABLE `membership_userrecords` (
  `recID` bigint(20) UNSIGNED NOT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `pkValue` varchar(255) DEFAULT NULL,
  `memberID` varchar(20) DEFAULT NULL,
  `dateAdded` bigint(20) UNSIGNED DEFAULT NULL,
  `dateUpdated` bigint(20) UNSIGNED DEFAULT NULL,
  `groupID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_userrecords`
--

INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES
(1, 'houses', '1', 'admin', 1525967004, 1525970651, 2),
(2, 'tenants', '1', 'alijahuzi', 1525967170, 1526056194, 3),
(3, 'invoices', '1', 'alijahuzi', 1525967307, 1526147635, 3),
(5, 'payments', '2', 'alijahuzi', 1525969044, 1526056845, 3),
(6, 'houses', '2', 'admin', 1526081667, 1526081746, 2),
(7, 'tenants', '2', 'admin', 1526081759, 1526081759, 2),
(8, 'invoices', '2', 'admin', 1526081858, 1526147664, 2),
(9, 'payments', '3', 'admin', 1526088996, 1526088996, 2),
(10, 'houses', '3', 'admin', 1526089077, 1526089406, 2),
(11, 'tenants', '3', 'admin', 1526089430, 1526089450, 2),
(12, 'invoices', '3', 'admin', 1526089653, 1526147690, 2),
(13, 'houses', '4', 'harry', 1532236592, 1532236592, 4),
(14, 'houses', '5', 'harry', 1537193426, 1537193426, 4);

-- --------------------------------------------------------

--
-- Table structure for table `membership_users`
--

CREATE TABLE `membership_users` (
  `memberID` varchar(20) NOT NULL,
  `passMD5` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `signupDate` date DEFAULT NULL,
  `groupID` int(10) UNSIGNED DEFAULT NULL,
  `isBanned` tinyint(4) DEFAULT NULL,
  `isApproved` tinyint(4) DEFAULT NULL,
  `custom1` text,
  `custom2` text,
  `custom3` text,
  `custom4` text,
  `comments` text,
  `pass_reset_key` varchar(100) DEFAULT NULL,
  `pass_reset_expiry` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_users`
--

INSERT INTO `membership_users` (`memberID`, `passMD5`, `email`, `signupDate`, `groupID`, `isBanned`, `isApproved`, `custom1`, `custom2`, `custom3`, `custom4`, `comments`, `pass_reset_key`, `pass_reset_expiry`) VALUES
('admin', 'admin', 'admin@admin.com', '2018-05-10', 2, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2018-05-10\nRecord updated automatically on 2018-05-10\nRecord updated automatically on 2018-05-12\nRecord updated automatically on 2018-05-13', NULL, NULL),
('alijahuzi', '827ccb0eea8a706c4c34a16891f84e7b', 'ali@gmail.com', '2018-05-10', 3, 0, 1, '', '', '', '', 'member signed up through the registration form.', NULL, NULL),
('brandy', '6c29e9cc4042d972b15ff0304e636886', 'brandy@gmail.com', '2018-05-13', 4, 0, 1, '', '', '', '', 'member signed up through the registration form.', NULL, NULL),
('guest', NULL, NULL, '2018-05-10', 1, 0, 1, NULL, NULL, NULL, NULL, 'Anonymous member created automatically on 2018-05-10', NULL, NULL),
('harry', 'd3915844cde56f2dccfd24c7d34d12f0', 'harry@den.com', '2018-05-18', 4, 0, 1, '', '', '', '', 'member signed up through the registration form.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenant` int(10) UNSIGNED NOT NULL,
  `house` int(10) UNSIGNED DEFAULT NULL,
  `year` int(10) UNSIGNED DEFAULT NULL,
  `month` int(10) UNSIGNED DEFAULT NULL,
  `expected_amount` int(10) UNSIGNED DEFAULT NULL,
  `paid_amount` varchar(40) NOT NULL,
  `balance` varchar(40) DEFAULT NULL,
  `date` date NOT NULL,
  `comments` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `tenant`, `house`, `year`, `month`, `expected_amount`, `paid_amount`, `balance`, `date`, `comments`) VALUES
(2, 1, 1, 1, 1, 1, '11500', '0', '2020-05-11', '<br>'),
(3, 2, 2, 2, 2, 2, '10000', '20000', '2020-06-11', '<br>'),
(4, 3, 3, 3, 3, 3, '0', '18000', '2020-07-11', '<br>');

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `id` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(40) NOT NULL,
  `gender` varchar(40) NOT NULL,
  `national_id` varchar(40) NOT NULL,
  `phone_number` varchar(40) NOT NULL,
  `email` varchar(80) DEFAULT NULL,
  `registration_date` date NOT NULL,
  `house` int(10) UNSIGNED NOT NULL,
  `status` varchar(40) NOT NULL,
  `exit_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`id`, `fullname`, `gender`, `national_id`, `phone_number`, `email`, `registration_date`, `house`, `status`, `exit_date`) VALUES
(1, 'anwar mohammad', 'male', '33516718291', '08712345678', 'anwarmoha@gmail.com', '2020-05-11', 1, 'lunas', NULL),
(2, 'ali anwar', 'male', '123456789098', '08798765432', 'ali@gmail.com', '2020-06-11', 2, 'belum lunas', NULL),
(3, 'kenand anwar', 'male', '22368128191', '08727817507', 'kenand@gmail.com', '2020-07-11', 3, 'belum lunas', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tenant` (`tenant`);

--
-- Indexes for table `membership_grouppermissions`
--
ALTER TABLE `membership_grouppermissions`
  ADD PRIMARY KEY (`permissionID`);

--
-- Indexes for table `membership_groups`
--
ALTER TABLE `membership_groups`
  ADD PRIMARY KEY (`groupID`);

--
-- Indexes for table `membership_userpermissions`
--
ALTER TABLE `membership_userpermissions`
  ADD PRIMARY KEY (`permissionID`);

--
-- Indexes for table `membership_userrecords`
--
ALTER TABLE `membership_userrecords`
  ADD PRIMARY KEY (`recID`),
  ADD UNIQUE KEY `tableName_pkValue` (`tableName`,`pkValue`),
  ADD KEY `pkValue` (`pkValue`),
  ADD KEY `tableName` (`tableName`),
  ADD KEY `memberID` (`memberID`),
  ADD KEY `groupID` (`groupID`);

--
-- Indexes for table `membership_users`
--
ALTER TABLE `membership_users`
  ADD PRIMARY KEY (`memberID`),
  ADD KEY `groupID` (`groupID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tenant` (`tenant`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `house` (`house`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `membership_grouppermissions`
--
ALTER TABLE `membership_grouppermissions`
  MODIFY `permissionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `membership_groups`
--
ALTER TABLE `membership_groups`
  MODIFY `groupID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `membership_userpermissions`
--
ALTER TABLE `membership_userpermissions`
  MODIFY `permissionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `membership_userrecords`
--
ALTER TABLE `membership_userrecords`
  MODIFY `recID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
