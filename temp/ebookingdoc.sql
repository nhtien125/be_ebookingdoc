-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2025 at 09:01 AM
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
-- Database: `ebookingdoc`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `uuid` char(32) NOT NULL,
  `doctor_id` char(32) DEFAULT NULL,
  `patient_id` char(32) DEFAULT NULL,
  `clinic_id` char(32) DEFAULT NULL,
  `schedule_id` char(32) DEFAULT NULL,
  `package_id` char(32) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clinics`
--

CREATE TABLE `clinics` (
  `uuid` char(32) NOT NULL,
  `name` varchar(75) DEFAULT NULL,
  `address` varchar(75) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `uuid` char(32) NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  `doctor_type` tinyint(1) DEFAULT NULL,
  `specialization_id` char(32) DEFAULT NULL,
  `license` varchar(32) DEFAULT NULL,
  `introduce` varchar(2000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medical_records`
--

CREATE TABLE `medical_records` (
  `uuid` char(32) NOT NULL,
  `patient_id` char(32) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `uuid` char(32) NOT NULL,
  `doctor_id` varchar(75) DEFAULT NULL,
  `title` varchar(75) DEFAULT NULL,
  `content` varchar(75) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `uuid` char(32) NOT NULL,
  `name` varchar(75) DEFAULT NULL,
  `specialization_id` char(32) DEFAULT NULL,
  `introduce` varchar(500) DEFAULT NULL,
  `price` varchar(8) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `uuid` char(32) NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  `medical_record_id` char(32) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `premission`
--

CREATE TABLE `premission` (
  `uuid` tinyint(1) NOT NULL,
  `name` varchar(75) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `uuid` char(32) NOT NULL,
  `medical_record_id` char(32) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `diagnosis` varchar(500) DEFAULT NULL,
  `prescription` varchar(500) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `uuid` char(32) NOT NULL,
  `doctor_id` char(32) DEFAULT NULL,
  `patient_id` char(32) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `uuid` char(32) NOT NULL,
  `doctor_id` char(32) DEFAULT NULL,
  `clinic_id` char(32) DEFAULT NULL,
  `start_time` char(32) DEFAULT NULL,
  `end_time` char(32) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `specializations`
--

CREATE TABLE `specializations` (
  `uuid` char(32) NOT NULL,
  `name` varchar(75) DEFAULT NULL,
  `address` varchar(75) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `uuid` char(32) NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  `access_token` char(181) DEFAULT NULL,
  `refresh_token` char(181) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uuid` char(32) NOT NULL,
  `premission_id` tinyint(1) DEFAULT NULL,
  `doctor_id` char(32) DEFAULT NULL,
  `patient_id` char(32) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `address` varchar(75) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(75) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `cb` (`doctor_id`),
  ADD KEY `clinic_id` (`clinic_id`),
  ADD KEY `ac` (`package_id`),
  ADD KEY `gh` (`patient_id`),
  ADD KEY `hh` (`schedule_id`);

--
-- Indexes for table `clinics`
--
ALTER TABLE `clinics`
  ADD PRIMARY KEY (`uuid`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `a` (`user_id`),
  ADD KEY `aa` (`specialization_id`);

--
-- Indexes for table `medical_records`
--
ALTER TABLE `medical_records`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `js` (`patient_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `kk` (`doctor_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `jha` (`specialization_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `hk` (`user_id`),
  ADD KEY `ls` (`medical_record_id`);

--
-- Indexes for table `premission`
--
ALTER TABLE `premission`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `ul` (`medical_record_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `bbb` (`doctor_id`),
  ADD KEY `cds` (`patient_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `cccc` (`clinic_id`),
  ADD KEY `ddd` (`doctor_id`);

--
-- Indexes for table `specializations`
--
ALTER TABLE `specializations`
  ADD PRIMARY KEY (`uuid`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `akkkk` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `hg` (`doctor_id`),
  ADD KEY `lk` (`patient_id`),
  ADD KEY `hd` (`premission_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `ac` FOREIGN KEY (`package_id`) REFERENCES `packages` (`uuid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`clinic_id`) REFERENCES `clinics` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cb` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gh` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hh` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `a` FOREIGN KEY (`user_id`) REFERENCES `user` (`uuid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `aa` FOREIGN KEY (`specialization_id`) REFERENCES `specializations` (`uuid`) ON UPDATE CASCADE;

--
-- Constraints for table `medical_records`
--
ALTER TABLE `medical_records`
  ADD CONSTRAINT `js` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `kk` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`uuid`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `jha` FOREIGN KEY (`specialization_id`) REFERENCES `specializations` (`uuid`) ON UPDATE CASCADE;

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `hk` FOREIGN KEY (`user_id`) REFERENCES `patients` (`uuid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ls` FOREIGN KEY (`medical_record_id`) REFERENCES `patients` (`uuid`) ON UPDATE CASCADE;

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `ul` FOREIGN KEY (`medical_record_id`) REFERENCES `medical_records` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `bbb` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`uuid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `cds` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`uuid`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `cccc` FOREIGN KEY (`clinic_id`) REFERENCES `clinics` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ddd` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `akkkk` FOREIGN KEY (`user_id`) REFERENCES `user` (`uuid`) ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `hd` FOREIGN KEY (`premission_id`) REFERENCES `premission` (`uuid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `hg` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lk` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
