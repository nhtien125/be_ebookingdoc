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