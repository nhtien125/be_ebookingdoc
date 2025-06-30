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

INSERT INTO hospitals (uuid, name, address, image, description) VALUES
('hosp0001uuid00000000000000000001','BV Đại Học Y Dược','217 Hồng Bàng, Q.5, TP.HCM',
'https://cdn-pkh.longvan.net/prod-partner/1482e04d-1f50-44d6-a0e0-a6324ffab01e-umc1.png',
'Bệnh viện Đại học Y Dược TP.HCM (UMC) là một trong những cơ sở y tế hàng đầu tại Việt Nam, nổi bật với đội ngũ bác sĩ, giáo sư giàu kinh nghiệm và hệ thống trang thiết bị hiện đại đạt chuẩn quốc tế. Bệnh viện cung cấp đầy đủ các chuyên khoa, đặc biệt mạnh về nội khoa, ngoại khoa, tim mạch, thần kinh và các dịch vụ kỹ thuật cao. Với phương châm “Chất lượng – An toàn – Hiệu quả”, UMC luôn tiên phong trong đổi mới y học, không ngừng nâng cao chất lượng chăm sóc, hướng đến sự hài lòng tối đa cho người bệnh. Đội ngũ nhân viên y tế của bệnh viện còn là những giảng viên đầu ngành, đảm bảo cập nhật kiến thức, kỹ năng liên tục, đóng góp lớn cho sự phát triển của nền y tế Việt Nam.'),

('hosp0002uuid00000000000000000002','BV Bạch Mai','78 Giải Phóng, Hà Nội',
'https://bcp.cdnchinhphu.vn/Uploaded/hoangtrongdien/2020_02_18/kh%C3%A1m-b%E1%BB%87nh-%E1%BB%9F-b%E1%BB%87nh-vi%E1%BB%87n-B%E1%BA%A1ch-Mai-1-1024x449.jpg',
'Bệnh viện Bạch Mai là bệnh viện đa khoa trung ương lớn nhất miền Bắc, đồng thời là cái nôi của nhiều chuyên ngành y học Việt Nam. Trải qua hơn 100 năm xây dựng và phát triển, Bạch Mai nổi bật với các lĩnh vực hồi sức cấp cứu, tim mạch, chẩn đoán hình ảnh, chấn thương chỉnh hình và phục hồi chức năng. Bệnh viện không ngừng cải tiến kỹ thuật mới, nâng cao chất lượng dịch vụ, đồng thời là trung tâm đào tạo, nghiên cứu khoa học hàng đầu, hợp tác sâu rộng với các tổ chức y tế quốc tế. Sứ mệnh của bệnh viện là mang lại dịch vụ y tế tiên tiến, nhân văn, góp phần bảo vệ và nâng cao sức khỏe cộng đồng.'),

('hosp0003uuid00000000000000000003','BV Chợ Rẫy','201B Nguyễn Chí Thanh, TP.HCM',
'https://images2.thanhnien.vn/528068263637045248/2024/2/15/img3752-17079665726211198504579.jpg',
'Bệnh viện Chợ Rẫy là một trong những bệnh viện tuyến cuối lớn nhất phía Nam, đóng vai trò quan trọng trong khám, chữa bệnh, đào tạo y khoa và chuyển giao kỹ thuật mới. Chợ Rẫy nổi tiếng với các chuyên ngành phẫu thuật, cấp cứu đa khoa, ghép tạng, điều trị ung bướu, tim mạch và chẩn đoán hình ảnh. Với đội ngũ bác sĩ đầu ngành, trang thiết bị đồng bộ, hiện đại, bệnh viện luôn tiên phong ứng dụng những thành tựu y học mới, phục vụ hàng nghìn lượt bệnh nhân mỗi ngày. Chợ Rẫy còn là trung tâm hợp tác quốc tế lớn, thường xuyên tiếp nhận, chuyển giao kỹ thuật từ các nước tiên tiến.'),

('hosp0004uuid00000000000000000004','BV Nhi Đồng 1','532 Lý Thái Tổ, TP.HCM',
'https://nhidong.org.vn/UploadImages/bvnhidong/PHP06/2023_5/bvdna.jpg',
'Bệnh viện Nhi Đồng 1 là bệnh viện chuyên khoa nhi hàng đầu khu vực phía Nam, với đội ngũ y bác sĩ tâm huyết, chuyên môn vững vàng cùng hệ thống trang thiết bị hiện đại. Bệnh viện cung cấp đầy đủ các dịch vụ chăm sóc sức khỏe trẻ em từ sơ sinh tới vị thành niên, từ điều trị bệnh lý nội – ngoại khoa, cấp cứu, phẫu thuật đến tư vấn dinh dưỡng, tâm lý và phục hồi chức năng. Luôn lấy trẻ em làm trung tâm, bệnh viện chú trọng phát triển dịch vụ thân thiện, môi trường sạch đẹp, an toàn, hướng tới sự phát triển toàn diện về thể chất và tinh thần cho trẻ.'),

('hosp0005uuid00000000000000000005','BV Đa Khoa Đà Nẵng','124 Hải Phòng, Đà Nẵng',
'https://lh6.googleusercontent.com/proxy/09gi6SMr0POZVcl3OW3I-fnhYPpw3rmbtG7gy4ouTXR5Hl5csq0rYEj_umcUCG0op6e7zVKpcPiVN2AFJiflTCRrycALComSNL4tAjyW',
'Bệnh viện Đa Khoa Đà Nẵng là trung tâm y tế lớn nhất khu vực miền Trung, nổi bật với sự phát triển đồng bộ các chuyên khoa, đội ngũ y bác sĩ nhiều năm kinh nghiệm và cơ sở vật chất hiện đại. Bệnh viện chú trọng ứng dụng các kỹ thuật y học tiên tiến, chăm sóc toàn diện người bệnh, đồng thời là cơ sở đào tạo thực hành cho nhiều trường đại học lớn. Với phương châm phục vụ tận tâm, bệnh viện không ngừng nâng cao chất lượng, đảm bảo an toàn và hiệu quả điều trị cho cộng đồng dân cư Đà Nẵng và các tỉnh lân cận.'),

('hosp0006uuid00000000000000000006','BV Việt Pháp','1 Phương Mai, Hà Nội',
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCBHhY6L-q8_TbikEiK2_cuUVn6V1Mcj_NXA&s',
'Bệnh viện Việt Pháp Hà Nội là bệnh viện quốc tế đầu tiên tại miền Bắc, kết hợp tinh hoa y học Việt Nam và Pháp, cung cấp dịch vụ y tế cao cấp, tiêu chuẩn quốc tế. Bệnh viện sở hữu hệ thống phòng khám, điều trị và chẩn đoán hiện đại, chuyên môn mạnh về sản khoa, nhi, ngoại khoa, nội tổng quát và các dịch vụ xét nghiệm. Đội ngũ y bác sĩ trong và ngoài nước được đào tạo bài bản, giàu kinh nghiệm, luôn lấy sự an toàn và hài lòng của người bệnh làm trọng tâm, đem lại trải nghiệm chăm sóc y tế tận tình, chuyên nghiệp.'),

('hosp0007uuid00000000000000000007','BV Ung Bướu','3 Nơ Trang Long, TP.HCM',
'https://youmed.vn/photos/c90bc798-1748-4cfa-9472-53882038476c.png',
'Bệnh viện Ung Bướu TP.HCM là trung tâm điều trị ung thư lớn nhất khu vực phía Nam, chuyên sâu về phát hiện, chẩn đoán và điều trị các loại bệnh ung thư với trang thiết bị hiện đại, kỹ thuật tiên tiến. Bệnh viện có đội ngũ y bác sĩ giàu kinh nghiệm, liên tục cập nhật phương pháp mới về hóa trị, xạ trị, phẫu thuật, chăm sóc giảm nhẹ và phục hồi chức năng. Ngoài ra, bệnh viện còn triển khai nhiều chương trình tư vấn, tầm soát ung thư cộng đồng, góp phần nâng cao nhận thức và phòng chống bệnh ung thư.'),

('hosp0008uuid00000000000000000008','BV Phụ Sản Từ Dũ','284 Cống Quỳnh, TP.HCM',
'https://images2.thanhnien.vn/zoom/686_429/Uploaded/tranduy/2022_09_10/bv-tu-du-0110092022-1043.jpg',
'Bệnh viện Phụ Sản Từ Dũ là một trong những bệnh viện chuyên ngành sản phụ khoa hàng đầu cả nước, nổi bật với lịch sử lâu đời, đội ngũ y bác sĩ tận tâm và trang thiết bị hiện đại. Từ Dũ chuyên cung cấp dịch vụ chăm sóc sức khỏe sinh sản, tư vấn, khám thai, sinh con, phẫu thuật sản phụ khoa, hỗ trợ sinh sản, điều trị hiếm muộn, đồng thời chú trọng xây dựng môi trường thân thiện, an toàn cho sản phụ và trẻ sơ sinh. Với phương châm “Tận tâm – Chu đáo – Hiện đại”, bệnh viện không ngừng đổi mới để đáp ứng nhu cầu ngày càng cao của cộng đồng.'),

('hosp0009uuid00000000000000000009','BV Quân Y 175','786 Nguyễn Kiệm, Gò Vấp, TP.HCM',
'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-asm/blog/benh-vien-quan-y-115.webp',
'Bệnh viện Quân Y 175 trực thuộc Bộ Quốc phòng, là cơ sở y tế đa khoa lớn, không chỉ phục vụ cán bộ, chiến sĩ quân đội mà còn đáp ứng nhu cầu khám chữa bệnh cho nhân dân trên địa bàn phía Nam. Bệnh viện sở hữu hệ thống phòng mổ, hồi sức, chẩn đoán và điều trị hiện đại, nhiều chuyên khoa sâu như tim mạch, thần kinh, ung bướu, chấn thương chỉnh hình, đặc biệt nổi bật về sơ cấp cứu, điều trị chấn thương do tai nạn. Quân Y 175 cũng là trung tâm huấn luyện, hợp tác quốc tế về y học quân sự lớn của cả nước.'),

('hosp0010uuid00000000000000000010','BV Hữu Nghị','1 Tràng Tiền, Hà Nội',
'https://cdn.youmed.vn/tin-tuc/wp-content/uploads/2020/04/images1534192_3.jpg',
'Bệnh viện Hữu Nghị Hà Nội là bệnh viện đa khoa trung ương, nổi tiếng với các chuyên ngành nội khoa, lão khoa, tim mạch, tiêu hóa, thận tiết niệu, phục hồi chức năng và nhiều chuyên khoa sâu khác. Đội ngũ y bác sĩ tại đây giàu kinh nghiệm, luôn tận tụy với người bệnh. Bệnh viện thường xuyên ứng dụng các kỹ thuật mới trong chẩn đoán và điều trị, đồng thời là nơi đào tạo, chuyển giao kỹ thuật cho nhiều bệnh viện tuyến dưới. Với truyền thống đoàn kết, tinh thần trách nhiệm cao, bệnh viện luôn nỗ lực nâng cao chất lượng chăm sóc sức khỏe nhân dân.');

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

INSERT INTO specializations (uuid, name) VALUES
('spec0001uuid00000000000000000001','Tim mạch'),
('spec0002uuid00000000000000000002','Nhi khoa'),
('spec0003uuid00000000000000000003','Da liễu'),
('spec0004uuid00000000000000000004','Thần kinh'),
('spec0005uuid00000000000000000005','Ngoại tổng quát'),
('spec0006uuid00000000000000000006','Sản phụ khoa'),
('spec0007uuid00000000000000000007','Răng hàm mặt'),
('spec0008uuid00000000000000000008','Ung bướu'),
('spec0009uuid00000000000000000009','Nội tiết'),
('spec0010uuid00000000000000000010','Chấn thương chỉnh hình');


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


INSERT INTO clinics (uuid, name, address, phone, email, image, description) VALUES
('cli0001uuid00000000000000000001','PK Nội Tổng Quát','123 Pasteur, TP.HCM','0908000001','ntq1@bv.com','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnpAc6NmJ7rpiDKR5NzMU-flZ28IK8o1EapA&s',
'Phòng khám Nội Tổng Quát chuyên tiếp nhận và điều trị đa dạng các bệnh lý nội khoa cho mọi lứa tuổi. Đội ngũ bác sĩ dày dạn kinh nghiệm, trang thiết bị hiện đại, đảm bảo phát hiện sớm và kiểm soát hiệu quả các bệnh mãn tính như tiểu đường, cao huyết áp, tim mạch, hô hấp… Chúng tôi cam kết chăm sóc tận tình, tư vấn chuyên sâu, đồng hành cùng bệnh nhân trong suốt quá trình điều trị để nâng cao chất lượng cuộc sống.'),

('cli0002uuid00000000000000000002','PK Nhi','50 Hoàng Văn Thụ, Đà Nẵng','0908000002','nhi@bv.com','https://saigonreview.vn/wp-content/uploads/2023/12/phong-kham-nhi-tai-tphcm-5.jpg',
'Phòng khám Nhi là nơi các bậc phụ huynh an tâm gửi gắm sức khỏe con trẻ. Với đội ngũ bác sĩ nhiệt huyết, giàu chuyên môn và không gian thân thiện, trẻ em sẽ được khám, tư vấn dinh dưỡng, theo dõi phát triển thể chất – tâm lý, điều trị các bệnh lý thường gặp ở trẻ nhỏ. Chúng tôi đặc biệt chú trọng đến sự hợp tác với gia đình trong quá trình chăm sóc và điều trị cho bé.'),

('cli0003uuid00000000000000000003','PK Da liễu','15 Lê Lợi, Hà Nội','0908000003','dalieu@bv.com','https://ecopharma.com.vn/wp-content/uploads/2024/12/phong-kham-da-lieu-pro-skin-tai-tphcm.jpg',
'Chuyên điều trị các bệnh lý da liễu từ cơ bản đến chuyên sâu như viêm da, dị ứng, mụn trứng cá, chăm sóc và phục hồi làn da khoẻ mạnh.'),

('cli0004uuid00000000000000000004','PK Răng Hàm Mặt','22 Nguyễn Huệ, TP.HCM','0908000004','rhm@bv.com','https://benhviensaigonnamdinh.vn/wp-content/uploads/2023/06/khoa-rang-ham-mat-sn2.webp',
'Phòng khám Răng Hàm Mặt cung cấp dịch vụ chăm sóc, phòng ngừa và điều trị các bệnh lý răng miệng, chỉnh nha, phục hình răng.'),

('cli0005uuid00000000000000000005','PK Ngoại','88 Trường Chinh, Đà Nẵng','0908000005','ngoai@bv.com','https://benhvientthhatinh.vn/public/img/images/phong-kham-ngoai-tong-hop-tth-ha-tinh.jpg',
'Khám và điều trị ngoại khoa tổng quát, phẫu thuật, xử lý vết thương và các bệnh lý ngoại khoa khác.'),

('cli0006uuid00000000000000000006','PK Sản Phụ','56 Nguyễn Tri Phương, Hà Nội','0908000006','sanphu@bv.com','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv9hbhivpNWEe_5Ai25CjaGWtlrW48ixpXOA&s',
'Khám và theo dõi thai sản, tư vấn sức khỏe sinh sản, điều trị các bệnh lý phụ khoa với đội ngũ bác sĩ giàu kinh nghiệm.'),

('cli0007uuid00000000000000000007','PK Nội Tiết','24 Phan Đăng Lưu, TP.HCM','0908000007','noitiet@bv.com','https://cdn.benhvienthucuc.vn/wp-content/uploads/2021/06/kham-noi-tiet-la-gi.jpg',
'Chuyên khám, tư vấn và điều trị các bệnh rối loạn nội tiết, đái tháo đường, tuyến giáp, tuyến yên…'),

('cli0008uuid00000000000000000008','PK Thần Kinh','37 Nguyễn Trãi, Hà Nội','0908000008','thankinh@bv.com','https://www.victoriavn.com/images/cacchuyenkhoa/N%E1%BB%98I_TH%E1%BA%A6N_KINH.JPG',
'Khám, chẩn đoán và điều trị các bệnh lý thần kinh: đau đầu, động kinh, tai biến mạch máu não, bệnh Parkinson, rối loạn vận động…'),

('cli0009uuid00000000000000000009','PK Ung Bướu','10 Nguyễn Văn Trỗi, TP.HCM','0908000009','ungbuou@bv.com','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIM8CpFHw3CygRmoU3QADdi6-cjzjSYr9snw&s',
'Chuyên sâu về tầm soát, chẩn đoán và điều trị các bệnh ung thư, tư vấn phòng ngừa và chăm sóc bệnh nhân ung thư.'),

('cli0010uuid00000000000000000010','PK Chấn Thương','90 Đinh Tiên Hoàng, Đà Nẵng','0908000010','chcth@bv.com','https://phongkhambsvinh.com/thumbs/1366x544x1/upload/photo/blue-simple-medical-clinic-banner-1-7489.png',
'Khám và điều trị các chấn thương cơ xương khớp, phục hồi chức năng sau tai nạn, phẫu thuật chỉnh hình.');


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


INSERT INTO vaccination_centers (uuid, name, address, phone, email, image, description, status, working_hours) VALUES
('vac0001uuid00000000000000000001','Trung tâm Tiêm chủng Pasteur','167 Pasteur, Quận 3, TP.HCM','0908123456','pasteur@vaccine.com','https://wellavn.com/wp-content/uploads/2024/11/anh-gai-2007-9.jpg',
'Trung tâm Tiêm chủng Pasteur cung cấp đa dạng các loại vaccine cho trẻ em và người lớn, đội ngũ y bác sĩ chuyên môn cao, hệ thống bảo quản vaccine đạt tiêu chuẩn quốc tế.',
'open','07:30 - 17:00'),

('vac0002uuid00000000000000000002','Trung tâm Tiêm chủng VNVC','198 Hoàng Văn Thụ, Phú Nhuận, TP.HCM','0908345678','vnvc@vaccine.com','https://wellavn.com/wp-content/uploads/2024/11/anh-gai-2007-9.jpg',
'VNVC là hệ thống tiêm chủng hiện đại, chuyên cung cấp các loại vaccine nhập khẩu, không gian sạch đẹp, quy trình an toàn cho mọi lứa tuổi.',
'open','07:00 - 18:00'),

('vac0003uuid00000000000000000003','Trung tâm Tiêm chủng Bệnh viện Nhi Đồng 1','341 Sư Vạn Hạnh, Quận 10, TP.HCM','0908567890','nhi1@vaccine.com','https://wellavn.com/wp-content/uploads/2024/11/anh-gai-2007-9.jpg',
'Chuyên cung cấp các dịch vụ tiêm chủng cho trẻ sơ sinh, trẻ nhỏ, tư vấn sức khỏe, phòng ngừa bệnh truyền nhiễm cho cộng đồng.',
'closed','07:30 - 16:30'),

('vac0004uuid00000000000000000004','Trung tâm Tiêm chủng Đà Nẵng','95 Hải Phòng, Quận Hải Châu, Đà Nẵng','0908678912','tcdanang@vaccine.com','https://wellavn.com/wp-content/uploads/2024/11/anh-gai-2007-9.jpg',
'Trung tâm tiêm chủng lớn nhất miền Trung, đáp ứng nhu cầu tiêm vaccine phòng bệnh cho trẻ em, người lớn với quy trình nhanh chóng, an toàn.',
'open','08:00 - 17:00'),

('vac0005uuid00000000000000000005','Trung tâm Tiêm chủng Quốc tế City','02 Trường Chinh, Quận Tân Bình, TP.HCM','0908789123','tcqt@vaccine.com','https://wellavn.com/wp-content/uploads/2024/11/anh-gai-2007-9.jpg',
'Trung tâm chuyên cung cấp các loại vaccine nhập khẩu, tư vấn miễn phí trước tiêm, theo dõi sau tiêm và chăm sóc khách hàng chuyên nghiệp.',
'closed','07:00 - 17:30');


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

INSERT INTO `premission` (`id`, `name`) VALUES
(1, 'Quản trị viên'),
(2, 'Bác sĩ'),
(3, 'Người dùng');


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

INSERT INTO user 
(uuid, premission_id, name, email, phone, gender, address, username, password, status, image, birth_day) VALUES
('user0001uuid00000000000000000001',2,'BS Nguyễn Quang H','bs1@bv.com','0911000001',1,'TP.HCM','bs1','123456',1,'https://chienthanky.vn/wp-content/uploads/2024/01/top-100-anh-gai-2k7-cuc-xinh-ngay-tho-thuan-khiet-2169.jpg', '1990-02-01'),
('user0002uuid00000000000000000002',2,'BS Trần Thị Bích','bs2@bv.com','0911000002',0,'Hà Nội','bs2','123456',1,'https://chienthanky.vn/wp-content/uploads/2024/01/top-100-anh-gai-2k7-cuc-xinh-ngay-tho-thuan-khiet-2169-1.jpg', '1987-03-22'),
('user0003uuid00000000000000000003',2,'BS Lê Văn C','bs3@bv.com','0911000003',1,'Đà Nẵng','bs3','123456',1,'https://chienthanky.vn/wp-content/uploads/2024/01/top-100-anh-gai-2k7-cuc-xinh-ngay-tho-thuan-khiet-2169-5.jpg', '1992-10-15'),
('user0004uuid00000000000000000004',2,'BS Nguyễn Minh D','bs4@bv.com','0911000004',1,'TP.HCM','bs4','123456',1,'https://chienthanky.vn/wp-content/uploads/2024/01/top-100-anh-gai-2k7-cuc-xinh-ngay-tho-thuan-khiet-2169-8.jpg', '1989-08-09'),
('user0005uuid00000000000000000005',2,'BS Phạm Thị E','bs5@bv.com','0911000005',0,'Hà Nội','bs5','123456',1,'https://chienthanky.vn/wp-content/uploads/2024/01/top-100-anh-gai-2k7-cuc-xinh-ngay-tho-thuan-khiet-2169-10.jpg', '1991-06-21'),
('user0006uuid00000000000000000006',2,'BS Nguyễn Thị F','bs6@bv.com','0911000006',0,'Đà Nẵng','bs6','123456',1,'https://chienthanky.vn/wp-content/uploads/2024/01/top-100-anh-gai-2k7-cuc-xinh-ngay-tho-thuan-khiet-2169-12.jpg', '1993-12-03'),
('user0007uuid00000000000000000007',2,'BS Trương Văn G','bs7@bv.com','0911000007',1,'TP.HCM','bs7','123456',1,'https://chienthanky.vn/wp-content/uploads/2024/01/top-100-anh-gai-2k7-cuc-xinh-ngay-tho-thuan-khiet-2169-13.jpg', '1988-11-28'),
('user0008uuid00000000000000000008',3,'BN Trần Thị A','bn1@bn.com','0922000008',0,'TP.HCM','bn1','123456',1,'https://chienthanky.vn/wp-content/uploads/2024/01/top-100-anh-gai-2k7-cuc-xinh-ngay-tho-thuan-khiet-2169-15.jpg', '1999-01-10'),
('user0009uuid00000000000000000009',3,'BN Lê Văn B','bn2@bn.com','0922000009',1,'Hà Nội','bn2','123456',1,'https://chienthanky.vn/wp-content/uploads/2024/01/top-100-anh-gai-2k7-cuc-xinh-ngay-tho-thuan-khiet-2169-17.jpg', '1997-05-17'),
('user0010uuid00000000000000000010',3,'BN Nguyễn Văn C','bn3@bn.com','0922000010',1,'Đà Nẵng','bn3','123456',1,'https://chienthanky.vn/wp-content/uploads/2024/01/top-100-anh-gai-2k7-cuc-xinh-ngay-tho-thuan-khiet-2169-28.jpg', '2000-07-30');


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


INSERT INTO patients (uuid, user_id, name, dob, gender, phone, relationship, address)
VALUES
('pat0001uuid00000000000000000001','user0008uuid00000000000000000008','LÔ THỊ NỘ','1990-01-01','Nữ','0987654321','Bản thân','TP HCM'),
('pat0002uuid00000000000000000002','user0009uuid00000000000000000009','NGUYỄN VĂN A','1985-05-15','Nam','0911111111','Chồng','Hà Nội'),
('pat0003uuid00000000000000000003','user0010uuid00000000000000000010','TRẦN THỊ B','2000-12-31','Nữ','0902222222','Con','Đà Nẵng');


-- ===========================
-- 8. BÁC SĨ (DOCTORS)
-- ===========================
CREATE TABLE `doctors` (
  `uuid` char(32) NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  `hospital_id` char(32) DEFAULT NULL,
  `clinic_id` char(32) DEFAULT NULL,            -- Thêm clinic_id
  `doctor_type` tinyint(1) DEFAULT NULL,
  `specialization_id` char(32) DEFAULT NULL,
  `license` varchar(32) DEFAULT NULL,
  `introduce` varchar(2000) DEFAULT NULL,
  `experience` INT DEFAULT 0,
  `image` varchar(500) DEFAULT NULL,
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

INSERT INTO doctors
(uuid, user_id, hospital_id, clinic_id, doctor_type, specialization_id, license, introduce, experience, image)
VALUES
-- BS ở bệnh viện (clinic_id NULL)
('doc0001uuid00000000000000000001','user0001uuid00000000000000000001','hosp0001uuid00000000000000000001',NULL,1,'spec0001uuid00000000000000000001','BS12345','Chuyên gia tim mạch, từng tu nghiệp tại Pháp, tận tâm với bệnh nhân.',12,'https://chienthanky.vn/wp-content/uploads/2024/01/top-100-anh-gai-2k7-cuc-xinh-ngay-tho-thuan-khiet-2169-31.jpg'),

-- BS ở phòng khám (hospital_id NULL)
('doc0002uuid00000000000000000002','user0002uuid00000000000000000002',NULL,'cli0002uuid00000000000000000002',2,'spec0002uuid00000000000000000002','BS23456','Chuyên gia nhi, nhiều năm kinh nghiệm điều trị trẻ nhỏ, tư vấn tận tình.',10,'https://chienthanky.vn/wp-content/uploads/2024/01/top-100-anh-gai-2k7-cuc-xinh-ngay-tho-thuan-khiet-2169-32.jpg'),

('doc0003uuid00000000000000000003','user0003uuid00000000000000000003','hosp0003uuid00000000000000000003',NULL,1,'spec0003uuid00000000000000000003','BS34567','Chuyên gia da liễu, nổi tiếng với liệu trình trị mụn và trẻ hóa da.',15,'https://chienthanky.vn/wp-content/uploads/2024/01/top-100-anh-gai-2k7-cuc-xinh-ngay-tho-thuan-khiet-2169-39.jpg'),

('doc0004uuid00000000000000000004','user0004uuid00000000000000000004',NULL,'cli0004uuid00000000000000000004',2,'spec0004uuid00000000000000000004','BS45678','Chuyên gia thần kinh, từng công tác tại nhiều bệnh viện lớn.',8,'https://chienthanky.vn/wp-content/uploads/2024/01/top-100-anh-gai-2k7-cuc-xinh-ngay-tho-thuan-khiet-2169-40.jpg'),

('doc0005uuid00000000000000000005','user0005uuid00000000000000000005','hosp0005uuid00000000000000000005',NULL,1,'spec0005uuid00000000000000000005','BS56789','Chuyên gia ngoại tổng quát, phẫu thuật thành công hơn 6000 ca.',20,'https://chienthanky.vn/wp-content/uploads/2024/01/top-100-anh-gai-2k7-cuc-xinh-ngay-tho-thuan-khiet-2169-40.jpg'),

('doc0006uuid00000000000000000006','user0006uuid00000000000000000006',NULL,'cli0006uuid00000000000000000006',2,'spec0006uuid00000000000000000006','BS67890','Chuyên gia sản phụ khoa, đồng hành cùng hơn 2000 ca sinh.',9,'https://chienthanky.vn/wp-content/uploads/2024/01/top-100-anh-gai-2k7-cuc-xinh-ngay-tho-thuan-khiet-2169-46.jpg'),

('doc0007uuid00000000000000000007','user0007uuid00000000000000000007','hosp0007uuid00000000000000000007',NULL,1,'spec0007uuid00000000000000000007','BS78901','Chuyên gia răng hàm mặt, giàu kinh nghiệm thẩm mỹ và phục hình.',11,'https://chienthanky.vn/wp-content/uploads/2024/01/top-100-anh-gai-2k7-cuc-xinh-ngay-tho-thuan-khiet-2169-46.jpg');

-- ===========================
-- 9. LỊCH LÀM VIỆC (SCHEDULES)
-- ===========================
CREATE TABLE `schedules` (
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

INSERT INTO schedules (uuid, doctor_id, work_date, start_time, end_time) VALUES
('sch0001uuid010101','doc0001uuid00000000000000000001','2025-06-30','08:00:00','12:00:00'),
('sch0002uuid010102','doc0001uuid00000000000000000001','2025-06-30','13:00:00','17:00:00'),
('sch0003uuid010201','doc0001uuid00000000000000000001','2025-07-01','07:00:00','10:00:00'),
('sch0004uuid010202','doc0001uuid00000000000000000001','2025-07-01','10:30:00','14:00:00'),
('sch0005uuid010203','doc0001uuid00000000000000000001','2025-07-01','14:30:00','17:30:00'),
('sch0006uuid010301','doc0001uuid00000000000000000001','2025-07-02','06:00:00','09:00:00'),
('sch0007uuid010302','doc0001uuid00000000000000000001','2025-07-02','09:30:00','12:00:00'),
('sch0008uuid010303','doc0001uuid00000000000000000001','2025-07-02','13:00:00','15:00:00'),
('sch0009uuid010304','doc0001uuid00000000000000000001','2025-07-02','15:30:00','18:00:00'),
('sch0010uuid010401','doc0001uuid00000000000000000001','2025-07-03','08:00:00','12:00:00'),
('sch0011uuid010402','doc0001uuid00000000000000000001','2025-07-03','13:00:00','17:00:00'),
('sch0012uuid010501','doc0001uuid00000000000000000001','2025-07-04','07:00:00','10:00:00'),
('sch0013uuid010502','doc0001uuid00000000000000000001','2025-07-04','10:30:00','14:00:00'),
('sch0014uuid010503','doc0001uuid00000000000000000001','2025-07-04','14:30:00','17:30:00'),
('sch0015uuid010601','doc0001uuid00000000000000000001','2025-07-05','06:00:00','09:00:00'),
('sch0016uuid010602','doc0001uuid00000000000000000001','2025-07-05','09:30:00','12:00:00'),
('sch0017uuid010603','doc0001uuid00000000000000000001','2025-07-05','13:00:00','15:00:00'),
('sch0018uuid010604','doc0001uuid00000000000000000001','2025-07-05','15:30:00','18:00:00'),
('sch0019uuid010701','doc0001uuid00000000000000000001','2025-07-06','08:00:00','12:00:00'),
('sch0020uuid010702','doc0001uuid00000000000000000001','2025-07-06','13:00:00','17:00:00'),

('sch0021uuid020101','doc0002uuid00000000000000000002','2025-06-30','08:00:00','12:00:00'),
('sch0022uuid020102','doc0002uuid00000000000000000002','2025-06-30','13:00:00','17:00:00'),
('sch0023uuid020201','doc0002uuid00000000000000000002','2025-07-01','07:00:00','10:00:00'),
('sch0024uuid020202','doc0002uuid00000000000000000002','2025-07-01','10:30:00','14:00:00'),
('sch0025uuid020203','doc0002uuid00000000000000000002','2025-07-01','14:30:00','17:30:00'),
('sch0026uuid020301','doc0002uuid00000000000000000002','2025-07-02','06:00:00','09:00:00'),
('sch0027uuid020302','doc0002uuid00000000000000000002','2025-07-02','09:30:00','12:00:00'),
('sch0028uuid020303','doc0002uuid00000000000000000002','2025-07-02','13:00:00','15:00:00'),
('sch0029uuid020304','doc0002uuid00000000000000000002','2025-07-02','15:30:00','18:00:00'),
('sch0030uuid020401','doc0002uuid00000000000000000002','2025-07-03','08:00:00','12:00:00'),
('sch0031uuid020402','doc0002uuid00000000000000000002','2025-07-03','13:00:00','17:00:00'),
('sch0032uuid020501','doc0002uuid00000000000000000002','2025-07-04','07:00:00','10:00:00'),
('sch0033uuid020502','doc0002uuid00000000000000000002','2025-07-04','10:30:00','14:00:00'),
('sch0034uuid020503','doc0002uuid00000000000000000002','2025-07-04','14:30:00','17:30:00'),
('sch0035uuid020601','doc0002uuid00000000000000000002','2025-07-05','06:00:00','09:00:00'),
('sch0036uuid020602','doc0002uuid00000000000000000002','2025-07-05','09:30:00','12:00:00'),
('sch0037uuid020603','doc0002uuid00000000000000000002','2025-07-05','13:00:00','15:00:00'),
('sch0038uuid020604','doc0002uuid00000000000000000002','2025-07-05','15:30:00','18:00:00'),
('sch0039uuid020701','doc0002uuid00000000000000000002','2025-07-06','08:00:00','12:00:00'),
('sch0040uuid020702','doc0002uuid00000000000000000002','2025-07-06','13:00:00','17:00:00'),

('sch0041uuid030101','doc0003uuid00000000000000000003','2025-06-30','08:00:00','12:00:00'),
('sch0042uuid030102','doc0003uuid00000000000000000003','2025-06-30','13:00:00','17:00:00'),
('sch0043uuid030201','doc0003uuid00000000000000000003','2025-07-01','07:00:00','10:00:00'),
('sch0044uuid030202','doc0003uuid00000000000000000003','2025-07-01','10:30:00','14:00:00'),
('sch0045uuid030203','doc0003uuid00000000000000000003','2025-07-01','14:30:00','17:30:00'),
('sch0046uuid030301','doc0003uuid00000000000000000003','2025-07-02','06:00:00','09:00:00'),
('sch0047uuid030302','doc0003uuid00000000000000000003','2025-07-02','09:30:00','12:00:00'),
('sch0048uuid030303','doc0003uuid00000000000000000003','2025-07-02','13:00:00','15:00:00'),
('sch0049uuid030304','doc0003uuid00000000000000000003','2025-07-02','15:30:00','18:00:00'),
('sch0050uuid030401','doc0003uuid00000000000000000003','2025-07-03','08:00:00','12:00:00'),
('sch0051uuid030402','doc0003uuid00000000000000000003','2025-07-03','13:00:00','17:00:00'),
('sch0052uuid030501','doc0003uuid00000000000000000003','2025-07-04','07:00:00','10:00:00'),
('sch0053uuid030502','doc0003uuid00000000000000000003','2025-07-04','10:30:00','14:00:00'),
('sch0054uuid030503','doc0003uuid00000000000000000003','2025-07-04','14:30:00','17:30:00'),
('sch0055uuid030601','doc0003uuid00000000000000000003','2025-07-05','06:00:00','09:00:00'),
('sch0056uuid030602','doc0003uuid00000000000000000003','2025-07-05','09:30:00','12:00:00'),
('sch0057uuid030603','doc0003uuid00000000000000000003','2025-07-05','13:00:00','15:00:00'),
('sch0058uuid030604','doc0003uuid00000000000000000003','2025-07-05','15:30:00','18:00:00'),
('sch0059uuid030701','doc0003uuid00000000000000000003','2025-07-06','08:00:00','12:00:00'),
('sch0060uuid030702','doc0003uuid00000000000000000003','2025-07-06','13:00:00','17:00:00'),

('sch0061uuid040101','doc0004uuid00000000000000000004','2025-06-30','08:00:00','12:00:00'),
('sch0062uuid040102','doc0004uuid00000000000000000004','2025-06-30','13:00:00','17:00:00'),
('sch0063uuid040201','doc0004uuid00000000000000000004','2025-07-01','07:00:00','10:00:00'),
('sch0064uuid040202','doc0004uuid00000000000000000004','2025-07-01','10:30:00','14:00:00'),
('sch0065uuid040203','doc0004uuid00000000000000000004','2025-07-01','14:30:00','17:30:00'),
('sch0066uuid040301','doc0004uuid00000000000000000004','2025-07-02','06:00:00','09:00:00'),
('sch0067uuid040302','doc0004uuid00000000000000000004','2025-07-02','09:30:00','12:00:00'),
('sch0068uuid040303','doc0004uuid00000000000000000004','2025-07-02','13:00:00','15:00:00'),
('sch0069uuid040304','doc0004uuid00000000000000000004','2025-07-02','15:30:00','18:00:00'),
('sch0070uuid040401','doc0004uuid00000000000000000004','2025-07-03','08:00:00','12:00:00'),
('sch0071uuid040402','doc0004uuid00000000000000000004','2025-07-03','13:00:00','17:00:00'),
('sch0072uuid040501','doc0004uuid00000000000000000004','2025-07-04','07:00:00','10:00:00'),
('sch0073uuid040502','doc0004uuid00000000000000000004','2025-07-04','10:30:00','14:00:00'),
('sch0074uuid040503','doc0004uuid00000000000000000004','2025-07-04','14:30:00','17:30:00'),
('sch0075uuid040601','doc0004uuid00000000000000000004','2025-07-05','06:00:00','09:00:00'),
('sch0076uuid040602','doc0004uuid00000000000000000004','2025-07-05','09:30:00','12:00:00'),
('sch0077uuid040603','doc0004uuid00000000000000000004','2025-07-05','13:00:00','15:00:00'),
('sch0078uuid040604','doc0004uuid00000000000000000004','2025-07-05','15:30:00','18:00:00'),
('sch0079uuid040701','doc0004uuid00000000000000000004','2025-07-06','08:00:00','12:00:00'),
('sch0080uuid040702','doc0004uuid00000000000000000004','2025-07-06','13:00:00','17:00:00'),

('sch0081uuid050101','doc0005uuid00000000000000000005','2025-06-30','08:00:00','12:00:00'),
('sch0082uuid050102','doc0005uuid00000000000000000005','2025-06-30','13:00:00','17:00:00'),
('sch0083uuid050201','doc0005uuid00000000000000000005','2025-07-01','07:00:00','10:00:00'),
('sch0084uuid050202','doc0005uuid00000000000000000005','2025-07-01','10:30:00','14:00:00'),
('sch0085uuid050203','doc0005uuid00000000000000000005','2025-07-01','14:30:00','17:30:00'),
('sch0086uuid050301','doc0005uuid00000000000000000005','2025-07-02','06:00:00','09:00:00'),
('sch0087uuid050302','doc0005uuid00000000000000000005','2025-07-02','09:30:00','12:00:00'),
('sch0088uuid050303','doc0005uuid00000000000000000005','2025-07-02','13:00:00','15:00:00'),
('sch0089uuid050304','doc0005uuid00000000000000000005','2025-07-02','15:30:00','18:00:00'),
('sch0090uuid050401','doc0005uuid00000000000000000005','2025-07-03','08:00:00','12:00:00'),
('sch0091uuid050402','doc0005uuid00000000000000000005','2025-07-03','13:00:00','17:00:00'),
('sch0092uuid050501','doc0005uuid00000000000000000005','2025-07-04','07:00:00','10:00:00'),
('sch0093uuid050502','doc0005uuid00000000000000000005','2025-07-04','10:30:00','14:00:00'),
('sch0094uuid050503','doc0005uuid00000000000000000005','2025-07-04','14:30:00','17:30:00'),
('sch0095uuid050601','doc0005uuid00000000000000000005','2025-07-05','06:00:00','09:00:00'),
('sch0096uuid050602','doc0005uuid00000000000000000005','2025-07-05','09:30:00','12:00:00'),
('sch0097uuid050603','doc0005uuid00000000000000000005','2025-07-05','13:00:00','15:00:00'),
('sch0098uuid050604','doc0005uuid00000000000000000005','2025-07-05','15:30:00','18:00:00'),
('sch0099uuid050701','doc0005uuid00000000000000000005','2025-07-06','08:00:00','12:00:00'),
('sch0100uuid050702','doc0005uuid00000000000000000005','2025-07-06','13:00:00','17:00:00'),

('sch0101uuid060101','doc0006uuid00000000000000000006','2025-06-30','08:00:00','12:00:00'),
('sch0102uuid060102','doc0006uuid00000000000000000006','2025-06-30','13:00:00','17:00:00'),
('sch0103uuid060201','doc0006uuid00000000000000000006','2025-07-01','07:00:00','10:00:00'),
('sch0104uuid060202','doc0006uuid00000000000000000006','2025-07-01','10:30:00','14:00:00'),
('sch0105uuid060203','doc0006uuid00000000000000000006','2025-07-01','14:30:00','17:30:00'),
('sch0106uuid060301','doc0006uuid00000000000000000006','2025-07-02','06:00:00','09:00:00'),
('sch0107uuid060302','doc0006uuid00000000000000000006','2025-07-02','09:30:00','12:00:00'),
('sch0108uuid060303','doc0006uuid00000000000000000006','2025-07-02','13:00:00','15:00:00'),
('sch0109uuid060304','doc0006uuid00000000000000000006','2025-07-02','15:30:00','18:00:00'),
('sch0110uuid060401','doc0006uuid00000000000000000006','2025-07-03','08:00:00','12:00:00'),
('sch0111uuid060402','doc0006uuid00000000000000000006','2025-07-03','13:00:00','17:00:00'),
('sch0112uuid060501','doc0006uuid00000000000000000006','2025-07-04','07:00:00','10:00:00'),
('sch0113uuid060502','doc0006uuid00000000000000000006','2025-07-04','10:30:00','14:00:00'),
('sch0114uuid060503','doc0006uuid00000000000000000006','2025-07-04','14:30:00','17:30:00'),
('sch0115uuid060601','doc0006uuid00000000000000000006','2025-07-05','06:00:00','09:00:00'),
('sch0116uuid060602','doc0006uuid00000000000000000006','2025-07-05','09:30:00','12:00:00'),
('sch0117uuid060603','doc0006uuid00000000000000000006','2025-07-05','13:00:00','15:00:00'),
('sch0118uuid060604','doc0006uuid00000000000000000006','2025-07-05','15:30:00','18:00:00'),
('sch0119uuid060701','doc0006uuid00000000000000000006','2025-07-06','08:00:00','12:00:00'),
('sch0120uuid060702','doc0006uuid00000000000000000006','2025-07-06','13:00:00','17:00:00'),

('sch0121uuid070101','doc0007uuid00000000000000000007','2025-06-30','08:00:00','12:00:00'),
('sch0122uuid070102','doc0007uuid00000000000000000007','2025-06-30','13:00:00','17:00:00'),
('sch0123uuid070201','doc0007uuid00000000000000000007','2025-07-01','07:00:00','10:00:00'),
('sch0124uuid070202','doc0007uuid00000000000000000007','2025-07-01','10:30:00','14:00:00'),
('sch0125uuid070203','doc0007uuid00000000000000000007','2025-07-01','14:30:00','17:30:00'),
('sch0126uuid070301','doc0007uuid00000000000000000007','2025-07-02','06:00:00','09:00:00'),
('sch0127uuid070302','doc0007uuid00000000000000000007','2025-07-02','09:30:00','12:00:00'),
('sch0128uuid070303','doc0007uuid00000000000000000007','2025-07-02','13:00:00','15:00:00'),
('sch0129uuid070304','doc0007uuid00000000000000000007','2025-07-02','15:30:00','18:00:00'),
('sch0130uuid070401','doc0007uuid00000000000000000007','2025-07-03','08:00:00','12:00:00'),
('sch0131uuid070402','doc0007uuid00000000000000000007','2025-07-03','13:00:00','17:00:00'),
('sch0132uuid070501','doc0007uuid00000000000000000007','2025-07-04','07:00:00','10:00:00'),
('sch0133uuid070502','doc0007uuid00000000000000000007','2025-07-04','10:30:00','14:00:00'),
('sch0134uuid070503','doc0007uuid00000000000000000007','2025-07-04','14:30:00','17:30:00'),
('sch0135uuid070601','doc0007uuid00000000000000000007','2025-07-05','06:00:00','09:00:00'),
('sch0136uuid070602','doc0007uuid00000000000000000007','2025-07-05','09:30:00','12:00:00'),
('sch0137uuid070603','doc0007uuid00000000000000000007','2025-07-05','13:00:00','15:00:00'),
('sch0138uuid070604','doc0007uuid00000000000000000007','2025-07-05','15:30:00','18:00:00'),
('sch0139uuid070701','doc0007uuid00000000000000000007','2025-07-06','08:00:00','12:00:00'),
('sch0140uuid070702','doc0007uuid00000000000000000007','2025-07-06','13:00:00','17:00:00');

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

INSERT INTO medical_services (uuid, name, description, price, specialization_id, clinic_id, hospital_id, image) VALUES
('ms0001uuid00000000000000000001','Xét nghiệm máu','Kiểm tra chỉ số máu',200000,'spec0001uuid00000000000000000001','cli0001uuid00000000000000000001','hosp0001uuid00000000000000000001','https://chienthanky.vn/wp-content/uploads/2024/01/150-hinh-anh-gai-xinh-2k5-2k6-ngay-tho-hon-nhien-3183-1.jpg'),
('ms0002uuid00000000000000000002','Khám nhi','Khám sức khỏe cho trẻ',150000,'spec0002uuid00000000000000000002','cli0002uuid00000000000000000002','hosp0002uuid00000000000000000002','https://chienthanky.vn/wp-content/uploads/2024/01/150-hinh-anh-gai-xinh-2k5-2k6-ngay-tho-hon-nhien-3183-4.jpg'),
('ms0003uuid00000000000000000003','Khám da liễu','Tư vấn da',180000,'spec0003uuid00000000000000000003','cli0003uuid00000000000000000003','hosp0003uuid00000000000000000003','https://chienthanky.vn/wp-content/uploads/2024/01/150-hinh-anh-gai-xinh-2k5-2k6-ngay-tho-hon-nhien-3183-14.jpg'),
('ms0004uuid00000000000000000004','Khám thần kinh','Khám và tư vấn thần kinh',250000,'spec0004uuid00000000000000000004','cli0004uuid00000000000000000004','hosp0004uuid00000000000000000004','https://chienthanky.vn/wp-content/uploads/2024/01/150-hinh-anh-gai-xinh-2k5-2k6-ngay-tho-hon-nhien-3183-15.jpg'),
('ms0005uuid00000000000000000005','Khám ngoại','Khám các vấn đề ngoại tổng quát',200000,'spec0005uuid00000000000000000005','cli0005uuid00000000000000000005','hosp0005uuid00000000000000000005','https://chienthanky.vn/wp-content/uploads/2024/01/150-hinh-anh-gai-xinh-2k5-2k6-ngay-tho-hon-nhien-3183-18.jpg'),
('ms0006uuid00000000000000000006','Khám sản phụ','Khám thai sản',300000,'spec0006uuid00000000000000000006','cli0006uuid00000000000000000006','hosp0006uuid00000000000000000006','https://chienthanky.vn/wp-content/uploads/2024/01/150-hinh-anh-gai-xinh-2k5-2k6-ngay-tho-hon-nhien-3183-21.jpg'),
('ms0007uuid00000000000000000007','Khám nội tiết','Kiểm tra hormone',210000,'spec0009uuid00000000000000000009','cli0007uuid00000000000000000007','hosp0007uuid00000000000000000007','https://chienthanky.vn/wp-content/uploads/2024/01/100-hinh-anh-gai-xinh-2k4-de-thuong-hot-nhat-hien-nay-2746-2.jpg'),
('ms0008uuid00000000000000000008','Khám ung bướu','Tầm soát ung thư',350000,'spec0008uuid00000000000000000008','cli0009uuid00000000000000000009','hosp0009uuid00000000000000000009','https://chienthanky.vn/wp-content/uploads/2024/01/100-hinh-anh-gai-xinh-2k4-de-thuong-hot-nhat-hien-nay-2746-5.jpg'),
('ms0009uuid00000000000000000009','Khám răng hàm mặt','Khám nha khoa',160000,'spec0007uuid00000000000000000007','cli0004uuid00000000000000000004','hosp0004uuid00000000000000000004','https://chienthanky.vn/wp-content/uploads/2024/01/100-hinh-anh-gai-xinh-2k4-de-thuong-hot-nhat-hien-nay-2746-7.jpg'),
('ms0010uuid00000000000000000010','Khám chấn thương','Khám chấn thương chỉnh hình',240000,'spec0010uuid00000000000000000010','cli0010uuid00000000000000000010','hosp0010uuid00000000000000000010','https://chienthanky.vn/wp-content/uploads/2024/01/100-hinh-anh-gai-xinh-2k4-de-thuong-hot-nhat-hien-nay-2746-9.jpg');

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
INSERT INTO appointments (
  uuid, doctor_id, patient_id, clinic_id, hospital_id, schedule_id, vaccination_center_id, medical_service_id, date, status, health_status, user_id
) VALUES
-- Doctor 1, tất cả là phòng khám (clinic_id có, hospital_id NULL)
('app0001uuid00000000000000000001','doc0001uuid00000000000000000001','pat0001uuid00000000000000000001','cli0001uuid00000000000000000001',NULL,'sch0077uuid040603',NULL,NULL,'2025-06-15 09:00:00',1,'Đau đầu, mệt mỏi kéo dài 2 ngày','user0008uuid00000000000000000008'),
('app0002uuid00000000000000000002','doc0001uuid00000000000000000001','pat0001uuid00000000000000000001','cli0001uuid00000000000000000001',NULL,'sch0078uuid040604',NULL,NULL,'2025-06-16 10:30:00',1,'Mệt mỏi, đau nhức người','user0009uuid00000000000000000009'),
('app0003uuid00000000000000000003','doc0001uuid00000000000000000001','pat0001uuid00000000000000000001','cli0001uuid00000000000000000001',NULL,'sch0079uuid040701',NULL,NULL,'2025-06-17 08:00:00',1,'Sốt nhẹ, chóng mặt','user0010uuid00000000000000000010'),
('app0004uuid00000000000000000004','doc0001uuid00000000000000000001','pat0001uuid00000000000000000001','cli0001uuid00000000000000000001',NULL,'sch0080uuid040702',NULL,NULL,'2025-06-18 13:00:00',1,'Đau bụng, buồn nôn','user0010uuid00000000000000000010'),

-- Doctor 2 (lịch bệnh viện)
('app0005uuid00000000000000000005','doc0002uuid00000000000000000002','pat0002uuid00000000000000000002',NULL,'hosp0002uuid00000000000000000002','sch0042uuid030102',NULL,NULL,'2025-06-19 10:30:00',1,'Ho, sốt nhẹ, đau họng','user0010uuid00000000000000000010'),

-- Doctor 4 (phòng khám)
('app0006uuid00000000000000000006','doc0004uuid00000000000000000004','pat0002uuid00000000000000000002','cli0004uuid00000000000000000004',NULL,'sch0024uuid020202',NULL,NULL,'2025-06-20 09:00:00',1,'Chóng mặt, mất ngủ','user0010uuid00000000000000000010'),

-- Doctor 5 (bệnh viện)
('app0007uuid00000000000000000007','doc0005uuid00000000000000000005','pat0001uuid00000000000000000001',NULL,'hosp0005uuid00000000000000000005','sch0019uuid010701',NULL,NULL,'2025-06-21 15:00:00',1,'Đau bụng âm ỉ','user0010uuid00000000000000000010'),

-- Doctor 7 (phòng khám)
('app0008uuid00000000000000000008','doc0007uuid00000000000000000007','pat0002uuid00000000000000000002','cli0007uuid00000000000000000007',NULL,'sch0037uuid020603',NULL,NULL,'2025-06-22 13:00:00',1,'Đau răng, sưng lợi','user0010uuid00000000000000000010');

-- ===========================
-- 10. HỒ SƠ BỆNH ÁN (MEDICAL_RECORDS)
-- ===========================
CREATE TABLE `medical_records` (
  `uuid` char(32) NOT NULL,
  `patient_id` char(32) DEFAULT NULL,
  `appointment_id` char(32) DEFAULT NULL,
  `current_medications` VARCHAR(1000) DEFAULT NULL COMMENT 'Thuốc đang sử dụng',
  `allergies` VARCHAR(500) DEFAULT NULL COMMENT 'Dị ứng',
  `chronic_diseases` VARCHAR(500) DEFAULT NULL COMMENT 'Bệnh mãn tính',
  `surgeries` VARCHAR(500) DEFAULT NULL COMMENT 'Tiền sử phẫu thuật',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uuid`),
  KEY `patient_id` (`patient_id`),
  KEY `appointment_id` (`appointment_id`),
  CONSTRAINT `medical_records_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `medical_records_appointment_id` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO medical_records (uuid, patient_id, appointment_id, current_medications, allergies, chronic_diseases, surgeries) VALUES
('mr0011uuid00000000000000000011', 'pat0001uuid00000000000000000001', 'app0001uuid00000000000000000001', 'Paracetamol 500mg', 'Không', 'Tiểu đường', 'Mổ ruột thừa 2015'),
('mr0012uuid00000000000000000012', 'pat0002uuid00000000000000000002', 'app0002uuid00000000000000000002', 'Amoxicillin 250mg', 'Penicillin', 'Tăng huyết áp', 'Không'),
('mr0013uuid00000000000000000013', 'pat0003uuid00000000000000000003','app0002uuid00000000000000000002', 'Vitamin D', 'Không', 'Không', 'Phẫu thuật mắt 2018'), 
('mr0014uuid00000000000000000014', 'pat0001uuid00000000000000000001', 'app0004uuid00000000000000000004', 'Thuốc hạ cholesterol', 'Không', 'Rối loạn mỡ máu', 'Không'),
('mr0015uuid00000000000000000015', 'pat0002uuid00000000000000000002', 'app0005uuid00000000000000000005', 'Thuốc giảm đau', 'Không', 'Hen suyễn', 'Mổ bướu cổ 2017');


-- ===========================
-- 13. HỒ SƠ PHỤ (SELECT_PROFILES)
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

INSERT INTO select_profiles (uuid, user_id, name, relationship, image) VALUES
('sp0001uuid00000000000000000001','user0008uuid00000000000000000008','Nguyễn Văn An','Con','https://picsum.photos/id/1401/150/150'),
('sp0002uuid00000000000000000002','user0009uuid00000000000000000009','Trần Thị Bình','Vợ','https://picsum.photos/id/1402/150/150'),
('sp0003uuid00000000000000000003','user0010uuid00000000000000000010','Lê Văn Cường','Anh','https://picsum.photos/id/1403/150/150'),
('sp0004uuid00000000000000000004','user0008uuid00000000000000000008','Đỗ Thị Dung','Em','https://picsum.photos/id/1404/150/150'),
('sp0005uuid00000000000000000005','user0009uuid00000000000000000009','Nguyễn Hữu Dũng','Cháu','https://picsum.photos/id/1405/150/150'),
('sp0006uuid00000000000000000006','user0010uuid00000000000000000010','Nguyễn Văn Em','Bố','https://picsum.photos/id/1406/150/150'),
('sp0007uuid00000000000000000007','user0008uuid00000000000000000008','Trần Thị Hoa','Mẹ','https://picsum.photos/id/1407/150/150'),
('sp0008uuid00000000000000000008','user0009uuid00000000000000000009','Lê Thị Hòa','Ông','https://picsum.photos/id/1408/150/150'),
('sp0009uuid00000000000000000009','user0010uuid00000000000000000010','Nguyễn Thị Hạnh','Bà','https://picsum.photos/id/1409/150/150'),
('sp0010uuid00000000000000000010','user0008uuid00000000000000000008','Đỗ Văn Hiếu','Chị','https://picsum.photos/id/1410/150/150');


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

INSERT INTO articles (uuid, title, content, image, author) VALUES
('art0001uuid00000000000000000001','Chăm sóc sức khỏe mùa hè','Nội dung bài viết số 1','https://cdn.kienthuc.net.vn/images/cf739f51f3276a5be16e9cbb75eb67053d2e865137560b74446c5d3cea1f4053956d01ad3e2c8038e1fd27ed3c60cdf9aac4329fd070ae11dde8bd4dfa31ae9d9471b392c7e4231b2a5f0716e8ec0d9def91424d2c2447c7e679f9ea8316f2d591a9063593b083a8e1548ddeed17b471fba30d9a7d3640fce933b196e90e56bc/gai-xinh-dien-bikini-di-bien-dip-le-khien-anh-em-ngan-ngo-Hinh-3.jpg','BS Nguyễn Quang H'),
('art0002uuid00000000000000000002','Tư vấn da liễu','Nội dung bài viết số 2','https://anhnail.com/wp-content/uploads/2024/09/Anh-gai-xinh-Viet-Nam-mac-bikini.jpg','BS Trần Thị Bích'),
('art0003uuid00000000000000000003','Chế độ ăn hợp lý','Nội dung bài viết số 3','https://hoseiki.vn/wp-content/uploads/2025/03/gai-xinh-mac-bikini-13.jpg','BS Lê Văn C'),
('art0004uuid00000000000000000004','Phòng chống COVID','Nội dung bài viết số 4','https://cdn.kienthuc.net.vn/images/cf739f51f3276a5be16e9cbb75eb67053d2e865137560b74446c5d3cea1f4053956d01ad3e2c8038e1fd27ed3c60cdf9aac4329fd070ae11dde8bd4dfa31ae9d9471b392c7e4231b2a5f0716e8ec0d9def91424d2c2447c7e679f9ea8316f2d591a9063593b083a8e1548ddeed17b471fba30d9a7d3640fce933b196e90e56bc/gai-xinh-dien-bikini-di-bien-dip-le-khien-anh-em-ngan-ngo-Hinh-3.jpg','BS Nguyễn Minh D'),
('art0005uuid00000000000000000005','Chủ động phòng bệnh','Nội dung bài viết số 5','https://anhnail.com/wp-content/uploads/2024/09/Anh-gai-xinh-Viet-Nam-mac-bikini.jpg','BS Phạm Thị E'),
('art0006uuid00000000000000000006','Dinh dưỡng cho trẻ','Nội dung bài viết số 6','https://hoseiki.vn/wp-content/uploads/2025/03/gai-xinh-mac-bikini-13.jpg','BS Nguyễn Thị F'),
('art0007uuid00000000000000000007','Cách giữ gìn sức khỏe','Nội dung bài viết số 7','https://cdn.kienthuc.net.vn/images/cf739f51f3276a5be16e9cbb75eb67053d2e865137560b74446c5d3cea1f4053956d01ad3e2c8038e1fd27ed3c60cdf9aac4329fd070ae11dde8bd4dfa31ae9d9471b392c7e4231b2a5f0716e8ec0d9def91424d2c2447c7e679f9ea8316f2d591a9063593b083a8e1548ddeed17b471fba30d9a7d3640fce933b196e90e56bc/gai-xinh-dien-bikini-di-bien-dip-le-khien-anh-em-ngan-ngo-Hinh-3.jpg','BS Trương Văn G'),
('art0008uuid00000000000000000008','Cách giảm cân an toàn','Nội dung bài viết số 8','https://anhnail.com/wp-content/uploads/2024/09/Anh-gai-xinh-Viet-Nam-mac-bikini.jpg','BS Nguyễn Quang H'),
('art0009uuid00000000000000000009','Luyện tập thể thao','Nội dung bài viết số 9','https://hoseiki.vn/wp-content/uploads/2025/03/gai-xinh-mac-bikini-13.jpg','BS Trần Thị Bích'),
('art0010uuid00000000000000000010','Tăng sức đề kháng','Nội dung bài viết số 10','https://cdn.kienthuc.net.vn/images/cf739f51f3276a5be16e9cbb75eb67053d2e865137560b74446c5d3cea1f4053956d01ad3e2c8038e1fd27ed3c60cdf9aac4329fd070ae11dde8bd4dfa31ae9d9471b392c7e4231b2a5f0716e8ec0d9def91424d2c2447c7e679f9ea8316f2d591a9063593b083a8e1548ddeed17b471fba30d9a7d3640fce933b196e90e56bc/gai-xinh-dien-bikini-di-bien-dip-le-khien-anh-em-ngan-ngo-Hinh-3.jpg','BS Lê Văn C');

-- ===========================
-- 15. SLIDE QUẢNG CÁO (CAROUSEL_ITEMS)
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

INSERT INTO carousel_items (uuid, image, title, description) VALUES
('car0001uuid00000000000000000001','https://picsum.photos/id/1601/600/300','Khám tổng quát giảm giá','Ưu đãi cho khách mới 15%'),
('car0002uuid00000000000000000002','https://picsum.photos/id/1602/600/300','Miễn phí xét nghiệm máu','Áp dụng 10/6 đến 30/6'),
('car0003uuid00000000000000000003','https://picsum.photos/id/1603/600/300','Ưu đãi mùa hè','Tặng quà cho khách hàng đặt khám'),
('car0004uuid00000000000000000004','https://picsum.photos/id/1604/600/300','Tư vấn sức khỏe trực tuyến','Gặp bác sĩ online, miễn phí lần đầu'),
('car0005uuid00000000000000000005','https://picsum.photos/id/1605/600/300','Giảm giá xét nghiệm','Chỉ còn 99k/lần'),
('car0006uuid00000000000000000006','https://picsum.photos/id/1606/600/300','Miễn phí đo huyết áp','Dành cho khách lớn tuổi'),
('car0007uuid00000000000000000007','https://picsum.photos/id/1607/600/300','Gói khám cho trẻ em','Tặng sữa cho trẻ dưới 6 tuổi'),
('car0008uuid00000000000000000008','https://picsum.photos/id/1608/600/300','Ưu đãi khám nha khoa','Tặng nước súc miệng'),
('car0009uuid00000000000000000009','https://picsum.photos/id/1609/600/300','Gói xét nghiệm tổng quát','Giá chỉ 1 triệu đồng'),
('car0010uuid00000000000000000010','https://picsum.photos/id/1610/600/300','Miễn phí tư vấn dinh dưỡng','Đặt lịch qua app, không cần chờ');


-- ===========================
-- 16. BẢNG TOKEN (XÁC THỰC)
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

INSERT INTO token (uuid, user_id, access_token, refresh_token) VALUES
('tok0001uuid00000000000000000001','user0001uuid00000000000000000001','token1','refreshtoken1'),
('tok0002uuid00000000000000000002','user0002uuid00000000000000000002','token2','refreshtoken2'),
('tok0003uuid00000000000000000003','user0003uuid00000000000000000003','token3','refreshtoken3'),
('tok0004uuid00000000000000000004','user0004uuid00000000000000000004','token4','refreshtoken4'),
('tok0005uuid00000000000000000005','user0005uuid00000000000000000005','token5','refreshtoken5'),
('tok0006uuid00000000000000000006','user0006uuid00000000000000000006','token6','refreshtoken6'),
('tok0007uuid00000000000000000007','user0007uuid00000000000000000007','token7','refreshtoken7'),
('tok0008uuid00000000000000000008','user0008uuid00000000000000000008','token8','refreshtoken8'),
('tok0009uuid00000000000000000009','user0009uuid00000000000000000009','token9','refreshtoken9'),
('tok0010uuid00000000000000000010','user0010uuid00000000000000000010','token10','refreshtoken10');


CREATE TABLE `reviews` (
  `uuid` CHAR(32) NOT NULL,
  `user_id` CHAR(32) NOT NULL,
  `doctor_id` CHAR(32) NOT NULL,
  `appointment_id` CHAR(32) NOT NULL,
  `stars` TINYINT NOT NULL CHECK (`stars` BETWEEN 1 AND 5),
  `comment` VARCHAR(1000) DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uuid`),
  KEY `user_id` (`user_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `appointment_id` (`appointment_id`),
  CONSTRAINT `reviews_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reviews_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reviews_appointment_id` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO reviews (uuid, user_id, doctor_id, appointment_id, stars, comment) VALUES
('rev0001uuid00000000000000000001','user0008uuid00000000000000000008','doc0001uuid00000000000000000001','app0001uuid00000000000000000001',5,'Bác sĩ tận tâm, hướng dẫn rõ ràng!'),
('rev0002uuid00000000000000000002','user0009uuid00000000000000000009','doc0002uuid00000000000000000002','app0002uuid00000000000000000002',4,'Khám kỹ càng, cảm ơn bác sĩ.'),
('rev0004uuid00000000000000000004','user0009uuid00000000000000000009','doc0004uuid00000000000000000004','app0004uuid00000000000000000004',3,'Chờ hơi lâu nhưng bác sĩ vui vẻ.'),
('rev0005uuid00000000000000000005','user0008uuid00000000000000000008','doc0005uuid00000000000000000005','app0005uuid00000000000000000005',4,'Dịch vụ ổn, nhân viên nhiệt tình.'),
('rev0007uuid00000000000000000007','user0009uuid00000000000000000009','doc0007uuid00000000000000000007','app0007uuid00000000000000000007',4,'Bác sĩ thân thiện, tư vấn tận tâm.'),
('rev0008uuid00000000000000000008','user0008uuid00000000000000000008','doc0003uuid00000000000000000003','app0004uuid00000000000000000004',5,'Lần nào khám cũng rất hài lòng.'),
('rev0009uuid00000000000000000009','user0010uuid00000000000000000010','doc0002uuid00000000000000000002','app0002uuid00000000000000000002',4,'Khám nhi chu đáo, bác sĩ dễ thương.'),
('rev0010uuid00000000000000000010','user0008uuid00000000000000000008','doc0004uuid00000000000000000004','app0004uuid00000000000000000004',3,'Bệnh viện sạch sẽ, thủ tục hơi lâu.');

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
INSERT INTO payments (
  uuid, user_id, appointment_id, amount, payment_method, status, payment_time, created_at, updated_at
) VALUES
('pay0001uuid00000000000000000001', 'user0001uuid00000000000000000001', 'app0001uuid00000000000000000001', 250000, 'bank_transfer', 2, '2025-06-14 10:20:00', NOW(), NOW()), -- success
('pay0002uuid00000000000000000002', 'user0002uuid00000000000000000002', 'app0002uuid00000000000000000002', 350000, 'cash', 1, NULL, NOW(), NOW()), -- pending
('pay0003uuid00000000000000000003', 'user0003uuid00000000000000000003', 'app0002uuid00000000000000000002', 500000, 'bank_transfer', 3, '2025-06-17 08:30:00', NOW(), NOW()), -- failed
('pay0004uuid00000000000000000004', 'user0001uuid00000000000000000001', 'app0004uuid00000000000000000004', 200000, 'cash', 2, '2025-06-18 12:00:00', NOW(), NOW()), -- success
('pay0005uuid00000000000000000005', 'user0002uuid00000000000000000002', 'app0005uuid00000000000000000005', 320000, 'bank_transfer', 1, NULL, NOW(), NOW()); -- pending



