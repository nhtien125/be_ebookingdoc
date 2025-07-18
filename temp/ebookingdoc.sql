-- ===========================
-- 1. BỆNH VIỆN (HOSPITALS)
-- ===========================

CREATE TABLE `hospitals` (
  `uuid` char(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `description` TEXT DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ===========================
-- 4. Trung tâm tiêm ngừa (VACCINATION CENTERS)
-- ===========================
CREATE TABLE `vaccination_centers` (
  `uuid` char(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(10) DEFAULT 'open',        -- Thêm trường trạng thái
  `working_hours` varchar(50) DEFAULT NULL,   -- Thêm trường giờ hoạt động
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ===========================
-- 5.(premission)
-- ===========================

CREATE TABLE `premission` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(75) DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1;

-- ===========================
-- 6. NGƯỜI DÙNG (USER)
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
  `birth_day` DATE NULL, -- Bổ sung dòng này
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`),
  KEY `premission_id` (`premission_id`),
  CONSTRAINT `user_premission_id` FOREIGN KEY (`premission_id`) REFERENCES `premission` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ===========================
-- 7. BỆNH NHÂN (PATIENTS)
-- ===========================
CREATE TABLE `patients` (
  `uuid` char(32) NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  `name` VARCHAR(100) NOT NULL,
  `dob` DATE DEFAULT NULL,
  `gender` VARCHAR(10) DEFAULT NULL,
  `phone` VARCHAR(20) DEFAULT NULL,
  `relationship` VARCHAR(50) DEFAULT NULL,
  `address` VARCHAR(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `patients_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ===========================
-- 8. BÁC SĨ (DOCTORS)
-- ===========================
CREATE TABLE `doctors` (
  `uuid` char(32) NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  `hospital_id` char(32) DEFAULT NULL,
  `clinic_id` char(32) DEFAULT NULL,
  `specialization_id` char(32) DEFAULT NULL,
  `license` varchar(32) DEFAULT NULL,
  `introduce` varchar(2000) DEFAULT NULL,
  `experience` INT DEFAULT 0,
  `status` TINYINT DEFAULT 1 COMMENT '0: Đã duyệt, 1: Chờ duyệt, 2: Từ chối',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`),
  KEY `user_id` (`user_id`),
  KEY `hospital_id` (`hospital_id`),
  KEY `clinic_id` (`clinic_id`),
  KEY `specialization_id` (`specialization_id`),
  CONSTRAINT `doctors_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `doctors_specialization_id` FOREIGN KEY (`specialization_id`) REFERENCES `specializations` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `doctors_hospital_id` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `doctors_clinic_id` FOREIGN KEY (`clinic_id`) REFERENCES `clinics` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ===========================
-- 9. LỊCH LÀM VIỆC (SCHEDULES)
-- ===========================
CREATE TABLE 
`schedules` (
  `uuid` char(32) NOT NULL,
  `doctor_id` char(32) DEFAULT NULL,
  `work_date` DATE NOT NULL,
  `start_time` TIME DEFAULT NULL,
  `end_time` TIME DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `schedules_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ===========================
-- 11. DỊCH VỤ Y TẾ (MEDICAL_SERVICES)
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

-- ===========================
-- 12. CUỘC HẸN (APPOINTMENTS)
-- ===========================
CREATE TABLE `appointments` (
  `uuid` char(32) NOT NULL,
  `doctor_id` char(32) DEFAULT NULL,
  `patient_id` char(32) DEFAULT NULL,
  `clinic_id` char(32) DEFAULT NULL,
  `hospital_id` char(32) DEFAULT NULL,
  `schedule_id` char(32) DEFAULT NULL,
  `vaccination_center_id` char(32) DEFAULT NULL,
  `medical_service_id` char(32) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `health_status` VARCHAR(1000) DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
   `appointment_code` VARCHAR(32) DEFAULT NULL, 
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  
  PRIMARY KEY (`uuid`),
  KEY `doctor_id` (`doctor_id`),
  KEY `patient_id` (`patient_id`),
  KEY `clinic_id` (`clinic_id`),
  KEY `hospital_id` (`hospital_id`),
  KEY `schedule_id` (`schedule_id`),
  KEY `vaccination_center_id` (`vaccination_center_id`),
  KEY `medical_service_id` (`medical_service_id`),
  KEY `user_id` (`user_id`), 
  CONSTRAINT `appointments_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `appointments_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `appointments_clinic_id` FOREIGN KEY (`clinic_id`) REFERENCES `clinics` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `appointments_hospital_id` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `appointments_schedule_id` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `appointments_vaccination_center_id` FOREIGN KEY (`vaccination_center_id`) REFERENCES `vaccination_centers` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `appointments_medical_service_id` FOREIGN KEY (`medical_service_id`) REFERENCES `medical_services` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `appointments_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE -- Ràng buộc khóa ngoại cho user_id
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- ===========================
-- 14. BÀI VIẾT (ARTICLES)
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

CREATE TABLE `reviews` (
  `uuid` CHAR(32) NOT NULL,
  `user_id` CHAR(32) NOT NULL,
  `doctor_id` CHAR(32) NOT NULL,
  `appointment_id` CHAR(32) NOT NULL,
  `stars` TINYINT NOT NULL CHECK (`stars` BETWEEN 1 AND 5),
  `comment` VARCHAR(1000) DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uuid`),
  KEY `user_id` (`user_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `appointment_id` (`appointment_id`),
  CONSTRAINT `reviews_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reviews_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reviews_appointment_id` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ===========================
-- 17. BẢNG PAYÔS PAYMENT (THANH TOÁN payos)
-- ===========================

CREATE TABLE payos_payments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  amount INT NOT NULL,
  payment_code VARCHAR(32) NOT NULL,
  payment_id VARCHAR(32) NOT NULL,
  description VARCHAR(255) NOT NULL,
  redirectUrl VARCHAR(255) NOT NULL,
  status INT NOT NULL,
  fullname VARCHAR(100) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(100) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================
-- 18. BẢNG PAYÔS PAYMENT DETAILS (CHI TIẾT THANH TOÁN)
-- ============================

CREATE TABLE `payments` (
  `uuid` char(32) NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  `appointment_id` char(32) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,  -- 1: pending, 2: success, 3: failed
  `payment_time` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`),
  KEY `user_id` (`user_id`),
  KEY `appointment_id` (`appointment_id`),
  CONSTRAINT `payments_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `payments_appointment_id` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `notifications` (
  `uuid` CHAR(32) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `content` TEXT NOT NULL,
  `user_id` CHAR(32) DEFAULT NULL,
  `doctor_id` CHAR(32) DEFAULT NULL,
  `appointment_id` CHAR(32) DEFAULT NULL,
  `payment_id` CHAR(32) DEFAULT NULL,
  `type` VARCHAR(50),
  `is_read` BOOLEAN DEFAULT 0,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uuid`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (`doctor_id`) REFERENCES `user` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (`payment_id`) REFERENCES `payments` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- ===========================
-- doanh thu
CREATE TABLE doctor_revenue (
    uuid CHAR(32) NOT NULL,                         
    doctor_id CHAR(32) NOT NULL,                          
    total_revenue DOUBLE NOT NULL,                   
    PRIMARY KEY (uuid),                          
    UNIQUE (doctor_id)                             
);

-- ===========================
-- DỮ LIỆU MẪU CHO HỆ THỐNG ĐẶT LỊCH KHÁM BỆNH
-- ===========================

-- 1. BỆNH VIỆN (HOSPITALS)
INSERT INTO `hospitals` (`uuid`, `name`, `address`, `image`, `description`) VALUES
('bv001', 'Bệnh viện Chợ Rẫy', '201B Nguyễn Chí Thanh, Phường 12, Quận 5, TP.HCM', 'https://surli.cc/tgecuo', 'Bệnh viện đa khoa hạng I, chuyên điều trị các bệnh lý phức tạp'),
('bv002', 'Bệnh viện Bình Dân', '371 Điện Biên Phủ, Phường 4, Quận 3, TP.HCM', 'https://surli.cc/tgecuo', 'Bệnh viện đa khoa với nhiều chuyên khoa mạnh'),
('bv003', 'Bệnh viện Nhi Đồng 1', '341 Sư Vạn Hạnh, Phường 12, Quận 10, TP.HCM', 'https://surli.cc/tgecuo', 'Bệnh viện chuyên khoa nhi hàng đầu'),
('bv004', 'Bệnh viện Đại học Y Dược', '215 Hồng Bàng, Phường 11, Quận 5, TP.HCM', 'https://surli.cc/tgecuo', 'Bệnh viện đa khoa với đội ngũ bác sĩ giàu kinh nghiệm'),
('bv005', 'Bệnh viện Thống Nhất', '1 Lý Thường Kiệt, Phường 7, Quận Tân Bình, TP.HCM', 'https://surli.cc/tgecuo', 'Bệnh viện đa khoa tuyến cuối');

-- 2. CHUYÊN KHOA (SPECIALIZATIONS)
INSERT INTO `specializations` (`uuid`, `name`) VALUES
('ck001', 'Nội khoa'),
('ck002', 'Ngoại khoa'),
('ck003', 'Sản phụ khoa'),
('ck004', 'Nhi khoa'),
('ck005', 'Mắt'),
('ck006', 'Tai Mũi Họng'),
('ck007', 'Da liễu'),
('ck008', 'Tâm thần'),
('ck009', 'Xương khớp'),
('ck010', 'Tim mạch'),
('ck011', 'Thần kinh'),
('ck012', 'Tiết niệu'),
('ck013', 'Răng hàm mặt'),
('ck014', 'Hô hấp'),
('ck015', 'Tiêu hóa');

-- 3. PHÒNG KHÁM (CLINICS)
INSERT INTO `clinics` (`uuid`, `name`, `address`, `phone`, `email`, `image`, `description`) VALUES
('pk001', 'Phòng khám Đa khoa Medlatec', '42-44 Nghĩa Dũng, Ba Đình, Hà Nội', '0243.9628.888', 'info@medlatec.vn', 'https://surli.cc/tgecuo', 'Phòng khám đa khoa với trang thiết bị hiện đại'),
('pk002', 'Phòng khám Thu Cúc', '286 Thụy Khuê, Tây Hồ, Hà Nội', '0247.3088.888', 'info@thucuc.vn', 'https://surli.cc/tgecuo', 'Phòng khám chuyên khoa với dịch vụ tận tình'),
('pk003', 'Phòng khám Đa khoa Quốc tế Vinmec', '458 Minh Khai, Hai Bà Trưng, Hà Nội', '0243.9743.556', 'info@vinmec.com', 'https://surli.cc/tgecuo', 'Phòng khám đa khoa quốc tế'),
('pk004', 'Phòng khám Đa khoa Hồng Hà', '55 Lê Văn Thiêm, Thanh Xuân, Hà Nội', '0243.5574.181', 'info@hongha.vn', 'https://surli.cc/tgecuo', 'Phòng khám đa khoa uy tín'),
('pk005', 'Phòng khám Đa khoa An Khang', '123 Nguyễn Trãi, Thanh Xuân, Hà Nội', '0243.5123.456', 'info@ankhang.vn', 'https://surli.cc/tgecuo', 'Phòng khám đa khoa chất lượng cao');

-- 4. TRUNG TÂM TIÊM NGỪA (VACCINATION CENTERS)
INSERT INTO `vaccination_centers` (`uuid`, `name`, `address`, `phone`, `email`, `image`, `description`, `status`, `working_hours`) VALUES
('tt001', 'Trung tâm tiêm chủng VNVC Cầu Giấy', '234 Cầu Giấy, Cầu Giấy, Hà Nội', '0243.7123.456', 'caugiay@vnvc.vn', 'https://surli.cc/tgecuo', 'Trung tâm tiêm chủng uy tín với vaccine nhập khẩu', 'open', '8:00 - 20:00'),
('tt002', 'Trung tâm tiêm chủng VNVC Tây Hồ', '567 Lạc Long Quân, Tây Hồ, Hà Nội', '0243.7987.654', 'tayho@vnvc.vn', 'https://surli.cc/tgecuo', 'Trung tâm tiêm chủng chuyên nghiệp', 'open', '8:30 - 19:30'),
('tt003', 'Trung tâm Y tế Dự phòng Quận 1', '125 Nguyễn Huệ, Quận 1, TP.HCM', '0283.8123.789', 'ytdp.q1@hcm.gov.vn', 'https://surli.cc/tgecuo', 'Trung tâm tiêm chủng của nhà nước', 'open', '7:30 - 16:30'),
('tt004', 'Trung tâm tiêm chủng SAFPO', '789 Điện Biên Phủ, Quận 3, TP.HCM', '0283.9456.123', 'info@safpo.vn', 'https://surli.cc/tgecuo', 'Trung tâm tiêm chủng quốc tế', 'open', '8:00 - 18:00'),
('tt005', 'Trung tâm tiêm chủng AcuVac', '456 Lê Văn Sỹ, Quận 3, TP.HCM', '0283.7654.321', 'info@acuvac.vn', 'https://surli.cc/tgecuo', 'Trung tâm tiêm chủng với dịch vụ tốt', 'open', '8:30 - 17:30');

-- 5. QUYỀN HẠN (PERMISSIONS)
INSERT INTO `premission` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Doctor'),
(3, 'Patient'),
(4, 'Staff'),
(5, 'Manager');

-- 6. NGƯỜI DÙNG (USERS)
-- GHI CHÚ: TẤT CẢ MẬT KHẨU BCRYPT HASH DƯỚI ĐÂY TƯƠNG ỨNG VỚI MẬT KHẨU "password"
-- Username/Password để login: 
-- admin/password (Admin)
-- bs.hoa/password (Bác sĩ)
-- bs.nam/password (Bác sĩ)
-- bs.cong/password (Bác sĩ)
-- bs.khoa/password (Bác sĩ)
-- lan.nguyen/password (Bệnh nhân)
-- tuan.pham/password (Bệnh nhân)
-- mai.hoang/password (Bệnh nhân)
-- duc.bui/password (Bệnh nhân)
-- huong.le/password (Nhân viên)
INSERT INTO `user` (`uuid`, `premission_id`, `name`, `email`, `phone`, `gender`, `address`, `username`, `password`, `status`, `image`, `birth_day`) VALUES
('usr001', 1, 'Nguyễn Văn Admin', 'admin@ebooking.vn', '0901234567', 1, 'Hà Nội', 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'https://surli.cc/tgecuo', '1985-01-15'),
('usr002', 2, 'Bác sĩ Trần Thị Hoa', 'bs.hoa@ebooking.vn', '0912345678', 0, 'TP.HCM', 'bs.hoa', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'https://surli.cc/tgecuo', '1980-05-20'),
('usr003', 2, 'Bác sĩ Lê Văn Nam', 'bs.nam@ebooking.vn', '0923456789', 1, 'Hà Nội', 'bs.nam', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'https://surli.cc/tgecuo', '1978-03-10'),
('usr004', 3, 'Nguyễn Thị Lan', 'lan.nguyen@gmail.com', '0934567890', 0, 'Hà Nội', 'lan.nguyen', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'https://surli.cc/tgecuo', '1992-07-25'),
('usr005', 3, 'Phạm Minh Tuấn', 'tuan.pham@gmail.com', '0945678901', 1, 'TP.HCM', 'tuan.pham', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'https://surli.cc/tgecuo', '1988-11-30'),
('usr006', 2, 'Bác sĩ Võ Thành Công', 'bs.cong@ebooking.vn', '0956789012', 1, 'Đà Nẵng', 'bs.cong', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'https://surli.cc/tgecuo', '1975-09-12'),
('usr007', 3, 'Hoàng Thị Mai', 'mai.hoang@gmail.com', '0967890123', 0, 'Hà Nội', 'mai.hoang', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'https://surli.cc/tgecuo', '1995-04-18'),
('usr008', 2, 'Bác sĩ Đỗ Văn Khoa', 'bs.khoa@ebooking.vn', '0978901234', 1, 'TP.HCM', 'bs.khoa', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'https://surli.cc/tgecuo', '1982-12-05'),
('usr009', 4, 'Nhân viên Lê Thị Hương', 'huong.le@ebooking.vn', '0989012345', 0, 'Hà Nội', 'huong.le', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'https://surli.cc/tgecuo', '1990-06-22'),
('usr010', 3, 'Bùi Văn Đức', 'duc.bui@gmail.com', '0990123456', 1, 'Hải Phòng', 'duc.bui', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'https://surli.cc/tgecuo', '1987-08-14');

-- 7. BỆNH NHÂN (PATIENTS)
INSERT INTO `patients` (`uuid`, `user_id`, `name`, `dob`, `gender`, `phone`, `relationship`, `address`) VALUES
('bn001', 'usr004', 'Nguyễn Thị Lan', '1992-07-25', 'Nữ', '0934567890', 'Bản thân', 'Hà Nội'),
('bn002', 'usr005', 'Phạm Minh Tuấn', '1988-11-30', 'Nam', '0945678901', 'Bản thân', 'TP.HCM'),
('bn003', 'usr007', 'Hoàng Thị Mai', '1995-04-18', 'Nữ', '0967890123', 'Bản thân', 'Hà Nội'),
('bn004', 'usr010', 'Bùi Văn Đức', '1987-08-14', 'Nam', '0990123456', 'Bản thân', 'Hải Phòng'),
('bn005', 'usr004', 'Nguyễn Văn Bình', '2015-03-12', 'Nam', '0934567890', 'Con', 'Hà Nội'),
('bn006', 'usr005', 'Phạm Thị Hoa', '1960-05-20', 'Nữ', '0945678901', 'Mẹ', 'TP.HCM'),
('bn007', 'usr007', 'Hoàng Văn Sơn', '1965-10-15', 'Nam', '0967890123', 'Bố', 'Hà Nội'),
('bn008', 'usr004', 'Nguyễn Thị Hương', '1990-12-08', 'Nữ', '0934567890', 'Chị', 'Hà Nội');

-- 8. BÁC SĨ (DOCTORS)
INSERT INTO `doctors` (`uuid`, `user_id`, `hospital_id`, `clinic_id`, `specialization_id`, `license`, `introduce`, `experience`, `status`) VALUES
('bs001', 'usr002', 'bv001', NULL,  'ck001', 'BS001234', 'Bác sĩ chuyên khoa I về Nội khoa, có nhiều năm kinh nghiệm trong điều trị các bệnh lý nội khoa phức tạp', 15, 0),
('bs002', 'usr003', 'bv002', NULL, 'ck002', 'BS002345', 'Bác sĩ chuyên khoa II về Ngoại khoa, chuyên về phẫu thuật nội soi', 20, 1),
('bs003', 'usr006', NULL, 'pk001',  'ck005', 'BS003456', 'Bác sĩ chuyên khoa về Mắt, có kinh nghiệm trong điều trị các bệnh lý về mắt', 12, 1),
('bs004', 'usr008', 'bv003', NULL,  'ck004', 'BS004567', 'Bác sĩ chuyên khoa về Nhi, có kinh nghiệm trong chăm sóc sức khỏe trẻ em', 18, 2),
('bs005', 'usr002', NULL, 'pk002',  'ck006', 'BS005678', 'Bác sĩ chuyên khoa về Tai Mũi Họng, điều trị các bệnh lý ENT', 10, 1);

-- 9. LỊCH LÀM VIỆC (SCHEDULES)
INSERT INTO `schedules` (`uuid`, `doctor_id`, `work_date`, `start_time`, `end_time`) VALUES
('lv001', 'bs001', '2024-12-16', '08:00:00', '12:00:00'),
('lv002', 'bs001', '2024-12-16', '14:00:00', '18:00:00'),
('lv003', 'bs002', '2024-12-16', '08:00:00', '12:00:00'),
('lv004', 'bs002', '2024-12-17', '14:00:00', '18:00:00'),
('lv005', 'bs003', '2024-12-17', '08:00:00', '12:00:00'),
('lv006', 'bs003', '2024-12-17', '14:00:00', '17:00:00'),
('lv007', 'bs004', '2024-12-18', '08:00:00', '12:00:00'),
('lv008', 'bs004', '2024-12-18', '14:00:00', '18:00:00'),
('lv009', 'bs005', '2024-12-19', '08:00:00', '12:00:00'),
('lv010', 'bs005', '2024-12-19', '14:00:00', '17:00:00');

-- 10. DỊCH VỤ Y TẾ (MEDICAL_SERVICES)
INSERT INTO `medical_services` (`uuid`, `name`, `description`, `price`, `specialization_id`, `clinic_id`, `hospital_id`, `image`) VALUES
('dv001', 'Khám tổng quát', 'Khám sức khỏe tổng quát định kỳ', 200000, 'ck001', 'pk001', NULL, 'https://surli.cc/tgecuo'),
('dv002', 'Khám chuyên khoa Tim mạch', 'Khám và điều trị các bệnh lý tim mạch', 300000, 'ck010', NULL, 'bv001', 'https://surli.cc/tgecuo'),
('dv003', 'Khám mắt', 'Khám và điều trị các bệnh về mắt', 250000, 'ck005', 'pk001', NULL, 'https://surli.cc/tgecuo'),
('dv004', 'Khám nhi khoa', 'Khám sức khỏe cho trẻ em', 180000, 'ck004', NULL, 'bv003', 'https://surli.cc/tgecuo'),
('dv005', 'Khám tai mũi họng', 'Khám và điều trị các bệnh về tai mũi họng', 220000, 'ck006', 'pk002', NULL, 'https://surli.cc/tgecuo'),
('dv006', 'Phẫu thuật nội soi', 'Phẫu thuật nội soi các bệnh lý ngoại khoa', 1500000, 'ck002', NULL, 'bv002', 'https://surli.cc/tgecuo'),
('dv007', 'Siêu âm tim', 'Siêu âm tim và mạch máu', 400000, 'ck010', NULL, 'bv001', 'https://surli.cc/tgecuo'),
('dv008', 'Xét nghiệm máu', 'Xét nghiệm máu cơ bản', 150000, 'ck001', 'pk001', NULL, 'https://surli.cc/tgecuo');

-- 11. CUỘC HẸN (APPOINTMENTS)
INSERT INTO `appointments` (`uuid`, `doctor_id`, `patient_id`, `clinic_id`, `hospital_id`, `schedule_id`, `vaccination_center_id`, `medical_service_id`, `date`, `status`, `health_status`, `user_id`, `appointment_code`) VALUES
('lh001', 'bs001', 'bn001', NULL, 'bv001', 'lv001', NULL, 'dv002', '2024-12-16 09:00:00', 1, 'Bệnh nhân có triệu chứng đau ngực', 'usr004', 'APT001'),
('lh002', 'bs003', 'bn002', 'pk001', NULL, 'lv005', NULL, 'dv003', '2024-12-17 10:00:00', 1, 'Bệnh nhân cần khám mắt định kỳ', 'usr005', 'APT002'),
('lh003', 'bs004', 'bn005', NULL, 'bv003', 'lv007', NULL, 'dv004', '2024-12-18 09:30:00', 1, 'Trẻ em cần khám sức khỏe', 'usr004', 'APT003'),
('lh004', 'bs005', 'bn003', 'pk002', NULL, 'lv009', NULL, 'dv005', '2024-12-19 10:30:00', 2, 'Bệnh nhân có triệu chứng viêm họng', 'usr007', 'APT004'),
('lh005', 'bs002', 'bn004', NULL, 'bv002', 'lv004', NULL, 'dv006', '2024-12-17 15:00:00', 1, 'Bệnh nhân cần phẫu thuật nội soi', 'usr010', 'APT005'),
('lh006', NULL, 'bn006', NULL, NULL, NULL, 'tt001', NULL, '2024-12-20 14:00:00', 1, 'Tiêm vaccine cúm', 'usr005', 'APT006'),
('lh007', 'bs001', 'bn007', NULL, 'bv001', 'lv002', NULL, 'dv007', '2024-12-16 15:30:00', 3, 'Bệnh nhân cần siêu âm tim', 'usr007', 'APT007'),
('lh008', 'bs003', 'bn008', 'pk001', NULL, 'lv006', NULL, 'dv008', '2024-12-17 16:00:00', 1, 'Xét nghiệm máu định kỳ', 'usr004', 'APT008');

-- 12. BÀI VIẾT (ARTICLES)
INSERT INTO `articles` (`uuid`, `title`, `content`, `image`, `author`) VALUES
('bv001', 'Cách phòng ngừa bệnh tim mạch', 'Bệnh tim mạch là một trong những nguyên nhân hàng đầu gây tử vong trên thế giới. Việc phòng ngừa bệnh tim mạch rất quan trọng...', 'https://surli.cc/tgecuo', 'Bác sĩ Nguyễn Văn A'),
('bv002', 'Chăm sóc sức khỏe trẻ em mùa đông', 'Mùa đông là thời điểm trẻ em dễ mắc các bệnh về đường hô hấp. Phụ huynh cần lưu ý...', 'https://surli.cc/tgecuo', 'Bác sĩ Trần Thị B'),
('bv003', 'Tầm quan trọng của việc khám sức khỏe định kỳ', 'Khám sức khỏe định kỳ giúp phát hiện sớm các bệnh lý, từ đó có phương pháp điều trị hiệu quả...', 'https://surli.cc/tgecuo', 'Bác sĩ Lê Văn C'),
('bv004', 'Những điều cần biết về vaccine COVID-19', 'Vaccine COVID-19 là một trong những biện pháp hiệu quả nhất để phòng chống dịch bệnh...', 'https://surli.cc/tgecuo', 'Bác sĩ Phạm Thị D'),
('bv005', 'Cách bảo vệ mắt trong thời đại công nghệ', 'Với sự phát triển của công nghệ, việc bảo vệ mắt trở nên quan trọng hơn bao giờ hết...', 'https://surli.cc/tgecuo', 'Bác sĩ Hoàng Văn E');

-- 13. ĐÁNH GIÁ (REVIEWS)
INSERT INTO `reviews` (`uuid`, `user_id`, `doctor_id`, `appointment_id`, `stars`, `comment`, `created_at`, `updated_at`) VALUES
('dg001', 'usr004', 'bs001', 'lh001', 5, 'Bác sĩ rất tận tình và chuyên nghiệp. Tôi rất hài lòng với dịch vụ.', NOW(), NOW()),
('dg002', 'usr005', 'bs003', 'lh002', 4, 'Bác sĩ khám rất kỹ lưỡng. Phòng khám sạch sẽ và thoải mái.', NOW(), NOW()),
('dg003', 'usr004', 'bs004', 'lh003', 5, 'Bác sĩ rất giỏi với trẻ em. Con tôi không hề sợ hãi.', NOW(), NOW()),
('dg004', 'usr007', 'bs005', 'lh004', 4, 'Dịch vụ tốt, thời gian chờ hợp lý. Sẽ quay lại lần sau.', NOW(), NOW()),
('dg005', 'usr010', 'bs002', 'lh005', 5, 'Bác sĩ phẫu thuật rất khéo léo. Tôi hồi phục nhanh chóng.', NOW(), NOW());


-- 14. THANH TOÁN PAYOS (PAYOS_PAYMENTS)
INSERT INTO `payos_payments` (`amount`, `payment_code`, `payment_id`, `description`, `redirectUrl`, `status`, `fullname`, `phone`, `email`) VALUES
(300000, 'PAY001', 'PAYOS001', 'Thanh toán khám tim mạch', 'https://ebooking.vn/success', 2, 'Nguyễn Thị Lan', '0934567890', 'lan.nguyen@gmail.com'),
(250000, 'PAY002', 'PAYOS002', 'Thanh toán khám mắt', 'https://ebooking.vn/success', 2, 'Phạm Minh Tuấn', '0945678901', 'tuan.pham@gmail.com'),
(180000, 'PAY003', 'PAYOS003', 'Thanh toán khám nhi khoa', 'https://ebooking.vn/success', 2, 'Nguyễn Thị Lan', '0934567890', 'lan.nguyen@gmail.com'),
(220000, 'PAY004', 'PAYOS004', 'Thanh toán khám tai mũi họng', 'https://ebooking.vn/success', 1, 'Hoàng Thị Mai', '0967890123', 'mai.hoang@gmail.com'),
(1500000, 'PAY005', 'PAYOS005', 'Thanh toán phẫu thuật nội soi', 'https://ebooking.vn/success', 2, 'Bùi Văn Đức', '0990123456', 'duc.bui@gmail.com');

-- 15. THANH TOÁN (PAYMENTS)
INSERT INTO `payments` (`uuid`, `user_id`, `appointment_id`, `amount`, `payment_method`, `status`, `payment_time`) VALUES
('tt001', 'usr004', 'lh001', 300000, 'online', 2, '2024-12-15 10:30:00'),
('tt002', 'usr005', 'lh002', 250000, 'online', 2, '2024-12-16 09:15:00'),
('tt003', 'usr004', 'lh003', 180000, 'online', 2, '2024-12-17 14:20:00'),
('tt004', 'usr007', 'lh004', 220000, 'online', 1, NULL),
('tt005', 'usr010', 'lh005', 1500000, 'online', 2, '2024-12-16 16:45:00'),
('tt006', 'usr005', 'lh006', 150000, 'Cash', 1, NULL),
('tt007', 'usr007', 'lh007', 400000, 'online', 3, NULL),
('tt008', 'usr004', 'lh008', 150000, 'online', 1, NULL);

-- 16. THÔNG BÁO (NOTIFICATIONS)
INSERT INTO `notifications` (`uuid`, `title`, `content`, `status`, `user_id`, `appointment_id`, `doctor_id`, `payment_id`) VALUES
('tb001', 'Xác nhận đặt lịch khám', 'Lịch khám của bạn đã được xác nhận. Mã lịch hẹn: APT001', 1, 'usr004', 'lh001', 'bs001', NULL),
('tb002', 'Thanh toán thành công', 'Thanh toán cho lịch khám APT001 đã thành công. Số tiền: 300,000 VND', 1, 'usr004', 'lh001', NULL, 'tt001'),
('tb003', 'Nhắc nhở lịch khám', 'Bạn có lịch khám vào ngày mai lúc 10:00. Mã lịch hẹn: APT002', 1, 'usr005', 'lh002', 'bs003', NULL),
('tb004', 'Đổi lịch khám', 'Lịch khám APT004 đã được đổi thành công sang ngày 20/12/2024', 1, 'usr007', 'lh004', 'bs005', NULL),
('tb005', 'Hoàn thành khám', 'Bạn đã hoàn thành lịch khám APT001. Hãy đánh giá dịch vụ của chúng tôi', 1, 'usr004', 'lh001', 'bs001', NULL),
('tb006', 'Xác nhận thanh toán', 'Thanh toán cho dịch vụ phẫu thuật nội soi đã được xác nhận', 1, 'usr010', 'lh005', 'bs002', 'tt005'),
('tb007', 'Lịch tiêm vaccine', 'Bạn có lịch tiêm vaccine vào ngày 20/12/2024 lúc 14:00', 1, 'usr005', 'lh006', NULL, NULL),
('tb008', 'Hủy lịch khám', 'Lịch khám APT007 đã bị hủy do bác sĩ có việc đột xuất', 1, 'usr007', 'lh007', 'bs001', NULL);

-- 17. DOANH THU BÁC SĨ (DOCTOR_REVENUE)
INSERT INTO `doctor_revenue` (`uuid`, `doctor_id`, `total_revenue`) VALUES
('dr001', 'bs001', 700000),
('dr002', 'bs002', 1500000),
('dr003', 'bs003', 400000),
('dr004', 'bs004', 180000),
('dr005', 'bs005', 220000);

-- ===========================
-- THÔNG TIN ĐĂNG NHẬP
-- ===========================
/*
DANH SÁCH TÀI KHOẢN TEST:
- Username: admin | Password: password | Role: Admin
- Username: bs.hoa | Password: password | Role: Doctor
- Username: bs.nam | Password: password | Role: Doctor  
- Username: bs.cong | Password: password | Role: Doctor
- Username: bs.khoa | Password: password | Role: Doctor
- Username: lan.nguyen | Password: password | Role: Patient
- Username: tuan.pham | Password: password | Role: Patient
- Username: mai.hoang | Password: password | Role: Patient
- Username: duc.bui | Password: password | Role: Patient
- Username: huong.le | Password: password | Role: Staff

TẤT CẢ MẬT KHẨU ĐỀU LÀ: password
BCRYPT HASH: $2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi
*/