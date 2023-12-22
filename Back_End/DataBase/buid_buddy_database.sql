-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2023 at 11:10 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buid_buddy_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `phone`, `password`) VALUES
(7, 'admin', 'admin@gmail.com', '1234567891', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`) VALUES
(1, 'kasaragod'),
(2, 'kannur'),
(3, 'kozhikkod');

-- --------------------------------------------------------

--
-- Table structure for table `contractors_reg2`
--

CREATE TABLE `contractors_reg2` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `report_status` varchar(255) NOT NULL,
  `place` varchar(255) NOT NULL,
  `experience` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contractors_reg2`
--

INSERT INTO `contractors_reg2` (`id`, `username`, `email`, `phone`, `password`, `report_status`, `place`, `experience`, `image`) VALUES
(8, 'contracter1', 'contr1@gmail.com', '9856895689', 'cont1', '', 'kannur', '2 years', 'http://192.168.29.64/Build_buddy_Php_files/Contracters/image_uploaded/member1.jpg'),
(9, 'c2', 'c2@gmail.com', '8956895869', 'c2', 'No', 'kannur', '2', 'http://192.168.29.64/Build_buddy_Php_files/Contracters/image_uploaded/member1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `contract_worker`
--

CREATE TABLE `contract_worker` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `place` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `work` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_rating`
--

CREATE TABLE `customer_rating` (
  `id` int(255) NOT NULL,
  `rating_value` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_rating`
--

INSERT INTO `customer_rating` (`id`, `rating_value`, `username`) VALUES
(6, '1.5', 'User'),
(8, '4.0', 'User1'),
(9, '2.0', 'User1');

-- --------------------------------------------------------

--
-- Table structure for table `paymentt`
--

CREATE TABLE `paymentt` (
  `id` int(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `phone_no` varchar(255) NOT NULL,
  `account_no` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `reciever_name` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paymentt`
--

INSERT INTO `paymentt` (`id`, `customer_name`, `email_id`, `phone_no`, `account_no`, `amount`, `reciever_name`, `bank_name`) VALUES
(10, 'User', 'User@gmail.com', '66', '666', '2008', 'contracter1', 'gu');

-- --------------------------------------------------------

--
-- Table structure for table `plots`
--

CREATE TABLE `plots` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `place` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plots`
--

INSERT INTO `plots` (`id`, `username`, `email`, `phone`, `place`, `amount`, `area`, `description`, `image`) VALUES
(1, 'real1', 'real1@gmail.com', '96325', 'kannur', '200000', 'lll', 'hYsgyahsg', 'http://192.168.29.64/Build_buddy_Php_files/Contracters/image_uploaded/real_entrance.png'),
(6, 'gh', 'ty', '55', 'vb', 'gh', 'ghj', 'vtcbkjkv uikkng', 'http://192.168.29.64/Build_buddy_Php_files/Real_Estaters/image_uploaded/IMG_20231210_181335.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `real_estaters`
--

CREATE TABLE `real_estaters` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `report_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `real_estaters`
--

INSERT INTO `real_estaters` (`id`, `username`, `email`, `phone`, `password`, `report_status`) VALUES
(11, 'real', 'real@gmail.com', '9652387041', 'real', 'No'),
(12, 'abc', 'abc@gmail.com', '9086325478', 'abc', 'No'),
(13, 'abcd', 'abc@gmail.com ', '85425636523', 'abcd', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `send_data_demo`
--

CREATE TABLE `send_data_demo` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `send_data_demo`
--

INSERT INTO `send_data_demo` (`id`, `name`, `age`) VALUES
(10, 'chinmaya', '60'),
(11, 'ff', 'ff');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`) VALUES
(1, 'kerala'),
(2, 'tamil nadu'),
(3, 'karnataka');

-- --------------------------------------------------------

--
-- Table structure for table `taluk`
--

CREATE TABLE `taluk` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `taluk`
--

INSERT INTO `taluk` (`id`, `name`) VALUES
(1, 'abc'),
(2, 'acdf'),
(3, 'ee');

-- --------------------------------------------------------

--
-- Table structure for table `userr_review`
--

CREATE TABLE `userr_review` (
  `id` int(255) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userr_review`
--

INSERT INTO `userr_review` (`id`, `comments`, `username`) VALUES
(3, 'gjjk', 'User');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `phone`, `password`) VALUES
(3, 'User', 'User@gmail.com', '09090898909', 'User'),
(4, 'User1', 'user1@gmail.com', '9856369636', 'user1');

-- --------------------------------------------------------

--
-- Table structure for table `user_requirement`
--

CREATE TABLE `user_requirement` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `place` varchar(255) NOT NULL,
  `work` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_requirement`
--

INSERT INTO `user_requirement` (`id`, `name`, `place`, `work`, `category`, `image`) VALUES
(6, 'User', 'kasaragod', 'fhbb', 'Contracters', 'http://192.168.29.39/Build_buddy_Php_files/Users/image_uploadedmember2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `workers`
--

CREATE TABLE `workers` (
  `id` int(255) NOT NULL,
  `username` text NOT NULL,
  `age` text NOT NULL,
  `place` varchar(255) NOT NULL,
  `experience` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `related_contracter` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `workers`
--

INSERT INTO `workers` (`id`, `username`, `age`, `place`, `experience`, `phone`, `email`, `description`, `related_contracter`) VALUES
(10, 'worker1', '30', 'kasaragod', '2 years', '0987654321', 'worker1@gmail.com', 'painting work', 'contracter1'),
(11, 'worker2', '35', 'kannur', '1', '9809890989', 'worker2@gmail.com', 'plumbing', 'c2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contractors_reg2`
--
ALTER TABLE `contractors_reg2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_worker`
--
ALTER TABLE `contract_worker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_rating`
--
ALTER TABLE `customer_rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paymentt`
--
ALTER TABLE `paymentt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plots`
--
ALTER TABLE `plots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `real_estaters`
--
ALTER TABLE `real_estaters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `send_data_demo`
--
ALTER TABLE `send_data_demo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taluk`
--
ALTER TABLE `taluk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userr_review`
--
ALTER TABLE `userr_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_requirement`
--
ALTER TABLE `user_requirement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contractors_reg2`
--
ALTER TABLE `contractors_reg2`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `contract_worker`
--
ALTER TABLE `contract_worker`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `customer_rating`
--
ALTER TABLE `customer_rating`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `paymentt`
--
ALTER TABLE `paymentt`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `plots`
--
ALTER TABLE `plots`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `real_estaters`
--
ALTER TABLE `real_estaters`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `send_data_demo`
--
ALTER TABLE `send_data_demo`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `taluk`
--
ALTER TABLE `taluk`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userr_review`
--
ALTER TABLE `userr_review`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_requirement`
--
ALTER TABLE `user_requirement`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `workers`
--
ALTER TABLE `workers`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
