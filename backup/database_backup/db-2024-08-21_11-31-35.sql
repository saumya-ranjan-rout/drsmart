#
# TABLE STRUCTURE FOR: ambulance_call
#

DROP TABLE IF EXISTS `ambulance_call`;

CREATE TABLE `ambulance_call` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(200) NOT NULL,
  `patient_name` varchar(50) DEFAULT NULL,
  `contact_no` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `vehicle_no` varchar(20) DEFAULT NULL,
  `vehicle_model` varchar(20) DEFAULT NULL,
  `driver` varchar(100) NOT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

INSERT INTO `ambulance_call` (`id`, `bill_no`, `patient_name`, `contact_no`, `address`, `vehicle_no`, `vehicle_model`, `driver`, `amount`, `date`, `created_at`, `generated_by`) VALUES (1, '1', '47', NULL, NULL, '1', NULL, 'fasil mohammad', '100.00', '2024-08-22 10:17:00', '2024-08-21 04:47:45', 1);
INSERT INTO `ambulance_call` (`id`, `bill_no`, `patient_name`, `contact_no`, `address`, `vehicle_no`, `vehicle_model`, `driver`, `amount`, `date`, `created_at`, `generated_by`) VALUES (2, '2', '48', NULL, NULL, '1', NULL, 'fasil mohammad', '100.00', '2024-08-21 10:33:00', '2024-08-21 05:03:57', 1);
INSERT INTO `ambulance_call` (`id`, `bill_no`, `patient_name`, `contact_no`, `address`, `vehicle_no`, `vehicle_model`, `driver`, `amount`, `date`, `created_at`, `generated_by`) VALUES (3, '3', '47', NULL, NULL, '1', NULL, 'fasil mohammad', '100.00', '2024-08-01 10:34:00', '2024-08-21 05:04:36', 1);


#
# TABLE STRUCTURE FOR: appointment
#

DROP TABLE IF EXISTS `appointment`;

CREATE TABLE `appointment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `appointment_no` varchar(100) NOT NULL,
  `date` datetime DEFAULT NULL,
  `patient_name` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobileno` varchar(50) DEFAULT NULL,
  `doctor` varchar(50) DEFAULT NULL,
  `amount` varchar(200) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `appointment_status` varchar(11) DEFAULT NULL,
  `source` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_opd` varchar(200) NOT NULL,
  `is_ipd` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `patient_name`, `gender`, `email`, `mobileno`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`) VALUES (1, 43, 'APPNO1', '2024-08-14 15:07:00', 'Yousef Al-Shamari', 'Male', 'yousef.shamari@gmail.com', '+9656334224', '3', '', '', 'approved', 'Offline', '2024-08-14 09:37:38', 'yes', 'yes');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `patient_name`, `gender`, `email`, `mobileno`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`) VALUES (2, 44, 'APPNO2', '2024-08-19 10:11:00', 'Amir Al-Husseini', 'Male', 'amir.husseini@gmail.com', '+9626873566', '3', '', 'Please come in proper time.', 'approved', 'Offline', '2024-08-16 04:53:38', 'yes', 'yes');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `patient_name`, `gender`, `email`, `mobileno`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`) VALUES (3, 45, 'APPNO3', '2024-08-24 12:46:00', 'Abdullah Al-Sarhan', 'Male', 'Abdullah.arhan@gmail.com', '+9656565444', '3', '', '', 'approved', 'Offline', '2024-08-16 07:17:06', 'yes', 'yes');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `patient_name`, `gender`, `email`, `mobileno`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`) VALUES (4, 46, 'APPNO4', '2024-08-16 15:09:00', 'Rami Al-Ahmad', 'Male', 'rami.ahmad@gmail.com', '+9658678655', '3', '', '', 'approved', 'Offline', '2024-08-16 09:39:52', 'yes', 'yes');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `patient_name`, `gender`, `email`, `mobileno`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`) VALUES (5, 35, 'APPNO5', '2024-08-20 11:01:00', 'Yagyaseni', 'Female', 'yagyaseni@gmail.com', '+9658796765', '5', '', '', 'approved', 'Offline', '2024-08-17 05:31:51', '', 'yes');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `patient_name`, `gender`, `email`, `mobileno`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`) VALUES (6, 49, 'APPNO6', '2024-08-19 15:06:00', 'Sheikh Asif Noor', 'Male', 'sheikh@gmail.com', '+9657896541', '3', '', '', 'approved', 'Offline', '2024-08-19 09:36:47', 'yes', '');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `patient_name`, `gender`, `email`, `mobileno`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`) VALUES (7, 24, 'APPNO7', '2024-08-19 16:12:00', 'Madhusudan Jena', 'Male', 'madhusudan.jena@3sdsolutions.com', '+965+9656370', '3', '', '', 'approved', 'Offline', '2024-08-19 10:42:17', '', '');


#
# TABLE STRUCTURE FOR: bed
#

DROP TABLE IF EXISTS `bed`;

CREATE TABLE `bed` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `bed_type_id` int NOT NULL,
  `bed_group_id` int NOT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (1, 'GF - 101', 1, 1, 'no');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (2, 'TF - 102', 2, 2, 'yes');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (3, 'TF - 103', 3, 2, 'yes');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (4, 'TF - 104', 1, 2, 'yes');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (5, 'SF - 105', 1, 4, 'yes');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (6, 'TF - 106', 2, 3, 'no');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (7, 'TF - 107', 2, 2, 'yes');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (8, 'GF - 108', 1, 1, 'no');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (9, 'GF - 109', 2, 1, 'yes');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (10, 'TF - 110', 3, 3, 'yes');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (11, 'FF - 111', 3, 6, 'yes');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (12, 'SF - 112', 3, 5, 'yes');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (13, 'SF - 113', 1, 5, 'no');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (14, 'FF - 114', 1, 7, 'no');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (15, 'FF - 115', 1, 6, 'yes');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (16, 'FF - 116', 1, 6, 'yes');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (17, 'FF - 117', 1, 6, 'yes');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (18, 'GF - 118', 2, 1, 'no');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (19, 'GF - 119', 2, 1, 'yes');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (20, 'GF - 120', 2, 1, 'yes');


#
# TABLE STRUCTURE FOR: bed_group
#

DROP TABLE IF EXISTS `bed_group`;

CREATE TABLE `bed_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `floor` varchar(100) NOT NULL,
  `is_active` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

INSERT INTO `bed_group` (`id`, `name`, `description`, `floor`, `is_active`) VALUES (1, 'VIP Ward', 'A palliative or hospice unit is where end-of-life care is provided if you have a life-limiting illness, which may or may not be cancer-related. Hospice and palliative care focus on providing comfort a', '5', 0);
INSERT INTO `bed_group` (`id`, `name`, `description`, `floor`, `is_active`) VALUES (2, 'Private Ward', 'The operating room (OR) is where both inpatient and outpatient surgeries are performed.\r\n', '3', 0);
INSERT INTO `bed_group` (`id`, `name`, `description`, `floor`, `is_active`) VALUES (3, 'General Ward Male', 'The general ward of a hospital is a shared patient care area where multiple patients receive medical treatment and monitoring, typically used for non-critical cases requiring hospitalization.', '3', 0);
INSERT INTO `bed_group` (`id`, `name`, `description`, `floor`, `is_active`) VALUES (4, 'ICU', 'The intensive care unit (ICU) is where you\'re sent if you require close monitoring. The ICU is also referred to as a critical care unit.2﻿ Nurses in the ICU typically have just one or two patients, so', '2', 0);
INSERT INTO `bed_group` (`id`, `name`, `description`, `floor`, `is_active`) VALUES (5, 'NICU', 'The NICU may be either the neurological intensive care unit or the neonatal intensive care unit, depending on whether the facility treats adults or children. In some facilities, the neurological ICU i', '2', 0);
INSERT INTO `bed_group` (`id`, `name`, `description`, `floor`, `is_active`) VALUES (6, 'AC (Normal)', 'An AC normal room in a hospital provides a private, air-conditioned space for patients, offering more comfort and privacy compared to general wards, suitable for non-critical care.', '1', 0);
INSERT INTO `bed_group` (`id`, `name`, `description`, `floor`, `is_active`) VALUES (7, 'Non AC', 'A non-AC normal room in a hospital is a private space for patients that offers privacy and essential medical care without air conditioning, suitable for non-critical cases.', '4', 0);


#
# TABLE STRUCTURE FOR: bed_type
#

DROP TABLE IF EXISTS `bed_type`;

CREATE TABLE `bed_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

INSERT INTO `bed_type` (`id`, `name`) VALUES (1, 'Standard');
INSERT INTO `bed_type` (`id`, `name`) VALUES (2, 'VIP');
INSERT INTO `bed_type` (`id`, `name`) VALUES (3, 'Normal');


#
# TABLE STRUCTURE FOR: birth_report
#

DROP TABLE IF EXISTS `birth_report`;

CREATE TABLE `birth_report` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

INSERT INTO `birth_report` (`id`, `ref_no`, `opd_ipd_no`, `child_name`, `child_pic`, `gender`, `birth_date`, `weight`, `mother_name`, `contact`, `mother_pic`, `father_name`, `father_pic`, `birth_report`, `document`, `address`, `is_active`, `created_at`) VALUES (1, 'BR20241', '', 'Faisal Al-Tamimi', 'uploads/birth_image/1/child_img1.png', 'Male', '2024-08-16 00:00:00', '4', '33', '+9656444363', 'uploads/patient_images/no_image.png', 'Amal Al-Tamimi', 'uploads/patient_images/no_image.png', 'ok', '', '', 'yes', '2024-08-16 08:53:54');
INSERT INTO `birth_report` (`id`, `ref_no`, `opd_ipd_no`, `child_name`, `child_pic`, `gender`, `birth_date`, `weight`, `mother_name`, `contact`, `mother_pic`, `father_name`, `father_pic`, `birth_report`, `document`, `address`, `is_active`, `created_at`) VALUES (2, 'BR20002', '', 'Zaid Al-Dabbas', 'uploads/patient_images/no_image.png', 'Male', '2000-04-14 00:00:00', '4kg', '16', '+9655454255', 'uploads/patient_images/no_image.png', '', 'uploads/patient_images/no_image.png', 'ok', '', 'Jordan', 'yes', '2024-08-16 08:57:26');
INSERT INTO `birth_report` (`id`, `ref_no`, `opd_ipd_no`, `child_name`, `child_pic`, `gender`, `birth_date`, `weight`, `mother_name`, `contact`, `mother_pic`, `father_name`, `father_pic`, `birth_report`, `document`, `address`, `is_active`, `created_at`) VALUES (3, 'BR20243', 'IPDN8', 'Aliza Beth', 'uploads/patient_images/no_image.png', 'Female', '2024-08-20 00:00:00', '2 kg', '48', '+9656783456', 'uploads/patient_images/no_image.png', '', 'uploads/patient_images/no_image.png', '', '', 'Jordan', 'yes', '2024-08-20 12:54:35');


#
# TABLE STRUCTURE FOR: blood_bank_status
#

DROP TABLE IF EXISTS `blood_bank_status`;

CREATE TABLE `blood_bank_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `blood_group` varchar(3) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `ceated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

INSERT INTO `blood_bank_status` (`id`, `blood_group`, `status`, `ceated_at`) VALUES (1, 'A+', '5', '2018-08-18 11:40:07');
INSERT INTO `blood_bank_status` (`id`, `blood_group`, `status`, `ceated_at`) VALUES (2, 'B+', '5', '2018-08-18 12:10:55');
INSERT INTO `blood_bank_status` (`id`, `blood_group`, `status`, `ceated_at`) VALUES (3, 'A-', '5', '2018-08-18 12:11:24');
INSERT INTO `blood_bank_status` (`id`, `blood_group`, `status`, `ceated_at`) VALUES (4, 'B-', '5', '2018-08-18 12:11:44');
INSERT INTO `blood_bank_status` (`id`, `blood_group`, `status`, `ceated_at`) VALUES (5, 'O+', '5', '2018-08-18 12:12:06');
INSERT INTO `blood_bank_status` (`id`, `blood_group`, `status`, `ceated_at`) VALUES (6, 'O-', '5', '2018-08-18 12:12:20');
INSERT INTO `blood_bank_status` (`id`, `blood_group`, `status`, `ceated_at`) VALUES (7, 'AB+', '5', '2018-08-18 12:12:36');
INSERT INTO `blood_bank_status` (`id`, `blood_group`, `status`, `ceated_at`) VALUES (8, 'AB-', '5', '2018-08-18 12:13:18');


#
# TABLE STRUCTURE FOR: blood_donor
#

DROP TABLE IF EXISTS `blood_donor`;

CREATE TABLE `blood_donor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `donor_name` varchar(100) DEFAULT NULL,
  `age` varchar(11) DEFAULT NULL,
  `month` varchar(20) DEFAULT NULL,
  `blood_group` varchar(11) DEFAULT NULL,
  `gender` varchar(11) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `blood_donor` (`id`, `donor_name`, `age`, `month`, `blood_group`, `gender`, `father_name`, `address`, `contact_no`, `created_at`) VALUES (1, 'Mohammad Raffi', '45', '6', 'B+', 'Male', 'Sershah Rafi', '', '+9652567568', '2024-08-17 06:33:01');


#
# TABLE STRUCTURE FOR: blood_donor_cycle
#

DROP TABLE IF EXISTS `blood_donor_cycle`;

CREATE TABLE `blood_donor_cycle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `blood_donor_id` int NOT NULL,
  `institution` varchar(100) DEFAULT NULL,
  `lot` varchar(11) DEFAULT NULL,
  `bag_no` varchar(11) DEFAULT NULL,
  `quantity` varchar(11) DEFAULT NULL,
  `donate_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

INSERT INTO `blood_donor_cycle` (`id`, `blood_donor_id`, `institution`, `lot`, `bag_no`, `quantity`, `donate_date`, `created_at`) VALUES (2, 1, '', '', '1', '10', '2024-08-09', '2024-08-17 06:35:44');


#
# TABLE STRUCTURE FOR: blood_issue
#

DROP TABLE IF EXISTS `blood_issue`;

CREATE TABLE `blood_issue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(200) NOT NULL,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

INSERT INTO `blood_issue` (`id`, `bill_no`, `date_of_issue`, `recieve_to`, `blood_group`, `gender`, `doctor`, `institution`, `technician`, `amount`, `donor_name`, `lot`, `bag_no`, `remark`, `created_at`, `generated_by`) VALUES (1, '1', '2024-08-17 12:08:00', '48', NULL, NULL, 'Ahmed Al-Masri', NULL, '', '100.00', '1', '', '', '', '2024-08-17 06:39:16', 1);
INSERT INTO `blood_issue` (`id`, `bill_no`, `date_of_issue`, `recieve_to`, `blood_group`, `gender`, `doctor`, `institution`, `technician`, `amount`, `donor_name`, `lot`, `bag_no`, `remark`, `created_at`, `generated_by`) VALUES (2, '2', '2024-08-17 15:44:00', '47', NULL, NULL, 'Ahmed Al-Masri', NULL, '', '100.00', '1', '', '1', '', '2024-08-17 10:15:23', 1);


#
# TABLE STRUCTURE FOR: charge_categories
#

DROP TABLE IF EXISTS `charge_categories`;

CREATE TABLE `charge_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `charge_type` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;

INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (1, 'Eye check', 'An eye exam involves a series of tests to evaluate your vision and check for eye diseases. Your eye doctor is likely to use various instruments, shine bright lights at your eyes and request that you look through an array of lenses. Each test during an eye exam evaluates a different aspect of your vision or eye health.', 'Procedures');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (2, 'X-ray', 'An X-ray is a quick, painless test that produces images of the structures inside your body — particularly your bones. X-ray beams pass through your body, and they are absorbed in different amounts depending on the density of the material they pass through.', 'Investigations');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (3, 'Oxygen cylinder', 'Best Overall - OXY5 Portable Pure Oxygen 3+1 Cans with built-in mask for Ambitious People. It has a capacity of almost 600 breaths and is claimed by the company to be India\'s first refillable can. It is a perfect product for those who are ambitious and want the most out of life.', 'Supplier');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (4, 'Operation Services', 'Health care operations include the administrative, financial and legal activities of a hospital, specialty practice, ancillary care provider or remote health service center. Health care professionals need to get a handle on operations because, at minimum, they enable running the business', 'Operation Theatre');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (5, 'Histopathology', 'This refers to the examination of cells under a microscope after they have been stained with appropriate dyes.', 'Pathology');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (6, 'CAD-AI Research Laboratory.', 'The Computer Aided Diagnosis-Artificial Intelligence (CAD-AI) Laboratory in the Department of Radiology was established in 1989 by Heang-Ping .', 'Radiology');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (7, 'Packed Blood Cells', 'Packed red blood cells, also known as packed cells, are red blood cells that have been separated for blood transfusion. The packed cells are typically used in anemia that is either causing symptoms or when the hemoglobin is less than usually 70–80 g/L (7–8 g/dL).', 'Bloodbank');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (8, 'Surgical pathology', 'Surgical pathology is the study of tissues removed from living patients during surgery to help diagnose a disease and determine a treatment plan. Often, the surgical pathologist provides consultation', 'Pathology');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (9, 'Digital Image Processing', 'Digital image processing is the use of a digital computer to process digital images through an algorithm. ... It allows a much wider range of algorithms to be applied to the input data and can avoid problems such as the build-up of noise and distortion during processing.', 'Radiology');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (10, 'Cytopathology', 'In cytopathology, cells that have been shed into bodily fluids or have been obtained by scraping or aspirating tissue are examined. Typical examples include cervical smear, sputum and gastric washings.', 'Pathology');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (11, 'Other Charges', 'Others', 'Others');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (12, 'Fire extinguisher', 'The size of a fire extinguisher indicates the amount of extinguishing agent it holds and is most often measured in pounds. Sizes can range from as small as 2.5 lb. to as large as 350 lb.', 'Supplier');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (13, 'Sterilization and Cleaning Equipment', 'Sterilization .', 'Procedures');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (14, 'Blood sugar test', 'A blood glucose test is a blood test that screens for diabetes by measuring the level of glucose (sugar) in a person\'s blood. Normal blood glucose level (while fasting) range within 70 to 99 mg/dL (3.9 to 5.5 mmol/L). Higher ranges could indicate pre-diabetes or diabetes. Test Details', 'Bloodbank');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (15, 'Cholesterol level check', 'To check your cholesterol levels, your doctor will need to get a sample of your blood. You will probably have your blood drawn in the morning, sometimes after fasting since the night before. A blood test is an outpatient procedure. It takes only a few minutes and is relatively painless.', 'Procedures');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (16, 'Blood pressure check', 'A normal blood pressure level is less than 120/80 mmHg. No matter your age, you can take steps each day to keep your blood pressure in a healthy range.', 'Procedures');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (17, 'ERS/Patient Transport Service', 'At ERS Medical, we provide specialist transport services to the healthcare sector. We understand that this is a dynamic and ever-changing industry.', 'Ambulance');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (18, 'Private Ambulance	', 'Personal Ambulance', 'Ambulance');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (19, 'Appointment Charges', 'Define appointment fee. means a non-refundable sum of money payable to body corporate practicing as a Town Planner immediately on his official engagement', 'Appointment');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (20, 'Cryoprecipitate', 'Cryoprecipitate is a highly concentrated source of fibrinogen. ... The cost per unit of fibrinogen is similar in FFP and Cryoprecipiate. In severe liver disease, pools of 8 to 10 units of Cryoprecipitate may be used so the total cost (and amount of fibrinogen given) may be greater.', 'Bloodbank');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (21, 'Platelet Concentrate', 'Platelet transfusion, also known as platelet concentrate, is used to prevent or treat bleeding in people with either a low platelet count or poor platelet function. Often this occurs in people receiving cancer chemotherapy. Preventive transfusion is often done in those with platelet levels of less than 10 x 109/L.', 'Bloodbank');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (22, 'Fresh Frozen Plasma', 'Fresh frozen plasma is a blood product made from the liquid portion of whole blood.', 'Bloodbank');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (23, 'Mammographic Tomosynthesis', 'Breast tomosynthesis, also called three-dimensional (3-D) mammography and digital breast tomosynthesis (DBT), is an advanced form of breast imaging, or mammography, that uses a low-dose x-ray system and computer reconstructions to create three-dimensional images of the breasts.', 'Radiology');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (24, 'Dermatopathology', 'Dermatopathology concerns the study of skin diseases.', 'Pathology');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (25, 'Forensic pathology', 'Forensic pathology involves the post mortem examination of a corpse for cause of death using a process called autopsy.', 'Pathology');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (26, 'Laundry', 'The definition of laundry is a group of clothes or linens that are being washed, or a place where clothing and other fabrics are washed or cleaned. An example of laundry is the batch of dirty towels that you put into the washing machine.', 'IPD');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (27, 'Nursing Services', '	Nursing services means health care services provided to a patient by a registered professional nurse or a licensed practical nurse under the direction of a licensed professional within the scope of practice as defined by state law.', 'IPD');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (28, 'Maternity patient admissions', 'A maternity hospital specializes in caring for women during pregnancy and childbirth. It also provides care for newborn infants, and may act as a centre for clinical training in midwifery and obstetrics.', 'IPD');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (29, 'Admission and Discharge.', 'Patients are admitted to TMH from different sources: OPD - Doctors may advise for admission to the respective ward. Labour room - Gynecological or Obstetric patients are treated and advised for admission', 'IPD');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (30, 'Intensive Care Units', 'Intensive care units cater to patients with severe or life-threatening illnesses and injuries, which require constant care, close supervision from life support equipment and medication in order to ensure normal bodily functions.', 'IPD');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (31, 'OPD Insurance', 'Comprehensive health benefits Add on to your health insurance.', 'OPD');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (32, 'OPD Service', 'It is known as outpatient department in which we provide the facility of diagnosis and take care of the patients who can not stay overnight.', 'OPD');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (33, 'OPD Consultation Fees', 'O.P.D, also known as Outpatient Consultation Department, includes consulting with patients and offering immediate treatment methods which do not require hospitalization. The type of medical practice done by most physicians falls under the category of O.P.D consultation. Apart from private practitioners and government health centers, private hospitals and nursing homes also offer O.P.D facility for patients.', 'OPD');


#
# TABLE STRUCTURE FOR: charges
#

DROP TABLE IF EXISTS `charges`;

CREATE TABLE `charges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `charge_type` varchar(200) NOT NULL,
  `charge_category` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `code` varchar(100) NOT NULL,
  `standard_charge` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;

INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (1, 'Procedures', 'Eye check', 'Eye check\r\n', 'P1001', '150.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (2, 'Investigations', 'X-ray', 'X-ray\r\n', 'I1001', '150.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (3, 'Supplier', 'Oxygen cylinder', 'Oxygen cylinder\r\n', 'S1001', '160.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (4, 'Operation Theatre', 'Operation Services', 'Operation Services\r\n', 'O1001', '100.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (5, 'Pathology', 'Histopathology', 'Pathology Charges\r\n', 'PA1001', '160.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (6, 'Radiology', 'CAD-AI Research Laboratory.', 'CAD-AI Research Laboratory.\r\n', 'R1001', '160.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (7, 'Others', 'Other Charges', 'Blood Module\r\n', 'B1001', '110.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (8, 'Radiology', 'Digital Image Processing', '', 'DIP01', '500.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (9, 'Pathology', 'Surgical pathology', '', 'SP01', '300.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (10, 'Pathology', 'Cytopathology', '', 'C001', '250.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (11, 'Pathology', 'Dermatopathology', '', 'D1001', '250.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (12, 'Pathology', 'Forensic pathology', '', 'F1001', '290.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (13, 'Radiology', 'Mammographic Tomosynthesis', '', 'M1001', '499.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (14, 'Ambulance', 'ERS/Patient Transport Service', '', 'ER1001', '120.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (15, 'IPD', 'Admission and Discharge.', '', 'IP1001', '1000.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (16, 'IPD', 'Intensive Care Units', '', 'IP1002', '500.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (17, 'Ambulance', 'Private Ambulance	', '', 'ER1002', '150.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (18, 'Others', 'Other Charges', '', 'O1001', '100.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (19, 'IPD', 'Maternity patient admissions', '', 'IP1003', '150.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (20, 'Appointment', 'Appointment Charges', '', 'AP1001', '100.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (21, 'OPD', 'OPD Insurance', '', 'OP1001', '100.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (22, 'IPD', 'Laundry', '', 'IP1004', '150.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (23, 'OPD', 'OPD Consultation Fees', '', 'OP1002', '150.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (24, 'OPD', 'OPD Service', '', 'OP1003', '120.00', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (25, 'Bloodbank', 'Packed Blood Cells', '', 'BL1001', '100.00', '0000-00-00', '');


#
# TABLE STRUCTURE FOR: complaint
#

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `complaint` (`id`, `complaint_type`, `source`, `name`, `contact`, `email`, `date`, `description`, `action_taken`, `assigned`, `note`, `image`) VALUES (1, 'Food quality', 'From visitors', 'Omar Al-Najjar', '+9656856789', '', '2024-08-17', 'OK', '', '', '', '');


#
# TABLE STRUCTURE FOR: complaint_type
#

DROP TABLE IF EXISTS `complaint_type`;

CREATE TABLE `complaint_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `complaint_type` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

INSERT INTO `complaint_type` (`id`, `complaint_type`, `description`, `created_at`) VALUES (1, 'Food quality', 'A reference to a set of rules that were followed when the resource was constructed, and which must be understood when processing the content. Often, this is a reference to an implementation guide that defines the special rules along with other profiles etc.', '2024-05-30 07:15:32');
INSERT INTO `complaint_type` (`id`, `complaint_type`, `description`, `created_at`) VALUES (2, 'Hospital services', '', '2024-05-30 07:15:48');
INSERT INTO `complaint_type` (`id`, `complaint_type`, `description`, `created_at`) VALUES (3, 'Long Wait Times', 'Long Wait Times', '2024-05-30 07:16:11');
INSERT INTO `complaint_type` (`id`, `complaint_type`, `description`, `created_at`) VALUES (4, 'Billing Discrepancies', '', '2024-05-30 07:16:28');


#
# TABLE STRUCTURE FOR: consult_charges
#

DROP TABLE IF EXISTS `consult_charges`;

CREATE TABLE `consult_charges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor` int NOT NULL,
  `standard_charge` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

INSERT INTO `consult_charges` (`id`, `doctor`, `standard_charge`, `date`, `status`) VALUES (1, 3, '600', '0000-00-00', '');
INSERT INTO `consult_charges` (`id`, `doctor`, `standard_charge`, `date`, `status`) VALUES (2, 4, '500', '0000-00-00', '');
INSERT INTO `consult_charges` (`id`, `doctor`, `standard_charge`, `date`, `status`) VALUES (3, 5, '900', '0000-00-00', '');
INSERT INTO `consult_charges` (`id`, `doctor`, `standard_charge`, `date`, `status`) VALUES (4, 6, '1000', '0000-00-00', '');
INSERT INTO `consult_charges` (`id`, `doctor`, `standard_charge`, `date`, `status`) VALUES (5, 7, '500', '0000-00-00', '');


#
# TABLE STRUCTURE FOR: consultant_register
#

DROP TABLE IF EXISTS `consultant_register`;

CREATE TABLE `consultant_register` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `ipd_id` int NOT NULL,
  `date` varchar(100) DEFAULT NULL,
  `ins_date` varchar(50) DEFAULT NULL,
  `instruction` varchar(200) NOT NULL,
  `cons_doctor` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

INSERT INTO `consultant_register` (`id`, `patient_id`, `ipd_id`, `date`, `ins_date`, `instruction`, `cons_doctor`) VALUES (1, 43, 3, '2024-08-16 13:22:00', '2024-08-16', 'please take medicine after food.', 3);
INSERT INTO `consultant_register` (`id`, `patient_id`, `ipd_id`, `date`, `ins_date`, `instruction`, `cons_doctor`) VALUES (2, 45, 4, '2024-08-17 10:28:00', '2024-08-17', 'don\'t use cold water', 3);
INSERT INTO `consultant_register` (`id`, `patient_id`, `ipd_id`, `date`, `ins_date`, `instruction`, `cons_doctor`) VALUES (3, 45, 4, '2024-08-19 16:13:00', '2024-08-19', 'hnjmbjhm', 3);
INSERT INTO `consultant_register` (`id`, `patient_id`, `ipd_id`, `date`, `ins_date`, `instruction`, `cons_doctor`) VALUES (4, 4, 7, '2024-08-20 12:10:00', '2024-08-05', 'don\'t take oily food', 3);
INSERT INTO `consultant_register` (`id`, `patient_id`, `ipd_id`, `date`, `ins_date`, `instruction`, `cons_doctor`) VALUES (5, 49, 10, '2024-08-20 18:18:00', '2024-08-20', 'don\'t take cold water', 3);


#
# TABLE STRUCTURE FOR: content_for
#

DROP TABLE IF EXISTS `content_for`;

CREATE TABLE `content_for` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(50) DEFAULT NULL,
  `content_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `content_id` (`content_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `content_for_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_for_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: contents
#

DROP TABLE IF EXISTS `contents`;

CREATE TABLE `contents` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: custom_field_values
#

DROP TABLE IF EXISTS `custom_field_values`;

CREATE TABLE `custom_field_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `belong_table_id` int DEFAULT NULL,
  `custom_field_id` int DEFAULT NULL,
  `field_value` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `custom_field_id` (`custom_field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

INSERT INTO `custom_field_values` (`id`, `belong_table_id`, `custom_field_id`, `field_value`, `created_at`) VALUES (1, 1, 2, '', '2024-08-16 05:51:11');
INSERT INTO `custom_field_values` (`id`, `belong_table_id`, `custom_field_id`, `field_value`, `created_at`) VALUES (2, 1, 3, '', '2024-08-16 05:57:21');
INSERT INTO `custom_field_values` (`id`, `belong_table_id`, `custom_field_id`, `field_value`, `created_at`) VALUES (3, 2, 2, '', '2024-08-16 08:57:26');


#
# TABLE STRUCTURE FOR: custom_fields
#

DROP TABLE IF EXISTS `custom_fields`;

CREATE TABLE `custom_fields` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

INSERT INTO `custom_fields` (`id`, `name`, `belong_to`, `type`, `bs_column`, `validation`, `field_values`, `show_table`, `visible_on_table`, `weight`, `is_active`, `created_at`) VALUES (4, 'dfg', 'death_report', 'input', NULL, 0, NULL, NULL, 0, NULL, 0, '2024-08-21 05:52:59');
INSERT INTO `custom_fields` (`id`, `name`, `belong_to`, `type`, `bs_column`, `validation`, `field_values`, `show_table`, `visible_on_table`, `weight`, `is_active`, `created_at`) VALUES (5, 'fd', 'birth_report', 'input', NULL, 0, NULL, NULL, 0, NULL, 0, '2024-08-21 05:53:58');


#
# TABLE STRUCTURE FOR: death_report
#

DROP TABLE IF EXISTS `death_report`;

CREATE TABLE `death_report` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

INSERT INTO `death_report` (`id`, `opdipd_no`, `patient`, `gender`, `image`, `death_date`, `guardian_name`, `contact`, `address`, `death_report`, `is_active`, `created_at`) VALUES (1, '', '38', '', '', '2024-08-16 00:00:00', 'Faisal Al-Tamimi', '', '', 'ok', 'yes', '2024-08-16 09:00:26');
INSERT INTO `death_report` (`id`, `opdipd_no`, `patient`, `gender`, `image`, `death_date`, `guardian_name`, `contact`, `address`, `death_report`, `is_active`, `created_at`) VALUES (2, '', '47', '', '', '2024-08-20 00:00:00', 'Samirin  Al-Najjar', '', '', '', 'yes', '2024-08-20 12:56:56');


#
# TABLE STRUCTURE FOR: department
#

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (1, 'PATHOLOGY', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (2, 'OPD', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (3, 'IPD', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (4, 'FRONT OFFICE', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (5, 'PHARMACY', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (6, 'RADIOLOGY', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (7, 'OPERATION THEATRE', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (8, 'BLOOD BANK', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (9, 'TPA MANAGEMENT', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (10, 'FINANCE', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (11, 'AMBULANCE', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (12, 'HUMAN RESOURCE', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (13, 'REPORT COUNTER', 'yes');


#
# TABLE STRUCTURE FOR: diagnosis
#

DROP TABLE IF EXISTS `diagnosis`;

CREATE TABLE `diagnosis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `report_type` varchar(200) NOT NULL,
  `document` varchar(200) NOT NULL,
  `description` varchar(400) NOT NULL,
  `report_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `diagnosis` (`id`, `patient_id`, `report_type`, `document`, `description`, `report_date`) VALUES (1, 48, 'CBC', '', '', '2024-08-20');


#
# TABLE STRUCTURE FOR: dispatch_receive
#

DROP TABLE IF EXISTS `dispatch_receive`;

CREATE TABLE `dispatch_receive` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(50) NOT NULL,
  `to_title` varchar(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `note` varchar(500) NOT NULL,
  `from_title` varchar(200) NOT NULL,
  `date` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: email_config
#

DROP TABLE IF EXISTS `email_config`;

CREATE TABLE `email_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email_type` varchar(100) DEFAULT NULL,
  `smtp_server` varchar(100) DEFAULT NULL,
  `smtp_port` varchar(100) DEFAULT NULL,
  `smtp_username` varchar(100) DEFAULT NULL,
  `smtp_password` varchar(100) DEFAULT NULL,
  `ssl_tls` varchar(100) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

INSERT INTO `email_config` (`id`, `email_type`, `smtp_server`, `smtp_port`, `smtp_username`, `smtp_password`, `ssl_tls`, `is_active`, `created_at`) VALUES (2, 'smtp', 'smtp.gmail.com', '587', 'doctorapp123@gmail.com', 'doctor@123', 'tls', 'yes', '2021-01-30 05:40:23');


#
# TABLE STRUCTURE FOR: enquiry
#

DROP TABLE IF EXISTS `enquiry`;

CREATE TABLE `enquiry` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: enquiry_type
#

DROP TABLE IF EXISTS `enquiry_type`;

CREATE TABLE `enquiry_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `enquiry_type` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: events
#

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_title` varchar(200) NOT NULL,
  `event_description` varchar(300) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `event_color` varchar(200) NOT NULL,
  `event_for` varchar(100) NOT NULL,
  `role_id` int NOT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

INSERT INTO `events` (`id`, `event_title`, `event_description`, `start_date`, `end_date`, `event_type`, `event_color`, `event_for`, `role_id`, `is_active`) VALUES (4, 'Appointment with Patient A', 'Need a complete body check-up', '2024-08-05 06:30:00', '2024-08-05 06:30:00', 'private', '#337ab7', '2', 0, '');
INSERT INTO `events` (`id`, `event_title`, `event_description`, `start_date`, `end_date`, `event_type`, `event_color`, `event_for`, `role_id`, `is_active`) VALUES (5, 'Tuesday', '', '2024-08-13 00:00:00', '2024-08-13 00:00:00', 'task', '#000', '9', 6, 'no');


#
# TABLE STRUCTURE FOR: expense_head
#

DROP TABLE IF EXISTS `expense_head`;

CREATE TABLE `expense_head` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exp_category` varchar(50) DEFAULT NULL,
  `description` text,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

INSERT INTO `expense_head` (`id`, `exp_category`, `description`, `is_active`, `is_deleted`, `created_at`) VALUES (1, 'Building rent', '', 'yes', 'no', '2024-05-30 07:44:04');
INSERT INTO `expense_head` (`id`, `exp_category`, `description`, `is_active`, `is_deleted`, `created_at`) VALUES (2, 'Equipements', '', 'yes', 'no', '2024-05-30 07:44:09');
INSERT INTO `expense_head` (`id`, `exp_category`, `description`, `is_active`, `is_deleted`, `created_at`) VALUES (3, 'Electricity Bill', '', 'yes', 'no', '2024-05-30 07:44:18');
INSERT INTO `expense_head` (`id`, `exp_category`, `description`, `is_active`, `is_deleted`, `created_at`) VALUES (4, 'Telephone Bill', '', 'yes', 'no', '2024-05-30 07:44:26');
INSERT INTO `expense_head` (`id`, `exp_category`, `description`, `is_active`, `is_deleted`, `created_at`) VALUES (5, 'Power Generator Fuel Charge', '', 'yes', 'no', '2024-05-30 07:44:40');
INSERT INTO `expense_head` (`id`, `exp_category`, `description`, `is_active`, `is_deleted`, `created_at`) VALUES (6, 'Tea Expense', '', 'yes', 'no', '2024-05-30 07:44:49');


#
# TABLE STRUCTURE FOR: expenses
#

DROP TABLE IF EXISTS `expenses`;

CREATE TABLE `expenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exp_head_id` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `documents` varchar(255) DEFAULT NULL,
  `note` text,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: floor
#

DROP TABLE IF EXISTS `floor`;

CREATE TABLE `floor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

INSERT INTO `floor` (`id`, `name`, `description`) VALUES (1, '1st Floor', 'Neonatal intensive care units (NICUs) which provide care for newborn infants.\r\n');
INSERT INTO `floor` (`id`, `name`, `description`) VALUES (2, '2nd Floor', 'The pediatric intensive care unit (PICU) where children receive critical care. Depending on the facility, newborns may be treated in a PICU or a neonatal ICU. Smaller facilities may have a PICU only, while larger facilities may offer both a PICU and a neonatal ICU.\r\n');
INSERT INTO `floor` (`id`, `name`, `description`) VALUES (3, '3rd Floor', 'A palliative or hospice unit is where end-of-life care is provided if you have a life-limiting illness, which may or may not be cancer-related. Hospice and palliative care focus on providing comfort and quality of life. In some facilities, oncology and hospice/palliative care may be provided in the same unit.\r\n');
INSERT INTO `floor` (`id`, `name`, `description`) VALUES (4, '4th Floor', 'The coronary/cardiac care unit (CCU) is a specialized intensive care unit for cardiac issues. If you have heart disease, experienced a cardiac event such as a heart attack, or if you\'re recovering from open-heart surgery, you may be treated in the CCU. In some facilities, a separate open-heart recovery unit may be utilized for surgical patients.\r\n');
INSERT INTO `floor` (`id`, `name`, `description`) VALUES (5, 'Ground  Floor', 'A good choice here would be luxury vinyl tile (LVT), vinyl composition tile (VCT), sheet vinyl, rubber, or linoleum.\r\n');


#
# TABLE STRUCTURE FOR: follow_up
#

DROP TABLE IF EXISTS `follow_up`;

CREATE TABLE `follow_up` (
  `id` int NOT NULL AUTO_INCREMENT,
  `enquiry_id` int NOT NULL,
  `date` date NOT NULL,
  `next_date` date NOT NULL,
  `response` text NOT NULL,
  `note` text NOT NULL,
  `followup_by` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: front_cms_media_gallery
#

DROP TABLE IF EXISTS `front_cms_media_gallery`;

CREATE TABLE `front_cms_media_gallery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(300) DEFAULT NULL,
  `thumb_path` varchar(300) DEFAULT NULL,
  `dir_path` varchar(300) DEFAULT NULL,
  `img_name` varchar(300) DEFAULT NULL,
  `thumb_name` varchar(300) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `file_type` varchar(100) NOT NULL,
  `file_size` varchar(100) NOT NULL,
  `vid_url` mediumtext NOT NULL,
  `vid_title` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: front_cms_menu_items
#

DROP TABLE IF EXISTS `front_cms_menu_items`;

CREATE TABLE `front_cms_menu_items` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;

INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (16, 2, 'Home', 1, 0, NULL, NULL, NULL, 'home-1', NULL, 0, NULL, 'no', '2018-07-14 08:44:12');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (23, 1, 'Appointment', 77, 0, '1', NULL, 'http://yourdomainname.com/form/appointment', 'appointment', 2, 0, NULL, 'no', '2019-11-01 07:36:32');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (26, 1, 'Home', 1, 0, NULL, NULL, NULL, 'home', NULL, 0, NULL, 'no', '2019-01-24 08:48:17');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (27, 2, 'Appointment', 0, 0, '1', NULL, 'http://yourdomainname.com/form/appointment', 'appointment-1', NULL, 0, NULL, 'no', '2019-11-02 16:24:41');


#
# TABLE STRUCTURE FOR: front_cms_menus
#

DROP TABLE IF EXISTS `front_cms_menus`;

CREATE TABLE `front_cms_menus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu` varchar(100) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `description` mediumtext,
  `open_new_tab` int NOT NULL DEFAULT '0',
  `ext_url` mediumtext NOT NULL,
  `ext_url_link` mediumtext NOT NULL,
  `publish` int NOT NULL DEFAULT '0',
  `content_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

INSERT INTO `front_cms_menus` (`id`, `menu`, `slug`, `description`, `open_new_tab`, `ext_url`, `ext_url_link`, `publish`, `content_type`, `is_active`, `created_at`) VALUES (1, 'Main Menu', 'main-menu', 'Main menu', 0, '', '', 0, 'default', 'no', '2018-04-20 09:24:49');
INSERT INTO `front_cms_menus` (`id`, `menu`, `slug`, `description`, `open_new_tab`, `ext_url`, `ext_url_link`, `publish`, `content_type`, `is_active`, `created_at`) VALUES (2, 'Bottom Menu', 'bottom-menu', 'Bottom Menu', 0, '', '', 0, 'default', 'no', '2018-04-20 09:24:55');


#
# TABLE STRUCTURE FOR: front_cms_page_contents
#

DROP TABLE IF EXISTS `front_cms_page_contents`;

CREATE TABLE `front_cms_page_contents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `page_id` int DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  CONSTRAINT `front_cms_page_contents_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `front_cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: front_cms_pages
#

DROP TABLE IF EXISTS `front_cms_pages`;

CREATE TABLE `front_cms_pages` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb3;

INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (1, 'default', 1, 'Home', 'page/home', 'page', 'home', '', '', '', '', '<p>Home page</p>', '0000-00-00', 1, 1, 'no', '2019-01-24 08:33:59');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (2, 'default', 0, 'Complain', 'page/complain', 'page', 'complain', 'Complain form', '                                                                                                                                                                                    complain form                                                                                                                                                                                                                                ', 'complain form', '', '<div class=\"col-md-12 col-sm-12\">\r\n<h2 class=\"text-center\">&nbsp;</h2>\r\n\r\n<p class=\"text-center\">[form-builder:complain]</p>\r\n</div>', '0000-00-00', 1, 1, 'no', '2019-01-24 08:30:12');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (54, 'default', 0, '404 page', 'page/404-page', 'page', '404-page', '', '                                ', '', '', '<html>\r\n<head>\r\n <title></title>\r\n</head>\r\n<body>\r\n<p>404 page found</p>\r\n</body>\r\n</html>', '0000-00-00', 0, NULL, 'no', '2018-05-18 09:16:04');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (76, 'default', 0, 'Contact us', 'page/contact-us', 'page', 'contact-us', '', '', '', '', '<p>[form-builder:contact_us]</p>', '0000-00-00', 0, NULL, 'no', '2019-01-24 08:31:58');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (77, 'manual', 0, 'our-appointment', 'page/our-appointment', 'page', 'our-appointment', '', '', '', '', '<form action=\"welcome/appointment\" method=\"get\">\r\n  First name: <input type=\"text\" name=\"fname\"><br>\r\n  Last name: <input type=\"text\" name=\"lname\"><br>\r\n  <input type=\"submit\" value=\"Submit\">\r\n</form>', '0000-00-00', 0, 1, 'no', '2019-11-01 07:32:48');


#
# TABLE STRUCTURE FOR: front_cms_program_photos
#

DROP TABLE IF EXISTS `front_cms_program_photos`;

CREATE TABLE `front_cms_program_photos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `program_id` int DEFAULT NULL,
  `media_gallery_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `program_id` (`program_id`),
  CONSTRAINT `front_cms_program_photos_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `front_cms_programs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: front_cms_programs
#

DROP TABLE IF EXISTS `front_cms_programs`;

CREATE TABLE `front_cms_programs` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `sidebar` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: front_cms_settings
#

DROP TABLE IF EXISTS `front_cms_settings`;

CREATE TABLE `front_cms_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `front_cms_settings` (`id`, `theme`, `is_active_rtl`, `is_active_front_cms`, `is_active_sidebar`, `logo`, `contact_us_email`, `complain_form_email`, `sidebar_options`, `fb_url`, `twitter_url`, `youtube_url`, `google_plus`, `instagram_url`, `pinterest_url`, `linkedin_url`, `google_analytics`, `footer_text`, `fav_icon`, `created_at`) VALUES (1, 'default', NULL, NULL, NULL, '', '', '', '[\"news\",\"complain\"]', '', '', '', '', '', '', '', '', '3SDSOLUTIONS.COM', '', '2021-08-13 09:43:33');


#
# TABLE STRUCTURE FOR: general_calls
#

DROP TABLE IF EXISTS `general_calls`;

CREATE TABLE `general_calls` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `follow_up_date` date NOT NULL,
  `call_dureation` varchar(50) NOT NULL,
  `note` mediumtext NOT NULL,
  `call_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `general_calls` (`id`, `name`, `contact`, `date`, `description`, `follow_up_date`, `call_dureation`, `note`, `call_type`) VALUES (1, 'Hassan Al-Khatib', '+9656346332', '2024-08-20', 'ok', '2024-08-05', '10 mins', '', 'Incoming');


#
# TABLE STRUCTURE FOR: hospital_department
#

DROP TABLE IF EXISTS `hospital_department`;

CREATE TABLE `hospital_department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

INSERT INTO `hospital_department` (`id`, `department_name`, `is_active`) VALUES (1, 'Outpatient department (OPD)', 'yes');
INSERT INTO `hospital_department` (`id`, `department_name`, `is_active`) VALUES (2, 'Surgical department', 'yes');
INSERT INTO `hospital_department` (`id`, `department_name`, `is_active`) VALUES (3, 'Inpatient service (IP)', 'yes');
INSERT INTO `hospital_department` (`id`, `department_name`, `is_active`) VALUES (4, 'Nursing department', 'yes');
INSERT INTO `hospital_department` (`id`, `department_name`, `is_active`) VALUES (5, 'Physical medicine', 'yes');
INSERT INTO `hospital_department` (`id`, `department_name`, `is_active`) VALUES (6, 'Paramedical department', 'yes');
INSERT INTO `hospital_department` (`id`, `department_name`, `is_active`) VALUES (7, 'Rehabilitation department', 'yes');
INSERT INTO `hospital_department` (`id`, `department_name`, `is_active`) VALUES (8, 'Dietary department', 'yes');
INSERT INTO `hospital_department` (`id`, `department_name`, `is_active`) VALUES (9, 'Pharmacy department', 'yes');
INSERT INTO `hospital_department` (`id`, `department_name`, `is_active`) VALUES (10, 'Operation theater complex (OT)', 'yes');
INSERT INTO `hospital_department` (`id`, `department_name`, `is_active`) VALUES (11, 'Radiology department (X-ray),', 'yes');


#
# TABLE STRUCTURE FOR: income
#

DROP TABLE IF EXISTS `income`;

CREATE TABLE `income` (
  `id` int NOT NULL AUTO_INCREMENT,
  `inc_head_id` varchar(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `note` text,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `documents` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: income_head
#

DROP TABLE IF EXISTS `income_head`;

CREATE TABLE `income_head` (
  `id` int NOT NULL AUTO_INCREMENT,
  `income_category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `is_deleted` varchar(255) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

INSERT INTO `income_head` (`id`, `income_category`, `description`, `is_active`, `is_deleted`, `created_at`) VALUES (1, 'Hospital charges', 'Hospital charges', 'yes', 'no', '2024-05-30 07:42:37');
INSERT INTO `income_head` (`id`, `income_category`, `description`, `is_active`, `is_deleted`, `created_at`) VALUES (2, 'Special campaign', 'Special campaign', 'yes', 'no', '2024-05-30 07:42:54');
INSERT INTO `income_head` (`id`, `income_category`, `description`, `is_active`, `is_deleted`, `created_at`) VALUES (3, 'Canteen Rent', 'Canteen Rent', 'yes', 'no', '2024-05-30 07:43:18');
INSERT INTO `income_head` (`id`, `income_category`, `description`, `is_active`, `is_deleted`, `created_at`) VALUES (4, 'Vehicle Stand Charges', 'Vehicle Stand Charges', 'yes', 'no', '2024-05-30 07:43:33');


#
# TABLE STRUCTURE FOR: ipd_billing
#

DROP TABLE IF EXISTS `ipd_billing`;

CREATE TABLE `ipd_billing` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

INSERT INTO `ipd_billing` (`id`, `patient_id`, `ipd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`) VALUES (1, 44, 1, 0, '0', '2024-08-16', '0.00', '0.00', '0.00', '0.00', 1, 'paid');
INSERT INTO `ipd_billing` (`id`, `patient_id`, `ipd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`) VALUES (2, 43, 2, 0, '0', '2024-08-16', '0.00', '0.00', '0.00', '0.00', 8, 'paid');
INSERT INTO `ipd_billing` (`id`, `patient_id`, `ipd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`) VALUES (3, 35, 9, 0, '0', '2024-08-20', '0.00', '0.00', '0.00', '0.00', 1, 'paid');
INSERT INTO `ipd_billing` (`id`, `patient_id`, `ipd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`) VALUES (4, 48, 8, 0, '0', '2024-08-20', '0.00', '0.00', '0.00', '0.00', 1, 'paid');


#
# TABLE STRUCTURE FOR: ipd_details
#

DROP TABLE IF EXISTS `ipd_details`;

CREATE TABLE `ipd_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `height` varchar(5) DEFAULT NULL,
  `weight` varchar(5) DEFAULT NULL,
  `bp` varchar(20) DEFAULT NULL,
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
  `discharged_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

INSERT INTO `ipd_details` (`id`, `patient_id`, `height`, `weight`, `bp`, `ipd_no`, `room`, `bed`, `bed_group_id`, `case_type`, `casualty`, `symptoms`, `known_allergies`, `hospital_department`, `note`, `refference`, `cons_doctor`, `amount`, `credit_limit`, `tax`, `payment_mode`, `date`, `discharged`, `discharged_date`) VALUES (1, 44, '', '', '', 'IPDN1', '', '9', '1', '101', 'No', '', '', 0, '', '', 3, '', '100', '', '', '2024-08-16 10:47:00', 'yes', '2024-08-16');
INSERT INTO `ipd_details` (`id`, `patient_id`, `height`, `weight`, `bp`, `ipd_no`, `room`, `bed`, `bed_group_id`, `case_type`, `casualty`, `symptoms`, `known_allergies`, `hospital_department`, `note`, `refference`, `cons_doctor`, `amount`, `credit_limit`, `tax`, `payment_mode`, `date`, `discharged`, `discharged_date`) VALUES (2, 43, '', '', '', 'IPDN2', '', '1', '1', '', 'No', '', '', 0, '', '', 3, '', '', '', '', '2024-08-14 15:07:00', 'yes', '2024-08-16');
INSERT INTO `ipd_details` (`id`, `patient_id`, `height`, `weight`, `bp`, `ipd_no`, `room`, `bed`, `bed_group_id`, `case_type`, `casualty`, `symptoms`, `known_allergies`, `hospital_department`, `note`, `refference`, `cons_doctor`, `amount`, `credit_limit`, `tax`, `payment_mode`, `date`, `discharged`, `discharged_date`) VALUES (3, 43, '', '', '', 'IPDN3', '', '14', '7', '102', 'No', '', '', 3, '', '', 3, '', '', '', '', '2024-08-14 15:07:00', 'no', '0000-00-00');
INSERT INTO `ipd_details` (`id`, `patient_id`, `height`, `weight`, `bp`, `ipd_no`, `room`, `bed`, `bed_group_id`, `case_type`, `casualty`, `symptoms`, `known_allergies`, `hospital_department`, `note`, `refference`, `cons_doctor`, `amount`, `credit_limit`, `tax`, `payment_mode`, `date`, `discharged`, `discharged_date`) VALUES (4, 45, '', '', '', 'IPDN4', '', '13', '5', '', 'No', '', '', 0, '', '', 3, '', '', '', '', '2024-08-29 12:46:00', 'no', '0000-00-00');
INSERT INTO `ipd_details` (`id`, `patient_id`, `height`, `weight`, `bp`, `ipd_no`, `room`, `bed`, `bed_group_id`, `case_type`, `casualty`, `symptoms`, `known_allergies`, `hospital_department`, `note`, `refference`, `cons_doctor`, `amount`, `credit_limit`, `tax`, `payment_mode`, `date`, `discharged`, `discharged_date`) VALUES (5, 46, '', '', '', 'IPDN5', '', '1', '1', '', 'No', '', '', 0, '', '', 3, '', '', '', '', '2024-08-16 15:09:00', 'no', '0000-00-00');
INSERT INTO `ipd_details` (`id`, `patient_id`, `height`, `weight`, `bp`, `ipd_no`, `room`, `bed`, `bed_group_id`, `case_type`, `casualty`, `symptoms`, `known_allergies`, `hospital_department`, `note`, `refference`, `cons_doctor`, `amount`, `credit_limit`, `tax`, `payment_mode`, `date`, `discharged`, `discharged_date`) VALUES (6, 47, '', '', '', 'IPDN6', '', '18', '1', '', 'No', '', '', 0, '', '', 3, '', '', '', '', '2024-08-19 10:01:00', 'no', '0000-00-00');
INSERT INTO `ipd_details` (`id`, `patient_id`, `height`, `weight`, `bp`, `ipd_no`, `room`, `bed`, `bed_group_id`, `case_type`, `casualty`, `symptoms`, `known_allergies`, `hospital_department`, `note`, `refference`, `cons_doctor`, `amount`, `credit_limit`, `tax`, `payment_mode`, `date`, `discharged`, `discharged_date`) VALUES (7, 4, '', '', '', 'IPDN7', '', '6', '3', '', 'No', '', '', 0, '', '', 3, '', '', '', '', '2024-08-24 16:30:00', 'no', '0000-00-00');
INSERT INTO `ipd_details` (`id`, `patient_id`, `height`, `weight`, `bp`, `ipd_no`, `room`, `bed`, `bed_group_id`, `case_type`, `casualty`, `symptoms`, `known_allergies`, `hospital_department`, `note`, `refference`, `cons_doctor`, `amount`, `credit_limit`, `tax`, `payment_mode`, `date`, `discharged`, `discharged_date`) VALUES (8, 48, '', '', '', 'IPDN8', '', '2', '2', 'fever', 'No', '', '', 1, '', '', 3, '', '', '', '', '2024-08-20 14:20:00', 'yes', '2024-08-20');
INSERT INTO `ipd_details` (`id`, `patient_id`, `height`, `weight`, `bp`, `ipd_no`, `room`, `bed`, `bed_group_id`, `case_type`, `casualty`, `symptoms`, `known_allergies`, `hospital_department`, `note`, `refference`, `cons_doctor`, `amount`, `credit_limit`, `tax`, `payment_mode`, `date`, `discharged`, `discharged_date`) VALUES (9, 35, '', '', '', 'IPDN9', '', '8', '1', 'fever', 'No', '', '', 1, '', '', 5, '', '', '', '', '2024-08-20 11:01:00', 'yes', '2024-08-20');
INSERT INTO `ipd_details` (`id`, `patient_id`, `height`, `weight`, `bp`, `ipd_no`, `room`, `bed`, `bed_group_id`, `case_type`, `casualty`, `symptoms`, `known_allergies`, `hospital_department`, `note`, `refference`, `cons_doctor`, `amount`, `credit_limit`, `tax`, `payment_mode`, `date`, `discharged`, `discharged_date`) VALUES (10, 49, '', '', '', 'IPDN10', '', '8', '1', 'fever', 'No', '', '', 1, '', '', 3, '', '', '', '', '2024-08-20 14:44:00', 'no', '0000-00-00');


#
# TABLE STRUCTURE FOR: ipd_prescription_basic
#

DROP TABLE IF EXISTS `ipd_prescription_basic`;

CREATE TABLE `ipd_prescription_basic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ipd_id` int NOT NULL,
  `header_note` varchar(100) NOT NULL,
  `footer_note` varchar(100) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: ipd_prescription_details
#

DROP TABLE IF EXISTS `ipd_prescription_details`;

CREATE TABLE `ipd_prescription_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `basic_id` int NOT NULL,
  `ipd_id` int NOT NULL,
  `medicine_category_id` int NOT NULL,
  `medicine` varchar(200) NOT NULL,
  `dosage` varchar(200) NOT NULL,
  `instruction` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: item
#

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_category_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `unit` varchar(200) NOT NULL,
  `item_photo` varchar(225) DEFAULT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `item_store_id` int DEFAULT NULL,
  `item_supplier_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `item` (`id`, `item_category_id`, `name`, `unit`, `item_photo`, `description`, `created_at`, `item_store_id`, `item_supplier_id`, `quantity`, `date`) VALUES (1, 4, 'bedsheet', '100', NULL, '', '2024-08-16 12:03:09', NULL, NULL, 0, '0000-00-00');


#
# TABLE STRUCTURE FOR: item_category
#

DROP TABLE IF EXISTS `item_category`;

CREATE TABLE `item_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_category` varchar(255) NOT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

INSERT INTO `item_category` (`id`, `item_category`, `is_active`, `description`, `created_at`) VALUES (1, 'Syringe Packs', 'yes', '(MPL) is a contract manufacturer of human and veterinary drug, medical device, and cosmetic products specializing in multiple non-sterile syringe packaging solutions. .Syringes can be filled with powder, semi-solids and liquid dosage forms at volumes from', '2024-05-30 07:46:13');
INSERT INTO `item_category` (`id`, `item_category`, `is_active`, `description`, `created_at`) VALUES (2, 'Cotton Packs', 'yes', '', '2024-05-30 07:46:36');
INSERT INTO `item_category` (`id`, `item_category`, `is_active`, `description`, `created_at`) VALUES (3, 'Medical Equipment', 'yes', '', '2024-05-30 07:46:45');
INSERT INTO `item_category` (`id`, `item_category`, `is_active`, `description`, `created_at`) VALUES (4, 'Bed Sheets', 'yes', '', '2024-05-30 07:46:58');
INSERT INTO `item_category` (`id`, `item_category`, `is_active`, `description`, `created_at`) VALUES (5, 'Uniforms', 'yes', '', '2024-05-30 07:47:08');
INSERT INTO `item_category` (`id`, `item_category`, `is_active`, `description`, `created_at`) VALUES (6, 'Surgical blades', 'yes', '', '2024-05-30 07:47:17');
INSERT INTO `item_category` (`id`, `item_category`, `is_active`, `description`, `created_at`) VALUES (7, 'Automatic Blood Pressure Cuff', 'yes', '', '2024-05-30 07:47:27');


#
# TABLE STRUCTURE FOR: item_issue
#

DROP TABLE IF EXISTS `item_issue`;

CREATE TABLE `item_issue` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `is_active` varchar(10) DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `item_category_id` (`item_category_id`),
  CONSTRAINT `item_issue_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_issue_ibfk_2` FOREIGN KEY (`item_category_id`) REFERENCES `item_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

INSERT INTO `item_issue` (`id`, `issue_type`, `issue_to`, `issue_by`, `issue_date`, `return_date`, `item_category_id`, `item_id`, `quantity`, `note`, `is_returned`, `created_at`, `is_active`) VALUES (3, '6', '9', 'Super Admin', '2024-08-19', '2024-08-19', 4, 1, 2, '', 0, '2024-08-19 10:49:48', 'no');
INSERT INTO `item_issue` (`id`, `issue_type`, `issue_to`, `issue_by`, `issue_date`, `return_date`, `item_category_id`, `item_id`, `quantity`, `note`, `is_returned`, `created_at`, `is_active`) VALUES (4, '3', '3', 'Omar', '2024-08-13', '2024-08-20', 4, 1, 1, '', 0, '2024-08-20 07:51:48', 'no');
INSERT INTO `item_issue` (`id`, `issue_type`, `issue_to`, `issue_by`, `issue_date`, `return_date`, `item_category_id`, `item_id`, `quantity`, `note`, `is_returned`, `created_at`, `is_active`) VALUES (5, '3', '4', 'Omar', '2024-08-20', '2024-08-20', 4, 1, 1, '', 0, '2024-08-20 12:55:06', 'no');


#
# TABLE STRUCTURE FOR: item_stock
#

DROP TABLE IF EXISTS `item_stock`;

CREATE TABLE `item_stock` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `item_stock_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_stock_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `item_supplier` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_stock_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `item_store` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

INSERT INTO `item_stock` (`id`, `item_id`, `supplier_id`, `symbol`, `store_id`, `quantity`, `purchase_price`, `date`, `attachment`, `description`, `is_active`, `created_at`) VALUES (3, 1, 1, '+', 1, 50, '500', '2024-08-19', NULL, '', 'yes', '2024-08-19 10:49:01');


#
# TABLE STRUCTURE FOR: item_store
#

DROP TABLE IF EXISTS `item_store`;

CREATE TABLE `item_store` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_store` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

INSERT INTO `item_store` (`id`, `item_store`, `code`, `description`) VALUES (1, 'Ecopharm Pharmacy', '2342', '');
INSERT INTO `item_store` (`id`, `item_store`, `code`, `description`) VALUES (2, 'Guardian Health', '3454', '');
INSERT INTO `item_store` (`id`, `item_store`, `code`, `description`) VALUES (3, 'Jubilee Insurance Health Pharmacy', '567', '');
INSERT INTO `item_store` (`id`, `item_store`, `code`, `description`) VALUES (4, 'Capital Shoppers Pharmacy', '789', '');


#
# TABLE STRUCTURE FOR: item_supplier
#

DROP TABLE IF EXISTS `item_supplier`;

CREATE TABLE `item_supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_supplier` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_person_name` varchar(255) NOT NULL,
  `contact_person_phone` varchar(255) NOT NULL,
  `contact_person_email` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

INSERT INTO `item_supplier` (`id`, `item_supplier`, `phone`, `email`, `address`, `contact_person_name`, `contact_person_phone`, `contact_person_email`, `description`) VALUES (1, 'Dovuya Pharmacy', '7675443', 'dovuya@gmail.com', 'Kisementi, Kampala, Uganda', '', '', '', '');
INSERT INTO `item_supplier` (`id`, `item_supplier`, `phone`, `email`, `address`, `contact_person_name`, `contact_person_phone`, `contact_person_email`, `description`) VALUES (2, 'Medipoint Pharmacy', '6753122', 'medipoint@acaciamall.com', ' Acacia Mall, Kisementi, Kampala, Uganda', '', '', '', '');
INSERT INTO `item_supplier` (`id`, `item_supplier`, `phone`, `email`, `address`, `contact_person_name`, `contact_person_phone`, `contact_person_email`, `description`) VALUES (3, 'Capital Shoppers Pharmacy', '6675543', 'info@capitalshoppers.co.ug', 'Located in Capital Shoppers Nakawa, Ntinda, and other locations', '', '', '', '');
INSERT INTO `item_supplier` (`id`, `item_supplier`, `phone`, `email`, `address`, `contact_person_name`, `contact_person_phone`, `contact_person_email`, `description`) VALUES (4, 'Lucent Pharmacy', '6754762', 'info@lucent.com', 'Plot no 15, School street, Zarqa city, Jordan', 'Wail Fatayer', '6754762', 'info@lucent.com', 'f3w');


#
# TABLE STRUCTURE FOR: lab
#

DROP TABLE IF EXISTS `lab`;

CREATE TABLE `lab` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lab_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

INSERT INTO `lab` (`id`, `lab_name`) VALUES (2, 'X-ray');
INSERT INTO `lab` (`id`, `lab_name`) VALUES (3, 'Magnetic Resonance Imaging (MRI)');
INSERT INTO `lab` (`id`, `lab_name`) VALUES (4, 'Magnetic Resonance Angiogram (MRA)');
INSERT INTO `lab` (`id`, `lab_name`) VALUES (5, 'Ultrasound');
INSERT INTO `lab` (`id`, `lab_name`) VALUES (6, 'Color Doppler');
INSERT INTO `lab` (`id`, `lab_name`) VALUES (7, 'Computed Tomography (CT Scan)');
INSERT INTO `lab` (`id`, `lab_name`) VALUES (8, 'Mammography');
INSERT INTO `lab` (`id`, `lab_name`) VALUES (9, 'PET Scan');
INSERT INTO `lab` (`id`, `lab_name`) VALUES (10, 'Bone Density test');
INSERT INTO `lab` (`id`, `lab_name`) VALUES (11, 'Biopsy');
INSERT INTO `lab` (`id`, `lab_name`) VALUES (12, 'Fluoroscopy');


#
# TABLE STRUCTURE FOR: languages
#

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(50) DEFAULT NULL,
  `short_code` varchar(100) NOT NULL,
  `is_deleted` varchar(10) NOT NULL DEFAULT 'yes',
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb3;

INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (1, 'Azerbaijan', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (2, 'Albanian', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (4, 'English', 'en', 'no', 'no', '2018-12-01 10:08:15');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (5, 'Arabic', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (7, 'Afrikaans', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (8, 'Basque', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (11, 'Bengali', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (13, 'Bosnian', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (14, 'Welsh', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (15, 'Hungarian', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (16, 'Vietnamese', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (17, 'Haitian (Creole)', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (18, 'Galician', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (19, 'Dutch', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (21, 'Greek', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (22, 'Georgian', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (23, 'Gujarati', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (24, 'Danish', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (25, 'Hebrew', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (26, 'Yiddish', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (27, 'Indonesian', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (28, 'Irish', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (29, 'Italian', 'it', 'no', 'no', '2018-12-01 10:07:03');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (30, 'Icelandic', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (31, 'Spanish', 'es', 'no', 'no', '2018-12-01 10:09:37');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (33, 'Kannada', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (34, 'Catalan', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (36, 'Chinese', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (37, 'Korean', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (38, 'Xhosa', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (39, 'Latin', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (40, 'Latvian', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (41, 'Lithuanian', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (43, 'Malagasy', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (44, 'Malay', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (45, 'Malayalam', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (46, 'Maltese', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (47, 'Macedonian', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (48, 'Maori', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (49, 'Marathi', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (51, 'Mongolian', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (52, 'German', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (53, 'Nepali', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (54, 'Norwegian', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (55, 'Punjabi', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (57, 'Persian', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (59, 'Portuguese', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (60, 'Romanian', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (61, 'Russian', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (62, 'Cebuano', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (64, 'Sinhala', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (65, 'Slovakian', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (66, 'Slovenian', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (67, 'Swahili', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (68, 'Sundanese', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (70, 'Thai', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (71, 'Tagalog', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (72, 'Tamil', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (74, 'Telugu', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (75, 'Turkish', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (77, 'Uzbek', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (79, 'Urdu', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (80, 'Finnish', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (81, 'French', 'fr', 'no', 'no', '2018-12-01 10:08:47');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (82, 'Hindi', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (84, 'Czech', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (85, 'Swedish', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (86, 'Scottish', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (87, 'Estonian', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (88, 'Esperanto', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (89, 'Javanese', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (90, 'Japanese', '', 'no', 'no', '2017-04-06 05:08:33');
INSERT INTO `languages` (`id`, `language`, `short_code`, `is_deleted`, `is_active`, `created_at`) VALUES (91, 'Odia', '', 'yes', 'no', '2020-12-22 05:33:23');


#
# TABLE STRUCTURE FOR: leave_types
#

DROP TABLE IF EXISTS `leave_types`;

CREATE TABLE `leave_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

INSERT INTO `leave_types` (`id`, `type`, `is_active`) VALUES (1, 'CL', 'yes');
INSERT INTO `leave_types` (`id`, `type`, `is_active`) VALUES (2, 'EL', 'yes');
INSERT INTO `leave_types` (`id`, `type`, `is_active`) VALUES (3, 'MEDICAL LEAVE', 'yes');
INSERT INTO `leave_types` (`id`, `type`, `is_active`) VALUES (4, 'EMERGENCY LEAVE', 'yes');
INSERT INTO `leave_types` (`id`, `type`, `is_active`) VALUES (5, 'MATERNITY LEAVE', 'yes');
INSERT INTO `leave_types` (`id`, `type`, `is_active`) VALUES (6, 'HOLIDAY', 'yes');
INSERT INTO `leave_types` (`id`, `type`, `is_active`) VALUES (7, 'ON DUTY', 'yes');


#
# TABLE STRUCTURE FOR: medicine_bad_stock
#

DROP TABLE IF EXISTS `medicine_bad_stock`;

CREATE TABLE `medicine_bad_stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pharmacy_id` int NOT NULL,
  `outward_date` date NOT NULL,
  `expiry_date` varchar(200) NOT NULL,
  `batch_no` varchar(200) NOT NULL,
  `quantity` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: medicine_batch_details
#

DROP TABLE IF EXISTS `medicine_batch_details`;

CREATE TABLE `medicine_batch_details` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

INSERT INTO `medicine_batch_details` (`id`, `supplier_bill_basic_id`, `medicine_category_id`, `pharmacy_id`, `inward_date`, `expiry_date`, `expiry_date_format`, `batch_no`, `packing_qty`, `purchase_rate_packing`, `quantity`, `mrp`, `purchase_price`, `sale_rate`, `batch_amount`, `amount`, `available_quantity`, `created_at`) VALUES (1, '1', '1', 1, '2024-08-17 10:49:00', 'Dec/2024', '0000-00-00', '1010', '10', '', '20', '100', '90', '100', '0.00', '1800', '5', '2024-08-17 05:22:32');
INSERT INTO `medicine_batch_details` (`id`, `supplier_bill_basic_id`, `medicine_category_id`, `pharmacy_id`, `inward_date`, `expiry_date`, `expiry_date_format`, `batch_no`, `packing_qty`, `purchase_rate_packing`, `quantity`, `mrp`, `purchase_price`, `sale_rate`, `batch_amount`, `amount`, `available_quantity`, `created_at`) VALUES (2, '2', '1', 1, '2024-08-17 10:57:00', 'Nov/2024', '0000-00-00', '1011', '10', '', '10', '100', '90', '100', '0.00', '900', '5', '2024-08-17 05:32:05');


#
# TABLE STRUCTURE FOR: medicine_category
#

DROP TABLE IF EXISTS `medicine_category`;

CREATE TABLE `medicine_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `medicine_category` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;

INSERT INTO `medicine_category` (`id`, `medicine_category`) VALUES (1, 'Syrup');
INSERT INTO `medicine_category` (`id`, `medicine_category`) VALUES (2, 'Capsule');
INSERT INTO `medicine_category` (`id`, `medicine_category`) VALUES (3, 'Injection');
INSERT INTO `medicine_category` (`id`, `medicine_category`) VALUES (4, 'Ointment');
INSERT INTO `medicine_category` (`id`, `medicine_category`) VALUES (5, 'Cream');
INSERT INTO `medicine_category` (`id`, `medicine_category`) VALUES (6, 'Surgical');
INSERT INTO `medicine_category` (`id`, `medicine_category`) VALUES (7, 'Drops');
INSERT INTO `medicine_category` (`id`, `medicine_category`) VALUES (8, 'Inhalers');
INSERT INTO `medicine_category` (`id`, `medicine_category`) VALUES (9, 'Implants / Patches	');
INSERT INTO `medicine_category` (`id`, `medicine_category`) VALUES (10, 'Liquid');
INSERT INTO `medicine_category` (`id`, `medicine_category`) VALUES (11, 'Preparations');
INSERT INTO `medicine_category` (`id`, `medicine_category`) VALUES (12, 'Diaper');
INSERT INTO `medicine_category` (`id`, `medicine_category`) VALUES (13, 'Tablet');


#
# TABLE STRUCTURE FOR: medicine_dosage
#

DROP TABLE IF EXISTS `medicine_dosage`;

CREATE TABLE `medicine_dosage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `medicine_category_id` int NOT NULL,
  `dosage_form` varchar(100) NOT NULL,
  `dosage` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

INSERT INTO `medicine_dosage` (`id`, `medicine_category_id`, `dosage_form`, `dosage`) VALUES (1, 13, '', '1');
INSERT INTO `medicine_dosage` (`id`, `medicine_category_id`, `dosage_form`, `dosage`) VALUES (2, 1, '', '0.5 ml');
INSERT INTO `medicine_dosage` (`id`, `medicine_category_id`, `dosage_form`, `dosage`) VALUES (3, 3, '', '0.5 (ML)');
INSERT INTO `medicine_dosage` (`id`, `medicine_category_id`, `dosage_form`, `dosage`) VALUES (4, 7, '', '1 Day');
INSERT INTO `medicine_dosage` (`id`, `medicine_category_id`, `dosage_form`, `dosage`) VALUES (5, 5, '', '1 (ML)');
INSERT INTO `medicine_dosage` (`id`, `medicine_category_id`, `dosage_form`, `dosage`) VALUES (6, 2, '', '1 MG');
INSERT INTO `medicine_dosage` (`id`, `medicine_category_id`, `dosage_form`, `dosage`) VALUES (7, 12, '', '1 Day');
INSERT INTO `medicine_dosage` (`id`, `medicine_category_id`, `dosage_form`, `dosage`) VALUES (8, 4, '', '3 Times');


#
# TABLE STRUCTURE FOR: messages
#

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `message` text,
  `send_mail` varchar(10) DEFAULT '0',
  `send_sms` varchar(10) DEFAULT '0',
  `is_group` varchar(10) DEFAULT '0',
  `is_individual` varchar(10) DEFAULT '0',
  `is_class` int NOT NULL DEFAULT '0',
  `group_list` text,
  `user_list` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `messages` (`id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`) VALUES (1, 'Important Announcement', '<p>Please pay your bills.</p>', '0', '1', '1', '0', 0, '[]', NULL, '2024-08-09 09:29:11');


#
# TABLE STRUCTURE FOR: migrations
#

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `version` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: notification_roles
#

DROP TABLE IF EXISTS `notification_roles`;

CREATE TABLE `notification_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `send_notification_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `is_active` int DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `send_notification_id` (`send_notification_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `notification_roles_ibfk_1` FOREIGN KEY (`send_notification_id`) REFERENCES `send_notification` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notification_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

INSERT INTO `notification_roles` (`id`, `send_notification_id`, `role_id`, `is_active`, `created_at`) VALUES (1, 1, 7, 0, '2024-08-09 07:36:35');
INSERT INTO `notification_roles` (`id`, `send_notification_id`, `role_id`, `is_active`, `created_at`) VALUES (2, 1, 7, 0, '2024-08-09 07:36:35');


#
# TABLE STRUCTURE FOR: notification_setting
#

DROP TABLE IF EXISTS `notification_setting`;

CREATE TABLE `notification_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  `is_mail` varchar(10) DEFAULT '0',
  `is_sms` varchar(10) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `created_at`) VALUES (5, 'login_credential', '1', '0', '2019-03-09 16:35:53');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `created_at`) VALUES (6, 'patient_registration', '0', '0', '2018-12-26 07:38:55');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `created_at`) VALUES (7, 'patient_discharged', '1', '0', '2019-03-09 16:35:53');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `created_at`) VALUES (8, 'patient_revisit', '1', '0', '2019-03-09 16:35:53');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `created_at`) VALUES (9, 'patient_discharge', '0', '0', '2018-12-23 12:54:57');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `created_at`) VALUES (10, 'appointment', '1', '0', '2019-03-09 16:35:53');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `created_at`) VALUES (11, 'opd_patient_registration', '1', '0', '2019-03-09 16:35:53');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `created_at`) VALUES (12, 'ipd_patient_registration', '1', '0', '2019-03-09 16:35:53');


#
# TABLE STRUCTURE FOR: opd_billing
#

DROP TABLE IF EXISTS `opd_billing`;

CREATE TABLE `opd_billing` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: opd_details
#

DROP TABLE IF EXISTS `opd_details`;

CREATE TABLE `opd_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `opd_no` varchar(100) NOT NULL,
  `appointment_date` datetime NOT NULL,
  `case_type` varchar(200) NOT NULL,
  `casualty` varchar(200) NOT NULL,
  `symptoms` varchar(200) NOT NULL,
  `bp` varchar(200) NOT NULL,
  `height` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `known_allergies` varchar(200) NOT NULL,
  `note_remark` varchar(225) DEFAULT NULL,
  `refference` varchar(100) NOT NULL,
  `cons_doctor` int NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `payment_mode` varchar(200) NOT NULL,
  `header_note` varchar(200) NOT NULL,
  `footer_note` varchar(200) NOT NULL,
  `generated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;

INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (1, 43, 'OPDN1', '2024-08-14 15:07:00', '', 'No', '', '', '', '', '', '', '', 3, '600.00', '0.00', 'Cash', '', '', 1);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (2, 45, 'OPDN2', '2024-08-24 12:46:00', '', 'No', '', '', '', '', '', '', '', 3, '500.00', '0.00', 'Cash', '', '', 3);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (3, 44, 'OPDN3', '2024-08-06 01:09:00', '', 'No', '', '', '', '', '', '', '', 3, '600.00', '0.00', 'Cash', '', '', 3);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (4, 45, 'OPDN4', '2024-08-07 13:14:00', '', 'No', '', '', '', '', '', '', '', 3, '60054.00', '0.00', 'Cash', '', '', 3);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (5, 45, 'OPDN5', '2024-08-07 13:14:00', '', 'No', '', '', '', '', '', '', '', 3, '60054.00', '0.00', 'Cash', '', '', 3);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (6, 45, 'OPDN6', '2024-08-07 13:15:00', '', 'No', '', '', '', '', '', '', '', 3, '600.00', '0.00', 'Cash', '', '', 3);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (7, 45, 'OPDN7', '2024-08-16 15:16:00', '', 'No', '', '', '', '', '', '', '', 3, '600.00', '0.00', 'Cash', '', '', 2);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (8, 45, 'OPDN8', '2024-08-16 15:16:00', '', 'No', '', '', '', '', '', '', '', 3, '600.00', '0.00', 'Cash', '', '', 2);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (9, 47, 'OPDN9', '2024-08-19 10:01:00', '107', 'No', '', '', '', '', '', '', '', 3, '500.00', '0.00', 'Cash', '', '', 1);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (10, 45, 'OPDN10', '2024-08-31 10:14:00', '', 'No', '', '', '', '', '', '', '', 3, '0.00', '0.00', 'Cash', '', '', 1);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (11, 47, 'OPDN11', '2024-08-22 10:15:00', '107', 'No', '', '', '', '', '', '', '', 3, '0.00', '0.00', 'Cash', '', '', 1);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (12, 47, 'OPDN12', '2024-08-23 10:16:00', '107', 'No', '', '', '', '', '', '', '', 3, '0.00', '0.00', 'Cash', '', '', 1);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (13, 46, 'OPDN13', '2024-08-23 15:09:00', '', 'No', '', '', '', '', '', '', '', 3, '700.00', '0.00', 'Cash', '', '', 1);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (14, 48, 'OPDN14', '2024-08-18 11:06:00', 'fever', 'No', '', '', '', '', '', '', '', 5, '900.00', '0.00', 'Cash', '', '', 1);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (15, 48, 'OPDN15', '2024-08-20 11:08:00', 'fever', 'No', '', '', '', '', '', '', '', 5, '900.00', '0.00', 'Cash', '', '', 1);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (16, 48, 'OPDN16', '2024-08-18 11:31:00', 'fever', 'No', '', '', '', '', '', '', '', 5, '900.00', '0.00', 'Cash', '', '', 1);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (17, 44, 'OPDN17', '2024-08-19 10:11:00', '', 'No', '', '', '', '', '', '', '', 3, '600.00', '0.00', 'Cash', '', '', 3);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (18, 45, 'OPDN18', '2024-07-30 12:52:00', '', 'No', '', '', '', '', '', '', '', 3, '600.00', '0.00', 'Cash', '', '', 3);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (19, 47, 'OPDN19', '2024-08-17 04:25:00', '', 'No', '', '', '', '', '', '', '', 3, '1000.00', '0.00', 'Cash', '', '', 3);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (20, 20, 'OPDN20', '2024-08-14 04:27:00', '', 'No', '', '', '', '', '', '', '', 3, '1000.00', '0.00', 'Cash', '', '', 3);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (21, 46, 'OPDN21', '2024-08-07 16:29:00', '', 'No', '', '', '', '', '', '', '', 3, '600.00', '0.00', 'Cash', '', '', 1);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (22, 4, 'OPDN22', '2024-08-24 16:30:00', '', 'No', '', '', '', '', '', '', '', 3, '600.00', '0.00', 'Cash', '', '', 1);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (23, 49, 'OPDN23', '2024-08-19 15:06:00', '', 'No', '', '', '', '', '', '', '', 3, '600.00', '0.00', 'Cash', '', '', 3);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (24, 45, 'OPDN24', '2024-08-20 15:14:00', '', 'No', '', '', '', '', '', '', '', 3, '600.00', '0.00', 'Cash', '', '', 3);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (25, 49, 'OPDN25', '2024-08-20 15:15:00', '', 'No', '', '', '', '', '', '', '', 3, '600.00', '0.00', 'Cash', '', '', 3);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (26, 45, 'OPDN26', '2024-08-07 11:49:00', '', 'No', '', '', '', '', '', '', '', 3, '600.00', '0.00', 'Cash', '', '', 2);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (27, 45, 'OPDN27', '2024-08-07 11:51:00', '', 'No', '', '', '', '', '', '', '', 3, '600.00', '0.00', 'Cash', '', '', 2);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (28, 45, 'OPDN28', '2024-08-21 18:16:00', '', 'No', '', '', '', '', '', '', '', 3, '600.00', '0.00', 'Cash', '', '', 3);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (29, 45, 'OPDN29', '2024-08-21 18:17:00', '', 'No', '', '', '', '', '', '', '', 3, '600.00', '0.00', 'Cash', '', '', 3);
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`) VALUES (30, 45, 'OPDN30', '2024-08-06 09:58:00', '', 'No', '', '', '', '', '', '', '', 3, '60.00', '0.00', 'Cash', '', '', 1);


#
# TABLE STRUCTURE FOR: opd_patient_charges
#

DROP TABLE IF EXISTS `opd_patient_charges`;

CREATE TABLE `opd_patient_charges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `patient_id` int NOT NULL,
  `opd_id` int NOT NULL,
  `charge_id` int NOT NULL,
  `org_charge_id` int NOT NULL,
  `apply_charge` decimal(15,2) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: opd_payment
#

DROP TABLE IF EXISTS `opd_payment`;

CREATE TABLE `opd_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `opd_id` int NOT NULL,
  `paid_amount` decimal(15,2) NOT NULL,
  `balance_amount` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `note` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `document` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: operation_theatre
#

DROP TABLE IF EXISTS `operation_theatre`;

CREATE TABLE `operation_theatre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(200) NOT NULL,
  `patient_id` int NOT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `charge_id` varchar(11) DEFAULT NULL,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

INSERT INTO `operation_theatre` (`id`, `bill_no`, `patient_id`, `customer_type`, `charge_id`, `operation_name`, `date`, `operation_type`, `consultant_doctor`, `ass_consultant_1`, `ass_consultant_2`, `anesthetist`, `anaethesia_type`, `ot_technician`, `ot_assistant`, `result`, `remark`, `height`, `weight`, `bp`, `symptoms`, `apply_charge`, `created_at`, `generated_by`) VALUES (2, '1', 44, NULL, '4', 'Kidney', '2024-08-16', 'Surgery', '3', '', '', '', '', '', '', NULL, '', '', '', '', '', '100.00', '2024-08-16 05:42:33', 1);
INSERT INTO `operation_theatre` (`id`, `bill_no`, `patient_id`, `customer_type`, `charge_id`, `operation_name`, `date`, `operation_type`, `consultant_doctor`, `ass_consultant_1`, `ass_consultant_2`, `anesthetist`, `anaethesia_type`, `ot_technician`, `ot_assistant`, `result`, `remark`, `height`, `weight`, `bp`, `symptoms`, `apply_charge`, `created_at`, `generated_by`) VALUES (3, '3', 44, NULL, '4', 'Liver Transplant', '2024-08-11', 'Transplant Surgery', '3', '', '', '', '', '', '', NULL, '', '', '', '', '', '100.00', '2024-08-17 06:22:45', 1);


#
# TABLE STRUCTURE FOR: organisation
#

DROP TABLE IF EXISTS `organisation`;

CREATE TABLE `organisation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `organisation_name` varchar(200) NOT NULL,
  `code` varchar(50) NOT NULL,
  `contact_no` varchar(200) NOT NULL,
  `address` varchar(300) NOT NULL,
  `contact_person_name` varchar(200) NOT NULL,
  `contact_person_phone` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

INSERT INTO `organisation` (`id`, `organisation_name`, `code`, `contact_no`, `address`, `contact_person_name`, `contact_person_phone`) VALUES (1, 'UAP Old Mutual', 'UAP1', '+9623451478', 'Plot 10, Kampala Road, Kampala\r\nKampala Central Business District,\r\nKampala, Uganda', 'Kwame Ssempala', '+9657712345');
INSERT INTO `organisation` (`id`, `organisation_name`, `code`, `contact_no`, `address`, `contact_person_name`, `contact_person_phone`) VALUES (2, 'AAR Health Services', 'AAR1', '+9657123412', 'House No. 23, Entebbe Road, Kajjansi\r\nWakiso District,\r\nUganda', 'Nalumansi Nakato', '+9654127845');
INSERT INTO `organisation` (`id`, `organisation_name`, `code`, `contact_no`, `address`, `contact_person_name`, `contact_person_phone`) VALUES (3, 'Nat Health ', 'NAT1', '+9656578951', 'House no. 20, Schools street, Wihdat city, Amman district, Jordan', 'Amzad Subeih', '+9656578951');
INSERT INTO `organisation` (`id`, `organisation_name`, `code`, `contact_no`, `address`, `contact_person_name`, `contact_person_phone`) VALUES (5, 'Crawford & CO.', 'CRA1', '+9624641118', 'Plot no 45, Al-Khalidi Street, Jabal Amman city, Amman state', 'Munther AI Safeen', '+9651187895');
INSERT INTO `organisation` (`id`, `organisation_name`, `code`, `contact_no`, `address`, `contact_person_name`, `contact_person_phone`) VALUES (6, 'Corvel Corporation', 'COV1', '+9626998871', 'Plot no 27, Al-Hussein Camp Street, Jabal Al-hussein City, Amman State, Jordan', 'Imad Hadad', '+9656998871');


#
# TABLE STRUCTURE FOR: organisations_charges
#

DROP TABLE IF EXISTS `organisations_charges`;

CREATE TABLE `organisations_charges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `org_id` int NOT NULL,
  `charge_type` varchar(50) NOT NULL,
  `charge_id` int NOT NULL,
  `org_charge` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `org_id` (`org_id`) USING BTREE,
  KEY `charge_id` (`charge_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb3;

INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (1, 1, 'Operation Theatre', 4, '90');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (2, 2, 'Operation Theatre', 4, '80');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (3, 3, 'Operation Theatre', 4, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (4, 4, 'Operation Theatre', 4, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (5, 5, 'Operation Theatre', 4, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (6, 6, 'Operation Theatre', 4, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (7, 7, 'Operation Theatre', 4, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (8, 11, 'Operation Theatre', 4, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (9, 13, 'Operation Theatre', 4, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (10, 1, 'Pathology', 5, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (11, 2, 'Pathology', 5, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (12, 3, 'Pathology', 5, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (13, 4, 'Pathology', 5, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (14, 5, 'Pathology', 5, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (15, 6, 'Pathology', 5, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (16, 7, 'Pathology', 5, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (17, 11, 'Pathology', 5, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (18, 13, 'Pathology', 5, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (19, 1, 'Radiology', 6, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (20, 2, 'Radiology', 6, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (21, 3, 'Radiology', 6, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (22, 4, 'Radiology', 6, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (23, 5, 'Radiology', 6, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (24, 6, 'Radiology', 6, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (25, 7, 'Radiology', 6, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (26, 11, 'Radiology', 6, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (27, 13, 'Radiology', 6, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (28, 13, 'Radiology', 8, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (29, 11, 'Radiology', 8, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (30, 7, 'Radiology', 8, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (31, 6, 'Radiology', 8, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (32, 5, 'Radiology', 8, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (33, 4, 'Radiology', 8, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (34, 3, 'Radiology', 8, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (35, 2, 'Radiology', 8, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (36, 1, 'Radiology', 8, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (37, 13, 'Pathology', 9, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (38, 11, 'Pathology', 9, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (39, 7, 'Pathology', 9, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (40, 6, 'Pathology', 9, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (41, 5, 'Pathology', 9, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (42, 4, 'Pathology', 9, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (43, 3, 'Pathology', 9, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (44, 2, 'Pathology', 9, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (45, 1, 'Pathology', 9, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (46, 13, 'Pathology', 10, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (47, 11, 'Pathology', 10, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (48, 7, 'Pathology', 10, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (49, 6, 'Pathology', 10, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (50, 5, 'Pathology', 10, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (51, 4, 'Pathology', 10, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (52, 3, 'Pathology', 10, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (53, 2, 'Pathology', 10, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (54, 1, 'Pathology', 10, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (55, 13, 'Pathology', 11, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (56, 11, 'Pathology', 11, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (57, 7, 'Pathology', 11, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (58, 6, 'Pathology', 11, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (59, 5, 'Pathology', 11, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (60, 4, 'Pathology', 11, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (61, 3, 'Pathology', 11, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (62, 2, 'Pathology', 11, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (63, 1, 'Pathology', 11, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (64, 13, 'Pathology', 12, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (65, 11, 'Pathology', 12, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (66, 7, 'Pathology', 12, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (67, 6, 'Pathology', 12, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (68, 5, 'Pathology', 12, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (69, 4, 'Pathology', 12, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (70, 3, 'Pathology', 12, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (71, 2, 'Pathology', 12, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (72, 1, 'Pathology', 12, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (73, 13, 'Radiology', 13, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (74, 11, 'Radiology', 13, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (75, 7, 'Radiology', 13, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (76, 6, 'Radiology', 13, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (77, 5, 'Radiology', 13, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (78, 4, 'Radiology', 13, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (79, 3, 'Radiology', 13, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (80, 2, 'Radiology', 13, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (81, 1, 'Radiology', 13, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (82, 13, 'Ambulance', 14, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (83, 11, 'Ambulance', 14, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (84, 7, 'Ambulance', 14, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (85, 6, 'Ambulance', 14, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (86, 5, 'Ambulance', 14, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (87, 4, 'Ambulance', 14, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (88, 3, 'Ambulance', 14, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (89, 2, 'Ambulance', 14, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (90, 1, 'Ambulance', 14, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (91, 13, 'IPD', 15, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (92, 11, 'IPD', 15, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (93, 7, 'IPD', 15, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (94, 6, 'IPD', 15, '200');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (95, 5, 'IPD', 15, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (96, 4, 'IPD', 15, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (97, 3, 'IPD', 15, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (98, 2, 'IPD', 15, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (99, 1, 'IPD', 15, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (100, 13, 'IPD', 16, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (101, 11, 'IPD', 16, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (102, 7, 'IPD', 16, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (103, 6, 'IPD', 16, '100');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (104, 5, 'IPD', 16, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (105, 4, 'IPD', 16, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (106, 3, 'IPD', 16, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (107, 2, 'IPD', 16, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (108, 1, 'IPD', 16, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (109, 13, 'Ambulance', 17, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (110, 11, 'Ambulance', 17, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (111, 7, 'Ambulance', 17, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (112, 6, 'Ambulance', 17, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (113, 5, 'Ambulance', 17, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (114, 4, 'Ambulance', 17, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (115, 3, 'Ambulance', 17, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (116, 2, 'Ambulance', 17, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (117, 1, 'Ambulance', 17, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (118, 13, 'Others', 18, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (119, 11, 'Others', 18, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (120, 7, 'Others', 18, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (121, 6, 'Others', 18, '100');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (122, 5, 'Others', 18, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (123, 4, 'Others', 18, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (124, 3, 'Others', 18, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (125, 2, 'Others', 18, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (126, 1, 'Others', 18, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (127, 13, 'IPD', 19, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (128, 11, 'IPD', 19, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (129, 7, 'IPD', 19, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (130, 6, 'IPD', 19, '100');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (131, 5, 'IPD', 19, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (132, 4, 'IPD', 19, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (133, 3, 'IPD', 19, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (134, 2, 'IPD', 19, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (135, 1, 'IPD', 19, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (136, 1, 'Supplier', 3, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (137, 2, 'Supplier', 3, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (138, 3, 'Supplier', 3, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (139, 4, 'Supplier', 3, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (140, 5, 'Supplier', 3, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (141, 6, 'Supplier', 3, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (142, 7, 'Supplier', 3, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (143, 11, 'Supplier', 3, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (144, 13, 'Supplier', 3, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (145, 13, 'Appointment', 20, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (146, 11, 'Appointment', 20, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (147, 7, 'Appointment', 20, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (148, 6, 'Appointment', 20, '50');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (149, 5, 'Appointment', 20, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (150, 4, 'Appointment', 20, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (151, 3, 'Appointment', 20, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (152, 2, 'Appointment', 20, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (153, 1, 'Appointment', 20, ' xhm');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (154, 13, 'OPD', 21, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (155, 11, 'OPD', 21, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (156, 7, 'OPD', 21, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (157, 6, 'OPD', 21, '100');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (158, 5, 'OPD', 21, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (159, 4, 'OPD', 21, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (160, 3, 'OPD', 21, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (161, 2, 'OPD', 21, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (162, 1, 'OPD', 21, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (163, 13, 'IPD', 22, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (164, 11, 'IPD', 22, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (165, 7, 'IPD', 22, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (166, 6, 'IPD', 22, '100');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (167, 5, 'IPD', 22, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (168, 4, 'IPD', 22, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (169, 3, 'IPD', 22, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (170, 2, 'IPD', 22, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (171, 1, 'IPD', 22, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (172, 13, 'OPD', 23, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (173, 11, 'OPD', 23, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (174, 7, 'OPD', 23, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (175, 6, 'OPD', 23, '100');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (176, 5, 'OPD', 23, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (177, 4, 'OPD', 23, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (178, 3, 'OPD', 23, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (179, 2, 'OPD', 23, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (180, 1, 'OPD', 23, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (181, 13, 'OPD', 24, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (182, 11, 'OPD', 24, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (183, 7, 'OPD', 24, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (184, 6, 'OPD', 24, '200');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (185, 5, 'OPD', 24, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (186, 4, 'OPD', 24, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (187, 3, 'OPD', 24, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (188, 2, 'OPD', 24, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (189, 1, 'OPD', 24, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (190, 13, 'Bloodbank', 25, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (191, 11, 'Bloodbank', 25, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (192, 7, 'Bloodbank', 25, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (193, 6, 'Bloodbank', 25, '100.00');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (194, 5, 'Bloodbank', 25, '100.00');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (195, 4, 'Bloodbank', 25, '');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (196, 3, 'Bloodbank', 25, '100.00');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (197, 2, 'Bloodbank', 25, '100.00');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (198, 1, 'Bloodbank', 25, '100.00');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (199, 1, 'Others', 7, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (200, 2, 'Others', 7, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (201, 3, 'Others', 7, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (202, 4, 'Others', 7, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (203, 5, 'Others', 7, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (204, 6, 'Others', 7, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (205, 7, 'Others', 7, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (206, 11, 'Others', 7, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (207, 13, 'Others', 7, '0');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (208, 13, 'Pathology', 26, 'tg');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (209, 11, 'Pathology', 26, 'cvf');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (210, 7, 'Pathology', 26, 'ytr');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (211, 6, 'Pathology', 26, 'df');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (212, 5, 'Pathology', 26, 'rttr');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (213, 4, 'Pathology', 26, 'tt');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (214, 3, 'Pathology', 26, 'tt');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (215, 2, 'Pathology', 26, 'ttb');
INSERT INTO `organisations_charges` (`id`, `org_id`, `charge_type`, `charge_id`, `org_charge`) VALUES (216, 1, 'Pathology', 26, '12');


#
# TABLE STRUCTURE FOR: ot_consultant_register
#

DROP TABLE IF EXISTS `ot_consultant_register`;

CREATE TABLE `ot_consultant_register` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `date` varchar(50) NOT NULL,
  `ins_date` date NOT NULL,
  `ins_time` time NOT NULL,
  `instruction` varchar(200) NOT NULL,
  `cons_doctor` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

INSERT INTO `ot_consultant_register` (`id`, `patient_id`, `date`, `ins_date`, `ins_time`, `instruction`, `cons_doctor`) VALUES (2, 44, '2024-08-17 11:49:00', '2024-08-17', '00:00:00', 'take rest', 3);
INSERT INTO `ot_consultant_register` (`id`, `patient_id`, `date`, `ins_date`, `ins_time`, `instruction`, `cons_doctor`) VALUES (3, 44, '2024-08-17 11:52:00', '2024-08-17', '00:00:00', 'don\'t take cold water', 3);


#
# TABLE STRUCTURE FOR: pathology
#

DROP TABLE IF EXISTS `pathology`;

CREATE TABLE `pathology` (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_name` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `test_type` varchar(100) DEFAULT NULL,
  `pathology_category_id` varchar(11) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `sub_category` varchar(50) NOT NULL,
  `report_days` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `charge_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

INSERT INTO `pathology` (`id`, `test_name`, `short_name`, `test_type`, `pathology_category_id`, `unit`, `sub_category`, `report_days`, `method`, `charge_id`, `created_at`) VALUES (1, 'Complete Blood Count', 'CBC', 'Blood Test', '3', '', 'Routine Hematology', '4', '', 12, '2024-08-08 05:36:43');
INSERT INTO `pathology` (`id`, `test_name`, `short_name`, `test_type`, `pathology_category_id`, `unit`, `sub_category`, `report_days`, `method`, `charge_id`, `created_at`) VALUES (3, 'Kidney Function Test', 'KFT', 'kidney Test', '1', '', 'Bacterial Makers', '2', '', 12, '2024-08-08 05:59:07');
INSERT INTO `pathology` (`id`, `test_name`, `short_name`, `test_type`, `pathology_category_id`, `unit`, `sub_category`, `report_days`, `method`, `charge_id`, `created_at`) VALUES (4, 'HIV Antibody Test', 'HIV', 'Blood Test', '3', '', 'Infection Test', '5', '', 12, '2024-08-17 05:41:58');


#
# TABLE STRUCTURE FOR: pathology_category
#

DROP TABLE IF EXISTS `pathology_category`;

CREATE TABLE `pathology_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

INSERT INTO `pathology_category` (`id`, `category_name`) VALUES (1, 'Clinical Microbiology	');
INSERT INTO `pathology_category` (`id`, `category_name`) VALUES (2, 'Clinical Chemistry	');
INSERT INTO `pathology_category` (`id`, `category_name`) VALUES (3, 'Hematology');
INSERT INTO `pathology_category` (`id`, `category_name`) VALUES (4, 'Molecular Diagnostics	');
INSERT INTO `pathology_category` (`id`, `category_name`) VALUES (5, 'Reproductive Biology	');
INSERT INTO `pathology_category` (`id`, `category_name`) VALUES (6, 'Electromagnetic Waves	');


#
# TABLE STRUCTURE FOR: pathology_report
#

DROP TABLE IF EXISTS `pathology_report`;

CREATE TABLE `pathology_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(200) NOT NULL,
  `pathology_id` int NOT NULL,
  `patient_id` varchar(30) DEFAULT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `patient_name` varchar(100) DEFAULT NULL,
  `consultant_doctor` varchar(10) NOT NULL,
  `reporting_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pathology_report` varchar(255) DEFAULT NULL,
  `apply_charge` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

INSERT INTO `pathology_report` (`id`, `bill_no`, `pathology_id`, `patient_id`, `customer_type`, `patient_name`, `consultant_doctor`, `reporting_date`, `description`, `pathology_report`, `apply_charge`, `created_at`, `generated_by`) VALUES (6, '6', 1, '44', NULL, NULL, '', '2024-08-19', '', '6.png', '290.00', '2024-08-16 10:30:39', 11);
INSERT INTO `pathology_report` (`id`, `bill_no`, `pathology_id`, `patient_id`, `customer_type`, `patient_name`, `consultant_doctor`, `reporting_date`, `description`, `pathology_report`, `apply_charge`, `created_at`, `generated_by`) VALUES (8, '8', 4, '46', NULL, NULL, '3', '2024-08-05', '', '8.jpg', '290.00', '2024-08-17 05:47:21', 1);


#
# TABLE STRUCTURE FOR: patient_charges
#

DROP TABLE IF EXISTS `patient_charges`;

CREATE TABLE `patient_charges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` varchar(50) DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  `ipd_id` int NOT NULL,
  `charge_id` int DEFAULT NULL,
  `org_charge_id` int DEFAULT NULL,
  `apply_charge` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

INSERT INTO `patient_charges` (`id`, `date`, `patient_id`, `ipd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (1, '2024-08-16', 44, 1, 15, 95, '1000.00', '2024-08-16 00:00:00');
INSERT INTO `patient_charges` (`id`, `date`, `patient_id`, `ipd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (2, '2024-08-16', 43, 2, 22, 167, '150.00', '2024-08-16 00:00:00');
INSERT INTO `patient_charges` (`id`, `date`, `patient_id`, `ipd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (3, '2024-08-16', 43, 3, 15, 95, '1000.00', '2024-08-16 00:00:00');
INSERT INTO `patient_charges` (`id`, `date`, `patient_id`, `ipd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (4, '2024-08-16', 43, 3, 15, 95, '1000.00', '2024-08-16 00:00:00');
INSERT INTO `patient_charges` (`id`, `date`, `patient_id`, `ipd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (5, '2024-08-31', 45, 4, 15, 0, '1000', '2024-08-17 00:00:00');
INSERT INTO `patient_charges` (`id`, `date`, `patient_id`, `ipd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (6, '2024-08-17', 43, 3, 5, 14, '160.00', '2024-08-17 00:00:00');
INSERT INTO `patient_charges` (`id`, `date`, `patient_id`, `ipd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (7, '2024-08-20', 35, 9, 22, 0, '150.00', '2024-08-20 00:00:00');
INSERT INTO `patient_charges` (`id`, `date`, `patient_id`, `ipd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (8, '2024-08-20', 49, 10, 15, 0, '1000.00', '2024-08-20 00:00:00');


#
# TABLE STRUCTURE FOR: patient_timeline
#

DROP TABLE IF EXISTS `patient_timeline`;

CREATE TABLE `patient_timeline` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` varchar(200) NOT NULL,
  `document` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: patients
#

DROP TABLE IF EXISTS `patients`;

CREATE TABLE `patients` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3;

INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (1, 1001, NULL, 'Alice Nakato', '31', '2', 'uploads/patient_images/no_image.png', '+9621232654', 'alice.nakato@example.com', '2024-05-15', 'Female', 'Single', 'A+', 'Plot 123, Kampala Road, Kampala, Uganda', 'John Nakato', NULL, NULL, '', 'yes', 'no', '', NULL, '13', 'Peanuts', '', '2024-08-13 11:08:04', '0000-00-00', 'ok', 'yes', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (2, 1002, NULL, 'Daniel Okech', '36', '7', 'uploads/patient_images/no_image.png', '+9623251452', 'daniel.okech@example.com', '1985-11-20', 'Male', 'Married', 'B-', 'Plot 456, Jinja Road, Jinja, Uganda', 'Mary Okech', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'Penicillin', '', '2024-08-03 10:03:33', '0000-00-00', 'None', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (3, 1003, NULL, 'Sarah Namutebi', '26', '2', 'uploads/patient_images/no_image.png', '+9651425369', 'sarah.namutebi@example.com', '1998-03-10', 'Male', 'Single', 'AB+', 'Plot 789, Entebbe Road, Entebbe, Uganda', 'Joseph Namutebi', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'Dairy', '', '2024-08-03 10:03:20', '0000-00-00', 'None', 'yes', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (4, 1004, NULL, 'Peter Ssebunya', '43', '3', 'uploads/patient_images/no_image.png', '+9627845659', 'peter.ssebunya@example.com', '1980-08-25', 'Male', 'Separated', 'O-', 'Plot 101, Gulu Road, Gulu, Uganda', 'Grace Ssebunya', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'Shellfish', '', '2024-08-19 09:24:24', '0000-00-00', 'ok', 'yes', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (5, 1005, NULL, 'Grace Nakazibwe', '48', '7', 'uploads/patient_images/no_image.png', '+9627984562', 'grace.nakazibwe@example.com', '1975-12-05', 'Female', 'Married', 'A-', 'Plot 202, Mbarara Road, Mbarara, Uganda', 'Robert Nakazibwe', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'Gluten', '', '2024-08-03 10:02:56', '0000-00-00', 'ok', 'yes', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (6, 1006, NULL, 'Samuel Kato', '28', '4', 'uploads/patient_images/no_image.png', '+9621234652', 'samuel.kato@example.com', '1995-09-18', 'Male', 'Single', 'B+', 'Plot 303, Mbale Road, Mbale, Uganda', 'Ruth Kato', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'Pollen', '', '2024-08-03 10:02:41', '0000-00-00', 'None', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (7, 1007, NULL, 'Esther Nalubega', '37', '1', 'uploads/patient_images/no_image.png', '+9656655445', 'esther.nalubega@example.com', '1987-04-30', 'Female', 'Married', 'O+', 'Plot 505, Masaka Road, Masaka, Uganda', 'David Nalubega', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'Pollen', '', '2024-08-03 10:02:27', '0000-00-00', 'None', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (8, 1008, NULL, 'Moses Wasswa', '24', '4', 'uploads/patient_images/no_image.png', '+9657417417', 'moses.wasswa@example.com', '2000-01-12', 'Male', 'Single', 'AB-', 'Plot 404, Soroti Road, Soroti, Uganda', 'Sarah Wasswa', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'Latex', '', '2024-08-03 10:02:12', '0000-00-00', 'ok', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (9, 1009, NULL, 'Joyce Nakato', '31', '1', 'uploads/patient_images/no_image.png', '+9651245796', 'joyce.nakato@example.com', '1992-06-28', 'Female', 'Separated', 'B-', 'Plot 606, Jinja Road, Jinja, Uganda', 'Charles Nakato', NULL, NULL, '', 'yes', 'yes', '', NULL, '', 'Seafood', '', '2024-08-03 10:01:53', '0000-00-00', 'ok', 'yes', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (10, 1010, NULL, 'Andrew Ssempa', '40', '6', 'uploads/patient_images/no_image.png', '+9624455661', 'andrew.ssempa@example.com', '1983-11-08', 'Male', 'Married', 'A+', 'Plot 707, Entebbe Road, Entebbe, Uganda', 'Rose Ssempa', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'Dust Mites', 'No', '2024-08-03 10:01:41', '0000-00-00', 'None', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (11, 1011, NULL, 'John Kintu', '18', '3', 'uploads/patient_images/no_image.png', '+9657836985', 'john.kintu@example.com', '2024-05-16', 'Male', 'Single', 'AB+', 'Plot 12, Nakasero Road, Kampala, Uganda', 'Yoweri Museveni', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-03 10:01:28', '0000-00-00', '', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (12, 1012, NULL, 'Mary Namutebi', '18', '4', 'uploads/patient_images/no_image.png', '+9658585857', 'mary.namutebi@example.com', '2024-05-08', 'Male', 'Single', 'O-', 'House 7, Bugolobi Flats, Bugolobi, Kampala, Uganda', 'Visuni', NULL, NULL, '', 'yes', 'yes', '', NULL, '', '', '', '2024-08-13 12:48:11', '0000-00-00', '', 'yes', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (13, 1013, NULL, 'Samuel Lwanga', '8', '5', 'uploads/patient_images/no_image.png', '+9651365987', 'samuel.lwanga@example.com', '2024-05-07', 'Male', 'Single', 'A+', '23 Entebbe Road, Kibuye, Kampala, Uganda', 'Jimmy Lwanga', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-03 10:01:04', '0000-00-00', '', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (14, 1014, NULL, 'Sarah Nakato', '38', '3', 'uploads/patient_images/no_image.png', '+9624781245', 'sarah.nakato@example.com', '2024-05-07', 'Male', 'Married', 'B+', '45 Gaba Road, Kabalagala, Kampala, Uga', 'Rosemary  Nakato', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-03 10:00:46', '0000-00-00', '', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (15, 1015, NULL, 'Peter Okello', '38', '3', 'uploads/patient_images/no_image.png', '+9624587965', 'peter.okello@example.com', '2024-05-15', 'Male', 'Married', 'AB+', '10 Jinja Road, Nakawa, Kampala, Uganda', 'Allen Okello', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-03 10:00:34', '0000-00-00', '', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (16, 1016, NULL, 'Alice Nambooze', '23', '1', 'uploads/patient_images/no_image.png', '+9656589741', 'alice.nambooze@example.com', '2024-05-14', 'Female', 'Married', 'B+', '34 Bombo Road, Wandegeya, Kampala, Uganda', 'Eunice  Nambooze', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-03 10:00:21', '0000-00-00', '', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (17, 1017, NULL, 'Michael Ssebagala', '32', '3', 'uploads/patient_images/no_image.png', '+9621452147', 'michael.ssebagala@example.com', '2024-05-15', 'Male', 'Married', 'AB-', '18 Kira Road, Ntinda, Kampala, Uganda', 'Doreen Ssebagala', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-03 10:00:08', '0000-00-00', '', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (18, 1018, NULL, 'Grace Nakawunde', '55', '4', 'uploads/patient_images/no_image.png', '+9659854784', 'grace.nakawunde@example.com', '2024-05-14', 'Male', 'Married', 'O+', 'Plot 56, Lubowa Estate, Lubowa, Kampala, Uganda', 'Brenda Nakawunde', NULL, NULL, '', 'yes', 'yes', '', NULL, '', '', '', '2024-08-03 09:59:50', '0000-00-00', '', 'yes', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (19, 1019, NULL, 'Daniel Mukasa', '35', '5', 'uploads/patient_images/no_image.png', '+9657965412', 'daniel.mukasa@example.com', '2024-05-07', 'Male', 'Married', 'AB+', '21 Makerere Hill Road, Makerere, Kampala, Uganda', 'Oliv Mukasa', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-03 09:59:35', '0000-00-00', '', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (20, 1020, NULL, 'Esther Nanyonga', '25', '6', 'uploads/patient_images/no_image.png', '+9656765456', 'esther.nanyonga@example.com', '2024-05-06', 'Female', 'Married', 'B-', '21 Makerere Hill Road, Makerere, Kampala, Uganda', ' luve Nanyonga', NULL, NULL, '', 'yes', 'no', '', NULL, '2', '', '', '2024-08-05 06:20:19', '0000-00-00', '', 'yes', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (24, 1021, NULL, 'Madhusudan Jena', '', '', 'uploads/patient_images/no_image.png', '+965+9656370', 'madhusudan.jena@3sdsolutions.com', '2024-08-16', 'Male', '', '', '', 'saumyajit Jena', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-05 06:21:07', '0000-00-00', '', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (25, 1022, NULL, 'Ramesh Sippy', '24', '0', 'uploads/patient_images/no_image.png', '+9651144778', 'ramesh@gmail.com', '2000-08-02', 'Male', 'Single', 'O+', '', 'Dinesh Sippy', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-05 06:32:50', '0000-00-00', '', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (28, 1025, NULL, 'Amjad Subeih', '40', '6', 'uploads/patient_images/no_image.png', '+9655678912', 'amjad@gmail.com', '1984-02-03', 'Male', 'Married', 'AB+', 'Irbid', 'Zaher Subeih', NULL, NULL, '', 'yes', 'yes', '', NULL, '', '', '', '2024-08-06 12:22:38', '0000-00-00', '', 'yes', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (29, 1026, NULL, 'Fatima', '24', '1', 'uploads/patient_images/no_image.png', '+9654662256', 'fatima@gmail.com', '2000-07-13', 'Female', 'Single', 'A+', '', 'Ahmad Khan', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-05 09:13:08', '0000-00-00', '', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (30, 1027, NULL, 'Noor', '34', '4', 'uploads/patient_images/no_image.png', '+9655678223', 'noor@gmail.com', '1990-04-05', 'Female', 'Married', 'A+', '', 'Ali', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-05 09:18:51', '0000-00-00', '', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (31, 1028, NULL, 'Ashid Sayed', '34', '1', 'uploads/patient_images/no_image.png', '+9651234567', 'ashid@gmail.com', '1990-07-29', 'Male', 'Single', 'O+', '', 'nalini sayed', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-05 09:29:39', '0000-00-00', '', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (32, 1029, NULL, 'Raman Ali', '34', '0', 'uploads/patient_images/no_image.png', '+9651478965', 'raman@gmail.com', '1990-08-05', 'Male', 'Single', 'O+', '', 'Rashid Ali', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', 'Yes', '2024-08-05 12:47:35', '0000-00-00', '', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (33, 1030, NULL, 'Noor Ali', '23', '3', 'uploads/patient_images/no_image.png', '+9654226784', 'noor@gmail.com', '2000-11-09', 'Female', 'Married', 'B+', '', 'Ali Zafar', NULL, NULL, '', 'yes', 'yes', '', NULL, '3', '', '', '2024-08-06 09:17:15', '0000-00-00', '', 'yes', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (34, 1031, NULL, 'Zaher Alkaseech', '44', '5', 'uploads/patient_images/no_image.png', '+9656234567', 'zaher@gmail.com', '1980-03-05', 'Male', 'Married', 'A+', 'Irbid', 'Muneer Alkaseech', NULL, NULL, '', 'yes', 'no', '', NULL, '13', '', 'Yes', '2024-08-06 10:31:10', '0000-00-00', '', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (35, 1032, NULL, 'Yagyaseni', '23', '4', 'uploads/patient_images/no_image.png', '+9658796765', 'yagyaseni@gmail.com', '2001-04-11', 'Female', 'Single', 'B+', 'Bbsr', 'Prafulla', NULL, NULL, '', 'yes', 'yes', '', NULL, '', '', '', '2024-08-20 08:54:48', '0000-00-00', '', 'yes', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (36, 1033, NULL, 'Sonal', '24', '4', 'uploads/patient_images/no_image.png', '+9657898675', 'sonal@gmail.com', '2000-04-11', 'Female', 'Single', 'B+', 'Bhubaneswar', 'subhdeep', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-07 08:50:40', '0000-00-00', '', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (38, 1035, NULL, 'Sakshi', '25', '5', 'uploads/patient_images/no_image.png', '+9659876879', 'sakshi@gmail.com', '1999-03-17', 'Female', 'Single', 'O+', 'Cuttack', 'Jayanta', NULL, NULL, '', 'yes', 'no', '', NULL, '13', '', '', '2024-08-13 11:07:24', '0000-00-00', '', 'yes', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (41, 1038, NULL, 'Babar Saheb', '64', '6', 'uploads/patient_images/no_image.png', '+9656768668', '', '1960-02-02', '', 'Married', 'A+', '', 'Monural Saheb', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-13 11:43:22', '0000-00-00', '', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (42, 1039, NULL, 'Abdullah Al-Sabah', '8u', 'jk', 'uploads/patient_images/no_image.png', '+9656096844', 'abdullah.sabah@gmail.com', '2024-08-24', 'Male', '', '', '', 'Sabab Al-Hajeri', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-14 05:25:27', '0000-00-00', 'ok', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (43, 1040, NULL, 'Yousef Al-Shamari', '12', '45', 'uploads/patient_images/no_image.png', '+9656334224', 'yousef.shamari@gmail.com', '2024-08-08', 'Male', 'Married', '', '', 'Mussef Al-Shamari', NULL, NULL, '', 'yes', 'yes', '', NULL, '5', '', '', '2024-08-16 11:35:42', '0000-00-00', '', 'yes', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (44, 1041, NULL, 'Amir Al-Husseini', '44', '7', 'uploads/patient_images/44.png', '+9656873566', 'amir.husseini@gmail.com', '1980-01-29', 'Male', 'Married', 'B+', '', 'Fakir Al-Husseini', NULL, NULL, '', 'yes', 'yes', '', NULL, '5', '', '', '2024-08-16 05:28:42', '0000-00-00', 'ok', 'yes', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (45, 1042, NULL, 'Abdullah Al-Sarhan', '64', '6', 'uploads/patient_images/45.png', '+9626565444', 'Abdullah.arhan@gmail.com', '1960-02-10', 'Male', 'Married', 'A+', 'Jordan', 'Ballar Al-Sarhan', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', 'Yes', '2024-08-17 04:56:18', '0000-00-00', '', 'yes', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (46, 1043, NULL, 'Rami Al-Ahmad', '44', '5', 'uploads/patient_images/no_image.png', '+9658678655', 'rami.ahmad@gmail.com', '1980-03-06', 'Male', '', '', '', 'kudiya AI-Ahmad', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2024-08-17 07:12:40', '0000-00-00', '', 'yes', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (47, 1044, NULL, 'Omar Al-Najjar', '29', '7', 'uploads/patient_images/47.png', '+9655867677', 'Omar.najjar@gmail.com', '1995-01-02', 'Male', 'Married', 'B+', 'Building 45 Amman, Jordan, 11181 ', 'Samirin  Al-Najjar', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', 'No', '2024-08-17 07:28:50', '0000-00-00', 'ok', 'yes', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (48, 1045, NULL, 'Isha', '23', '4', 'uploads/patient_images/no_image.png', '+9659087654', '', '2001-04-11', 'Female', 'Single', 'B+', 'Bhubaneswar', 'Shankar', NULL, NULL, '', 'yes', 'yes', '', NULL, '', '', 'No', '2024-08-20 09:14:04', '0000-00-00', '', 'yes', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (49, 1046, NULL, 'Sheikh Asif Noor', '', '', 'uploads/patient_images/no_image.png', '+9657896541', 'sheikh@gmail.com', '0000-00-00', 'Male', '', '', '', 'Sheikh Hamid Noor', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', 'Yes', '2024-08-20 09:14:51', '0000-00-00', '', 'yes', '');


#
# TABLE STRUCTURE FOR: payment
#

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `ipd_id` int NOT NULL,
  `paid_amount` decimal(15,2) NOT NULL,
  `balance_amount` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `note` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

INSERT INTO `payment` (`id`, `patient_id`, `ipd_id`, `paid_amount`, `balance_amount`, `total_amount`, `payment_mode`, `note`, `date`, `document`) VALUES (2, 44, 1, '1000.00', '0.00', '1000.00', 'Cash', '', '2024-08-16', '');
INSERT INTO `payment` (`id`, `patient_id`, `ipd_id`, `paid_amount`, `balance_amount`, `total_amount`, `payment_mode`, `note`, `date`, `document`) VALUES (3, 43, 3, '1500.00', '-500.00', '1000.00', 'Cash', '', '2024-08-16', '');
INSERT INTO `payment` (`id`, `patient_id`, `ipd_id`, `paid_amount`, `balance_amount`, `total_amount`, `payment_mode`, `note`, `date`, `document`) VALUES (6, 43, 2, '150.00', '0.00', '150.00', 'Cash', '', '2024-08-16', '');
INSERT INTO `payment` (`id`, `patient_id`, `ipd_id`, `paid_amount`, `balance_amount`, `total_amount`, `payment_mode`, `note`, `date`, `document`) VALUES (7, 45, 4, '1000.00', '0.00', '1000.00', 'Cash', '', '2024-08-23', '');
INSERT INTO `payment` (`id`, `patient_id`, `ipd_id`, `paid_amount`, `balance_amount`, `total_amount`, `payment_mode`, `note`, `date`, `document`) VALUES (10, 4, 7, '2000.00', '-2000.00', '0.00', 'Cash', '', '2024-08-19', '');
INSERT INTO `payment` (`id`, `patient_id`, `ipd_id`, `paid_amount`, `balance_amount`, `total_amount`, `payment_mode`, `note`, `date`, `document`) VALUES (11, 35, 9, '150.00', '0.00', '150.00', 'Cash', '', '2024-08-20', '');


#
# TABLE STRUCTURE FOR: payment_settings
#

DROP TABLE IF EXISTS `payment_settings`;

CREATE TABLE `payment_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: payslip_allowance
#

DROP TABLE IF EXISTS `payslip_allowance`;

CREATE TABLE `payslip_allowance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payslip_id` int NOT NULL,
  `allowance_type` varchar(200) NOT NULL,
  `amount` int NOT NULL,
  `staff_id` int NOT NULL,
  `cal_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

INSERT INTO `payslip_allowance` (`id`, `payslip_id`, `allowance_type`, `amount`, `staff_id`, `cal_type`) VALUES (7, 4, '', 0, 4, 'positive');
INSERT INTO `payslip_allowance` (`id`, `payslip_id`, `allowance_type`, `amount`, `staff_id`, `cal_type`) VALUES (8, 4, '', 0, 4, 'negative');
INSERT INTO `payslip_allowance` (`id`, `payslip_id`, `allowance_type`, `amount`, `staff_id`, `cal_type`) VALUES (9, 5, '', 0, 5, 'positive');
INSERT INTO `payslip_allowance` (`id`, `payslip_id`, `allowance_type`, `amount`, `staff_id`, `cal_type`) VALUES (10, 5, '', 0, 5, 'negative');
INSERT INTO `payslip_allowance` (`id`, `payslip_id`, `allowance_type`, `amount`, `staff_id`, `cal_type`) VALUES (11, 6, '', 0, 11, 'positive');
INSERT INTO `payslip_allowance` (`id`, `payslip_id`, `allowance_type`, `amount`, `staff_id`, `cal_type`) VALUES (12, 6, '', 0, 11, 'negative');
INSERT INTO `payslip_allowance` (`id`, `payslip_id`, `allowance_type`, `amount`, `staff_id`, `cal_type`) VALUES (13, 7, '', 0, 6, 'positive');
INSERT INTO `payslip_allowance` (`id`, `payslip_id`, `allowance_type`, `amount`, `staff_id`, `cal_type`) VALUES (14, 7, '', 0, 6, 'negative');
INSERT INTO `payslip_allowance` (`id`, `payslip_id`, `allowance_type`, `amount`, `staff_id`, `cal_type`) VALUES (20, 10, 'extra', 100, 2, 'positive');
INSERT INTO `payslip_allowance` (`id`, `payslip_id`, `allowance_type`, `amount`, `staff_id`, `cal_type`) VALUES (21, 10, ' canteen charges', 220, 2, 'negative');


#
# TABLE STRUCTURE FOR: permission_category
#

DROP TABLE IF EXISTS `permission_category`;

CREATE TABLE `permission_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `perm_group_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) DEFAULT NULL,
  `enable_view` int DEFAULT '0',
  `enable_add` int DEFAULT '0',
  `enable_edit` int DEFAULT '0',
  `enable_delete` int DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8mb3;

INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (9, 3, 'Income', 'income', 1, 1, 1, 1, '2018-06-22 15:53:21');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (10, 3, 'Income Head', 'income_head', 1, 1, 1, 1, '2018-06-22 15:52:44');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (12, 4, 'Expense', 'expense', 1, 1, 1, 1, '2018-06-22 15:54:06');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (13, 4, 'Expense Head', 'expense_head', 1, 1, 1, 1, '2018-06-22 15:53:47');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (14, 4, 'Search Expense', 'search_expense', 1, 0, 0, 0, '2018-06-22 15:54:13');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (27, 8, 'Upload Content', 'upload_content', 1, 1, 0, 1, '2018-06-22 16:03:19');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (31, 10, 'Issue Item', 'issue_item', 1, 1, 0, 1, '2018-12-17 15:25:14');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (32, 10, 'Item Stock', 'item_stock', 1, 1, 1, 1, '2018-06-22 16:05:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (33, 10, 'Item', 'item', 1, 1, 1, 1, '2018-06-22 16:05:40');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (34, 10, 'Store', 'store', 1, 1, 1, 1, '2018-06-22 16:06:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (35, 10, 'Supplier', 'supplier', 1, 1, 1, 1, '2018-06-22 16:06:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (43, 13, 'Notice Board', 'notice_board', 1, 1, 1, 1, '2018-06-22 16:11:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (44, 13, 'Email / SMS', 'email_sms', 1, 0, 0, 0, '2018-06-22 16:10:54');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (46, 13, 'Email / SMS Log', 'email_sms_log', 1, 0, 0, 0, '2018-06-22 16:11:23');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (48, 14, 'OPD Report', 'opd_report', 1, 0, 0, 0, '2018-12-18 14:29:18');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (53, 15, 'Languages', 'languages', 0, 1, 0, 0, '2018-06-22 16:13:18');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (54, 15, 'General Setting', 'general_setting', 1, 0, 1, 0, '2018-07-05 14:38:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (56, 15, 'Notification Setting', 'notification_setting', 1, 0, 1, 0, '2018-07-05 14:38:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (57, 15, 'SMS Setting', 'sms_setting', 1, 0, 1, 0, '2018-07-05 14:38:47');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (58, 15, 'Email Setting', 'email_setting', 1, 0, 1, 0, '2018-07-05 14:38:51');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (59, 15, 'Front CMS Setting', 'front_cms_setting', 1, 0, 1, 0, '2018-07-05 14:38:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (60, 15, 'Payment Methods', 'payment_methods', 1, 0, 1, 0, '2018-07-05 14:38:59');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (61, 16, 'Menus', 'menus', 1, 1, 0, 1, '2018-07-09 09:20:06');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (62, 16, 'Media Manager', 'media_manager', 1, 1, 0, 1, '2018-07-09 09:20:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (63, 16, 'Banner Images', 'banner_images', 1, 1, 0, 1, '2018-06-22 16:16:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (64, 16, 'Pages', 'pages', 1, 1, 1, 1, '2018-06-22 16:16:21');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (65, 16, 'Gallery', 'gallery', 1, 1, 1, 1, '2018-06-22 16:17:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (66, 16, 'Event', 'event', 1, 1, 1, 1, '2018-06-22 16:17:20');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (67, 16, 'News', 'notice', 1, 1, 1, 1, '2018-07-03 14:09:34');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (80, 17, 'Visitor Book', 'visitor_book', 1, 1, 1, 1, '2018-06-22 16:18:58');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (81, 17, 'Phone Call Log', 'phone_call_log', 1, 1, 1, 1, '2018-06-22 16:20:57');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (82, 17, 'Postal Dispatch', 'postal_dispatch', 1, 1, 1, 1, '2018-06-22 16:20:21');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (83, 17, 'Postal Receive', 'postal_receive', 1, 1, 1, 1, '2018-06-22 16:20:04');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (84, 17, 'Complain', 'complain', 1, 1, 1, 1, '2018-12-19 14:41:37');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (85, 17, 'Setup Front Office', 'setup_front_office', 1, 1, 1, 1, '2018-11-15 06:19:58');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (86, 18, 'Staff', 'staff', 1, 1, 1, 1, '2018-06-22 16:23:31');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (87, 18, 'Disable Staff', 'disable_staff', 1, 0, 0, 0, '2018-06-22 16:23:12');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (88, 18, 'Staff Attendance', 'staff_attendance', 1, 1, 1, 0, '2018-06-22 16:23:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (89, 18, 'Staff Attendance Report', 'staff_attendance_report', 1, 0, 0, 0, '2018-06-22 16:22:54');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (90, 18, 'Staff Payroll', 'staff_payroll', 1, 1, 0, 1, '2018-06-22 16:22:51');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (91, 18, 'Payroll Report', 'payroll_report', 1, 0, 0, 0, '2018-06-22 16:22:34');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (102, 21, 'Calendar To Do List', 'calendar_to_do_list', 1, 1, 1, 1, '2018-06-22 16:24:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (104, 10, 'Item Category', 'item_category', 1, 1, 1, 1, '2018-06-22 16:04:33');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (108, 18, ' Approve Leave Request', 'approve_leave_request', 1, 1, 1, 1, '2018-07-02 15:47:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (109, 18, 'Apply Leave', 'apply_leave', 1, 1, 1, 1, '2018-06-26 09:23:32');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (110, 18, 'Leave Types ', 'leave_types', 1, 1, 1, 1, '2018-07-02 15:47:56');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (111, 18, 'Department', 'department', 1, 1, 1, 1, '2018-06-26 09:27:07');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (112, 18, 'Designation', 'designation', 1, 1, 1, 1, '2018-06-26 09:27:07');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (118, 22, 'Staff Role Count Widget', 'staff_role_count_widget', 1, 0, 0, 0, '2018-07-03 12:43:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (126, 15, 'User Status', 'user_status', 1, 0, 0, 0, '2018-07-03 14:12:29');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (127, 18, 'Can See Other Users Profile', 'can_see_other_users_profile', 1, 0, 0, 0, '2018-07-03 14:12:29');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (129, 18, 'Staff Timeline', 'staff_timeline', 0, 1, 0, 1, '2018-07-05 13:38:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (130, 15, 'Backup', 'backup', 1, 1, 0, 1, '2018-07-09 09:47:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (131, 15, 'Restore', 'restore', 1, 0, 0, 0, '2018-07-09 09:47:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (132, 23, 'OPD Patient', 'opd_patient', 1, 1, 1, 1, '2018-12-20 15:07:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (134, 23, 'Prescription', 'prescription', 1, 1, 1, 1, '2018-10-11 06:58:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (135, 23, 'Revisit', 'revisit', 1, 1, 1, 1, '2018-10-11 06:58:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (136, 23, 'OPD Diagnosis', 'opd diagnosis', 1, 1, 1, 1, '2018-10-11 12:16:59');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (137, 23, 'OPD Timeline', 'opd timeline', 1, 1, 1, 1, '2018-10-11 12:17:22');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (138, 24, 'IPD Patients', 'ipd_patient', 1, 1, 1, 1, '2018-10-11 12:44:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (139, 24, 'Discharged Patients', 'discharged patients', 1, 1, 1, 1, '2018-10-11 06:58:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (140, 24, 'Consultant Register', 'consultant register', 1, 1, 1, 1, '2018-10-11 06:58:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (141, 24, 'IPD Diagnosis', 'ipd diagnosis', 1, 1, 1, 1, '2018-10-11 12:19:18');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (142, 24, 'IPD Timeline', 'ipd timeline', 1, 1, 1, 1, '2018-10-11 12:19:42');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (143, 24, 'Charges', 'charges', 1, 1, 1, 1, '2018-10-11 06:58:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (144, 24, 'Payment', 'payment', 1, 1, 1, 1, '2018-10-11 06:58:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (145, 24, 'Bill', 'bill', 1, 1, 1, 1, '2018-10-11 06:58:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (146, 25, 'Medicine', 'medicine', 1, 1, 1, 1, '2018-10-11 06:58:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (147, 25, 'Add Medicine Stock', 'add_medicine_stock', 1, 1, 1, 1, '2018-12-21 16:19:20');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (148, 25, 'Pharmacy Bill', 'pharmacy bill', 1, 1, 1, 1, '2018-10-11 06:58:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (149, 26, 'Pathology Test', 'pathology test', 1, 1, 1, 1, '2018-12-22 14:16:42');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (150, 26, 'Add Patient & Test Report', 'add_patho_patient_test_report', 1, 1, 1, 1, '2019-10-18 12:35:57');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (152, 27, 'Radiology Test', 'radiology test', 1, 1, 1, 1, '2018-10-11 06:58:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (153, 27, 'Add Patient & Test Report', 'add_radio_patient_test_reprt', 1, 1, 1, 1, '2019-10-18 12:35:49');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (155, 22, 'IPD Income Widget', 'ipd_income_widget', 1, 0, 0, 0, '2018-12-20 14:38:05');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (156, 22, 'OPD Income Widget', 'opd_income_widget', 1, 0, 0, 0, '2018-12-20 14:38:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (157, 22, 'Pharmacy Income Widget', 'pharmacy_income_widget', 1, 0, 0, 0, '2018-12-20 14:38:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (158, 22, 'Pathology Income Widget', 'pathology_income_widget', 1, 0, 0, 0, '2018-12-20 14:38:37');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (159, 22, 'Radiology Income Widget', 'radiology_income_widget', 1, 0, 0, 0, '2018-12-20 14:38:49');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (160, 22, 'OT Income Widget', 'ot_income_widget', 1, 0, 0, 0, '2018-12-20 14:39:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (161, 22, 'Blood Bank Income Widget', 'blood_bank_income_widget', 1, 0, 0, 0, '2018-12-20 14:39:13');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (162, 22, 'Ambulance Income Widget', 'ambulance_income_widget', 1, 0, 0, 0, '2018-12-20 14:39:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (163, 28, 'OT Patient', 'ot_patient', 1, 1, 1, 1, '2018-10-27 09:05:57');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (164, 28, 'OT Consultant Instruction', 'ot_consultant_instruction', 1, 1, 1, 1, '2018-10-27 09:06:19');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (165, 29, 'Ambulance Call', 'ambulance_call', 1, 1, 1, 1, '2018-10-27 09:07:51');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (166, 29, 'Ambulance', 'ambulance', 1, 1, 1, 1, '2018-10-27 09:07:59');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (167, 30, 'Blood Bank Status', 'blood_bank_status', 1, 1, 1, 1, '2018-10-27 09:50:09');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (168, 30, 'Blood Issue', 'blood_issue', 1, 1, 1, 1, '2018-10-27 09:50:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (169, 30, 'Blood Donor', 'blood_donor', 1, 1, 1, 1, '2018-10-27 09:50:19');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (170, 25, 'Medicine Category', 'medicine_category', 1, 1, 1, 1, '2018-10-25 11:40:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (171, 27, 'Radiology Category', 'radiology_category', 1, 1, 1, 1, '2024-08-08 05:00:46');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (173, 31, 'Organisation', 'organisation', 1, 1, 1, 1, '2018-10-25 11:40:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (174, 31, 'Charges', 'tpa_charges', 1, 1, 1, 1, '2018-12-22 15:36:57');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (175, 26, 'Pathology Category', 'pathology_category', 1, 1, 1, 1, '2018-10-25 11:40:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (176, 32, 'Charges', 'hospital_charges', 1, 1, 1, 1, '2018-12-22 15:38:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (178, 14, 'IPD Report', 'ipd_report', 1, 0, 0, 0, '2018-12-12 15:39:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (179, 14, 'Pharmacy Bill Report', 'pharmacy_bill_report', 1, 0, 0, 0, '2018-12-12 15:39:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (180, 14, 'Pathology Patient Report', 'pathology_patient_report', 1, 0, 0, 0, '2018-12-12 15:39:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (181, 14, 'Radiology Patient Report', 'radiology_patient_report', 1, 0, 0, 0, '2018-12-12 15:39:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (182, 14, 'OT Report', 'ot_report', 1, 0, 0, 0, '2019-03-08 12:26:54');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (183, 14, 'Blood Donor Report', 'blood_donor_report', 1, 0, 0, 0, '2018-12-12 15:39:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (184, 14, 'Payroll Month Report', 'payroll_month_report', 1, 0, 0, 0, '2019-03-08 12:27:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (185, 14, 'Payroll Report', 'payroll_report', 1, 0, 0, 0, '2019-03-08 12:27:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (186, 14, 'Staff Attendance Report', 'staff_attendance_report', 1, 0, 0, 0, '2019-03-08 12:33:28');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (187, 14, 'User Log', 'user_log', 1, 0, 0, 0, '2018-12-12 15:39:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (188, 14, 'Patient Login Credential', 'patient_login_credential', 1, 0, 0, 0, '2018-12-12 15:39:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (189, 14, 'Email / SMS Log', 'email_sms_log', 1, 0, 0, 0, '2018-12-12 15:39:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (190, 22, 'Yearly Income & Expense Chart', 'yearly_income_expense_chart', 1, 0, 0, 0, '2018-12-12 15:52:05');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (191, 22, 'Monthly Income & Expense Chart', 'monthly_income_expense_chart', 1, 0, 0, 0, '2018-12-12 15:55:14');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (192, 23, 'OPD Prescription Print Header Footer ', 'opd_prescription_print_header_footer', 1, 1, 1, 1, '2018-12-12 16:01:07');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (193, 24, 'Revert Generated Bill', 'revert_generated_bill', 1, 0, 0, 0, '2018-12-12 16:04:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (194, 24, 'Calculate Bill', 'calculate_bill', 1, 0, 0, 0, '2018-12-12 16:05:30');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (195, 24, 'Generate Bill & Discharge Patient', 'generate_bill_discharge_patient', 1, 0, 0, 0, '2018-12-21 14:56:00');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (196, 24, 'Bed', 'bed', 1, 1, 1, 1, '2018-12-12 16:16:01');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (197, 24, 'IPD Prescription Print Header Footer', 'ipd_prescription_print_header_footer', 1, 1, 1, 1, '2018-12-12 16:09:42');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (198, 24, 'Bed Status', 'bed_status', 1, 0, 0, 0, '2018-12-12 16:09:42');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (200, 25, 'Medicine Bad Stock', 'medicine_bad_stock', 1, 1, 0, 1, '2018-12-18 06:42:46');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (201, 25, 'Pharmacy Bill print Header Footer', 'pharmacy_bill_print_header_footer', 1, 1, 1, 1, '2018-12-12 16:36:47');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (202, 30, 'Donate Blood', 'donate_blood', 1, 1, 0, 1, '2018-12-12 16:47:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (203, 32, 'Charge Category', 'charge_category', 1, 1, 1, 1, '2018-12-12 16:49:38');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (204, 17, 'Appointment', 'appointment', 1, 1, 1, 1, '2018-12-18 17:22:53');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (205, 17, 'Appointment Approve', 'appointment_approve', 1, 0, 0, 0, '2018-12-18 17:25:58');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (206, 14, 'TPA Report', 'tpa_report', 1, 0, 0, 0, '2019-03-08 12:19:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (207, 14, 'Ambulance Report', 'ambulance_report', 1, 0, 0, 0, '2019-03-08 12:19:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (208, 14, 'Discharge Patient Report', 'discharge_patient_report', 1, 0, 0, 0, '2019-03-08 12:19:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (209, 14, 'Appointment Report', 'appointment_report', 1, 0, 0, 0, '2019-03-08 12:20:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (210, 14, 'Transaction Report', 'transaction_report', 1, 0, 0, 0, '2019-03-08 12:27:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (211, 14, 'Blood Issue Report', 'blood_issue_report', 1, 0, 0, 0, '2019-03-08 12:27:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (212, 14, 'Income Report', 'income_report', 1, 0, 0, 0, '2019-03-08 12:27:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (213, 14, 'Expense Report', 'expense_report', 1, 0, 0, 0, '2019-03-08 12:27:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (214, 34, 'Birth Record', 'birth_record', 1, 1, 1, 1, '2018-06-22 16:06:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (215, 34, 'Death Record', 'death_record', 1, 1, 1, 1, '2018-06-22 16:06:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (216, 17, 'Move Patient in OPD', 'move_patient_in_opd', 1, 0, 0, 0, '2019-09-23 10:14:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (217, 17, 'Move Patient in IPD', 'move_patient_in_ipd', 1, 0, 0, 0, '2018-12-18 17:25:58');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (218, 23, 'Move Patient in IPD', 'opd_move _patient_in_ipd', 1, 0, 0, 0, '2019-09-23 10:19:42');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (219, 23, 'Manual Prescription', 'manual_prescription', 1, 0, 0, 0, '2019-09-23 10:22:06');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (220, 24, 'Prescription ', 'ipd_prescription', 1, 1, 1, 1, '2019-09-24 06:29:27');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (221, 23, 'Charges', 'opd_charges', 1, 1, 1, 1, '2019-09-23 10:28:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (222, 23, 'Payment', 'opd_payment', 1, 1, 1, 1, '2019-09-24 06:14:29');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (223, 23, 'Bill', 'opd_bill', 1, 1, 1, 1, '2019-09-23 10:29:37');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (224, 25, 'Import Medicine', 'import_medicine', 1, 0, 0, 0, '2019-09-23 10:33:31');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (225, 25, 'Medicine Purchase', 'medicine_purchase', 1, 1, 1, 1, '2019-09-23 10:35:53');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (226, 25, 'Medicine Supplier', 'medicine_supplier', 1, 1, 1, 1, '2019-09-23 10:39:36');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (227, 25, 'Medicine Dosage', 'medicine_dosage', 1, 1, 1, 1, '2019-09-23 10:47:16');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (228, 32, 'Doctor OPD Charges', 'doctor_opd_charges', 1, 1, 1, 1, '2019-09-23 10:50:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (229, 18, 'Staff Import', 'staff_import', 1, 0, 0, 0, '2019-09-23 10:51:39');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (236, 36, 'Patient', 'patient', 1, 1, 1, 1, '2019-09-23 11:55:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (237, 36, 'Enabled/Disabled', 'enabled_disabled', 1, 0, 0, 0, '2019-09-23 11:55:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (238, 22, 'Notification Center', 'notification_center', 1, 0, 0, 0, '2019-09-24 09:18:33');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (239, 36, 'Import', 'patient_import', 1, 0, 0, 0, '2019-10-04 06:50:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (240, 34, 'Birth Print Header Footer', 'birth_print_header_footer', 1, 1, 1, 1, '2019-10-04 08:14:01');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (241, 34, 'Custom Fields', 'birth_death_customfields', 1, 1, 1, 1, '2019-10-04 06:53:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (242, 34, 'Death Print Header Footer', 'death_print_header_footer', 1, 1, 1, 1, '2019-10-04 08:13:56');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (243, 26, 'Print Header Footer', 'pathology_print_header_footer', 1, 1, 1, 1, '2019-10-04 07:06:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (244, 27, 'Print Header Footer', 'radiology_print_header_footer', 1, 1, 1, 1, '2019-10-04 07:10:01');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (245, 28, 'Print Header Footer', 'ot_print_header_footer', 1, 1, 1, 1, '2019-10-04 07:11:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (246, 30, 'Print Header Footer', 'bloodbank_print_header_footer', 1, 1, 1, 1, '2019-10-04 08:17:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (247, 29, 'Print Header Footer', 'ambulance_print_header_footer', 1, 1, 1, 1, '2019-10-04 07:15:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (248, 24, 'IPD Bill Print Header Footer', 'ipd_bill_print_header_footer', 1, 1, 1, 1, '2019-10-04 07:43:28');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (249, 18, 'Print Payslip Header Footer', 'print_payslip_header_footer', 1, 1, 1, 1, '2019-10-04 08:01:33');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (250, 14, 'Income Group Report', 'income_group_report', 1, 0, 0, 0, '2024-08-13 06:45:42');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (251, 14, 'Expense Group Report', 'expense_group_report', 1, 0, 0, 0, '2019-10-04 09:45:56');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (252, 3, 'Search Income', 'search_income', 1, 0, 0, 0, '2019-10-04 09:47:12');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (253, 14, 'Inventory Stock Report', 'inventory_stock_report', 1, 0, 0, 0, '2019-10-04 10:50:31');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (254, 14, 'Inventory Item Report', 'add_item_report', 1, 0, 0, 0, '2019-10-04 10:53:22');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (255, 14, 'Inventory Issue Report', 'issue_inventory_report', 1, 0, 0, 0, '2019-10-04 10:54:40');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (256, 14, 'Expiry Medicine Report', 'expiry_medicine_report', 1, 0, 0, 0, '2019-10-04 11:30:11');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (257, 26, 'Pathology Bill', 'pathology bill', 1, 1, 1, 1, '2018-12-22 14:16:42');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (258, 14, 'Birth Report', 'birth_report', 1, 0, 0, 0, '2019-10-14 08:42:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (259, 14, 'Death Report', 'death_report', 1, 0, 0, 0, '2019-10-14 08:43:56');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (260, 27, 'Radiology Bill', 'radiology_bill', 1, 1, 1, 1, '2024-08-06 11:16:09');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (262, 23, 'OPD Bill Print Header Footer', 'opd_bill_print_header_footer', 1, 1, 1, 1, '2024-08-13 07:30:17');


#
# TABLE STRUCTURE FOR: permission_group
#

DROP TABLE IF EXISTS `permission_group`;

CREATE TABLE `permission_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) NOT NULL,
  `is_active` int DEFAULT '0',
  `system` int NOT NULL,
  `sort_order` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;

INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (3, 'Income', 'income', 1, 0, '9.00', '2021-05-05 09:54:50');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (4, 'Expense', 'expense', 1, 0, '10.00', '2021-05-05 09:54:53');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (8, 'Download Center', 'download_center', 1, 0, '15.00', '2021-05-05 09:55:10');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (10, 'Inventory', 'inventory', 1, 0, '16.00', '2018-12-18 10:23:27');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (13, 'Messaging', 'communicate', 1, 0, '14.00', '2018-12-18 10:22:54');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (14, 'Reports', 'reports', 1, 1, '19.00', '2018-12-18 10:24:41');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (15, 'System Settings', 'system_settings', 1, 1, '18.00', '2018-12-18 10:24:23');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (16, 'Front CMS', 'front_cms', 0, 0, '17.00', '2024-08-07 09:28:55');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (17, 'Front Office', 'front_office', 1, 0, '12.00', '2018-12-18 10:21:58');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (18, 'Human Resource', 'human_resource', 1, 1, '13.00', '2018-12-18 10:22:37');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (21, 'Calendar To Do List', 'calendar_to_do_list', 1, 0, '22.00', '2019-10-04 07:26:23');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (22, 'Dashboard and Widgets', 'dashboard_and_widgets', 1, 1, '20.00', '2018-12-18 10:24:51');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (23, 'OPD', 'OPD', 1, 0, '1.00', '2021-05-05 09:54:24');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (24, 'IPD', 'IPD', 1, 0, '2.00', '2021-05-05 09:54:28');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (25, 'Pharmacy', 'pharmacy', 1, 0, '3.00', '2021-05-05 09:54:32');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (26, 'Pathology', 'pathology', 1, 0, '4.00', '2018-12-18 10:02:56');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (27, 'Radiology', 'radiology', 1, 0, '5.00', '2021-04-02 10:29:46');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (28, 'Operation Theatre', 'operation_theatre', 1, 0, '6.00', '2021-05-05 09:54:39');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (29, 'Ambulance', 'ambulance', 1, 0, '11.00', '2021-05-05 09:54:56');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (30, 'Blood Bank', 'blood_bank', 1, 0, '7.00', '2021-05-05 09:54:43');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (31, 'TPA Management', 'tpa_management', 1, 0, '8.00', '2021-05-05 09:54:46');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (32, 'Hospital Charges', 'hospital_charges', 1, 1, '10.10', '2019-03-10 07:08:22');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (34, 'Birth Death Record', 'birth_death_report', 1, 0, '12.00', '2021-05-05 09:55:02');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (36, 'Patient', 'patient', 1, 0, '21.00', '2019-10-04 07:26:19');


#
# TABLE STRUCTURE FOR: pharmacy
#

DROP TABLE IF EXISTS `pharmacy`;

CREATE TABLE `pharmacy` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

INSERT INTO `pharmacy` (`id`, `medicine_name`, `medicine_category_id`, `medicine_image`, `medicine_company`, `medicine_composition`, `medicine_group`, `unit`, `min_level`, `reorder_level`, `vat`, `unit_packing`, `supplier`, `vat_ac`, `note`, `is_active`, `created_at`) VALUES (1, 'cough syrup', '1', 'uploads/medicine_images/1.jpeg', 'Cipla', 'Alumimium chloride', 'Acetaline', 'bottle', '10', '20', '5', '100', NULL, NULL, '', '', '2024-08-16 08:00:16');
INSERT INTO `pharmacy` (`id`, `medicine_name`, `medicine_category_id`, `medicine_image`, `medicine_company`, `medicine_composition`, `medicine_group`, `unit`, `min_level`, `reorder_level`, `vat`, `unit_packing`, `supplier`, `vat_ac`, `note`, `is_active`, `created_at`) VALUES (2, 'Amlodipine', '13', '', 'S amlodipine', 'Amlodipine ', 'AMD s', '100', '50', '200', '10', '500', NULL, NULL, '', '', '2024-08-19 09:56:12');


#
# TABLE STRUCTURE FOR: pharmacy_bill_basic
#

DROP TABLE IF EXISTS `pharmacy_bill_basic`;

CREATE TABLE `pharmacy_bill_basic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(50) DEFAULT NULL,
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
  `note` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

INSERT INTO `pharmacy_bill_basic` (`id`, `bill_no`, `date`, `patient_id`, `customer_name`, `customer_type`, `doctor_name`, `file`, `opd_ipd_no`, `total`, `discount_percent`, `discount`, `tax_percent`, `tax`, `net_amount`, `note`, `created_at`, `generated_by`) VALUES (1, '1', '2024-08-17 10:54:00', '47', 'Omar Al-Najjar', NULL, '', '', NULL, '1500.00', '10.00', '150.00', '10.00', '135.00', '1485.00', '', '2024-08-17 05:25:51', 1);
INSERT INTO `pharmacy_bill_basic` (`id`, `bill_no`, `date`, `patient_id`, `customer_name`, `customer_type`, `doctor_name`, `file`, `opd_ipd_no`, `total`, `discount_percent`, `discount`, `tax_percent`, `tax`, `net_amount`, `note`, `created_at`, `generated_by`) VALUES (2, '2', '2024-08-17 11:04:00', '45', 'Abdullah Al-Sarhan', NULL, '', '', NULL, '300.00', '0.00', '0.00', '0.00', '0.00', '300.00', '', '2024-08-17 05:34:43', 1);


#
# TABLE STRUCTURE FOR: pharmacy_bill_detail
#

DROP TABLE IF EXISTS `pharmacy_bill_detail`;

CREATE TABLE `pharmacy_bill_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pharmacy_bill_basic_id` varchar(50) NOT NULL,
  `medicine_category_id` int NOT NULL,
  `medicine_name` varchar(200) NOT NULL,
  `expire_date` varchar(100) NOT NULL,
  `batch_no` varchar(200) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `sale_price` decimal(15,2) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

INSERT INTO `pharmacy_bill_detail` (`id`, `pharmacy_bill_basic_id`, `medicine_category_id`, `medicine_name`, `expire_date`, `batch_no`, `quantity`, `sale_price`, `amount`) VALUES (1, '1', 1, '1', 'Dec/2024', '1010', '15', '100.00', '1500.00');
INSERT INTO `pharmacy_bill_detail` (`id`, `pharmacy_bill_basic_id`, `medicine_category_id`, `medicine_name`, `expire_date`, `batch_no`, `quantity`, `sale_price`, `amount`) VALUES (2, '2', 1, '1', 'Nov/2024', '1011', '3', '100.00', '300.00');


#
# TABLE STRUCTURE FOR: prescription
#

DROP TABLE IF EXISTS `prescription`;

CREATE TABLE `prescription` (
  `id` int NOT NULL AUTO_INCREMENT,
  `opd_id` int NOT NULL,
  `visit_id` int NOT NULL,
  `medicine_category_id` int NOT NULL,
  `medicine` varchar(200) NOT NULL,
  `dosage` varchar(200) NOT NULL,
  `instruction` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

INSERT INTO `prescription` (`id`, `opd_id`, `visit_id`, `medicine_category_id`, `medicine`, `dosage`, `instruction`) VALUES (1, 6, 0, 2, '', '1 MG', '');
INSERT INTO `prescription` (`id`, `opd_id`, `visit_id`, `medicine_category_id`, `medicine`, `dosage`, `instruction`) VALUES (2, 8, 0, 1, 'cough syrup', '0.5 ml', 'ok');
INSERT INTO `prescription` (`id`, `opd_id`, `visit_id`, `medicine_category_id`, `medicine`, `dosage`, `instruction`) VALUES (3, 12, 0, 1, 'cough syrup', '0.5 ml', 'please take before food.');


#
# TABLE STRUCTURE FOR: print_setting
#

DROP TABLE IF EXISTS `print_setting`;

CREATE TABLE `print_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `print_header` varchar(300) NOT NULL,
  `print_footer` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `setting_for` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;

INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`) VALUES (1, 'uploads/printing/1.png', '<p>This invoice is printed electronically, so no signature is required</p>', 'pathology', 'yes');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`) VALUES (2, 'uploads/printing/2.png', '<p>This invoice is printed electronically, so no signature is required</p>', 'opd', 'yes');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`) VALUES (3, 'uploads/printing/3.png', '<p>This invoice is printed electronically, so no signature is required</p>', 'opdpre', 'yes');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`) VALUES (4, 'uploads/printing/4.png', '<p>This invoice is printed electronically, so no signature is required</p>', 'pharmacy', 'yes');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`) VALUES (6, 'uploads/printing/6.png', '<p>This invoice is printed electronically, so no signature is required</p>', 'ipdpres', 'yes');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`) VALUES (7, 'uploads/printing/7.png', '<p>This invoice is printed electronically, so no signature is required</p>', 'ipd', 'yes');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`) VALUES (8, 'uploads/printing/8.png', '<p>This invoice is printed electronically, so no signature is required</p>', 'birth', 'yes');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`) VALUES (9, 'uploads/printing/9.png', '<p>This invoice is printed electronically, so no signature is required</p>', 'ot', 'yes');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`) VALUES (10, 'uploads/printing/10.png', '<p>This invoice is printed electronically, so no signature is required</p>', 'ambulance', 'yes');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`) VALUES (11, 'uploads/printing/11.png', '<p>This invoice is printed electronically, so no signature is required</p>', 'bloodbank', 'yes');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`) VALUES (12, 'uploads/printing/12.png', '<p>This invoice is printed electronically, so no signature is required</p>', 'radiology', 'yes');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`) VALUES (13, 'uploads/printing/13.png', '<p>This invoice is printed electronically, so no signature is required</p>', 'death', 'yes');
INSERT INTO `print_setting` (`id`, `print_header`, `print_footer`, `setting_for`, `is_active`) VALUES (14, 'uploads/printing/14.png', '<p>This invoice is printed electronically, so no signature is required</p>', 'payslip', 'yes');


#
# TABLE STRUCTURE FOR: radio
#

DROP TABLE IF EXISTS `radio`;

CREATE TABLE `radio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_name` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `test_type` varchar(100) DEFAULT NULL,
  `radiology_category_id` varchar(11) NOT NULL,
  `sub_category` varchar(50) NOT NULL,
  `report_days` varchar(50) NOT NULL,
  `charge_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

INSERT INTO `radio` (`id`, `test_name`, `short_name`, `test_type`, `radiology_category_id`, `sub_category`, `report_days`, `charge_id`, `created_at`) VALUES (1, 'Magnetic Resonance Imaging', 'MRI', 'Imaging Test', '3', 'Neuroimaging', '1', 8, '2024-08-08 07:28:02');
INSERT INTO `radio` (`id`, `test_name`, `short_name`, `test_type`, `radiology_category_id`, `sub_category`, `report_days`, `charge_id`, `created_at`) VALUES (2, 'Chest X-Ray', 'CXR', 'X-Ray', '2', 'Diagnostic imaging X-ray', '2', 8, '2024-08-08 07:53:08');


#
# TABLE STRUCTURE FOR: radiology_report
#

DROP TABLE IF EXISTS `radiology_report`;

CREATE TABLE `radiology_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(200) NOT NULL,
  `radiology_id` int NOT NULL,
  `patient_id` varchar(11) DEFAULT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `patient_name` varchar(100) DEFAULT NULL,
  `consultant_doctor` varchar(10) NOT NULL,
  `reporting_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `radiology_report` varchar(255) DEFAULT NULL,
  `apply_charge` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

INSERT INTO `radiology_report` (`id`, `bill_no`, `radiology_id`, `patient_id`, `customer_type`, `patient_name`, `consultant_doctor`, `reporting_date`, `description`, `radiology_report`, `apply_charge`, `created_at`, `generated_by`) VALUES (3, '1', 1, '44', NULL, NULL, '3', '2024-08-16', '', '3.jpg', '500.00', '2024-08-16 05:41:24', 1);
INSERT INTO `radiology_report` (`id`, `bill_no`, `radiology_id`, `patient_id`, `customer_type`, `patient_name`, `consultant_doctor`, `reporting_date`, `description`, `radiology_report`, `apply_charge`, `created_at`, `generated_by`) VALUES (4, '4', 2, '42', NULL, NULL, '3', '2024-08-16', 'ok', '4.jpg', '500.00', '2024-08-16 05:42:11', 1);
INSERT INTO `radiology_report` (`id`, `bill_no`, `radiology_id`, `patient_id`, `customer_type`, `patient_name`, `consultant_doctor`, `reporting_date`, `description`, `radiology_report`, `apply_charge`, `created_at`, `generated_by`) VALUES (5, '5', 1, '46', NULL, NULL, '', '2024-07-30', 'ok', '5.jpg', '500.00', '2024-08-17 06:06:15', 1);


#
# TABLE STRUCTURE FOR: read_notification
#

DROP TABLE IF EXISTS `read_notification`;

CREATE TABLE `read_notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `notification_id` int DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: read_systemnotification
#

DROP TABLE IF EXISTS `read_systemnotification`;

CREATE TABLE `read_systemnotification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `notification_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `is_active` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: roles
#

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(150) DEFAULT NULL,
  `is_active` int DEFAULT '0',
  `is_system` int NOT NULL DEFAULT '0',
  `is_superadmin` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (1, 'Admin', NULL, 0, 1, 0, '2018-12-25 11:49:43');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (2, 'Accountant', NULL, 0, 1, 0, '2018-12-25 11:49:38');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (3, 'Doctor', NULL, 0, 1, 0, '2018-07-21 10:37:36');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (4, 'Pharmacist', NULL, 0, 1, 0, '2018-07-21 10:38:26');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (5, 'Lab Technician', NULL, 0, 1, 0, '2024-08-01 16:17:47');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (6, 'Nurse', NULL, 0, 1, 0, '2024-08-01 16:18:02');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (7, 'Super Admin', NULL, 0, 1, 1, '2018-12-25 11:52:24');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (8, 'Receptionist', NULL, 0, 1, 0, '2018-12-25 11:50:22');


#
# TABLE STRUCTURE FOR: roles_permissions
#

DROP TABLE IF EXISTS `roles_permissions`;

CREATE TABLE `roles_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL,
  `perm_cat_id` int DEFAULT NULL,
  `can_view` int DEFAULT NULL,
  `can_add` int DEFAULT NULL,
  `can_edit` int DEFAULT NULL,
  `can_delete` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=874 DEFAULT CHARSET=utf8mb3;

INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1, 1, 132, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (3, 1, 134, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (4, 1, 135, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (5, 1, 136, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (6, 1, 137, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (7, 1, 192, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (8, 1, 138, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (9, 1, 139, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (10, 1, 140, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (11, 1, 141, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (12, 1, 142, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (13, 1, 143, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (14, 1, 144, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (15, 1, 145, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (16, 1, 193, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (17, 1, 194, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (18, 1, 195, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (19, 1, 196, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (20, 1, 197, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (21, 1, 198, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (22, 1, 146, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (23, 1, 147, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (24, 1, 148, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (25, 1, 170, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (26, 1, 200, 1, 1, 0, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (27, 1, 201, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (28, 1, 149, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (29, 1, 150, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (30, 1, 175, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (31, 1, 152, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (32, 1, 153, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (33, 1, 171, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (34, 1, 163, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (35, 1, 164, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (36, 1, 167, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (37, 1, 168, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (38, 1, 169, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (39, 1, 202, 1, 1, 0, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (40, 1, 173, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (41, 1, 174, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (42, 1, 9, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (43, 1, 10, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (45, 1, 176, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (46, 1, 203, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (47, 1, 12, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (48, 1, 13, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (49, 1, 14, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (50, 1, 165, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (51, 1, 166, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (52, 1, 80, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (53, 1, 81, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (54, 1, 82, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (55, 1, 83, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (56, 1, 84, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (57, 1, 85, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (58, 1, 204, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (59, 1, 205, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (60, 1, 86, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (61, 1, 87, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (62, 1, 88, 1, 1, 1, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (63, 1, 89, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (64, 1, 90, 1, 1, 0, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (65, 1, 91, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (66, 1, 108, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (67, 1, 109, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (68, 1, 110, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (69, 1, 111, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (70, 1, 112, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (71, 1, 127, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (72, 1, 129, 0, 1, 0, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (73, 1, 43, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (74, 1, 44, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (75, 1, 46, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (76, 1, 27, 1, 1, 0, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (77, 1, 31, 1, 1, 0, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (78, 1, 32, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (79, 1, 33, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (80, 1, 34, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (81, 1, 35, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (82, 1, 104, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (83, 1, 61, 1, 1, 0, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (84, 1, 62, 1, 1, 0, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (85, 1, 63, 1, 1, 0, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (86, 1, 64, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (87, 1, 65, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (88, 1, 66, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (89, 1, 67, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (90, 1, 53, 0, 1, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (91, 1, 54, 1, 0, 1, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (92, 1, 56, 1, 0, 1, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (93, 1, 57, 1, 0, 1, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (94, 1, 58, 1, 0, 1, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (95, 1, 59, 1, 0, 1, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (96, 1, 60, 1, 0, 1, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (97, 1, 126, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (98, 1, 130, 1, 1, 0, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (99, 1, 131, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (100, 1, 48, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (101, 1, 178, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (102, 1, 179, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (103, 1, 180, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (104, 1, 181, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (105, 1, 182, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (106, 1, 183, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (107, 1, 184, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (108, 1, 185, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (109, 1, 186, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (110, 1, 187, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (111, 1, 188, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (112, 1, 189, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (113, 1, 206, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (114, 1, 207, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (115, 1, 208, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (116, 1, 209, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (117, 1, 210, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (118, 1, 211, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (119, 1, 212, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (120, 1, 213, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (121, 1, 118, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (122, 1, 155, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (123, 1, 156, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (124, 1, 157, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (125, 1, 158, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (126, 1, 159, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (127, 1, 160, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (128, 1, 161, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (129, 1, 162, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (130, 1, 190, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (131, 1, 191, 1, 0, 0, 0, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (132, 1, 102, 1, 1, 1, 1, '2019-03-09 17:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (133, 2, 132, 1, 0, 0, 0, '2024-08-06 05:03:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (135, 2, 138, 1, 0, 0, 0, '2024-08-06 05:06:35');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (137, 2, 143, 1, 1, 1, 1, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (138, 2, 144, 1, 1, 1, 1, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (139, 2, 145, 1, 1, 1, 1, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (140, 2, 193, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (141, 2, 194, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (142, 2, 195, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (145, 2, 148, 1, 1, 1, 1, '2024-08-06 05:08:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (153, 2, 173, 1, 1, 1, 1, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (154, 2, 174, 1, 1, 1, 1, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (155, 2, 9, 1, 1, 1, 1, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (156, 2, 10, 1, 1, 1, 1, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (158, 2, 176, 1, 0, 0, 0, '2024-08-06 05:23:39');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (159, 2, 203, 1, 0, 0, 0, '2024-08-06 05:23:39');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (160, 2, 12, 1, 1, 1, 1, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (161, 2, 13, 1, 1, 1, 1, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (162, 2, 14, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (167, 2, 86, 1, 0, 0, 0, '2024-08-06 05:18:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (169, 2, 88, 1, 1, 1, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (170, 2, 89, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (171, 2, 90, 1, 1, 0, 1, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (172, 2, 91, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (173, 2, 108, 1, 1, 1, 1, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (174, 2, 109, 1, 1, 1, 1, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (175, 2, 110, 1, 0, 0, 0, '2024-08-06 05:21:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (178, 2, 127, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (184, 2, 31, 1, 1, 0, 1, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (185, 2, 32, 1, 1, 1, 1, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (186, 2, 33, 1, 1, 1, 1, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (187, 2, 34, 1, 1, 1, 1, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (188, 2, 35, 1, 1, 1, 1, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (189, 2, 104, 1, 1, 1, 1, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (190, 2, 48, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (191, 2, 178, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (192, 2, 179, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (193, 2, 180, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (194, 2, 181, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (195, 2, 182, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (196, 2, 184, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (197, 2, 185, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (198, 2, 186, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (201, 2, 206, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (202, 2, 207, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (203, 2, 208, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (205, 2, 210, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (206, 2, 211, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (207, 2, 212, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (208, 2, 213, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (209, 2, 118, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (210, 2, 155, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (211, 2, 156, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (212, 2, 157, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (213, 2, 158, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (214, 2, 159, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (215, 2, 160, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (216, 2, 161, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (217, 2, 162, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (218, 2, 190, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (219, 2, 191, 1, 0, 0, 0, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (220, 2, 102, 1, 1, 1, 1, '2019-03-09 17:43:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (221, 3, 132, 1, 1, 1, 1, '2024-08-13 11:22:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (222, 3, 134, 1, 1, 1, 1, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (223, 3, 135, 1, 1, 1, 1, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (224, 3, 136, 1, 1, 1, 1, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (225, 3, 137, 1, 1, 1, 1, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (226, 3, 138, 1, 0, 1, 1, '2024-08-05 09:57:15');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (227, 3, 139, 1, 0, 1, 1, '2024-08-05 09:57:15');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (228, 3, 140, 1, 1, 1, 1, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (229, 3, 141, 1, 1, 1, 1, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (230, 3, 142, 1, 1, 1, 1, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (231, 3, 143, 1, 1, 1, 1, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (232, 3, 144, 1, 1, 1, 1, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (233, 3, 145, 1, 1, 1, 1, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (234, 3, 194, 1, 0, 0, 0, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (236, 3, 163, 1, 0, 0, 0, '2024-08-05 10:12:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (237, 3, 164, 1, 1, 1, 1, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (238, 3, 167, 1, 0, 0, 0, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (240, 3, 204, 1, 1, 1, 1, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (241, 3, 205, 1, 0, 0, 0, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (242, 3, 86, 1, 0, 0, 0, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (243, 3, 109, 1, 1, 1, 1, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (249, 3, 48, 1, 0, 0, 0, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (250, 3, 178, 1, 0, 0, 0, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (251, 3, 182, 1, 0, 0, 0, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (253, 3, 208, 1, 0, 0, 0, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (254, 3, 209, 1, 0, 0, 0, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (255, 3, 118, 1, 0, 0, 0, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (256, 3, 155, 1, 0, 0, 0, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (257, 3, 156, 1, 0, 0, 0, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (262, 3, 102, 1, 1, 1, 1, '2019-03-10 07:17:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (263, 4, 146, 1, 1, 1, 1, '2019-03-10 07:21:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (264, 4, 147, 1, 1, 1, 1, '2019-03-10 07:21:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (265, 4, 148, 1, 1, 1, 1, '2019-10-12 11:04:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (266, 4, 170, 1, 1, 1, 1, '2019-03-10 07:21:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (267, 4, 200, 1, 1, 0, 1, '2019-03-10 07:21:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (268, 4, 86, 1, 0, 0, 0, '2019-03-10 07:21:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (273, 4, 179, 1, 0, 0, 0, '2019-03-10 07:21:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (274, 4, 118, 1, 0, 0, 0, '2019-03-10 07:21:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (275, 4, 157, 1, 0, 0, 0, '2019-03-10 07:21:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (276, 4, 102, 1, 1, 1, 1, '2019-03-10 07:21:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (277, 5, 149, 1, 1, 1, 1, '2019-03-10 07:23:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (278, 5, 150, 1, 1, 1, 1, '2019-03-10 07:23:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (279, 5, 175, 1, 1, 1, 1, '2019-03-10 07:23:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (280, 5, 86, 1, 0, 0, 0, '2019-03-10 07:23:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (281, 5, 109, 1, 1, 1, 1, '2019-03-10 07:23:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (286, 5, 180, 1, 0, 0, 0, '2019-03-10 07:23:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (288, 5, 158, 1, 0, 0, 0, '2019-03-10 07:23:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (289, 5, 102, 1, 1, 1, 1, '2019-03-10 07:23:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (290, 6, 152, 1, 0, 0, 0, '2024-08-06 10:22:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (291, 6, 153, 1, 0, 0, 0, '2024-08-06 10:22:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (294, 6, 109, 1, 1, 1, 1, '2019-03-10 07:31:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (299, 6, 102, 1, 1, 1, 1, '2019-03-10 07:31:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (300, 8, 132, 1, 1, 1, 0, '2024-08-03 05:26:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (306, 8, 81, 1, 1, 1, 1, '2019-03-10 07:38:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (376, 7, 237, 1, 0, 0, 0, '2024-08-08 06:15:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (492, 8, 236, 1, 1, 1, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (493, 8, 146, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (495, 8, 138, 1, 1, 1, 0, '2024-08-03 05:26:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (496, 8, 139, 1, 1, 1, 0, '2024-08-03 05:26:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (500, 8, 143, 1, 1, 1, 0, '2024-08-03 05:26:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (501, 8, 144, 1, 1, 1, 0, '2024-08-03 05:26:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (502, 8, 145, 1, 1, 1, 0, '2024-08-03 05:26:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (504, 8, 194, 1, 0, 0, 0, '2019-10-04 06:36:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (506, 8, 196, 1, 0, 0, 0, '2024-08-12 11:43:06');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (508, 8, 198, 1, 0, 0, 0, '2019-10-04 06:36:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (511, 8, 148, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (516, 8, 225, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (524, 4, 201, 1, 1, 1, 1, '2019-10-04 07:51:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (540, 3, 245, 1, 0, 0, 0, '2024-08-13 11:48:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (550, 4, 236, 1, 1, 1, 0, '2024-08-07 06:15:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (571, 4, 256, 1, 0, 0, 0, '2019-10-04 11:36:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (573, 4, 225, 1, 1, 1, 1, '2019-10-12 12:09:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (574, 4, 226, 1, 1, 1, 1, '2019-10-12 12:09:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (575, 4, 227, 1, 1, 1, 1, '2019-10-12 12:09:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (580, 2, 221, 1, 1, 1, 1, '2019-10-12 11:56:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (581, 2, 222, 1, 1, 1, 1, '2019-10-12 11:56:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (582, 2, 223, 1, 1, 1, 1, '2019-10-12 11:56:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (583, 2, 225, 1, 0, 0, 0, '2019-10-12 11:56:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (587, 2, 249, 1, 1, 1, 1, '2019-10-12 11:56:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (588, 2, 250, 1, 0, 0, 0, '2024-08-13 06:44:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (589, 2, 251, 1, 0, 0, 0, '2019-10-12 11:56:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (590, 2, 253, 1, 0, 0, 0, '2019-10-12 11:56:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (591, 2, 254, 1, 0, 0, 0, '2019-10-12 11:56:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (592, 2, 255, 1, 0, 0, 0, '2019-10-12 11:56:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (594, 2, 238, 1, 0, 0, 0, '2019-10-12 11:56:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (595, 2, 236, 1, 0, 0, 0, '2024-08-06 05:01:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (597, 3, 192, 1, 1, 1, 1, '2019-10-12 12:02:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (598, 3, 218, 1, 0, 0, 0, '2019-10-12 12:02:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (599, 3, 219, 1, 0, 0, 0, '2019-10-12 12:02:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (600, 3, 221, 1, 1, 1, 1, '2019-10-12 12:02:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (601, 3, 222, 1, 1, 1, 1, '2019-10-12 12:02:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (602, 3, 223, 1, 1, 1, 1, '2019-10-12 12:02:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (603, 3, 193, 1, 0, 0, 0, '2019-10-12 12:02:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (604, 3, 195, 1, 0, 0, 0, '2019-10-12 12:02:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (606, 3, 197, 1, 1, 1, 1, '2019-10-12 12:02:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (607, 3, 220, 1, 1, 1, 1, '2019-10-12 12:02:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (608, 3, 248, 1, 1, 1, 1, '2019-10-12 12:02:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (610, 3, 149, 1, 0, 0, 0, '2019-10-12 12:02:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (611, 3, 152, 1, 0, 0, 0, '2019-10-12 12:02:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (612, 3, 173, 1, 0, 0, 0, '2019-10-12 12:02:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (613, 3, 174, 1, 0, 0, 0, '2019-10-12 12:02:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (614, 3, 176, 1, 0, 0, 0, '2019-10-12 12:02:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (615, 3, 228, 1, 0, 0, 0, '2019-10-12 12:02:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (616, 3, 165, 1, 0, 0, 0, '2019-10-12 12:02:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (617, 3, 214, 1, 1, 1, 1, '2019-10-12 12:02:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (618, 3, 215, 1, 1, 1, 1, '2019-10-12 12:02:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (619, 3, 216, 1, 0, 0, 0, '2019-10-12 12:02:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (620, 3, 217, 1, 0, 0, 0, '2019-10-12 12:02:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (622, 4, 109, 1, 1, 1, 1, '2019-10-12 12:09:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (623, 5, 243, 1, 1, 1, 1, '2019-10-12 12:24:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (624, 5, 236, 1, 1, 0, 0, '2024-08-07 10:08:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (628, 6, 236, 1, 0, 0, 0, '2019-10-12 12:30:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (629, 8, 135, 1, 1, 1, 0, '2024-08-03 05:26:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (630, 8, 218, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (631, 8, 219, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (632, 8, 221, 1, 1, 1, 0, '2024-08-03 05:26:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (633, 8, 222, 1, 1, 1, 0, '2024-08-03 05:26:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (634, 8, 223, 1, 1, 1, 0, '2024-08-03 05:26:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (635, 8, 149, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (636, 8, 152, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (637, 8, 163, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (638, 8, 167, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (639, 8, 173, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (640, 8, 174, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (641, 8, 176, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (642, 8, 228, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (643, 8, 165, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (644, 8, 166, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (645, 8, 214, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (646, 8, 215, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (647, 8, 82, 1, 1, 1, 1, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (648, 8, 83, 1, 1, 1, 1, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (649, 8, 84, 1, 1, 1, 1, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (650, 8, 85, 1, 1, 1, 1, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (651, 8, 204, 1, 1, 1, 1, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (652, 8, 205, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (653, 8, 216, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (654, 8, 217, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (655, 8, 109, 1, 1, 1, 1, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (659, 8, 31, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (660, 8, 32, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (661, 8, 33, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (662, 8, 48, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (663, 8, 178, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (664, 8, 180, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (665, 8, 181, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (666, 8, 186, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (667, 8, 207, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (668, 8, 208, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (669, 8, 209, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (670, 8, 253, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (671, 8, 254, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (672, 8, 255, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (673, 8, 118, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (674, 8, 238, 1, 0, 0, 0, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (675, 8, 102, 1, 1, 1, 1, '2019-10-12 12:40:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (678, 8, 86, 1, 0, 0, 0, '2019-10-12 13:16:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (679, 8, 182, 1, 0, 0, 0, '2019-10-12 13:16:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (680, 2, 147, 1, 0, 0, 0, '2019-10-14 09:34:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (681, 2, 200, 1, 0, 0, 0, '2019-10-14 09:34:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (683, 2, 146, 1, 0, 0, 0, '2019-10-14 09:39:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (684, 1, 218, 1, 0, 0, 0, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (685, 1, 219, 1, 0, 0, 0, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (686, 1, 221, 1, 1, 1, 1, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (687, 1, 222, 1, 1, 1, 1, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (688, 1, 223, 1, 1, 1, 1, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (689, 1, 220, 1, 1, 1, 1, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (690, 1, 248, 1, 1, 1, 1, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (691, 1, 224, 1, 0, 0, 0, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (692, 1, 225, 1, 1, 1, 1, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (693, 1, 226, 1, 1, 1, 1, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (694, 1, 227, 1, 1, 1, 1, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (695, 1, 243, 1, 1, 1, 1, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (696, 1, 257, 1, 1, 1, 1, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (697, 1, 244, 1, 1, 1, 1, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (698, 1, 245, 1, 1, 1, 1, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (699, 1, 246, 1, 1, 1, 1, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (700, 1, 252, 1, 0, 0, 0, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (701, 1, 228, 1, 1, 1, 1, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (702, 1, 247, 1, 1, 1, 1, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (703, 1, 214, 1, 1, 1, 1, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (704, 1, 215, 1, 1, 1, 1, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (705, 1, 240, 1, 1, 1, 1, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (706, 1, 241, 1, 1, 1, 1, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (707, 1, 242, 1, 1, 1, 1, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (708, 1, 216, 1, 0, 0, 0, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (709, 1, 217, 1, 0, 0, 0, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (710, 1, 229, 1, 0, 0, 0, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (711, 1, 249, 1, 1, 1, 1, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (712, 1, 250, 1, 0, 0, 0, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (713, 1, 251, 1, 0, 0, 0, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (714, 1, 253, 1, 0, 0, 0, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (715, 1, 254, 1, 0, 0, 0, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (716, 1, 255, 1, 0, 0, 0, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (717, 1, 256, 1, 0, 0, 0, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (718, 1, 258, 1, 0, 0, 0, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (719, 1, 259, 1, 0, 0, 0, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (720, 1, 238, 1, 0, 0, 0, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (721, 1, 236, 1, 1, 1, 1, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (722, 1, 237, 1, 0, 0, 0, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (723, 1, 239, 1, 0, 0, 0, '2019-10-15 06:18:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (725, 3, 150, 1, 0, 0, 0, '2019-10-19 04:38:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (726, 3, 153, 1, 0, 0, 0, '2019-10-19 04:38:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (727, 3, 238, 1, 0, 0, 0, '2019-11-01 05:40:24');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (728, 5, 257, 1, 1, 1, 1, '2024-08-02 10:24:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (729, 5, 152, 1, 1, 1, 1, '2024-08-02 10:24:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (730, 5, 153, 1, 1, 1, 1, '2024-08-02 10:24:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (731, 5, 171, 1, 1, 1, 1, '2024-08-02 10:24:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (732, 5, 244, 1, 1, 1, 1, '2024-08-02 10:24:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (738, 5, 181, 1, 0, 0, 0, '2024-08-02 10:24:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (741, 5, 118, 1, 0, 0, 0, '2024-08-02 10:24:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (742, 5, 159, 1, 0, 0, 0, '2024-08-02 10:24:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (744, 6, 132, 1, 0, 0, 0, '2024-08-13 12:16:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (745, 6, 134, 1, 0, 0, 0, '2024-08-08 05:54:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (746, 6, 135, 1, 0, 0, 0, '2024-08-08 05:54:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (747, 6, 136, 1, 0, 0, 0, '2024-08-08 05:54:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (748, 6, 137, 1, 1, 1, 1, '2024-08-08 05:54:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (750, 6, 218, 1, 0, 0, 0, '2024-08-02 10:42:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (751, 6, 219, 1, 0, 0, 0, '2024-08-02 10:42:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (752, 6, 221, 1, 0, 0, 0, '2024-08-08 05:54:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (753, 6, 222, 1, 0, 0, 0, '2024-08-02 10:42:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (754, 6, 223, 1, 0, 0, 0, '2024-08-02 10:42:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (755, 6, 138, 1, 0, 0, 0, '2024-08-08 05:54:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (756, 6, 139, 1, 0, 0, 0, '2024-08-08 05:54:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (757, 6, 140, 1, 0, 0, 0, '2024-08-08 05:54:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (758, 6, 141, 1, 0, 0, 0, '2024-08-08 05:54:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (759, 6, 142, 1, 1, 1, 1, '2024-08-08 05:54:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (760, 6, 143, 1, 0, 0, 0, '2024-08-08 05:54:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (761, 6, 144, 1, 0, 0, 0, '2024-08-02 10:42:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (762, 6, 145, 1, 0, 0, 0, '2024-08-02 10:42:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (766, 6, 196, 1, 0, 0, 0, '2024-08-02 10:42:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (768, 6, 198, 1, 0, 0, 0, '2024-08-02 10:42:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (781, 6, 149, 1, 0, 0, 0, '2024-08-02 10:42:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (782, 6, 150, 1, 0, 0, 0, '2024-08-02 10:42:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (785, 6, 257, 1, 0, 0, 0, '2024-08-02 10:42:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (787, 6, 163, 1, 0, 0, 0, '2024-08-02 10:42:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (788, 6, 164, 1, 0, 0, 0, '2024-08-02 10:42:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (798, 8, 134, 1, 1, 1, 0, '2024-08-03 05:26:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (799, 8, 136, 1, 1, 1, 0, '2024-08-03 05:26:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (800, 8, 137, 1, 1, 1, 0, '2024-08-03 05:26:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (802, 8, 140, 1, 1, 1, 0, '2024-08-03 05:26:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (803, 8, 141, 1, 1, 1, 0, '2024-08-03 05:26:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (804, 8, 142, 1, 1, 1, 0, '2024-08-03 05:26:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (805, 8, 193, 1, 0, 0, 0, '2024-08-03 05:26:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (806, 8, 195, 1, 0, 0, 0, '2024-08-03 05:26:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (807, 3, 146, 1, 1, 0, 0, '2024-08-05 08:58:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (808, 8, 153, 1, 0, 0, 0, '2024-08-03 09:21:06');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (811, 3, 148, 1, 0, 0, 0, '2024-08-05 07:10:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (813, 3, 200, 1, 0, 0, 0, '2024-08-05 07:10:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (814, 3, 201, 1, 0, 0, 0, '2024-08-05 07:10:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (817, 3, 227, 1, 0, 0, 0, '2024-08-05 07:10:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (818, 3, 180, 1, 0, 0, 0, '2024-08-05 07:50:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (819, 3, 181, 1, 0, 0, 0, '2024-08-05 07:50:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (820, 3, 170, 1, 0, 0, 0, '2024-08-05 09:01:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (821, 3, 240, 1, 1, 1, 1, '2024-08-05 11:52:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (822, 3, 236, 1, 0, 0, 0, '2024-08-05 12:06:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (823, 2, 135, 1, 0, 0, 0, '2024-08-06 05:04:40');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (824, 2, 248, 1, 0, 0, 0, '2024-08-06 05:06:35');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (825, 2, 139, 1, 0, 0, 0, '2024-08-06 05:06:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (826, 2, 201, 1, 0, 0, 0, '2024-08-06 05:08:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (828, 2, 228, 1, 0, 0, 0, '2024-08-06 05:23:39');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (829, 2, 149, 1, 0, 0, 0, '2024-08-06 05:37:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (830, 2, 257, 1, 0, 0, 0, '2024-08-06 05:37:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (831, 2, 152, 1, 0, 0, 0, '2024-08-06 05:37:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (832, 2, 163, 1, 0, 0, 0, '2024-08-06 05:37:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (833, 2, 153, 1, 0, 0, 0, '2024-08-06 05:39:25');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (834, 2, 165, 1, 0, 0, 0, '2024-08-06 09:58:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (835, 2, 166, 1, 0, 0, 0, '2024-08-06 09:58:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (839, 6, 214, 1, 1, 1, 0, '2024-08-06 10:22:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (840, 6, 215, 1, 1, 1, 0, '2024-08-06 10:22:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (842, 6, 241, 1, 1, 1, 0, '2024-08-06 10:22:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (844, 6, 118, 1, 0, 0, 0, '2024-08-06 10:23:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (845, 3, 257, 1, 0, 0, 0, '2024-08-06 11:25:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (846, 3, 260, 1, 0, 0, 0, '2024-08-06 11:25:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (847, 2, 192, 1, 0, 0, 0, '2024-08-06 12:12:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (850, 5, 176, 1, 1, 1, 1, '2024-08-07 12:13:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (851, 5, 203, 1, 1, 1, 1, '2024-08-07 12:13:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (852, 6, 36, 0, 0, 0, 0, '2024-08-08 06:19:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (853, 6, 86, 1, 0, 0, 0, '2024-08-08 08:05:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (854, 8, 80, 1, 1, 1, 1, '2024-08-12 11:43:06');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (855, 8, 258, 1, 0, 0, 0, '2024-08-12 11:54:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (856, 8, 259, 1, 0, 0, 0, '2024-08-12 11:54:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (857, 3, 147, 1, 0, 0, 0, '2024-08-12 11:57:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (858, 8, 147, 1, 0, 0, 0, '2024-08-13 05:26:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (859, 2, 197, 1, 0, 0, 0, '2024-08-13 07:22:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (865, 2, 262, 1, 0, 0, 0, '2024-08-13 07:30:34');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (866, 3, 90, 1, 0, 0, 0, '2024-08-13 07:34:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (868, 4, 90, 1, 0, 0, 0, '2024-08-13 07:36:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (870, 5, 90, 1, 0, 0, 0, '2024-08-13 07:36:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (872, 6, 90, 1, 0, 0, 0, '2024-08-13 07:39:26');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (873, 8, 90, 1, 0, 0, 0, '2024-08-13 07:39:46');


#
# TABLE STRUCTURE FOR: sch_settings
#

DROP TABLE IF EXISTS `sch_settings`;

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
  `superadmin_restriction` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lang_id` (`lang_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `sch_settings` (`id`, `name`, `email`, `phone`, `address`, `lang_id`, `dise_code`, `date_format`, `time_format`, `currency`, `currency_symbol`, `is_rtl`, `timezone`, `session_id`, `start_month`, `image`, `mini_logo`, `theme`, `credit_limit`, `opd_record_month`, `is_active`, `created_at`, `cron_secret_key`, `fee_due_days`, `doctor_restriction`, `superadmin_restriction`) VALUES (0, 'Drsmart', 'care@drsmart.3sd.com', '+9656789871', 'IRC Village', 4, 'Your Hospital Code', 'd-m-Y', '12-hour', 'JOD', 'JOD', 'disabled', 'Asia/Kolkata', NULL, '', '0.png', '0mini_logo.png', 'default.jpg', '20000', '1', 'no', '2024-08-16 07:36:29', '', 60, 'enabled', 'enabled');


#
# TABLE STRUCTURE FOR: send_notification
#

DROP TABLE IF EXISTS `send_notification`;

CREATE TABLE `send_notification` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `send_notification` (`id`, `title`, `publish_date`, `date`, `message`, `visible_student`, `visible_staff`, `visible_parent`, `created_by`, `created_id`, `is_active`, `created_at`) VALUES (1, 'Staff Notice', '2024-08-09', '2024-08-09', '<p>All staff are requested to come on sunday.</p>', 'No', 'Yes', 'No', 'admin', 1, 'no', '2024-08-09 07:36:35');


#
# TABLE STRUCTURE FOR: shift
#

DROP TABLE IF EXISTS `shift`;

CREATE TABLE `shift` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_from` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_to` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `shift` (`id`, `name`, `time_from`, `time_to`, `is_active`) VALUES (1, 'Morning', '6:00 AM', '02:00 PM', 1);
INSERT INTO `shift` (`id`, `name`, `time_from`, `time_to`, `is_active`) VALUES (2, 'Noon', '2:00 PM', '10:00 PM', 1);
INSERT INTO `shift` (`id`, `name`, `time_from`, `time_to`, `is_active`) VALUES (3, 'Evening', '4:00 PM', '12:00 AM', 1);
INSERT INTO `shift` (`id`, `name`, `time_from`, `time_to`, `is_active`) VALUES (4, 'Night', '10:00 PM', '6:00 AM', 1);


#
# TABLE STRUCTURE FOR: sms_config
#

DROP TABLE IF EXISTS `sms_config`;

CREATE TABLE `sms_config` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: source
#

DROP TABLE IF EXISTS `source`;

CREATE TABLE `source` (
  `id` int NOT NULL AUTO_INCREMENT,
  `source` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

INSERT INTO `source` (`id`, `source`, `description`) VALUES (1, 'Online Advertising', 'Online advertising, also known as online marketing, Internet advertising, digital advertising or web advertising, is a form of marketing and advertising which uses the Internet to deliver promotional marketing messages to consumers.');
INSERT INTO `source` (`id`, `source`, `description`) VALUES (2, 'From visitors', 'Visitor centers used to provide fairly basic information about the place, corporation or event they are celebrating, acting more as the entry way to a place. The role of the visitor center has been rapidly evolving over the past 10 years to become more of an experience and to tell the story of the place or brand it represents. Many have become destinations and experiences in their own right.');
INSERT INTO `source` (`id`, `source`, `description`) VALUES (3, 'Front Office', '');


#
# TABLE STRUCTURE FOR: staff
#

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `email` varchar(200) NOT NULL,
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
  `Night` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `Morning`, `Noon`, `Evening`, `Night`) VALUES (1, '', 'select', '', '', '', '', 'Super Admin', '', '', '', '+9625523488', '+9625523488', 'admin@drsmart.com', '1990-06-08', 'Married', '2024-08-20', '0000-00-00', '', '', '', '1.png', '$2y$10$HMUD0J2syBaggR1BdQZ4NOUpl4zXl0XNK63DVD6yk7jW04A8A8JzG', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0);
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `Morning`, `Noon`, `Evening`, `Night`) VALUES (2, '1001', '4', '4', 'BA', '2 years', '', 'Layla', 'Hassan', 'Omar Hassan', 'Aisha Hassan', '+9625523456', '+9625523456', 'receptionist@drsmart.com', '2000-06-06', 'Single', '2021-06-10', '0000-00-00', '5678 Al Falah Street, Dubai, UAE', '5678 Al Falah Street, Dubai, UAE', '', '2.png', '$2y$10$Se0chW7lCyJ2c2mbGC7aKuXWo5a4YPvW5OGuAVDZxHWv6pXLtIxmy', 'Female', 'B+', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0);
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `Morning`, `Noon`, `Evening`, `Night`) VALUES (3, '1002', '2', '10', 'MBBS', '5 year', 'Medicine', 'Ahmed', 'Al-Masri', 'Mohammed Al-Masri', 'Fatima Al-Masri', '+9625012345', '+9625012345', 'doctor@drsmart.com', '1996-03-12', 'Married', '2020-03-19', '0000-00-00', '1234 Al Wahda Street, Abu Dhabi, UAE', '1234 Al Wahda Street, Abu Dhabi, UAE', 'ok', '', '$2y$10$BIN0ZUIyuxljyjJNW8AVdOj7NHNrRKMLaB17cvlScENwEKpbVD0Se', 'Male', 'AB+', '', '', '', '', '', '', '  cc bcv', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0);
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `Morning`, `Noon`, `Evening`, `Night`) VALUES (4, '1003', '7', '10', 'MBBS', '4 year', 'Surgery ', 'Khaled', 'Nasser', 'Youssef Nasser', 'Hanan Nasser', '+9625234567', '', 'khaled@drsmart.com', '1999-02-10', 'Single', '2021-11-09', '0000-00-00', '9101 Al Khalidiya Street, Sharjah, UAE', '9101 Al Khalidiya Street, Sharjah, UAE', 'ok', '', '$2y$10$z61JyIiWDzKUo.a2kCajJOODLXOmSMpNGO3kk0eHXV9s85KvTgJOS', 'Male', 'B+', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0);
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `Morning`, `Noon`, `Evening`, `Night`) VALUES (5, '1004', '3', '10', 'MS', '3 year', 'Child specialist', 'Noor', 'Abdullah', 'Saeed Abdullah', 'Reem Abdullah', '+9625645678', '', 'noor@drsmart.com', '2002-09-11', 'Single', '2024-02-02', '0000-00-00', '1122 Al Majaz Street, Ajman, UAE', '1122 Al Majaz Street, Ajman, UAE', 'ok', '', '$2y$10$tsmfQJxuwC6ghHSkZmIvlOKXx3zlMlbMquVHIeBcd9rr5REy2pogO', 'Female', 'A-', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0);
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `Morning`, `Noon`, `Evening`, `Night`) VALUES (6, '1005', '2', '10', 'MS,MBBS', '10 years', 'Neurologist ', 'Sami', 'Al-Harbi', 'Hassan Al-Harbi', 'Salma Al-Harbi', '+9625456789', '', 'sami@drsmart.com', '1989-07-12', 'Married', '2019-04-27', '0000-00-00', '3344 Al Qusais Street, Dubai, UAE', '3344 Al Qusais Street, Dubai, UAE', 'ok', '', '$2y$10$EBWizpdQsn5gTdmQe1uCaORoeBXgVBY.i5DPD6OsKPIj51rOMyFJq', 'Male', 'AB+', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0);
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `Morning`, `Noon`, `Evening`, `Night`) VALUES (7, '1006', '2', '10', 'MBBS', '2 year', 'Cardiology', 'Amina', 'Saeed', 'Khalil Saeed', 'Nadia Saeed', '+9625867890', '', 'amina@drsmart.com', '1997-03-12', 'Single', '2023-12-19', '0000-00-00', '5566 Al Rigga Street, Abu Dhabi, UAE', '5566 Al Rigga Street, Abu Dhabi, UAE', 'ok', '', '$2y$10$rD94UDL/AjQ6XlBBWtVcsORL7OP/GbY/KPC7o9E3fWpBklKePZlVC', 'Female', 'O-', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0);
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `Morning`, `Noon`, `Evening`, `Night`) VALUES (8, '1007', '10', '5', 'BCOM', '3 years', '', 'Omar', 'Zayed', 'Faisal Zayed', 'Layla Zayed', '+9625078901', '', 'accountant@drsmart.com', '1990-08-13', 'Married', '2016-03-17', '0000-00-00', '7788 Al Nahda Street, Sharjah, UAE', '7788 Al Nahda Street, Sharjah, UAE', '', '', '$2y$10$SPyOb/6EhkGBjEBkwWgh3O2YLZkArUlVBFs4PcXhWKyE6Smh0hgiS', 'Male', 'B+', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0);
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `Morning`, `Noon`, `Evening`, `Night`) VALUES (9, '1008', '3', '8', 'Nursing', '2 years', '', 'Hala', 'Jaber', 'Tariq Jaber', 'Samira Jaber', '+9625589012', '', 'nurse@drsmart.com', '2001-02-14', 'Single', '2019-02-20', '0000-00-00', '9900 Al Garhoud Street, Dubai, UAE', '9900 Al Garhoud Street, Dubai, UAE', '', '', '$2y$10$3PjfmuLQX3ZsQGFdq9Pp2eeppVMuh0zhCqtJD6LbjHauxNtjpgBJ2', 'Female', 'A+', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0);
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `Morning`, `Noon`, `Evening`, `Night`) VALUES (10, '1009', '5', '18', 'Diploma in Pharmacy', '6 years', '', 'Nabil', 'Faris', 'Mahmoud Faris', 'Khadija Faris', '+962290123', '', 'pharmacist@drsmart.com', '1994-10-18', 'Married', '2023-08-23', '0000-00-00', '1123 Al Barsha Street, Abu Dhabi, UAE', '1123 Al Barsha Street, Abu Dhabi, UAE', '', '', '$2y$10$JgvpT7T0DnnkLGWGfkiAKecn3nWEheXXPTSVQwOaDMKNMbOSvt2zu', 'Male', 'O+', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0);
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `Morning`, `Noon`, `Evening`, `Night`) VALUES (11, '1010', '1', '12', 'B.Sc clinical laboratory Technology', '2.5 years', '', 'Salma', 'Kamel', 'Ibrahim Kamel', 'Noor Kamel', '+9625601234', '', 'lab@drsmart.com', '1998-10-20', 'Married', '2020-05-14', '0000-00-00', '3345 Al Satwa Street, Dubai, UAE', '3345 Al Satwa Street, Dubai, UAE', '', '', '$2y$10$PWUvpfhbNKSt0kWII32oo.Wqvg3tWlN8Q9MZqEPgV8hbR5A28OW6m', 'Female', 'AB+', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0);
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `Morning`, `Noon`, `Evening`, `Night`) VALUES (13, '1011', '4', '4', '', '', '', 'Kharid', 'Khan', 'Juber Khan', 'Nagma Khan', '+9625678907', '+9625678907', 'Kharid123@gmail.com', '2001-02-28', 'Single', '2024-08-01', '0000-00-00', '', '', '', '', '$2y$10$6gqpAxYd6h1j02FgqSXBUODRw2b8ujlrk5veen8HFFn6SCuttUorO', 'Male', 'B+', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', 0, 0, 0, 0);


#
# TABLE STRUCTURE FOR: staff_attendance
#

DROP TABLE IF EXISTS `staff_attendance`;

CREATE TABLE `staff_attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `staff_id` int NOT NULL,
  `staff_attendance_type_id` int NOT NULL,
  `remark` varchar(200) NOT NULL,
  `is_active` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (1, '2024-08-16', 8, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (2, '2024-08-16', 3, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (3, '2024-08-16', 4, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (4, '2024-08-16', 5, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (5, '2024-08-16', 6, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (6, '2024-08-16', 7, 1, '', 0, '0000-00-00 00:00:00', 0);


#
# TABLE STRUCTURE FOR: staff_attendance_type
#

DROP TABLE IF EXISTS `staff_attendance_type`;

CREATE TABLE `staff_attendance_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `key_value` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`) VALUES (1, 'Present', '<b class=\"text text-success\">P</b>', 'yes', '0000-00-00 00:00:00');
INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`) VALUES (2, 'Late', '<b class=\"text text-warning\">L</b>', 'yes', '0000-00-00 00:00:00');
INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`) VALUES (3, 'Absent', '<b class=\"text text-danger\">A</b>', 'yes', '0000-00-00 00:00:00');
INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`) VALUES (4, 'Half Day', '<b class=\"text text-warning\">F</b>', 'yes', '2018-05-07 01:56:16');
INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`) VALUES (5, 'Holiday', 'H', 'yes', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: staff_designation
#

DROP TABLE IF EXISTS `staff_designation`;

CREATE TABLE `staff_designation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` int NOT NULL,
  `designation` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;

INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (1, 3, 'Prof', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (2, 3, 'ASSOCIATE PROF', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (3, 7, 'ADMIN', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (4, 8, 'Front Desk Executive', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (5, 2, 'Accounts Manager', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (6, 6, 'WARD BOY', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (7, 6, 'WARD GIRL', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (8, 6, 'Staff Nurse', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (9, 6, 'HEAD NURSE', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (10, 3, 'Specialist', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (11, 5, 'ATTENDANT', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (12, 5, 'Medical Laboratory Technician', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (13, 5, 'LAB HEAD', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (14, 5, 'LAB NURSE', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (15, 5, 'SAMPLE COLLECTOR', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (16, 2, 'BILL COLLECTOR', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (17, 1, 'SUPERVISOR', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (18, 4, 'Clinical Pharmacist', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (19, 0, 'BLOOD BANK STAFF', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (20, 3, 'OPD STAFF', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (21, 3, 'IPD STAFF', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (22, 4, 'PHARMACY STAFF', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (23, 0, 'PATHOLOGY STAFF', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (24, 3, 'OPERATION THEATER STAFF', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (25, 1, 'Administrative Assistant', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (26, 3, 'Medical Officer', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (27, 3, 'General Practitioner', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (28, 2, 'Financial Analyst', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (29, 2, 'Billing Specialist', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (30, 6, 'Registered Nurse', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (31, 6, 'Nurse Practitioner', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (32, 4, 'Pharmacy Technician', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (33, 4, 'Pharmacy Manager', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (34, 5, 'Clinical Laboratory Scientist', 'yes');
INSERT INTO `staff_designation` (`id`, `role`, `designation`, `is_active`) VALUES (35, 5, 'Lab Technologist', 'yes');


#
# TABLE STRUCTURE FOR: staff_leave_details
#

DROP TABLE IF EXISTS `staff_leave_details`;

CREATE TABLE `staff_leave_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int NOT NULL,
  `leave_type_id` int NOT NULL,
  `alloted_leave` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb3;

INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (1, 2, 1, '6');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (2, 2, 2, '5');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (3, 2, 3, '5');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (4, 2, 4, '6');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (5, 2, 5, '7');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (6, 2, 6, '20');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (7, 2, 7, '10');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (8, 3, 1, '6');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (9, 3, 2, '5');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (10, 3, 3, '5');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (11, 3, 4, '6');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (12, 3, 5, '7');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (13, 3, 6, '20');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (14, 3, 7, '10');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (15, 4, 1, '6');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (16, 4, 2, '5');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (17, 4, 3, '5');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (18, 4, 4, '6');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (19, 4, 5, '7');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (20, 4, 6, '20');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (21, 4, 7, '10');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (22, 5, 1, '6');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (23, 5, 2, '5');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (24, 5, 3, '5');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (25, 5, 4, '6');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (26, 5, 5, '7');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (27, 5, 6, '20');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (28, 5, 7, '10');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (29, 6, 1, '6');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (30, 6, 2, '5');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (31, 6, 3, '5');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (32, 6, 4, '6');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (33, 6, 5, '7');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (34, 6, 6, '20');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (35, 6, 7, '10');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (36, 7, 1, '6');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (37, 7, 2, '5');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (38, 7, 3, '5');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (39, 7, 4, '6');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (40, 7, 5, '7');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (41, 7, 6, '20');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (42, 7, 7, '10');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (43, 8, 1, '6');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (44, 8, 2, '5');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (45, 8, 3, '5');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (46, 8, 4, '6');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (47, 8, 5, '7');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (48, 8, 6, '20');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (49, 8, 7, '10');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (50, 9, 1, '6');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (51, 9, 2, '5');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (52, 9, 3, '5');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (53, 9, 4, '6');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (54, 9, 5, '7');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (55, 9, 6, '20');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (56, 9, 7, '10');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (57, 10, 1, '6');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (58, 10, 2, '5');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (59, 10, 3, '5');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (60, 10, 4, '6');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (61, 10, 5, '7');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (62, 10, 6, '20');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (63, 10, 7, '10');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (64, 11, 1, '6');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (65, 11, 2, '5');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (66, 11, 3, '5');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (67, 11, 4, '6');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (68, 11, 5, '7');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (69, 11, 6, '20');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (70, 11, 7, '10');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (85, 12, 1, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (86, 12, 2, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (87, 12, 3, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (88, 12, 4, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (89, 12, 5, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (90, 12, 6, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (91, 12, 7, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (92, 13, 1, '6');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (93, 13, 2, '5');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (94, 13, 3, '5');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (95, 13, 4, '6');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (96, 13, 5, '7');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (97, 13, 6, '20');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (98, 13, 7, '10');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (99, 1, 1, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (100, 1, 2, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (101, 1, 3, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (102, 1, 4, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (103, 1, 5, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (104, 1, 6, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (105, 1, 7, '');


#
# TABLE STRUCTURE FOR: staff_leave_request
#

DROP TABLE IF EXISTS `staff_leave_request`;

CREATE TABLE `staff_leave_request` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

INSERT INTO `staff_leave_request` (`id`, `staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (1, 9, 1, '2024-08-10', '2024-08-12', 3, '', '', 'approve', 'Hala', '', '2024-08-16');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (2, 9, 1, '2024-09-04', '2024-09-07', 4, '', '', 'disapprove', 'Hala', '', '2024-08-16');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (3, 9, 1, '2024-08-16', '2024-08-19', 4, '', '', 'pending', 'Hala', '', '2024-08-16');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (4, 9, 7, '2024-08-16', '2024-08-25', 10, '', '', 'approve', 'Hala', '', '2024-08-16');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (5, 8, 1, '2024-08-15', '2024-08-17', 3, '', '', 'approve', 'Super Admin', '', '2024-08-17');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (6, 3, 1, '2024-08-21', '2024-08-22', 2, 'operation', 'ok', 'approve', 'Super Admin', '', '2024-08-21');


#
# TABLE STRUCTURE FOR: staff_payroll
#

DROP TABLE IF EXISTS `staff_payroll`;

CREATE TABLE `staff_payroll` (
  `id` int NOT NULL AUTO_INCREMENT,
  `basic_salary` int NOT NULL,
  `pay_scale` varchar(200) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: staff_payslip
#

DROP TABLE IF EXISTS `staff_payslip`;

CREATE TABLE `staff_payslip` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `payment_date` date NOT NULL,
  `remark` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

INSERT INTO `staff_payslip` (`id`, `staff_id`, `basic`, `total_allowance`, `total_deduction`, `leave_deduction`, `tax`, `net_salary`, `status`, `month`, `year`, `payment_mode`, `payment_date`, `remark`) VALUES (4, 4, 0, 0, 0, 0, '0.00', '0.00', 'generated', 'July', '2024', '', '2024-08-16', '');
INSERT INTO `staff_payslip` (`id`, `staff_id`, `basic`, `total_allowance`, `total_deduction`, `leave_deduction`, `tax`, `net_salary`, `status`, `month`, `year`, `payment_mode`, `payment_date`, `remark`) VALUES (5, 5, 0, 0, 0, 0, '0.00', '222.00', 'generated', 'July', '2024', '', '2024-08-17', '');
INSERT INTO `staff_payslip` (`id`, `staff_id`, `basic`, `total_allowance`, `total_deduction`, `leave_deduction`, `tax`, `net_salary`, `status`, `month`, `year`, `payment_mode`, `payment_date`, `remark`) VALUES (6, 11, 0, 0, 0, 0, '0.00', '8.00', 'generated', 'April', '2024', '', '2024-08-17', '');
INSERT INTO `staff_payslip` (`id`, `staff_id`, `basic`, `total_allowance`, `total_deduction`, `leave_deduction`, `tax`, `net_salary`, `status`, `month`, `year`, `payment_mode`, `payment_date`, `remark`) VALUES (7, 6, 45000, 0, 0, 0, '10360.00', '34650.00', 'paid', 'July', '2024', 'Cash', '2024-08-21', '');
INSERT INTO `staff_payslip` (`id`, `staff_id`, `basic`, `total_allowance`, `total_deduction`, `leave_deduction`, `tax`, `net_salary`, `status`, `month`, `year`, `payment_mode`, `payment_date`, `remark`) VALUES (10, 2, 7000, 100, 220, 0, '700.00', '6180.00', 'paid', 'July', '2024', 'Online', '2024-08-20', '');


#
# TABLE STRUCTURE FOR: staff_roles
#

DROP TABLE IF EXISTS `staff_roles`;

CREATE TABLE `staff_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `is_active` int DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (1, 7, 1, 0, '2020-07-17 09:02:35');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (2, 8, 2, 0, '2024-08-02 10:21:26');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (3, 3, 3, 0, '2024-08-02 10:28:20');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (4, 3, 4, 0, '2024-08-02 10:31:37');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (5, 3, 5, 0, '2024-08-02 10:34:58');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (6, 3, 6, 0, '2024-08-02 10:37:59');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (7, 3, 7, 0, '2024-08-02 10:41:21');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (8, 2, 8, 0, '2024-08-02 10:44:40');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (9, 6, 9, 0, '2024-08-02 10:49:16');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (10, 4, 10, 0, '2024-08-02 10:56:09');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (11, 5, 11, 0, '2024-08-02 10:59:56');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (14, 6, 12, 0, '2024-08-06 10:50:07');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (15, 8, 13, 0, '2024-08-07 13:01:25');


#
# TABLE STRUCTURE FOR: staff_timeline
#

DROP TABLE IF EXISTS `staff_timeline`;

CREATE TABLE `staff_timeline` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` varchar(300) NOT NULL,
  `document` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: supplier_bill_basic
#

DROP TABLE IF EXISTS `supplier_bill_basic`;

CREATE TABLE `supplier_bill_basic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `purchase_no` varchar(200) NOT NULL,
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
  `note` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

INSERT INTO `supplier_bill_basic` (`id`, `purchase_no`, `date`, `supplier_id`, `supplier_name`, `file`, `total`, `discount_percent`, `tax_percent`, `tax`, `discount`, `net_amount`, `note`, `created_at`) VALUES (1, '1', '2024-08-17 10:49:00', 3, 'Ali Fadhul', '', '1800.00', '0.00', '0.00', '162.00', '180.00', '1782.00', '', '2024-08-17 05:22:32');
INSERT INTO `supplier_bill_basic` (`id`, `purchase_no`, `date`, `supplier_id`, `supplier_name`, `file`, `total`, `discount_percent`, `tax_percent`, `tax`, `discount`, `net_amount`, `note`, `created_at`) VALUES (2, '2', '2024-08-17 10:57:00', 3, 'Ali Fadhul', '', '900.00', '0.00', '0.00', '15.09', '50.05', '865.04', '', '2024-08-17 05:32:05');


#
# TABLE STRUCTURE FOR: supplier_bill_detail
#

DROP TABLE IF EXISTS `supplier_bill_detail`;

CREATE TABLE `supplier_bill_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier_bill_basic_id` varchar(200) NOT NULL,
  `medicine_category_id` varchar(200) NOT NULL,
  `medicine_name` varchar(200) NOT NULL,
  `expire_date` varchar(100) NOT NULL,
  `batch_no` varchar(200) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `purchase_price` varchar(200) NOT NULL,
  `mrp` varchar(200) NOT NULL,
  `sale_price` varchar(200) NOT NULL,
  `amount` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: supplier_category
#

DROP TABLE IF EXISTS `supplier_category`;

CREATE TABLE `supplier_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier_category` varchar(200) NOT NULL,
  `contact` varchar(200) NOT NULL,
  `supplier_person` varchar(200) NOT NULL,
  `supplier_person_contact` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

INSERT INTO `supplier_category` (`id`, `supplier_category`, `contact`, `supplier_person`, `supplier_person_contact`, `address`) VALUES (1, 'Kampala Pharmaceutical Industries (KPI) Ltd.', '+96552 28575', 'Abdullah Ssekimwanyi', '+9626 285 645', 'Plot: M444B Stretcher Road, Ntinda, P.O Box 7551, Kampala, Uganda');
INSERT INTO `supplier_category` (`id`, `supplier_category`, `contact`, `supplier_person`, `supplier_person_contact`, `address`) VALUES (2, 'Lifeway Pharmaceutical Industries Ltd', '+256 (752) 972775', 'Angelina Atyam', '+256 (788) 801819', 'Nangwa Village-Nama Subcounty, Mukono District, Kampala, Uganda, P.O. Box 525, Mukono');
INSERT INTO `supplier_category` (`id`, `supplier_category`, `contact`, `supplier_person`, `supplier_person_contact`, `address`) VALUES (3, 'Cipla Quality Chemical Industries Ltd.', '+256 312 341 100', 'Ali Fadhul', '+256-414254273', 'Plot 1-7, 1st Ring Road, Luzira Industrial Park, P.O Box 34871, Kampala, Uganda');


#
# TABLE STRUCTURE FOR: system_notification
#

DROP TABLE IF EXISTS `system_notification`;

CREATE TABLE `system_notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `notification_title` varchar(200) NOT NULL,
  `notification_type` varchar(200) NOT NULL,
  `notification_desc` varchar(200) NOT NULL,
  `notification_for` varchar(200) NOT NULL,
  `receiver_id` int NOT NULL,
  `date` datetime NOT NULL,
  `is_active` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb3;

INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (1, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/appointment\'>Yousef Al-Shamari</a>', 'Patient', 43, '2024-08-14 15:07:38', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (2, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveappointment/1\'>Yousef Al-Shamari</a>', 'Super Admin', 0, '2024-08-14 15:07:38', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (3, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveappointment/1\'>Yousef Al-Shamari</a>', 'Doctor', 3, '2024-08-14 15:07:38', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (4, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN1</a>', 'Patient', 43, '2024-08-14 15:07:48', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (5, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/43/1\'>OPDN1</a>', 'Super Admin', 0, '2024-08-14 15:07:48', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (6, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/43/1\'>OPDN1</a>', 'Doctor', 3, '2024-08-14 15:07:48', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (7, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/appointment\'>Amir Al-Husseini</a>', 'Patient', 0, '2024-08-16 10:23:38', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (8, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveappointment/2\'>Amir Al-Husseini</a>', 'Super Admin', 0, '2024-08-16 10:23:38', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (9, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/appointment\'>Amir Al-Husseini</a>', 'Patient', 0, '2024-08-16 10:23:48', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (10, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveappointment/2\'>Amir Al-Husseini</a>', 'Super Admin', 0, '2024-08-16 10:23:48', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (11, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveappointment/2\'>Amir Al-Husseini</a>', 'Doctor', 3, '2024-08-16 10:23:48', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (12, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/ipdprofile\'>IPDN1</a>', 'Patient', 44, '2024-08-16 10:48:49', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (13, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveipdnotification/44/1\'>IPDN1</a>', 'Super Admin', 0, '2024-08-16 10:48:49', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (14, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveipdnotification/44/1\'>IPDN1</a>', 'Doctor', 3, '2024-08-16 10:48:49', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (15, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/otsearch\' onclick=\'<onchngfun>\'>Madhusudan Jena</a>', 'Patient', 24, '2024-08-16 10:50:09', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (16, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveotpatient/1/24\' onclick=\'<onchngfun>\'>Madhusudan Jena</a>', 'Super Admin', 0, '2024-08-16 10:50:09', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (17, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveotpatient/1/24\' onclick=\'<onchngfun>\'>Madhusudan Jena</a>', 'Doctor', 3, '2024-08-16 10:50:09', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (18, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/otsearch\' onclick=\'<onchngfun>\'>Amir Al-Husseini</a>', 'Patient', 44, '2024-08-16 11:12:33', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (19, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveotpatient/2/44\' onclick=\'<onchngfun>\'>Amir Al-Husseini</a>', 'Super Admin', 0, '2024-08-16 11:12:33', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (20, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveotpatient/2/44\' onclick=\'<onchngfun>\'>Amir Al-Husseini</a>', 'Doctor', 3, '2024-08-16 11:12:33', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (21, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/ipdprofile\'>IPDN2</a>', 'Patient', 43, '2024-08-16 12:17:14', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (22, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveipdnotification/43/2\'>IPDN2</a>', 'Super Admin', 0, '2024-08-16 12:17:14', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (23, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveipdnotification/43/2\'>IPDN2</a>', 'Doctor', 3, '2024-08-16 12:17:14', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (24, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/appointment\'>Abdullah Al-Sarhan</a>', 'Patient', 0, '2024-08-16 12:47:06', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (25, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveappointment/3\'>Abdullah Al-Sarhan</a>', 'Super Admin', 0, '2024-08-16 12:47:06', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (26, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/appointment\'>Abdullah Al-Sarhan</a>', 'Patient', 0, '2024-08-16 12:49:11', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (27, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveappointment/3\'>Abdullah Al-Sarhan</a>', 'Super Admin', 0, '2024-08-16 12:49:11', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (28, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveappointment/3\'>Abdullah Al-Sarhan</a>', 'Doctor', 3, '2024-08-16 12:49:11', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (29, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN2</a>', 'Patient', 45, '2024-08-16 13:02:54', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (30, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/2\'>OPDN2</a>', 'Super Admin', 0, '2024-08-16 13:02:54', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (31, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/2\'>OPDN2</a>', 'Doctor', 3, '2024-08-16 13:02:54', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (32, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/ipdprofile\'>IPDN3</a>', 'Patient', 43, '2024-08-16 13:05:15', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (33, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveipdnotification/43/3\'>IPDN3</a>', 'Super Admin', 0, '2024-08-16 13:05:15', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (34, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveipdnotification/43/3\'>IPDN3</a>', 'Doctor', 3, '2024-08-16 13:05:15', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (35, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN3</a>', 'Patient', 44, '2024-08-16 13:11:22', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (36, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/44/3\'>OPDN3</a>', 'Super Admin', 0, '2024-08-16 13:11:22', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (37, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/44/3\'>OPDN3</a>', 'Doctor', 3, '2024-08-16 13:11:22', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (38, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN4</a>', 'Patient', 45, '2024-08-16 13:14:20', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (39, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/4\'>OPDN4</a>', 'Super Admin', 0, '2024-08-16 13:14:20', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (40, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/4\'>OPDN4</a>', 'Doctor', 3, '2024-08-16 13:14:20', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (41, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN5</a>', 'Patient', 45, '2024-08-16 13:14:22', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (42, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/5\'>OPDN5</a>', 'Super Admin', 0, '2024-08-16 13:14:22', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (43, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/5\'>OPDN5</a>', 'Doctor', 3, '2024-08-16 13:14:22', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (44, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN6</a>', 'Patient', 45, '2024-08-16 13:15:18', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (45, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/6\'>OPDN6</a>', 'Super Admin', 0, '2024-08-16 13:15:18', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (46, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/6\'>OPDN6</a>', 'Doctor', 3, '2024-08-16 13:15:18', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (47, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/appointment\'>Rami Al-Ahmad</a>', 'Patient', 0, '2024-08-16 15:09:52', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (48, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveappointment/4\'>Rami Al-Ahmad</a>', 'Super Admin', 0, '2024-08-16 15:09:52', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (49, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveappointment/4\'>Rami Al-Ahmad</a>', 'Doctor', 3, '2024-08-16 15:09:52', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (50, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN7</a>', 'Patient', 45, '2024-08-16 15:16:59', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (51, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/7\'>OPDN7</a>', 'Super Admin', 0, '2024-08-16 15:16:59', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (52, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/7\'>OPDN7</a>', 'Doctor', 3, '2024-08-16 15:16:59', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (53, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN8</a>', 'Patient', 45, '2024-08-16 15:17:01', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (54, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/8\'>OPDN8</a>', 'Super Admin', 0, '2024-08-16 15:17:01', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (55, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/8\'>OPDN8</a>', 'Doctor', 3, '2024-08-16 15:17:01', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (56, 'Salary paid', 'salary', 'Salary Amount 90000.00 has been paid for Month July to <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/movesalarypay/3/3\'>Ahmed Al-Masri</a>', 'Doctor', 3, '2024-08-16 17:28:12', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (57, 'Salary paid', 'salary', 'Salary Amount 90000.00 has been paid for Month July to <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/movesalarypay/3/3\'>Ahmed Al-Masri</a>', 'Super Admin', 0, '2024-08-16 17:28:12', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (58, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN9</a>', 'Patient', 47, '2024-08-17 10:09:56', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (59, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/47/9\'>OPDN9</a>', 'Super Admin', 0, '2024-08-17 10:09:56', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (60, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/47/9\'>OPDN9</a>', 'Doctor', 3, '2024-08-17 10:09:56', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (61, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN10</a>', 'Patient', 45, '2024-08-17 10:14:34', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (62, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/10\'>OPDN10</a>', 'Super Admin', 0, '2024-08-17 10:14:34', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (63, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/10\'>OPDN10</a>', 'Doctor', 3, '2024-08-17 10:14:34', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (64, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN11</a>', 'Patient', 47, '2024-08-17 10:16:12', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (65, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/47/11\'>OPDN11</a>', 'Super Admin', 0, '2024-08-17 10:16:12', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (66, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/47/11\'>OPDN11</a>', 'Doctor', 3, '2024-08-17 10:16:12', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (67, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN12</a>', 'Patient', 47, '2024-08-17 10:17:05', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (68, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/47/12\'>OPDN12</a>', 'Super Admin', 0, '2024-08-17 10:17:05', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (69, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/47/12\'>OPDN12</a>', 'Doctor', 3, '2024-08-17 10:17:05', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (70, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN13</a>', 'Patient', 46, '2024-08-17 10:24:07', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (71, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/46/13\'>OPDN13</a>', 'Super Admin', 0, '2024-08-17 10:24:07', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (72, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/46/13\'>OPDN13</a>', 'Doctor', 3, '2024-08-17 10:24:07', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (73, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/ipdprofile\'>IPDN4</a>', 'Patient', 45, '2024-08-17 10:26:18', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (74, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveipdnotification/45/4\'>IPDN4</a>', 'Super Admin', 0, '2024-08-17 10:26:18', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (75, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveipdnotification/45/4\'>IPDN4</a>', 'Doctor', 3, '2024-08-17 10:26:18', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (76, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/appointment\'>Yagyaseni</a>', 'Patient', 35, '2024-08-17 11:01:51', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (77, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveappointment/5\'>Yagyaseni</a>', 'Super Admin', 0, '2024-08-17 11:01:51', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (78, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN14</a>', 'Patient', 48, '2024-08-17 11:07:02', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (79, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/48/14\'>OPDN14</a>', 'Super Admin', 0, '2024-08-17 11:07:02', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (80, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/48/14\'>OPDN14</a>', 'Doctor', 5, '2024-08-17 11:07:03', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (81, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN15</a>', 'Patient', 48, '2024-08-17 11:09:03', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (82, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/48/15\'>OPDN15</a>', 'Super Admin', 0, '2024-08-17 11:09:03', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (83, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/48/15\'>OPDN15</a>', 'Doctor', 5, '2024-08-17 11:09:03', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (84, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN16</a>', 'Patient', 48, '2024-08-17 11:32:05', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (85, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/48/16\'>OPDN16</a>', 'Super Admin', 0, '2024-08-17 11:32:05', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (86, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/48/16\'>OPDN16</a>', 'Doctor', 5, '2024-08-17 11:32:05', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (87, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/otsearch\' onclick=\'<onchngfun>\'>Amir Al-Husseini</a>', 'Patient', 44, '2024-08-17 11:52:45', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (88, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveotpatient/3/44\' onclick=\'<onchngfun>\'>Amir Al-Husseini</a>', 'Super Admin', 0, '2024-08-17 11:52:45', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (89, 'Operation Theatre Visit Created', 'ot', 'OT Visit has been created for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveotpatient/3/44\' onclick=\'<onchngfun>\'>Amir Al-Husseini</a>', 'Doctor', 3, '2024-08-17 11:52:45', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (90, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN17</a>', 'Patient', 44, '2024-08-17 12:40:28', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (91, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/44/17\'>OPDN17</a>', 'Super Admin', 0, '2024-08-17 12:40:28', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (92, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/44/17\'>OPDN17</a>', 'Doctor', 3, '2024-08-17 12:40:28', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (93, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/ipdprofile\'>IPDN5</a>', 'Patient', 46, '2024-08-17 12:42:40', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (94, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveipdnotification/46/5\'>IPDN5</a>', 'Super Admin', 0, '2024-08-17 12:42:40', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (95, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveipdnotification/46/5\'>IPDN5</a>', 'Doctor', 3, '2024-08-17 12:42:40', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (96, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN18</a>', 'Patient', 45, '2024-08-17 12:53:40', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (97, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/18\'>OPDN18</a>', 'Super Admin', 0, '2024-08-17 12:53:40', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (98, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/18\'>OPDN18</a>', 'Doctor', 3, '2024-08-17 12:53:40', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (99, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/ipdprofile\'>IPDN6</a>', 'Patient', 47, '2024-08-17 12:58:50', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (100, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveipdnotification/47/6\'>IPDN6</a>', 'Super Admin', 0, '2024-08-17 12:58:50', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (101, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveipdnotification/47/6\'>IPDN6</a>', 'Doctor', 3, '2024-08-17 12:58:50', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (102, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN19</a>', 'Patient', 47, '2024-08-17 16:26:22', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (103, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/47/19\'>OPDN19</a>', 'Super Admin', 0, '2024-08-17 16:26:22', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (104, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/47/19\'>OPDN19</a>', 'Doctor', 3, '2024-08-17 16:26:22', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (105, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN20</a>', 'Patient', 20, '2024-08-17 16:27:24', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (106, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/20/20\'>OPDN20</a>', 'Super Admin', 0, '2024-08-17 16:27:24', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (107, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/20/20\'>OPDN20</a>', 'Doctor', 3, '2024-08-17 16:27:24', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (108, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN21</a>', 'Patient', 46, '2024-08-17 16:29:13', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (109, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/46/21\'>OPDN21</a>', 'Super Admin', 0, '2024-08-17 16:29:13', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (110, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/46/21\'>OPDN21</a>', 'Doctor', 3, '2024-08-17 16:29:13', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (111, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN22</a>', 'Patient', 4, '2024-08-17 16:30:16', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (112, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/4/22\'>OPDN22</a>', 'Super Admin', 0, '2024-08-17 16:30:16', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (113, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/4/22\'>OPDN22</a>', 'Doctor', 3, '2024-08-17 16:30:16', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (114, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/ipdprofile\'>IPDN7</a>', 'Patient', 4, '2024-08-19 14:54:24', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (115, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveipdnotification/4/7\'>IPDN7</a>', 'Super Admin', 0, '2024-08-19 14:54:24', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (116, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveipdnotification/4/7\'>IPDN7</a>', 'Doctor', 3, '2024-08-19 14:54:24', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (117, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/appointment\'>Sheikh Asif Noor</a>', 'Patient', 0, '2024-08-19 15:06:47', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (118, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveappointment/6\'>Sheikh Asif Noor</a>', 'Super Admin', 0, '2024-08-19 15:06:47', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (119, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveappointment/6\'>Sheikh Asif Noor</a>', 'Doctor', 3, '2024-08-19 15:06:47', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (120, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN23</a>', 'Patient', 49, '2024-08-19 15:09:58', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (121, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/49/23\'>OPDN23</a>', 'Super Admin', 0, '2024-08-19 15:09:58', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (122, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/49/23\'>OPDN23</a>', 'Doctor', 3, '2024-08-19 15:09:58', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (123, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN24</a>', 'Patient', 45, '2024-08-19 15:14:15', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (124, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/24\'>OPDN24</a>', 'Super Admin', 0, '2024-08-19 15:14:15', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (125, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/24\'>OPDN24</a>', 'Doctor', 3, '2024-08-19 15:14:15', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (126, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN25</a>', 'Patient', 49, '2024-08-19 15:15:45', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (127, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/49/25\'>OPDN25</a>', 'Super Admin', 0, '2024-08-19 15:15:45', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (128, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/49/25\'>OPDN25</a>', 'Doctor', 3, '2024-08-19 15:15:45', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (129, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/appointment\'>Madhusudan Jena</a>', 'Patient', 24, '2024-08-19 16:12:17', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (130, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveappointment/7\'>Madhusudan Jena</a>', 'Super Admin', 0, '2024-08-19 16:12:17', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (131, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveappointment/7\'>Madhusudan Jena</a>', 'Doctor', 3, '2024-08-19 16:12:17', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (132, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN26</a>', 'Patient', 45, '2024-08-20 11:49:31', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (133, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/26\'>OPDN26</a>', 'Super Admin', 0, '2024-08-20 11:49:31', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (134, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/26\'>OPDN26</a>', 'Doctor', 3, '2024-08-20 11:49:31', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (135, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN27</a>', 'Patient', 45, '2024-08-20 11:51:12', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (136, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/27\'>OPDN27</a>', 'Super Admin', 0, '2024-08-20 11:51:12', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (137, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/27\'>OPDN27</a>', 'Doctor', 3, '2024-08-20 11:51:12', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (138, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/ipdprofile\'>IPDN8</a>', 'Patient', 48, '2024-08-20 14:20:57', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (139, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveipdnotification/48/8\'>IPDN8</a>', 'Super Admin', 0, '2024-08-20 14:20:57', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (140, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveipdnotification/48/8\'>IPDN8</a>', 'Doctor', 3, '2024-08-20 14:20:57', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (141, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/appointment\'>Yagyaseni</a>', 'Patient', 35, '2024-08-20 14:22:07', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (142, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveappointment/5\'>Yagyaseni</a>', 'Super Admin', 0, '2024-08-20 14:22:07', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (143, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveappointment/5\'>Yagyaseni</a>', 'Doctor', 5, '2024-08-20 14:22:07', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (144, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/ipdprofile\'>IPDN9</a>', 'Patient', 35, '2024-08-20 14:22:55', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (145, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveipdnotification/35/9\'>IPDN9</a>', 'Super Admin', 0, '2024-08-20 14:22:55', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (146, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveipdnotification/35/9\'>IPDN9</a>', 'Doctor', 5, '2024-08-20 14:22:55', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (147, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/ipdprofile\'>IPDN10</a>', 'Patient', 49, '2024-08-20 14:44:51', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (148, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveipdnotification/49/10\'>IPDN10</a>', 'Super Admin', 0, '2024-08-20 14:44:51', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (149, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveipdnotification/49/10\'>IPDN10</a>', 'Doctor', 3, '2024-08-20 14:44:51', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (150, 'Salary paid', 'salary', 'Salary Amount 6180.00 has been paid for Month July to <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/movesalarypay/2/10\'>Layla Hassan</a>', 'Receptionist', 2, '2024-08-20 16:26:52', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (151, 'Salary paid', 'salary', 'Salary Amount 6180.00 has been paid for Month July to <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/movesalarypay/2/10\'>Layla Hassan</a>', 'Super Admin', 0, '2024-08-20 16:26:52', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (152, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN28</a>', 'Patient', 45, '2024-08-20 18:16:51', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (153, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/28\'>OPDN28</a>', 'Super Admin', 0, '2024-08-20 18:16:51', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (154, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/28\'>OPDN28</a>', 'Doctor', 3, '2024-08-20 18:16:51', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (155, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN29</a>', 'Patient', 45, '2024-08-20 18:17:33', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (156, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/29\'>OPDN29</a>', 'Super Admin', 0, '2024-08-20 18:17:33', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (157, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/29\'>OPDN29</a>', 'Doctor', 3, '2024-08-20 18:17:33', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (158, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/patient/dashboard/profile\'>OPDN30</a>', 'Patient', 45, '2024-08-21 09:58:54', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (159, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/30\'>OPDN30</a>', 'Super Admin', 0, '2024-08-21 09:58:54', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (160, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/moveopdnotification/45/30\'>OPDN30</a>', 'Doctor', 3, '2024-08-21 09:58:54', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (161, 'Salary paid', 'salary', 'Salary Amount 34650.00 has been paid for Month July to <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/movesalarypay/6/7\'>Sami Al-Harbi</a>', 'Doctor', 6, '2024-08-21 11:24:02', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (162, 'Salary paid', 'salary', 'Salary Amount 34650.00 has been paid for Month July to <a href=\'http://40.172.41.136/Hospital1/admin/systemnotification/movesalarypay/6/7\'>Sami Al-Harbi</a>', 'Super Admin', 0, '2024-08-21 11:24:03', 'yes');


#
# TABLE STRUCTURE FOR: test_type_report
#

DROP TABLE IF EXISTS `test_type_report`;

CREATE TABLE `test_type_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `radiology_id` int NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `test_name` varchar(100) DEFAULT NULL,
  `reporting_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `test_report` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: tpa_doctorcharges
#

DROP TABLE IF EXISTS `tpa_doctorcharges`;

CREATE TABLE `tpa_doctorcharges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `org_id` int NOT NULL,
  `charge_id` int NOT NULL,
  `org_charge` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `org_id` (`org_id`) USING BTREE,
  KEY `charge_id` (`charge_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;

INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (1, 2, 1, '600');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (2, 1, 1, '600');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (3, 2, 2, '600');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (4, 1, 2, '600');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (5, 2, 3, '600');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (6, 1, 3, '600');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (7, 2, 4, '600');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (8, 1, 4, '600');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (9, 2, 5, '600');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (10, 1, 5, '600');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (11, 3, 1, '700');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (12, 4, 1, '800');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (13, 5, 1, '1000');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (14, 6, 1, '500');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (15, 3, 2, '700');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (16, 4, 2, '800');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (17, 5, 2, '1000');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (18, 6, 2, '500');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (19, 3, 3, '700');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (20, 4, 3, '800');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (21, 5, 3, '1000');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (22, 6, 3, '500');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (23, 3, 4, '700');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (24, 4, 4, '800');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (25, 5, 4, '1000');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (26, 6, 4, '500');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (27, 3, 5, '700');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (28, 4, 5, '800');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (29, 5, 5, '1000');
INSERT INTO `tpa_doctorcharges` (`id`, `org_id`, `charge_id`, `org_charge`) VALUES (30, 6, 5, '500');


#
# TABLE STRUCTURE FOR: tpa_master
#

DROP TABLE IF EXISTS `tpa_master`;

CREATE TABLE `tpa_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `organisation` varchar(200) NOT NULL,
  `charge_id` int NOT NULL,
  `organisation_charge` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: userlog
#

DROP TABLE IF EXISTS `userlog`;

CREATE TABLE `userlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `ipaddress` varchar(100) DEFAULT NULL,
  `user_agent` varchar(500) DEFAULT NULL,
  `login_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb3;

INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (1, 'receptionist@drsmart.com', 'Receptionist', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-14 09:47:27');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 'receptionist@drsmart.com', 'Receptionist', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-14 12:09:22');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (3, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-14 12:15:20');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (4, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-14 12:35:12');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (5, 'receptionist@drsmart.com', 'Receptionist', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-14 12:36:06');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (6, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-14 12:39:50');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (7, 'receptionist@drsmart.com', 'Receptionist', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-14 12:47:46');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (8, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 04:41:53');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (9, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 04:49:47');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (10, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 04:51:59');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (11, 'nurse@drsmart.com', 'Nurse', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 05:05:54');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (12, 'nurse@drsmart.com', 'Nurse', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 05:06:27');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (13, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 05:12:45');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (14, 'nurse@drsmart.com', 'Nurse', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 05:20:19');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (15, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 05:25:37');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (16, 'nurse@drsmart.com', 'Nurse', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 05:30:27');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (17, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 05:39:25');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (18, 'nurse@drsmart.com', 'Nurse', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 05:43:39');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (19, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 06:10:55');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (20, 'nurse@drsmart.com', 'Nurse', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 06:14:32');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (21, 'nurse@drsmart.com', 'Nurse', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 06:15:05');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (22, 'receptionist@drsmart.com', 'Receptionist', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 06:59:11');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (23, 'doctor@drsmart.com', 'Doctor', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 07:14:28');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (24, 'admin@drsmart.com', 'Super Admin', '115.246.160.34', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 07:33:14');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (25, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 07:57:39');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (26, 'lab@drsmart.com', 'Lab Technician', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 10:10:51');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (27, 'accountant@drsmart.com', 'Accountant', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 10:59:24');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (28, 'accountant@drsmart.com', 'Accountant', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 11:31:27');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (29, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-16 12:40:07');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (30, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 04:11:26');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (31, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 04:21:54');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (32, 'receptionist@drsmart.com', 'Receptionist', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 04:29:38');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (33, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 04:30:07');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (34, 'accountant@drsmart.com', 'Accountant', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 04:44:00');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (35, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 05:19:20');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (36, 'doctor@drsmart.com', 'Doctor', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 05:32:43');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (37, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 05:33:21');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (38, 'doctor@drsmart.com', 'Doctor', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 06:08:31');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (39, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 06:23:51');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (40, 'doctor@drsmart.com', 'Doctor', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 06:29:49');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (41, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 06:30:23');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (42, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 06:41:48');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (43, 'pharmacist@drsmart.com', 'Pharmacist', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 06:45:10');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (44, 'doctor@drsmart.com', 'Doctor', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 06:46:16');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (45, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 06:57:22');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (46, 'doctor@drsmart.com', 'Doctor', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 07:01:04');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (47, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 07:43:17');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (48, 'pharmacist@drsmart.com', 'Pharmacist', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 08:56:14');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (49, 'lab@drsmart.com', 'Lab Technician', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 09:00:08');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (50, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 10:03:33');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (51, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 10:18:55');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (52, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 10:40:59');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (53, 'doctor@drsmart.com', 'Doctor', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 10:52:53');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (54, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-17 10:58:41');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (55, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-19 04:44:19');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (56, 'doctor@drsmart.com', 'Doctor', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-19 05:30:29');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (57, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-19 06:50:41');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (58, 'nurse@drsmart.com', 'Nurse', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-19 09:22:55');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (59, 'pharmacist@drsmart.com', 'Pharmacist', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-19 09:28:47');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (60, 'doctor@drsmart.com', 'Doctor', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-19 09:32:05');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (61, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-19 10:15:00');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (62, 'doctor@drsmart.com', 'Doctor', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-19 10:18:44');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (63, 'doctor@drsmart.com', 'Doctor', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-19 10:41:48');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (64, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-19 10:44:51');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (65, 'doctor@drsmart.com', 'Doctor', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-19 10:53:01');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (66, 'accountant@drsmart.com', 'Accountant', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-19 10:54:54');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (67, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-19 10:59:26');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (68, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-20 04:30:25');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (69, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-20 04:41:45');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (70, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-20 04:43:18');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (71, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-20 04:50:12');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (72, 'nurse@drsmart.com', 'Nurse', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-20 04:56:39');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (73, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-20 05:36:39');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (74, 'receptionist@drsmart.com', 'Receptionist', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-20 05:40:01');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (75, 'doctor@drsmart.com', 'Doctor', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-20 05:52:16');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (76, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-20 05:53:56');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (77, 'lab@drsmart.com', 'Lab Technician', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-20 07:04:44');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (78, 'accountant@drsmart.com', 'Accountant', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-20 07:40:11');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (79, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-20 09:08:41');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (80, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-20 09:09:39');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (81, 'lab@drsmart.com', 'Lab Technician', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-20 09:17:40');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (82, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-20 09:20:47');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (83, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-20 09:37:21');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (84, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-20 11:17:22');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (85, 'doctor@drsmart.com', 'Doctor', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-20 12:44:22');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (86, 'doctor@drsmart.com', 'Doctor', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-21 04:19:20');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (87, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-21 04:24:43');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (88, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-21 05:44:40');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (89, 'admin@drsmart.com', 'Super Admin', '49.37.116.76', 'Chrome 127.0.0.0, Windows 10', '2024-08-21 05:44:43');


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `childs` text NOT NULL,
  `role` varchar(30) NOT NULL,
  `verification_code` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3;

INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (1, 1, 'pat1', '8l73tn', '', 'patient', '', 'yes', '2024-05-30 07:26:53');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (2, 2, 'pat2', 'i1q6hw', '', 'patient', '', 'yes', '2024-05-30 07:30:13');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (3, 3, 'pat3', '8nznct', '', 'patient', '', 'yes', '2024-05-30 07:32:16');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (4, 4, 'pat4', '2x3ox0', '', 'patient', '', 'yes', '2024-05-30 07:34:04');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (5, 5, 'pat5', '4gwmf5', '', 'patient', '', 'yes', '2024-05-30 07:36:31');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (6, 6, 'pat6', 'wnqla3', '', 'patient', '', 'yes', '2024-05-30 07:38:27');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (7, 7, 'pat7', 'u9q3cx', '', 'patient', '', 'yes', '2024-05-30 07:40:18');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (8, 8, 'pat8', 'd21au7', '', 'patient', '', 'yes', '2024-05-30 07:42:55');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (9, 9, 'pat9', 'chx5e2', '', 'patient', '', 'yes', '2024-05-30 07:44:33');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (10, 10, 'pat10', '6hf9xh', '', 'patient', '', 'yes', '2024-05-30 07:46:04');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (11, 11, 'pat11', 'l5eecr', '', 'patient', '', 'yes', '2024-05-30 09:34:36');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (12, 12, 'pat12', 'n4mfh5', '', 'patient', '', 'yes', '2024-05-30 09:37:33');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (13, 13, 'pat13', 'rjqhjw', '', 'patient', '', 'yes', '2024-05-30 09:39:09');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (14, 14, 'pat14', 'geosel', '', 'patient', '', 'yes', '2024-05-30 09:42:25');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (15, 15, 'pat15', 'ng1iv9', '', 'patient', '', 'yes', '2024-05-30 09:43:43');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (16, 16, 'pat16', 'ecxcwm', '', 'patient', '', 'yes', '2024-05-30 09:45:14');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (17, 17, 'pat17', '1dr3nw', '', 'patient', '', 'yes', '2024-05-30 09:49:01');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (18, 18, 'pat18', 'prhvud', '', 'patient', '', 'yes', '2024-05-30 09:55:16');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (19, 19, 'pat19', 'ghnb6w', '', 'patient', '', 'yes', '2024-05-30 10:06:12');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (20, 20, 'pat20', 'klo3x3', '', 'patient', '', 'yes', '2024-05-30 10:07:38');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (21, 21, 'pat21', 'sf869h', '', 'patient', '', 'yes', '2024-08-03 02:59:51');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (22, 22, 'pat22', '68d2c2', '', 'patient', '', 'yes', '2024-08-03 03:00:17');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (23, 23, 'pat23', 'ps1bke', '', 'patient', '', 'yes', '2024-08-03 06:09:22');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (24, 24, 'pat24', 'y6v8pa', '', 'patient', '', 'yes', '2024-08-05 06:21:07');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (25, 25, 'pat25', 'l7p31x', '', 'patient', '', 'yes', '2024-08-05 06:32:50');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (26, 26, 'pat26', 'mpwdgf', '', 'patient', '', 'no', '2024-08-13 12:53:27');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (27, 27, 'pat27', 'b70gmd', '', 'patient', '', 'no', '2024-08-13 12:54:13');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (28, 28, 'pat28', '96i8y5', '', 'patient', '', 'yes', '2024-08-05 07:52:08');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (29, 29, 'pat29', 'ycluc1', '', 'patient', '', 'yes', '2024-08-05 09:13:08');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (30, 30, 'pat30', 'era65l', '', 'patient', '', 'yes', '2024-08-05 09:18:51');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (31, 31, 'pat31', 'kzxgpa', '', 'patient', '', 'yes', '2024-08-05 09:29:39');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (32, 32, 'pat32', '0rpc7m', '', 'patient', '', 'yes', '2024-08-05 09:35:06');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (33, 33, 'pat33', 'cify06', '', 'patient', '', 'yes', '2024-08-05 13:11:21');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (34, 34, 'pat34', 'kc1sg8', '', 'patient', '', 'yes', '2024-08-06 07:05:14');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (35, 35, 'pat35', 'hzf0zk', '', 'patient', '', 'yes', '2024-08-07 07:00:05');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (36, 36, 'pat36', '8ifiz2', '', 'patient', '', 'yes', '2024-08-07 08:50:40');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (37, 37, 'pat37', 'x5s2nv', '', 'patient', '', 'no', '2024-08-09 09:49:35');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (38, 38, 'pat38', 'tgooqj', '', 'patient', '', 'yes', '2024-08-08 06:35:51');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (39, 39, 'pat39', '461gjy', '', 'patient', '', 'no', '2024-08-13 12:53:59');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (40, 40, 'pat40', '21hmuj', '', 'patient', '', 'no', '2024-08-13 12:53:42');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (41, 41, 'pat41', 'ooj39u', '', 'patient', '', 'yes', '2024-08-13 11:43:22');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (42, 42, 'pat42', 'ta0n57', '', 'patient', '', 'yes', '2024-08-14 05:25:27');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (43, 43, 'pat43', 'afzt27', '', 'patient', '', 'yes', '2024-08-14 06:03:14');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (44, 44, 'pat44', 'wbtadb', '', 'patient', '', 'yes', '2024-08-16 05:17:41');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (45, 45, 'pat45', 'qpnckm', '', 'patient', '', 'yes', '2024-08-16 07:31:19');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (46, 46, 'pat46', 'oij81f', '', 'patient', '', 'yes', '2024-08-16 09:41:17');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (47, 47, 'pat47', 'xor257', '', 'patient', '', 'yes', '2024-08-17 04:37:42');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (48, 48, 'pat48', 'trxiiz', '', 'patient', '', 'yes', '2024-08-17 05:36:33');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (49, 49, 'pat49', 'i1vipq', '', 'patient', '', 'yes', '2024-08-19 09:38:02');


#
# TABLE STRUCTURE FOR: vehicles
#

DROP TABLE IF EXISTS `vehicles`;

CREATE TABLE `vehicles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_no` varchar(20) DEFAULT NULL,
  `vehicle_model` varchar(100) NOT NULL DEFAULT 'None',
  `manufacture_year` varchar(4) DEFAULT NULL,
  `vehicle_type` varchar(100) NOT NULL,
  `driver_name` varchar(50) DEFAULT NULL,
  `driver_licence` varchar(50) NOT NULL DEFAULT 'None',
  `driver_contact` varchar(20) DEFAULT NULL,
  `note` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `vehicles` (`id`, `vehicle_no`, `vehicle_model`, `manufacture_year`, `vehicle_type`, `driver_name`, `driver_licence`, `driver_contact`, `note`, `created_at`) VALUES (1, 'JOR1234321', 'YAMHAA ', '2024', 'Contractual', 'fasil mohammad', '', '+9656754356', '', '2024-08-21 04:46:39');


#
# TABLE STRUCTURE FOR: visit_details
#

DROP TABLE IF EXISTS `visit_details`;

CREATE TABLE `visit_details` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `known_allergies` varchar(100) NOT NULL,
  `casualty` varchar(200) NOT NULL,
  `refference` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `note` varchar(100) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `note_remark` mediumtext NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `generated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: visitors_book
#

DROP TABLE IF EXISTS `visitors_book`;

CREATE TABLE `visitors_book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `source` varchar(100) DEFAULT NULL,
  `purpose` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(12) NOT NULL,
  `id_proof` varchar(50) NOT NULL,
  `no_of_pepple` int NOT NULL,
  `date` date NOT NULL,
  `in_time` varchar(20) NOT NULL,
  `out_time` varchar(20) NOT NULL,
  `note` mediumtext NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `visitors_book` (`id`, `source`, `purpose`, `name`, `email`, `contact`, `id_proof`, `no_of_pepple`, `date`, `in_time`, `out_time`, `note`, `image`) VALUES (1, NULL, 'Visit', 'Mohammed Al-Jabari', NULL, '+9657553464', '', 5, '2024-08-16', '09:15 AM', '10:15 AM', 'Please don\'t disturb to anyone', 'id1.jpg');


#
# TABLE STRUCTURE FOR: visitors_purpose
#

DROP TABLE IF EXISTS `visitors_purpose`;

CREATE TABLE `visitors_purpose` (
  `id` int NOT NULL AUTO_INCREMENT,
  `visitors_purpose` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

INSERT INTO `visitors_purpose` (`id`, `visitors_purpose`, `description`) VALUES (1, 'Visit', 'Visitor centers used to provide fairly basic information about the place, corporation or event they are celebrating, acting more as the entry way to a place. The role of the visitor center has been rapidly evolving over the past 10 years to become more of an experience and to tell the story of the place or brand it represents. Many have become destinations and experiences in their own right.');
INSERT INTO `visitors_purpose` (`id`, `visitors_purpose`, `description`) VALUES (2, 'Inquiry ', 'Inquiry is an approach to learning that involves a process of exploring the natural or material world, and that leads to asking questions, making discoveries, and testing those discoveries in the search for new understanding.');
INSERT INTO `visitors_purpose` (`id`, `visitors_purpose`, `description`) VALUES (3, 'Seminar ', 'A seminar may be defined as a gathering of people for the purpose of discussing a stated topic. Such gatherings are usually interactive sessions where the participants engage in discussions about the delineated topic.');


