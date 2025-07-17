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


INSERT INTO `reviews` (`uuid`, `user_id`, `doctor_id`, `appointment_id`, `stars`, `comment`, `created_at`, `updated_at`) VALUES
('dg001', 'usr004', 'bs001', 'lh001', 5, 'Bác sĩ rất tận tình và chuyên nghiệp. Tôi rất hài lòng với dịch vụ.', NOW(), NOW()),
('dg002', 'usr005', 'bs003', 'lh002', 4, 'Bác sĩ khám rất kỹ lưỡng. Phòng khám sạch sẽ và thoải mái.', NOW(), NOW()),
('dg003', 'usr004', 'bs004', 'lh003', 5, 'Bác sĩ rất giỏi với trẻ em. Con tôi không hề sợ hãi.', NOW(), NOW()),
('dg004', 'usr007', 'bs005', 'lh004', 4, 'Dịch vụ tốt, thời gian chờ hợp lý. Sẽ quay lại lần sau.', NOW(), NOW()),
('dg005', 'usr010', 'bs002', 'lh005', 5, 'Bác sĩ phẫu thuật rất khéo léo. Tôi hồi phục nhanh chóng.', NOW(), NOW());
