-- ===========================
-- 1. BỆNH VIỆN (HOSPITALS)
-- ===========================
CREATE TABLE `hospitals` (
  `uuid` char(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `hospitals` (`uuid`, `name`, `address`, `image`) VALUES
('1hosp1234567890hosp1234567890ab', 'Bệnh viện Bạch Mai', '78 Giải Phóng, Hà Nội', 'https://img/hospital1.jpg');

-- ===========================
-- 2. CHUYÊN KHOA (SPECIALIZATIONS)
-- ===========================
CREATE TABLE `specializations` (
  `uuid` char(32) NOT NULL,
  `name` varchar(75) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `specializations` (`uuid`, `name`) VALUES
('1spec1234567890spec1234567890ab', 'Tim mạch');

-- ===========================
-- 3. PHÒNG KHÁM (CLINICS)
-- ===========================
CREATE TABLE `clinics` (
  `uuid` char(32) NOT NULL,
  `name` varchar(75) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `hospital_id` char(32) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`),
  KEY `hospital_id` (`hospital_id`),
  CONSTRAINT `clinics_hospital_id` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `clinics` (`uuid`, `name`, `address`, `phone`, `hospital_id`) VALUES
('1cli1234567890cli1234567890abcd', 'PK Nội Tổng Quát', 'Số 2, Nguyễn Trãi, Hà Nội', '0123456789', '1hosp1234567890hosp1234567890ab');


CREATE TABLE `premission` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(75) DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1;

-- Ví dụ:
INSERT INTO `premission` (`id`, `name`) VALUES
(1, 'Quản trị viên'),
(2, 'Bác sĩ'),
(3, 'Bệnh nhân');


-- ===========================
-- 4. NGƯỜI DÙNG (USER)
-- ===========================
CREATE TABLE `user` (
  `uuid` char(32) NOT NULL,
  `premission_id` INT DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `address` varchar(75) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`),
  KEY `premission_id` (`premission_id`),
  CONSTRAINT `user_premission_id` FOREIGN KEY (`premission_id`) REFERENCES `premission` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `user` (`uuid`, `premission_id`, `name`, `email`, `username`, `password`) VALUES
('1user1234567890user1234567890ab', 1, 'Nguyễn Văn A', 'a@gmail.com', 'nguyenvana', 'matkhau');
-- ===========================
-- 5. BỆNH NHÂN (PATIENTS)
-- ===========================
CREATE TABLE `patients` (
  `uuid` char(32) NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `patients_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `patients` (`uuid`, `user_id`) VALUES
('1pat1234567890pat1234567890abcd', '1user1234567890user1234567890ab');

-- ===========================
-- 6. BÁC SĨ (DOCTORS)
-- ===========================
CREATE TABLE `doctors` (
  `uuid` char(32) NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  `doctor_type` tinyint(1) DEFAULT NULL,
  `specialization_id` char(32) DEFAULT NULL,
  `license` varchar(32) DEFAULT NULL,
  `introduce` varchar(2000) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`),
  KEY `user_id` (`user_id`),
  KEY `specialization_id` (`specialization_id`),
  CONSTRAINT `doctors_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `doctors_specialization_id` FOREIGN KEY (`specialization_id`) REFERENCES `specializations` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `doctors` (`uuid`, `user_id`, `specialization_id`, `license`) VALUES
('1doc1234567890doc1234567890abcd', '1user1234567890user1234567890ab', '1spec1234567890spec1234567890ab', 'BS12345');

-- ===========================
-- 7. LỊCH LÀM VIỆC (SCHEDULES)
-- ===========================
CREATE TABLE `schedules` (
  `uuid` char(32) NOT NULL,
  `doctor_id` char(32) DEFAULT NULL,
  `clinic_id` char(32) DEFAULT NULL,
  `start_time` TIME DEFAULT NULL,
  `end_time` TIME DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`),
  KEY `doctor_id` (`doctor_id`),
  KEY `clinic_id` (`clinic_id`),
  CONSTRAINT `schedules_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `schedules_clinic_id` FOREIGN KEY (`clinic_id`) REFERENCES `clinics` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `schedules` (`uuid`, `doctor_id`, `clinic_id`, `start_time`, `end_time`) VALUES
('1sch1234567890sch1234567890abcd', '1doc1234567890doc1234567890abcd', '1cli1234567890cli1234567890abcd', '08:00:00', '11:00:00');

-- ===========================
-- 8. HỒ SƠ BỆNH ÁN (MEDICAL_RECORDS)
-- ===========================
CREATE TABLE `medical_records` (
  `uuid` char(32) NOT NULL,
  `patient_id` char(32) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `medical_records_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `medical_records` (`uuid`, `patient_id`) VALUES
('1mr1234567890mr1234567890abcd', '1pat1234567890pat1234567890abcd');

-- ===========================
-- 9. DỊCH VỤ Y TẾ (MEDICAL_SERVICES)
-- ===========================
CREATE TABLE `medical_services` (
  `uuid` char(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `specialization_id` char(32) DEFAULT NULL,
  `clinic_id` char(32) DEFAULT NULL,
  `hospital_id` char(32) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`),
  KEY `specialization_id` (`specialization_id`),
  KEY `clinic_id` (`clinic_id`),
  KEY `hospital_id` (`hospital_id`),
  CONSTRAINT `ms_specialization_id` FOREIGN KEY (`specialization_id`) REFERENCES `specializations` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ms_clinic_id` FOREIGN KEY (`clinic_id`) REFERENCES `clinics` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ms_hospital_id` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `medical_services` (`uuid`, `name`, `price`, `specialization_id`, `clinic_id`) VALUES
('1ms1234567890ms1234567890abcd', 'Xét nghiệm máu', 200000, '1spec1234567890spec1234567890ab', '1cli1234567890cli1234567890abcd');

-- ===========================
-- 10. CUỘC HẸN (APPOINTMENTS)
-- ===========================
CREATE TABLE `appointments` (
  `uuid` char(32) NOT NULL,
  `doctor_id` char(32) DEFAULT NULL,
  `patient_id` char(32) DEFAULT NULL,
  `clinic_id` char(32) DEFAULT NULL,
  `hospital_id` char(32) DEFAULT NULL,
  `schedule_id` char(32) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`),
  KEY `doctor_id` (`doctor_id`),
  KEY `patient_id` (`patient_id`),
  KEY `clinic_id` (`clinic_id`),
  KEY `hospital_id` (`hospital_id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `appointments_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `appointments_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `appointments_clinic_id` FOREIGN KEY (`clinic_id`) REFERENCES `clinics` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `appointments_hospital_id` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `appointments_schedule_id` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `appointments` (`uuid`, `doctor_id`, `patient_id`, `clinic_id`, `date`, `status`) VALUES
('1app1234567890app1234567890abcd', '1doc1234567890doc1234567890abcd', '1pat1234567890pat1234567890abcd', '1cli1234567890cli1234567890abcd', '2025-06-11 09:00:00', 1);

-- ===========================
-- 11. HỒ SƠ PHỤ (SELECT_PROFILES)
-- ===========================
CREATE TABLE `select_profiles` (
  `uuid` char(32) NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `relationship` varchar(100) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sp_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `select_profiles` (`uuid`, `user_id`, `name`, `relationship`) VALUES
('1pr1234567890pr1234567890abcd', '1user1234567890user1234567890ab', 'Nguyễn Văn B', 'Con');

-- ===========================
-- 12. BÀI VIẾT (ARTICLES)
-- ===========================
CREATE TABLE `articles` (
  `uuid` char(32) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `articles` (`uuid`, `title`, `content`, `author`) VALUES
('1art1234567890art1234567890abcd', 'Chăm sóc sức khỏe mùa hè', 'Nội dung chi tiết về chăm sóc sức khỏe...', 'BS Hoàng Văn C');

-- ===========================
-- 13. SLIDE QUẢNG CÁO (CAROUSEL_ITEMS)
-- ===========================
CREATE TABLE `carousel_items` (
  `uuid` char(32) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `carousel_items` (`uuid`, `image`, `title`, `description`) VALUES
('1car1234567890car1234567890abcd', 'https://img/banner.jpg', 'Giảm giá mùa hè', 'Ưu đãi cho khách đặt khám trước 20/6');


-- ===========================
-- 14. BẢNG TOKEN (XÁC THỰC)
-- ===========================
CREATE TABLE `token` (
  `uuid` char(32) NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `token_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Ví dụ:
INSERT INTO `token` (`uuid`, `user_id`, `access_token`, `refresh_token`) VALUES
('1tok1234567890tok1234567890abcd', '1user1234567890user1234567890ab', 'access_token_example', 'refresh_token_example');


