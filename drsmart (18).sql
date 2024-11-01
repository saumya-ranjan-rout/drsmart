-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 21, 2024 at 07:56 AM
-- Server version: 8.0.39-0ubuntu0.24.04.2
-- PHP Version: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `drsmart`
--

-- --------------------------------------------------------

--
-- Table structure for table `ambulance_call`
--

CREATE TABLE `ambulance_call` (
  `id` int NOT NULL,
  `bill_no` varchar(200) NOT NULL,
  `patient_name` varchar(50) DEFAULT NULL,
  `contact_no` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `vehicle_no` varchar(20) DEFAULT NULL,
  `vehicle_model` varchar(20) DEFAULT NULL,
  `driver` varchar(100) NOT NULL,
  `charge_category` varchar(255) NOT NULL,
  `standard_charge` decimal(15,2) NOT NULL,
  `discount_per` decimal(15,2) NOT NULL,
  `discount_amount` decimal(15,2) NOT NULL,
  `tax_per` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `payment_mode` varchar(255) NOT NULL,
  `paid_amount` decimal(15,2) NOT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int NOT NULL,
  `first_transc_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ambulance_call`
--

INSERT INTO `ambulance_call` (`id`, `bill_no`, `patient_name`, `contact_no`, `address`, `vehicle_no`, `vehicle_model`, `driver`, `charge_category`, `standard_charge`, `discount_per`, `discount_amount`, `tax_per`, `tax_amount`, `payment_mode`, `paid_amount`, `amount`, `date`, `created_at`, `generated_by`, `first_transc_id`) VALUES
(1, 'ACB1', '70', NULL, NULL, '4', NULL, 'Murtaisim', 'ERS/Patient Transport Service', 120.00, 0.00, 0.00, 0.00, 0.00, 'Cash', 120.00, 120.00, '2024-09-23 18:11:00', '2024-09-23 12:41:22', 1, 1),
(2, 'ACB2', '70', NULL, NULL, '4', NULL, 'Murtaisim', 'ERS/Patient Transport Service', 120.00, 1.00, 1.20, 1.00, 1.19, 'Cash', 100.00, 119.99, '2024-09-24 11:17:00', '2024-09-25 05:47:33', 1, 2),
(3, 'ACB3', '70', NULL, NULL, '2', NULL, 'Junaid', 'ERS/Patient Transport Service', 120.00, 0.00, 0.00, 0.00, 0.00, 'Cash', 100.00, 120.00, '2024-09-15 15:44:00', '2024-09-25 10:15:01', 1, 3),
(4, 'ACB4', '74', NULL, NULL, '2', NULL, 'Junaid', 'Private Ambulance	', 150.00, 0.00, 0.00, 0.00, 0.00, 'Cash', 100.00, 150.00, '2024-09-24 15:45:00', '2024-09-25 10:15:53', 1, 4),
(5, 'ACB5', '74', NULL, NULL, '4', NULL, 'Murtaisim', 'ERS/Patient Transport Service', 120.00, 0.00, 0.00, 0.00, 0.00, 'Cash', 100.00, 120.00, '2024-09-16 15:54:00', '2024-09-25 10:25:00', 1, 5),
(6, 'ACB6', '75', NULL, NULL, '4', NULL, 'Murtaisim', 'Private Ambulance	', 150.00, 0.00, 0.00, 0.00, 0.00, 'Cheque', 100.00, 150.00, '2024-09-05 15:08:00', '2024-09-26 09:39:09', 1, 6),
(7, 'ACB7', '76', NULL, NULL, '4', NULL, 'Murtaisim', 'Private Ambulance	', 150.00, 0.00, 0.00, 0.00, 0.00, 'Cash', 130.00, 150.00, '2024-10-03 17:45:00', '2024-10-04 12:15:49', 1, 8),
(8, 'ACB8', '76', NULL, NULL, '4', NULL, 'Murtaisim', 'ERS/Patient Transport Service', 100.00, 15.00, 15.00, 10.00, 8.50, 'Cash', 10.00, 108.50, '2024-10-04 18:07:00', '2024-10-04 12:37:33', 1, 10),
(9, 'ACB9', '41', NULL, NULL, '2', NULL, 'Junaid', 'Private Ambulance	', 1500.00, 10.00, 150.00, 10.00, 135.00, 'Cash', 485.00, 1485.00, '2024-10-14 10:58:00', '2024-10-14 05:33:24', 1, 12),
(10, 'ACB10', '95', NULL, NULL, '4', NULL, 'Murtaisim', 'ERS/Patient Transport Service', 120.00, 0.00, 0.00, 0.00, 0.00, 'Cash', 120.00, 120.00, '2024-10-15 10:52:00', '2024-10-15 05:22:30', 1, 13),
(11, 'ACB11', '95', NULL, NULL, '4', NULL, 'Murtaisim', 'ERS/Patient Transport Service', 100.00, 10.00, 10.00, 10.00, 9.00, 'Cash', 80.00, 99.00, '2024-10-08 13:30:00', '2024-10-15 08:01:37', 1, 14),
(12, 'ACB12', '90', NULL, NULL, '2', NULL, 'Junaid', 'ERS/Patient Transport Service', 100.00, 10.00, 10.00, 50.00, 45.00, 'Cash', 35.00, 135.00, '2024-10-15 17:35:00', '2024-10-15 12:07:05', 1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `ambulance_payment`
--

CREATE TABLE `ambulance_payment` (
  `id` int NOT NULL,
  `ambulance_call_id` int NOT NULL,
  `trans_number` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `date` datetime NOT NULL,
  `mood` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `cheque_no` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `cheque_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ambulance_payment`
--

INSERT INTO `ambulance_payment` (`id`, `ambulance_call_id`, `trans_number`, `date`, `mood`, `amount`, `cheque_no`, `cheque_date`, `document`) VALUES
(1, 1, 'TRANS95282', '2024-09-23 18:11:00', 'Cash', 120.00, '', '2024-09-23 18:11:22', ''),
(2, 2, 'TRANS43253', '2024-09-24 11:17:00', 'Cash', 100.00, '', '2024-09-25 11:17:33', ''),
(3, 3, 'TRANS59301', '2024-09-15 15:44:00', 'Cash', 100.00, '', '2024-09-25 15:45:01', ''),
(4, 4, 'TRANS59353', '2024-09-24 15:45:00', 'Cash', 100.00, '', '2024-09-25 15:45:53', ''),
(5, 5, 'TRANS59900', '2024-09-16 15:54:00', 'Cash', 100.00, '', '2024-09-25 15:55:00', ''),
(6, 6, 'TRANS43549', '2024-09-05 15:08:00', 'Cheque', 100.00, '12', '2024-09-25 15:08:00', '2012243361_ambulance.jpg'),
(7, 4, 'TRANS43969', '2024-09-16 15:13:00', 'Cheque', 50.00, '12', '2024-09-04 00:00:00', '1235335646_ambulance.jpg'),
(8, 7, 'TRANS44149', '2024-10-03 17:45:00', 'Cash', 130.00, '', '2024-10-04 17:45:49', ''),
(9, 7, 'TRANS44201', '2024-10-01 17:46:00', 'Cash', 20.00, '', '2024-10-04 17:46:41', ''),
(10, 8, 'TRANS45453', '2024-10-04 18:07:00', 'Cash', 10.00, '', '2024-10-04 18:07:33', ''),
(11, 8, 'TRANS26186', '2024-10-04 16:33:00', 'Cash', 75.00, '', '2024-10-05 16:33:06', ''),
(12, 9, 'TRANS84004', '2024-10-14 10:58:00', 'Cash', 485.00, '', '2024-10-02 11:02:00', ''),
(13, 10, 'TRANS69750', '2024-10-15 10:52:00', 'Cash', 120.00, '', '2024-10-15 10:52:30', ''),
(14, 11, 'TRANS79297', '2024-10-08 13:30:00', 'Cash', 80.00, '', '2024-10-15 13:31:37', ''),
(15, 12, 'TRANS94025', '2024-10-15 17:35:00', 'Cash', 35.00, '', '2024-10-15 17:37:05', ''),
(16, 12, 'TRANS95179', '2024-10-09 17:56:00', 'Cash', 100.00, '', '2024-10-15 17:56:19', '');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `appointment_no` varchar(100) NOT NULL,
  `date` datetime DEFAULT NULL,
  `patient_name` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobileno` varchar(50) DEFAULT NULL,
  `doctor` varchar(50) DEFAULT NULL,
  `doctor_fee` int NOT NULL,
  `amount` varchar(200) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `appointment_status` varchar(11) DEFAULT NULL,
  `source` varchar(100) NOT NULL,
  `appointpriority` int NOT NULL,
  `collected_by` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_opd` varchar(200) NOT NULL,
  `is_ipd` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `patient_name`, `gender`, `email`, `mobileno`, `doctor`, `doctor_fee`, `amount`, `message`, `appointment_status`, `source`, `appointpriority`, `collected_by`, `created_at`, `is_opd`, `is_ipd`) VALUES
(3, 69, 'APPNO1', '2024-09-21 11:37:00', 'Haldar Shaikh', 'Male', '', '+9656776488', '6', 0, '', '', 'approved', 'Offline', 0, 0, '2024-09-21 06:07:34', '', 'yes'),
(4, 70, 'APPNO4', '2024-09-20 15:19:00', 'Ahmad Mohammed Al-Jundi', 'Male', 'ahmad.aljundi@gmail.com', '+9658000123', '3', 0, '', '', 'approved', 'Offline', 0, 0, '2024-09-23 09:52:06', 'yes', ''),
(5, 63, 'APPNO5', '2024-09-23 18:12:00', 'madhusudan', 'Male', 'madhusudan@gmail.com', '+9657623650', '5', 0, '', '', 'approved', 'Offline', 0, 0, '2024-09-23 12:42:18', '', ''),
(6, 69, 'APPNO6', '2024-09-24 13:16:00', 'Haldar Shaikh', 'Male', '', '+9656776488', '3', 0, '', 'ok', 'approved', 'Offline', 3, 0, '2024-09-24 07:46:58', '', ''),
(7, 70, 'APPNO7', '2024-09-24 17:11:00', 'Ahmad Mohammed Al-Jundi', 'Male', 'ahmad.aljundi@gmail.com', '+9658000123', '4', 500, '', 'ok', 'approved', 'Offline', 2, 0, '2024-09-24 11:42:07', '', ''),
(8, 75, 'APPNO8', '2024-09-27 11:48:00', 'Saumya', 'Male', '', '+9656767167', '3', 600, '', '', 'approved', 'Offline', 2, 0, '2024-09-25 06:20:38', 'yes', ''),
(9, 74, '', '2024-09-25 15:45:00', 'Noor Al Hussein', 'Female', 'noor.hussein@gmail.com', '+9658787899', '5', 900, '', 'ok', 'pending', 'Offline', 2, 1, '2024-09-26 10:15:31', '', ''),
(10, 94, 'APPNO10', '2024-09-26 15:46:00', 'rahul rout', 'Male', 'rahul@gmail.com', '+9657894560', '3', 600, '', 'ok', 'approved', 'Offline', 2, 1, '2024-09-26 10:17:09', 'yes', ''),
(11, 76, 'APPNO11', '2024-10-02 11:29:00', 'Mastani', 'Male', 'mastani@gmail.com', '+9657654543', '4', 500, '', '', 'approved', 'Offline', 0, 1, '2024-10-05 05:59:22', 'yes', 'yes'),
(12, 76, 'APPNO12', '2024-10-09 11:33:00', 'Mastani', 'Male', 'mastani@gmail.com', '+9657654543', '3', 600, '', '', 'approved', 'Offline', 0, 1, '2024-10-05 06:03:50', 'yes', ''),
(13, 76, 'APPNO13', '2024-10-10 11:34:00', 'Mastani', 'Male', 'mastani@gmail.com', '+9657654543', '4', 500, '', '', 'approved', 'Offline', 0, 1, '2024-10-05 06:04:48', 'yes', 'yes'),
(14, 95, 'APPNO14', '2024-09-30 09:57:00', 'Zaid Musa', 'Male', 'zaid.mussa@gmail.com', '+9656673678', '6', 1000, '', 'Emergency case', 'approved', 'Offline', 3, 1, '2024-10-15 04:28:41', 'yes', '');

-- --------------------------------------------------------

--
-- Table structure for table `appointpriority`
--

CREATE TABLE `appointpriority` (
  `id` int NOT NULL,
  `appointpriority` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointpriority`
--

INSERT INTO `appointpriority` (`id`, `appointpriority`) VALUES
(2, 'Normal'),
(3, 'Urgent');

-- --------------------------------------------------------

--
-- Table structure for table `bed`
--

CREATE TABLE `bed` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `bed_type_id` int NOT NULL,
  `bed_group_id` int NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `bed`
--

INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES
(1, 'GF - 101', 1, 1, 'yes'),
(2, 'TF - 102', 2, 2, 'yes'),
(3, 'TF - 103', 3, 2, 'no'),
(4, 'TF - 104', 1, 2, 'yes'),
(5, 'SF - 105', 1, 4, 'yes'),
(6, 'TF - 106', 2, 3, 'yes'),
(7, 'TF - 107', 2, 2, 'yes'),
(8, 'GF - 108', 1, 1, 'yes'),
(9, 'GF - 109', 2, 1, 'no'),
(10, 'TF - 110', 3, 3, 'yes'),
(11, 'FF - 111', 3, 6, 'yes'),
(12, 'SF - 112', 3, 5, 'no'),
(13, 'SF - 113', 1, 5, 'no'),
(14, 'FF - 114', 1, 7, 'yes'),
(15, 'FF - 115', 1, 6, 'yes'),
(16, 'FF - 116', 1, 6, 'yes'),
(17, 'FF - 117', 1, 6, 'yes'),
(18, 'GF - 118', 2, 1, 'no'),
(19, 'GF - 119', 2, 1, 'yes'),
(20, 'GF - 120', 2, 1, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `bed_group`
--

CREATE TABLE `bed_group` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `floor` varchar(100) NOT NULL,
  `is_active` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `bed_group`
--

INSERT INTO `bed_group` (`id`, `name`, `description`, `floor`, `is_active`) VALUES
(1, 'VIP Ward', 'A palliative or hospice unit is where end-of-life care is provided if you have a life-limiting illness, which may or may not be cancer-related. Hospice and palliative care focus on providing comfort a', '5', 0),
(2, 'Private Ward', 'The operating room (OR) is where both inpatient and outpatient surgeries are performed.\r\n', '3', 0),
(3, 'General Ward Male', 'The general ward of a hospital is a shared patient care area where multiple patients receive medical treatment and monitoring, typically used for non-critical cases requiring hospitalization.', '3', 0),
(4, 'ICU', 'The intensive care unit (ICU) is where you\'re sent if you require close monitoring. The ICU is also referred to as a critical care unit.2﻿ Nurses in the ICU typically have just one or two patients, so', '2', 0),
(5, 'NICU', 'The NICU may be either the neurological intensive care unit or the neonatal intensive care unit, depending on whether the facility treats adults or children. In some facilities, the neurological ICU i', '2', 0),
(6, 'AC (Normal)', 'An AC normal room in a hospital provides a private, air-conditioned space for patients, offering more comfort and privacy compared to general wards, suitable for non-critical care.', '1', 0),
(7, 'Non AC', 'A non-AC normal room in a hospital is a private space for patients that offers privacy and essential medical care without air conditioning, suitable for non-critical cases.', '4', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bed_type`
--

CREATE TABLE `bed_type` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `bed_type`
--

INSERT INTO `bed_type` (`id`, `name`) VALUES
(1, 'Standard'),
(2, 'VIP'),
(3, 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `birth_report`
--

CREATE TABLE `birth_report` (
  `id` int NOT NULL,
  `ref_no` varchar(200) NOT NULL,
  `opd_ipd_no` varchar(200) NOT NULL,
  `child_name` varchar(200) NOT NULL,
  `child_pic` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `birth_date` datetime NOT NULL,
  `weight` varchar(200) NOT NULL,
  `mother_name` varchar(200) NOT NULL,
  `contact` varchar(200) NOT NULL,
  `mother_pic` varchar(200) NOT NULL,
  `father_name` varchar(200) NOT NULL,
  `father_pic` varchar(200) NOT NULL,
  `birth_report` mediumtext NOT NULL,
  `document` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `is_active` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `birth_report`
--

INSERT INTO `birth_report` (`id`, `ref_no`, `opd_ipd_no`, `child_name`, `child_pic`, `gender`, `birth_date`, `weight`, `mother_name`, `contact`, `mother_pic`, `father_name`, `father_pic`, `birth_report`, `document`, `address`, `is_active`, `created_at`) VALUES
(1, 'BREF20241', '', 'Tarini', 'uploads/patient_images/no_image.png', 'Male', '2024-09-25 16:17:00', '1', '65', '+9659878987', 'uploads/patient_images/no_image.png', '', 'uploads/patient_images/no_image.png', '', '', '', 'yes', '2024-09-25 10:48:06');

-- --------------------------------------------------------

--
-- Table structure for table `blood_bank_products`
--

CREATE TABLE `blood_bank_products` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `blood_bank_status`
--

CREATE TABLE `blood_bank_status` (
  `id` int NOT NULL,
  `blood_group` varchar(3) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `ceated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `blood_bank_status`
--

INSERT INTO `blood_bank_status` (`id`, `blood_group`, `status`, `ceated_at`) VALUES
(1, 'A+', '5', '2018-08-18 11:40:07'),
(2, 'B+', '5', '2018-08-18 12:10:55'),
(3, 'A-', '5', '2018-08-18 12:11:24'),
(4, 'B-', '5', '2018-08-18 12:11:44'),
(5, 'O+', '5', '2018-08-18 12:12:06'),
(6, 'O-', '5', '2018-08-18 12:12:20'),
(7, 'AB+', '5', '2018-08-18 12:12:36'),
(8, 'AB-', '5', '2018-08-18 12:13:18');

-- --------------------------------------------------------

--
-- Table structure for table `blood_donor`
--

CREATE TABLE `blood_donor` (
  `id` int NOT NULL,
  `donor_name` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `age` varchar(11) DEFAULT NULL,
  `month` varchar(20) DEFAULT NULL,
  `blood_group` varchar(11) DEFAULT NULL,
  `gender` varchar(11) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `blood_donor`
--

INSERT INTO `blood_donor` (`id`, `donor_name`, `dob`, `age`, `month`, `blood_group`, `gender`, `father_name`, `address`, `contact_no`, `created_at`) VALUES
(1, 'Sheikh Rehman ', '2000-09-23', '24', '0', 'O+', 'Male', '', '', '+9658574145', '2024-09-23 05:25:01');

-- --------------------------------------------------------

--
-- Table structure for table `blood_donor_cycle`
--

CREATE TABLE `blood_donor_cycle` (
  `id` int NOT NULL,
  `blood_donor_id` int NOT NULL,
  `institution` varchar(100) DEFAULT NULL,
  `lot` varchar(11) DEFAULT NULL,
  `bag_no` varchar(11) DEFAULT NULL,
  `quantity` varchar(11) DEFAULT NULL,
  `donate_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `blood_donor_cycle`
--

INSERT INTO `blood_donor_cycle` (`id`, `blood_donor_id`, `institution`, `lot`, `bag_no`, `quantity`, `donate_date`, `created_at`) VALUES
(1, 1, '', '', '1', '1', '2024-10-02', '2024-10-05 06:52:10');

-- --------------------------------------------------------

--
-- Table structure for table `blood_issue`
--

CREATE TABLE `blood_issue` (
  `id` int NOT NULL,
  `bill_no` varchar(200) NOT NULL,
  `ref_no` varchar(255) NOT NULL,
  `date_of_issue` datetime DEFAULT NULL,
  `recieve_to` varchar(50) DEFAULT NULL,
  `blood_group` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `doctor` varchar(200) DEFAULT NULL,
  `institution` varchar(100) DEFAULT NULL,
  `technician` varchar(50) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `donor_name` varchar(50) DEFAULT NULL,
  `lot` varchar(20) DEFAULT NULL,
  `bag_no` varchar(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `cheque_no` varchar(200) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `payment_doc` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `blood_issue`
--

INSERT INTO `blood_issue` (`id`, `bill_no`, `ref_no`, `date_of_issue`, `recieve_to`, `blood_group`, `gender`, `doctor`, `institution`, `technician`, `amount`, `donor_name`, `lot`, `bag_no`, `remark`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_doc`, `created_at`, `generated_by`) VALUES
(1, '1', 'BIB1', '2024-09-25 16:28:00', '70', NULL, NULL, 'Ahmed Al-Masri', NULL, '', 100.00, '1', '', '', '', 'Cash', '', '0000-00-00', '', '2024-09-25 10:59:00', 1),
(2, '2', 'BIB2', '2024-09-13 00:00:00', '75', NULL, NULL, 'Ahmed Al-Masri', NULL, '', 100.00, '1', '', '', '', 'Cheque', '22', '2024-08-27', '', '2024-09-26 09:31:56', 1),
(3, '3', 'BIB3', '2024-10-01 17:52:00', '76', NULL, NULL, 'Ahmed Al-Masri', NULL, '', 100.00, '1', '', '10', '', 'Cash', '', '0000-00-00', '', '2024-10-04 12:23:04', 1),
(4, '4', 'BIB4', '2024-10-04 17:53:00', '76', NULL, NULL, 'Khaled Nasser', NULL, '1', 200.00, '1', '1', '1', '', 'Cash', '', '0000-00-00', '', '2024-10-04 12:23:35', 1),
(5, '5', 'BIB5', '2024-10-01 00:00:00', '76', NULL, NULL, 'Noor Abdullah', NULL, '', 10.00, '1', '', '11', '', 'Cash', '', '0000-00-00', '', '2024-10-04 12:25:46', 1),
(6, '6', 'BIB6', '2024-10-15 10:52:00', '95', NULL, NULL, 'Khaled Nasser', NULL, 'ok', 1000.00, '1', '', '', '', 'Cash', '', '0000-00-00', '', '2024-10-15 05:23:05', 1),
(7, '7', 'BIB7', '2024-10-03 17:00:00', '95', NULL, NULL, 'Ahmed Al-Masri', NULL, '', 100.00, '1', '', '', '', 'Cash', '', '0000-00-00', '', '2024-10-15 11:30:42', 1);

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` int NOT NULL,
  `branch_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `other_details` longtext COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

CREATE TABLE `charges` (
  `id` int NOT NULL,
  `charge_type` varchar(200) NOT NULL,
  `charge_category` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `code` varchar(100) NOT NULL,
  `standard_charge` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `charges`
--

INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES
(1, 'Procedures', 'Eye check', 'Eye check\r\n', 'P1001', '150.00', '0000-00-00', ''),
(2, 'Investigations', 'X-ray', 'X-ray\r\n', 'I1001', '150.00', '0000-00-00', ''),
(3, 'Supplier', 'Oxygen cylinder', 'Oxygen cylinder\r\n', 'S1001', '160.00', '0000-00-00', ''),
(4, 'Operation Theatre', 'Operation Services', 'Operation Services\r\n', 'O1001', '100.00', '0000-00-00', ''),
(5, 'Pathology', 'Histopathology', 'Pathology Charges\r\n', 'PA1001', '160.00', '0000-00-00', ''),
(6, 'Radiology', 'CAD-AI Research Laboratory.', 'CAD-AI Research Laboratory.\r\n', 'R1001', '160.00', '0000-00-00', ''),
(7, 'Others', 'Other Charges', 'Blood Module\r\n', 'B1001', '110.00', '0000-00-00', ''),
(8, 'Radiology', 'Digital Image Processing', '', 'DIP01', '500.00', '0000-00-00', ''),
(9, 'Pathology', 'Surgical pathology', '', 'SP01', '300.00', '0000-00-00', ''),
(10, 'Pathology', 'Cytopathology', '', 'C001', '250.00', '0000-00-00', ''),
(11, 'Pathology', 'Dermatopathology', '', 'D1001', '250.00', '0000-00-00', ''),
(12, 'Pathology', 'Forensic pathology', '', 'F1001', '290.00', '0000-00-00', ''),
(13, 'Radiology', 'Mammographic Tomosynthesis', '', 'M1001', '499.00', '0000-00-00', ''),
(14, 'Ambulance', 'ERS/Patient Transport Service', '', 'ER1001', '120.00', '0000-00-00', ''),
(15, 'IPD', 'Admission and Discharge.', '', 'IP1001', '1000.00', '0000-00-00', ''),
(16, 'IPD', 'Intensive Care Units', '', 'IP1002', '500.00', '0000-00-00', ''),
(17, 'Ambulance', 'Private Ambulance	', '', 'ER1002', '150.00', '0000-00-00', ''),
(18, 'Others', 'Other Charges', '', 'O1001', '100.00', '0000-00-00', ''),
(19, 'IPD', 'Maternity patient admissions', '', 'IP1003', '150.00', '0000-00-00', ''),
(20, 'Appointment', 'Appointment Charges', '', 'AP1001', '100.00', '0000-00-00', ''),
(21, 'OPD', 'OPD Insurance', '', 'OP1001', '100.00', '0000-00-00', ''),
(22, 'IPD', 'Laundry', '', 'IP1004', '150.00', '0000-00-00', ''),
(23, 'OPD', 'OPD Consultation Fees', '', 'OP1002', '150.00', '0000-00-00', ''),
(24, 'OPD', 'OPD Service', '', 'OP1003', '120.00', '0000-00-00', ''),
(25, 'Bloodbank', 'Cryoprecipitate', '', 'BL1001', '200', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `charge_categories`
--

CREATE TABLE `charge_categories` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `charge_type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `charge_categories`
--

INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES
(1, 'Eye check', 'An eye exam involves a series of tests to evaluate your vision and check for eye diseases. Your eye doctor is likely to use various instruments, shine bright lights at your eyes and request that you look through an array of lenses. Each test during an eye exam evaluates a different aspect of your vision or eye health.', 'Procedures'),
(2, 'X-ray', 'An X-ray is a quick, painless test that produces images of the structures inside your body — particularly your bones. X-ray beams pass through your body, and they are absorbed in different amounts depending on the density of the material they pass through.', 'Investigations'),
(3, 'Oxygen cylinder', 'Best Overall - OXY5 Portable Pure Oxygen 3+1 Cans with built-in mask for Ambitious People. It has a capacity of almost 600 breaths and is claimed by the company to be India\'s first refillable can. It is a perfect product for those who are ambitious and want the most out of life.', 'Supplier'),
(4, 'Operation Services', 'Health care operations include the administrative, financial and legal activities of a hospital, specialty practice, ancillary care provider or remote health service center. Health care professionals need to get a handle on operations because, at minimum, they enable running the business', 'Operation Theatre'),
(5, 'Histopathology', 'This refers to the examination of cells under a microscope after they have been stained with appropriate dyes.', 'Pathology'),
(6, 'CAD-AI Research Laboratory.', 'The Computer Aided Diagnosis-Artificial Intelligence (CAD-AI) Laboratory in the Department of Radiology was established in 1989 by Heang-Ping .', 'Radiology'),
(7, 'Packed Blood Cells', 'Packed red blood cells, also known as packed cells, are red blood cells that have been separated for blood transfusion. The packed cells are typically used in anemia that is either causing symptoms or when the hemoglobin is less than usually 70–80 g/L (7–8 g/dL).', 'Bloodbank'),
(8, 'Surgical pathology', 'Surgical pathology is the study of tissues removed from living patients during surgery to help diagnose a disease and determine a treatment plan. Often, the surgical pathologist provides consultation', 'Pathology'),
(9, 'Digital Image Processing', 'Digital image processing is the use of a digital computer to process digital images through an algorithm. ... It allows a much wider range of algorithms to be applied to the input data and can avoid problems such as the build-up of noise and distortion during processing.', 'Radiology'),
(10, 'Cytopathology', 'In cytopathology, cells that have been shed into bodily fluids or have been obtained by scraping or aspirating tissue are examined. Typical examples include cervical smear, sputum and gastric washings.', 'Pathology'),
(11, 'Other Charges', 'Others', 'Others'),
(12, 'Fire extinguisher', 'The size of a fire extinguisher indicates the amount of extinguishing agent it holds and is most often measured in pounds. Sizes can range from as small as 2.5 lb. to as large as 350 lb.', 'Supplier'),
(13, 'Sterilization and Cleaning Equipment', 'Sterilization .', 'Procedures'),
(14, 'Blood sugar test', 'A blood glucose test is a blood test that screens for diabetes by measuring the level of glucose (sugar) in a person\'s blood. Normal blood glucose level (while fasting) range within 70 to 99 mg/dL (3.9 to 5.5 mmol/L). Higher ranges could indicate pre-diabetes or diabetes. Test Details', 'Bloodbank'),
(15, 'Cholesterol level check', 'To check your cholesterol levels, your doctor will need to get a sample of your blood. You will probably have your blood drawn in the morning, sometimes after fasting since the night before. A blood test is an outpatient procedure. It takes only a few minutes and is relatively painless.', 'Procedures'),
(16, 'Blood pressure check', 'A normal blood pressure level is less than 120/80 mmHg. No matter your age, you can take steps each day to keep your blood pressure in a healthy range.', 'Procedures'),
(17, 'ERS/Patient Transport Service', 'At ERS Medical, we provide specialist transport services to the healthcare sector. We understand that this is a dynamic and ever-changing industry.', 'Ambulance'),
(18, 'Private Ambulance	', 'Personal Ambulance', 'Ambulance'),
(19, 'Appointment Charges', 'Define appointment fee. means a non-refundable sum of money payable to body corporate practicing as a Town Planner immediately on his official engagement', 'Appointment'),
(20, 'Cryoprecipitate', 'Cryoprecipitate is a highly concentrated source of fibrinogen. ... The cost per unit of fibrinogen is similar in FFP and Cryoprecipiate. In severe liver disease, pools of 8 to 10 units of Cryoprecipitate may be used so the total cost (and amount of fibrinogen given) may be greater.', 'Bloodbank'),
(21, 'Platelet Concentrate', 'Platelet transfusion, also known as platelet concentrate, is used to prevent or treat bleeding in people with either a low platelet count or poor platelet function. Often this occurs in people receiving cancer chemotherapy. Preventive transfusion is often done in those with platelet levels of less than 10 x 109/L.', 'Bloodbank'),
(22, 'Fresh Frozen Plasma', 'Fresh frozen plasma is a blood product made from the liquid portion of whole blood.', 'Bloodbank'),
(23, 'Mammographic Tomosynthesis', 'Breast tomosynthesis, also called three-dimensional (3-D) mammography and digital breast tomosynthesis (DBT), is an advanced form of breast imaging, or mammography, that uses a low-dose x-ray system and computer reconstructions to create three-dimensional images of the breasts.', 'Radiology'),
(24, 'Dermatopathology', 'Dermatopathology concerns the study of skin diseases.', 'Pathology'),
(25, 'Forensic pathology', 'Forensic pathology involves the post mortem examination of a corpse for cause of death using a process called autopsy.', 'Pathology'),
(26, 'Laundry', 'The definition of laundry is a group of clothes or linens that are being washed, or a place where clothing and other fabrics are washed or cleaned. An example of laundry is the batch of dirty towels that you put into the washing machine.', 'IPD'),
(27, 'Nursing Services', '	Nursing services means health care services provided to a patient by a registered professional nurse or a licensed practical nurse under the direction of a licensed professional within the scope of practice as defined by state law.', 'IPD'),
(28, 'Maternity patient admissions', 'A maternity hospital specializes in caring for women during pregnancy and childbirth. It also provides care for newborn infants, and may act as a centre for clinical training in midwifery and obstetrics.', 'IPD'),
(29, 'Admission and Discharge.', 'Patients are admitted to TMH from different sources: OPD - Doctors may advise for admission to the respective ward. Labour room - Gynecological or Obstetric patients are treated and advised for admission', 'IPD'),
(30, 'Intensive Care Units', 'Intensive care units cater to patients with severe or life-threatening illnesses and injuries, which require constant care, close supervision from life support equipment and medication in order to ensure normal bodily functions.', 'IPD'),
(31, 'OPD Insurance', 'Comprehensive health benefits Add on to your health insurance.', 'OPD'),
(32, 'OPD Service', 'It is known as outpatient department in which we provide the facility of diagnosis and take care of the patients who can not stay overnight.', 'OPD'),
(33, 'OPD Consultation Fees', 'O.P.D, also known as Outpatient Consultation Department, includes consulting with patients and offering immediate treatment methods which do not require hospitalization. The type of medical practice done by most physicians falls under the category of O.P.D consultation. Apart from private practitioners and government health centers, private hospitals and nursing homes also offer O.P.D facility for patients.', 'OPD');

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `id` int NOT NULL,
  `complaint_type` varchar(100) NOT NULL,
  `source` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `description` text NOT NULL,
  `action_taken` varchar(200) NOT NULL,
  `assigned` varchar(50) NOT NULL,
  `note` text NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`id`, `complaint_type`, `source`, `name`, `contact`, `email`, `date`, `description`, `action_taken`, `assigned`, `note`, `image`) VALUES
(1, 'Food quality', 'From visitors', 'Omar Al-Najjar', '+9656856789', '', '2024-08-17', 'OK', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `complaint_type`
--

CREATE TABLE `complaint_type` (
  `id` int NOT NULL,
  `complaint_type` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `complaint_type`
--

INSERT INTO `complaint_type` (`id`, `complaint_type`, `description`, `created_at`) VALUES
(1, 'Food quality', 'A reference to a set of rules that were followed when the resource was constructed, and which must be understood when processing the content. Often, this is a reference to an implementation guide that defines the special rules along with other profiles etc.', '2024-05-30 07:15:32'),
(2, 'Hospital services', '', '2024-05-30 07:15:48'),
(3, 'Long Wait Times', 'Long Wait Times', '2024-05-30 07:16:11'),
(4, 'Billing Discrepancies', '', '2024-05-30 07:16:28');

-- --------------------------------------------------------

--
-- Table structure for table `consultant_register`
--

CREATE TABLE `consultant_register` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `ipd_id` int NOT NULL,
  `date` varchar(100) DEFAULT NULL,
  `ins_date` varchar(50) DEFAULT NULL,
  `instruction` varchar(200) NOT NULL,
  `cons_doctor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `consultant_register`
--

INSERT INTO `consultant_register` (`id`, `patient_id`, `ipd_id`, `date`, `ins_date`, `instruction`, `cons_doctor`) VALUES
(1, 43, 3, '2024-08-16 13:22:00', '2024-08-16', 'please take medicine after food.', 3),
(2, 45, 4, '2024-08-17 10:28:00', '2024-08-17', 'don\'t use cold water', 3),
(3, 45, 4, '2024-08-19 16:13:00', '2024-08-19', 'hnjmbjhm', 3),
(4, 4, 7, '2024-08-20 12:10:00', '2024-08-05', 'don\'t take oily food', 3),
(5, 49, 10, '2024-08-20 18:18:00', '2024-08-20', 'don\'t take cold water', 3),
(6, 36, 1, '2024-08-23 15:40:00', '2024-08-23', 'take medicine', 3),
(7, 55, 2, '2024-08-27 17:58:00', '2024-08-27', 'تحليل  دم', 3),
(8, 55, 2, '2024-08-27 17:59:00', '2024-08-27', 'اشعة صدر', 3),
(9, 55, 2, '2024-08-28 15:29:00', '2024-08-28', 'صورة  رنين', 4),
(10, 55, 2, '2024-08-29 11:58:00', '2024-08-29', 'test', 3),
(11, 54, 3, '2024-08-29 12:00:00', '2024-08-29', 'tt', 3),
(12, 56, 4, '2024-08-29 12:58:00', '2024-08-29', 'test', 3),
(13, 59, 5, '2024-08-31 11:56:00', '2024-08-13', 'yyy', 3),
(14, 59, 6, '2024-08-31 15:17:00', '2024-08-31', 'take medicine', 3),
(15, 59, 5, '2024-08-31 15:40:00', '2024-08-31', 'bn', 3),
(16, 58, 2, '2024-09-03 17:08:00', '2024-09-03', 'Please take medicine after food.', 3),
(17, 61, 1, '2024-09-03 17:09:00', '2024-09-03', 'Please take medicine before food.', 3),
(18, 62, 3, '2024-09-05 11:43:00', '2024-09-05', 'Don\'t take cold water', 3),
(19, 65, 6, '2024-09-02 12:52:00', '2024-09-10', 'Don\'t drink cold water', 3),
(20, 66, 7, '2024-09-10 16:40:00', '2024-09-10', 'Don\'t eat outside food', 3),
(21, 28, 2, '2024-09-19 10:13:00', '2024-09-19', 'ok', 3),
(22, 69, 1, '2024-09-26 10:54:00', '2024-09-26', 'ok', 3),
(23, 76, 2, '2024-10-03 10:36:00', '2024-10-03', 'Take Medicine before food', 3),
(24, 95, 7, '2024-10-15 10:48:00', '2024-10-15', 'ok', 3),
(25, 95, 7, '2024-10-26', '2024-10-19', 'ok', 3),
(27, 95, 7, '2024-10-26', '2024-10-19', 'ok', 3);

-- --------------------------------------------------------

--
-- Table structure for table `consult_charges`
--

CREATE TABLE `consult_charges` (
  `id` int NOT NULL,
  `doctor` int NOT NULL,
  `standard_charge` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `consult_charges`
--

INSERT INTO `consult_charges` (`id`, `doctor`, `standard_charge`, `date`, `status`) VALUES
(1, 3, '600', '0000-00-00', ''),
(2, 4, '500', '0000-00-00', ''),
(3, 5, '900', '0000-00-00', ''),
(4, 6, '1000', '0000-00-00', ''),
(5, 7, '500', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` int NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `is_public` varchar(10) DEFAULT 'No',
  `class_id` int DEFAULT NULL,
  `cls_sec_id` int NOT NULL,
  `file` varchar(250) DEFAULT NULL,
  `created_by` int NOT NULL,
  `note` text,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `title`, `type`, `is_public`, `class_id`, `cls_sec_id`, `file`, `created_by`, `note`, `is_active`, `created_at`, `date`) VALUES
(4, 'eye camp', 'normal', 'No', NULL, 0, 'uploads/hospial_content/material/4.jpg', 0, 'ok', 'no', '2024-09-04 04:52:40', '2024-09-27');

-- --------------------------------------------------------

--
-- Table structure for table `content_for`
--

CREATE TABLE `content_for` (
  `id` int NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `content_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `belong_to` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `bs_column` int DEFAULT NULL,
  `validation` int DEFAULT '0',
  `field_values` mediumtext,
  `show_table` varchar(100) DEFAULT NULL,
  `visible_on_table` int NOT NULL,
  `weight` int DEFAULT NULL,
  `is_active` int DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` int NOT NULL,
  `belong_table_id` int DEFAULT NULL,
  `custom_field_id` int DEFAULT NULL,
  `field_value` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `custom_field_values`
--

INSERT INTO `custom_field_values` (`id`, `belong_table_id`, `custom_field_id`, `field_value`, `created_at`) VALUES
(1, 1, 2, '', '2024-08-16 05:51:11'),
(2, 1, 3, '', '2024-08-16 05:57:21'),
(3, 2, 2, '', '2024-08-16 08:57:26'),
(4, 3, 4, '', '2024-08-29 07:36:20');

-- --------------------------------------------------------

--
-- Table structure for table `data_transfer_log`
--

CREATE TABLE `data_transfer_log` (
  `transfer_id` int NOT NULL,
  `transfer_gateway_id` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `sending_requesting_hospital_id` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `receiving_requesting_hospital_id` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `patientuid` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `patient_name` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `matched_data` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `data_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `data_content` text COLLATE utf8mb4_general_ci NOT NULL,
  `request_date` datetime NOT NULL,
  `approval_date` datetime DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_general_ci DEFAULT 'Pending',
  `approval_by` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `requestsent_by` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `transfer_date` datetime DEFAULT NULL,
  `notes_sender` text COLLATE utf8mb4_general_ci,
  `notes_receiver` text COLLATE utf8mb4_general_ci NOT NULL,
  `transfer_method` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'Automatic Transfer',
  `sender_database_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `receiver_database_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `type` enum('Sender','Receiver') COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `death_report`
--

CREATE TABLE `death_report` (
  `id` int NOT NULL,
  `ref_no` varchar(25) NOT NULL,
  `opdipd_no` varchar(200) NOT NULL,
  `patient` varchar(200) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `image` varchar(200) NOT NULL,
  `death_date` datetime NOT NULL,
  `guardian_name` varchar(200) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `address` varchar(200) NOT NULL,
  `death_report` text NOT NULL,
  `is_active` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `death_report`
--

INSERT INTO `death_report` (`id`, `ref_no`, `opdipd_no`, `patient`, `gender`, `image`, `death_date`, `guardian_name`, `contact`, `address`, `death_report`, `is_active`, `created_at`) VALUES
(1, 'DREF20241', '', '65', '', '', '2024-09-25 16:34:00', 'Manonashak Sandu', '', '', '', 'yes', '2024-09-25 11:04:00'),
(2, 'DREF20242', 'OPD456', '74', '', 'uploads/death_image/2.png', '2024-09-25 16:58:00', 'Abdullah IIn Bin AI Hussein', '', '', 'ok', 'yes', '2024-09-26 06:36:55');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int NOT NULL,
  `department_name` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES
(1, 'PATHOLOGY', 'yes'),
(2, 'OPD', 'yes'),
(3, 'IPD', 'yes'),
(4, 'FRONT OFFICE', 'yes'),
(5, 'PHARMACY', 'yes'),
(6, 'RADIOLOGY', 'yes'),
(7, 'OPERATION THEATRE', 'yes'),
(8, 'BLOOD BANK', 'yes'),
(9, 'TPA MANAGEMENT', 'yes'),
(10, 'FINANCE', 'yes'),
(11, 'AMBULANCE', 'yes'),
(12, 'HUMAN RESOURCE', 'yes'),
(13, 'REPORT COUNTER', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

CREATE TABLE `diagnosis` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `report_type` varchar(200) NOT NULL,
  `document` varchar(200) NOT NULL,
  `description` varchar(400) NOT NULL,
  `report_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `diagnosis`
--

INSERT INTO `diagnosis` (`id`, `patient_id`, `report_type`, `document`, `description`, `report_date`) VALUES
(1, 48, 'CBC', '', '', '2024-08-20'),
(2, 51, 'CBC', '', '', '2024-08-21'),
(3, 53, 'CBC', '', '', '2024-08-23'),
(4, 36, 'CBC', '', '', '2024-08-21'),
(5, 55, 'التهاب رئة', '', '', '2024-08-23'),
(6, 54, 'df', '', '', '2024-08-29'),
(7, 56, 'flu', '', '', '2024-08-29'),
(8, 57, 'tg', '', '', '2024-08-23'),
(10, 59, 'CBC', '', 'all good', '2024-08-30'),
(12, 58, 'Eye checkup', 'uploads/patient_images/12.jpg', 'ok', '2024-09-02'),
(13, 62, 'Normal', 'uploads/patient_images/13.jpg', 'ok', '2024-09-05'),
(15, 76, 'Normal Eye Test', '', '', '2024-10-03'),
(17, 76, 'Normal Blood Test', 'uploads/patient_images/17.jpg', 'ok', '2024-10-03'),
(21, 95, 'ok', '', 'ok', '2024-10-01');

-- --------------------------------------------------------

--
-- Table structure for table `dispatch_receive`
--

CREATE TABLE `dispatch_receive` (
  `id` int NOT NULL,
  `reference_no` varchar(50) NOT NULL,
  `to_title` varchar(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `note` varchar(500) NOT NULL,
  `from_title` varchar(200) NOT NULL,
  `date` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `dispatch_receive`
--

INSERT INTO `dispatch_receive` (`id`, `reference_no`, `to_title`, `address`, `note`, `from_title`, `date`, `image`, `created_at`, `type`) VALUES
(3, '', '', '', '', 'post', '2024-08-22', '', '2024-08-23 06:33:05', 'receive'),
(4, '', 'dispatch', '', '', '', '2024-08-20', '', '2024-08-23 06:34:06', 'dispatch');

-- --------------------------------------------------------

--
-- Table structure for table `dose_duration`
--

CREATE TABLE `dose_duration` (
  `id` int NOT NULL,
  `dose_duration` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dose_duration`
--

INSERT INTO `dose_duration` (`id`, `dose_duration`) VALUES
(2, 'Night');

-- --------------------------------------------------------

--
-- Table structure for table `dose_interval`
--

CREATE TABLE `dose_interval` (
  `id` int NOT NULL,
  `dose_interval` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dose_interval`
--

INSERT INTO `dose_interval` (`id`, `dose_interval`) VALUES
(2, '4 times a day');

-- --------------------------------------------------------

--
-- Table structure for table `email_config`
--

CREATE TABLE `email_config` (
  `id` int UNSIGNED NOT NULL,
  `email_type` varchar(100) DEFAULT NULL,
  `smtp_server` varchar(100) DEFAULT NULL,
  `smtp_port` varchar(100) DEFAULT NULL,
  `smtp_username` varchar(100) DEFAULT NULL,
  `smtp_password` varchar(100) DEFAULT NULL,
  `ssl_tls` varchar(100) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `email_config`
--

INSERT INTO `email_config` (`id`, `email_type`, `smtp_server`, `smtp_port`, `smtp_username`, `smtp_password`, `ssl_tls`, `is_active`, `created_at`) VALUES
(2, 'smtp', 'smtp.gmail.com', '587', 'doctorapp123@gmail.com', 'doctor@123', 'tls', 'yes', '2021-01-30 05:40:23');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry`
--

CREATE TABLE `enquiry` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` mediumtext NOT NULL,
  `reference` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `follow_up_date` date NOT NULL,
  `note` mediumtext NOT NULL,
  `source` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `assigned` varchar(100) NOT NULL,
  `class` int NOT NULL,
  `no_of_child` varchar(11) DEFAULT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_type`
--

CREATE TABLE `enquiry_type` (
  `id` int NOT NULL,
  `enquiry_type` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int NOT NULL,
  `event_title` varchar(200) NOT NULL,
  `event_description` varchar(300) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `event_color` varchar(200) NOT NULL,
  `event_for` varchar(100) NOT NULL,
  `role_id` int NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `event_title`, `event_description`, `start_date`, `end_date`, `event_type`, `event_color`, `event_for`, `role_id`, `is_active`) VALUES
(4, 'Appointment with Patient A', 'Need a complete body check-up', '2024-08-05 06:30:00', '2024-08-05 06:30:00', 'private', '#337ab7', '2', 0, ''),
(5, 'Tuesday', '', '2024-08-13 00:00:00', '2024-08-13 00:00:00', 'task', '#000', '9', 6, 'no'),
(6, 'train', 'asdas', '2024-08-26 07:00:00', '2024-08-26 07:00:00', 'sameforall', '#337ab7', '8', 0, ''),
(7, 'الاتصال بالدكتور  عماد', '', '2024-08-29 10:00:00', '2024-08-29 10:00:00', 'sameforall', '#337ab7', '8', 0, ''),
(8, 'دورة تدريبية', 'دورة حول  نظام ادارة العيادات', '2024-08-28 10:00:00', '2024-08-28 10:00:00', 'private', '#337ab7', '9', 0, ''),
(9, 'زيارة  المخبر', 'الاطلاع على اجهزة  تحليل الدم', '2024-08-29 15:00:00', '2024-08-29 16:00:00', 'public', '#337ab7', '0', 0, ''),
(11, 'patient visit', '', '2024-09-05 00:00:00', '2024-09-05 00:00:00', 'task', '#000', '3', 3, 'no'),
(14, 'OK', '', '2024-09-20 00:00:00', '2024-09-20 00:00:00', 'task', '#000', '61', 0, 'no'),
(15, 'ok', '', '2024-09-20 00:00:00', '2024-09-20 00:00:00', 'task', '#000', '1', 7, 'no');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int NOT NULL,
  `exp_head_id` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `documents` varchar(255) DEFAULT NULL,
  `note` text,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `exp_head_id`, `name`, `invoice_no`, `date`, `amount`, `documents`, `note`, `is_active`, `is_deleted`, `created_at`) VALUES
(2, 1, 'Rent', '123S56', '2024-09-04', 2332.00, NULL, '', 'yes', 'no', '2024-09-10 06:11:08');

-- --------------------------------------------------------

--
-- Table structure for table `expense_head`
--

CREATE TABLE `expense_head` (
  `id` int NOT NULL,
  `exp_category` varchar(50) DEFAULT NULL,
  `description` text,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `expense_head`
--

INSERT INTO `expense_head` (`id`, `exp_category`, `description`, `is_active`, `is_deleted`, `created_at`) VALUES
(1, 'Building rent', '', 'yes', 'no', '2024-05-30 07:44:04'),
(2, 'Equipements', '', 'yes', 'no', '2024-05-30 07:44:09'),
(3, 'Electricity Bill', '', 'yes', 'no', '2024-05-30 07:44:18'),
(4, 'Telephone Bill', '', 'yes', 'no', '2024-05-30 07:44:26'),
(5, 'Power Generator Fuel Charge', '', 'yes', 'no', '2024-05-30 07:44:40'),
(6, 'Tea Expense', '', 'yes', 'no', '2024-05-30 07:44:49');

-- --------------------------------------------------------

--
-- Table structure for table `floor`
--

CREATE TABLE `floor` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `floor`
--

INSERT INTO `floor` (`id`, `name`, `description`) VALUES
(1, '1st Floor', 'Neonatal intensive care units (NICUs) which provide care for newborn infants.\r\n'),
(2, '2nd Floor', 'The pediatric intensive care unit (PICU) where children receive critical care. Depending on the facility, newborns may be treated in a PICU or a neonatal ICU. Smaller facilities may have a PICU only, while larger facilities may offer both a PICU and a neonatal ICU.\r\n'),
(3, '3rd Floor', 'A palliative or hospice unit is where end-of-life care is provided if you have a life-limiting illness, which may or may not be cancer-related. Hospice and palliative care focus on providing comfort and quality of life. In some facilities, oncology and hospice/palliative care may be provided in the same unit.\r\n'),
(4, '4th Floor', 'The coronary/cardiac care unit (CCU) is a specialized intensive care unit for cardiac issues. If you have heart disease, experienced a cardiac event such as a heart attack, or if you\'re recovering from open-heart surgery, you may be treated in the CCU. In some facilities, a separate open-heart recovery unit may be utilized for surgical patients.\r\n'),
(5, 'Ground  Floor', 'A good choice here would be luxury vinyl tile (LVT), vinyl composition tile (VCT), sheet vinyl, rubber, or linoleum.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `follow_up`
--

CREATE TABLE `follow_up` (
  `id` int NOT NULL,
  `enquiry_id` int NOT NULL,
  `date` date NOT NULL,
  `next_date` date NOT NULL,
  `response` text NOT NULL,
  `note` text NOT NULL,
  `followup_by` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_media_gallery`
--

CREATE TABLE `front_cms_media_gallery` (
  `id` int NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  `thumb_path` varchar(300) DEFAULT NULL,
  `dir_path` varchar(300) DEFAULT NULL,
  `img_name` varchar(300) DEFAULT NULL,
  `thumb_name` varchar(300) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `file_type` varchar(100) NOT NULL,
  `file_size` varchar(100) NOT NULL,
  `vid_url` mediumtext NOT NULL,
  `vid_title` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_menus`
--

CREATE TABLE `front_cms_menus` (
  `id` int NOT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `description` mediumtext,
  `open_new_tab` int NOT NULL DEFAULT '0',
  `ext_url` mediumtext NOT NULL,
  `ext_url_link` mediumtext NOT NULL,
  `publish` int NOT NULL DEFAULT '0',
  `content_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_menus`
--

INSERT INTO `front_cms_menus` (`id`, `menu`, `slug`, `description`, `open_new_tab`, `ext_url`, `ext_url_link`, `publish`, `content_type`, `is_active`, `created_at`) VALUES
(1, 'Main Menu', 'main-menu', 'Main menu', 0, '', '', 0, 'default', 'no', '2018-04-20 09:24:49'),
(2, 'Bottom Menu', 'bottom-menu', 'Bottom Menu', 0, '', '', 0, 'default', 'no', '2018-04-20 09:24:55');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_menu_items`
--

CREATE TABLE `front_cms_menu_items` (
  `id` int NOT NULL,
  `menu_id` int NOT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `page_id` int NOT NULL,
  `parent_id` int NOT NULL,
  `ext_url` mediumtext,
  `open_new_tab` int DEFAULT '0',
  `ext_url_link` mediumtext,
  `slug` varchar(200) DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `publish` int NOT NULL DEFAULT '0',
  `description` mediumtext,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_menu_items`
--

INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES
(16, 2, 'Home', 1, 0, NULL, NULL, NULL, 'home-1', NULL, 0, NULL, 'no', '2018-07-14 08:44:12'),
(23, 1, 'Appointment', 77, 0, '1', NULL, 'http://yourdomainname.com/form/appointment', 'appointment', 2, 0, NULL, 'no', '2019-11-01 07:36:32'),
(26, 1, 'Home', 1, 0, NULL, NULL, NULL, 'home', NULL, 0, NULL, 'no', '2019-01-24 08:48:17'),
(27, 2, 'Appointment', 0, 0, '1', NULL, 'http://yourdomainname.com/form/appointment', 'appointment-1', NULL, 0, NULL, 'no', '2019-11-02 16:24:41');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_pages`
--

CREATE TABLE `front_cms_pages` (
  `id` int NOT NULL,
  `page_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_homepage` int DEFAULT '0',
  `title` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `meta_title` mediumtext,
  `meta_description` mediumtext,
  `meta_keyword` mediumtext,
  `feature_image` varchar(200) NOT NULL,
  `description` longtext,
  `publish_date` date NOT NULL,
  `publish` int DEFAULT '0',
  `sidebar` int DEFAULT '0',
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_pages`
--

INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES
(1, 'default', 1, 'Home', 'page/home', 'page', 'home', '', '', '', '', '<p>Home page</p>', '0000-00-00', 1, 1, 'no', '2019-01-24 08:33:59'),
(2, 'default', 0, 'Complain', 'page/complain', 'page', 'complain', 'Complain form', '                                                                                                                                                                                    complain form                                                                                                                                                                                                                                ', 'complain form', '', '<div class=\"col-md-12 col-sm-12\">\r\n<h2 class=\"text-center\">&nbsp;</h2>\r\n\r\n<p class=\"text-center\">[form-builder:complain]</p>\r\n</div>', '0000-00-00', 1, 1, 'no', '2019-01-24 08:30:12'),
(54, 'default', 0, '404 page', 'page/404-page', 'page', '404-page', '', '                                ', '', '', '<html>\r\n<head>\r\n <title></title>\r\n</head>\r\n<body>\r\n<p>404 page found</p>\r\n</body>\r\n</html>', '0000-00-00', 0, NULL, 'no', '2018-05-18 09:16:04'),
(76, 'default', 0, 'Contact us', 'page/contact-us', 'page', 'contact-us', '', '', '', '', '<p>[form-builder:contact_us]</p>', '0000-00-00', 0, NULL, 'no', '2019-01-24 08:31:58'),
(77, 'manual', 0, 'our-appointment', 'page/our-appointment', 'page', 'our-appointment', '', '', '', '', '<form action=\"welcome/appointment\" method=\"get\">\r\n  First name: <input type=\"text\" name=\"fname\"><br>\r\n  Last name: <input type=\"text\" name=\"lname\"><br>\r\n  <input type=\"submit\" value=\"Submit\">\r\n</form>', '0000-00-00', 0, 1, 'no', '2019-11-01 07:32:48');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_page_contents`
--

CREATE TABLE `front_cms_page_contents` (
  `id` int NOT NULL,
  `page_id` int DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_programs`
--

CREATE TABLE `front_cms_programs` (
  `id` int NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `url` mediumtext,
  `title` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `event_start` date DEFAULT NULL,
  `event_end` date DEFAULT NULL,
  `event_venue` mediumtext,
  `description` mediumtext,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `meta_title` mediumtext NOT NULL,
  `meta_description` mediumtext NOT NULL,
  `meta_keyword` mediumtext NOT NULL,
  `feature_image` mediumtext NOT NULL,
  `publish_date` date NOT NULL,
  `publish` varchar(10) DEFAULT '0',
  `sidebar` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_program_photos`
--

CREATE TABLE `front_cms_program_photos` (
  `id` int NOT NULL,
  `program_id` int DEFAULT NULL,
  `media_gallery_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_settings`
--

CREATE TABLE `front_cms_settings` (
  `id` int NOT NULL,
  `theme` varchar(50) DEFAULT NULL,
  `is_active_rtl` int DEFAULT '0',
  `is_active_front_cms` int DEFAULT '0',
  `is_active_sidebar` int DEFAULT '0',
  `logo` varchar(200) DEFAULT NULL,
  `contact_us_email` varchar(100) DEFAULT NULL,
  `complain_form_email` varchar(100) DEFAULT NULL,
  `sidebar_options` mediumtext NOT NULL,
  `fb_url` varchar(200) NOT NULL,
  `twitter_url` varchar(200) NOT NULL,
  `youtube_url` varchar(200) NOT NULL,
  `google_plus` varchar(200) NOT NULL,
  `instagram_url` varchar(200) NOT NULL,
  `pinterest_url` varchar(200) NOT NULL,
  `linkedin_url` varchar(200) NOT NULL,
  `google_analytics` mediumtext,
  `footer_text` varchar(500) DEFAULT NULL,
  `fav_icon` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_settings`
--

INSERT INTO `front_cms_settings` (`id`, `theme`, `is_active_rtl`, `is_active_front_cms`, `is_active_sidebar`, `logo`, `contact_us_email`, `complain_form_email`, `sidebar_options`, `fb_url`, `twitter_url`, `youtube_url`, `google_plus`, `instagram_url`, `pinterest_url`, `linkedin_url`, `google_analytics`, `footer_text`, `fav_icon`, `created_at`) VALUES
(1, 'default', NULL, NULL, NULL, '', '', '', '[\"news\",\"complain\"]', '', '', '', '', '', '', '', '', '3SDSOLUTIONS.COM', '', '2021-08-13 09:43:33');

-- --------------------------------------------------------

--
-- Table structure for table `general_calls`
--

CREATE TABLE `general_calls` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `follow_up_date` date NOT NULL,
  `call_dureation` varchar(50) NOT NULL,
  `note` mediumtext NOT NULL,
  `call_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `general_calls`
--

INSERT INTO `general_calls` (`id`, `name`, `contact`, `date`, `description`, `follow_up_date`, `call_dureation`, `note`, `call_type`) VALUES
(1, 'Hassan Al-Khatib', '+9656346331', '2024-08-20', 'ok', '2024-08-22', '10 mins', '', 'Incoming'),
(2, 'دكتور  خالد', '+9651111111', '2024-08-27', 'متابعة حالة المريض  جمال', '2024-08-28', '1', '', 'Outgoing'),
(3, 'saumya', '+9657667444', '2024-09-02', '', '2024-09-11', '', '', 'Incoming'),
(4, 'Manashr', '+9651234323', '2024-09-03', '', '2024-10-13', '', '', 'Incoming'),
(5, 'Allu Arjun', '+9656787487', '2024-10-18', 'ok', '2024-10-19', '', '', 'Incoming');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_department`
--

CREATE TABLE `hospital_department` (
  `id` int NOT NULL,
  `department_name` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `hospital_department`
--

INSERT INTO `hospital_department` (`id`, `department_name`, `is_active`) VALUES
(1, 'Outpatient department (OPD)', 'yes'),
(2, 'Surgical department', 'yes'),
(3, 'Inpatient service (IP)', 'yes'),
(4, 'Nursing department', 'yes'),
(5, 'Physical medicine', 'yes'),
(6, 'Paramedical department', 'yes'),
(7, 'Rehabilitation department', 'yes'),
(8, 'Dietary department', 'yes'),
(9, 'Pharmacy department', 'yes'),
(10, 'Operation theater complex (OT)', 'yes'),
(11, 'Radiology department (X-ray),', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `id` int NOT NULL,
  `inc_head_id` varchar(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `note` text,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `documents` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `income`
--

INSERT INTO `income` (`id`, `inc_head_id`, `name`, `invoice_no`, `date`, `amount`, `note`, `is_active`, `is_deleted`, `created_at`, `documents`) VALUES
(3, '1', 'IPD', '1256', '2024-09-04', 4500.00, '', 'yes', 'no', '2024-09-04 07:26:47', NULL),
(4, '2', 'Siv', '1234', '2024-09-05', 1000.00, 'ok', 'yes', 'no', '2024-09-05 11:47:39', 'uploads/hospital_income/4.jpeg'),
(5, '3', 'madhu', '', '2024-09-12', 1234.00, 'ok', 'yes', 'no', '2024-09-16 06:35:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `income_head`
--

CREATE TABLE `income_head` (
  `id` int NOT NULL,
  `income_category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `is_deleted` varchar(255) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `income_head`
--

INSERT INTO `income_head` (`id`, `income_category`, `description`, `is_active`, `is_deleted`, `created_at`) VALUES
(1, 'Hospital charges', 'Hospital charges', 'yes', 'no', '2024-05-30 07:42:37'),
(2, 'Special campaign', 'Special campaign', 'yes', 'no', '2024-05-30 07:42:54'),
(3, 'Canteen Rent', 'Canteen Rent', 'yes', 'no', '2024-05-30 07:43:18'),
(4, 'Vehicle Stand Charges', 'Vehicle Stand Charges', 'yes', 'no', '2024-05-30 07:43:33');

-- --------------------------------------------------------

--
-- Table structure for table `ipd_billing`
--

CREATE TABLE `ipd_billing` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `ipd_id` int NOT NULL,
  `discount` int NOT NULL,
  `other_charge` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `gross_total` decimal(15,2) NOT NULL,
  `net_amount` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `generated_by` int NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ipd_billing`
--

INSERT INTO `ipd_billing` (`id`, `patient_id`, `ipd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`) VALUES
(2, 69, 1, 0, '1000', '2024-10-07', 0.00, 0.00, 0.00, -1000.00, 1, 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `ipd_details`
--

CREATE TABLE `ipd_details` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `height` varchar(5) DEFAULT NULL,
  `weight` varchar(5) DEFAULT NULL,
  `bp` varchar(20) DEFAULT NULL,
  `pulse` varchar(255) NOT NULL,
  `temperature` varchar(255) NOT NULL,
  `respiration` varchar(255) NOT NULL,
  `pre_medical_issue` varchar(255) NOT NULL,
  `ipd_no` varchar(200) NOT NULL,
  `room` varchar(100) NOT NULL,
  `bed` varchar(100) NOT NULL,
  `bed_group_id` varchar(10) DEFAULT NULL,
  `case_type` varchar(100) NOT NULL,
  `casualty` varchar(100) NOT NULL,
  `symptoms` varchar(200) NOT NULL,
  `known_allergies` varchar(200) NOT NULL,
  `hospital_department` int NOT NULL,
  `note` text NOT NULL,
  `refference` varchar(200) NOT NULL,
  `cons_doctor` int NOT NULL,
  `amount` varchar(100) NOT NULL,
  `credit_limit` varchar(100) NOT NULL,
  `tax` varchar(100) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `discharged` varchar(200) NOT NULL,
  `discharge_status` varchar(50) NOT NULL DEFAULT 'under_review',
  `discharged_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ipd_details`
--

INSERT INTO `ipd_details` (`id`, `patient_id`, `height`, `weight`, `bp`, `pulse`, `temperature`, `respiration`, `pre_medical_issue`, `ipd_no`, `room`, `bed`, `bed_group_id`, `case_type`, `casualty`, `symptoms`, `known_allergies`, `hospital_department`, `note`, `refference`, `cons_doctor`, `amount`, `credit_limit`, `tax`, `payment_mode`, `date`, `discharged`, `discharge_status`, `discharged_date`) VALUES
(1, 69, '', '', '', '', '', '', '', 'IPDN1', '', '6', '3', '', 'No', '', '', 0, '', '', 3, '', '', '', '', '2024-09-26 10:54:00', 'yes', 'approved', '2024-10-07'),
(5, 76, '', '', '', '', '', '', '', 'IPDN2', '', '9', '1', '', 'No', '', '', 0, '', '', 3, '', '', '', '', '2024-10-05 11:41:00', 'no', 'approved', '0000-00-00'),
(6, 76, '', '', '', '', '', '', '', 'IPDN6', '', '13', '5', '', 'No', '', '', 0, '', '', 4, '', '', '', '', '2024-10-05 11:42:00', 'no', 'approved', '0000-00-00'),
(7, 95, '', '', '', '', '', '', '', 'IPDN7', '', '18', '1', '', 'No', '', '', 3, '', '', 6, '', '', '', '', '2024-10-15 10:47:00', 'no', 'approved', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `ipd_prescription_basic`
--

CREATE TABLE `ipd_prescription_basic` (
  `id` int NOT NULL,
  `pres_no` varchar(255) NOT NULL,
  `ipd_id` int NOT NULL,
  `header_note` varchar(100) NOT NULL,
  `footer_note` varchar(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ipd_prescription_basic`
--

INSERT INTO `ipd_prescription_basic` (`id`, `pres_no`, `ipd_id`, `header_note`, `footer_note`, `date`) VALUES
(1, 'IPDP1', 2, '', '<p></p><blockquote><p><br></p></blockquote><p></p>', '2024-10-03'),
(2, 'IPDP2', 1, '', '', '2024-10-03');

-- --------------------------------------------------------

--
-- Table structure for table `ipd_prescription_details`
--

CREATE TABLE `ipd_prescription_details` (
  `id` int NOT NULL,
  `basic_id` int NOT NULL,
  `ipd_id` int NOT NULL,
  `medicine_category_id` int NOT NULL,
  `medicine` varchar(200) NOT NULL,
  `dosage` varchar(200) NOT NULL,
  `instruction` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ipd_prescription_details`
--

INSERT INTO `ipd_prescription_details` (`id`, `basic_id`, `ipd_id`, `medicine_category_id`, `medicine`, `dosage`, `instruction`) VALUES
(2, 1, 2, 1, 'Ftox-DX', '1', 'Take after food'),
(3, 2, 1, 1, 'Ftox-DX', '1', '3times');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int NOT NULL,
  `item_category_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `unit` varchar(200) NOT NULL,
  `item_photo` varchar(225) DEFAULT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `item_store_id` int DEFAULT NULL,
  `item_supplier_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `item_category_id`, `name`, `unit`, `item_photo`, `description`, `created_at`, `item_store_id`, `item_supplier_id`, `quantity`, `date`) VALUES
(1, 4, 'bedsheet', '100', NULL, '', '2024-09-04 06:12:58', NULL, NULL, 0, '0000-00-00'),
(2, 6, 'Blades', '100', NULL, 'ok', '2024-09-04 06:13:20', NULL, NULL, 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE `item_category` (
  `id` int NOT NULL,
  `item_category` varchar(255) NOT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `item_category`
--

INSERT INTO `item_category` (`id`, `item_category`, `is_active`, `description`, `created_at`) VALUES
(1, 'Syringe Packs', 'yes', '(MPL) is a contract manufacturer of human and veterinary drug, medical device, and cosmetic products specializing in multiple non-sterile syringe packaging solutions. .Syringes can be filled with powder, semi-solids and liquid dosage forms at volumes from', '2024-05-30 07:46:13'),
(2, 'Cotton Packs', 'yes', '', '2024-05-30 07:46:36'),
(3, 'Medical Equipment', 'yes', '', '2024-05-30 07:46:45'),
(4, 'Bed Sheets', 'yes', '', '2024-05-30 07:46:58'),
(5, 'Uniforms', 'yes', '', '2024-05-30 07:47:08'),
(6, 'Surgical blades', 'yes', '', '2024-05-30 07:47:17'),
(7, 'Automatic Blood Pressure Cuff', 'yes', '', '2024-05-30 07:47:27');

-- --------------------------------------------------------

--
-- Table structure for table `item_issue`
--

CREATE TABLE `item_issue` (
  `id` int NOT NULL,
  `issue_type` varchar(15) DEFAULT NULL,
  `issue_to` varchar(100) DEFAULT NULL,
  `issue_by` varchar(100) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `item_category_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `note` text NOT NULL,
  `is_returned` int NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` varchar(10) DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `item_issue`
--

INSERT INTO `item_issue` (`id`, `issue_type`, `issue_to`, `issue_by`, `issue_date`, `return_date`, `item_category_id`, `item_id`, `quantity`, `note`, `is_returned`, `created_at`, `is_active`) VALUES
(9, '3', '3', 'Super Admin', '2024-08-21', '2024-08-21', 4, 1, 10, '', 0, '2024-08-21 12:03:49', 'no'),
(10, '3', '3', 'Super Admin', '2024-08-21', '2024-09-04', 4, 1, 10, '', 0, '2024-09-04 06:13:52', 'no'),
(11, '2', '8', 'Super Admin', '2024-08-21', '2024-08-21', 4, 1, 10, '', 1, '2024-08-21 12:18:59', 'no'),
(12, '3', '3', 'Super Admin', '2024-09-05', '2024-09-04', 6, 2, 20, '', 0, '2024-09-04 06:18:33', 'no'),
(13, '3', '5', 'Super Admin', '2024-09-04', '2024-09-05', 6, 2, 1, '', 1, '2024-09-04 06:18:27', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `item_stock`
--

CREATE TABLE `item_stock` (
  `id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `symbol` varchar(10) NOT NULL DEFAULT '+',
  `store_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `purchase_price` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `attachment` varchar(250) DEFAULT NULL,
  `description` text NOT NULL,
  `is_active` varchar(10) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `item_stock`
--

INSERT INTO `item_stock` (`id`, `item_id`, `supplier_id`, `symbol`, `store_id`, `quantity`, `purchase_price`, `date`, `attachment`, `description`, `is_active`, `created_at`) VALUES
(5, 1, 1, '+', 1, 50, '100', '2024-08-21', NULL, '', 'yes', '2024-08-21 12:10:30'),
(6, 2, 2, '+', 3, 20, '400', '2024-09-04', 'uploads/inventory_items/6.png', 'ok', 'yes', '2024-09-04 05:56:15'),
(7, 2, 2, '+', 1, 1, '200', '2024-09-03', 'uploads/inventory_items/7.jpg', '', 'yes', '2024-09-05 12:08:39');

-- --------------------------------------------------------

--
-- Table structure for table `item_store`
--

CREATE TABLE `item_store` (
  `id` int NOT NULL,
  `item_store` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `item_store`
--

INSERT INTO `item_store` (`id`, `item_store`, `code`, `description`) VALUES
(1, 'Ecopharm Pharmacy', '2342', ''),
(2, 'Guardian Health', '3454', ''),
(3, 'Jubilee Insurance Health Pharmacy', '567', ''),
(4, 'Capital Shoppers Pharmacy', '789', '');

-- --------------------------------------------------------

--
-- Table structure for table `item_supplier`
--

CREATE TABLE `item_supplier` (
  `id` int NOT NULL,
  `item_supplier` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_person_name` varchar(255) NOT NULL,
  `contact_person_phone` varchar(255) NOT NULL,
  `contact_person_email` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `item_supplier`
--

INSERT INTO `item_supplier` (`id`, `item_supplier`, `phone`, `email`, `address`, `contact_person_name`, `contact_person_phone`, `contact_person_email`, `description`) VALUES
(1, 'Dovuya Pharmacy', '+9654437666', 'dovuya@gmail.com', 'Kisementi, Kampala, Uganda', '', '+9654437666', '', ''),
(2, 'Medipoint Pharmacy', '+9624567754', 'medipoint@acaciamall.com', ' Acacia Mall, Kisementi, Kampala, Uganda', '', '+9624344565', '', ''),
(3, 'Capital Shoppers Pharmacy', '+9625436788', 'info@capitalshoppers.co.ug', 'Located in Capital Shoppers Nakawa, Ntinda, and other locations', '', '+9655436788', '', ''),
(4, 'Lucent Pharmacy', '+9627678666', 'info@lucent.com', 'Plot no 15, School street, Zarqa city, Jordan', 'Wail Fatayer', '+9627678666', 'info@lucent.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `lab`
--

CREATE TABLE `lab` (
  `id` int NOT NULL,
  `lab_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `lab`
--

INSERT INTO `lab` (`id`, `lab_name`) VALUES
(2, 'X-ray'),
(3, 'Magnetic Resonance Imaging (MRI)'),
(4, 'Magnetic Resonance Angiogram (MRA)'),
(5, 'Ultrasound'),
(6, 'Color Doppler'),
(7, 'Computed Tomography (CT Scan)'),
(8, 'Mammography'),
(9, 'PET Scan'),
(10, 'Bone Density test'),
(11, 'Biopsy'),
(12, 'Fluoroscopy');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int NOT NULL,
  `language` varchar(50) DEFAULT NULL,
  `short_code` varchar(100) NOT NULL,
  `is_deleted` varchar(10) NOT NULL DEFAULT 'yes',
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES
(1, 'Azerbaijan', '', 'no', 'no', '2024-09-11 11:48:07'),
(2, 'Albanian', '', 'no', 'no', '2017-04-06 05:08:33'),
(4, 'English', 'en', 'no', 'yes', '2024-09-11 11:57:07'),
(5, 'Arabic', '', 'no', 'yes', '2024-09-11 11:57:19'),
(7, 'Afrikaans', '', 'no', 'no', '2017-04-06 05:08:33'),
(8, 'Basque', '', 'no', 'no', '2017-04-06 05:08:33'),
(11, 'Bengali', '', 'no', 'no', '2017-04-06 05:08:33'),
(13, 'Bosnian', '', 'no', 'no', '2017-04-06 05:08:33'),
(14, 'Welsh', '', 'no', 'no', '2017-04-06 05:08:33'),
(15, 'Hungarian', '', 'no', 'no', '2017-04-06 05:08:33'),
(16, 'Vietnamese', '', 'no', 'no', '2017-04-06 05:08:33'),
(17, 'Haitian (Creole)', '', 'no', 'no', '2017-04-06 05:08:33'),
(18, 'Galician', '', 'no', 'no', '2017-04-06 05:08:33'),
(19, 'Dutch', '', 'no', 'no', '2017-04-06 05:08:33'),
(21, 'Greek', '', 'no', 'no', '2017-04-06 05:08:33'),
(22, 'Georgian', '', 'no', 'no', '2017-04-06 05:08:33'),
(23, 'Gujarati', '', 'no', 'no', '2017-04-06 05:08:33'),
(24, 'Danish', '', 'no', 'no', '2017-04-06 05:08:33'),
(25, 'Hebrew', '', 'no', 'no', '2017-04-06 05:08:33'),
(26, 'Yiddish', '', 'no', 'no', '2017-04-06 05:08:33'),
(27, 'Indonesian', '', 'no', 'no', '2017-04-06 05:08:33'),
(28, 'Irish', '', 'no', 'no', '2017-04-06 05:08:33'),
(29, 'Italian', 'it', 'no', 'no', '2018-12-01 10:07:03'),
(30, 'Icelandic', '', 'no', 'no', '2017-04-06 05:08:33'),
(31, 'Spanish', 'es', 'no', 'no', '2018-12-01 10:09:37'),
(33, 'Kannada', '', 'no', 'no', '2017-04-06 05:08:33'),
(34, 'Catalan', '', 'no', 'no', '2017-04-06 05:08:33'),
(36, 'Chinese', '', 'no', 'no', '2017-04-06 05:08:33'),
(37, 'Korean', '', 'no', 'no', '2017-04-06 05:08:33'),
(38, 'Xhosa', '', 'no', 'no', '2017-04-06 05:08:33'),
(39, 'Latin', '', 'no', 'no', '2017-04-06 05:08:33'),
(40, 'Latvian', '', 'no', 'no', '2017-04-06 05:08:33'),
(41, 'Lithuanian', '', 'no', 'no', '2017-04-06 05:08:33'),
(43, 'Malagasy', '', 'no', 'no', '2017-04-06 05:08:33'),
(44, 'Malay', '', 'no', 'no', '2017-04-06 05:08:33'),
(45, 'Malayalam', '', 'no', 'no', '2017-04-06 05:08:33'),
(46, 'Maltese', '', 'no', 'no', '2017-04-06 05:08:33'),
(47, 'Macedonian', '', 'no', 'no', '2017-04-06 05:08:33'),
(48, 'Maori', '', 'no', 'no', '2017-04-06 05:08:33'),
(49, 'Marathi', '', 'no', 'no', '2017-04-06 05:08:33'),
(51, 'Mongolian', '', 'no', 'no', '2017-04-06 05:08:33'),
(52, 'German', '', 'no', 'no', '2017-04-06 05:08:33'),
(53, 'Nepali', '', 'no', 'no', '2017-04-06 05:08:33'),
(54, 'Norwegian', '', 'no', 'no', '2017-04-06 05:08:33'),
(55, 'Punjabi', '', 'no', 'no', '2017-04-06 05:08:33'),
(57, 'Persian', '', 'no', 'no', '2017-04-06 05:08:33'),
(59, 'Portuguese', '', 'no', 'no', '2017-04-06 05:08:33'),
(60, 'Romanian', '', 'no', 'no', '2017-04-06 05:08:33'),
(61, 'Russian', '', 'no', 'no', '2017-04-06 05:08:33'),
(62, 'Cebuano', '', 'no', 'no', '2017-04-06 05:08:33'),
(64, 'Sinhala', '', 'no', 'no', '2017-04-06 05:08:33'),
(65, 'Slovakian', '', 'no', 'no', '2017-04-06 05:08:33'),
(66, 'Slovenian', '', 'no', 'no', '2017-04-06 05:08:33'),
(67, 'Swahili', '', 'no', 'no', '2017-04-06 05:08:33'),
(68, 'Sundanese', '', 'no', 'no', '2017-04-06 05:08:33'),
(70, 'Thai', '', 'no', 'no', '2017-04-06 05:08:33'),
(71, 'Tagalog', '', 'no', 'no', '2017-04-06 05:08:33'),
(72, 'Tamil', '', 'no', 'no', '2017-04-06 05:08:33'),
(74, 'Telugu', '', 'no', 'no', '2017-04-06 05:08:33'),
(75, 'Turkish', '', 'no', 'no', '2017-04-06 05:08:33'),
(77, 'Uzbek', '', 'no', 'no', '2017-04-06 05:08:33'),
(79, 'Urdu', '', 'no', 'no', '2017-04-06 05:08:33'),
(80, 'Finnish', '', 'no', 'no', '2017-04-06 05:08:33'),
(81, 'French', 'fr', 'no', 'no', '2018-12-01 10:08:47'),
(82, 'Hindi', '', 'no', 'no', '2017-04-06 05:08:33'),
(84, 'Czech', '', 'no', 'no', '2017-04-06 05:08:33'),
(85, 'Swedish', '', 'no', 'no', '2017-04-06 05:08:33'),
(86, 'Scottish', '', 'no', 'no', '2017-04-06 05:08:33'),
(87, 'Estonian', '', 'no', 'no', '2017-04-06 05:08:33'),
(88, 'Esperanto', '', 'no', 'no', '2017-04-06 05:08:33'),
(89, 'Javanese', '', 'no', 'no', '2017-04-06 05:08:33'),
(90, 'Japanese', '', 'no', 'no', '2017-04-06 05:08:33'),
(91, 'Odia', '', 'yes', 'no', '2020-12-22 05:33:23');

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` int NOT NULL,
  `type` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `type`, `is_active`) VALUES
(1, 'CL', 'yes'),
(2, 'EL', 'yes'),
(3, 'MEDICAL LEAVE', 'yes'),
(4, 'EMERGENCY LEAVE', 'yes'),
(5, 'MATERNITY LEAVE', 'yes'),
(6, 'HOLIDAY', 'yes'),
(7, 'ON DUTY', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_bad_stock`
--

CREATE TABLE `medicine_bad_stock` (
  `id` int NOT NULL,
  `pharmacy_id` int NOT NULL,
  `outward_date` date NOT NULL,
  `expiry_date` varchar(200) NOT NULL,
  `batch_no` varchar(200) NOT NULL,
  `quantity` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `medicine_batch_details`
--

CREATE TABLE `medicine_batch_details` (
  `id` int NOT NULL,
  `supplier_bill_basic_id` varchar(100) NOT NULL,
  `medicine_category_id` varchar(200) NOT NULL,
  `pharmacy_id` int NOT NULL,
  `inward_date` datetime NOT NULL,
  `expiry_date` varchar(100) DEFAULT NULL,
  `expiry_date_format` date NOT NULL,
  `batch_no` varchar(100) NOT NULL,
  `packing_qty` varchar(100) NOT NULL,
  `purchase_rate_packing` varchar(100) NOT NULL,
  `quantity` varchar(200) NOT NULL,
  `mrp` varchar(11) DEFAULT NULL,
  `purchase_price` varchar(200) NOT NULL,
  `sale_rate` varchar(11) DEFAULT NULL,
  `batch_amount` decimal(10,2) NOT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `available_quantity` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `medicine_batch_details`
--

INSERT INTO `medicine_batch_details` (`id`, `supplier_bill_basic_id`, `medicine_category_id`, `pharmacy_id`, `inward_date`, `expiry_date`, `expiry_date_format`, `batch_no`, `packing_qty`, `purchase_rate_packing`, `quantity`, `mrp`, `purchase_price`, `sale_rate`, `batch_amount`, `amount`, `available_quantity`, `created_at`) VALUES
(1, '1', '1', 1, '2024-09-24 18:04:00', 'Aug/2026', '0000-00-00', '1234', '', '', '100', '110', '100', '110', 0.00, '10000', '74', '2024-09-24 12:36:28'),
(2, '1', '1', 1, '2024-09-24 18:04:00', 'Feb/2025', '0000-00-00', '789', '', '', '50', '250', '250', '250', 0.00, '12500', '30', '2024-09-24 12:36:28'),
(3, '2', '1', 1, '2024-09-26 13:16:00', 'Jun/2024', '0000-00-00', '2121', '2', '', '2', '2', '2', '2', 0.00, '4', '2', '2024-09-26 07:46:58'),
(4, '3', '1', 1, '2024-09-26 13:18:00', 'Feb/2024', '0000-00-00', '1', '1', '', '1', '1', '1', '1', 1.00, '1', '1', '2024-09-26 07:48:54'),
(5, '4', '1', 1, '2024-09-26 17:58:00', 'Oct/2024', '0000-00-00', '101', '1', '', '1', '1', '1', '1', 0.00, '1', '1', '2024-09-26 12:29:58'),
(6, '5', '1', 1, '1979-08-17 15:10:00', 'Feb/2028', '0000-00-00', '123', '10', '', '20', '100', '60', '90', 1000.00, '1200', '20', '2024-09-30 09:36:14'),
(7, '5', '1', 1, '1979-08-17 15:10:00', 'Jun/2026', '0000-00-00', '452', '23', '', '20', '50', '40', '45', 500.00, '800', '20', '2024-09-30 09:36:14');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_category`
--

CREATE TABLE `medicine_category` (
  `id` int NOT NULL,
  `medicine_category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `medicine_category`
--

INSERT INTO `medicine_category` (`id`, `medicine_category`) VALUES
(1, 'Syrup'),
(2, 'Capsule'),
(3, 'Injection'),
(4, 'Ointment'),
(5, 'Cream'),
(6, 'Surgical'),
(7, 'Drops'),
(8, 'Inhalers'),
(9, 'Implants / Patches	'),
(10, 'Liquid'),
(11, 'Preparations'),
(12, 'Diaper'),
(13, 'Tablet');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_dosage`
--

CREATE TABLE `medicine_dosage` (
  `id` int NOT NULL,
  `medicine_category_id` int NOT NULL,
  `dosage_form` varchar(100) NOT NULL,
  `dosage` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `medicine_dosage`
--

INSERT INTO `medicine_dosage` (`id`, `medicine_category_id`, `dosage_form`, `dosage`) VALUES
(1, 1, '', '1 drop');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `message` text,
  `send_mail` varchar(10) DEFAULT '0',
  `send_sms` varchar(10) DEFAULT '0',
  `is_group` varchar(10) DEFAULT '0',
  `is_individual` varchar(10) DEFAULT '0',
  `is_class` int NOT NULL DEFAULT '0',
  `group_list` text,
  `user_list` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`) VALUES
(1, 'Important Announcement', '<p>Please pay your bills.</p>', '0', '1', '1', '0', 0, '[]', NULL, '2024-08-09 09:29:11'),
(2, 'Ganesh Puja Celebration', '<p>We are requested to come Saturday for Ganesh Puja Celebration.<br></p>', '0', '1', '0', '1', 0, NULL, '[{\"category\":\"staff-2\",\"user_id\":\"25\",\"email\":\"rakhan.ali@gmail.com\",\"mobileno\":\"\"}]', '2024-09-04 04:45:49');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `notification_roles`
--

CREATE TABLE `notification_roles` (
  `id` int NOT NULL,
  `send_notification_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `is_active` int DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `notification_roles`
--

INSERT INTO `notification_roles` (`id`, `send_notification_id`, `role_id`, `is_active`, `created_at`) VALUES
(1, 1, 7, 0, '2024-08-09 07:36:35'),
(2, 1, 7, 0, '2024-08-09 07:36:35'),
(3, 2, 1, 0, '2024-09-04 04:39:37'),
(4, 2, 2, 0, '2024-09-04 04:39:37'),
(5, 2, 3, 0, '2024-09-04 04:39:37'),
(6, 2, 4, 0, '2024-09-04 04:39:37'),
(7, 2, 5, 0, '2024-09-04 04:39:37'),
(8, 2, 6, 0, '2024-09-04 04:39:37'),
(9, 2, 7, 0, '2024-09-04 04:39:37'),
(10, 2, 8, 0, '2024-09-04 04:39:37');

-- --------------------------------------------------------

--
-- Table structure for table `notification_setting`
--

CREATE TABLE `notification_setting` (
  `id` int NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `is_mail` varchar(10) DEFAULT '0',
  `is_sms` varchar(10) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `notification_setting`
--

INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `created_at`) VALUES
(5, 'login_credential', '1', '0', '2019-03-09 16:35:53'),
(6, 'patient_registration', '0', '0', '2018-12-26 07:38:55'),
(7, 'patient_discharged', '1', '0', '2019-03-09 16:35:53'),
(8, 'patient_revisit', '1', '0', '2019-03-09 16:35:53'),
(9, 'patient_discharge', '0', '0', '2018-12-23 12:54:57'),
(10, 'appointment', '1', '0', '2019-03-09 16:35:53'),
(11, 'opd_patient_registration', '1', '0', '2019-03-09 16:35:53'),
(12, 'ipd_patient_registration', '1', '0', '2019-03-09 16:35:53');

-- --------------------------------------------------------

--
-- Table structure for table `opd_billing`
--

CREATE TABLE `opd_billing` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `opd_id` int NOT NULL,
  `discount` int NOT NULL,
  `other_charge` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `gross_total` decimal(15,2) NOT NULL,
  `net_amount` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `generated_by` int NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `opd_billing`
--

INSERT INTO `opd_billing` (`id`, `patient_id`, `opd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`) VALUES
(2, 63, 1, 12, '80', '2024-09-19', 10.93, 229.43, 0.43, 150.00, 1, 'paid'),
(3, 74, 12, 0, '100', '2024-09-25', 0.00, 220.00, 0.00, 120.00, 1, 'paid'),
(4, 95, 33, 0, '0', '2024-10-15', 0.00, 100.00, -900.00, 100.00, 1, 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `opd_details`
--

CREATE TABLE `opd_details` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `opd_no` varchar(100) NOT NULL,
  `appointment_date` datetime NOT NULL,
  `case_type` varchar(200) NOT NULL,
  `casualty` varchar(200) NOT NULL,
  `symptoms` varchar(200) NOT NULL,
  `bp` varchar(200) NOT NULL,
  `height` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `pulse` varchar(255) NOT NULL,
  `temperature` varchar(255) NOT NULL,
  `respiration` varchar(255) NOT NULL,
  `pre_medical_issue` varchar(255) NOT NULL,
  `known_allergies` varchar(200) NOT NULL,
  `note_remark` varchar(225) DEFAULT NULL,
  `refference` varchar(100) NOT NULL,
  `cons_doctor` int NOT NULL,
  `organisation` int NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `payment_mode` varchar(200) NOT NULL,
  `cheque_no` varchar(200) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `payment_doc` text NOT NULL,
  `header_note` varchar(200) NOT NULL,
  `footer_note` varchar(200) NOT NULL,
  `generated_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `opd_details`
--

INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `pre_medical_issue`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `organisation`, `amount`, `tax`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_doc`, `header_note`, `footer_note`, `generated_by`) VALUES
(2, 64, 'OPDN2', '2024-09-17 15:48:00', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 6, 600.00, 0.00, 'Cheque', '101', '2024-09-09', '', '', '', 1),
(4, 70, 'OPDN3', '2024-09-20 15:19:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 6, 500.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1),
(5, 69, 'OPDN5', '2024-09-23 16:05:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 4, 0, 100.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1),
(6, 64, 'OPDN6', '2024-11-06 16:28:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Cheque', '101', '2024-09-04', '', '', '', 1),
(7, 64, 'OPDN7', '2024-09-16 16:32:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Transfer to Bank Account', '', '0000-00-00', '', '', '', 1),
(8, 64, 'OPDN8', '2024-09-16 16:13:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1),
(9, 64, 'OPDN9', '2024-09-09 16:14:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1),
(10, 64, 'OPDN10', '2024-09-23 16:17:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1),
(11, 64, 'OPDN11', '2024-09-24 16:19:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Cheque', '123', '2024-09-24', '', '', '', 1),
(12, 74, 'OPDN12', '2024-09-25 12:37:00', '101', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1),
(13, 75, 'OPDN13', '2024-09-27 11:48:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Cheque', '123', '2024-09-26', 'uploads/payment_document/13.jpg', '', '', 1),
(14, 75, 'OPDN14', '2024-09-24 11:12:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Cheque', '101', '2024-09-11', '', '', '', 1),
(15, 52, 'OPDN15', '2024-09-26 11:27:00', '101', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Cheque', '123', '2024-09-26', '', '', '', 1),
(16, 69, 'OPDN16', '2024-09-09 11:45:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 4, 0, 500.00, 0.00, 'Cheque', '12', '2024-09-18', '', '', '', 1),
(17, 64, 'OPDN17', '2024-09-25 11:45:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1),
(18, 74, 'OPDN18', '2024-09-27 17:06:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1),
(19, 76, 'OPDN19', '2024-10-21 11:15:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1),
(20, 76, 'OPDN20', '2024-10-07 11:15:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1),
(21, 76, 'OPDN21', '2024-10-07 11:24:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1),
(22, 76, 'OPDN22', '2024-10-15 11:25:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1),
(23, 76, 'OPDN23', '2024-10-08 11:26:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1),
(24, 76, 'OPDN24', '2024-10-08 11:27:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 4, 0, 500.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1),
(25, 76, 'OPDN25', '2024-10-14 11:28:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1),
(26, 62, 'OPDN26', '2024-10-05 11:30:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1),
(27, 76, 'OPDN27', '2024-10-05 11:31:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1),
(28, 76, 'OPDN28', '2024-10-02 11:29:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 4, 0, 500.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1),
(29, 76, 'OPDN29', '2024-10-09 11:33:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1),
(30, 76, 'OPDN30', '2024-10-10 11:34:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1),
(31, 94, 'OPDN31', '2024-09-26 15:46:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 3, 0, 600.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1),
(32, 87, 'OPDN32', '2024-10-22 12:39:00', '244', 'Yes', '', '', '', '', '', '', '', '', '', '', '', 3, 6, 500.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1),
(33, 95, 'OPDN33', '2024-10-15 10:55:00', '', 'No', '', '', '', '', '', '', '', '', '', '', '', 6, 6, 500.00, 0.00, 'Cash', '', '0000-00-00', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `opd_patient_charges`
--

CREATE TABLE `opd_patient_charges` (
  `id` int NOT NULL,
  `date` date NOT NULL,
  `patient_id` int NOT NULL,
  `opd_id` int NOT NULL,
  `charge_id` int NOT NULL,
  `org_charge_id` int NOT NULL,
  `apply_charge` decimal(15,2) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `opd_patient_charges`
--

INSERT INTO `opd_patient_charges` (`id`, `date`, `patient_id`, `opd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES
(1, '2024-09-19', 63, 1, 23, 0, 150.00, '2024-09-19 00:00:00'),
(2, '2024-09-12', 63, 1, 21, 0, 100.00, '2024-09-20 00:00:00'),
(3, '2024-09-21', 64, 2, 20, 0, 100.00, '2024-09-21 00:00:00'),
(4, '2024-09-18', 74, 12, 24, 0, 120.00, '2024-09-25 00:00:00'),
(5, '2024-09-25', 74, 12, 21, 0, 100.00, '2024-09-25 00:00:00'),
(6, '2024-09-18', 52, 15, 15, 0, 1000.00, '2024-09-26 00:00:00'),
(7, '2024-09-03', 64, 17, 9, 0, 300.00, '2024-10-14 00:00:00'),
(8, '2024-10-03', 64, 17, 0, 0, 12.00, '2024-10-08 00:00:00'),
(9, '2024-10-15', 95, 33, 20, 0, 100.00, '2024-10-15 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `opd_payment`
--

CREATE TABLE `opd_payment` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `opd_id` int NOT NULL,
  `paid_amount` decimal(15,2) NOT NULL,
  `balance_amount` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `cheque_no` varchar(200) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `note` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `document` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `opd_payment`
--

INSERT INTO `opd_payment` (`id`, `patient_id`, `opd_id`, `paid_amount`, `balance_amount`, `total_amount`, `payment_mode`, `cheque_no`, `cheque_date`, `note`, `date`, `document`) VALUES
(1, 63, 1, 229.00, -79.00, 150.00, 'Cash', '', '0000-00-00', '', '2024-09-19', ''),
(2, 64, 2, 100.00, 0.00, 100.00, 'Cash', '', '0000-00-00', '', '2024-09-21', ''),
(3, 64, 2, 100.00, -200.00, 100.00, 'Cheque', 'dsf24356', '2024-09-20', '', '2024-09-20', ''),
(4, 69, 5, 12.00, -24.00, 0.00, 'Cheque', '101', '2024-09-03', '', '2024-09-17', ''),
(5, 70, 4, 100.00, -200.00, 0.00, 'Cheque', '12345', '2024-09-24', '', '2024-09-24', ''),
(6, 70, 4, 100.00, -200.00, 0.00, 'Cash', '', '0000-00-00', '', '2024-09-24', ''),
(7, 64, 9, 13.00, -13.00, 0.00, 'Cash', '', '0000-00-00', '', '2024-08-27', ''),
(8, 74, 12, 120.00, 0.00, 120.00, 'Cash', '', '0000-00-00', '', '2024-08-28', ''),
(9, 74, 12, 100.00, -100.00, 120.00, 'Cash', '', '0000-00-00', '', '2024-09-05', ''),
(10, 74, 12, 200.00, -200.00, 220.00, 'Cash', '', '0000-00-00', '', '2024-09-11', ''),
(11, 74, 12, 100.00, -300.00, 220.00, 'Cash', '', '0000-00-00', '', '2024-09-25', ''),
(12, 75, 13, 100.00, -100.00, 0.00, 'Cheque', '21', '2024-09-11', '', '2024-08-27', ''),
(13, 52, 15, 1222.00, -222.00, 1000.00, 'Cheque', '12', '2024-09-10', '', '2024-08-29', ''),
(14, 52, 15, 12.00, -234.00, 1000.00, 'Cash', '', '0000-00-00', '', '2024-09-12', ''),
(15, 64, 17, 12.00, 288.00, 300.00, 'Cash', '', '0000-00-00', '', '2024-09-12', ''),
(16, 64, 17, 100.00, 188.00, 300.00, 'Cash', '', '0000-00-00', '', '2024-08-26', ''),
(17, 64, 17, 100.00, 88.00, 300.00, 'Cash', '', '0000-00-00', '', '2024-09-17', ''),
(18, 64, 17, 100.00, -12.00, 300.00, 'Cheque', '17', '2024-09-18', '', '2024-09-03', ''),
(19, 95, 33, 1000.00, -900.00, 100.00, 'Cash', '', '0000-00-00', '', '2024-10-15', '');

-- --------------------------------------------------------

--
-- Table structure for table `operation_category`
--

CREATE TABLE `operation_category` (
  `id` int NOT NULL,
  `category_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `operation_list`
--

CREATE TABLE `operation_list` (
  `id` int NOT NULL,
  `operation_name` varchar(100) NOT NULL,
  `category` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `operation_theatre`
--

CREATE TABLE `operation_theatre` (
  `id` int NOT NULL,
  `bill_no` varchar(200) NOT NULL,
  `patient_id` int NOT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `charge_id` varchar(11) DEFAULT NULL,
  `code` varchar(11) NOT NULL,
  `operation_name` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `operation_type` varchar(100) DEFAULT NULL,
  `consultant_doctor` varchar(100) DEFAULT NULL,
  `ass_consultant_1` varchar(50) DEFAULT NULL,
  `ass_consultant_2` varchar(50) DEFAULT NULL,
  `anesthetist` varchar(50) DEFAULT NULL,
  `anaethesia_type` varchar(50) DEFAULT NULL,
  `ot_technician` varchar(100) DEFAULT NULL,
  `ot_assistant` varchar(100) DEFAULT NULL,
  `result` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `height` varchar(200) NOT NULL,
  `weight` varchar(200) NOT NULL,
  `bp` varchar(200) NOT NULL,
  `symptoms` varchar(200) NOT NULL,
  `apply_charge` decimal(15,2) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `cheque_no` varchar(200) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `payment_doc` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `operation_theatre`
--

INSERT INTO `operation_theatre` (`id`, `bill_no`, `patient_id`, `customer_type`, `charge_id`, `code`, `operation_name`, `date`, `operation_type`, `consultant_doctor`, `ass_consultant_1`, `ass_consultant_2`, `anesthetist`, `anaethesia_type`, `ot_technician`, `ot_assistant`, `result`, `remark`, `height`, `weight`, `bp`, `symptoms`, `apply_charge`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_doc`, `created_at`, `generated_by`) VALUES
(1, '1', 62, NULL, '4', '', 'Heart Operation', '2024-09-18', 'open heart surgery', '3', '', '', '', '', '', '', NULL, '', '', '', '', '', 100.00, '', NULL, NULL, '', '2024-09-18 11:27:01', 1),
(2, '2', 70, NULL, '4', '', 'Eye', '2024-09-23', 'Eye', '3', '', '', '', '', '', '', NULL, '', '', '', '', '', 100.00, 'Cheque', '12345', '2024-09-23', '', '2024-09-23 11:49:39', 1),
(3, '3', 69, NULL, '4', '', 'kidney', '2024-09-04', '', '3', '', '', '', '', '', '', NULL, '', '', '', '', '', 100.00, 'Cash', '', '0000-00-00', '', '2024-09-24 05:59:06', 1),
(4, '4', 95, NULL, '4', '4', 'brain surgery', '2024-10-15', 'brain ', '3', 'rekha', 'madhu', 'nalini', 'type2', 'tarini', 'abhinash', NULL, 'ok', '5.8', '65', '120/88', 'head reeling', 80.00, 'Cash', '', '0000-00-00', '', '2024-10-15 10:21:21', 1),
(5, '5', 95, NULL, '4', '4', 'Knee Replacement', '2024-10-16', 'Orthopedic Surgery', '3', 'Dacua mussa', 'Lophia mussa', 'Dr. Ahmad Suleiman', 'General Anesthesia', 'Mr. Sameer Hamed', 'Mr. Tariq Qadri', NULL, '', '', '', '', '', 100.02, 'Cash', '', '0000-00-00', '', '2024-10-15 10:44:51', 1),
(6, '6', 84, NULL, '4', '4', '4', '2024-10-15', '4', '3', '4', '', '', '', '', '', NULL, '', '', '', '', '', 100.00, 'Cash', '', '0000-00-00', '', '2024-10-15 11:10:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `organisation`
--

CREATE TABLE `organisation` (
  `id` int NOT NULL,
  `organisation_name` varchar(200) NOT NULL,
  `code` varchar(50) NOT NULL,
  `contact_no` varchar(200) NOT NULL,
  `address` varchar(300) NOT NULL,
  `contact_person_name` varchar(200) NOT NULL,
  `contact_person_phone` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `organisation`
--

INSERT INTO `organisation` (`id`, `organisation_name`, `code`, `contact_no`, `address`, `contact_person_name`, `contact_person_phone`) VALUES
(1, 'UAP Old Mutual', 'UAP1', '+9623451478', 'Plot 10, Kampala Road, Kampala\r\nKampala Central Business District,\r\nKampala, Uganda', 'Kwame Ssempala', '+9657712345'),
(2, 'AAR Health Services', 'AAR1', '+9657123412', 'House No. 23, Entebbe Road, Kajjansi\r\nWakiso District,\r\nUganda', 'Nalumansi Nakato', '+9654127845'),
(3, 'Nat Health ', 'NAT1', '+9656578951', 'House no. 20, Schools street, Wihdat city, Amman district, Jordan', 'Amzad Subeih', '+9656578951'),
(5, 'Crawford & CO.', 'CRA1', '+9624641118', 'Plot no 45, Al-Khalidi Street, Jabal Amman city, Amman state', 'Munther AI Safeen', '+9651187895'),
(6, 'Corvel Corporation', 'COV1', '+9626998871', 'Plot no 27, Al-Hussein Camp Street, Jabal Al-hussein City, Amman State, Jordan', 'Imad Hadad', '+9656998871');

-- --------------------------------------------------------

--
-- Table structure for table `organisations_charges`
--

CREATE TABLE `organisations_charges` (
  `id` int NOT NULL,
  `org_id` int NOT NULL,
  `charge_type` varchar(50) NOT NULL,
  `charge_id` int NOT NULL,
  `org_charge` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `organisations_charges`
--

INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES
(1, 1, 'Operation Theatre', 4, '90'),
(2, 2, 'Operation Theatre', 4, '80'),
(3, 3, 'Operation Theatre', 4, '0'),
(4, 4, 'Operation Theatre', 4, '0'),
(5, 5, 'Operation Theatre', 4, '0'),
(6, 6, 'Operation Theatre', 4, '0'),
(7, 7, 'Operation Theatre', 4, '0'),
(8, 11, 'Operation Theatre', 4, '0'),
(9, 13, 'Operation Theatre', 4, '0'),
(10, 1, 'Pathology', 5, '0'),
(11, 2, 'Pathology', 5, '0'),
(12, 3, 'Pathology', 5, '0'),
(13, 4, 'Pathology', 5, '0'),
(14, 5, 'Pathology', 5, '0'),
(15, 6, 'Pathology', 5, '0'),
(16, 7, 'Pathology', 5, '0'),
(17, 11, 'Pathology', 5, '0'),
(18, 13, 'Pathology', 5, '0'),
(19, 1, 'Radiology', 6, '0'),
(20, 2, 'Radiology', 6, '0'),
(21, 3, 'Radiology', 6, '0'),
(22, 4, 'Radiology', 6, '0'),
(23, 5, 'Radiology', 6, '0'),
(24, 6, 'Radiology', 6, '0'),
(25, 7, 'Radiology', 6, '0'),
(26, 11, 'Radiology', 6, '0'),
(27, 13, 'Radiology', 6, '0'),
(28, 13, 'Radiology', 8, '0'),
(29, 11, 'Radiology', 8, '0'),
(30, 7, 'Radiology', 8, '0'),
(31, 6, 'Radiology', 8, '0'),
(32, 5, 'Radiology', 8, '0'),
(33, 4, 'Radiology', 8, '0'),
(34, 3, 'Radiology', 8, '0'),
(35, 2, 'Radiology', 8, '0'),
(36, 1, 'Radiology', 8, '0'),
(37, 13, 'Pathology', 9, '0'),
(38, 11, 'Pathology', 9, '0'),
(39, 7, 'Pathology', 9, '0'),
(40, 6, 'Pathology', 9, '0'),
(41, 5, 'Pathology', 9, '0'),
(42, 4, 'Pathology', 9, '0'),
(43, 3, 'Pathology', 9, '0'),
(44, 2, 'Pathology', 9, '0'),
(45, 1, 'Pathology', 9, '0'),
(46, 13, 'Pathology', 10, '0'),
(47, 11, 'Pathology', 10, '0'),
(48, 7, 'Pathology', 10, '0'),
(49, 6, 'Pathology', 10, '0'),
(50, 5, 'Pathology', 10, '0'),
(51, 4, 'Pathology', 10, '0'),
(52, 3, 'Pathology', 10, '0'),
(53, 2, 'Pathology', 10, '0'),
(54, 1, 'Pathology', 10, '0'),
(55, 13, 'Pathology', 11, '0'),
(56, 11, 'Pathology', 11, '0'),
(57, 7, 'Pathology', 11, '0'),
(58, 6, 'Pathology', 11, '0'),
(59, 5, 'Pathology', 11, '0'),
(60, 4, 'Pathology', 11, '0'),
(61, 3, 'Pathology', 11, '0'),
(62, 2, 'Pathology', 11, '0'),
(63, 1, 'Pathology', 11, '0'),
(64, 13, 'Pathology', 12, '0'),
(65, 11, 'Pathology', 12, '0'),
(66, 7, 'Pathology', 12, '0'),
(67, 6, 'Pathology', 12, '0'),
(68, 5, 'Pathology', 12, '0'),
(69, 4, 'Pathology', 12, '0'),
(70, 3, 'Pathology', 12, '0'),
(71, 2, 'Pathology', 12, '0'),
(72, 1, 'Pathology', 12, '0'),
(73, 13, 'Radiology', 13, '0'),
(74, 11, 'Radiology', 13, '0'),
(75, 7, 'Radiology', 13, '0'),
(76, 6, 'Radiology', 13, '0'),
(77, 5, 'Radiology', 13, '0'),
(78, 4, 'Radiology', 13, '0'),
(79, 3, 'Radiology', 13, '0'),
(80, 2, 'Radiology', 13, '0'),
(81, 1, 'Radiology', 13, '0'),
(82, 13, 'Ambulance', 14, ''),
(83, 11, 'Ambulance', 14, ''),
(84, 7, 'Ambulance', 14, ''),
(85, 6, 'Ambulance', 14, ''),
(86, 5, 'Ambulance', 14, ''),
(87, 4, 'Ambulance', 14, ''),
(88, 3, 'Ambulance', 14, ''),
(89, 2, 'Ambulance', 14, ''),
(90, 1, 'Ambulance', 14, ''),
(91, 13, 'IPD', 15, ''),
(92, 11, 'IPD', 15, ''),
(93, 7, 'IPD', 15, ''),
(94, 6, 'IPD', 15, '200'),
(95, 5, 'IPD', 15, ''),
(96, 4, 'IPD', 15, ''),
(97, 3, 'IPD', 15, ''),
(98, 2, 'IPD', 15, ''),
(99, 1, 'IPD', 15, ''),
(100, 13, 'IPD', 16, ''),
(101, 11, 'IPD', 16, ''),
(102, 7, 'IPD', 16, ''),
(103, 6, 'IPD', 16, '100'),
(104, 5, 'IPD', 16, ''),
(105, 4, 'IPD', 16, ''),
(106, 3, 'IPD', 16, ''),
(107, 2, 'IPD', 16, ''),
(108, 1, 'IPD', 16, ''),
(109, 13, 'Ambulance', 17, ''),
(110, 11, 'Ambulance', 17, ''),
(111, 7, 'Ambulance', 17, ''),
(112, 6, 'Ambulance', 17, ''),
(113, 5, 'Ambulance', 17, ''),
(114, 4, 'Ambulance', 17, ''),
(115, 3, 'Ambulance', 17, ''),
(116, 2, 'Ambulance', 17, ''),
(117, 1, 'Ambulance', 17, ''),
(118, 13, 'Others', 18, ''),
(119, 11, 'Others', 18, ''),
(120, 7, 'Others', 18, ''),
(121, 6, 'Others', 18, '100'),
(122, 5, 'Others', 18, ''),
(123, 4, 'Others', 18, ''),
(124, 3, 'Others', 18, ''),
(125, 2, 'Others', 18, ''),
(126, 1, 'Others', 18, ''),
(127, 13, 'IPD', 19, ''),
(128, 11, 'IPD', 19, ''),
(129, 7, 'IPD', 19, ''),
(130, 6, 'IPD', 19, '100'),
(131, 5, 'IPD', 19, ''),
(132, 4, 'IPD', 19, ''),
(133, 3, 'IPD', 19, ''),
(134, 2, 'IPD', 19, ''),
(135, 1, 'IPD', 19, ''),
(136, 1, 'Supplier', 3, '0'),
(137, 2, 'Supplier', 3, '0'),
(138, 3, 'Supplier', 3, '0'),
(139, 4, 'Supplier', 3, '0'),
(140, 5, 'Supplier', 3, '0'),
(141, 6, 'Supplier', 3, '0'),
(142, 7, 'Supplier', 3, '0'),
(143, 11, 'Supplier', 3, '0'),
(144, 13, 'Supplier', 3, '0'),
(145, 13, 'Appointment', 20, ''),
(146, 11, 'Appointment', 20, ''),
(147, 7, 'Appointment', 20, ''),
(148, 6, 'Appointment', 20, '50.00'),
(149, 5, 'Appointment', 20, '0'),
(150, 4, 'Appointment', 20, ''),
(151, 3, 'Appointment', 20, '0'),
(152, 2, 'Appointment', 20, '0'),
(153, 1, 'Appointment', 20, '0'),
(154, 13, 'OPD', 21, ''),
(155, 11, 'OPD', 21, ''),
(156, 7, 'OPD', 21, ''),
(157, 6, 'OPD', 21, '100'),
(158, 5, 'OPD', 21, ''),
(159, 4, 'OPD', 21, ''),
(160, 3, 'OPD', 21, ''),
(161, 2, 'OPD', 21, ''),
(162, 1, 'OPD', 21, ''),
(163, 13, 'IPD', 22, ''),
(164, 11, 'IPD', 22, ''),
(165, 7, 'IPD', 22, ''),
(166, 6, 'IPD', 22, '100'),
(167, 5, 'IPD', 22, ''),
(168, 4, 'IPD', 22, ''),
(169, 3, 'IPD', 22, ''),
(170, 2, 'IPD', 22, ''),
(171, 1, 'IPD', 22, ''),
(172, 13, 'OPD', 23, ''),
(173, 11, 'OPD', 23, ''),
(174, 7, 'OPD', 23, ''),
(175, 6, 'OPD', 23, '100'),
(176, 5, 'OPD', 23, ''),
(177, 4, 'OPD', 23, ''),
(178, 3, 'OPD', 23, ''),
(179, 2, 'OPD', 23, ''),
(180, 1, 'OPD', 23, ''),
(181, 13, 'OPD', 24, '0'),
(182, 11, 'OPD', 24, '0'),
(183, 7, 'OPD', 24, '0'),
(184, 6, 'OPD', 24, '200'),
(185, 5, 'OPD', 24, '0'),
(186, 4, 'OPD', 24, '0'),
(187, 3, 'OPD', 24, '0'),
(188, 2, 'OPD', 24, '0'),
(189, 1, 'OPD', 24, '0'),
(190, 13, 'Bloodbank', 25, ''),
(191, 11, 'Bloodbank', 25, ''),
(192, 7, 'Bloodbank', 25, ''),
(193, 6, 'Bloodbank', 25, '100.00'),
(194, 5, 'Bloodbank', 25, '100'),
(195, 4, 'Bloodbank', 25, ''),
(196, 3, 'Bloodbank', 25, '100.00'),
(197, 2, 'Bloodbank', 25, '200'),
(198, 1, 'Bloodbank', 25, '100.00'),
(199, 1, 'Others', 7, '0'),
(200, 2, 'Others', 7, '0'),
(201, 3, 'Others', 7, '0'),
(202, 4, 'Others', 7, '0'),
(203, 5, 'Others', 7, '0'),
(204, 6, 'Others', 7, '0'),
(205, 7, 'Others', 7, '0'),
(206, 11, 'Others', 7, '0'),
(207, 13, 'Others', 7, '0'),
(208, 13, 'Pathology', 26, 'tg'),
(209, 11, 'Pathology', 26, 'cvf'),
(210, 7, 'Pathology', 26, 'ytr'),
(211, 6, 'Pathology', 26, 'df'),
(212, 5, 'Pathology', 26, 'rttr'),
(213, 4, 'Pathology', 26, 'tt'),
(214, 3, 'Pathology', 26, 'tt'),
(215, 2, 'Pathology', 26, 'ttb'),
(216, 1, 'Pathology', 26, '12'),
(217, 14, 'Appointment', 20, '30');

-- --------------------------------------------------------

--
-- Table structure for table `ot_consultant_register`
--

CREATE TABLE `ot_consultant_register` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `date` varchar(50) NOT NULL,
  `ins_date` date NOT NULL,
  `ins_time` time NOT NULL,
  `instruction` varchar(200) NOT NULL,
  `cons_doctor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ot_consultant_register`
--

INSERT INTO `ot_consultant_register` (`id`, `patient_id`, `date`, `ins_date`, `ins_time`, `instruction`, `cons_doctor`) VALUES
(2, 44, '2024-08-17 11:49:00', '2024-08-17', '00:00:00', 'take rest', 3),
(3, 44, '2024-08-17 11:52:00', '2024-08-17', '00:00:00', 'don\'t take cold water', 3),
(5, 59, '2024-09-03 18:28:00', '2024-09-03', '00:00:00', 'Don\'t walk after operation', 3),
(6, 70, '2024-09-23 17:24:00', '2024-09-23', '00:00:00', 'ok', 4),
(7, 95, '2024-10-15 16:14:00', '2024-10-06', '00:00:00', 'Take medicine before food', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pathology`
--

CREATE TABLE `pathology` (
  `id` int NOT NULL,
  `test_name` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `test_type` varchar(100) DEFAULT NULL,
  `pathology_category_id` varchar(11) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `sub_category` varchar(50) NOT NULL,
  `report_days` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `charge_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pathology`
--

INSERT INTO `pathology` (`id`, `test_name`, `short_name`, `test_type`, `pathology_category_id`, `unit`, `sub_category`, `report_days`, `method`, `charge_id`, `created_at`) VALUES
(1, 'Complete Blood Count', 'CBC', 'Blood Test', '3', '', 'Routine Hematology', '4', '', 12, '2024-08-08 05:36:43'),
(4, 'HIV Antibody Test', 'HIV', 'Blood Test', '3', '', 'Infection Test', '5', '', 12, '2024-08-17 05:41:58'),
(5, 'Blood Presure', 'BP', 'Blood Presure', '6', '', '', '4', '', 5, '2024-09-03 12:36:09');

-- --------------------------------------------------------

--
-- Table structure for table `pathology_category`
--

CREATE TABLE `pathology_category` (
  `id` int NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pathology_category`
--

INSERT INTO `pathology_category` (`id`, `category_name`) VALUES
(1, 'Clinical Microbiology	'),
(2, 'Clinical Chemistry	'),
(3, 'Hematology'),
(4, 'Molecular Diagnostics	'),
(5, 'Reproductive Biology	'),
(6, 'Electromagnetic Waves	');

-- --------------------------------------------------------

--
-- Table structure for table `pathology_parameter`
--

CREATE TABLE `pathology_parameter` (
  `id` int NOT NULL,
  `parameter_name` varchar(100) NOT NULL,
  `reference_range` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `pathology_report`
--

CREATE TABLE `pathology_report` (
  `id` int NOT NULL,
  `bill_no` varchar(200) NOT NULL,
  `ref_no` varchar(255) NOT NULL,
  `pathology_id` int NOT NULL,
  `patient_id` varchar(30) DEFAULT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `patient_name` varchar(100) DEFAULT NULL,
  `consultant_doctor` varchar(10) NOT NULL,
  `reporting_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pathology_report` varchar(255) DEFAULT NULL,
  `apply_charge` decimal(15,2) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `cheque_no` varchar(200) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `payment_doc` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pathology_report`
--

INSERT INTO `pathology_report` (`id`, `bill_no`, `ref_no`, `pathology_id`, `patient_id`, `customer_type`, `patient_name`, `consultant_doctor`, `reporting_date`, `description`, `pathology_report`, `apply_charge`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_doc`, `created_at`, `generated_by`) VALUES
(1, '1', 'PATHOB1', 5, '65', NULL, NULL, '3', '2024-09-25', '', '', 160.00, 'Cash', '', '0000-00-00', '', '2024-09-25 11:09:06', 1),
(2, '2', 'PATHOB2', 5, '75', NULL, NULL, '', '2024-09-04', '', '', 160.00, 'Cheque', '1', '2024-09-22', 'uploads/payment_document/2.jpg', '2024-09-26 08:08:30', 1),
(3, '3', 'PATHOB3', 5, '76', NULL, NULL, '', '2024-10-01', '', '', 160.00, 'Cash', '', '0000-00-00', '', '2024-10-05 06:33:35', 1),
(4, '4', 'PATHOB4', 1, '76', NULL, NULL, '3', '2024-10-08', '', '', 250.00, 'Cash', '', '0000-00-00', '', '2024-10-05 06:34:12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pathology_unit`
--

CREATE TABLE `pathology_unit` (
  `id` int NOT NULL,
  `unit_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pathology_unit`
--

INSERT INTO `pathology_unit` (`id`, `unit_name`) VALUES
(2, 'Micrometer (oi)');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int NOT NULL,
  `patient_unique_id` int NOT NULL,
  `admission_date` varchar(100) DEFAULT NULL,
  `patient_name` varchar(100) DEFAULT NULL,
  `age` varchar(10) NOT NULL,
  `month` varchar(200) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `marital_status` varchar(100) NOT NULL,
  `blood_group` varchar(200) NOT NULL,
  `identity_number` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_phone` varchar(100) DEFAULT NULL,
  `guardian_address` text,
  `guardian_email` varchar(100) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `discharged` varchar(100) NOT NULL,
  `patient_type` varchar(200) NOT NULL,
  `credit_limit` varchar(50) DEFAULT NULL,
  `organisation` varchar(100) NOT NULL,
  `known_allergies` varchar(200) NOT NULL,
  `old_patient` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `disable_at` date NOT NULL,
  `note` varchar(200) NOT NULL,
  `is_ipd` varchar(200) NOT NULL,
  `app_key` varchar(100) NOT NULL,
  `tpa` varchar(255) NOT NULL,
  `tpa_id` varchar(255) NOT NULL,
  `tpa_validity` varchar(255) NOT NULL,
  `alternative_no` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `identity_number`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`, `tpa`, `tpa_id`, `tpa_validity`, `alternative_no`) VALUES
(1, 1001, NULL, 'Alice Nakato', '31', '2', 'uploads/patient_images/no_image.png', '+9621232654', 'alice.nakato@example.com', '2024-05-15', 'Female', 'Single', 'A+', '', 'Plot 123, Kampala Road, Kampala, Uganda', 'John Nakato', NULL, NULL, '', 'yes', 'no', '', NULL, '13', 'Peanuts', '', '2024-09-25 11:21:04', '0000-00-00', 'ok', '', '', '', '', '', ''),
(2, 1002, NULL, 'Daniel Okech', '36', '7', 'uploads/patient_images/no_image.png', '+9623251452', 'daniel.okech@example.com', '1985-11-20', 'Male', 'Married', 'B-', '', 'Plot 456, Jinja Road, Jinja, Uganda', 'Mary Okech', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'Penicillin', '', '2024-08-03 10:03:33', '0000-00-00', 'None', '', '', '', '', '', ''),
(3, 1003, NULL, 'Sarah Namutebi', '26', '2', 'uploads/patient_images/no_image.png', '+9651425369', 'sarah.namutebi@example.com', '1998-03-10', 'Male', 'Single', 'AB+', '', 'Plot 789, Entebbe Road, Entebbe, Uganda', 'Joseph Namutebi', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'Dairy', '', '2024-09-25 11:21:04', '0000-00-00', 'None', '', '', '', '', '', ''),
(4, 1004, NULL, 'Peter Ssebunya', '43', '3', 'uploads/patient_images/no_image.png', '+9627845659', 'peter.ssebunya@example.com', '1980-08-25', 'Male', 'Separated', 'O-', '', 'Plot 101, Gulu Road, Gulu, Uganda', 'Grace Ssebunya', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'Shellfish', '', '2024-09-25 11:21:04', '0000-00-00', 'ok', '', '', '', '', '', ''),
(5, 1005, NULL, 'Grace Nakazibwe', '48', '7', 'uploads/patient_images/no_image.png', '+9627984562', 'grace.nakazibwe@example.com', '1975-12-05', 'Female', 'Married', 'A-', '', 'Plot 202, Mbarara Road, Mbarara, Uganda', 'Robert Nakazibwe', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'Gluten', '', '2024-09-25 11:21:04', '0000-00-00', 'ok', '', '', '', '', '', ''),
(6, 1006, NULL, 'Samuel Kato', '28', '4', 'uploads/patient_images/no_image.png', '+9621234652', 'samuel.kato@example.com', '1995-09-18', 'Male', 'Single', 'B+', '', 'Plot 303, Mbale Road, Mbale, Uganda', 'Ruth Kato', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'Pollen', '', '2024-08-03 10:02:41', '0000-00-00', 'None', '', '', '', '', '', ''),
(7, 1007, NULL, 'Esther Nalubega', '37', '1', 'uploads/patient_images/no_image.png', '+9656655445', 'esther.nalubega@example.com', '1987-04-30', 'Female', 'Married', 'O+', '', 'Plot 505, Masaka Road, Masaka, Uganda', 'David Nalubega', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'Pollen', '', '2024-08-03 10:02:27', '0000-00-00', 'None', '', '', '', '', '', ''),
(8, 1008, NULL, 'Moses Wasswa', '24', '4', 'uploads/patient_images/no_image.png', '+9657417417', 'moses.wasswa@example.com', '2000-01-12', 'Male', 'Single', 'AB-', '', 'Plot 404, Soroti Road, Soroti, Uganda', 'Sarah Wasswa', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'Latex', '', '2024-08-03 10:02:12', '0000-00-00', 'ok', '', '', '', '', '', ''),
(9, 1009, NULL, 'Joyce Nakato', '31', '1', 'uploads/patient_images/no_image.png', '+9651245796', 'joyce.nakato@example.com', '1992-06-28', 'Female', 'Separated', 'B-', '', 'Plot 606, Jinja Road, Jinja, Uganda', 'Charles Nakato', NULL, NULL, '', 'yes', 'yes', '', NULL, '', 'Seafood', '', '2024-09-25 11:21:04', '0000-00-00', 'ok', '', '', '', '', '', ''),
(10, 1010, NULL, 'Andrew Ssempa', '40', '6', 'uploads/patient_images/no_image.png', '+9624455661', 'andrew.ssempa@example.com', '1983-11-08', 'Male', 'Married', 'A+', '', 'Plot 707, Entebbe Road, Entebbe, Uganda', 'Rose Ssempa', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'Dust Mites', 'No', '2024-08-03 10:01:41', '0000-00-00', 'None', '', '', '', '', '', ''),
(11, 1011, NULL, 'John Kintu', '18', '3', 'uploads/patient_images/no_image.png', '+9657836985', 'john.kintu@example.com', '2024-05-16', 'Male', 'Single', 'AB+', '', 'Plot 12, Nakasero Road, Kampala, Uganda', 'Yoweri Museveni', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-03 10:01:28', '0000-00-00', '', '', '', '', '', '', ''),
(12, 1012, NULL, 'Mary Namutebi', '18', '4', 'uploads/patient_images/no_image.png', '+9658585857', 'mary.namutebi@example.com', '2024-05-08', 'Male', 'Single', 'O-', '', 'House 7, Bugolobi Flats, Bugolobi, Kampala, Uganda', 'Visuni', NULL, NULL, '', 'yes', 'yes', '', NULL, '', '', '', '2024-09-25 11:21:04', '0000-00-00', '', '', '', '', '', '', ''),
(13, 1013, NULL, 'Samuel Lwanga', '8', '5', 'uploads/patient_images/no_image.png', '+9651365987', 'samuel.lwanga@example.com', '2024-05-07', 'Male', 'Single', 'A+', '', '23 Entebbe Road, Kibuye, Kampala, Uganda', 'Jimmy Lwanga', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-03 10:01:04', '0000-00-00', '', '', '', '', '', '', ''),
(14, 1014, NULL, 'Sarah Nakato', '38', '3', 'uploads/patient_images/no_image.png', '+9624781245', 'sarah.nakato@example.com', '2024-05-07', 'Male', 'Married', 'B+', '', '45 Gaba Road, Kabalagala, Kampala, Uga', 'Rosemary  Nakato', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-03 10:00:46', '0000-00-00', '', '', '', '', '', '', ''),
(15, 1015, NULL, 'Peter Okello', '38', '3', 'uploads/patient_images/no_image.png', '+9624587965', 'peter.okello@example.com', '2024-05-15', 'Male', 'Married', 'AB+', '', '10 Jinja Road, Nakawa, Kampala, Uganda', 'Allen Okello', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-03 10:00:34', '0000-00-00', '', '', '', '', '', '', ''),
(16, 1016, NULL, 'Alice Nambooze', '23', '1', 'uploads/patient_images/no_image.png', '+9656589741', 'alice.nambooze@example.com', '2024-05-14', 'Female', 'Married', 'B+', '', '34 Bombo Road, Wandegeya, Kampala, Uganda', 'Eunice  Nambooze', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-03 10:00:21', '0000-00-00', '', '', '', '', '', '', ''),
(17, 1017, NULL, 'Michael Ssebagala', '32', '3', 'uploads/patient_images/no_image.png', '+9621452147', 'michael.ssebagala@example.com', '2024-05-15', 'Male', 'Married', 'AB-', '', '18 Kira Road, Ntinda, Kampala, Uganda', 'Doreen Ssebagala', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-03 10:00:08', '0000-00-00', '', '', '', '', '', '', ''),
(18, 1018, NULL, 'Grace Nakawunde', '55', '4', 'uploads/patient_images/no_image.png', '+9659854784', 'grace.nakawunde@example.com', '2024-05-14', 'Male', 'Married', 'O+', '', 'Plot 56, Lubowa Estate, Lubowa, Kampala, Uganda', 'Brenda Nakawunde', NULL, NULL, '', 'yes', 'yes', '', NULL, '', '', '', '2024-09-25 11:21:04', '0000-00-00', '', '', '', '', '', '', ''),
(19, 1019, NULL, 'Daniel Mukasa', '35', '5', 'uploads/patient_images/no_image.png', '+9657965412', 'daniel.mukasa@example.com', '2024-05-07', 'Male', 'Married', 'AB+', '', '21 Makerere Hill Road, Makerere, Kampala, Uganda', 'Oliv Mukasa', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-03 09:59:35', '0000-00-00', '', '', '', '', '', '', ''),
(20, 1020, NULL, 'Esther Nanyonga', '25', '6', 'uploads/patient_images/no_image.png', '+9656765456', 'esther.nanyonga@example.com', '2024-05-06', 'Female', 'Married', 'B-', '', '21 Makerere Hill Road, Makerere, Kampala, Uganda', ' luve Nanyonga', NULL, NULL, '', 'yes', 'no', '', NULL, '2', '', '', '2024-09-25 11:21:04', '0000-00-00', '', '', '', '', '', '', ''),
(25, 1022, NULL, 'Ramesh Sippy', '24', '0', 'uploads/patient_images/no_image.png', '+9651144778', 'ramesh@gmail.com', '2000-08-02', 'Male', 'Single', 'O+', '', '', 'Dinesh Sippy', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-05 06:32:50', '0000-00-00', '', '', '', '', '', '', ''),
(28, 1025, NULL, 'Amjad Subeih', '40', '6', 'uploads/patient_images/no_image.png', '+9655678912', 'amjad@gmail.com', '1984-02-03', 'Male', 'Married', 'AB+', '', 'Irbid', 'Zaher Subeih', NULL, NULL, '', 'yes', 'no', '', NULL, '6', '', '', '2024-09-25 11:21:04', '0000-00-00', '', '', '', '', '', '', ''),
(29, 1026, NULL, 'Fatima', '24', '1', 'uploads/patient_images/no_image.png', '+9654662256', 'fatima@gmail.com', '2000-07-13', 'Female', 'Single', 'A+', '', '', 'Ahmad Khan', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-05 09:13:08', '0000-00-00', '', '', '', '', '', '', ''),
(30, 1027, NULL, 'Noor', '34', '4', 'uploads/patient_images/no_image.png', '+9655678223', 'noor@gmail.com', '1990-04-05', 'Female', 'Married', 'A+', '', '', 'Ali', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-05 09:18:51', '0000-00-00', '', '', '', '', '', '', ''),
(31, 1028, NULL, 'Ashid Sayed', '34', '1', 'uploads/patient_images/no_image.png', '+9651234567', 'ashid@gmail.com', '1990-07-29', 'Male', 'Single', 'O+', '', '', 'nalini sayed', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-05 09:29:39', '0000-00-00', '', '', '', '', '', '', ''),
(32, 1029, NULL, 'Raman Ali', '34', '0', 'uploads/patient_images/no_image.png', '+9651478965', 'raman@gmail.com', '1990-08-05', 'Male', 'Single', 'O+', '', '', 'Rashid Ali', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', 'Yes', '2024-08-05 12:47:35', '0000-00-00', '', '', '', '', '', '', ''),
(33, 1030, NULL, 'Noor Ali', '23', '3', 'uploads/patient_images/no_image.png', '+9654226784', 'noor@gmail.com', '2000-11-09', 'Female', 'Married', 'B+', '', '', 'Ali Zafar', NULL, NULL, '', 'yes', 'yes', '', NULL, '3', '', '', '2024-09-25 11:21:04', '0000-00-00', '', '', '', '', '', '', ''),
(34, 1031, NULL, 'Zaher Alkaseech', '44', '5', 'uploads/patient_images/no_image.png', '+9656234567', 'zaher@gmail.com', '1980-03-05', 'Male', 'Married', 'A+', '', 'Irbid', 'Muneer Alkaseech', NULL, NULL, '', 'yes', 'no', '', NULL, '13', '', 'Yes', '2024-08-06 10:31:10', '0000-00-00', '', '', '', '', '', '', ''),
(36, 1033, NULL, 'Sonal', '24', '4', 'uploads/patient_images/no_image.png', '+9657898675', 'sonal@gmail.com', '2000-04-11', 'Female', 'Single', 'B+', '', 'Bhubaneswar', 'subhdeep', NULL, NULL, '', 'yes', 'yes', '', NULL, '', '', 'No', '2024-09-25 11:21:04', '0000-00-00', '', '', '', '', '', '', ''),
(38, 1035, NULL, 'Sakshi', '25', '5', 'uploads/patient_images/no_image.png', '+9659876879', 'sakshi@gmail.com', '1999-03-17', 'Female', 'Single', 'O+', '', 'Cuttack', 'Jayanta', NULL, NULL, '', 'yes', 'no', '', NULL, '13', '', '', '2024-09-25 11:21:04', '0000-00-00', '', '', '', '', '', '', ''),
(41, 1038, NULL, 'Babar Saheb', '64', '6', 'uploads/patient_images/no_image.png', '+9656768668', '', '1960-02-02', '', 'Married', 'A+', '', '', 'Monural Saheb', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-13 11:43:22', '0000-00-00', '', '', '', '', '', '', ''),
(42, 1039, NULL, 'Abdullah Al-Sabah', '8u', 'jk', 'uploads/patient_images/no_image.png', '+9656096844', 'abdullah.sabah@gmail.com', '2024-08-24', 'Male', '', '', '', '', 'Sabab Al-Hajeri', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-14 05:25:27', '0000-00-00', 'ok', '', '', '', '', '', ''),
(43, 1040, NULL, 'Yousef Al-Shamari', '12', '45', 'uploads/patient_images/no_image.png', '+9656334224', 'yousef.shamari@gmail.com', '2024-08-08', 'Male', 'Married', '', '', '', 'Mussef Al-Shamari', NULL, NULL, '', 'yes', 'yes', '', NULL, '5', '', 'No', '2024-09-25 11:21:04', '0000-00-00', '', '', '', '', '', '', ''),
(44, 1041, NULL, 'Amir Al-Husseini', '44', '7', 'uploads/patient_images/44.png', '+9656873566', 'amir.husseini@gmail.com', '1980-01-29', 'Male', 'Married', 'B+', '', '', 'Fakir Al-Husseini', NULL, NULL, '', 'yes', 'yes', '', NULL, '5', '', '', '2024-09-25 11:21:04', '0000-00-00', 'ok', '', '', '', '', '', ''),
(45, 1042, NULL, 'Abdullah Al-Sarhan', '64', '6', 'uploads/patient_images/45.png', '+9626565444', 'Abdullah.arhan@gmail.com', '1960-02-10', 'Male', 'Married', 'A+', '', 'Jordan', 'Ballar Al-Sarhan', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', 'Yes', '2024-09-25 11:21:04', '0000-00-00', '', '', '', '', '', '', ''),
(46, 1043, NULL, 'Rami Al-Ahmad', '44', '5', 'uploads/patient_images/no_image.png', '+9658678655', 'rami.ahmad@gmail.com', '1980-03-06', 'Male', '', '', '', '', 'kudiya AI-Ahmad', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-09-25 11:21:04', '0000-00-00', '', '', '', '', '', '', ''),
(47, 1044, NULL, 'Omar Al-Najjar', '29', '7', 'uploads/patient_images/47.png', '+9655867677', 'Omar.najjar@gmail.com', '1995-01-02', 'Male', 'Married', 'B+', '', 'Building 45 Amman, Jordan, 11181 ', 'Samirin  Al-Najjar', NULL, NULL, '', 'yes', 'yes', '', NULL, '', '', 'No', '2024-09-25 11:21:04', '0000-00-00', 'ok', '', '', '', '', '', ''),
(48, 1045, NULL, 'Isha', '23', '4', 'uploads/patient_images/no_image.png', '+9659087654', '', '2001-04-11', 'Female', 'Single', 'B+', '', 'Bhubaneswar', 'Shankar', NULL, NULL, '', 'yes', 'yes', '', NULL, '', '', 'No', '2024-09-25 11:21:04', '0000-00-00', '', '', '', '', '', '', ''),
(49, 1046, NULL, 'Sheikh Asif Noor', '', '', 'uploads/patient_images/no_image.png', '+9657896541', 'sheikh@gmail.com', '0000-00-00', 'Male', '', '', '', '', 'Sheikh Hamid Noor', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', 'Yes', '2024-09-25 11:21:04', '0000-00-00', '', '', '', '', '', '', ''),
(51, 1048, NULL, 'Imad Hadad', '64', '5', 'uploads/patient_images/no_image.png', '+9658765444', '', '1960-03-02', 'Male', 'Single', 'A+', '', '', 'Solar Hadad', NULL, NULL, '', 'yes', 'no', '', NULL, '5', '', '', '2024-09-25 11:21:04', '0000-00-00', '', '', '', '', '', '', ''),
(52, 1049, NULL, 'ALEX', '0', '0', 'uploads/patient_images/no_image.png', '+9656766544', '', '2024-08-14', 'Male', '', '', '', '', 'FLEX', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-22 07:05:21', '0000-00-00', '', '', '', '', '', '', ''),
(53, 1050, NULL, 'Shreeya', '44', '7', 'uploads/patient_images/no_image.png', '+9656876568', '', '1980-01-30', '', '', '', '', '', 'Sumann', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-09-06 05:41:04', '0000-00-00', 'ok', '', '', '', '', '', ''),
(54, 1051, NULL, 'eid', '0', '0', 'uploads/patient_images/no_image.png', '+9655522639', '', '2024-08-23', 'Male', 'Married', 'O+', '', '', 'nasser', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-09-25 11:21:04', '0000-00-00', '', '', '', '', '', '', ''),
(55, 1052, NULL, 'عيد', '41', '5', 'uploads/patient_images/no_image.png', '+9655522630', '', '1983-03-10', 'Male', 'متزوج', '', '', '', 'الام', NULL, NULL, '', 'yes', 'yes', '', NULL, '', '', 'No', '2024-09-25 11:21:04', '0000-00-00', '', '', '', '', '', '', ''),
(58, 1053, NULL, 'Raman Saikat Ali', '', '', 'uploads/patient_images/no_image.png', '+9656665543', '', '0000-00-00', 'Male', '', '', '', '', 'Samaba Ali', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-09-25 11:21:04', '0000-00-00', '', '', '', '', '', '', ''),
(59, 1054, NULL, 'Samrat Ali', '0bv', '1', 'uploads/patient_images/no_image.png', '+9656543543', '', '2024-08-05', '', '', '', '', '', '', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-09-25 11:21:04', '0000-00-00', '', '', '', '', '', '', ''),
(60, 1055, NULL, 'Kashmira', '24', '7', 'uploads/patient_images/no_image.png', '+9656565433', 'kashmira@gmail.com', '2000-02-11', 'Male', 'Single', 'AB+', '', 'Jordan', '', NULL, NULL, '', 'yes', 'yes', '', NULL, '', '', '', '2024-09-25 11:21:04', '0000-00-00', 'ok', '', '', '', '', '', ''),
(61, 1056, NULL, 'Samrat Shaikh', '44', '7', 'uploads/patient_images/61.png', '+9656756787', '', '1980-02-28', 'Male', 'Married', 'A+', '', '', 'Rudra Shaikh', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-09-25 11:21:04', '0000-00-00', '', '', '', '', '', '', ''),
(62, 1057, NULL, 'Sara Ahmed Hassan Al-Khatib', '34', '7', 'uploads/patient_images/no_image.png', '+9657654343', '', '1990-02-09', 'Female', '', '', '', '', 'Ahmed Al-Khatib', NULL, NULL, '', 'yes', 'yes', '', NULL, '', '', '', '2024-09-25 11:21:04', '0000-00-00', '', '', '', '', '', '', ''),
(64, 1059, NULL, 'Roman Saif Ali', '', '', 'uploads/patient_images/no_image.png', '+9657566775', '', '2024-09-06', '', '', '', '40271841264', '', 'Saumyaan Saif Ali', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', 'No', '2024-09-25 11:21:04', '0000-00-00', '', '', '', '', '', '', ''),
(65, 1060, NULL, 'Harnath Sandu', '54', '7', 'uploads/patient_images/no_image.png', '+9656765788', '', '1970-02-26', 'Female', '', 'O+', '', '', 'Manonashak Sandu', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-09-25 11:24:51', '0000-00-00', '', '', '', '', '', '', ''),
(69, 1061, NULL, 'Haldar Shaikh', '55', '6', 'uploads/patient_images/no_image.png', '+9656776488', '', '1969-03-12', 'Male', 'Married', 'B+', '', '', 'Ruman Shaikh', NULL, NULL, '', 'yes', 'yes', '', NULL, '', '', '', '2024-10-07 09:25:35', '0000-00-00', '', 'yes', '', '', '', '', ''),
(70, 1062, NULL, 'Ahmad Mohammed Al-Jundi', '63', '6', 'uploads/patient_images/no_image.png', '+9658000123', 'ahmad.aljundi@gmail.com', '1961-03-02', 'Male', 'Married', 'B+', '1234567890', '14th King Hussein Street, Amman, Jordan', 'Fatima Al-Jundi', NULL, NULL, '', 'yes', 'yes', '', NULL, '', '', '', '2024-09-25 11:21:04', '0000-00-00', 'ok', '', '', '', '', '', ''),
(74, 1063, NULL, 'Noor Al Hussein', '20', '3', 'uploads/patient_images/no_image.png', '+9658787899', 'noor.hussein@gmail.com', '2004-06-16', 'Female', 'Single', 'A+', '7676786897', 'Amman', 'Abdullah IIn Bin AI Hussein', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-09-25 11:21:04', '0000-00-00', '', '', '', '', '', '', ''),
(76, 1065, NULL, 'Mastani', '29', '2', 'uploads/patient_images/76.png', '+9657654543', 'mastani@gmail.com', '1995-08-18', 'Male', 'Single', 'B+', '23322222222', '', 'Mohmmed Rafi', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', 'No', '2024-10-05 06:00:36', '0000-00-00', '', 'yes', '', '', '', '', ''),
(82, 1066, NULL, 'Baji Rao', '63', '8', 'uploads/patient_images/no_image.png', '+9657658934', '', '1961-02-01', 'Male', 'Single', 'B+', '', '', 'Balaji Viswanath Bhatt', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-10-07 06:54:58', '0000-00-00', '', '', '', '', '', '', '+965'),
(83, 1068, NULL, 'Mahmoud Hussein', '50', '3', 'uploads/patient_images/no_image.png', '7653366', 'r', NULL, 'Male', 'Married', 'B+', 'Jordan', 'ok', 'Nabah Ali', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-10-07 09:36:47', '0000-00-00', 'No', '', '', '', '', '', ''),
(84, 1070, NULL, 'Rafi', '50', '3', 'uploads/patient_images/no_image.png', '7653366', '', NULL, 'Male', 'Married', 'B+', 'Jordan', 'ok', 'Nabah Ali', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-10-07 09:54:05', '0000-00-00', 'No', '', '', '', '', '', ''),
(85, 1071, NULL, 'Jabargham Linkan', '0', '1', 'uploads/patient_images/no_image.png', '+9655444634', '', '2024-09-29', 'Male', '', '', '', 'jordan', 'Ibrahim Linkan', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-10-07 10:13:05', '0000-00-00', '', '', '', '', '', '07-10-2024', '+96533212121'),
(87, 1072, NULL, 'Abdullah', '5', '3', 'uploads/patient_images/87.png', '+9653454344', 'abdyu@gmail.com', '2019-07-11', 'Male', 'Single', 'O+', '243535533', 'jordan', 'Mohammad', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'no', '', '2024-10-07 10:30:59', '0000-00-00', 'ok', '', '', '5', '1245v432', '23-10-2024', '+9659222236'),
(90, 1073, NULL, 'ram', '123', '2', 'uploads/patient_images/no_image.png', '+9654568520', '', '1900-12-07', 'Male', 'Single', 'O+', '665               ', '', 'dashrath', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-10-19 04:58:11', '0000-00-00', '', '', '', '', '', '', '+965'),
(93, 1074, NULL, 'Ibram AI-Ulah', '34', '9', 'uploads/patient_images/no_image.png', '+9653454435', '', '1990-01-31', 'Male', 'Single', 'A+', '', '', 'Raman AI-Ulah', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-10-08 12:34:51', '0000-00-00', '', '', '', '', '', '', '+965'),
(95, 1075, NULL, 'Zaid Musa', '63', '7', 'uploads/patient_images/95.png', '+9656673678', 'zaid.mussa@gmail.com', '1961-03-01', 'Male', 'Single', 'B+', '3676787387', '', 'Mohammad Musa', NULL, NULL, '', 'yes', 'no', '', NULL, '5', '', '', '2024-10-15 05:17:42', '0000-00-00', '', 'yes', '', '3', '6376ghd', '02-10-2024', '+9654323');

-- --------------------------------------------------------

--
-- Table structure for table `patient_charges`
--

CREATE TABLE `patient_charges` (
  `id` int NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  `ipd_id` int NOT NULL,
  `charge_id` int DEFAULT NULL,
  `org_charge_id` int DEFAULT NULL,
  `apply_charge` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `patient_charges`
--

INSERT INTO `patient_charges` (`id`, `date`, `patient_id`, `ipd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES
(1, '2024-08-16', 44, 1, 15, 95, '1000.00', '2024-08-16 00:00:00'),
(2, '2024-08-16', 43, 2, 22, 167, '150.00', '2024-08-16 00:00:00'),
(3, '2024-08-16', 43, 3, 15, 95, '1000.00', '2024-08-16 00:00:00'),
(4, '2024-08-16', 43, 3, 15, 95, '1000.00', '2024-08-16 00:00:00'),
(5, '2024-08-31', 45, 4, 15, 0, '1000', '2024-08-17 00:00:00'),
(6, '2024-08-17', 43, 3, 5, 14, '160.00', '2024-08-17 00:00:00'),
(7, '2024-08-20', 35, 9, 22, 0, '150.00', '2024-08-20 00:00:00'),
(8, '2024-08-20', 49, 10, 15, 0, '1000.00', '2024-08-20 00:00:00'),
(9, '2024-08-07', 47, 6, 6, 0, '160.00', '2024-08-22 00:00:00'),
(10, '2024-08-15', 51, 11, 6, 23, '160.00', '2024-08-22 00:00:00'),
(11, '2024-08-23', 36, 1, 20, 0, '100.00', '2024-08-23 00:00:00'),
(13, '2024-08-28', 55, 2, 6, 0, ';l.', '2024-08-31 00:00:00'),
(14, '2024-08-28', 36, 1, 4, 0, '100.00', '2024-08-28 00:00:00'),
(15, '2024-08-29', 55, 2, 4, 0, '100.00', '2024-08-29 00:00:00'),
(16, '2024-08-29', 56, 4, 25, 0, '100.00', '2024-08-29 00:00:00'),
(17, '2024-08-31', 54, 3, 15, 0, 'ggfgf', '2024-08-31 00:00:00'),
(18, '2024-08-31', 55, 7, 20, 0, '100.00', '2024-08-31 00:00:00'),
(19, '2024-08-31', 59, 5, 15, 0, 'c', '2024-08-31 00:00:00'),
(20, '2024-08-06', 55, 7, 22, 0, '0', '2024-08-31 00:00:00'),
(23, '2024-08-30', 59, 6, 15, 0, 'gf', '2024-08-31 00:00:00'),
(24, '2024-08-30', 55, 2, 15, 0, '1000.00', '2024-08-31 00:00:00'),
(25, '2024-08-01', 59, 1, 9, 0, 'bg', '2024-09-03 00:00:00'),
(27, '2024-09-03', 54, 2, 9, 0, '300.00', '2024-09-03 00:00:00'),
(29, '2024-09-04', 58, 2, 16, 0, '500.00', '2024-09-04 00:00:00'),
(30, '2024-09-05', 62, 3, 16, 0, '500.00', '2024-09-05 00:00:00'),
(31, '2024-09-09', 60, 4, 20, 0, '100.00', '2024-09-09 00:00:00'),
(32, '2024-09-10', 62, 3, 7, 204, '3500', '2024-09-10 00:00:00'),
(33, '2024-09-10', 65, 6, 15, 94, '200', '2024-09-10 00:00:00'),
(34, '2024-09-10', 66, 7, 22, 167, '120', '2024-09-10 00:00:00'),
(35, '2024-09-18', 63, 1, 15, 0, '1000.00', '2024-09-18 00:00:00'),
(36, '2024-09-19', 28, 2, 16, 103, '100', '2024-09-20 00:00:00'),
(37, '2024-09-11', 61, 1, 24, 0, '120.00', '2024-09-20 00:00:00'),
(38, '2024-09-23', 70, 4, 5, 0, '160.00', '2024-09-23 00:00:00'),
(39, '2024-09-05', 70, 4, 19, 0, '150.00', '2024-09-23 00:00:00'),
(40, '2024-09-12', 69, 1, 15, 0, '1000.00', '2024-10-05 00:00:00'),
(42, '2024-10-02', 76, 6, 9, 0, '300.00', '2024-10-07 00:00:00'),
(43, '2024-10-07', 76, 6, 20, 0, '100.00', '2024-10-07 00:00:00'),
(44, '2024-10-14', 95, 7, 21, 158, '100.00', '2024-10-15 00:00:00'),
(45, '2024-10-08', 95, 7, 5, 14, '160.00', '2024-10-15 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `patient_timeline`
--

CREATE TABLE `patient_timeline` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` varchar(200) NOT NULL,
  `document` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `patient_timeline`
--

INSERT INTO `patient_timeline` (`id`, `patient_id`, `title`, `timeline_date`, `description`, `document`, `status`, `date`) VALUES
(2, 53, 'Drink water', '2024-08-23', '', '', 'yes', '2024-08-23'),
(3, 36, 'drink water', '2024-08-21', '', '', 'yes', '2024-08-23'),
(4, 55, 'TEst', '2024-08-29', 'test 1', '', 'yes', '2024-08-28'),
(5, 55, 'TEst2', '2024-08-30', 'test 2', '', 'yes', '2024-08-28'),
(6, 56, 'blood check', '2024-09-01', '', '', 'yes', '2024-08-29'),
(7, 61, 'EYE CHECKUP', '2024-09-03', '', '7.jpg', 'yes', '2024-09-03'),
(8, 62, 'eye test', '2024-09-06', 'ok', '', 'yes', '2024-09-05'),
(9, 58, 'drink water', '2024-09-10', '', '', 'yes', '2024-09-10'),
(10, 76, 'Recheckup after 3 months', '2024-10-02', 'ok', '10.jpg', 'yes', '2024-10-03');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `ipd_id` int NOT NULL,
  `paid_amount` decimal(15,2) NOT NULL,
  `balance_amount` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `cheque_no` varchar(200) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `payment_doc` text NOT NULL,
  `note` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `document` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `patient_id`, `ipd_id`, `paid_amount`, `balance_amount`, `total_amount`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_doc`, `note`, `date`, `document`) VALUES
(1, 28, 2, 789.00, -289.00, 500.00, 'Cheque', NULL, NULL, '', '', '2024-09-11', ''),
(3, 61, 1, 150.00, -30.00, 120.00, 'Transfer to Bank Account', NULL, NULL, '', '', '2024-09-05', ''),
(6, 70, 4, 310.00, 0.00, 310.00, 'Cheque', '2135432', '2024-09-23', '', '', '2024-09-23', ''),
(7, 63, 3, 333.00, -333.00, 0.00, 'Cash', '', '0000-00-00', '', '', '2024-09-23', ''),
(8, 63, 3, 1033.00, -1366.00, 0.00, 'Cash', '', '0000-00-00', '', '', '2024-09-23', ''),
(9, 63, 3, 100.00, -1466.00, 0.00, 'Cash', '', '0000-00-00', '', '', '2024-09-24', ''),
(10, 64, 5, 1000.00, -1000.00, 0.00, 'Cash', '', '0000-00-00', '', '', '2024-09-24', ''),
(11, 69, 1, 1000.00, -1000.00, 1000.00, 'Cheque', '1254', '2024-09-03', '', '', '2024-09-03', '896869623.jpg'),
(12, 69, 1, 1000.00, -1900.00, 100.00, 'Cheque', '122', '2024-09-18', '', '', '2024-09-25', ''),
(14, 95, 7, 100.00, 160.00, 260.00, 'Cash', '', '0000-00-00', '', 'ok', '2024-10-15', '');

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings`
--

CREATE TABLE `payment_settings` (
  `id` int NOT NULL,
  `payment_type` varchar(200) NOT NULL,
  `api_username` varchar(200) DEFAULT NULL,
  `api_secret_key` varchar(200) NOT NULL,
  `salt` varchar(200) NOT NULL,
  `api_publishable_key` varchar(200) NOT NULL,
  `api_password` varchar(200) DEFAULT NULL,
  `api_signature` varchar(200) DEFAULT NULL,
  `api_email` varchar(200) DEFAULT NULL,
  `paypal_demo` varchar(100) NOT NULL,
  `account_no` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `payslip_allowance`
--

CREATE TABLE `payslip_allowance` (
  `id` int NOT NULL,
  `payslip_id` int NOT NULL,
  `allowance_type` varchar(200) NOT NULL,
  `amount` int NOT NULL,
  `staff_id` int NOT NULL,
  `cal_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `payslip_allowance`
--

INSERT INTO `payslip_allowance` (`id`, `payslip_id`, `allowance_type`, `amount`, `staff_id`, `cal_type`) VALUES
(9, 4, '', 0, 2, 'positive'),
(10, 4, '', 0, 2, 'negative'),
(11, 5, '', 0, 3, 'positive'),
(12, 5, '', 0, 3, 'negative'),
(13, 6, '', 0, 4, 'positive'),
(14, 6, '', 0, 4, 'negative'),
(15, 7, '', 0, 5, 'positive'),
(16, 7, '', 0, 5, 'negative'),
(17, 8, '', 0, 2, 'positive'),
(18, 8, '', 0, 2, 'negative'),
(19, 9, '', 0, 24, 'positive'),
(20, 9, '', 0, 24, 'negative'),
(21, 10, '', 0, 3, 'positive'),
(22, 10, '', 0, 3, 'negative'),
(23, 11, '', 0, 4, 'positive'),
(24, 11, '', 0, 4, 'negative'),
(25, 12, '', 0, 5, 'positive'),
(26, 12, '', 0, 5, 'negative');

-- --------------------------------------------------------

--
-- Table structure for table `permission_category`
--

CREATE TABLE `permission_category` (
  `id` int NOT NULL,
  `perm_group_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) DEFAULT NULL,
  `enable_view` int DEFAULT '0',
  `enable_add` int DEFAULT '0',
  `enable_edit` int DEFAULT '0',
  `enable_delete` int DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `permission_category`
--

INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES
(9, 3, 'Income', 'income', 1, 1, 1, 1, '2018-06-22 15:53:21'),
(10, 3, 'Income Head', 'income_head', 1, 1, 1, 1, '2018-06-22 15:52:44'),
(12, 4, 'Expense', 'expense', 1, 1, 1, 1, '2018-06-22 15:54:06'),
(13, 4, 'Expense Head', 'expense_head', 1, 1, 1, 1, '2018-06-22 15:53:47'),
(14, 4, 'Search Expense', 'search_expense', 1, 0, 0, 0, '2018-06-22 15:54:13'),
(27, 8, 'Upload Content', 'upload_content', 1, 1, 0, 1, '2018-06-22 16:03:19'),
(31, 10, 'Issue Item', 'issue_item', 1, 1, 0, 1, '2018-12-17 15:25:14'),
(32, 10, 'Item Stock', 'item_stock', 1, 1, 1, 1, '2018-06-22 16:05:17'),
(33, 10, 'Item', 'item', 1, 1, 1, 1, '2018-06-22 16:05:40'),
(34, 10, 'Store', 'store', 1, 1, 1, 1, '2018-06-22 16:06:02'),
(35, 10, 'Supplier', 'supplier', 1, 1, 1, 1, '2018-06-22 16:06:25'),
(43, 13, 'Notice Board', 'notice_board', 1, 1, 1, 1, '2018-06-22 16:11:17'),
(44, 13, 'Email / SMS', 'email_sms', 1, 0, 0, 0, '2018-06-22 16:10:54'),
(46, 13, 'Email / SMS Log', 'email_sms_log', 1, 0, 0, 0, '2018-06-22 16:11:23'),
(48, 14, 'OPD Report', 'opd_report', 1, 0, 0, 0, '2018-12-18 14:29:18'),
(53, 15, 'Languages', 'languages', 0, 1, 0, 0, '2018-06-22 16:13:18'),
(54, 15, 'General Setting', 'general_setting', 1, 0, 1, 0, '2018-07-05 14:38:35'),
(56, 15, 'Notification Setting', 'notification_setting', 1, 0, 1, 0, '2018-07-05 14:38:41'),
(57, 15, 'SMS Setting', 'sms_setting', 1, 0, 1, 0, '2018-07-05 14:38:47'),
(58, 15, 'Email Setting', 'email_setting', 1, 0, 1, 0, '2018-07-05 14:38:51'),
(59, 15, 'Front CMS Setting', 'front_cms_setting', 1, 0, 1, 0, '2018-07-05 14:38:55'),
(60, 15, 'Payment Methods', 'payment_methods', 1, 0, 1, 0, '2018-07-05 14:38:59'),
(61, 16, 'Menus', 'menus', 1, 1, 0, 1, '2018-07-09 09:20:06'),
(62, 16, 'Media Manager', 'media_manager', 1, 1, 0, 1, '2018-07-09 09:20:26'),
(63, 16, 'Banner Images', 'banner_images', 1, 1, 0, 1, '2018-06-22 16:16:02'),
(64, 16, 'Pages', 'pages', 1, 1, 1, 1, '2018-06-22 16:16:21'),
(65, 16, 'Gallery', 'gallery', 1, 1, 1, 1, '2018-06-22 16:17:02'),
(66, 16, 'Event', 'event', 1, 1, 1, 1, '2018-06-22 16:17:20'),
(67, 16, 'News', 'notice', 1, 1, 1, 1, '2018-07-03 14:09:34'),
(80, 17, 'Visitor Book', 'visitor_book', 1, 1, 1, 1, '2018-06-22 16:18:58'),
(81, 17, 'Phone Call Log', 'phone_call_log', 1, 1, 1, 1, '2018-06-22 16:20:57'),
(82, 17, 'Postal Dispatch', 'postal_dispatch', 1, 1, 1, 1, '2018-06-22 16:20:21'),
(83, 17, 'Postal Receive', 'postal_receive', 1, 1, 1, 1, '2018-06-22 16:20:04'),
(84, 17, 'Complain', 'complain', 1, 1, 1, 1, '2018-12-19 14:41:37'),
(85, 17, 'Setup Front Office', 'setup_front_office', 1, 1, 1, 1, '2018-11-15 06:19:58'),
(86, 18, 'Staff', 'staff', 1, 1, 1, 1, '2018-06-22 16:23:31'),
(87, 18, 'Disable Staff', 'disable_staff', 1, 0, 0, 0, '2018-06-22 16:23:12'),
(88, 18, 'Staff Attendance', 'staff_attendance', 1, 1, 1, 0, '2018-06-22 16:23:10'),
(89, 18, 'Staff Attendance Report', 'staff_attendance_report', 1, 0, 0, 0, '2018-06-22 16:22:54'),
(90, 18, 'Staff Payroll', 'staff_payroll', 1, 1, 0, 1, '2018-06-22 16:22:51'),
(91, 18, 'Payroll Report', 'payroll_report', 1, 0, 0, 0, '2018-06-22 16:22:34'),
(102, 21, 'Calendar To Do List', 'calendar_to_do_list', 1, 1, 1, 1, '2018-06-22 16:24:41'),
(104, 10, 'Item Category', 'item_category', 1, 1, 1, 1, '2018-06-22 16:04:33'),
(108, 18, ' Approve Leave Request', 'approve_leave_request', 1, 1, 1, 1, '2018-07-02 15:47:41'),
(109, 18, 'Apply Leave', 'apply_leave', 1, 1, 1, 1, '2018-06-26 09:23:32'),
(110, 18, 'Leave Types ', 'leave_types', 1, 1, 1, 1, '2018-07-02 15:47:56'),
(111, 18, 'Department', 'department', 1, 1, 1, 1, '2018-06-26 09:27:07'),
(112, 18, 'Designation', 'designation', 1, 1, 1, 1, '2018-06-26 09:27:07'),
(118, 22, 'Staff Role Count Widget', 'staff_role_count_widget', 1, 0, 0, 0, '2018-07-03 12:43:35'),
(126, 15, 'User Status', 'user_status', 1, 0, 0, 0, '2018-07-03 14:12:29'),
(127, 18, 'Can See Other Users Profile', 'can_see_other_users_profile', 1, 0, 0, 0, '2018-07-03 14:12:29'),
(129, 18, 'Staff Timeline', 'staff_timeline', 0, 1, 0, 1, '2018-07-05 13:38:52'),
(130, 15, 'Backup', 'backup', 1, 1, 0, 1, '2018-07-09 09:47:17'),
(131, 15, 'Restore', 'restore', 1, 0, 0, 0, '2018-07-09 09:47:17'),
(132, 23, 'OPD Patient', 'opd_patient', 1, 1, 1, 1, '2018-12-20 15:07:26'),
(134, 23, 'Prescription', 'prescription', 1, 1, 1, 1, '2018-10-11 06:58:26'),
(135, 23, 'Revisit', 'revisit', 1, 1, 1, 1, '2018-10-11 06:58:26'),
(136, 23, 'OPD Diagnosis', 'opd diagnosis', 1, 1, 1, 1, '2018-10-11 12:16:59'),
(137, 23, 'OPD Timeline', 'opd timeline', 1, 1, 1, 1, '2018-10-11 12:17:22'),
(138, 24, 'IPD Patients', 'ipd_patient', 1, 1, 1, 1, '2018-10-11 12:44:55'),
(139, 24, 'Discharged Patients', 'discharged patients', 1, 1, 1, 1, '2018-10-11 06:58:26'),
(140, 24, 'Consultant Register', 'consultant register', 1, 1, 1, 1, '2018-10-11 06:58:26'),
(141, 24, 'IPD Diagnosis', 'ipd diagnosis', 1, 1, 1, 1, '2018-10-11 12:19:18'),
(142, 24, 'IPD Timeline', 'ipd timeline', 1, 1, 1, 1, '2018-10-11 12:19:42'),
(143, 24, 'Charges', 'charges', 1, 1, 1, 1, '2018-10-11 06:58:26'),
(144, 24, 'Payment', 'payment', 1, 1, 1, 1, '2018-10-11 06:58:26'),
(145, 24, 'Bill', 'bill', 1, 1, 1, 1, '2018-10-11 06:58:26'),
(146, 25, 'Medicine', 'medicine', 1, 1, 1, 1, '2018-10-11 06:58:26'),
(147, 25, 'Add Medicine Stock', 'add_medicine_stock', 1, 1, 1, 1, '2018-12-21 16:19:20'),
(148, 25, 'Pharmacy Bill', 'pharmacy bill', 1, 1, 1, 1, '2018-10-11 06:58:26'),
(149, 26, 'Pathology Test', 'pathology test', 1, 1, 1, 1, '2018-12-22 14:16:42'),
(150, 26, 'Add Patient & Test Report', 'add_patho_patient_test_report', 1, 1, 1, 1, '2019-10-18 12:35:57'),
(152, 27, 'Radiology Test', 'radiology test', 1, 1, 1, 1, '2018-10-11 06:58:26'),
(153, 27, 'Add Patient & Test Report', 'add_radio_patient_test_reprt', 1, 1, 1, 1, '2019-10-18 12:35:49'),
(155, 22, 'IPD Income Widget', 'ipd_income_widget', 1, 0, 0, 0, '2018-12-20 14:38:05'),
(156, 22, 'OPD Income Widget', 'opd_income_widget', 1, 0, 0, 0, '2018-12-20 14:38:15'),
(157, 22, 'Pharmacy Income Widget', 'pharmacy_income_widget', 1, 0, 0, 0, '2018-12-20 14:38:25'),
(158, 22, 'Pathology Income Widget', 'pathology_income_widget', 1, 0, 0, 0, '2018-12-20 14:38:37'),
(159, 22, 'Radiology Income Widget', 'radiology_income_widget', 1, 0, 0, 0, '2018-12-20 14:38:49'),
(160, 22, 'OT Income Widget', 'ot_income_widget', 1, 0, 0, 0, '2018-12-20 14:39:02'),
(161, 22, 'Blood Bank Income Widget', 'blood_bank_income_widget', 1, 0, 0, 0, '2018-12-20 14:39:13'),
(162, 22, 'Ambulance Income Widget', 'ambulance_income_widget', 1, 0, 0, 0, '2018-12-20 14:39:25'),
(163, 28, 'OT Patient', 'ot_patient', 1, 1, 1, 1, '2018-10-27 09:05:57'),
(164, 28, 'OT Consultant Instruction', 'ot_consultant_instruction', 1, 1, 1, 1, '2018-10-27 09:06:19'),
(165, 29, 'Ambulance Call', 'ambulance_call', 1, 1, 1, 1, '2018-10-27 09:07:51'),
(166, 29, 'Ambulance', 'ambulance', 1, 1, 1, 1, '2018-10-27 09:07:59'),
(167, 30, 'Blood Bank Status', 'blood_bank_status', 1, 1, 1, 1, '2018-10-27 09:50:09'),
(168, 30, 'Blood Issue', 'blood_issue', 1, 1, 1, 1, '2018-10-27 09:50:15'),
(169, 30, 'Blood Donor', 'blood_donor', 1, 1, 1, 1, '2018-10-27 09:50:19'),
(170, 25, 'Medicine Category', 'medicine_category', 1, 1, 1, 1, '2018-10-25 11:40:24'),
(171, 27, 'Radiology Category', 'radiology_category', 1, 1, 1, 1, '2024-08-08 05:00:46'),
(173, 31, 'Organisation', 'organisation', 1, 1, 1, 1, '2018-10-25 11:40:24'),
(174, 31, 'Charges', 'tpa_charges', 1, 1, 1, 1, '2018-12-22 15:36:57'),
(175, 26, 'Pathology Category', 'pathology_category', 1, 1, 1, 1, '2018-10-25 11:40:24'),
(176, 32, 'Charges', 'hospital_charges', 1, 1, 1, 1, '2018-12-22 15:38:26'),
(178, 14, 'IPD Report', 'ipd_report', 1, 0, 0, 0, '2018-12-12 15:39:24'),
(179, 14, 'Pharmacy Bill Report', 'pharmacy_bill_report', 1, 0, 0, 0, '2018-12-12 15:39:24'),
(180, 14, 'Pathology Patient Report', 'pathology_patient_report', 1, 0, 0, 0, '2018-12-12 15:39:24'),
(181, 14, 'Radiology Patient Report', 'radiology_patient_report', 1, 0, 0, 0, '2018-12-12 15:39:24'),
(182, 14, 'OT Report', 'ot_report', 1, 0, 0, 0, '2019-03-08 12:26:54'),
(183, 14, 'Blood Donor Report', 'blood_donor_report', 1, 0, 0, 0, '2018-12-12 15:39:24'),
(184, 14, 'Payroll Month Report', 'payroll_month_report', 1, 0, 0, 0, '2019-03-08 12:27:25'),
(185, 14, 'Payroll Report', 'payroll_report', 1, 0, 0, 0, '2019-03-08 12:27:35'),
(186, 14, 'Staff Attendance Report', 'staff_attendance_report', 1, 0, 0, 0, '2019-03-08 12:33:28'),
(187, 14, 'User Log', 'user_log', 1, 0, 0, 0, '2018-12-12 15:39:24'),
(188, 14, 'Patient Login Credential', 'patient_login_credential', 1, 0, 0, 0, '2018-12-12 15:39:24'),
(189, 14, 'Email / SMS Log', 'email_sms_log', 1, 0, 0, 0, '2018-12-12 15:39:24'),
(190, 22, 'Yearly Income & Expense Chart', 'yearly_income_expense_chart', 1, 0, 0, 0, '2018-12-12 15:52:05'),
(191, 22, 'Monthly Income & Expense Chart', 'monthly_income_expense_chart', 1, 0, 0, 0, '2018-12-12 15:55:14'),
(192, 23, 'OPD Prescription Print Header Footer ', 'opd_prescription_print_header_footer', 1, 1, 1, 1, '2018-12-12 16:01:07'),
(193, 24, 'Revert Generated Bill', 'revert_generated_bill', 1, 0, 0, 0, '2018-12-12 16:04:02'),
(194, 24, 'Calculate Bill', 'calculate_bill', 1, 0, 0, 0, '2018-12-12 16:05:30'),
(195, 24, 'Generate Bill & Discharge Patient', 'generate_bill_discharge_patient', 1, 0, 0, 0, '2018-12-21 14:56:00'),
(196, 24, 'Bed', 'bed', 1, 1, 1, 1, '2018-12-12 16:16:01'),
(197, 24, 'IPD Prescription Print Header Footer', 'ipd_prescription_print_header_footer', 1, 1, 1, 1, '2018-12-12 16:09:42'),
(198, 24, 'Bed Status', 'bed_status', 1, 0, 0, 0, '2018-12-12 16:09:42'),
(200, 25, 'Medicine Bad Stock', 'medicine_bad_stock', 1, 1, 0, 1, '2018-12-18 06:42:46'),
(201, 25, 'Pharmacy Bill print Header Footer', 'pharmacy_bill_print_header_footer', 1, 1, 1, 1, '2018-12-12 16:36:47'),
(202, 30, 'Donate Blood', 'donate_blood', 1, 1, 0, 1, '2018-12-12 16:47:10'),
(203, 32, 'Charge Category', 'charge_category', 1, 1, 1, 1, '2018-12-12 16:49:38'),
(204, 17, 'Appointment', 'appointment', 1, 1, 1, 1, '2018-12-18 17:22:53'),
(205, 17, 'Appointment Approve', 'appointment_approve', 1, 0, 0, 0, '2018-12-18 17:25:58'),
(206, 14, 'TPA Report', 'tpa_report', 1, 0, 0, 0, '2019-03-08 12:19:25'),
(207, 14, 'Ambulance Report', 'ambulance_report', 1, 0, 0, 0, '2019-03-08 12:19:41'),
(208, 14, 'Discharge Patient Report', 'discharge_patient_report', 1, 0, 0, 0, '2019-03-08 12:19:55'),
(209, 14, 'Appointment Report', 'appointment_report', 1, 0, 0, 0, '2019-03-08 12:20:10'),
(210, 14, 'Transaction Report', 'transaction_report', 1, 0, 0, 0, '2019-03-08 12:27:35'),
(211, 14, 'Blood Issue Report', 'blood_issue_report', 1, 0, 0, 0, '2019-03-08 12:27:35'),
(212, 14, 'Income Report', 'income_report', 1, 0, 0, 0, '2019-03-08 12:27:35'),
(213, 14, 'Expense Report', 'expense_report', 1, 0, 0, 0, '2019-03-08 12:27:35'),
(214, 34, 'Birth Record', 'birth_record', 1, 1, 1, 1, '2018-06-22 16:06:02'),
(215, 34, 'Death Record', 'death_record', 1, 1, 1, 1, '2018-06-22 16:06:02'),
(216, 17, 'Move Patient in OPD', 'move_patient_in_opd', 1, 0, 0, 0, '2019-09-23 10:14:41'),
(217, 17, 'Move Patient in IPD', 'move_patient_in_ipd', 1, 0, 0, 0, '2018-12-18 17:25:58'),
(218, 23, 'Move Patient in IPD', 'opd_move _patient_in_ipd', 1, 0, 0, 0, '2019-09-23 10:19:42'),
(219, 23, 'Manual Prescription', 'manual_prescription', 1, 0, 0, 0, '2019-09-23 10:22:06'),
(220, 24, 'Prescription ', 'ipd_prescription', 1, 1, 1, 1, '2019-09-24 06:29:27'),
(221, 23, 'Charges', 'opd_charges', 1, 1, 1, 1, '2019-09-23 10:28:03'),
(222, 23, 'Payment', 'opd_payment', 1, 1, 1, 1, '2019-09-24 06:14:29'),
(223, 23, 'Bill', 'opd_bill', 1, 1, 1, 1, '2019-09-23 10:29:37'),
(224, 25, 'Import Medicine', 'import_medicine', 1, 0, 0, 0, '2019-09-23 10:33:31'),
(225, 25, 'Medicine Purchase', 'medicine_purchase', 1, 1, 1, 1, '2019-09-23 10:35:53'),
(226, 25, 'Medicine Supplier', 'medicine_supplier', 1, 1, 1, 1, '2019-09-23 10:39:36'),
(227, 25, 'Medicine Dosage', 'medicine_dosage', 1, 1, 1, 1, '2019-09-23 10:47:16'),
(228, 32, 'Doctor OPD Charges', 'doctor_opd_charges', 1, 1, 1, 1, '2019-09-23 10:50:26'),
(229, 18, 'Staff Import', 'staff_import', 1, 0, 0, 0, '2019-09-23 10:51:39'),
(236, 36, 'Patient', 'patient', 1, 1, 1, 1, '2019-09-23 11:55:35'),
(237, 36, 'Enabled/Disabled', 'enabled_disabled', 1, 0, 0, 0, '2019-09-23 11:55:35'),
(238, 22, 'Notification Center', 'notification_center', 1, 0, 0, 0, '2019-09-24 09:18:33'),
(239, 36, 'Import', 'patient_import', 1, 0, 0, 0, '2019-10-04 06:50:26'),
(240, 34, 'Birth Print Header Footer', 'birth_print_header_footer', 1, 1, 1, 1, '2019-10-04 08:14:01'),
(241, 34, 'Custom Fields', 'birth_death_customfields', 1, 1, 1, 1, '2019-10-04 06:53:55'),
(242, 34, 'Death Print Header Footer', 'death_print_header_footer', 1, 1, 1, 1, '2019-10-04 08:13:56'),
(243, 26, 'Print Header Footer', 'pathology_print_header_footer', 1, 1, 1, 1, '2019-10-04 07:06:15'),
(244, 27, 'Print Header Footer', 'radiology_print_header_footer', 1, 1, 1, 1, '2019-10-04 07:10:01'),
(245, 28, 'Print Header Footer', 'ot_print_header_footer', 1, 1, 1, 1, '2019-10-04 07:11:15'),
(246, 30, 'Print Header Footer', 'bloodbank_print_header_footer', 1, 1, 1, 1, '2019-10-04 08:17:17'),
(247, 29, 'Print Header Footer', 'ambulance_print_header_footer', 1, 1, 1, 1, '2019-10-04 07:15:03'),
(248, 24, 'IPD Bill Print Header Footer', 'ipd_bill_print_header_footer', 1, 1, 1, 1, '2019-10-04 07:43:28'),
(249, 18, 'Print Payslip Header Footer', 'print_payslip_header_footer', 1, 1, 1, 1, '2019-10-04 08:01:33'),
(250, 14, 'Income Group Report', 'income_group_report', 1, 0, 0, 0, '2024-08-13 06:45:42'),
(251, 14, 'Expense Group Report', 'expense_group_report', 1, 0, 0, 0, '2019-10-04 09:45:56'),
(252, 3, 'Search Income', 'search_income', 1, 0, 0, 0, '2019-10-04 09:47:12'),
(253, 14, 'Inventory Stock Report', 'inventory_stock_report', 1, 0, 0, 0, '2019-10-04 10:50:31'),
(254, 14, 'Inventory Item Report', 'add_item_report', 1, 0, 0, 0, '2019-10-04 10:53:22'),
(255, 14, 'Inventory Issue Report', 'issue_inventory_report', 1, 0, 0, 0, '2019-10-04 10:54:40'),
(256, 14, 'Expiry Medicine Report', 'expiry_medicine_report', 1, 0, 0, 0, '2019-10-04 11:30:11'),
(257, 26, 'Pathology Bill', 'pathology bill', 1, 1, 1, 1, '2018-12-22 14:16:42'),
(258, 14, 'Birth Report', 'birth_report', 1, 0, 0, 0, '2019-10-14 08:42:35'),
(259, 14, 'Death Report', 'death_report', 1, 0, 0, 0, '2019-10-14 08:43:56'),
(260, 27, 'Radiology Bill', 'radiology_bill', 1, 1, 1, 1, '2024-08-06 11:16:09'),
(262, 23, 'OPD Bill Print Header Footer', 'opd_bill_print_header_footer', 1, 1, 1, 1, '2024-08-13 07:30:17'),
(263, 15, 'Branch', 'branch', 1, 1, 1, 1, '2024-09-06 09:37:31'),
(264, 18, 'Assign Task', 'assign_task', 1, 1, 1, 1, '2024-09-10 12:27:28'),
(265, 17, 'Appointment Print Header Footer', 'appointment_print_header_footer', 1, 1, 1, 1, '2024-09-23 12:22:01'),
(266, 24, 'IPD Treatment History', 'ipd_treatment_history', 1, 0, 0, 0, '2024-10-03 05:35:56'),
(267, 24, 'IPD Nurse Note', 'ipd_nurse_note', 1, 1, 1, 1, '2024-10-03 05:36:01');

-- --------------------------------------------------------

--
-- Table structure for table `permission_group`
--

CREATE TABLE `permission_group` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) NOT NULL,
  `is_active` int DEFAULT '0',
  `system` int NOT NULL,
  `sort_order` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `permission_group`
--

INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES
(3, 'Income', 'income', 1, 0, 9.00, '2021-05-05 09:54:50'),
(4, 'Expense', 'expense', 1, 0, 10.00, '2021-05-05 09:54:53'),
(8, 'Download Center', 'download_center', 1, 0, 15.00, '2021-05-05 09:55:10'),
(10, 'Inventory', 'inventory', 1, 0, 16.00, '2018-12-18 10:23:27'),
(13, 'Messaging', 'communicate', 1, 0, 14.00, '2018-12-18 10:22:54'),
(14, 'Reports', 'reports', 1, 1, 19.00, '2018-12-18 10:24:41'),
(15, 'System Settings', 'system_settings', 1, 1, 18.00, '2018-12-18 10:24:23'),
(16, 'Front CMS', 'front_cms', 0, 0, 17.00, '2024-08-07 09:28:55'),
(17, 'Front Office', 'front_office', 1, 0, 12.00, '2018-12-18 10:21:58'),
(18, 'Human Resource', 'human_resource', 1, 1, 13.00, '2018-12-18 10:22:37'),
(21, 'Calendar To Do List', 'calendar_to_do_list', 1, 0, 22.00, '2019-10-04 07:26:23'),
(22, 'Dashboard and Widgets', 'dashboard_and_widgets', 1, 1, 20.00, '2018-12-18 10:24:51'),
(23, 'OPD', 'OPD', 1, 0, 1.00, '2021-05-05 09:54:24'),
(24, 'IPD', 'IPD', 1, 0, 2.00, '2021-05-05 09:54:28'),
(25, 'Pharmacy', 'pharmacy', 1, 0, 3.00, '2021-05-05 09:54:32'),
(26, 'Pathology', 'pathology', 1, 0, 4.00, '2018-12-18 10:02:56'),
(27, 'Radiology', 'radiology', 1, 0, 5.00, '2021-04-02 10:29:46'),
(28, 'Operation Theatre', 'operation_theatre', 1, 0, 6.00, '2021-05-05 09:54:39'),
(29, 'Ambulance', 'ambulance', 1, 0, 11.00, '2021-05-05 09:54:56'),
(30, 'Blood Bank', 'blood_bank', 1, 0, 7.00, '2021-05-05 09:54:43'),
(31, 'TPA Management', 'tpa_management', 1, 0, 8.00, '2021-05-05 09:54:46'),
(32, 'Hospital Charges', 'hospital_charges', 1, 1, 10.10, '2019-03-10 07:08:22'),
(34, 'Birth Death Record', 'birth_death_report', 1, 0, 12.00, '2021-05-05 09:55:02'),
(36, 'Patient', 'patient', 1, 0, 21.00, '2019-10-04 07:26:19');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `id` int NOT NULL,
  `medicine_name` varchar(200) DEFAULT NULL,
  `medicine_category_id` varchar(50) NOT NULL,
  `medicine_image` varchar(200) NOT NULL,
  `medicine_company` varchar(100) DEFAULT NULL,
  `medicine_composition` varchar(100) DEFAULT NULL,
  `medicine_group` varchar(100) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `min_level` varchar(50) DEFAULT NULL,
  `reorder_level` varchar(50) DEFAULT NULL,
  `vat` varchar(50) DEFAULT NULL,
  `unit_packing` varchar(50) DEFAULT NULL,
  `supplier` varchar(50) DEFAULT NULL,
  `vat_ac` varchar(50) DEFAULT NULL,
  `note` varchar(200) NOT NULL,
  `is_active` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pharmacy`
--

INSERT INTO `pharmacy` (`id`, `medicine_name`, `medicine_category_id`, `medicine_image`, `medicine_company`, `medicine_composition`, `medicine_group`, `unit`, `min_level`, `reorder_level`, `vat`, `unit_packing`, `supplier`, `vat_ac`, `note`, `is_active`, `created_at`) VALUES
(1, 'Ftox-DX', '1', '', 'Lupin Limited', '5 mg', 'Antigout Agents', 'mg', '500', '500', '10', '500', NULL, NULL, '', '', '2024-09-24 12:35:26');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy_bill_basic`
--

CREATE TABLE `pharmacy_bill_basic` (
  `id` int NOT NULL,
  `bill_no` varchar(50) DEFAULT NULL,
  `ref_no` varchar(255) NOT NULL,
  `date` datetime DEFAULT NULL,
  `patient_id` varchar(200) NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `doctor_name` varchar(50) DEFAULT NULL,
  `file` varchar(200) NOT NULL,
  `opd_ipd_no` varchar(50) DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `discount_percent` decimal(15,2) NOT NULL,
  `discount` decimal(15,2) NOT NULL,
  `tax_percent` decimal(15,2) NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `net_amount` decimal(15,2) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `cheque_no` varchar(200) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `payment_doc` text NOT NULL,
  `note` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pharmacy_bill_basic`
--

INSERT INTO `pharmacy_bill_basic` (`id`, `bill_no`, `ref_no`, `date`, `patient_id`, `customer_name`, `customer_type`, `doctor_name`, `file`, `opd_ipd_no`, `total`, `discount_percent`, `discount`, `tax_percent`, `tax`, `net_amount`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_doc`, `note`, `created_at`, `generated_by`) VALUES
(1, '1', 'PHARMAB1', '2024-09-25 10:02:00', '70', 'Ahmad Mohammed Al-Jundi', NULL, 'Ahmed Al-Masri', '', NULL, 110.00, 0.00, 0.00, 0.00, 0.00, 110.00, 'Cash', '', '0000-00-00', '', '', '2024-09-25 04:32:45', 1),
(2, '2', 'PHARMAB2', '2024-09-26 12:50:00', '70', 'Ahmad Mohammed Al-Jundi', NULL, 'Khaled Nasser n', '', NULL, 2500.00, 0.00, 0.00, 0.00, 0.00, 2500.00, 'Cheque', '12', '2024-09-04', '', '', '2024-09-26 07:22:28', 1),
(3, '3', 'PHARMAB3', '2024-10-01 00:00:00', '76', 'Mastani', NULL, 'Ahmed Al-Masri', '', NULL, 2500.00, 10.00, 250.00, 10.00, 225.00, 2475.00, 'Cash', '', '0000-00-00', '', '', '2024-10-05 04:51:06', 1),
(4, '4', 'PHARMAB4', '2024-10-15 13:13:00', '95', 'Zaid Musa', NULL, '', '', NULL, 1650.00, 0.00, 0.00, 0.00, 0.00, 1650.00, 'Cash', '', '0000-00-00', '', '', '2024-10-15 07:52:17', 1),
(5, '5', 'PHARMAB5', '2024-10-08 13:22:00', '95', 'Zaid Musa', NULL, '', '', NULL, 1100.00, 2.00, 22.00, 2.00, 21.56, 1099.56, 'Cash', '', '0000-00-00', '', '', '2024-10-15 07:54:39', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy_bill_detail`
--

CREATE TABLE `pharmacy_bill_detail` (
  `id` int NOT NULL,
  `pharmacy_bill_basic_id` varchar(50) NOT NULL,
  `medicine_category_id` int NOT NULL,
  `medicine_name` varchar(200) NOT NULL,
  `expire_date` varchar(100) NOT NULL,
  `batch_no` varchar(200) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `sale_price` decimal(15,2) NOT NULL,
  `amount` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pharmacy_bill_detail`
--

INSERT INTO `pharmacy_bill_detail` (`id`, `pharmacy_bill_basic_id`, `medicine_category_id`, `medicine_name`, `expire_date`, `batch_no`, `quantity`, `sale_price`, `amount`) VALUES
(1, '1', 1, '1', 'Aug/2026', '1234', '1', 110.00, 110.00),
(2, '2', 1, '1', 'Feb/2025', '789', '10', 250.00, 2500.00),
(3, '3', 1, '1', 'Feb/2025', '789', '10', 250.00, 2500.00),
(4, '4', 1, '1', 'Aug/2026', '1234', '15', 110.00, 1650.00),
(5, '5', 1, '1', 'Aug/2026', '1234', '10', 110.00, 1100.00);

-- --------------------------------------------------------

--
-- Table structure for table `prefix_setting`
--

CREATE TABLE `prefix_setting` (
  `id` int NOT NULL,
  `ipd_no` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `opd_no` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ipd_prescription` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `opd_prescription` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `appointment` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pharmacy_bill` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `operation_reference_no` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `blood_bank_bill` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ambulance_call_bill` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `radiology_bill` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pathology_bill` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `opd_checkup_id` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pharmacy_purchase_no` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `transaction_id` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `birth_record_reference_no` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `death_record_reference_no` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prefix_setting`
--

INSERT INTO `prefix_setting` (`id`, `ipd_no`, `opd_no`, `ipd_prescription`, `opd_prescription`, `appointment`, `pharmacy_bill`, `operation_reference_no`, `blood_bank_bill`, `ambulance_call_bill`, `radiology_bill`, `pathology_bill`, `opd_checkup_id`, `pharmacy_purchase_no`, `transaction_id`, `birth_record_reference_no`, `death_record_reference_no`) VALUES
(0, 'IPDN', 'OPDN', 'IPDP', 'OPDP', 'APPNO', 'PHARMAB', 'OTREF', 'BIB', 'ACB', 'RADIOB', 'PATHOB', 'CHKID', 'PCHNO', 'TRANID', 'BREF', 'DREF');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `id` int NOT NULL,
  `opd_id` int NOT NULL,
  `visit_id` int NOT NULL,
  `medicine_category_id` int NOT NULL,
  `medicine` varchar(200) NOT NULL,
  `dosage` varchar(200) NOT NULL,
  `instruction` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`id`, `opd_id`, `visit_id`, `medicine_category_id`, `medicine`, `dosage`, `instruction`) VALUES
(1, 6, 0, 2, '', '1 MG', ''),
(2, 8, 0, 1, 'cough syrup', '0.5 ml', 'ok'),
(3, 12, 0, 1, 'cough syrup', '0.5 ml', 'please take before food.'),
(4, 14, 0, 1, '', '0.5 ml', ''),
(5, 1, 0, 2, 'Amoxicillin', '1 MG', 'after meal');

-- --------------------------------------------------------

--
-- Table structure for table `print_setting`
--

CREATE TABLE `print_setting` (
  `id` int NOT NULL,
  `print_header` varchar(300) NOT NULL,
  `print_footer` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `setting_for` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `print_setting`
--

INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`) VALUES
(1, 'uploads/printing/1.jpg', '<p>This invoice is printed electronically, so no signature is required</p>', 'pathology', 'yes'),
(2, 'uploads/printing/2.jpg', '<p>This invoice is printed electronically, so no signature is required</p>', 'opd', 'yes'),
(3, 'uploads/printing/3.jpg', '<p>This invoice is printed electronically, so no signature is required</p>', 'opdpre', 'yes'),
(4, 'uploads/printing/4.jpg', '<p>This invoice is printed electronically, so no signature is required</p>', 'pharmacy', 'yes'),
(6, 'uploads/printing/6.jpg', '<p>This invoice is printed electronically, so no signature is required</p>', 'ipdpres', 'yes'),
(7, 'uploads/printing/7.jpg', '<p>This invoice is printed electronically, so no signature is required</p>', 'ipd', 'yes'),
(8, 'uploads/printing/8.jpg', '<p>This invoice is printed electronically, so no signature is required</p>', 'birth', 'yes'),
(9, 'uploads/printing/9.jpg', '<p>This invoice is printed electronically, so no signature is required</p>', 'ot', 'yes'),
(10, 'uploads/printing/10.jpg', '<p>This invoice is printed electronically, so no signature is required</p>', 'ambulance', 'yes'),
(11, 'uploads/printing/11.jpg', '<p>This invoice is printed electronically, so no signature is required</p>', 'bloodbank', 'yes'),
(12, 'uploads/printing/12.jpg', '<p>This invoice is printed electronically, so no signature is required</p>', 'radiology', 'yes'),
(13, 'uploads/printing/13.jpg', '<p>This invoice is printed electronically, so no signature is required</p>', 'death', 'yes'),
(14, 'uploads/printing/14.jpg', '<p>This invoice is printed electronically, so no signature is required</p>', 'payslip', 'yes'),
(15, 'uploads/printing/15.jpg', '<p>This invoice is printed electronically, so no signature is required</p>', 'payment_receipt', 'yes'),
(16, 'uploads/printing/16.jpg', '<p>\r\n\r\nThis invoice is printed electronically, so no signature is required.\r\n\r\n<br></p>', 'appointment', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `radio`
--

CREATE TABLE `radio` (
  `id` int NOT NULL,
  `test_name` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `test_type` varchar(100) DEFAULT NULL,
  `radiology_category_id` varchar(11) NOT NULL,
  `sub_category` varchar(50) NOT NULL,
  `report_days` varchar(50) NOT NULL,
  `charge_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `radio`
--

INSERT INTO `radio` (`id`, `test_name`, `short_name`, `test_type`, `radiology_category_id`, `sub_category`, `report_days`, `charge_id`, `created_at`) VALUES
(1, 'Magnetic Resonance Imaging', 'MRI', 'Imaging Test', '3', 'Neuroimaging', '1', 8, '2024-08-08 07:28:02'),
(2, 'Chest X-Ray', 'CXR', 'X-Ray', '2', 'Diagnostic imaging X-ray', '2', 8, '2024-08-08 07:53:08'),
(3, 'Ultrasound', 'USS', 'Machine', '5', '', '', 8, '2024-09-03 12:41:05');

-- --------------------------------------------------------

--
-- Table structure for table `radiology_parameter`
--

CREATE TABLE `radiology_parameter` (
  `id` int NOT NULL,
  `parameter_name` varchar(100) NOT NULL,
  `reference_range` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `radiology_report`
--

CREATE TABLE `radiology_report` (
  `id` int NOT NULL,
  `bill_no` varchar(200) NOT NULL,
  `ref_no` varchar(255) NOT NULL,
  `radiology_id` int NOT NULL,
  `patient_id` varchar(11) DEFAULT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `patient_name` varchar(100) DEFAULT NULL,
  `consultant_doctor` varchar(10) NOT NULL,
  `reporting_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `radiology_report` varchar(255) DEFAULT NULL,
  `apply_charge` decimal(15,2) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `cheque_no` varchar(200) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `payment_doc` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `radiology_report`
--

INSERT INTO `radiology_report` (`id`, `bill_no`, `ref_no`, `radiology_id`, `patient_id`, `customer_type`, `patient_name`, `consultant_doctor`, `reporting_date`, `description`, `radiology_report`, `apply_charge`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_doc`, `created_at`, `generated_by`) VALUES
(1, '1', 'RADIOB1', 3, '70', NULL, NULL, '3', '2024-09-25', '', NULL, 500.00, 'Cash', '', '0000-00-00', '', '2024-09-25 11:04:27', 1),
(2, '2', 'RADIOB2', 3, '76', NULL, NULL, '', '2024-09-30', '', NULL, 500.00, 'Cash', '', '0000-00-00', '', '2024-10-05 06:39:14', 1),
(3, '3', 'RADIOB3', 1, '76', NULL, NULL, '', '2024-10-08', '', NULL, 500.00, 'Cash', '', '0000-00-00', '', '2024-10-05 06:39:27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `radiology_unit`
--

CREATE TABLE `radiology_unit` (
  `id` int NOT NULL,
  `unit_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `radiology_unit`
--

INSERT INTO `radiology_unit` (`id`, `unit_name`) VALUES
(2, 'CT');

-- --------------------------------------------------------

--
-- Table structure for table `read_notification`
--

CREATE TABLE `read_notification` (
  `id` int NOT NULL,
  `student_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `notification_id` int DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `read_notification`
--

INSERT INTO `read_notification` (`id`, `student_id`, `parent_id`, `staff_id`, `notification_id`, `is_active`, `created_at`) VALUES
(1, NULL, NULL, 2, 2, 'no', '2024-09-12 10:03:12');

-- --------------------------------------------------------

--
-- Table structure for table `read_systemnotification`
--

CREATE TABLE `read_systemnotification` (
  `id` int NOT NULL,
  `notification_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `is_active` varchar(200) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `read_systemnotification`
--

INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES
(1, 247, 1, 'no', '2024-08-27 18:04:07'),
(2, 247, 1, 'no', '2024-08-27 18:04:10'),
(3, 150, 2, 'no', '2024-08-28 00:33:08'),
(4, 380, 1, 'no', '2024-09-06 11:03:06'),
(5, 380, 1, 'no', '2024-09-06 11:03:09'),
(6, 397, 1, 'no', '2024-09-06 11:03:31'),
(7, 417, 3, 'no', '2024-09-10 17:23:40'),
(8, 420, 3, 'no', '2024-09-10 17:26:36'),
(9, 1, 1, 'no', '2024-09-10 18:10:33'),
(10, 1, 1, 'no', '2024-09-10 18:10:39'),
(11, 1, 1, 'no', '2024-09-10 18:10:41'),
(12, 1, 2, 'no', '2024-09-10 18:10:53'),
(13, 1, 2, 'no', '2024-09-10 18:11:02'),
(14, 1, 2, 'no', '2024-09-10 18:11:03'),
(15, 1, 2, 'no', '2024-09-10 18:11:07'),
(16, 1, 2, 'no', '2024-09-10 18:11:10'),
(17, 1, 2, 'no', '2024-09-10 18:11:15'),
(18, 1, 2, 'no', '2024-09-10 18:11:17'),
(19, 1, 1, 'no', '2024-09-10 18:12:29'),
(20, 1, 1, 'no', '2024-09-10 18:12:30'),
(21, 1, 1, 'no', '2024-09-10 18:12:30'),
(22, 1, 1, 'no', '2024-09-10 18:12:33'),
(23, 1, 1, 'no', '2024-09-10 18:12:37'),
(24, 1, 1, 'no', '2024-09-10 18:12:45'),
(25, 1, 1, 'no', '2024-09-10 18:12:55'),
(26, 1, 1, 'no', '2024-09-10 18:13:20'),
(27, 1, 1, 'no', '2024-09-10 18:13:23'),
(28, 1, 1, 'no', '2024-09-10 18:13:26'),
(29, 1, 1, 'no', '2024-09-10 18:13:27'),
(30, 1, 1, 'no', '2024-09-10 18:13:28'),
(31, 1, 1, 'no', '2024-09-10 18:13:28'),
(32, 1, 1, 'no', '2024-09-10 18:13:32'),
(33, 1, 1, 'no', '2024-09-10 18:14:01'),
(34, 1, 1, 'no', '2024-09-10 18:14:15'),
(35, 1, 1, 'no', '2024-09-10 18:14:26'),
(36, 1, 1, 'no', '2024-09-10 18:14:31'),
(37, 1, 1, 'no', '2024-09-10 18:14:51'),
(38, 1, 1, 'no', '2024-09-10 18:17:03'),
(39, 1, 1, 'no', '2024-09-10 18:17:12'),
(40, 1, 1, 'no', '2024-09-10 18:18:59'),
(41, 1, 1, 'no', '2024-09-10 18:19:06'),
(42, 1, 2, 'no', '2024-09-10 18:21:44'),
(43, 1, 1, 'no', '2024-09-10 18:22:03'),
(44, 2, 1, 'no', '2024-09-10 18:23:09'),
(45, 2, 1, 'no', '2024-09-10 18:23:11'),
(46, 2, 1, 'no', '2024-09-10 18:23:15'),
(47, 2, 1, 'no', '2024-09-10 18:24:51'),
(48, 2, 1, 'no', '2024-09-10 18:24:55'),
(49, 2, 1, 'no', '2024-09-10 18:25:01'),
(50, 2, 1, 'no', '2024-09-10 18:25:03'),
(51, 2, 1, 'no', '2024-09-10 18:28:13'),
(52, 2, 1, 'no', '2024-09-10 18:28:17'),
(53, 2, 1, 'no', '2024-09-10 18:28:19'),
(54, 2, 1, 'no', '2024-09-10 18:28:21'),
(55, 2, 1, 'no', '2024-09-10 18:28:22'),
(56, 2, 1, 'no', '2024-09-10 18:28:34'),
(57, 2, 1, 'no', '2024-09-10 18:29:03'),
(58, 2, 1, 'no', '2024-09-10 18:29:11'),
(59, 2, 1, 'no', '2024-09-10 18:31:51'),
(60, 2, 1, 'no', '2024-09-10 18:31:55'),
(61, 2, 1, 'no', '2024-09-10 18:32:03'),
(62, 2, 1, 'no', '2024-09-11 10:02:47'),
(63, 2, 1, 'no', '2024-09-11 10:02:50'),
(64, 2, 1, 'no', '2024-09-11 10:09:39'),
(65, 2, 1, 'no', '2024-09-11 10:09:40'),
(66, 2, 1, 'no', '2024-09-11 10:09:51'),
(67, 2, 1, 'no', '2024-09-11 10:16:36'),
(68, 2, 1, 'no', '2024-09-11 10:16:38'),
(69, 2, 1, 'no', '2024-09-11 10:16:42'),
(70, 2, 1, 'no', '2024-09-11 10:16:44'),
(71, 2, 1, 'no', '2024-09-11 10:16:49'),
(72, 2, 1, 'no', '2024-09-11 10:16:51'),
(73, 2, 1, 'no', '2024-09-11 10:16:56'),
(74, 2, 1, 'no', '2024-09-11 10:17:01'),
(75, 2, 1, 'no', '2024-09-11 10:17:04'),
(76, 2, 1, 'no', '2024-09-11 10:17:09'),
(77, 2, 1, 'no', '2024-09-11 10:17:13'),
(78, 2, 1, 'no', '2024-09-11 10:17:20'),
(79, 2, 1, 'no', '2024-09-11 10:17:36'),
(80, 2, 1, 'no', '2024-09-11 10:17:39'),
(81, 2, 1, 'no', '2024-09-11 10:17:41'),
(82, 2, 1, 'no', '2024-09-11 10:17:44'),
(83, 2, 1, 'no', '2024-09-11 10:17:47'),
(84, 2, 1, 'no', '2024-09-11 10:17:49'),
(85, 2, 1, 'no', '2024-09-11 10:17:50'),
(86, 2, 1, 'no', '2024-09-11 10:17:52'),
(87, 2, 1, 'no', '2024-09-11 10:17:53'),
(88, 2, 1, 'no', '2024-09-11 10:17:55'),
(89, 2, 1, 'no', '2024-09-11 10:17:57'),
(90, 2, 1, 'no', '2024-09-11 10:17:59'),
(91, 2, 2, 'no', '2024-09-11 10:18:59'),
(92, 2, 2, 'no', '2024-09-11 10:19:00'),
(93, 2, 2, 'no', '2024-09-11 10:19:08'),
(94, 2, 2, 'no', '2024-09-11 10:19:13'),
(95, 2, 2, 'no', '2024-09-11 10:19:14'),
(96, 2, 2, 'no', '2024-09-11 10:19:16'),
(97, 2, 2, 'no', '2024-09-11 10:19:16'),
(98, 2, 2, 'no', '2024-09-11 10:19:19'),
(99, 2, 2, 'no', '2024-09-11 10:19:21'),
(100, 2, 1, 'no', '2024-09-11 10:19:55'),
(101, 2, 2, 'no', '2024-09-11 10:20:17'),
(102, 2, 2, 'no', '2024-09-11 10:20:20'),
(103, 2, 1, 'no', '2024-09-11 10:20:38'),
(104, 2, 2, 'no', '2024-09-11 10:21:03'),
(105, 2, 1, 'no', '2024-09-11 10:23:21'),
(106, 2, 1, 'no', '2024-09-11 10:23:39'),
(107, 2, 2, 'no', '2024-09-11 11:03:33'),
(108, 2, 1, 'no', '2024-09-11 11:03:42'),
(109, 2, 1, 'no', '2024-09-11 11:03:43'),
(110, 2, 1, 'no', '2024-09-11 11:04:28'),
(111, 2, 1, 'no', '2024-09-11 11:04:43'),
(112, 2, 1, 'no', '2024-09-11 11:10:49'),
(113, 2, 1, 'no', '2024-09-11 11:10:56'),
(114, 2, 2, 'no', '2024-09-11 11:20:43'),
(115, 2, 2, 'no', '2024-09-11 11:36:58'),
(116, 2, 1, 'no', '2024-09-11 11:54:17'),
(117, 2, 1, 'no', '2024-09-11 11:58:11'),
(118, 2, 1, 'no', '2024-09-11 12:04:51'),
(119, 2, 2, 'no', '2024-09-11 12:31:25'),
(120, 2, 1, 'no', '2024-09-11 17:29:56'),
(121, 2, 3, 'no', '2024-09-11 17:30:22'),
(122, 2, 1, 'no', '2024-09-11 17:31:54'),
(123, 2, 1, 'no', '2024-09-11 17:35:50'),
(124, 2, 1, 'no', '2024-09-11 17:35:52'),
(125, 3, 1, 'no', '2024-09-11 17:35:53'),
(126, 3, 1, 'no', '2024-09-11 17:35:54'),
(127, 2, 1, 'no', '2024-09-11 17:56:39'),
(128, 3, 1, 'no', '2024-09-11 17:56:46'),
(129, 3, 1, 'no', '2024-09-11 17:56:58'),
(130, 3, 1, 'no', '2024-09-11 17:57:01'),
(131, 3, 1, 'no', '2024-09-11 17:57:11'),
(132, 3, 1, 'no', '2024-09-11 17:57:21'),
(133, 3, 1, 'no', '2024-09-11 17:58:15'),
(134, 3, 1, 'no', '2024-09-11 18:07:51'),
(135, 3, 1, 'no', '2024-09-11 18:08:40'),
(136, 3, 1, 'no', '2024-09-11 18:11:41'),
(137, 2, 1, 'no', '2024-09-12 14:01:43'),
(138, 2, 1, 'no', '2024-09-12 14:01:45'),
(139, 2, 1, 'no', '2024-09-12 14:24:48'),
(140, 2, 2, 'no', '2024-09-12 14:25:22'),
(141, 2, 2, 'no', '2024-09-12 14:25:40'),
(142, 2, 2, 'no', '2024-09-12 14:25:47'),
(143, 2, 1, 'no', '2024-09-12 14:25:53'),
(144, 2, 1, 'no', '2024-09-12 14:25:59'),
(145, 2, 1, 'no', '2024-09-12 14:26:06'),
(146, 2, 1, 'no', '2024-09-12 14:26:09'),
(147, 2, 2, 'no', '2024-09-12 14:26:26'),
(148, 2, 2, 'no', '2024-09-12 16:10:14'),
(149, 2, 1, 'no', '2024-09-12 17:43:19'),
(150, 2, 1, 'no', '2024-09-13 11:00:29'),
(151, 1, 1, 'no', '2024-09-13 16:14:23'),
(152, 1, 1, 'no', '2024-09-13 16:14:25'),
(153, 1, 1, 'no', '2024-09-16 10:14:59'),
(154, 1, 1, 'no', '2024-09-16 10:24:30'),
(155, 1, 1, 'no', '2024-09-16 10:24:38'),
(156, 1, 8, 'no', '2024-09-16 10:25:11'),
(157, 1, 8, 'no', '2024-09-16 10:25:47'),
(158, 1, 8, 'no', '2024-09-16 10:25:53'),
(159, 1, 8, 'no', '2024-09-16 10:28:10'),
(160, 1, 8, 'no', '2024-09-16 10:31:40'),
(161, 1, 8, 'no', '2024-09-16 10:34:24'),
(162, 1, 1, 'no', '2024-09-17 14:40:33'),
(163, 2, 1, 'no', '2024-09-17 14:40:47'),
(164, 1, 1, 'no', '2024-09-17 16:48:56'),
(165, 1, 1, 'no', '2024-09-17 16:51:10'),
(166, 1, 1, 'no', '2024-09-17 16:51:11'),
(167, 1, 1, 'no', '2024-09-17 16:51:13'),
(168, 1, 1, 'no', '2024-09-17 16:51:15'),
(169, 1, 1, 'no', '2024-09-17 16:54:03'),
(170, 1, 1, 'no', '2024-09-17 16:57:12'),
(171, 1, 1, 'no', '2024-09-17 16:57:12'),
(172, 1, 1, 'no', '2024-09-17 16:57:45'),
(173, 2, 1, 'no', '2024-09-17 17:00:19'),
(174, 1, 1, 'no', '2024-09-17 17:00:20'),
(175, 2, 1, 'no', '2024-09-17 17:00:22'),
(176, 1, 1, 'no', '2024-09-17 17:01:46'),
(177, 1, 1, 'no', '2024-09-17 17:04:03'),
(178, 1, 1, 'no', '2024-09-17 17:05:36'),
(179, 1, 1, 'no', '2024-09-17 17:05:37'),
(180, 26, 1, 'no', '2024-09-18 18:00:12'),
(181, 23, 1, 'no', '2024-09-18 18:00:14'),
(182, 20, 1, 'no', '2024-09-18 18:00:15'),
(183, 29, 1, 'no', '2024-09-18 18:00:19'),
(184, 32, 1, 'no', '2024-09-18 18:19:54'),
(185, 32, 1, 'no', '2024-09-18 18:19:55'),
(186, 32, 1, 'no', '2024-09-18 18:20:00'),
(187, 32, 1, 'no', '2024-09-18 18:20:00'),
(188, 32, 1, 'no', '2024-09-18 18:20:01'),
(189, 32, 1, 'no', '2024-09-18 18:20:01'),
(190, 32, 1, 'no', '2024-09-18 18:20:02'),
(191, 32, 1, 'no', '2024-09-18 18:20:08'),
(192, 32, 1, 'no', '2024-09-18 18:20:08'),
(193, 32, 1, 'no', '2024-09-18 18:20:09'),
(194, 32, 1, 'no', '2024-09-18 18:20:09'),
(195, 32, 1, 'no', '2024-09-18 18:20:11'),
(196, 32, 1, 'no', '2024-09-18 18:20:13'),
(197, 1, 1, 'no', '2024-09-19 11:50:09'),
(198, 1, 1, 'no', '2024-09-19 12:45:26'),
(199, 1, 1, 'no', '2024-09-19 12:46:36'),
(200, 1, 1, 'no', '2024-09-19 12:48:13'),
(201, 2, 1, 'no', '2024-09-19 12:48:14'),
(202, 1, 1, 'no', '2024-09-19 12:56:19'),
(203, 2, 1, 'no', '2024-09-19 12:56:23'),
(204, 1, 1, 'no', '2024-09-19 12:56:25'),
(205, 1, 1, 'no', '2024-09-19 12:56:29'),
(206, 2, 1, 'no', '2024-09-19 12:56:30'),
(207, 1, 1, 'no', '2024-09-19 13:03:04'),
(208, 1, 1, 'no', '2024-09-19 13:03:06'),
(209, 1, 1, 'no', '2024-09-19 13:03:07'),
(210, 1, 1, 'no', '2024-09-19 13:03:39'),
(211, 1, 1, 'no', '2024-09-19 13:04:57'),
(212, 1, 1, 'no', '2024-09-19 13:05:00'),
(213, 1, 1, 'no', '2024-09-19 13:05:02'),
(214, 1, 1, 'no', '2024-09-19 13:05:05'),
(215, 1, 1, 'no', '2024-09-19 13:23:02'),
(216, 1, 1, 'no', '2024-09-19 13:25:08'),
(217, 1, 1, 'no', '2024-09-19 13:25:21'),
(218, 1, 1, 'no', '2024-09-19 13:25:33'),
(219, 1, 1, 'no', '2024-09-19 13:25:37'),
(220, 1, 1, 'no', '2024-09-19 13:25:55'),
(221, 1, 1, 'no', '2024-09-19 13:26:00'),
(222, 1, 1, 'no', '2024-09-19 14:36:27'),
(223, 2, 1, 'no', '2024-09-19 14:36:31'),
(224, 1, 1, 'no', '2024-09-19 14:37:11'),
(225, 1, 1, 'no', '2024-09-19 14:37:20'),
(226, 1, 1, 'no', '2024-09-19 14:37:39'),
(227, 2, 2, 'no', '2024-09-19 14:40:31'),
(228, 2, 2, 'no', '2024-09-19 14:41:14'),
(229, 1, 1, 'no', '2024-09-19 14:41:54'),
(230, 2, 1, 'no', '2024-09-19 14:42:40'),
(231, 2, 2, 'no', '2024-09-19 14:42:58'),
(232, 2, 2, 'no', '2024-09-19 14:47:10'),
(233, 2, 2, 'no', '2024-09-19 14:47:26'),
(234, 2, 1, 'no', '2024-09-19 14:47:41'),
(235, 2, 1, 'no', '2024-09-19 14:48:10'),
(236, 2, 1, 'no', '2024-09-19 14:48:16'),
(237, 2, 1, 'no', '2024-09-19 14:51:38'),
(238, 2, 1, 'no', '2024-09-19 14:51:56'),
(239, 1, 1, 'no', '2024-09-19 14:52:12'),
(240, 1, 1, 'no', '2024-09-19 14:52:50'),
(241, 1, 1, 'no', '2024-09-19 14:52:51'),
(242, 1, 1, 'no', '2024-09-19 14:54:17'),
(243, 1, 1, 'no', '2024-09-19 15:35:39'),
(244, 1, 1, 'no', '2024-09-19 16:18:54'),
(245, 1, 1, 'no', '2024-09-19 16:19:21'),
(246, 1, 1, 'no', '2024-09-19 16:19:53'),
(247, 1, 1, 'no', '2024-09-19 16:19:53'),
(248, 1, 1, 'no', '2024-09-19 16:19:54'),
(249, 1, 1, 'no', '2024-09-19 16:51:55'),
(250, 1, 1, 'no', '2024-09-19 16:52:10'),
(251, 1, 1, 'no', '2024-09-19 16:52:11'),
(252, 1, 1, 'no', '2024-09-19 16:52:12'),
(253, 1, 1, 'no', '2024-09-19 16:52:26'),
(254, 1, 1, 'no', '2024-09-20 11:18:46'),
(255, 2, 1, 'no', '2024-09-20 11:21:50'),
(256, 2, 1, 'no', '2024-09-20 11:21:51'),
(257, 1, 1, 'no', '2024-09-20 11:22:03'),
(258, 1, 1, 'no', '2024-09-20 11:22:10'),
(259, 1, 1, 'no', '2024-09-20 11:23:37'),
(260, 1, 1, 'no', '2024-09-20 11:23:45'),
(261, 1, 1, 'no', '2024-09-20 11:23:46'),
(262, 2, 1, 'no', '2024-09-20 12:04:21'),
(263, 1, 1, 'no', '2024-09-20 12:08:51'),
(264, 1, 1, 'no', '2024-09-20 12:08:53'),
(265, 1, 1, 'no', '2024-09-20 12:08:53'),
(266, 1, 1, 'no', '2024-09-20 12:11:43'),
(267, 1, 1, 'no', '2024-09-20 12:11:55'),
(268, 1, 1, 'no', '2024-09-20 12:12:07'),
(269, 1, 1, 'no', '2024-09-20 12:12:17'),
(270, 1, 1, 'no', '2024-09-20 12:12:26'),
(271, 2, 1, 'no', '2024-09-20 12:12:34'),
(272, 1, 1, 'no', '2024-09-20 12:14:49'),
(273, 1, 1, 'no', '2024-09-20 12:14:56'),
(274, 1, 1, 'no', '2024-09-20 12:15:02'),
(275, 1, 1, 'no', '2024-09-20 12:15:17'),
(276, 1, 1, 'no', '2024-09-20 12:16:44'),
(277, 1, 1, 'no', '2024-09-20 12:16:45'),
(278, 2, 1, 'no', '2024-09-20 12:16:46'),
(279, 2, 1, 'no', '2024-09-20 12:16:47'),
(280, 1, 1, 'no', '2024-09-20 12:16:48'),
(281, 2, 1, 'no', '2024-09-20 12:17:00'),
(282, 1, 1, 'no', '2024-09-20 12:17:15'),
(283, 1, 1, 'no', '2024-09-20 14:39:49'),
(284, 1, 1, 'no', '2024-09-20 14:40:26'),
(285, 1, 1, 'no', '2024-09-20 14:40:26'),
(286, 1, 1, 'no', '2024-09-20 14:41:39'),
(287, 47, 1, 'no', '2024-09-20 15:47:35'),
(288, 44, 1, 'no', '2024-09-20 15:47:38'),
(289, 41, 1, 'no', '2024-09-20 15:47:40'),
(290, 61, 1, 'no', '2024-09-21 10:49:45'),
(291, 2, 1, 'no', '2024-09-21 16:06:27'),
(292, 2, 1, 'no', '2024-09-21 16:06:29');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(150) DEFAULT NULL,
  `is_active` int DEFAULT '0',
  `is_system` int NOT NULL DEFAULT '0',
  `is_superadmin` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES
(1, 'Admin', NULL, 0, 1, 0, '2018-12-25 11:49:43'),
(2, 'Accountant', NULL, 0, 1, 0, '2018-12-25 11:49:38'),
(3, 'Doctor', NULL, 0, 1, 0, '2018-07-21 10:37:36'),
(4, 'Pharmacist', NULL, 0, 1, 0, '2018-07-21 10:38:26'),
(5, 'Lab Technician', NULL, 0, 1, 0, '2024-08-01 16:17:47'),
(6, 'Nurse', NULL, 0, 1, 0, '2024-08-01 16:18:02'),
(7, 'Super Admin', NULL, 0, 1, 1, '2018-12-25 11:52:24'),
(8, 'Receptionist', NULL, 0, 1, 0, '2018-12-25 11:50:22');

-- --------------------------------------------------------

--
-- Table structure for table `roles_permissions`
--

CREATE TABLE `roles_permissions` (
  `id` int NOT NULL,
  `role_id` int DEFAULT NULL,
  `perm_cat_id` int DEFAULT NULL,
  `can_view` int DEFAULT NULL,
  `can_add` int DEFAULT NULL,
  `can_edit` int DEFAULT NULL,
  `can_delete` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `roles_permissions`
--

INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES
(1, 1, 132, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(3, 1, 134, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(4, 1, 135, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(5, 1, 136, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(6, 1, 137, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(7, 1, 192, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(8, 1, 138, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(9, 1, 139, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(10, 1, 140, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(11, 1, 141, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(12, 1, 142, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(13, 1, 143, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(14, 1, 144, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(15, 1, 145, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(16, 1, 193, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(17, 1, 194, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(18, 1, 195, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(19, 1, 196, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(20, 1, 197, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(21, 1, 198, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(22, 1, 146, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(23, 1, 147, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(24, 1, 148, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(25, 1, 170, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(26, 1, 200, 1, 1, 0, 1, '2019-03-09 17:26:01'),
(27, 1, 201, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(28, 1, 149, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(29, 1, 150, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(30, 1, 175, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(31, 1, 152, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(32, 1, 153, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(33, 1, 171, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(34, 1, 163, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(35, 1, 164, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(36, 1, 167, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(37, 1, 168, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(38, 1, 169, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(39, 1, 202, 1, 1, 0, 1, '2019-03-09 17:26:01'),
(40, 1, 173, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(41, 1, 174, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(42, 1, 9, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(43, 1, 10, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(45, 1, 176, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(46, 1, 203, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(47, 1, 12, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(48, 1, 13, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(49, 1, 14, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(50, 1, 165, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(51, 1, 166, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(60, 1, 86, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(61, 1, 87, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(62, 1, 88, 1, 1, 1, 0, '2019-03-09 17:26:01'),
(63, 1, 89, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(64, 1, 90, 1, 1, 0, 1, '2019-03-09 17:26:01'),
(65, 1, 91, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(66, 1, 108, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(67, 1, 109, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(68, 1, 110, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(69, 1, 111, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(70, 1, 112, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(71, 1, 127, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(72, 1, 129, 0, 1, 0, 1, '2019-03-09 17:26:01'),
(73, 1, 43, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(74, 1, 44, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(75, 1, 46, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(76, 1, 27, 1, 1, 0, 1, '2019-03-09 17:26:01'),
(77, 1, 31, 1, 1, 0, 1, '2019-03-09 17:26:01'),
(78, 1, 32, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(79, 1, 33, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(80, 1, 34, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(81, 1, 35, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(82, 1, 104, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(83, 1, 61, 1, 1, 0, 1, '2019-03-09 17:26:01'),
(84, 1, 62, 1, 1, 0, 1, '2019-03-09 17:26:01'),
(85, 1, 63, 1, 1, 0, 1, '2019-03-09 17:26:01'),
(86, 1, 64, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(87, 1, 65, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(88, 1, 66, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(89, 1, 67, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(90, 1, 53, 0, 1, 0, 0, '2019-03-09 17:26:01'),
(91, 1, 54, 1, 0, 1, 0, '2019-03-09 17:26:01'),
(92, 1, 56, 1, 0, 1, 0, '2019-03-09 17:26:01'),
(93, 1, 57, 1, 0, 1, 0, '2019-03-09 17:26:01'),
(94, 1, 58, 1, 0, 1, 0, '2019-03-09 17:26:01'),
(95, 1, 59, 1, 0, 1, 0, '2019-03-09 17:26:01'),
(96, 1, 60, 1, 0, 1, 0, '2019-03-09 17:26:01'),
(97, 1, 126, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(98, 1, 130, 1, 1, 0, 1, '2019-03-09 17:26:01'),
(99, 1, 131, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(100, 1, 48, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(101, 1, 178, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(102, 1, 179, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(103, 1, 180, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(104, 1, 181, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(105, 1, 182, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(106, 1, 183, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(107, 1, 184, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(108, 1, 185, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(109, 1, 186, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(110, 1, 187, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(111, 1, 188, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(112, 1, 189, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(113, 1, 206, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(114, 1, 207, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(115, 1, 208, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(116, 1, 209, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(117, 1, 210, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(118, 1, 211, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(119, 1, 212, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(120, 1, 213, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(122, 1, 155, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(123, 1, 156, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(124, 1, 157, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(125, 1, 158, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(126, 1, 159, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(127, 1, 160, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(128, 1, 161, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(129, 1, 162, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(130, 1, 190, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(131, 1, 191, 1, 0, 0, 0, '2019-03-09 17:26:01'),
(132, 1, 102, 1, 1, 1, 1, '2019-03-09 17:26:01'),
(133, 2, 132, 1, 0, 0, 0, '2024-08-06 05:03:44'),
(135, 2, 138, 1, 0, 0, 0, '2024-08-06 05:06:35'),
(137, 2, 143, 1, 1, 1, 1, '2019-03-09 17:43:21'),
(138, 2, 144, 1, 1, 1, 1, '2019-03-09 17:43:21'),
(139, 2, 145, 1, 1, 1, 1, '2019-03-09 17:43:21'),
(140, 2, 193, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(141, 2, 194, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(142, 2, 195, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(145, 2, 148, 1, 1, 1, 1, '2024-08-06 05:08:29'),
(153, 2, 173, 1, 1, 1, 1, '2019-03-09 17:43:21'),
(154, 2, 174, 1, 1, 1, 1, '2019-03-09 17:43:21'),
(155, 2, 9, 1, 1, 1, 1, '2019-03-09 17:43:21'),
(156, 2, 10, 1, 1, 1, 1, '2019-03-09 17:43:21'),
(158, 2, 176, 1, 0, 0, 0, '2024-08-06 05:23:39'),
(159, 2, 203, 1, 0, 0, 0, '2024-08-06 05:23:39'),
(160, 2, 12, 1, 1, 1, 1, '2019-03-09 17:43:21'),
(161, 2, 13, 1, 1, 1, 1, '2019-03-09 17:43:21'),
(162, 2, 14, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(167, 2, 86, 1, 0, 0, 0, '2024-08-06 05:18:10'),
(169, 2, 88, 1, 1, 1, 0, '2019-03-09 17:43:21'),
(170, 2, 89, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(171, 2, 90, 1, 1, 0, 1, '2019-03-09 17:43:21'),
(172, 2, 91, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(174, 2, 109, 1, 1, 1, 1, '2019-03-09 17:43:21'),
(175, 2, 110, 1, 0, 0, 0, '2024-08-06 05:21:10'),
(178, 2, 127, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(184, 2, 31, 1, 1, 0, 1, '2019-03-09 17:43:21'),
(185, 2, 32, 1, 1, 1, 1, '2019-03-09 17:43:21'),
(186, 2, 33, 1, 1, 1, 1, '2019-03-09 17:43:21'),
(187, 2, 34, 1, 1, 1, 1, '2019-03-09 17:43:21'),
(188, 2, 35, 1, 1, 1, 1, '2019-03-09 17:43:21'),
(189, 2, 104, 1, 1, 1, 1, '2019-03-09 17:43:21'),
(190, 2, 48, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(191, 2, 178, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(192, 2, 179, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(193, 2, 180, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(194, 2, 181, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(195, 2, 182, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(196, 2, 184, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(197, 2, 185, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(198, 2, 186, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(201, 2, 206, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(202, 2, 207, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(203, 2, 208, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(205, 2, 210, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(206, 2, 211, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(207, 2, 212, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(208, 2, 213, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(210, 2, 155, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(211, 2, 156, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(212, 2, 157, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(213, 2, 158, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(214, 2, 159, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(215, 2, 160, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(216, 2, 161, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(217, 2, 162, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(218, 2, 190, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(219, 2, 191, 1, 0, 0, 0, '2019-03-09 17:43:21'),
(220, 2, 102, 1, 1, 1, 1, '2019-03-09 17:43:21'),
(221, 3, 132, 1, 1, 1, 1, '2024-08-13 11:22:38'),
(222, 3, 134, 1, 1, 1, 1, '2019-03-10 07:17:01'),
(223, 3, 135, 1, 1, 1, 1, '2019-03-10 07:17:01'),
(224, 3, 136, 1, 1, 1, 1, '2019-03-10 07:17:01'),
(225, 3, 137, 1, 1, 1, 1, '2019-03-10 07:17:01'),
(226, 3, 138, 1, 0, 1, 1, '2024-08-05 09:57:15'),
(227, 3, 139, 1, 0, 1, 1, '2024-08-05 09:57:15'),
(228, 3, 140, 1, 1, 1, 1, '2019-03-10 07:17:01'),
(229, 3, 141, 1, 1, 1, 1, '2019-03-10 07:17:01'),
(230, 3, 142, 1, 1, 1, 1, '2019-03-10 07:17:01'),
(236, 3, 163, 1, 0, 0, 0, '2024-08-05 10:12:20'),
(237, 3, 164, 1, 1, 1, 1, '2019-03-10 07:17:01'),
(238, 3, 167, 1, 0, 0, 0, '2019-03-10 07:17:01'),
(242, 3, 86, 1, 0, 0, 0, '2019-03-10 07:17:01'),
(243, 3, 109, 1, 1, 1, 1, '2019-03-10 07:17:01'),
(249, 3, 48, 1, 0, 0, 0, '2019-03-10 07:17:01'),
(250, 3, 178, 1, 0, 0, 0, '2019-03-10 07:17:01'),
(251, 3, 182, 1, 0, 0, 0, '2019-03-10 07:17:01'),
(253, 3, 208, 1, 0, 0, 0, '2019-03-10 07:17:01'),
(254, 3, 209, 1, 0, 0, 0, '2019-03-10 07:17:01'),
(256, 3, 155, 1, 0, 0, 0, '2019-03-10 07:17:01'),
(257, 3, 156, 1, 0, 0, 0, '2019-03-10 07:17:01'),
(262, 3, 102, 1, 1, 1, 1, '2019-03-10 07:17:01'),
(263, 4, 146, 1, 1, 1, 1, '2019-03-10 07:21:00'),
(264, 4, 147, 1, 1, 1, 1, '2019-03-10 07:21:00'),
(265, 4, 148, 1, 1, 1, 1, '2019-10-12 11:04:19'),
(266, 4, 170, 1, 1, 1, 1, '2019-03-10 07:21:00'),
(267, 4, 200, 1, 1, 0, 1, '2019-03-10 07:21:00'),
(268, 4, 86, 1, 0, 0, 0, '2019-03-10 07:21:00'),
(273, 4, 179, 1, 0, 0, 0, '2019-03-10 07:21:00'),
(275, 4, 157, 1, 0, 0, 0, '2019-03-10 07:21:00'),
(276, 4, 102, 1, 1, 1, 1, '2019-03-10 07:21:00'),
(277, 5, 149, 1, 1, 1, 1, '2019-03-10 07:23:30'),
(278, 5, 150, 1, 1, 1, 1, '2019-03-10 07:23:30'),
(279, 5, 175, 1, 1, 1, 1, '2019-03-10 07:23:30'),
(280, 5, 86, 1, 0, 0, 0, '2019-03-10 07:23:30'),
(281, 5, 109, 1, 1, 1, 1, '2019-03-10 07:23:30'),
(286, 5, 180, 1, 0, 0, 0, '2019-03-10 07:23:30'),
(288, 5, 158, 1, 0, 0, 0, '2019-03-10 07:23:30'),
(289, 5, 102, 1, 1, 1, 1, '2019-03-10 07:23:30'),
(290, 6, 152, 1, 1, 1, 1, '2024-09-05 07:36:37'),
(291, 6, 153, 1, 1, 1, 1, '2024-09-05 07:36:37'),
(294, 6, 109, 1, 1, 1, 1, '2019-03-10 07:31:58'),
(299, 6, 102, 1, 1, 1, 1, '2019-03-10 07:31:58'),
(300, 8, 132, 1, 1, 1, 0, '2024-08-03 05:26:33'),
(306, 8, 81, 1, 1, 1, 1, '2019-03-10 07:38:46'),
(376, 7, 237, 1, 0, 0, 0, '2024-08-08 06:15:36'),
(492, 8, 236, 1, 1, 1, 0, '2019-10-12 12:40:43'),
(493, 8, 146, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(495, 8, 138, 1, 1, 1, 0, '2024-08-03 05:26:33'),
(496, 8, 139, 1, 1, 1, 0, '2024-08-03 05:26:33'),
(500, 8, 143, 1, 1, 1, 1, '2024-09-10 05:57:01'),
(501, 8, 144, 1, 1, 1, 1, '2024-09-10 05:57:01'),
(502, 8, 145, 1, 1, 1, 1, '2024-09-10 05:57:01'),
(504, 8, 194, 1, 0, 0, 0, '2019-10-04 06:36:51'),
(506, 8, 196, 1, 0, 0, 0, '2024-08-12 11:43:06'),
(511, 8, 148, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(516, 8, 225, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(524, 4, 201, 1, 1, 1, 1, '2019-10-04 07:51:19'),
(540, 3, 245, 1, 0, 0, 0, '2024-08-13 11:48:03'),
(550, 4, 236, 1, 1, 1, 0, '2024-08-07 06:15:42'),
(571, 4, 256, 1, 0, 0, 0, '2019-10-04 11:36:02'),
(573, 4, 225, 1, 1, 1, 1, '2019-10-12 12:09:04'),
(574, 4, 226, 1, 1, 1, 1, '2019-10-12 12:09:04'),
(575, 4, 227, 1, 1, 1, 1, '2019-10-12 12:09:04'),
(580, 2, 221, 1, 1, 1, 1, '2019-10-12 11:56:04'),
(581, 2, 222, 1, 1, 1, 1, '2019-10-12 11:56:04'),
(582, 2, 223, 1, 1, 1, 1, '2019-10-12 11:56:04'),
(583, 2, 225, 1, 0, 0, 0, '2019-10-12 11:56:04'),
(587, 2, 249, 1, 1, 1, 1, '2019-10-12 11:56:04'),
(588, 2, 250, 1, 0, 0, 0, '2024-08-13 06:44:46'),
(589, 2, 251, 1, 0, 0, 0, '2019-10-12 11:56:04'),
(590, 2, 253, 1, 0, 0, 0, '2019-10-12 11:56:04'),
(591, 2, 254, 1, 0, 0, 0, '2019-10-12 11:56:04'),
(592, 2, 255, 1, 0, 0, 0, '2019-10-12 11:56:04'),
(594, 2, 238, 1, 0, 0, 0, '2019-10-12 11:56:04'),
(595, 2, 236, 1, 0, 0, 0, '2024-08-06 05:01:59'),
(597, 3, 192, 1, 1, 1, 1, '2019-10-12 12:02:53'),
(598, 3, 218, 1, 0, 0, 0, '2019-10-12 12:02:53'),
(599, 3, 219, 1, 0, 0, 0, '2019-10-12 12:02:53'),
(600, 3, 221, 0, 0, 1, 0, '2024-09-06 04:37:43'),
(606, 3, 197, 1, 1, 1, 1, '2019-10-12 12:02:53'),
(607, 3, 220, 1, 1, 1, 1, '2019-10-12 12:02:53'),
(608, 3, 248, 1, 1, 1, 1, '2019-10-12 12:02:53'),
(610, 3, 149, 1, 0, 0, 0, '2019-10-12 12:02:53'),
(611, 3, 152, 1, 0, 0, 0, '2019-10-12 12:02:53'),
(612, 3, 173, 1, 0, 0, 0, '2019-10-12 12:02:53'),
(613, 3, 174, 1, 0, 0, 0, '2019-10-12 12:02:53'),
(614, 3, 176, 1, 0, 0, 0, '2019-10-12 12:02:53'),
(615, 3, 228, 1, 0, 0, 0, '2019-10-12 12:02:53'),
(616, 3, 165, 1, 0, 0, 0, '2019-10-12 12:02:53'),
(617, 3, 214, 1, 1, 1, 1, '2019-10-12 12:02:53'),
(618, 3, 215, 1, 1, 1, 1, '2019-10-12 12:02:53'),
(622, 4, 109, 1, 1, 1, 1, '2019-10-12 12:09:04'),
(623, 5, 243, 1, 1, 1, 1, '2019-10-12 12:24:41'),
(624, 5, 236, 1, 1, 0, 0, '2024-08-07 10:08:20'),
(628, 6, 236, 1, 0, 0, 0, '2019-10-12 12:30:16'),
(629, 8, 135, 1, 1, 1, 0, '2024-08-03 05:26:33'),
(630, 8, 218, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(631, 8, 219, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(632, 8, 221, 1, 1, 1, 1, '2024-09-10 05:57:01'),
(633, 8, 222, 1, 1, 1, 1, '2024-09-10 05:57:01'),
(634, 8, 223, 1, 1, 1, 1, '2024-09-10 05:57:01'),
(635, 8, 149, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(636, 8, 152, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(637, 8, 163, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(638, 8, 167, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(639, 8, 173, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(640, 8, 174, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(641, 8, 176, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(642, 8, 228, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(643, 8, 165, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(644, 8, 166, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(645, 8, 214, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(646, 8, 215, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(647, 8, 82, 1, 1, 1, 1, '2019-10-12 12:40:43'),
(648, 8, 83, 1, 1, 1, 1, '2019-10-12 12:40:43'),
(649, 8, 84, 1, 1, 1, 1, '2019-10-12 12:40:43'),
(650, 8, 85, 1, 1, 1, 1, '2019-10-12 12:40:43'),
(651, 8, 204, 1, 1, 1, 1, '2019-10-12 12:40:43'),
(652, 8, 205, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(653, 8, 216, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(654, 8, 217, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(655, 8, 109, 1, 1, 1, 1, '2019-10-12 12:40:43'),
(659, 8, 31, 1, 1, 0, 1, '2024-09-05 07:33:52'),
(660, 8, 32, 1, 1, 1, 1, '2024-09-05 07:33:52'),
(661, 8, 33, 1, 1, 1, 1, '2024-09-05 07:33:52'),
(662, 8, 48, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(663, 8, 178, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(664, 8, 180, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(665, 8, 181, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(666, 8, 186, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(667, 8, 207, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(668, 8, 208, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(669, 8, 209, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(670, 8, 253, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(671, 8, 254, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(672, 8, 255, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(674, 8, 238, 1, 0, 0, 0, '2019-10-12 12:40:43'),
(675, 8, 102, 1, 1, 1, 1, '2019-10-12 12:40:43'),
(678, 8, 86, 1, 0, 0, 0, '2019-10-12 13:16:52'),
(679, 8, 182, 1, 0, 0, 0, '2019-10-12 13:16:52'),
(680, 2, 147, 1, 0, 0, 0, '2019-10-14 09:34:51'),
(681, 2, 200, 1, 0, 0, 0, '2019-10-14 09:34:51'),
(683, 2, 146, 1, 0, 0, 0, '2019-10-14 09:39:47'),
(684, 1, 218, 1, 0, 0, 0, '2019-10-15 06:18:33'),
(685, 1, 219, 1, 0, 0, 0, '2019-10-15 06:18:33'),
(686, 1, 221, 1, 1, 1, 1, '2019-10-15 06:18:33'),
(687, 1, 222, 1, 1, 1, 1, '2019-10-15 06:18:33'),
(688, 1, 223, 1, 1, 1, 1, '2019-10-15 06:18:33'),
(689, 1, 220, 1, 1, 1, 1, '2019-10-15 06:18:33'),
(690, 1, 248, 1, 1, 1, 1, '2019-10-15 06:18:33'),
(691, 1, 224, 1, 0, 0, 0, '2019-10-15 06:18:33'),
(692, 1, 225, 1, 1, 1, 1, '2019-10-15 06:18:33'),
(693, 1, 226, 1, 1, 1, 1, '2019-10-15 06:18:33'),
(694, 1, 227, 1, 1, 1, 1, '2019-10-15 06:18:33'),
(695, 1, 243, 1, 1, 1, 1, '2019-10-15 06:18:33'),
(696, 1, 257, 1, 1, 1, 1, '2019-10-15 06:18:33'),
(697, 1, 244, 1, 1, 1, 1, '2019-10-15 06:18:33'),
(698, 1, 245, 1, 1, 1, 1, '2019-10-15 06:18:33'),
(699, 1, 246, 1, 1, 1, 1, '2019-10-15 06:18:33'),
(700, 1, 252, 1, 0, 0, 0, '2019-10-15 06:18:33'),
(701, 1, 228, 1, 1, 1, 1, '2019-10-15 06:18:33'),
(702, 1, 247, 1, 1, 1, 1, '2019-10-15 06:18:33'),
(703, 1, 214, 1, 1, 1, 1, '2019-10-15 06:18:33'),
(704, 1, 215, 1, 1, 1, 1, '2019-10-15 06:18:33'),
(705, 1, 240, 1, 1, 1, 1, '2019-10-15 06:18:33'),
(706, 1, 241, 1, 1, 1, 1, '2019-10-15 06:18:33'),
(707, 1, 242, 1, 1, 1, 1, '2019-10-15 06:18:33'),
(710, 1, 229, 1, 0, 0, 0, '2019-10-15 06:18:33'),
(711, 1, 249, 1, 1, 1, 1, '2019-10-15 06:18:33'),
(712, 1, 250, 1, 0, 0, 0, '2019-10-15 06:18:33'),
(713, 1, 251, 1, 0, 0, 0, '2019-10-15 06:18:33'),
(714, 1, 253, 1, 0, 0, 0, '2019-10-15 06:18:33'),
(715, 1, 254, 1, 0, 0, 0, '2019-10-15 06:18:33'),
(716, 1, 255, 1, 0, 0, 0, '2019-10-15 06:18:33'),
(717, 1, 256, 1, 0, 0, 0, '2019-10-15 06:18:33'),
(718, 1, 258, 1, 0, 0, 0, '2019-10-15 06:18:33'),
(719, 1, 259, 1, 0, 0, 0, '2019-10-15 06:18:33'),
(720, 1, 238, 1, 0, 0, 0, '2019-10-15 06:18:33'),
(721, 1, 236, 1, 1, 1, 1, '2019-10-15 06:18:33'),
(722, 1, 237, 1, 0, 0, 0, '2019-10-15 06:18:33'),
(723, 1, 239, 1, 0, 0, 0, '2019-10-15 06:18:33'),
(725, 3, 150, 1, 0, 0, 0, '2019-10-19 04:38:20'),
(726, 3, 153, 1, 0, 0, 0, '2019-10-19 04:38:20'),
(727, 3, 238, 1, 0, 0, 0, '2019-11-01 05:40:24'),
(728, 5, 257, 1, 1, 1, 1, '2024-08-02 10:24:56'),
(729, 5, 152, 1, 1, 1, 1, '2024-08-02 10:24:56'),
(730, 5, 153, 1, 1, 1, 1, '2024-08-02 10:24:56'),
(731, 5, 171, 1, 1, 1, 1, '2024-08-02 10:24:56'),
(732, 5, 244, 1, 1, 1, 1, '2024-08-02 10:24:56'),
(738, 5, 181, 1, 0, 0, 0, '2024-08-02 10:24:56'),
(742, 5, 159, 1, 0, 0, 0, '2024-08-02 10:24:56'),
(744, 6, 132, 1, 0, 0, 0, '2024-08-13 12:16:04'),
(745, 6, 134, 1, 0, 0, 0, '2024-08-08 05:54:00'),
(746, 6, 135, 1, 0, 0, 0, '2024-08-08 05:54:00'),
(747, 6, 136, 1, 0, 0, 0, '2024-08-08 05:54:00'),
(748, 6, 137, 1, 1, 1, 1, '2024-08-08 05:54:00'),
(750, 6, 218, 1, 0, 0, 0, '2024-08-02 10:42:59'),
(751, 6, 219, 1, 0, 0, 0, '2024-08-02 10:42:59'),
(755, 6, 138, 1, 0, 0, 0, '2024-08-08 05:54:00'),
(756, 6, 139, 1, 0, 0, 0, '2024-08-08 05:54:00'),
(757, 6, 140, 1, 0, 0, 0, '2024-08-08 05:54:00'),
(758, 6, 141, 1, 0, 0, 0, '2024-08-08 05:54:00'),
(759, 6, 142, 1, 1, 1, 1, '2024-08-08 05:54:00'),
(766, 6, 196, 1, 0, 0, 0, '2024-08-02 10:42:59'),
(768, 6, 198, 1, 0, 0, 0, '2024-08-02 10:42:59'),
(781, 6, 149, 1, 1, 1, 1, '2024-09-05 07:36:37'),
(782, 6, 150, 1, 1, 1, 1, '2024-09-05 07:36:37'),
(785, 6, 257, 1, 1, 1, 1, '2024-09-05 07:36:37'),
(787, 6, 163, 1, 0, 0, 0, '2024-08-02 10:42:59'),
(788, 6, 164, 1, 0, 0, 0, '2024-08-02 10:42:59'),
(798, 8, 134, 1, 1, 1, 0, '2024-08-03 05:26:33'),
(799, 8, 136, 1, 0, 0, 0, '2024-09-10 05:23:55'),
(800, 8, 137, 1, 1, 1, 0, '2024-08-03 05:26:33'),
(802, 8, 140, 1, 1, 1, 0, '2024-08-03 05:26:33'),
(803, 8, 141, 1, 0, 0, 0, '2024-09-10 05:23:55'),
(804, 8, 142, 1, 1, 1, 0, '2024-08-03 05:26:33'),
(805, 8, 193, 1, 0, 0, 0, '2024-08-03 05:26:33'),
(806, 8, 195, 1, 0, 0, 0, '2024-08-03 05:26:33'),
(807, 3, 146, 1, 1, 0, 0, '2024-08-05 08:58:11'),
(808, 8, 153, 1, 0, 0, 0, '2024-08-03 09:21:06'),
(811, 3, 148, 1, 0, 0, 0, '2024-08-05 07:10:59'),
(813, 3, 200, 1, 0, 0, 0, '2024-08-05 07:10:59'),
(814, 3, 201, 1, 0, 0, 0, '2024-08-05 07:10:59'),
(817, 3, 227, 1, 0, 0, 0, '2024-08-05 07:10:59'),
(818, 3, 180, 1, 0, 0, 0, '2024-08-05 07:50:58'),
(819, 3, 181, 1, 0, 0, 0, '2024-08-05 07:50:58'),
(820, 3, 170, 1, 0, 0, 0, '2024-08-05 09:01:17'),
(821, 3, 240, 1, 1, 1, 1, '2024-08-05 11:52:52'),
(822, 3, 236, 1, 0, 0, 0, '2024-08-05 12:06:42'),
(823, 2, 135, 1, 0, 0, 0, '2024-08-06 05:04:40'),
(824, 2, 248, 1, 0, 0, 0, '2024-08-06 05:06:35'),
(825, 2, 139, 1, 0, 0, 0, '2024-08-06 05:06:54'),
(826, 2, 201, 1, 0, 0, 0, '2024-08-06 05:08:29'),
(828, 2, 228, 1, 0, 0, 0, '2024-08-06 05:23:39'),
(829, 2, 149, 1, 0, 0, 0, '2024-08-06 05:37:56'),
(830, 2, 257, 1, 0, 0, 0, '2024-08-06 05:37:56'),
(831, 2, 152, 1, 0, 0, 0, '2024-08-06 05:37:56'),
(832, 2, 163, 1, 0, 0, 0, '2024-08-06 05:37:56'),
(833, 2, 153, 1, 0, 0, 0, '2024-08-06 05:39:25'),
(834, 2, 165, 1, 0, 0, 0, '2024-08-06 09:58:44'),
(835, 2, 166, 1, 0, 0, 0, '2024-08-06 09:58:44'),
(839, 6, 214, 1, 1, 1, 0, '2024-08-06 10:22:51'),
(840, 6, 215, 1, 1, 1, 0, '2024-08-06 10:22:51'),
(842, 6, 241, 1, 1, 1, 0, '2024-08-06 10:22:51'),
(845, 3, 257, 1, 0, 0, 0, '2024-08-06 11:25:29'),
(846, 3, 260, 1, 0, 0, 0, '2024-08-06 11:25:29'),
(847, 2, 192, 1, 0, 0, 0, '2024-08-06 12:12:37'),
(850, 5, 176, 1, 1, 1, 1, '2024-08-07 12:13:08'),
(851, 5, 203, 1, 1, 1, 1, '2024-08-07 12:13:08'),
(852, 6, 36, 0, 0, 0, 0, '2024-08-08 06:19:09'),
(853, 6, 86, 1, 0, 0, 0, '2024-08-08 08:05:44'),
(854, 8, 80, 1, 1, 1, 1, '2024-08-12 11:43:06'),
(855, 8, 258, 1, 0, 0, 0, '2024-08-12 11:54:10'),
(856, 8, 259, 1, 0, 0, 0, '2024-08-12 11:54:10'),
(857, 3, 147, 1, 0, 0, 0, '2024-08-12 11:57:32'),
(858, 8, 147, 1, 0, 0, 0, '2024-08-13 05:26:01'),
(859, 2, 197, 1, 0, 0, 0, '2024-08-13 07:22:08'),
(865, 2, 262, 1, 0, 0, 0, '2024-08-13 07:30:34'),
(866, 3, 90, 1, 0, 0, 0, '2024-08-13 07:34:45'),
(868, 4, 90, 1, 0, 0, 0, '2024-08-13 07:36:04'),
(870, 5, 90, 1, 0, 0, 0, '2024-08-13 07:36:28'),
(872, 6, 90, 1, 0, 0, 0, '2024-08-13 07:39:26'),
(873, 8, 90, 1, 0, 0, 0, '2024-08-13 07:39:46'),
(874, 5, 260, 1, 1, 1, 1, '2024-08-23 06:04:30'),
(875, 8, 9, 1, 1, 1, 1, '2024-09-05 07:25:44'),
(876, 8, 10, 1, 1, 1, 1, '2024-09-05 07:25:44'),
(877, 8, 252, 1, 0, 0, 0, '2024-09-05 07:25:44'),
(878, 8, 12, 1, 1, 1, 1, '2024-09-05 07:25:44'),
(879, 8, 13, 1, 1, 1, 1, '2024-09-05 07:25:44'),
(880, 8, 14, 1, 0, 0, 0, '2024-09-05 07:25:44'),
(881, 8, 210, 1, 0, 0, 0, '2024-09-05 07:26:44'),
(882, 8, 250, 1, 0, 0, 0, '2024-09-05 07:26:44'),
(883, 8, 251, 1, 0, 0, 0, '2024-09-05 07:26:44'),
(884, 8, 179, 1, 0, 0, 0, '2024-09-05 07:28:55'),
(885, 8, 184, 1, 0, 0, 0, '2024-09-05 07:28:55'),
(886, 8, 185, 1, 0, 0, 0, '2024-09-05 07:28:55'),
(887, 8, 206, 1, 0, 0, 0, '2024-09-05 07:28:55'),
(888, 8, 211, 1, 0, 0, 0, '2024-09-05 07:28:55'),
(889, 8, 212, 1, 0, 0, 0, '2024-09-05 07:28:55'),
(890, 8, 213, 1, 0, 0, 0, '2024-09-05 07:28:55'),
(891, 8, 192, 1, 1, 1, 0, '2024-09-05 07:30:26'),
(892, 8, 262, 1, 1, 1, 0, '2024-09-05 07:30:26'),
(893, 8, 197, 1, 1, 1, 0, '2024-09-05 07:30:26'),
(894, 8, 248, 1, 1, 1, 0, '2024-09-05 07:30:26'),
(895, 8, 201, 1, 1, 1, 0, '2024-09-05 07:30:26'),
(896, 8, 243, 1, 1, 1, 0, '2024-09-05 07:30:26'),
(897, 8, 244, 1, 1, 1, 0, '2024-09-05 07:30:26'),
(898, 8, 245, 1, 1, 1, 0, '2024-09-05 07:30:26'),
(899, 8, 246, 1, 1, 1, 0, '2024-09-05 07:30:26'),
(900, 8, 247, 1, 1, 1, 0, '2024-09-05 07:30:26'),
(901, 8, 240, 1, 1, 1, 0, '2024-09-05 07:30:26'),
(902, 8, 242, 1, 1, 1, 0, '2024-09-05 07:30:26'),
(903, 8, 249, 1, 1, 1, 0, '2024-09-05 07:30:26'),
(904, 8, 110, 1, 0, 0, 0, '2024-09-05 07:31:56'),
(905, 8, 34, 1, 1, 1, 1, '2024-09-05 07:33:52'),
(906, 8, 35, 1, 1, 1, 1, '2024-09-05 07:33:52'),
(907, 8, 104, 1, 1, 1, 1, '2024-09-05 07:33:52'),
(908, 6, 175, 1, 1, 1, 1, '2024-09-05 07:36:37'),
(909, 6, 243, 1, 1, 1, 1, '2024-09-05 07:36:37'),
(910, 6, 171, 1, 1, 1, 1, '2024-09-05 07:36:37'),
(911, 6, 244, 1, 1, 1, 1, '2024-09-05 07:36:37'),
(912, 6, 260, 1, 1, 1, 1, '2024-09-05 07:36:37'),
(913, 6, 180, 1, 0, 0, 0, '2024-09-05 07:37:15'),
(914, 6, 181, 1, 0, 0, 0, '2024-09-05 07:37:15'),
(915, 1, 263, 1, 1, 1, 1, '2024-09-06 09:40:21'),
(916, 2, 140, 1, 0, 0, 0, '2024-09-10 04:44:29'),
(917, 2, 136, 1, 0, 0, 0, '2024-09-10 04:44:57'),
(918, 2, 137, 1, 0, 0, 0, '2024-09-10 04:44:57'),
(919, 2, 141, 1, 0, 0, 0, '2024-09-10 04:45:31'),
(920, 2, 142, 1, 0, 0, 0, '2024-09-10 04:45:31'),
(921, 2, 43, 1, 1, 1, 1, '2024-09-10 06:21:46'),
(922, 2, 44, 1, 0, 0, 0, '2024-09-10 06:21:46'),
(923, 2, 46, 1, 0, 0, 0, '2024-09-10 06:21:46'),
(924, 2, 27, 1, 1, 0, 1, '2024-09-10 06:21:46'),
(925, 3, 43, 1, 1, 1, 1, '2024-09-10 06:22:44'),
(926, 3, 44, 1, 0, 0, 0, '2024-09-10 06:22:44'),
(927, 3, 46, 1, 0, 0, 0, '2024-09-10 06:22:44'),
(928, 3, 27, 1, 1, 0, 1, '2024-09-10 06:22:44'),
(929, 4, 43, 1, 1, 1, 1, '2024-09-10 06:23:09'),
(930, 4, 44, 1, 0, 0, 0, '2024-09-10 06:23:09'),
(931, 4, 46, 1, 0, 0, 0, '2024-09-10 06:23:09'),
(932, 4, 27, 1, 1, 0, 1, '2024-09-10 06:23:09'),
(933, 5, 43, 1, 1, 1, 1, '2024-09-10 06:23:30'),
(934, 5, 44, 1, 0, 0, 0, '2024-09-10 06:23:30'),
(935, 5, 46, 1, 0, 0, 0, '2024-09-10 06:23:30'),
(936, 5, 27, 1, 1, 0, 1, '2024-09-10 06:23:30'),
(937, 6, 43, 1, 1, 1, 1, '2024-09-10 06:23:51'),
(938, 6, 44, 1, 0, 0, 0, '2024-09-10 06:23:51'),
(939, 6, 46, 1, 0, 0, 0, '2024-09-10 06:23:51'),
(940, 6, 27, 1, 1, 0, 1, '2024-09-10 06:23:51'),
(941, 8, 43, 1, 1, 1, 1, '2024-09-10 06:24:09'),
(942, 8, 44, 1, 0, 0, 0, '2024-09-10 06:24:09'),
(943, 8, 46, 1, 0, 0, 0, '2024-09-10 06:24:09'),
(944, 8, 27, 1, 1, 0, 1, '2024-09-10 06:24:09'),
(945, 8, 264, 1, 0, 1, 0, '2024-09-10 12:32:57'),
(946, 8, 220, 1, 0, 0, 0, '2024-09-11 04:37:09'),
(947, 3, 264, 1, 0, 1, 0, '2024-09-11 09:27:15'),
(948, 1, 264, 1, 0, 1, 0, '2024-09-11 09:27:54'),
(949, 2, 264, 1, 0, 1, 0, '2024-09-11 09:28:31'),
(950, 4, 264, 1, 0, 1, 0, '2024-09-11 09:28:51'),
(951, 5, 264, 1, 0, 1, 0, '2024-09-11 09:29:02'),
(952, 6, 264, 1, 0, 1, 0, '2024-09-11 09:29:16'),
(953, 8, 198, 1, 0, 0, 0, '2024-09-18 10:22:03'),
(954, 6, 266, 1, 0, 0, 0, '2024-10-03 05:39:20'),
(955, 6, 267, 1, 1, 1, 1, '2024-10-03 05:39:44');

-- --------------------------------------------------------

--
-- Table structure for table `sch_settings`
--

CREATE TABLE `sch_settings` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text,
  `lang_id` int DEFAULT NULL,
  `dise_code` varchar(50) DEFAULT NULL,
  `date_format` varchar(50) NOT NULL,
  `time_format` varchar(20) DEFAULT '24-hour',
  `currency` varchar(50) NOT NULL,
  `currency_symbol` varchar(50) NOT NULL,
  `is_rtl` varchar(10) DEFAULT 'disabled',
  `timezone` varchar(30) DEFAULT 'UTC',
  `session_id` int DEFAULT NULL,
  `start_month` varchar(40) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `mini_logo` varchar(200) NOT NULL,
  `theme` varchar(200) NOT NULL DEFAULT 'default.jpg',
  `credit_limit` varchar(255) DEFAULT NULL,
  `opd_record_month` varchar(50) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cron_secret_key` varchar(100) NOT NULL,
  `fee_due_days` int DEFAULT '0',
  `doctor_restriction` varchar(100) NOT NULL,
  `superadmin_restriction` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `sch_settings`
--

INSERT INTO `sch_settings` (`id`, `name`, `email`, `phone`, `address`, `lang_id`, `dise_code`, `date_format`, `time_format`, `currency`, `currency_symbol`, `is_rtl`, `timezone`, `session_id`, `start_month`, `image`, `mini_logo`, `theme`, `credit_limit`, `opd_record_month`, `is_active`, `created_at`, `cron_secret_key`, `fee_due_days`, `doctor_restriction`, `superadmin_restriction`) VALUES
(0, 'Nabdul-Amal  Medical Clinics', 'care@drsmart.3sd.com', '+9656789871', 'IRC Village', 4, 'Your Hospital Code', 'd-m-Y', '12-hour', 'JOD', 'JOD', 'disabled', 'Asia/Kolkata', NULL, '', '0.png', '0mini_logo.png', '', '20000', '01', 'no', '2024-09-25 10:19:23', 'FXb3gsMlQe4wRCRd4jbdf3684', 60, 'enabled', 'enabled');

-- --------------------------------------------------------

--
-- Table structure for table `send_notification`
--

CREATE TABLE `send_notification` (
  `id` int NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `message` text,
  `visible_student` varchar(10) NOT NULL DEFAULT 'no',
  `visible_staff` varchar(10) NOT NULL DEFAULT 'no',
  `visible_parent` varchar(10) NOT NULL DEFAULT 'no',
  `created_by` varchar(60) DEFAULT NULL,
  `created_id` int DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `send_notification`
--

INSERT INTO `send_notification` (`id`, `title`, `publish_date`, `date`, `message`, `visible_student`, `visible_staff`, `visible_parent`, `created_by`, `created_id`, `is_active`, `created_at`) VALUES
(1, 'Staff Notice', '2024-08-09', '2024-08-09', '<p>All staff are requested to come on sunday.</p>', 'No', 'Yes', 'No', 'admin', 1, 'no', '2024-08-09 07:36:35'),
(2, 'Ganesh Puja Celebration', '2024-09-07', '2024-09-03', '<p>\r\n\r\nAll staff are requested to come on Saturday for Ganesh Puja Celebration.<br></p>', 'No', 'Yes', 'No', 'admin', 1, 'no', '2024-09-04 04:42:02');

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `id` int NOT NULL,
  `name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_from` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_to` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`id`, `name`, `time_from`, `time_to`, `is_active`) VALUES
(1, 'Morning', '6:00 AM', '02:00 PM', 1),
(2, 'Noon', '2:00 PM', '10:00 PM', 1),
(3, 'Evening', '4:00 PM', '12:00 AM', 1),
(4, 'Night', '10:00 PM', '6:00 AM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_config`
--

CREATE TABLE `sms_config` (
  `id` int NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `api_id` varchar(100) NOT NULL,
  `authkey` varchar(100) NOT NULL,
  `senderid` varchar(100) NOT NULL,
  `contact` text,
  `username` varchar(150) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'disabled',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `source`
--

CREATE TABLE `source` (
  `id` int NOT NULL,
  `source` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `source`
--

INSERT INTO `source` (`id`, `source`, `description`) VALUES
(1, 'Online Advertising', 'Online advertising, also known as online marketing, Internet advertising, digital advertising or web advertising, is a form of marketing and advertising which uses the Internet to deliver promotional marketing messages to consumers.'),
(2, 'From visitors', 'Visitor centers used to provide fairly basic information about the place, corporation or event they are celebrating, acting more as the entry way to a place. The role of the visitor center has been rapidly evolving over the past 10 years to become more of an experience and to tell the story of the place or brand it represents. Many have become destinations and experiences in their own right.'),
(3, 'Front Office', '');

-- --------------------------------------------------------

--
-- Table structure for table `specialist`
--

CREATE TABLE `specialist` (
  `id` int NOT NULL,
  `specialist_name` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int NOT NULL,
  `employee_id` varchar(200) NOT NULL,
  `department` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `qualification` varchar(200) NOT NULL,
  `work_exp` varchar(200) NOT NULL,
  `specialization` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `father_name` varchar(200) NOT NULL,
  `mother_name` varchar(200) NOT NULL,
  `contact_no` varchar(200) NOT NULL,
  `emergency_contact_no` varchar(200) NOT NULL,
  `pan_num` varchar(255) NOT NULL,
  `national_ide_no` varchar(255) NOT NULL,
  `local_ide_no` varchar(255) NOT NULL,
  `email` varchar(200) NOT NULL,
  `username` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `marital_status` varchar(100) NOT NULL,
  `date_of_joining` date NOT NULL,
  `date_of_leaving` date NOT NULL,
  `local_address` varchar(300) NOT NULL,
  `permanent_address` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `password` varchar(250) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `blood_group` varchar(100) NOT NULL,
  `account_title` varchar(200) NOT NULL,
  `bank_account_no` varchar(200) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `ifsc_code` varchar(200) NOT NULL,
  `bank_branch` varchar(100) NOT NULL,
  `payscale` varchar(200) NOT NULL,
  `basic_salary` varchar(200) NOT NULL,
  `epf_no` varchar(200) NOT NULL,
  `contract_type` varchar(100) NOT NULL,
  `shift` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `linkedin` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  `resume` varchar(200) NOT NULL,
  `joining_letter` varchar(200) NOT NULL,
  `resignation_letter` varchar(200) NOT NULL,
  `other_document_name` varchar(200) NOT NULL,
  `other_document_file` varchar(200) NOT NULL,
  `user_id` int NOT NULL,
  `is_active` int NOT NULL,
  `verification_code` varchar(100) NOT NULL,
  `Morning` int NOT NULL DEFAULT '0',
  `Noon` int NOT NULL DEFAULT '0',
  `Evening` int NOT NULL DEFAULT '0',
  `Night` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `pan_num`, `national_ide_no`, `local_ide_no`, `email`, `username`, `pwd`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `Morning`, `Noon`, `Evening`, `Night`) VALUES
(1, '', 'select', '', '', '', '', 'Super Admin', '', '', '', '+9625523488', '+9625523488', '', '', '', 'admin@drsmart.com', '', '', '1990-06-08', 'Married', '2024-08-20', '0000-00-00', '', '', '', '', '$2y$10$HMUD0J2syBaggR1BdQZ4NOUpl4zXl0XNK63DVD6yk7jW04A8A8JzG', 'Male', 'AB+', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0),
(2, '1001', '4', '4', 'BA', '2 years', '', 'Layla', 'Hassan', 'Omar Hassan', 'Aisha Hassan', '+9625523456', '+962', 'PAN12345', 'NIN675', 'LIN765', 'receptionist@drsmart.com', 'receptionist@123', '', '2010-02-09', 'Single', '2021-06-10', '0000-00-00', '5678 Al Falah Street, Dubai, UAE', '5678 Al Falah Street, Dubai, UAE', '', '2.png', '$2y$10$hbjcozYVCrqbDsM8NScFG.ZoBuIWw5EXAXwDegLS8QbvMc9YfOtjy', 'Female', 'A+', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0),
(3, '1002', '2', '10', 'MBBS', '5 year', 'Medicine', 'Ahmed', 'Al-Masri', 'Mohammed Al-Masri', 'Fatima Al-Masri', '+9625012345', '+9625012345', '', '', '', 'doctor@drsmart.com', '', '', '1996-03-12', 'Married', '2020-03-19', '0000-00-00', '1234 Al Wahda Street, Abu Dhabi, UAE', '1234 Al Wahda Street, Abu Dhabi, UAE', 'ok', '', '$2y$10$BIN0ZUIyuxljyjJNW8AVdOj7NHNrRKMLaB17cvlScENwEKpbVD0Se', 'Male', 'O-', '', '', '', '', '', '', '  cc bcv', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0),
(4, '1003', '7', '10', 'MBBS', '4 year', 'Surgery ', 'Khaled', 'Nasser', 'Youssef Nasser', 'Hanan Nasser', '+9625234567', '+9625234567', '', '', '', 'khaled@drsmart.com', '', '', '1999-02-10', 'Single', '2021-11-09', '0000-00-00', '9101 Al Khalidiya Street, Sharjah, UAE', '9101 Al Khalidiya Street, Sharjah, UAE', 'ok', '', '$2y$10$z61JyIiWDzKUo.a2kCajJOODLXOmSMpNGO3kk0eHXV9s85KvTgJOS', 'Male', 'A-', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0),
(5, '1004', '3', '10', 'MS', '3 year', 'Child specialist', 'Noor', 'Abdullah', 'Saeed Abdullah', 'Reem Abdullah', '+9625645678', '', '', '', '', 'noor@drsmart.com', '', '', '2002-09-11', 'Single', '2024-02-02', '0000-00-00', '1122 Al Majaz Street, Ajman, UAE', '1122 Al Majaz Street, Ajman, UAE', 'ok', '', '$2y$10$tsmfQJxuwC6ghHSkZmIvlOKXx3zlMlbMquVHIeBcd9rr5REy2pogO', 'Female', 'A-', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0),
(6, '1005', '2', '10', 'MS,MBBS', '10 years', 'Neurologist ', 'Sami', 'Al-Harbi', 'Hassan Al-Harbi', 'Salma Al-Harbi', '+9625456789', '+9625456789', '', '', '', 'sami@drsmart.com', '', '', '1989-07-12', 'Married', '2019-04-27', '0000-00-00', '3344 Al Qusais Street, Dubai, UAE', '3344 Al Qusais Street, Dubai, UAE', 'ok', '', '$2y$10$EBWizpdQsn5gTdmQe1uCaORoeBXgVBY.i5DPD6OsKPIj51rOMyFJq', 'Male', 'AB+', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0),
(7, '1006', '2', '10', 'MBBS', '2 year', 'Cardiology', 'Amina', 'Saeed', 'Khalil Saeed', 'Nadia Saeed', '+9625867890', '+9625867890', '', '', '', 'amina@drsmart.com', '', '', '1997-03-12', 'Single', '2023-12-19', '0000-00-00', '5566 Al Rigga Street, Abu Dhabi, UAE', '5566 Al Rigga Street, Abu Dhabi, UAE', 'ok', '', '$2y$10$rD94UDL/AjQ6XlBBWtVcsORL7OP/GbY/KPC7o9E3fWpBklKePZlVC', 'Female', 'O-', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0),
(8, '1007', '10', '5', 'BCOM', '3 years', '', 'Omar', 'Zayed', 'Faisal Zayed', 'Layla Zayed', '+9625078901', '', '', '', '', 'accountant@drsmart.com', '', '', '1990-08-13', 'Married', '2016-03-17', '0000-00-00', '7788 Al Nahda Street, Sharjah, UAE', '7788 Al Nahda Street, Sharjah, UAE', '', '', '$2y$10$SPyOb/6EhkGBjEBkwWgh3O2YLZkArUlVBFs4PcXhWKyE6Smh0hgiS', 'Male', 'B+', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0),
(9, '1008', '3', '8', 'Nursing', '2 years', '', 'Hala', 'Jaber', 'Tariq Jaber', 'Samira Jaber', '+9625589012', '', '', '', '', 'nurse@drsmart.com', '', '', '2001-02-14', 'Single', '2019-02-20', '0000-00-00', '9900 Al Garhoud Street, Dubai, UAE', '9900 Al Garhoud Street, Dubai, UAE', '', '', '$2y$10$3PjfmuLQX3ZsQGFdq9Pp2eeppVMuh0zhCqtJD6LbjHauxNtjpgBJ2', 'Female', 'A+', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0),
(10, '1009', '5', '18', 'Diploma in Pharmacy', '6 years', '', 'Nabil', 'Faris', 'Mahmoud Faris', 'Khadija Faris', '+9622901239', '+9654556677', '', '', '', 'pharmacist@drsmart.com', '', '', '1994-10-18', 'Married', '2023-08-23', '0000-00-00', '1123 Al Barsha Street, Abu Dhabi, UAE', '1123 Al Barsha Street, Abu Dhabi, UAE', '', '', '$2y$10$JgvpT7T0DnnkLGWGfkiAKecn3nWEheXXPTSVQwOaDMKNMbOSvt2zu', 'Male', 'O+', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0),
(11, '1010', '1', '12', 'B.Sc clinical laboratory Technology', '2.5 years', '', 'Salma', 'Kamel', 'Ibrahim Kamel', 'Noor Kamel', '+9625601234', '', '', '', '', 'lab@drsmart.com', '', '', '1998-10-20', 'Married', '2020-05-14', '0000-00-00', '3345 Al Satwa Street, Dubai, UAE', '3345 Al Satwa Street, Dubai, UAE', '', '', '$2y$10$PWUvpfhbNKSt0kWII32oo.Wqvg3tWlN8Q9MZqEPgV8hbR5A28OW6m', 'Female', 'AB+', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0),
(13, '1011', '4', '4', '', '', '', 'Kharid', 'Khan', 'Juber Khan', 'Nagma Khan', '+9625678907', '+9625678907', '', '', '', 'Kharid123@gmail.com', '', '', '2001-02-28', 'Single', '2024-08-01', '0000-00-00', '', '', '', '', '$2y$10$6gqpAxYd6h1j02FgqSXBUODRw2b8ujlrk5veen8HFFn6SCuttUorO', 'Male', 'B+', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0),
(24, '1012', '10', '29', '', '', '', 'Nashir', 'Shaikh', '', '', '+9654561231', '+965', '', '', '', 'nashir.shaikh@gmail.com', '', '', '1999-01-19', 'Married', '2024-09-03', '0000-00-00', '', '', '', '', '$2y$10$xyCR4FqiLRUSHwxvhB4YxO/MEgIVZNqombeeqtMfM6EMRIQ5yZKVa', 'Male', 'B+', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0),
(25, '1013', '10', '28', '', '', '', 'Rakhan', 'Ali', '', '', '+9656543434', '+965', '', ' ', '', 'rakhan.ali@gmail.com', '', '', '1990-03-01', '', '2024-09-03', '0000-00-00', '', '', '', '25.png', '$2y$10$Xw9toMKRu8906jMbFEKH8e85GhJmBwzOuk11UPTDBXAA4R3AULOUK', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0),
(27, '1014', '3', '35', '', '', '', 'Nigama', 'Shaikh', '', '', '+9656453543', '+965', '', '', '', 'nigama.shaikh@gmail.com', '', '', '1981-03-04', '', '2024-09-05', '0000-00-00', '', '', '', '27.png', '$2y$10$ioNqYdOTw9ZtSHFTCEtLTO2GFMRVuqUJXbKAEJymJVb3DDYutmViC', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0),
(28, '1015', '3', '8', 'Bsc Nursing', '1.5 years', 'Nurse', 'Meerab', 'Khan', 'Aziz', 'Nushrat', '+9659876509', '+9651234256', 'ASDZX12BN', 'LKJH67DF', 'UIOPH234', 'meerabkhan@gmail.com', 'MeerabKhan', 'meerab@123', '1999-07-02', 'Single', '2024-09-06', '0000-00-00', 'Saudi', 'Saudi', 'ok', '', '$2y$10$Sf0KUwW4jzb9/Wf0jVq/2.Ul.5Cem.nMbsRcjQG/fM0qADywmknZ.', 'Female', 'O+', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0),
(29, '1016', 'select', '', '', '', '', 'Jenifer', '', '', '', '+9659876545', '+9654564324', '', '', '', '', 'Jenifer', 'Jeni@12', '1998-09-12', '', '0000-00-00', '0000-00-00', '', '', '', '', '$2y$10$GMsfOqmwYIW13fX23ehuCenjoNfbSMBZRUYEeys6o7IGPF3YG7klu', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', 0, 0, 0, 0),
(30, '1017', '3', '10', '', '', '', 'Ibrahim', 'Alsoudi', '', '', '+9657654343', '+965', '', '', '', 'Ibrahim123@gmail.com', 'Ibrahim123', 'Ibrahim123', '1984-06-12', '', '2024-09-06', '0000-00-00', '', '', '', '30.png', '$2y$10$1ytKXEZ6ngnSe21pq8vfjOEPUAiVckWCmffuDlrTb.K1PMDNv1I0q', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0),
(31, '1018', 'select', '25', '', '2 years', '', 'Joya', 'Khan', '', '', '+9659878987', '+9656545643', '', '', '', 'joya@gmail.com', 'Joya', 'joya@123', '1997-08-13', '', '2024-09-01', '0000-00-00', '', '', '', '', '$2y$10$AHw.c4ciywwlt5irbJ6B9e4hgBqquoe7YMYcygWWIV9Gjs3CyWxfu', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0),
(32, '1019', '4', '17', '', '', '', 'arjun', '', '', '', '+9654655666', '+965', '', '', '', '', 'arjun', 'arjun', '1990-10-01', '', '0000-00-00', '0000-00-00', '', '', '', '', '$2y$10$lvL0oUpeB9mECtfBwTSdpO3TuY07MeFruKnj1chq8j.h2p6toBWVi', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendance`
--

CREATE TABLE `staff_attendance` (
  `id` int NOT NULL,
  `date` date NOT NULL,
  `staff_id` int NOT NULL,
  `staff_attendance_type_id` int NOT NULL,
  `remark` varchar(200) NOT NULL,
  `is_active` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `staff_attendance`
--

INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '2024-08-16', 8, 1, '', 0, '0000-00-00 00:00:00', 0),
(2, '2024-08-16', 3, 1, '', 0, '0000-00-00 00:00:00', 0),
(3, '2024-08-16', 4, 1, '', 0, '0000-00-00 00:00:00', 0),
(4, '2024-08-16', 5, 1, '', 0, '0000-00-00 00:00:00', 0),
(5, '2024-08-16', 6, 1, '', 0, '0000-00-00 00:00:00', 0),
(6, '2024-08-16', 7, 1, '', 0, '0000-00-00 00:00:00', 0),
(7, '2024-09-03', 11, 1, '', 0, '0000-00-00 00:00:00', 0),
(8, '2024-09-04', 3, 1, '', 0, '0000-00-00 00:00:00', 0),
(9, '2024-09-04', 4, 1, '', 0, '0000-00-00 00:00:00', 0),
(10, '2024-09-04', 5, 1, '', 0, '0000-00-00 00:00:00', 0),
(11, '2024-09-04', 6, 1, '', 0, '0000-00-00 00:00:00', 0),
(12, '2024-09-04', 7, 1, '', 0, '0000-00-00 00:00:00', 0),
(14, '2024-09-20', 8, 1, '', 0, '0000-00-00 00:00:00', 0),
(15, '2024-09-20', 24, 1, '', 0, '0000-00-00 00:00:00', 0),
(16, '2024-09-20', 25, 1, '', 0, '0000-00-00 00:00:00', 0),
(17, '2024-10-09', 31, 1, '', 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendance_type`
--

CREATE TABLE `staff_attendance_type` (
  `id` int NOT NULL,
  `type` varchar(200) NOT NULL,
  `key_value` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `staff_attendance_type`
--

INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`) VALUES
(1, 'Present', '<b class=\"text text-success\">P</b>', 'yes', '0000-00-00 00:00:00'),
(2, 'Late', '<b class=\"text text-warning\">L</b>', 'yes', '0000-00-00 00:00:00'),
(3, 'Absent', '<b class=\"text text-danger\">A</b>', 'yes', '0000-00-00 00:00:00'),
(4, 'Half Day', '<b class=\"text text-warning\">F</b>', 'yes', '2018-05-07 01:56:16'),
(5, 'Holiday', 'H', 'yes', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `staff_designation`
--

CREATE TABLE `staff_designation` (
  `id` int NOT NULL,
  `role` int NOT NULL,
  `designation` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `staff_designation`
--

INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES
(1, 3, 'Prof', 'yes'),
(2, 3, 'ASSOCIATE PROF', 'yes'),
(3, 7, 'ADMIN', 'yes'),
(4, 8, 'Front Desk Executive', 'yes'),
(5, 2, 'Accounts Manager', 'yes'),
(6, 6, 'WARD BOY', 'yes'),
(7, 6, 'WARD GIRL', 'yes'),
(8, 6, 'Staff Nurse', 'yes'),
(9, 6, 'HEAD NURSE', 'yes'),
(10, 3, 'Specialist', 'yes'),
(11, 5, 'ATTENDANT', 'yes'),
(12, 5, 'Medical Laboratory Technician', 'yes'),
(13, 5, 'LAB HEAD', 'yes'),
(14, 5, 'LAB NURSE', 'yes'),
(15, 5, 'SAMPLE COLLECTOR', 'yes'),
(16, 2, 'BILL COLLECTOR', 'yes'),
(17, 1, 'SUPERVISOR', 'yes'),
(18, 4, 'Clinical Pharmacist', 'yes'),
(19, 6, 'BLOOD BANK STAFF', 'yes'),
(20, 3, 'OPD STAFF', 'yes'),
(21, 3, 'IPD STAFF', 'yes'),
(22, 4, 'PHARMACY STAFF', 'yes'),
(23, 5, 'PATHOLOGY STAFF', 'yes'),
(24, 3, 'OPERATION THEATER STAFF', 'yes'),
(25, 1, 'Administrative Assistant', 'yes'),
(26, 3, 'Medical Officer', 'yes'),
(27, 3, 'General Practitioner', 'yes'),
(28, 2, 'Financial Analyst', 'yes'),
(29, 2, 'Billing Specialist', 'yes'),
(30, 6, 'Registered Nurse', 'yes'),
(31, 6, 'Nurse Practitioner', 'yes'),
(32, 4, 'Pharmacy Technician', 'yes'),
(33, 4, 'Pharmacy Manager', 'yes'),
(34, 5, 'Clinical Laboratory Scientist', 'yes'),
(35, 5, 'Lab Technologist', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `staff_leave_details`
--

CREATE TABLE `staff_leave_details` (
  `id` int NOT NULL,
  `staff_id` int NOT NULL,
  `leave_type_id` int NOT NULL,
  `alloted_leave` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `staff_leave_details`
--

INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES
(1, 2, 1, '6'),
(2, 2, 2, '5'),
(3, 2, 3, '5'),
(4, 2, 4, '6'),
(5, 2, 5, '7'),
(6, 2, 6, '20'),
(7, 2, 7, '10'),
(8, 3, 1, '6'),
(9, 3, 2, '5'),
(10, 3, 3, '5'),
(11, 3, 4, '6'),
(12, 3, 5, '7'),
(13, 3, 6, '20'),
(14, 3, 7, '10'),
(15, 4, 1, '6'),
(16, 4, 2, '5'),
(17, 4, 3, '5'),
(18, 4, 4, '6'),
(19, 4, 5, '7'),
(20, 4, 6, '20'),
(21, 4, 7, '10'),
(22, 5, 1, '6'),
(23, 5, 2, '5'),
(24, 5, 3, '5'),
(25, 5, 4, '6'),
(26, 5, 5, '7'),
(27, 5, 6, '20'),
(28, 5, 7, '10'),
(29, 6, 1, '6'),
(30, 6, 2, '5'),
(31, 6, 3, '5'),
(32, 6, 4, '6'),
(33, 6, 5, '7'),
(34, 6, 6, '20'),
(35, 6, 7, '10'),
(36, 7, 1, '6'),
(37, 7, 2, '5'),
(38, 7, 3, '5'),
(39, 7, 4, '6'),
(40, 7, 5, '7'),
(41, 7, 6, '20'),
(42, 7, 7, '10'),
(43, 8, 1, '6'),
(44, 8, 2, '5'),
(45, 8, 3, '5'),
(46, 8, 4, '6'),
(47, 8, 5, '7'),
(48, 8, 6, '20'),
(49, 8, 7, '10'),
(50, 9, 1, '6'),
(51, 9, 2, '5'),
(52, 9, 3, '5'),
(53, 9, 4, '6'),
(54, 9, 5, '7'),
(55, 9, 6, '20'),
(56, 9, 7, '10'),
(57, 10, 1, '6'),
(58, 10, 2, '5'),
(59, 10, 3, '5'),
(60, 10, 4, '6'),
(61, 10, 5, '7'),
(62, 10, 6, '20'),
(63, 10, 7, '10'),
(64, 11, 1, '6'),
(65, 11, 2, '5'),
(66, 11, 3, '5'),
(67, 11, 4, '6'),
(68, 11, 5, '7'),
(69, 11, 6, '20'),
(70, 11, 7, '10'),
(85, 12, 1, ''),
(86, 12, 2, ''),
(87, 12, 3, ''),
(88, 12, 4, ''),
(89, 12, 5, ''),
(90, 12, 6, ''),
(91, 12, 7, ''),
(92, 13, 1, '6'),
(93, 13, 2, '5'),
(94, 13, 3, '5'),
(95, 13, 4, '6'),
(96, 13, 5, '7'),
(97, 13, 6, '20'),
(98, 13, 7, '10'),
(99, 1, 1, '10'),
(100, 1, 2, '6'),
(101, 1, 3, '5'),
(102, 1, 4, ''),
(103, 1, 5, ''),
(104, 1, 6, ''),
(105, 1, 7, ''),
(106, 14, 1, ''),
(107, 14, 2, ''),
(108, 14, 3, ''),
(109, 14, 4, ''),
(110, 14, 5, ''),
(111, 14, 6, ''),
(112, 14, 7, ''),
(113, 15, 1, ''),
(114, 15, 2, ''),
(115, 15, 3, ''),
(116, 15, 4, ''),
(117, 15, 5, ''),
(118, 15, 6, ''),
(119, 15, 7, ''),
(120, 16, 1, ''),
(121, 16, 2, ''),
(122, 16, 3, ''),
(123, 16, 4, ''),
(124, 16, 5, ''),
(125, 16, 6, ''),
(126, 16, 7, ''),
(127, 17, 1, ''),
(128, 17, 2, ''),
(129, 17, 3, ''),
(130, 17, 4, ''),
(131, 17, 5, ''),
(132, 17, 6, ''),
(133, 17, 7, ''),
(134, 18, 1, ''),
(135, 18, 2, ''),
(136, 18, 3, ''),
(137, 18, 4, ''),
(138, 18, 5, ''),
(139, 18, 6, ''),
(140, 18, 7, ''),
(141, 19, 1, ''),
(142, 19, 2, ''),
(143, 19, 3, ''),
(144, 19, 4, ''),
(145, 19, 5, ''),
(146, 19, 6, ''),
(147, 19, 7, ''),
(148, 20, 1, '5'),
(149, 20, 2, '6'),
(150, 20, 3, '7'),
(151, 20, 4, '8'),
(152, 20, 5, '4'),
(153, 20, 6, '5'),
(154, 20, 7, '9'),
(155, 21, 1, ''),
(156, 21, 2, ''),
(157, 21, 3, ''),
(158, 21, 4, ''),
(159, 21, 5, ''),
(160, 21, 6, ''),
(161, 21, 7, ''),
(162, 22, 1, ''),
(163, 22, 2, ''),
(164, 22, 3, ''),
(165, 22, 4, ''),
(166, 22, 5, ''),
(167, 22, 6, ''),
(168, 22, 7, ''),
(169, 23, 1, ''),
(170, 23, 2, ''),
(171, 23, 3, ''),
(172, 23, 4, ''),
(173, 23, 5, ''),
(174, 23, 6, ''),
(175, 23, 7, ''),
(176, 24, 1, ''),
(177, 24, 2, ''),
(178, 24, 3, ''),
(179, 24, 4, ''),
(180, 24, 5, ''),
(181, 24, 6, ''),
(182, 24, 7, ''),
(183, 25, 1, ''),
(184, 25, 2, ''),
(185, 25, 3, ''),
(186, 25, 4, ''),
(187, 25, 5, ''),
(188, 25, 6, ''),
(189, 25, 7, ''),
(190, 26, 1, '10'),
(191, 26, 2, '7'),
(192, 26, 3, '4'),
(193, 26, 4, ''),
(194, 26, 5, ''),
(195, 26, 6, ''),
(196, 26, 7, ''),
(197, 27, 1, ''),
(198, 27, 2, ''),
(199, 27, 3, ''),
(200, 27, 4, ''),
(201, 27, 5, ''),
(202, 27, 6, ''),
(203, 27, 7, ''),
(204, 28, 1, ''),
(205, 28, 2, ''),
(206, 28, 3, ''),
(207, 28, 4, ''),
(208, 28, 5, ''),
(209, 28, 6, ''),
(210, 28, 7, ''),
(211, 29, 1, ''),
(212, 29, 2, ''),
(213, 29, 3, ''),
(214, 29, 4, ''),
(215, 29, 5, ''),
(216, 29, 6, ''),
(217, 29, 7, ''),
(218, 30, 1, ''),
(219, 30, 2, ''),
(220, 30, 3, ''),
(221, 30, 4, ''),
(222, 30, 5, ''),
(223, 30, 6, ''),
(224, 30, 7, ''),
(225, 31, 1, ''),
(226, 31, 2, ''),
(227, 31, 3, ''),
(228, 31, 4, ''),
(229, 31, 5, ''),
(230, 31, 6, ''),
(231, 31, 7, ''),
(232, 32, 1, ''),
(233, 32, 2, ''),
(234, 32, 3, ''),
(235, 32, 4, ''),
(236, 32, 5, ''),
(237, 32, 6, ''),
(238, 32, 7, '');

-- --------------------------------------------------------

--
-- Table structure for table `staff_leave_request`
--

CREATE TABLE `staff_leave_request` (
  `id` int NOT NULL,
  `staff_id` int NOT NULL,
  `leave_type_id` int NOT NULL,
  `leave_from` date NOT NULL,
  `leave_to` date NOT NULL,
  `leave_days` int NOT NULL,
  `employee_remark` varchar(200) NOT NULL,
  `admin_remark` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `applied_by` varchar(200) NOT NULL,
  `document_file` varchar(200) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `staff_leave_request`
--

INSERT INTO `staff_leave_request` (`id`, `staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES
(1, 9, 1, '2024-08-10', '2024-08-12', 3, '', '', 'approve', 'Hala', '', '2024-08-16'),
(2, 9, 1, '2024-09-04', '2024-09-07', 4, '', '', 'disapprove', 'Hala', '', '2024-08-16'),
(3, 9, 1, '2024-08-16', '2024-08-19', 4, '', '', 'disapprove', 'Hala', '', '2024-08-16'),
(4, 9, 7, '2024-08-16', '2024-08-25', 10, '', '', 'approve', 'Hala', '', '2024-08-16'),
(5, 8, 1, '2024-08-15', '2024-08-17', 3, '', '', 'approve', 'Super Admin', '', '2024-08-17'),
(6, 3, 1, '2024-08-21', '2024-08-22', 2, 'operation', 'ok', 'approve', 'Super Admin', '', '2024-08-21'),
(7, 7, 2, '2024-08-07', '2024-08-08', 2, '', '', 'approve', 'Super Admin', '', '2024-08-30'),
(8, 2, 1, '2024-09-01', '2024-09-02', 2, 'family function', '', 'approve', 'Layla', '', '2024-08-31'),
(9, 2, 1, '2024-09-01', '2024-09-02', 2, 'ok', '', 'disapprove', 'Layla', '', '2024-08-31'),
(10, 2, 1, '2024-09-05', '2024-09-06', 2, 'Exam ', '', 'disapprove', 'Layla', '', '2024-08-31'),
(11, 1, 3, '2024-09-05', '2024-09-05', 1, '', '', 'approve', 'Super Admin', '', '2024-09-04'),
(12, 1, 2, '2024-09-04', '2024-09-07', 4, '', '', 'approve', 'Super Admin', '', '2024-09-05'),
(13, 1, 2, '2024-09-03', '2024-09-04', 2, '', '', 'approve', 'Super Admin', '', '2024-09-13'),
(14, 10, 3, '2024-10-09', '2024-10-09', 1, '', '', 'approve', 'Super Admin', '', '2024-10-09'),
(15, 1, 1, '2024-10-19', '2024-10-20', 2, '', '', 'pending', 'Super Admin', '', '2024-10-19');

-- --------------------------------------------------------

--
-- Table structure for table `staff_payroll`
--

CREATE TABLE `staff_payroll` (
  `id` int NOT NULL,
  `basic_salary` int NOT NULL,
  `pay_scale` varchar(200) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `is_active` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `staff_payslip`
--

CREATE TABLE `staff_payslip` (
  `id` int NOT NULL,
  `staff_id` int NOT NULL,
  `basic` int NOT NULL,
  `total_allowance` int NOT NULL,
  `total_deduction` int NOT NULL,
  `leave_deduction` int NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `net_salary` decimal(15,2) NOT NULL,
  `status` varchar(100) NOT NULL,
  `month` varchar(200) NOT NULL,
  `year` varchar(200) NOT NULL,
  `payment_mode` varchar(200) NOT NULL,
  `cheque_no` varchar(255) DEFAULT NULL,
  `cheque_date` datetime DEFAULT NULL,
  `document` varchar(255) DEFAULT NULL,
  `payment_date` date NOT NULL,
  `remark` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `staff_payslip`
--

INSERT INTO `staff_payslip` (`id`, `staff_id`, `basic`, `total_allowance`, `total_deduction`, `leave_deduction`, `tax`, `net_salary`, `status`, `month`, `year`, `payment_mode`, `cheque_no`, `cheque_date`, `document`, `payment_date`, `remark`) VALUES
(4, 2, 11110, 0, 0, 0, 0.00, 11110.00, 'paid', 'August', '2024', 'Cheque', '21312', '2024-09-30 17:50:00', '', '2024-09-30', 'ok'),
(5, 3, 12333, 0, 0, 0, 0.00, 12333.00, 'paid', 'August', '2024', 'Cheque', NULL, NULL, NULL, '2024-09-26', ''),
(6, 4, 15000, 0, 0, 0, 0.00, 15000.00, 'paid', 'August', '2024', 'Cheque', '251423', '2024-09-30 17:55:00', '', '2024-09-30', 'ok'),
(7, 5, 25000, 0, 0, 0, 0.00, 25000.00, 'paid', 'August', '2024', 'Cheque', '863476', '2024-09-30 18:22:00', '838430284_payroll.jpg', '2024-09-30', 'ok'),
(8, 2, 10000, 0, 0, 0, 0.00, 10000.00, 'paid', 'September', '2024', 'Cheque', '123', '2024-10-09 17:51:00', '', '2024-10-01', ''),
(9, 24, 11110, 0, 0, 0, 0.00, 11110.00, 'generated', 'September', '2024', '', NULL, NULL, NULL, '2024-10-08', ''),
(10, 3, 34433, 0, 0, 0, 0.00, 34433.00, 'paid', 'September', '2024', 'Cash', '', '2024-10-09 15:35:56', '', '2024-10-09', ''),
(11, 4, 15550, 0, 0, 0, 0.00, 15550.00, 'paid', 'September', '2024', 'Cash', '', '2024-10-09 15:40:09', '', '2024-10-09', ''),
(12, 5, 88880, 0, 0, 0, 0.00, 88880.00, 'paid', 'September', '2024', 'Cash', '', '2024-10-18 15:38:37', '', '2024-10-18', '');

-- --------------------------------------------------------

--
-- Table structure for table `staff_roles`
--

CREATE TABLE `staff_roles` (
  `id` int NOT NULL,
  `role_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `is_active` int DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `staff_roles`
--

INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES
(1, 7, 1, 0, '2020-07-17 09:02:35'),
(2, 8, 2, 0, '2024-08-02 10:21:26'),
(3, 3, 3, 0, '2024-08-02 10:28:20'),
(4, 3, 4, 0, '2024-08-02 10:31:37'),
(5, 3, 5, 0, '2024-08-02 10:34:58'),
(6, 3, 6, 0, '2024-08-02 10:37:59'),
(7, 3, 7, 0, '2024-08-02 10:41:21'),
(8, 2, 8, 0, '2024-08-02 10:44:40'),
(9, 6, 9, 0, '2024-08-02 10:49:16'),
(10, 4, 10, 0, '2024-08-02 10:56:09'),
(11, 5, 11, 0, '2024-08-02 10:59:56'),
(14, 6, 12, 0, '2024-08-06 10:50:07'),
(15, 8, 13, 0, '2024-08-07 13:01:25'),
(16, 1, 14, 0, '2024-08-27 08:55:10'),
(19, 6, 17, 0, '2024-08-30 11:06:42'),
(20, 3, 18, 0, '2024-08-30 12:45:44'),
(21, 3, 19, 0, '2024-08-30 12:58:15'),
(22, 2, 20, 0, '2024-08-31 05:06:06'),
(23, 2, 21, 0, '2024-08-31 07:02:09'),
(24, 2, 22, 0, '2024-08-31 07:35:58'),
(26, 2, 24, 0, '2024-09-03 09:29:15'),
(27, 2, 25, 0, '2024-09-03 10:15:56'),
(29, 5, 27, 0, '2024-09-05 12:21:06'),
(30, 6, 28, 0, '2024-09-06 05:44:40'),
(31, 4, 29, 0, '2024-09-06 05:47:52'),
(32, 3, 30, 0, '2024-09-06 06:41:43'),
(33, 1, 31, 0, '2024-09-10 05:05:44'),
(34, 1, 32, 0, '2024-10-17 10:57:10');

-- --------------------------------------------------------

--
-- Table structure for table `staff_timeline`
--

CREATE TABLE `staff_timeline` (
  `id` int NOT NULL,
  `staff_id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` varchar(300) NOT NULL,
  `document` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_bill_basic`
--

CREATE TABLE `supplier_bill_basic` (
  `id` int NOT NULL,
  `purchase_no` varchar(200) NOT NULL,
  `ref_no` varchar(255) NOT NULL,
  `date` varchar(200) NOT NULL,
  `supplier_id` int NOT NULL,
  `supplier_name` varchar(200) NOT NULL,
  `file` varchar(200) NOT NULL,
  `total` varchar(200) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL,
  `tax_percent` decimal(15,2) NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `discount` decimal(15,2) NOT NULL,
  `net_amount` varchar(200) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `cheque_no` varchar(200) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `payment_doc` text NOT NULL,
  `payment_note` text NOT NULL,
  `note` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `supplier_bill_basic`
--

INSERT INTO `supplier_bill_basic` (`id`, `purchase_no`, `ref_no`, `date`, `supplier_id`, `supplier_name`, `file`, `total`, `discount_percent`, `tax_percent`, `tax`, `discount`, `net_amount`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_doc`, `payment_note`, `note`, `created_at`) VALUES
(1, '1', 'PCHNO1', '2024-09-24 18:04:00', 1, 'Abdullah Ssekimwanyi', '', '22500.00', 0.00, 0.00, 0.00, 0.00, '22500.00', 'Cash', NULL, '0000-00-00', '', '', '', '2024-09-24 12:36:28'),
(2, '2', 'PCHNO2', '2024-09-26 13:16:00', 1, 'Abdullah Ssekimwanyi', '', '4.00', 0.00, 0.00, 0.00, 0.00, '4.00', 'Cheque', NULL, '2024-09-10', '', '', '', '2024-09-26 07:46:58'),
(3, '3', 'PCHNO3', '2024-09-26 13:18:00', 1, 'Abdullah Ssekimwanyi', '', '1.00', 0.00, 0.00, 0.00, 0.00, '1.00', 'Cheque', '111', '2024-09-18', 'uploads/payment_document/3.jpg', '', '', '2024-09-26 08:04:11'),
(4, '4', 'PCHNO4', '2024-09-26 17:58:00', 1, 'Abdullah Ssekimwanyi', '', '1.00', 0.00, 0.00, 0.00, 0.00, '1.00', 'Cheque', NULL, '2024-09-12', 'uploads/payment_document/4.jpg', '', '', '2024-09-26 12:29:58'),
(5, '5', 'PCHNO5', '1979-08-17 15:10:00', 1, 'Abdullah Ssekimwanyi', '', '2000.00', 5.00, 8.00, 152.00, 100.00, '2052.00', 'Cheque', '4562', '2024-09-30', 'uploads/payment_document/5.jpg', 'ok', 'rrrrrrrrrrrrr', '2024-10-18 10:37:00');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_bill_detail`
--

CREATE TABLE `supplier_bill_detail` (
  `id` int NOT NULL,
  `supplier_bill_basic_id` varchar(200) NOT NULL,
  `medicine_category_id` varchar(200) NOT NULL,
  `medicine_name` varchar(200) NOT NULL,
  `expire_date` varchar(100) NOT NULL,
  `batch_no` varchar(200) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `purchase_price` varchar(200) NOT NULL,
  `mrp` varchar(200) NOT NULL,
  `sale_price` varchar(200) NOT NULL,
  `amount` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_category`
--

CREATE TABLE `supplier_category` (
  `id` int NOT NULL,
  `supplier_category` varchar(200) NOT NULL,
  `contact` varchar(200) NOT NULL,
  `supplier_person` varchar(200) NOT NULL,
  `supplier_person_contact` varchar(200) NOT NULL,
  `supplier_drug_licence` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `supplier_category`
--

INSERT INTO `supplier_category` (`id`, `supplier_category`, `contact`, `supplier_person`, `supplier_person_contact`, `supplier_drug_licence`, `address`) VALUES
(1, 'Kampala Pharmaceutical Industries (KPI) Ltd.', '+96552 28575', 'Abdullah Ssekimwanyi', '+9626 285 645', '', 'Plot: M444B Stretcher Road, Ntinda, P.O Box 7551, Kampala, Uganda'),
(2, 'Lifeway Pharmaceutical Industries Ltd', '+256 (752) 972775', 'Angelina Atyam', '+256 (788) 801819', '', 'Nangwa Village-Nama Subcounty, Mukono District, Kampala, Uganda, P.O. Box 525, Mukono'),
(3, 'Cipla Quality Chemical Industries Ltd.', '+256 312 341 100', 'Ali Fadhul', '+256-414254273', '', 'Plot 1-7, 1st Ring Road, Luzira Industrial Park, P.O Box 34871, Kampala, Uganda');

-- --------------------------------------------------------

--
-- Table structure for table `system_notification`
--

CREATE TABLE `system_notification` (
  `id` int NOT NULL,
  `notification_title` varchar(200) NOT NULL,
  `notification_type` varchar(200) NOT NULL,
  `notification_desc` varchar(200) NOT NULL,
  `notification_for` varchar(200) NOT NULL,
  `receiver_id` int NOT NULL,
  `date` datetime NOT NULL,
  `is_active` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `system_notification`
--

INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES
(40, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN3</a>', 'Patient', 64, '2024-09-19 15:09:09', 'yes'),
(41, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/64/3\'>OPDN3</a>', 'Super Admin', 0, '2024-09-19 15:09:09', 'yes'),
(42, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/64/3\'>OPDN3</a>', 'Doctor', 5, '2024-09-19 15:09:09', 'yes'),
(43, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN1</a>', 'Patient', 64, '2024-09-19 15:11:33', 'yes'),
(44, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/64/1\'>OPDN1</a>', 'Super Admin', 0, '2024-09-19 15:11:33', 'yes'),
(45, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/64/1\'>OPDN1</a>', 'Doctor', 6, '2024-09-19 15:11:33', 'yes'),
(46, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN1</a>', 'Patient', 63, '2024-09-19 15:13:21', 'yes'),
(47, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/63/1\'>OPDN1</a>', 'Super Admin', 0, '2024-09-19 15:13:21', 'yes'),
(48, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/63/1\'>OPDN1</a>', 'Doctor', 3, '2024-09-19 15:13:21', 'yes'),
(49, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN2</a>', 'Patient', 64, '2024-09-20 15:48:46', 'yes'),
(50, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/64/2\'>OPDN2</a>', 'Super Admin', 0, '2024-09-20 15:48:46', 'yes'),
(51, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/64/2\'>OPDN2</a>', 'Doctor', 3, '2024-09-20 15:48:46', 'yes'),
(52, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN3</a>', 'Patient', 63, '2024-09-20 17:39:22', 'yes'),
(53, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/63/3\'>OPDN3</a>', 'Super Admin', 0, '2024-09-20 17:39:22', 'yes'),
(54, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/63/3\'>OPDN3</a>', 'Doctor', 3, '2024-09-20 17:39:22', 'yes'),
(55, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/appointment\'>madhusudan</a>', 'Patient', 63, '2024-09-20 17:40:21', 'yes'),
(56, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/2\'>madhusudan</a>', 'Super Admin', 0, '2024-09-20 17:40:21', 'yes'),
(57, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/appointment\'>madhusudan</a>', 'Patient', 63, '2024-09-20 17:40:27', 'yes'),
(58, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/2\'>madhusudan</a>', 'Super Admin', 0, '2024-09-20 17:40:27', 'yes'),
(59, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/2\'>madhusudan</a>', 'Doctor', 3, '2024-09-20 17:40:27', 'yes'),
(60, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/ipdprofile\'>IPDN3</a>', 'Patient', 63, '2024-09-20 17:40:50', 'yes'),
(61, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/63/3\'>IPDN3</a>', 'Super Admin', 0, '2024-09-20 17:40:50', 'yes'),
(62, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/63/3\'>IPDN3</a>', 'Doctor', 3, '2024-09-20 17:40:50', 'yes'),
(63, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/appointment\'>Haldar Shaikh</a>', 'Patient', 69, '2024-09-21 11:37:34', 'yes'),
(64, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/3\'>Haldar Shaikh</a>', 'Super Admin', 0, '2024-09-21 11:37:34', 'yes'),
(65, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/3\'>Haldar Shaikh</a>', 'Doctor', 6, '2024-09-21 11:37:34', 'yes'),
(66, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/appointment\'>Ahmad Mohammed Al-Jundi</a>', 'Patient', 0, '2024-09-23 15:22:06', 'yes'),
(67, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/4\'>Ahmad Mohammed Al-Jundi</a>', 'Super Admin', 0, '2024-09-23 15:22:06', 'yes'),
(68, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/appointment\'>Ahmad Mohammed Al-Jundi</a>', 'Patient', 0, '2024-09-23 15:22:12', 'yes'),
(69, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/4\'>Ahmad Mohammed Al-Jundi</a>', 'Super Admin', 0, '2024-09-23 15:22:12', 'yes'),
(70, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/4\'>Ahmad Mohammed Al-Jundi</a>', 'Doctor', 3, '2024-09-23 15:22:12', 'yes'),
(71, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN3</a>', 'Patient', 70, '2024-09-23 15:27:07', 'yes'),
(72, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/70/4\'>OPDN3</a>', 'Super Admin', 0, '2024-09-23 15:27:07', 'yes'),
(73, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/70/4\'>OPDN3</a>', 'Doctor', 3, '2024-09-23 15:27:07', 'yes'),
(74, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/ipdprofile\'>IPDN4</a>', 'Patient', 70, '2024-09-23 15:30:28', 'yes'),
(75, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/70/4\'>IPDN4</a>', 'Super Admin', 0, '2024-09-23 15:30:28', 'yes'),
(76, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/70/4\'>IPDN4</a>', 'Doctor', 3, '2024-09-23 15:30:28', 'yes'),
(77, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN5</a>', 'Patient', 69, '2024-09-23 16:05:40', 'yes'),
(78, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/69/5\'>OPDN5</a>', 'Super Admin', 0, '2024-09-23 16:05:40', 'yes'),
(79, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/69/5\'>OPDN5</a>', 'Doctor', 4, '2024-09-23 16:05:40', 'yes'),
(80, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN6</a>', 'Patient', 64, '2024-09-23 16:29:23', 'yes'),
(81, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/64/6\'>OPDN6</a>', 'Super Admin', 0, '2024-09-23 16:29:23', 'yes'),
(82, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/64/6\'>OPDN6</a>', 'Doctor', 3, '2024-09-23 16:29:23', 'yes'),
(83, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN7</a>', 'Patient', 64, '2024-09-23 16:33:29', 'yes'),
(84, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/64/7\'>OPDN7</a>', 'Super Admin', 0, '2024-09-23 16:33:29', 'yes'),
(85, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/64/7\'>OPDN7</a>', 'Doctor', 3, '2024-09-23 16:33:29', 'yes'),
(86, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/otsearch\' onclick=\'<onchngfun>\'>Ahmad Mohammed Al-Jundi</a>', 'Patient', 70, '2024-09-23 17:19:39', 'yes'),
(87, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveotpatient/2/70\' onclick=\'<onchngfun>\'>Ahmad Mohammed Al-Jundi</a>', 'Super Admin', 0, '2024-09-23 17:19:39', 'yes'),
(88, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveotpatient/2/70\' onclick=\'<onchngfun>\'>Ahmad Mohammed Al-Jundi</a>', 'Doctor', 3, '2024-09-23 17:19:39', 'yes'),
(89, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/appointment\'>madhusudan</a>', 'Patient', 63, '2024-09-23 18:12:18', 'yes'),
(90, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/5\'>madhusudan</a>', 'Super Admin', 0, '2024-09-23 18:12:18', 'yes'),
(91, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/5\'>madhusudan</a>', 'Doctor', 5, '2024-09-23 18:12:18', 'yes'),
(92, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/otsearch\' onclick=\'<onchngfun>\'>Haldar Shaikh</a>', 'Patient', 69, '2024-09-24 11:29:06', 'yes'),
(93, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveotpatient/3/69\' onclick=\'<onchngfun>\'>Haldar Shaikh</a>', 'Super Admin', 0, '2024-09-24 11:29:06', 'yes'),
(94, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveotpatient/3/69\' onclick=\'<onchngfun>\'>Haldar Shaikh</a>', 'Doctor', 3, '2024-09-24 11:29:06', 'yes'),
(95, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/ipdprofile\'>IPDN5</a>', 'Patient', 64, '2024-09-24 12:07:00', 'yes'),
(96, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/64/5\'>IPDN5</a>', 'Super Admin', 0, '2024-09-24 12:07:00', 'yes'),
(97, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/64/5\'>IPDN5</a>', 'Doctor', 3, '2024-09-24 12:07:00', 'yes'),
(98, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/appointment\'>Haldar Shaikh</a>', 'Patient', 69, '2024-09-24 13:16:59', 'yes'),
(99, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/6\'>Haldar Shaikh</a>', 'Super Admin', 0, '2024-09-24 13:16:59', 'yes'),
(100, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN8</a>', 'Patient', 64, '2024-09-24 16:13:12', 'yes'),
(101, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/64/8\'>OPDN8</a>', 'Super Admin', 0, '2024-09-24 16:13:12', 'yes'),
(102, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/64/8\'>OPDN8</a>', 'Doctor', 3, '2024-09-24 16:13:12', 'yes'),
(103, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN9</a>', 'Patient', 64, '2024-09-24 16:14:17', 'yes'),
(104, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/64/9\'>OPDN9</a>', 'Super Admin', 0, '2024-09-24 16:14:17', 'yes'),
(105, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/64/9\'>OPDN9</a>', 'Doctor', 3, '2024-09-24 16:14:17', 'yes'),
(106, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN10</a>', 'Patient', 64, '2024-09-24 16:17:53', 'yes'),
(107, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/64/10\'>OPDN10</a>', 'Super Admin', 0, '2024-09-24 16:17:53', 'yes'),
(108, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/64/10\'>OPDN10</a>', 'Doctor', 3, '2024-09-24 16:17:53', 'yes'),
(109, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN11</a>', 'Patient', 64, '2024-09-24 16:20:12', 'yes'),
(110, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/64/11\'>OPDN11</a>', 'Super Admin', 0, '2024-09-24 16:20:12', 'yes'),
(111, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/64/11\'>OPDN11</a>', 'Doctor', 3, '2024-09-24 16:20:12', 'yes'),
(112, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/appointment\'>Ahmad Mohammed Al-Jundi</a>', 'Patient', 70, '2024-09-24 17:12:07', 'yes'),
(113, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/7\'>Ahmad Mohammed Al-Jundi</a>', 'Super Admin', 0, '2024-09-24 17:12:07', 'yes'),
(114, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/appointment\'>Saumya</a>', 'Patient', 0, '2024-09-25 11:50:38', 'yes'),
(115, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/8\'>Saumya</a>', 'Super Admin', 0, '2024-09-25 11:50:38', 'yes'),
(116, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/8\'>Saumya</a>', 'Doctor', 3, '2024-09-25 11:50:38', 'yes'),
(117, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN12</a>', 'Patient', 74, '2024-09-25 12:38:18', 'yes'),
(118, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/74/12\'>OPDN12</a>', 'Super Admin', 0, '2024-09-25 12:38:18', 'yes'),
(119, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/74/12\'>OPDN12</a>', 'Doctor', 3, '2024-09-25 12:38:18', 'yes'),
(120, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/ipdprofile\'>IPDN6</a>', 'Patient', 74, '2024-09-25 13:03:56', 'yes'),
(121, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/74/6\'>IPDN6</a>', 'Super Admin', 0, '2024-09-25 13:03:56', 'yes'),
(122, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/74/6\'>IPDN6</a>', 'Doctor', 3, '2024-09-25 13:03:56', 'yes'),
(123, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/ipdprofile\'>IPDN1</a>', 'Patient', 65, '2024-09-25 16:53:25', 'yes'),
(124, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/65/1\'>IPDN1</a>', 'Super Admin', 0, '2024-09-25 16:53:25', 'yes'),
(125, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/65/1\'>IPDN1</a>', 'Doctor', 3, '2024-09-25 16:53:25', 'yes'),
(126, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN13</a>', 'Patient', 75, '2024-09-26 10:46:10', 'yes'),
(127, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/75/13\'>OPDN13</a>', 'Super Admin', 0, '2024-09-26 10:46:10', 'yes'),
(128, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/75/13\'>OPDN13</a>', 'Doctor', 3, '2024-09-26 10:46:10', 'yes'),
(129, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/ipdprofile\'>IPDN1</a>', 'Patient', 69, '2024-09-26 10:54:39', 'yes'),
(130, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/69/1\'>IPDN1</a>', 'Super Admin', 0, '2024-09-26 10:54:39', 'yes'),
(131, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/69/1\'>IPDN1</a>', 'Doctor', 3, '2024-09-26 10:54:39', 'yes'),
(132, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN14</a>', 'Patient', 75, '2024-09-26 11:13:36', 'yes'),
(133, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/75/14\'>OPDN14</a>', 'Super Admin', 0, '2024-09-26 11:13:36', 'yes'),
(134, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/75/14\'>OPDN14</a>', 'Doctor', 3, '2024-09-26 11:13:36', 'yes'),
(135, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN15</a>', 'Patient', 52, '2024-09-26 11:29:17', 'yes'),
(136, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/52/15\'>OPDN15</a>', 'Super Admin', 0, '2024-09-26 11:29:17', 'yes'),
(137, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/52/15\'>OPDN15</a>', 'Doctor', 3, '2024-09-26 11:29:17', 'yes'),
(138, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN16</a>', 'Patient', 69, '2024-09-26 11:45:15', 'yes'),
(139, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/69/16\'>OPDN16</a>', 'Super Admin', 0, '2024-09-26 11:45:15', 'yes'),
(140, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/69/16\'>OPDN16</a>', 'Doctor', 4, '2024-09-26 11:45:15', 'yes'),
(141, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN17</a>', 'Patient', 64, '2024-09-26 11:45:47', 'yes'),
(142, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/64/17\'>OPDN17</a>', 'Super Admin', 0, '2024-09-26 11:45:47', 'yes'),
(143, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/64/17\'>OPDN17</a>', 'Doctor', 3, '2024-09-26 11:45:47', 'yes'),
(144, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/appointment\'>Ahmad Mohammed Al-Jundi</a>', 'Patient', 70, '2024-09-26 12:25:47', 'yes'),
(145, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/7\'>Ahmad Mohammed Al-Jundi</a>', 'Super Admin', 0, '2024-09-26 12:25:47', 'yes'),
(146, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/7\'>Ahmad Mohammed Al-Jundi</a>', 'Doctor', 4, '2024-09-26 12:25:47', 'yes'),
(147, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/appointment\'>Haldar Shaikh</a>', 'Patient', 69, '2024-09-26 12:30:26', 'yes'),
(148, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/6\'>Haldar Shaikh</a>', 'Super Admin', 0, '2024-09-26 12:30:26', 'yes'),
(149, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/6\'>Haldar Shaikh</a>', 'Doctor', 3, '2024-09-26 12:30:26', 'yes'),
(150, 'Salary paid', 'salary', 'Salary Amount 11110.00 has been paid for Month August to <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/movesalarypay/2/4\'>Layla Hassan</a>', 'Receptionist', 2, '2024-09-26 15:24:44', 'yes'),
(151, 'Salary paid', 'salary', 'Salary Amount 11110.00 has been paid for Month August to <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/movesalarypay/2/4\'>Layla Hassan</a>', 'Super Admin', 0, '2024-09-26 15:24:44', 'yes'),
(152, 'Salary paid', 'salary', 'Salary Amount 12333.00 has been paid for Month August to <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/movesalarypay/3/5\'>Ahmed Al-Masri</a>', 'Doctor', 3, '2024-09-26 15:27:27', 'yes'),
(153, 'Salary paid', 'salary', 'Salary Amount 12333.00 has been paid for Month August to <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/movesalarypay/3/5\'>Ahmed Al-Masri</a>', 'Super Admin', 0, '2024-09-26 15:27:27', 'yes'),
(154, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/appointment\'>Noor Al Hussein</a>', 'Patient', 74, '2024-09-26 15:45:31', 'yes'),
(155, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/9\'>Noor Al Hussein</a>', 'Super Admin', 0, '2024-09-26 15:45:31', 'yes'),
(156, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/appointment\'>rahul rout</a>', 'Patient', 0, '2024-09-26 15:47:09', 'yes'),
(157, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/10\'>rahul rout</a>', 'Super Admin', 0, '2024-09-26 15:47:09', 'yes'),
(158, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/appointment\'>rahul rout</a>', 'Patient', 0, '2024-09-26 15:47:32', 'yes'),
(159, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/10\'>rahul rout</a>', 'Super Admin', 0, '2024-09-26 15:47:32', 'yes'),
(160, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/10\'>rahul rout</a>', 'Doctor', 3, '2024-09-26 15:47:32', 'yes'),
(161, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN18</a>', 'Patient', 74, '2024-09-27 17:06:30', 'yes'),
(162, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/74/18\'>OPDN18</a>', 'Super Admin', 0, '2024-09-27 17:06:30', 'yes'),
(163, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/74/18\'>OPDN18</a>', 'Doctor', 3, '2024-09-27 17:06:30', 'yes'),
(164, 'Salary paid', 'salary', 'Salary Amount 11110.00 has been paid for Month August to <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/movesalarypay/2/4\'>Layla Hassan</a>', 'Receptionist', 2, '2024-09-30 17:50:19', 'yes'),
(165, 'Salary paid', 'salary', 'Salary Amount 11110.00 has been paid for Month August to <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/movesalarypay/2/4\'>Layla Hassan</a>', 'Super Admin', 0, '2024-09-30 17:50:19', 'yes'),
(166, 'Salary paid', 'salary', 'Salary Amount 15000.00 has been paid for Month August to <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/movesalarypay/4/6\'>Khaled Nasser</a>', 'Doctor', 4, '2024-09-30 17:55:10', 'yes'),
(167, 'Salary paid', 'salary', 'Salary Amount 15000.00 has been paid for Month August to <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/movesalarypay/4/6\'>Khaled Nasser</a>', 'Super Admin', 0, '2024-09-30 17:55:10', 'yes'),
(168, 'Salary paid', 'salary', 'Salary Amount 25000.00 has been paid for Month August to <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/movesalarypay/5/7\'>Noor Abdullah</a>', 'Doctor', 5, '2024-09-30 18:22:18', 'yes'),
(169, 'Salary paid', 'salary', 'Salary Amount 25000.00 has been paid for Month August to <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/movesalarypay/5/7\'>Noor Abdullah</a>', 'Super Admin', 0, '2024-09-30 18:22:18', 'yes'),
(170, 'Salary paid', 'salary', 'Salary Amount 10000.00 has been paid for Month September to <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/movesalarypay/2/8\'>Layla Hassan</a>', 'Receptionist', 2, '2024-10-01 17:49:39', 'yes'),
(171, 'Salary paid', 'salary', 'Salary Amount 10000.00 has been paid for Month September to <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/movesalarypay/2/8\'>Layla Hassan</a>', 'Super Admin', 0, '2024-10-01 17:49:39', 'yes'),
(172, 'Salary paid', 'salary', 'Salary Amount 10000.00 has been paid for Month September to <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/movesalarypay/2/8\'>Layla Hassan</a>', 'Receptionist', 2, '2024-10-01 17:51:53', 'yes'),
(173, 'Salary paid', 'salary', 'Salary Amount 10000.00 has been paid for Month September to <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/movesalarypay/2/8\'>Layla Hassan</a>', 'Super Admin', 0, '2024-10-01 17:51:53', 'yes'),
(174, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/ipdprofile\'>IPDN2</a>', 'Patient', 76, '2024-10-03 10:35:42', 'yes'),
(175, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/76/2\'>IPDN2</a>', 'Super Admin', 0, '2024-10-03 10:35:42', 'yes'),
(176, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/76/2\'>IPDN2</a>', 'Doctor', 3, '2024-10-03 10:35:42', 'yes'),
(177, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN19</a>', 'Patient', 76, '2024-10-05 11:15:11', 'yes'),
(178, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/76/19\'>OPDN19</a>', 'Super Admin', 0, '2024-10-05 11:15:11', 'yes'),
(179, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/76/19\'>OPDN19</a>', 'Doctor', 3, '2024-10-05 11:15:11', 'yes'),
(180, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN20</a>', 'Patient', 76, '2024-10-05 11:15:34', 'yes'),
(181, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/76/20\'>OPDN20</a>', 'Super Admin', 0, '2024-10-05 11:15:34', 'yes'),
(182, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/76/20\'>OPDN20</a>', 'Doctor', 3, '2024-10-05 11:15:34', 'yes'),
(183, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN21</a>', 'Patient', 76, '2024-10-05 11:24:53', 'yes'),
(184, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/76/21\'>OPDN21</a>', 'Super Admin', 0, '2024-10-05 11:24:53', 'yes'),
(185, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/76/21\'>OPDN21</a>', 'Doctor', 3, '2024-10-05 11:24:53', 'yes'),
(186, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN22</a>', 'Patient', 76, '2024-10-05 11:25:42', 'yes'),
(187, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/76/22\'>OPDN22</a>', 'Super Admin', 0, '2024-10-05 11:25:42', 'yes'),
(188, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/76/22\'>OPDN22</a>', 'Doctor', 3, '2024-10-05 11:25:42', 'yes'),
(189, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN23</a>', 'Patient', 76, '2024-10-05 11:26:16', 'yes'),
(190, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/76/23\'>OPDN23</a>', 'Super Admin', 0, '2024-10-05 11:26:16', 'yes'),
(191, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/76/23\'>OPDN23</a>', 'Doctor', 3, '2024-10-05 11:26:16', 'yes'),
(192, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN24</a>', 'Patient', 76, '2024-10-05 11:27:25', 'yes'),
(193, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/76/24\'>OPDN24</a>', 'Super Admin', 0, '2024-10-05 11:27:25', 'yes'),
(194, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/76/24\'>OPDN24</a>', 'Doctor', 4, '2024-10-05 11:27:25', 'yes'),
(195, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN25</a>', 'Patient', 76, '2024-10-05 11:28:15', 'yes'),
(196, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/76/25\'>OPDN25</a>', 'Super Admin', 0, '2024-10-05 11:28:15', 'yes'),
(197, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/76/25\'>OPDN25</a>', 'Doctor', 3, '2024-10-05 11:28:15', 'yes'),
(198, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/appointment\'>Mastani</a>', 'Patient', 76, '2024-10-05 11:29:22', 'yes'),
(199, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/11\'>Mastani</a>', 'Super Admin', 0, '2024-10-05 11:29:22', 'yes'),
(200, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/appointment\'>Mastani</a>', 'Patient', 76, '2024-10-05 11:29:29', 'yes'),
(201, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/11\'>Mastani</a>', 'Super Admin', 0, '2024-10-05 11:29:29', 'yes'),
(202, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/11\'>Mastani</a>', 'Doctor', 4, '2024-10-05 11:29:29', 'yes'),
(203, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/ipdprofile\'>IPDN3</a>', 'Patient', 76, '2024-10-05 11:30:36', 'yes'),
(204, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/76/3\'>IPDN3</a>', 'Super Admin', 0, '2024-10-05 11:30:36', 'yes'),
(205, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/76/3\'>IPDN3</a>', 'Doctor', 5, '2024-10-05 11:30:36', 'yes'),
(206, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN26</a>', 'Patient', 62, '2024-10-05 11:30:48', 'yes'),
(207, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/62/26\'>OPDN26</a>', 'Super Admin', 0, '2024-10-05 11:30:48', 'yes'),
(208, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/62/26\'>OPDN26</a>', 'Doctor', 3, '2024-10-05 11:30:48', 'yes'),
(209, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN27</a>', 'Patient', 76, '2024-10-05 11:31:06', 'yes'),
(210, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/76/27\'>OPDN27</a>', 'Super Admin', 0, '2024-10-05 11:31:06', 'yes'),
(211, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/76/27\'>OPDN27</a>', 'Doctor', 3, '2024-10-05 11:31:06', 'yes'),
(212, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/ipdprofile\'>IPDN4</a>', 'Patient', 76, '2024-10-05 11:32:09', 'yes'),
(213, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/76/4\'>IPDN4</a>', 'Super Admin', 0, '2024-10-05 11:32:09', 'yes'),
(214, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/76/4\'>IPDN4</a>', 'Doctor', 4, '2024-10-05 11:32:09', 'yes'),
(215, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN28</a>', 'Patient', 76, '2024-10-05 11:33:15', 'yes'),
(216, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/76/28\'>OPDN28</a>', 'Super Admin', 0, '2024-10-05 11:33:15', 'yes'),
(217, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/76/28\'>OPDN28</a>', 'Doctor', 4, '2024-10-05 11:33:15', 'yes'),
(218, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/appointment\'>Mastani</a>', 'Patient', 76, '2024-10-05 11:33:50', 'yes'),
(219, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/12\'>Mastani</a>', 'Super Admin', 0, '2024-10-05 11:33:50', 'yes'),
(220, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/appointment\'>Mastani</a>', 'Patient', 76, '2024-10-05 11:33:57', 'yes'),
(221, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/12\'>Mastani</a>', 'Super Admin', 0, '2024-10-05 11:33:57', 'yes'),
(222, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/12\'>Mastani</a>', 'Doctor', 3, '2024-10-05 11:33:57', 'yes'),
(223, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN29</a>', 'Patient', 76, '2024-10-05 11:34:07', 'yes'),
(224, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/76/29\'>OPDN29</a>', 'Super Admin', 0, '2024-10-05 11:34:07', 'yes'),
(225, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/76/29\'>OPDN29</a>', 'Doctor', 3, '2024-10-05 11:34:08', 'yes'),
(226, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/appointment\'>Mastani</a>', 'Patient', 76, '2024-10-05 11:34:48', 'yes'),
(227, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/13\'>Mastani</a>', 'Super Admin', 0, '2024-10-05 11:34:48', 'yes'),
(228, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/appointment\'>Mastani</a>', 'Patient', 76, '2024-10-05 11:34:58', 'yes'),
(229, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/13\'>Mastani</a>', 'Super Admin', 0, '2024-10-05 11:34:58', 'yes'),
(230, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/13\'>Mastani</a>', 'Doctor', 3, '2024-10-05 11:34:58', 'yes'),
(231, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN30</a>', 'Patient', 76, '2024-10-05 11:35:11', 'yes'),
(232, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/76/30\'>OPDN30</a>', 'Super Admin', 0, '2024-10-05 11:35:11', 'yes'),
(233, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/76/30\'>OPDN30</a>', 'Doctor', 3, '2024-10-05 11:35:11', 'yes'),
(234, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/ipdprofile\'>IPDN2</a>', 'Patient', 76, '2024-10-05 11:41:17', 'yes'),
(235, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/76/5\'>IPDN2</a>', 'Super Admin', 0, '2024-10-05 11:41:17', 'yes'),
(236, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/76/5\'>IPDN2</a>', 'Doctor', 3, '2024-10-05 11:41:17', 'yes'),
(237, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/ipdprofile\'>IPDN6</a>', 'Patient', 76, '2024-10-05 11:43:56', 'yes'),
(238, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/76/6\'>IPDN6</a>', 'Super Admin', 0, '2024-10-05 11:43:56', 'yes'),
(239, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/76/6\'>IPDN6</a>', 'Doctor', 4, '2024-10-05 11:43:56', 'yes'),
(240, 'Salary paid', 'salary', 'Salary Amount 34433.00 has been paid for Month September to <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/movesalarypay/3/10\'>Ahmed Al-Masri</a>', 'Doctor', 3, '2024-10-09 15:35:56', 'yes'),
(241, 'Salary paid', 'salary', 'Salary Amount 34433.00 has been paid for Month September to <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/movesalarypay/3/10\'>Ahmed Al-Masri</a>', 'Super Admin', 0, '2024-10-09 15:35:56', 'yes'),
(242, 'Salary paid', 'salary', 'Salary Amount 15550.00 has been paid for Month September to <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/movesalarypay/4/11\'>Khaled Nasser</a>', 'Doctor', 4, '2024-10-09 15:40:09', 'yes'),
(243, 'Salary paid', 'salary', 'Salary Amount 15550.00 has been paid for Month September to <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/movesalarypay/4/11\'>Khaled Nasser</a>', 'Super Admin', 0, '2024-10-09 15:40:09', 'yes'),
(244, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN31</a>', 'Patient', 94, '2024-10-14 12:37:56', 'yes'),
(245, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/94/31\'>OPDN31</a>', 'Super Admin', 0, '2024-10-14 12:37:56', 'yes'),
(246, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/94/31\'>OPDN31</a>', 'Doctor', 3, '2024-10-14 12:37:56', 'yes'),
(247, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN32</a>', 'Patient', 87, '2024-10-14 12:44:09', 'yes'),
(248, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/87/32\'>OPDN32</a>', 'Super Admin', 0, '2024-10-14 12:44:09', 'yes'),
(249, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/87/32\'>OPDN32</a>', 'Doctor', 3, '2024-10-14 12:44:09', 'yes'),
(250, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/appointment\'>Zaid Musa</a>', 'Patient', 0, '2024-10-15 09:58:41', 'yes'),
(251, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/14\'>Zaid Musa</a>', 'Super Admin', 0, '2024-10-15 09:58:41', 'yes'),
(252, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/appointment\'>Zaid Musa</a>', 'Patient', 0, '2024-10-15 09:59:16', 'yes'),
(253, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/14\'>Zaid Musa</a>', 'Super Admin', 0, '2024-10-15 09:59:16', 'yes'),
(254, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveappointment/14\'>Zaid Musa</a>', 'Doctor', 6, '2024-10-15 09:59:16', 'yes'),
(255, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/profile\'>OPDN33</a>', 'Patient', 95, '2024-10-15 10:02:38', 'yes'),
(256, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/95/33\'>OPDN33</a>', 'Super Admin', 0, '2024-10-15 10:02:38', 'yes'),
(257, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveopdnotification/95/33\'>OPDN33</a>', 'Doctor', 6, '2024-10-15 10:02:38', 'yes'),
(258, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/patient/dashboard/ipdprofile\'>IPDN7</a>', 'Patient', 95, '2024-10-15 10:47:42', 'yes'),
(259, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/95/7\'>IPDN7</a>', 'Super Admin', 0, '2024-10-15 10:47:42', 'yes'),
(260, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveipdnotification/95/7\'>IPDN7</a>', 'Doctor', 6, '2024-10-15 10:47:42', 'yes'),
(261, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/otsearch\' onclick=\'<onchngfun>\'>Zaid Musa</a>', 'Patient', 95, '2024-10-15 15:51:21', 'yes'),
(262, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveotpatient/4/95\' onclick=\'<onchngfun>\'>Zaid Musa</a>', 'Super Admin', 0, '2024-10-15 15:51:21', 'yes'),
(263, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveotpatient/4/95\' onclick=\'<onchngfun>\'>Zaid Musa</a>', 'Doctor', 3, '2024-10-15 15:51:21', 'yes'),
(264, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/otsearch\' onclick=\'<onchngfun>\'>Zaid Musa</a>', 'Patient', 95, '2024-10-15 16:14:51', 'yes'),
(265, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveotpatient/5/95\' onclick=\'<onchngfun>\'>Zaid Musa</a>', 'Super Admin', 0, '2024-10-15 16:14:51', 'yes'),
(266, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveotpatient/5/95\' onclick=\'<onchngfun>\'>Zaid Musa</a>', 'Doctor', 3, '2024-10-15 16:14:51', 'yes'),
(267, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/drsmart/patient/dashboard/otsearch\' onclick=\'<onchngfun>\'>Rafi</a>', 'Patient', 84, '2024-10-15 16:40:45', 'yes'),
(268, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveotpatient/6/84\' onclick=\'<onchngfun>\'>Rafi</a>', 'Super Admin', 0, '2024-10-15 16:40:45', 'yes'),
(269, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/moveotpatient/6/84\' onclick=\'<onchngfun>\'>Rafi</a>', 'Doctor', 3, '2024-10-15 16:40:45', 'yes'),
(270, 'Salary paid', 'salary', 'Salary Amount 88880.00 has been paid for Month September to <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/movesalarypay/5/12\'>Noor Abdullah</a>', 'Doctor', 5, '2024-10-18 15:38:37', 'yes'),
(271, 'Salary paid', 'salary', 'Salary Amount 88880.00 has been paid for Month September to <a href=\'http://40.172.41.136/drsmart/admin/systemnotification/movesalarypay/5/12\'>Noor Abdullah</a>', 'Super Admin', 0, '2024-10-18 15:38:37', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int NOT NULL,
  `task_title` text COLLATE utf8mb4_general_ci NOT NULL,
  `task_description` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `role_id` int NOT NULL,
  `designation_id` int NOT NULL,
  `department_id` int NOT NULL,
  `staff_id` int NOT NULL,
  `staff_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `task_reminder` int NOT NULL,
  `task_int_min` int NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `priority` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `task_title`, `task_description`, `start_date`, `role_id`, `designation_id`, `department_id`, `staff_id`, `staff_name`, `task_reminder`, `task_int_min`, `status`, `priority`, `is_active`) VALUES
(1, 'Review Financial Reports', 'Please review the financial statements for discrepancies and prepare a summary report', '2024-09-16 09:22:00', 2, 5, 10, 8, 'Omar Zayed', 1, 15, 'in_progress', 'medium', 'no'),
(2, 'Answering Inquiries and Redirecting Calls', 'Respond to incoming patient inquiries about hospital services, doctor availability, and visiting hours. Redirect calls to the relevant departments such as billing, diagnostics, or doctors’ offices', '2024-09-16 10:23:00', 8, 4, 4, 2, 'Layla Hassan', 1, 5, 'pending', 'high', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `test_type_report`
--

CREATE TABLE `test_type_report` (
  `id` int NOT NULL,
  `radiology_id` int NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `test_name` varchar(100) DEFAULT NULL,
  `reporting_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `test_report` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tpa_doctorcharges`
--

CREATE TABLE `tpa_doctorcharges` (
  `id` int NOT NULL,
  `org_id` int NOT NULL,
  `charge_id` int NOT NULL,
  `org_charge` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tpa_doctorcharges`
--

INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES
(1, 2, 1, '600'),
(2, 1, 1, '600'),
(3, 2, 2, '600'),
(4, 1, 2, '600'),
(5, 2, 3, '600'),
(6, 1, 3, '600'),
(7, 2, 4, '600'),
(8, 1, 4, '600'),
(9, 2, 5, '600'),
(10, 1, 5, '800'),
(11, 3, 1, '700'),
(12, 4, 1, '800'),
(13, 5, 1, '1000'),
(14, 6, 1, '500'),
(15, 3, 2, '700'),
(16, 4, 2, '800'),
(17, 5, 2, '1000'),
(18, 6, 2, '500'),
(19, 3, 3, '700'),
(20, 4, 3, '800'),
(21, 5, 3, '1000'),
(22, 6, 3, '500'),
(23, 3, 4, '700'),
(24, 4, 4, '800'),
(25, 5, 4, '1000'),
(26, 6, 4, '500'),
(27, 3, 5, '700'),
(28, 4, 5, '800'),
(29, 5, 5, '1000'),
(30, 6, 5, '500');

-- --------------------------------------------------------

--
-- Table structure for table `tpa_master`
--

CREATE TABLE `tpa_master` (
  `id` int NOT NULL,
  `organisation` varchar(200) NOT NULL,
  `charge_id` int NOT NULL,
  `organisation_charge` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int NOT NULL,
  `user` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `ipaddress` varchar(100) DEFAULT NULL,
  `user_agent` varchar(500) DEFAULT NULL,
  `login_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES
(1, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-13 06:23:12'),
(2, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-13 06:34:44'),
(3, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-13 07:05:32'),
(4, 'receptionist@drsmart.com', 'Receptionist', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-13 07:05:49'),
(5, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-13 07:38:06'),
(6, 'accountant@drsmart.com', 'Accountant', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-13 08:06:26'),
(7, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-13 08:07:12'),
(8, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-13 09:14:06'),
(9, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-16 04:28:37'),
(10, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-16 04:43:55'),
(11, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-16 04:44:40'),
(12, 'accountant@drsmart.com', 'Accountant', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-16 04:55:02'),
(13, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-16 04:59:46'),
(14, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-17 04:31:22'),
(15, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-17 06:43:18'),
(16, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-17 06:59:57'),
(17, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-17 07:00:20'),
(18, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-17 10:08:24'),
(19, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-17 10:15:40'),
(20, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-17 11:49:49'),
(21, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-17 11:50:42'),
(22, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-17 11:52:21'),
(23, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-17 11:53:24'),
(24, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-17 12:59:54'),
(25, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-18 04:33:23'),
(26, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-18 04:35:50'),
(27, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-18 05:15:56'),
(28, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-18 07:35:06'),
(29, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-18 07:52:31'),
(30, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-18 07:52:51'),
(31, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-18 09:07:49'),
(32, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-18 09:15:43'),
(33, 'receptionist@drsmart.com', 'Receptionist', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-18 10:20:42'),
(34, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-18 12:32:43'),
(35, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-19 04:21:49'),
(36, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-19 04:34:22'),
(37, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-19 05:04:50'),
(38, 'pat61', 'patient', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-19 05:05:05'),
(39, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-19 05:42:26'),
(40, 'pat61', 'patient', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-19 05:50:52'),
(41, 'receptionist@drsmart.com', 'Receptionist', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-19 09:10:04'),
(42, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-19 09:29:01'),
(43, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-19 11:52:38'),
(44, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-19 12:11:02'),
(45, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-20 04:37:06'),
(46, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-20 04:41:44'),
(47, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-20 06:59:54'),
(48, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-20 07:39:05'),
(49, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-20 09:07:27'),
(50, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-20 10:52:37'),
(51, 'pat61', 'patient', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-20 10:55:24'),
(52, 'pat61', 'patient', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-20 10:59:20'),
(53, 'pat63', 'patient', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-20 12:07:58'),
(54, 'pat63', 'patient', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-20 12:16:34'),
(55, 'doctor@drsmart.com', 'Doctor', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-20 12:17:34'),
(56, 'receptionist@drsmart.com', 'Receptionist', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-20 12:19:36'),
(57, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-20 12:48:59'),
(58, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-21 04:32:08'),
(59, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-21 05:19:30'),
(60, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-21 05:26:06'),
(61, 'pharmacist@drsmart.com', 'Pharmacist', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-21 06:09:32'),
(62, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-21 06:10:22'),
(63, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-21 09:29:16'),
(64, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-21 11:00:22'),
(65, 'pat61', 'patient', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-21 11:10:07'),
(66, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-21 11:37:40'),
(67, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-23 04:30:03'),
(68, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-23 04:33:15'),
(69, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-23 05:22:58'),
(70, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-23 09:39:19'),
(71, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-23 10:29:58'),
(72, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-23 10:40:53'),
(73, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-23 12:16:06'),
(74, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-24 04:45:04'),
(75, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-24 04:46:34'),
(76, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-24 05:58:02'),
(77, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-24 06:35:53'),
(78, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-24 07:43:47'),
(79, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-24 11:13:56'),
(80, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-24 11:34:18'),
(81, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-24 11:41:48'),
(82, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 128.0.0.0, Windows 10', '2024-09-24 12:33:28'),
(83, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-25 04:31:57'),
(84, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-25 04:38:04'),
(85, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-25 04:57:52'),
(86, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-25 06:51:46'),
(87, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-25 06:52:52'),
(88, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-25 07:07:46'),
(89, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-25 07:29:57'),
(90, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-25 09:23:01'),
(91, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-25 10:18:39'),
(92, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-25 10:39:31'),
(93, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-25 11:27:20'),
(94, 'pharmacist@drsmart.com', 'Pharmacist', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-25 12:19:54'),
(95, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-26 05:13:16'),
(96, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-26 06:05:52'),
(97, 'pharmacist@drsmart.com', 'Pharmacist', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-26 06:23:38'),
(98, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-26 06:25:52'),
(99, 'pharmacist@drsmart.com', 'Pharmacist', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-26 06:39:46'),
(100, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-26 06:42:29'),
(101, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-26 10:14:58'),
(102, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-26 12:20:36'),
(103, 'admin@drsmart.com', 'Super Admin', '49.37.116.2', 'Chrome 129.0.0.0, Windows 10', '2024-09-26 12:28:04'),
(104, 'admin@drsmart.com', 'Super Admin', '49.37.116.55', 'Chrome 129.0.0.0, Windows 10', '2024-09-27 04:37:28'),
(105, 'admin@drsmart.com', 'Super Admin', '49.37.116.55', 'Chrome 129.0.0.0, Windows 10', '2024-09-27 05:30:41'),
(106, 'admin@drsmart.com', 'Super Admin', '49.37.116.55', 'Chrome 129.0.0.0, Windows 10', '2024-09-27 11:36:14'),
(107, 'admin@drsmart.com', 'Super Admin', '49.37.116.55', 'Chrome 129.0.0.0, Windows 10', '2024-09-30 04:34:21'),
(108, 'admin@drsmart.com', 'Super Admin', '49.37.116.55', 'Chrome 129.0.0.0, Windows 10', '2024-09-30 05:18:23'),
(109, 'admin@drsmart.com', 'Super Admin', '49.37.116.55', 'Chrome 129.0.0.0, Windows 10', '2024-09-30 09:31:41'),
(110, 'admin@drsmart.com', 'Super Admin', '49.37.116.55', 'Chrome 129.0.0.0, Windows 10', '2024-09-30 10:39:37'),
(111, 'admin@drsmart.com', 'Super Admin', '49.37.116.55', 'Chrome 129.0.0.0, Windows 10', '2024-10-01 04:40:46'),
(112, 'admin@drsmart.com', 'Super Admin', '49.37.116.55', 'Chrome 129.0.0.0, Windows 10', '2024-10-01 04:53:06'),
(113, 'admin@drsmart.com', 'Super Admin', '49.37.116.55', 'Chrome 129.0.0.0, Windows 10', '2024-10-01 05:01:07'),
(114, 'admin@drsmart.com', 'Super Admin', '49.37.116.55', 'Chrome 129.0.0.0, Windows 10', '2024-10-01 07:33:20'),
(115, 'admin@drsmart.com', 'Super Admin', '49.37.116.55', 'Chrome 129.0.0.0, Windows 10', '2024-10-01 09:19:40'),
(116, 'admin@drsmart.com', 'Super Admin', '49.37.116.55', 'Chrome 129.0.0.0, Windows 10', '2024-10-01 12:15:27'),
(117, 'admin@drsmart.com', 'Super Admin', '49.37.116.55', 'Chrome 129.0.0.0, Windows 10', '2024-10-03 04:33:42'),
(118, 'admin@drsmart.com', 'Super Admin', '49.37.116.55', 'Chrome 129.0.0.0, Windows 10', '2024-10-03 04:51:09'),
(119, 'nurse@drsmart.com', 'Nurse', '49.37.116.55', 'Chrome 129.0.0.0, Windows 10', '2024-10-03 05:38:01'),
(120, 'admin@drsmart.com', 'Super Admin', '49.37.116.55', 'Chrome 129.0.0.0, Windows 10', '2024-10-03 05:38:46'),
(121, 'nurse@drsmart.com', 'Nurse', '49.37.116.55', 'Chrome 129.0.0.0, Windows 10', '2024-10-03 05:44:14'),
(122, 'admin@drsmart.com', 'Super Admin', '49.37.116.55', 'Chrome 129.0.0.0, Windows 10', '2024-10-03 06:18:59'),
(123, 'admin@drsmart.com', 'Super Admin', '49.37.116.55', 'Chrome 129.0.0.0, Windows 10', '2024-10-03 07:04:36'),
(124, 'nurse@drsmart.com', 'Nurse', '49.37.116.55', 'Chrome 129.0.0.0, Windows 10', '2024-10-03 09:16:59'),
(125, 'admin@drsmart.com', 'Super Admin', '49.37.116.55', 'Chrome 129.0.0.0, Windows 10', '2024-10-03 09:59:20'),
(126, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-04 08:40:42'),
(127, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-04 09:13:08'),
(128, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-04 10:42:57'),
(129, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-05 04:33:24'),
(130, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-05 04:46:06'),
(131, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-07 04:47:45'),
(132, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-07 06:23:12'),
(133, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-07 09:19:45'),
(134, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-07 10:11:03'),
(135, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-07 11:13:47'),
(136, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-08 05:18:04'),
(137, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-08 05:29:03'),
(138, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-08 09:47:04'),
(139, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-08 10:20:29'),
(140, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-08 12:22:43'),
(141, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-09 04:36:54'),
(142, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-09 04:49:19'),
(143, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-09 05:21:21'),
(144, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-09 07:34:26'),
(145, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-09 07:44:15'),
(146, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-09 09:38:52'),
(147, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-09 09:56:30'),
(148, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-09 12:12:34'),
(149, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-09 12:21:18'),
(150, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-10 05:55:02'),
(151, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-10 09:15:45'),
(152, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-14 04:48:22'),
(153, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-14 05:02:19'),
(154, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-14 09:04:34'),
(155, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-15 04:23:16'),
(156, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-15 05:00:17'),
(157, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-15 07:07:55'),
(158, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-15 10:07:55'),
(159, 'admin@drsmart.com', 'Super Admin', '49.37.116.153', 'Chrome 129.0.0.0, Windows 10', '2024-10-15 10:26:57'),
(160, 'admin@drsmart.com', 'Super Admin', '49.37.116.61', 'Chrome 129.0.0.0, Windows 10', '2024-10-17 07:34:21'),
(161, 'admin@drsmart.com', 'Super Admin', '49.37.116.61', 'Chrome 129.0.0.0, Windows 10', '2024-10-17 10:53:19'),
(162, 'admin@drsmart.com', 'Super Admin', '49.37.116.61', 'Chrome 129.0.0.0, Windows 10', '2024-10-17 12:41:06'),
(163, 'admin@drsmart.com', 'Super Admin', '49.37.116.61', 'Chrome 129.0.0.0, Windows 10', '2024-10-18 04:55:15'),
(164, 'admin@drsmart.com', 'Super Admin', '49.37.116.61', 'Chrome 129.0.0.0, Windows 10', '2024-10-18 07:24:18'),
(165, 'admin@drsmart.com', 'Super Admin', '49.37.116.61', 'Chrome 129.0.0.0, Windows 10', '2024-10-18 07:27:38'),
(166, 'admin@drsmart.com', 'Super Admin', '49.37.116.61', 'Chrome 129.0.0.0, Windows 10', '2024-10-18 10:00:42'),
(167, 'admin@drsmart.com', 'Super Admin', '49.37.116.61', 'Chrome 129.0.0.0, Windows 10', '2024-10-18 10:25:47'),
(168, 'admin@drsmart.com', 'Super Admin', '49.37.116.61', 'Chrome 129.0.0.0, Windows 10', '2024-10-18 12:31:33'),
(169, 'admin@drsmart.com', 'Super Admin', '49.37.116.61', 'Chrome 129.0.0.0, Windows 10', '2024-10-18 12:49:16'),
(170, 'admin@drsmart.com', 'Super Admin', '49.37.116.61', 'Chrome 129.0.0.0, Windows 10', '2024-10-18 12:49:27'),
(171, 'admin@drsmart.com', 'Super Admin', '49.37.116.61', 'Chrome 129.0.0.0, Windows 10', '2024-10-19 04:20:30'),
(172, 'admin@drsmart.com', 'Super Admin', '49.37.116.61', 'Chrome 129.0.0.0, Windows 10', '2024-10-19 04:34:33'),
(173, 'admin@drsmart.com', 'Super Admin', '49.37.116.61', 'Chrome 129.0.0.0, Windows 10', '2024-10-19 04:42:42'),
(174, 'admin@drsmart.com', 'Super Admin', '49.37.116.61', 'Chrome 129.0.0.0, Windows 10', '2024-10-19 11:01:51'),
(175, 'admin@drsmart.com', 'Super Admin', '49.37.116.61', 'Chrome 129.0.0.0, Windows 10', '2024-10-21 07:19:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `childs` text NOT NULL,
  `role` varchar(30) NOT NULL,
  `verification_code` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES
(1, 1, 'pat1', '8l73tn', '', 'patient', '', 'yes', '2024-05-30 07:26:53'),
(2, 2, 'pat2', 'i1q6hw', '', 'patient', '', 'yes', '2024-05-30 07:30:13'),
(3, 3, 'pat3', '8nznct', '', 'patient', '', 'yes', '2024-05-30 07:32:16'),
(4, 4, 'pat4', '2x3ox0', '', 'patient', '', 'yes', '2024-05-30 07:34:04'),
(5, 5, 'pat5', '4gwmf5', '', 'patient', '', 'yes', '2024-05-30 07:36:31'),
(6, 6, 'pat6', 'wnqla3', '', 'patient', '', 'yes', '2024-05-30 07:38:27'),
(7, 7, 'pat7', 'u9q3cx', '', 'patient', '', 'yes', '2024-05-30 07:40:18'),
(8, 8, 'pat8', 'd21au7', '', 'patient', '', 'yes', '2024-05-30 07:42:55'),
(9, 9, 'pat9', 'chx5e2', '', 'patient', '', 'yes', '2024-05-30 07:44:33'),
(10, 10, 'pat10', '6hf9xh', '', 'patient', '', 'yes', '2024-05-30 07:46:04'),
(11, 11, 'pat11', 'l5eecr', '', 'patient', '', 'yes', '2024-05-30 09:34:36'),
(12, 12, 'pat12', 'n4mfh5', '', 'patient', '', 'yes', '2024-05-30 09:37:33'),
(13, 13, 'pat13', 'rjqhjw', '', 'patient', '', 'yes', '2024-05-30 09:39:09'),
(14, 14, 'pat14', 'geosel', '', 'patient', '', 'yes', '2024-05-30 09:42:25'),
(15, 15, 'pat15', 'ng1iv9', '', 'patient', '', 'yes', '2024-05-30 09:43:43'),
(16, 16, 'pat16', 'ecxcwm', '', 'patient', '', 'yes', '2024-05-30 09:45:14'),
(17, 17, 'pat17', '1dr3nw', '', 'patient', '', 'yes', '2024-05-30 09:49:01'),
(18, 18, 'pat18', 'prhvud', '', 'patient', '', 'yes', '2024-05-30 09:55:16'),
(19, 19, 'pat19', 'ghnb6w', '', 'patient', '', 'yes', '2024-05-30 10:06:12'),
(20, 20, 'pat20', 'klo3x3', '', 'patient', '', 'yes', '2024-05-30 10:07:38'),
(21, 21, 'pat21', 'sf869h', '', 'patient', '', 'yes', '2024-08-03 02:59:51'),
(22, 22, 'pat22', '68d2c2', '', 'patient', '', 'yes', '2024-08-03 03:00:17'),
(23, 23, 'pat23', 'ps1bke', '', 'patient', '', 'yes', '2024-08-03 06:09:22'),
(24, 24, 'pat24', 'y6v8pa', '', 'patient', '', 'yes', '2024-08-05 06:21:07'),
(25, 25, 'pat25', 'l7p31x', '', 'patient', '', 'yes', '2024-08-05 06:32:50'),
(26, 26, 'pat26', 'mpwdgf', '', 'patient', '', 'no', '2024-08-13 12:53:27'),
(27, 27, 'pat27', 'b70gmd', '', 'patient', '', 'no', '2024-08-13 12:54:13'),
(28, 28, 'pat28', '96i8y5', '', 'patient', '', 'yes', '2024-08-05 07:52:08'),
(29, 29, 'pat29', 'ycluc1', '', 'patient', '', 'yes', '2024-08-05 09:13:08'),
(30, 30, 'pat30', 'era65l', '', 'patient', '', 'yes', '2024-08-05 09:18:51'),
(31, 31, 'pat31', 'kzxgpa', '', 'patient', '', 'yes', '2024-08-05 09:29:39'),
(32, 32, 'pat32', '0rpc7m', '', 'patient', '', 'yes', '2024-08-05 09:35:06'),
(33, 33, 'pat33', 'cify06', '', 'patient', '', 'yes', '2024-08-05 13:11:21'),
(34, 34, 'pat34', 'kc1sg8', '', 'patient', '', 'yes', '2024-08-06 07:05:14'),
(35, 35, 'pat35', 'hzf0zk', '', 'patient', '', 'yes', '2024-08-07 07:00:05'),
(36, 36, 'pat36', '8ifiz2', '', 'patient', '', 'yes', '2024-08-07 08:50:40'),
(37, 37, 'pat37', 'x5s2nv', '', 'patient', '', 'no', '2024-08-09 09:49:35'),
(38, 38, 'pat38', 'tgooqj', '', 'patient', '', 'yes', '2024-08-08 06:35:51'),
(39, 39, 'pat39', '461gjy', '', 'patient', '', 'no', '2024-08-13 12:53:59'),
(40, 40, 'pat40', '21hmuj', '', 'patient', '', 'no', '2024-08-13 12:53:42'),
(41, 41, 'pat41', 'ooj39u', '', 'patient', '', 'yes', '2024-08-13 11:43:22'),
(42, 42, 'pat42', 'ta0n57', '', 'patient', '', 'yes', '2024-08-14 05:25:27'),
(43, 43, 'pat43', 'afzt27', '', 'patient', '', 'yes', '2024-08-14 06:03:14'),
(44, 44, 'pat44', 'wbtadb', '', 'patient', '', 'yes', '2024-08-16 05:17:41'),
(45, 45, 'pat45', 'qpnckm', '', 'patient', '', 'yes', '2024-08-16 07:31:19'),
(46, 46, 'pat46', 'oij81f', '', 'patient', '', 'yes', '2024-08-16 09:41:17'),
(47, 47, 'pat47', 'xor257', '', 'patient', '', 'yes', '2024-08-17 04:37:42'),
(48, 48, 'pat48', 'trxiiz', '', 'patient', '', 'yes', '2024-08-17 05:36:33'),
(49, 49, 'pat49', 'i1vipq', '', 'patient', '', 'yes', '2024-08-19 09:38:02'),
(50, 50, 'pat50', 'j9w2lm', '', 'patient', '', 'yes', '2024-08-22 04:53:44'),
(51, 51, 'pat51', '6nrzrw', '', 'patient', '', 'yes', '2024-08-22 06:05:02'),
(52, 52, 'pat52', 'w390ma', '', 'patient', '', 'yes', '2024-08-22 07:05:21'),
(53, 53, 'pat53', '2wlfwn', '', 'patient', '', 'yes', '2024-08-23 05:34:24'),
(54, 54, 'pat54', '2884l8', '', 'patient', '', 'yes', '2024-08-26 06:49:25'),
(55, 55, 'pat55', '6z168w', '', 'patient', '', 'yes', '2024-08-31 04:43:41'),
(56, 56, 'pat56', 'x5ujpx', '', 'patient', '', 'yes', '2024-08-29 07:22:18'),
(57, 57, 'pat57', 'x4tkux', '', 'patient', '', 'yes', '2024-08-29 07:55:29'),
(58, 58, 'pat58', '17yxvx', '', 'patient', '', 'yes', '2024-08-31 05:09:31'),
(59, 59, 'pat59', 'gh0qiw', '', 'patient', '', 'yes', '2024-08-31 06:13:32'),
(60, 60, 'pat60', 'fi9451', '', 'patient', '', 'yes', '2024-09-03 07:09:56'),
(61, 61, 'pat61', '0zjzg6', '', 'patient', '', 'yes', '2024-09-03 11:23:46'),
(62, 62, 'pat62', 'vrrn6r', '', 'patient', '', 'yes', '2024-09-05 05:49:44'),
(63, 63, 'pat63', 'hyctu5', '', 'patient', '', 'no', '2024-10-15 06:06:40'),
(64, 64, 'pat64', 'tvb83f', '', 'patient', '', 'yes', '2024-09-06 07:24:45'),
(65, 65, 'pat65', 'lysji1', '', 'patient', '', 'yes', '2024-09-10 07:17:32'),
(67, 69, 'pat69', 'm0x8ra', '', 'patient', '', 'yes', '2024-09-21 05:53:15'),
(68, 70, 'pat70', 'xnxidl', '', 'patient', '', 'yes', '2024-09-23 09:53:52'),
(69, 71, 'pat71', 'zi6mgr', '', 'patient', '', 'no', '2024-09-25 06:54:32'),
(70, 72, 'pat72', 't2hos8', '', 'patient', '', 'no', '2024-09-25 06:54:19'),
(71, 73, 'pat73', '09d2nd', '', 'patient', '', 'no', '2024-09-25 06:54:09'),
(72, 74, 'pat74', 'virmox', '', 'patient', '', 'yes', '2024-09-25 07:06:09'),
(73, 75, 'pat75', '7wuy5d', '', 'patient', '', 'no', '2024-10-03 11:50:56'),
(74, 76, 'pat76', 'qcv6bo', '', 'patient', '', 'yes', '2024-10-03 05:04:52'),
(75, 77, 'pat77', 'hqy8xc', '', 'patient', '', 'no', '2024-10-03 09:24:21'),
(76, 78, 'pat78', 'knj20t', '', 'patient', '', 'no', '2024-10-03 09:28:52'),
(77, 79, 'pat79', '0p1oyx', '', 'patient', '', 'no', '2024-10-03 09:48:47'),
(78, 80, 'pat80', '6fk06x', '', 'patient', '', 'no', '2024-10-03 09:50:15'),
(79, 81, 'pat81', 'czqc2o', '', 'patient', '', 'no', '2024-10-07 06:35:49'),
(80, 82, 'pat82', 'x8iggc', '', 'patient', '', 'yes', '2024-10-07 06:54:57'),
(81, 83, 'pat83', '0d9zkz', '', 'patient', '', 'yes', '2024-10-07 09:36:47'),
(82, 84, 'pat84', 'qgqbjc', '', 'patient', '', 'yes', '2024-10-07 09:54:05'),
(83, 85, 'pat85', 'fjn9np', '', 'patient', '', 'yes', '2024-10-07 10:13:05'),
(84, 86, 'pat86', 'whupow', '', 'patient', '', 'no', '2024-10-07 10:29:03'),
(85, 87, 'pat87', 'ekoh8q', '', 'patient', '', 'yes', '2024-10-07 10:30:59'),
(86, 88, 'pat88', 'udw499', '', 'patient', '', 'yes', '2024-10-07 10:40:30'),
(87, 89, 'pat89', 'nxedws', '', 'patient', '', 'yes', '2024-10-07 10:57:26'),
(88, 90, 'pat90', 'rttlud', '', 'patient', '', 'yes', '2024-10-07 11:05:08'),
(89, 91, 'pat91', 'p6sry9', '', 'patient', '', 'yes', '2024-10-07 11:29:50'),
(90, 92, 'pat92', 'fuaswr', '', 'patient', '', 'yes', '2024-10-07 11:39:39'),
(91, 93, 'pat93', 'lbj496', '', 'patient', '', 'yes', '2024-10-08 12:34:51'),
(92, 94, 'pat94', 'mrp3ph', '', 'patient', '', 'no', '2024-10-14 10:48:31'),
(93, 95, 'pat95', 'lyaa7b', '', 'patient', '', 'yes', '2024-10-15 04:31:22');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int UNSIGNED NOT NULL,
  `vehicle_no` varchar(20) DEFAULT NULL,
  `vehicle_model` varchar(100) NOT NULL DEFAULT 'None',
  `manufacture_year` varchar(4) DEFAULT NULL,
  `vehicle_type` varchar(100) NOT NULL,
  `driver_name` varchar(50) DEFAULT NULL,
  `driver_licence` varchar(50) NOT NULL DEFAULT 'None',
  `driver_contact` varchar(20) DEFAULT NULL,
  `note` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `vehicle_no`, `vehicle_model`, `manufacture_year`, `vehicle_type`, `driver_name`, `driver_licence`, `driver_contact`, `note`, `created_at`) VALUES
(1, 'JOR1234321', 'YAMHAA ', '2024', 'Contractual', 'fasil mohammad', '', '+9656754356', '', '2024-08-21 04:46:39'),
(2, 'DEF9101', 'Toyota Innova', '2018', 'Owned', 'Junaid', '', '+9656767653', '', '2024-09-03 11:40:15'),
(4, 'ASD123', 'Tata  ', '2023', 'Owned', 'Murtaisi', 'GHFD1234', '+9658978657', '', '2024-10-15 12:02:20');

-- --------------------------------------------------------

--
-- Table structure for table `visitors_book`
--

CREATE TABLE `visitors_book` (
  `id` int NOT NULL,
  `source` varchar(100) DEFAULT NULL,
  `purpose` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(12) NOT NULL,
  `id_proof` varchar(50) NOT NULL,
  `visit_to` varchar(255) NOT NULL,
  `ipd_opd_staff` int NOT NULL,
  `related_to` varchar(255) NOT NULL,
  `no_of_pepple` int NOT NULL,
  `date` date NOT NULL,
  `in_time` varchar(20) NOT NULL,
  `out_time` varchar(20) NOT NULL,
  `note` mediumtext NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `visitors_book`
--

INSERT INTO `visitors_book` (`id`, `source`, `purpose`, `name`, `email`, `contact`, `id_proof`, `visit_to`, `ipd_opd_staff`, `related_to`, `no_of_pepple`, `date`, `in_time`, `out_time`, `note`, `image`) VALUES
(1, NULL, 'Visit', 'Mohammed Al-Jabari', NULL, '+9657553464', '', '', 0, '', 5, '2024-08-16', '09:15 AM', '10:15 AM', 'Please don\'t disturb to anyone', 'id1.jpg'),
(2, NULL, 'Visit', 'احمد', NULL, '+9655252525', '', '', 0, '', 0, '2024-08-27', '03:45 PM', '03:45 PM', '', ''),
(3, NULL, 'Visit', 'Salmaaro', NULL, '+9657898765', '', 'staff', 10, 'Nabil Faris (1009)', 0, '2024-09-03', '11:30 AM', '12:30 PM', '', ''),
(4, NULL, 'Visit', 'Sarthak', NULL, '+9656545674', '', 'opd_patient', 70, 'Ahmad Mohammed Al-Jundi (OPDN3)', 0, '2024-09-03', '02:30 PM', '04:30 PM', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `visitors_purpose`
--

CREATE TABLE `visitors_purpose` (
  `id` int NOT NULL,
  `visitors_purpose` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `visitors_purpose`
--

INSERT INTO `visitors_purpose` (`id`, `visitors_purpose`, `description`) VALUES
(1, 'Visit', 'Visitor centers used to provide fairly basic information about the place, corporation or event they are celebrating, acting more as the entry way to a place. The role of the visitor center has been rapidly evolving over the past 10 years to become more of an experience and to tell the story of the place or brand it represents. Many have become destinations and experiences in their own right.'),
(2, 'Inquiry ', 'Inquiry is an approach to learning that involves a process of exploring the natural or material world, and that leads to asking questions, making discoveries, and testing those discoveries in the search for new understanding.'),
(3, 'Seminar ', 'A seminar may be defined as a gathering of people for the purpose of discussing a stated topic. Such gatherings are usually interactive sessions where the participants engage in discussions about the delineated topic.');

-- --------------------------------------------------------

--
-- Table structure for table `visit_details`
--

CREATE TABLE `visit_details` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `opd_id` int NOT NULL,
  `opd_no` varchar(100) NOT NULL,
  `cons_doctor` int NOT NULL,
  `case_type` varchar(200) NOT NULL,
  `appointment_date` datetime NOT NULL,
  `symptoms` varchar(200) NOT NULL,
  `bp` varchar(100) NOT NULL,
  `height` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `pulse` varchar(255) NOT NULL,
  `temperature` varchar(255) NOT NULL,
  `respiration` varchar(255) NOT NULL,
  `pre_medical_issue` varchar(255) NOT NULL,
  `known_allergies` varchar(100) NOT NULL,
  `casualty` varchar(200) NOT NULL,
  `refference` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `note` varchar(100) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `note_remark` mediumtext NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `cheque_no` varchar(200) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `payment_doc` text NOT NULL,
  `generated_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `visit_details`
--

INSERT INTO `visit_details` (`id`, `patient_id`, `opd_id`, `opd_no`, `cons_doctor`, `case_type`, `appointment_date`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `pre_medical_issue`, `known_allergies`, `casualty`, `refference`, `date`, `note`, `amount`, `tax`, `note_remark`, `payment_mode`, `cheque_no`, `cheque_date`, `payment_doc`, `generated_by`) VALUES
(1, 69, 5, 'OPDN5', 4, '', '2024-09-23 16:07:00', '', '', '', '', '', '', '', '', '', 'No', '', '0000-00-00', '', 500.00, 0.00, '', 'UPI', '', '0000-00-00', '', 1),
(2, 64, 9, 'OPDN9', 3, '', '2024-09-03 16:15:00', '', '', '', '', '', '', '', '', '', 'No', '', '0000-00-00', '', 600.00, 0.00, '', 'Cash', '', '0000-00-00', '', 1),
(3, 64, 10, 'OPDN10', 3, '', '2024-09-10 16:19:00', '', '', '', '', '', '', '', '', '', 'No', '', '0000-00-00', '', 600.00, 0.00, '', 'Cash', '', '0000-00-00', '', 1),
(4, 52, 15, 'OPDN15', 3, '101', '2024-09-26 11:31:00', '', '', '', '', '', '', '', '', '', 'No', '', '0000-00-00', '', 600.00, 0.00, '', 'Cash', '', '0000-00-00', '', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ambulance_call`
--
ALTER TABLE `ambulance_call`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ambulance_payment`
--
ALTER TABLE `ambulance_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointpriority`
--
ALTER TABLE `appointpriority`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bed`
--
ALTER TABLE `bed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bed_group`
--
ALTER TABLE `bed_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bed_type`
--
ALTER TABLE `bed_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `birth_report`
--
ALTER TABLE `birth_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blood_bank_products`
--
ALTER TABLE `blood_bank_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blood_bank_status`
--
ALTER TABLE `blood_bank_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blood_donor`
--
ALTER TABLE `blood_donor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blood_donor_cycle`
--
ALTER TABLE `blood_donor_cycle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blood_issue`
--
ALTER TABLE `blood_issue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charges`
--
ALTER TABLE `charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charge_categories`
--
ALTER TABLE `charge_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaint_type`
--
ALTER TABLE `complaint_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consultant_register`
--
ALTER TABLE `consultant_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consult_charges`
--
ALTER TABLE `consult_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_for`
--
ALTER TABLE `content_for`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_id` (`content_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_field_id` (`custom_field_id`);

--
-- Indexes for table `data_transfer_log`
--
ALTER TABLE `data_transfer_log`
  ADD PRIMARY KEY (`transfer_id`);

--
-- Indexes for table `death_report`
--
ALTER TABLE `death_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dispatch_receive`
--
ALTER TABLE `dispatch_receive`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dose_duration`
--
ALTER TABLE `dose_duration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dose_interval`
--
ALTER TABLE `dose_interval`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_config`
--
ALTER TABLE `email_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry_type`
--
ALTER TABLE `enquiry_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_head`
--
ALTER TABLE `expense_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `floor`
--
ALTER TABLE `floor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follow_up`
--
ALTER TABLE `follow_up`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_media_gallery`
--
ALTER TABLE `front_cms_media_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_menus`
--
ALTER TABLE `front_cms_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_menu_items`
--
ALTER TABLE `front_cms_menu_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_pages`
--
ALTER TABLE `front_cms_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_page_contents`
--
ALTER TABLE `front_cms_page_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_id` (`page_id`);

--
-- Indexes for table `front_cms_programs`
--
ALTER TABLE `front_cms_programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_program_photos`
--
ALTER TABLE `front_cms_program_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_id` (`program_id`);

--
-- Indexes for table `front_cms_settings`
--
ALTER TABLE `front_cms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_calls`
--
ALTER TABLE `general_calls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hospital_department`
--
ALTER TABLE `hospital_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income_head`
--
ALTER TABLE `income_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ipd_billing`
--
ALTER TABLE `ipd_billing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ipd_details`
--
ALTER TABLE `ipd_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ipd_prescription_basic`
--
ALTER TABLE `ipd_prescription_basic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ipd_prescription_details`
--
ALTER TABLE `ipd_prescription_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_category`
--
ALTER TABLE `item_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_issue`
--
ALTER TABLE `item_issue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `item_category_id` (`item_category_id`);

--
-- Indexes for table `item_stock`
--
ALTER TABLE `item_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `item_store`
--
ALTER TABLE `item_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_supplier`
--
ALTER TABLE `item_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab`
--
ALTER TABLE `lab`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `medicine_bad_stock`
--
ALTER TABLE `medicine_bad_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine_batch_details`
--
ALTER TABLE `medicine_batch_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine_category`
--
ALTER TABLE `medicine_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine_dosage`
--
ALTER TABLE `medicine_dosage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_roles`
--
ALTER TABLE `notification_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `send_notification_id` (`send_notification_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `notification_setting`
--
ALTER TABLE `notification_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opd_billing`
--
ALTER TABLE `opd_billing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opd_details`
--
ALTER TABLE `opd_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opd_patient_charges`
--
ALTER TABLE `opd_patient_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opd_payment`
--
ALTER TABLE `opd_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operation_category`
--
ALTER TABLE `operation_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operation_list`
--
ALTER TABLE `operation_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operation_theatre`
--
ALTER TABLE `operation_theatre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organisation`
--
ALTER TABLE `organisation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organisations_charges`
--
ALTER TABLE `organisations_charges`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `org_id` (`org_id`) USING BTREE,
  ADD KEY `charge_id` (`charge_id`) USING BTREE;

--
-- Indexes for table `ot_consultant_register`
--
ALTER TABLE `ot_consultant_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pathology`
--
ALTER TABLE `pathology`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pathology_category`
--
ALTER TABLE `pathology_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pathology_parameter`
--
ALTER TABLE `pathology_parameter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pathology_report`
--
ALTER TABLE `pathology_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pathology_unit`
--
ALTER TABLE `pathology_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_charges`
--
ALTER TABLE `patient_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_timeline`
--
ALTER TABLE `patient_timeline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_settings`
--
ALTER TABLE `payment_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payslip_allowance`
--
ALTER TABLE `payslip_allowance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_category`
--
ALTER TABLE `permission_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_group`
--
ALTER TABLE `permission_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pharmacy_bill_basic`
--
ALTER TABLE `pharmacy_bill_basic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pharmacy_bill_detail`
--
ALTER TABLE `pharmacy_bill_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prefix_setting`
--
ALTER TABLE `prefix_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `print_setting`
--
ALTER TABLE `print_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `radio`
--
ALTER TABLE `radio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `radiology_parameter`
--
ALTER TABLE `radiology_parameter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `radiology_report`
--
ALTER TABLE `radiology_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `radiology_unit`
--
ALTER TABLE `radiology_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `read_notification`
--
ALTER TABLE `read_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `read_systemnotification`
--
ALTER TABLE `read_systemnotification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sch_settings`
--
ALTER TABLE `sch_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lang_id` (`lang_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `send_notification`
--
ALTER TABLE `send_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_config`
--
ALTER TABLE `sms_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `source`
--
ALTER TABLE `source`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specialist`
--
ALTER TABLE `specialist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`);

--
-- Indexes for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_attendance_type`
--
ALTER TABLE `staff_attendance_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_designation`
--
ALTER TABLE `staff_designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_leave_details`
--
ALTER TABLE `staff_leave_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_leave_request`
--
ALTER TABLE `staff_leave_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_payroll`
--
ALTER TABLE `staff_payroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_payslip`
--
ALTER TABLE `staff_payslip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_roles`
--
ALTER TABLE `staff_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `staff_timeline`
--
ALTER TABLE `staff_timeline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_bill_basic`
--
ALTER TABLE `supplier_bill_basic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_bill_detail`
--
ALTER TABLE `supplier_bill_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_category`
--
ALTER TABLE `supplier_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_notification`
--
ALTER TABLE `system_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_type_report`
--
ALTER TABLE `test_type_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tpa_doctorcharges`
--
ALTER TABLE `tpa_doctorcharges`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `org_id` (`org_id`) USING BTREE,
  ADD KEY `charge_id` (`charge_id`) USING BTREE;

--
-- Indexes for table `tpa_master`
--
ALTER TABLE `tpa_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitors_book`
--
ALTER TABLE `visitors_book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitors_purpose`
--
ALTER TABLE `visitors_purpose`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visit_details`
--
ALTER TABLE `visit_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ambulance_call`
--
ALTER TABLE `ambulance_call`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ambulance_payment`
--
ALTER TABLE `ambulance_payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `appointpriority`
--
ALTER TABLE `appointpriority`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bed`
--
ALTER TABLE `bed`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `bed_group`
--
ALTER TABLE `bed_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bed_type`
--
ALTER TABLE `bed_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `birth_report`
--
ALTER TABLE `birth_report`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blood_bank_products`
--
ALTER TABLE `blood_bank_products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blood_bank_status`
--
ALTER TABLE `blood_bank_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `blood_donor`
--
ALTER TABLE `blood_donor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blood_donor_cycle`
--
ALTER TABLE `blood_donor_cycle`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blood_issue`
--
ALTER TABLE `blood_issue`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `charges`
--
ALTER TABLE `charges`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `charge_categories`
--
ALTER TABLE `charge_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `complaint_type`
--
ALTER TABLE `complaint_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `consultant_register`
--
ALTER TABLE `consultant_register`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `consult_charges`
--
ALTER TABLE `consult_charges`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `content_for`
--
ALTER TABLE `content_for`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `data_transfer_log`
--
ALTER TABLE `data_transfer_log`
  MODIFY `transfer_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `death_report`
--
ALTER TABLE `death_report`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `diagnosis`
--
ALTER TABLE `diagnosis`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `dispatch_receive`
--
ALTER TABLE `dispatch_receive`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dose_duration`
--
ALTER TABLE `dose_duration`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dose_interval`
--
ALTER TABLE `dose_interval`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `email_config`
--
ALTER TABLE `email_config`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `enquiry`
--
ALTER TABLE `enquiry`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquiry_type`
--
ALTER TABLE `enquiry_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expense_head`
--
ALTER TABLE `expense_head`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `floor`
--
ALTER TABLE `floor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `follow_up`
--
ALTER TABLE `follow_up`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_media_gallery`
--
ALTER TABLE `front_cms_media_gallery`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_menus`
--
ALTER TABLE `front_cms_menus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `front_cms_menu_items`
--
ALTER TABLE `front_cms_menu_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `front_cms_pages`
--
ALTER TABLE `front_cms_pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `front_cms_page_contents`
--
ALTER TABLE `front_cms_page_contents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_programs`
--
ALTER TABLE `front_cms_programs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_program_photos`
--
ALTER TABLE `front_cms_program_photos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_settings`
--
ALTER TABLE `front_cms_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `general_calls`
--
ALTER TABLE `general_calls`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hospital_department`
--
ALTER TABLE `hospital_department`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `income_head`
--
ALTER TABLE `income_head`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ipd_billing`
--
ALTER TABLE `ipd_billing`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ipd_details`
--
ALTER TABLE `ipd_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ipd_prescription_basic`
--
ALTER TABLE `ipd_prescription_basic`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ipd_prescription_details`
--
ALTER TABLE `ipd_prescription_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `item_issue`
--
ALTER TABLE `item_issue`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `item_stock`
--
ALTER TABLE `item_stock`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `item_store`
--
ALTER TABLE `item_store`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `item_supplier`
--
ALTER TABLE `item_supplier`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lab`
--
ALTER TABLE `lab`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `medicine_bad_stock`
--
ALTER TABLE `medicine_bad_stock`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicine_batch_details`
--
ALTER TABLE `medicine_batch_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `medicine_category`
--
ALTER TABLE `medicine_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `medicine_dosage`
--
ALTER TABLE `medicine_dosage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notification_roles`
--
ALTER TABLE `notification_roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notification_setting`
--
ALTER TABLE `notification_setting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `opd_billing`
--
ALTER TABLE `opd_billing`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `opd_details`
--
ALTER TABLE `opd_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `opd_patient_charges`
--
ALTER TABLE `opd_patient_charges`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `opd_payment`
--
ALTER TABLE `opd_payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `operation_category`
--
ALTER TABLE `operation_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `operation_list`
--
ALTER TABLE `operation_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `operation_theatre`
--
ALTER TABLE `operation_theatre`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `organisation`
--
ALTER TABLE `organisation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `organisations_charges`
--
ALTER TABLE `organisations_charges`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `ot_consultant_register`
--
ALTER TABLE `ot_consultant_register`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pathology`
--
ALTER TABLE `pathology`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pathology_category`
--
ALTER TABLE `pathology_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pathology_parameter`
--
ALTER TABLE `pathology_parameter`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pathology_report`
--
ALTER TABLE `pathology_report`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pathology_unit`
--
ALTER TABLE `pathology_unit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `patient_charges`
--
ALTER TABLE `patient_charges`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `patient_timeline`
--
ALTER TABLE `patient_timeline`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payment_settings`
--
ALTER TABLE `payment_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payslip_allowance`
--
ALTER TABLE `payslip_allowance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `permission_category`
--
ALTER TABLE `permission_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT for table `permission_group`
--
ALTER TABLE `permission_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `pharmacy`
--
ALTER TABLE `pharmacy`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pharmacy_bill_basic`
--
ALTER TABLE `pharmacy_bill_basic`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pharmacy_bill_detail`
--
ALTER TABLE `pharmacy_bill_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `print_setting`
--
ALTER TABLE `print_setting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `radio`
--
ALTER TABLE `radio`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `radiology_parameter`
--
ALTER TABLE `radiology_parameter`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `radiology_report`
--
ALTER TABLE `radiology_report`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `radiology_unit`
--
ALTER TABLE `radiology_unit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `read_notification`
--
ALTER TABLE `read_notification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `read_systemnotification`
--
ALTER TABLE `read_systemnotification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=293;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=956;

--
-- AUTO_INCREMENT for table `send_notification`
--
ALTER TABLE `send_notification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sms_config`
--
ALTER TABLE `sms_config`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `source`
--
ALTER TABLE `source`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `specialist`
--
ALTER TABLE `specialist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `staff_attendance_type`
--
ALTER TABLE `staff_attendance_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff_designation`
--
ALTER TABLE `staff_designation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `staff_leave_details`
--
ALTER TABLE `staff_leave_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;

--
-- AUTO_INCREMENT for table `staff_leave_request`
--
ALTER TABLE `staff_leave_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `staff_payroll`
--
ALTER TABLE `staff_payroll`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_payslip`
--
ALTER TABLE `staff_payslip`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `staff_roles`
--
ALTER TABLE `staff_roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `staff_timeline`
--
ALTER TABLE `staff_timeline`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_bill_basic`
--
ALTER TABLE `supplier_bill_basic`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `supplier_bill_detail`
--
ALTER TABLE `supplier_bill_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_category`
--
ALTER TABLE `supplier_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `system_notification`
--
ALTER TABLE `system_notification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=272;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `test_type_report`
--
ALTER TABLE `test_type_report`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tpa_doctorcharges`
--
ALTER TABLE `tpa_doctorcharges`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tpa_master`
--
ALTER TABLE `tpa_master`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `visitors_book`
--
ALTER TABLE `visitors_book`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `visitors_purpose`
--
ALTER TABLE `visitors_purpose`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `visit_details`
--
ALTER TABLE `visit_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `content_for`
--
ALTER TABLE `content_for`
  ADD CONSTRAINT `content_for_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_for_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `front_cms_page_contents`
--
ALTER TABLE `front_cms_page_contents`
  ADD CONSTRAINT `front_cms_page_contents_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `front_cms_pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `front_cms_program_photos`
--
ALTER TABLE `front_cms_program_photos`
  ADD CONSTRAINT `front_cms_program_photos_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `front_cms_programs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_issue`
--
ALTER TABLE `item_issue`
  ADD CONSTRAINT `item_issue_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_issue_ibfk_2` FOREIGN KEY (`item_category_id`) REFERENCES `item_category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_stock`
--
ALTER TABLE `item_stock`
  ADD CONSTRAINT `item_stock_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_stock_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `item_supplier` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_stock_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `item_store` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notification_roles`
--
ALTER TABLE `notification_roles`
  ADD CONSTRAINT `notification_roles_ibfk_1` FOREIGN KEY (`send_notification_id`) REFERENCES `send_notification` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notification_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
