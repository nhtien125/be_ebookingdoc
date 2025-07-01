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
(uuid, premission_id, name, email, phone, gender, address, username, password, status, image, birth_day) 
VALUES
('user0001uuid00000000000000000001', 1, 'Admin User', 'admin@gmail.com', '0901000001', 1, 'TP.HCM', 'admin', 'admin123', 1, 'https://hoseiki.vn/wp-content/uploads/2025/03/anh-anime-cute-11.jpg', '1980-01-01'),

('user0002uuid00000000000000000002', 2, 'Nguyễn Quang K', 'nguyenquangk@gmail.com', '0911000022', 1, 'TP.HCM', 'nguyenquangk', '123456', 1, 'https://hoseiki.vn/wp-content/uploads/2025/03/anh-anime-cute-11.jpg', '1985-07-01'),
('user0003uuid00000000000000000003', 2, 'Lê Thiết L', 'lethietl@gmail.com', '0911000023', 0, 'Hà Nội', 'lethietl', '123456', 1, 'https://hoseiki.vn/wp-content/uploads/2025/03/anh-anime-cute-11.jpg', '1989-04-20'),
('user0004uuid00000000000000000004', 2, 'Trương Thi H', 'truongthih@gmail.com', '0911000024', 1, 'Đà Nẵng', 'truongthih', '123456', 1, 'https://hoseiki.vn/wp-content/uploads/2025/03/anh-anime-cute-11.jpg', '1992-09-12'),
('user0005uuid00000000000000000005', 2, 'Lê Văn M', 'levanm@gmail.com', '0911000025', 0, 'Hà Nội', 'levanm', '123456', 1, 'https://hoseiki.vn/wp-content/uploads/2025/03/anh-anime-cute-11.jpg', '1986-03-18'),
('user0006uuid00000000000000000006', 2, 'Nguyễn Thị N', 'nguyenthin@gmail.com', '0911000026', 1, 'TP.HCM', 'nguyenthin', '123456', 1, 'https://hoseiki.vn/wp-content/uploads/2025/03/anh-anime-cute-11.jpg', '1990-06-11'),
('user0007uuid00000000000000000007', 2, 'Phạm Minh P', 'phamminhp@gmail.com', '0911000027', 0, 'Đà Nẵng', 'phamminhp', '123456', 1, 'https://hoseiki.vn/wp-content/uploads/2025/03/anh-anime-cute-11.jpg', '1993-01-09'),
('user0008uuid00000000000000000008', 2, 'Trần Thị Q', 'tranthiq@gmail.com', '0911000028', 1, 'TP.HCM', 'tranthiq', '123456', 1, 'https://hoseiki.vn/wp-content/uploads/2025/03/anh-anime-cute-11.jpg', '1992-08-02'),
('user0009uuid00000000000000000009', 2, 'Nguyễn Hải R', 'nguyenhair@gmail.com', '0911000029', 1, 'Hà Nội', 'nguyenhair', '123456', 1, 'https://hoseiki.vn/wp-content/uploads/2025/03/anh-anime-cute-11.jpg', '1988-04-05'),
('user0010uuid00000000000000000010', 2, 'Lê Văn S', 'levans@gmail.com', '0911000030', 0, 'Đà Nẵng', 'levans', '123456', 1, 'https://hoseiki.vn/wp-content/uploads/2025/03/anh-anime-cute-11.jpg', '1987-11-15'),
('user0011uuid00000000000000000011', 2, 'Phan Thị T', 'phanthit@gmail.com', '0911000031', 1, 'TP.HCM', 'phanthit', '123456', 1, 'https://hoseiki.vn/wp-content/uploads/2025/03/anh-anime-cute-11.jpg', '1994-09-21'),
('user0012uuid00000000000000000012', 2, 'Lê Minh U', 'leminhu@gmail.com', '0911000032', 0, 'Hà Nội', 'leminhu', '123456', 1, 'https://hoseiki.vn/wp-content/uploads/2025/03/anh-anime-cute-11.jpg', '1991-02-14'),
('user0013uuid00000000000000000013', 2, 'Trương Đình V', 'truongdinhv@gmail.com', '0911000033', 1, 'Đà Nẵng', 'truongdinhv', '123456', 1, 'https://hoseiki.vn/wp-content/uploads/2025/03/anh-anime-cute-11.jpg', '1990-11-23'),
('user0014uuid00000000000000000014', 2, 'Nguyễn Thị W', 'nguyenthiw@gmail.com', '0911000034', 0, 'TP.HCM', 'nguyenthiw', '123456', 1, 'https://example.com/image34.jpg', '1987-06-25'),
('user0015uuid00000000000000000015', 2, 'Lê Quang X', 'lequangx@gmail.com', '0911000035', 1, 'Hà Nội', 'lequangx', '123456', 1, 'https://example.com/image35.jpg', '1992-01-12'),
('user0016uuid00000000000000000016', 2, 'Trần Thi Y', 'tranthiy@gmail.com', '0911000036', 1, 'Đà Nẵng', 'tranthiy', '123456', 1, 'https://example.com/image36.jpg', '1993-04-19'),
('user0017uuid00000000000000000017', 2, 'Nguyễn Minh Z', 'nguyenminhz@gmail.com', '0911000037', 0, 'TP.HCM', 'nguyenminhz', '123456', 1, 'https://example.com/image37.jpg', '1988-02-07'),
('user0018uuid00000000000000000018', 2, 'Phạm Thiệt A', 'phamthia@gmail.com', '0911000038', 1, 'Hà Nội', 'phamthia', '123456', 1, 'https://example.com/image38.jpg', '1991-12-04'),
('user0019uuid00000000000000000019', 2, 'Lê Đình B', 'ledinhb@gmail.com', '0911000039', 0, 'Đà Nẵng', 'ledinhb', '123456', 1, 'https://example.com/image39.jpg', '1990-10-10'),
('user0020uuid00000000000000000020', 2, 'Trương Hữu C', 'truonghuuc@gmail.com', '0911000040', 1, 'TP.HCM', 'truonghuuc', '123456', 1, 'https://example.com/image40.jpg', '1989-05-22'),
('user0021uuid00000000000000000021', 2, 'Nguyễn Văn D', 'nguyenvand@gmail.com', '0911000041', 1, 'Hà Nội', 'nguyenvand', '123456', 1, 'https://example.com/image41.jpg', '1992-12-28'),
('user0022uuid00000000000000000022', 2, 'Lê Trọng E', 'letronge@gmail.com', '0911000042', 0, 'Đà Nẵng', 'letronge', '123456', 1, 'https://example.com/image42.jpg', '1987-08-13'),
('user0023uuid00000000000000000023', 2, 'Trần Quý F', 'tranquyf@gmail.com', '0911000043', 1, 'TP.HCM', 'tranquyf', '123456', 1, 'https://example.com/image43.jpg', '1994-03-06'),
('user0024uuid00000000000000000024', 2, 'Nguyễn Hòa G', 'nguyenhoag@gmail.com', '0911000044', 0, 'Hà Nội', 'nguyenhoag', '123456', 1, 'https://example.com/image44.jpg', '1990-07-01'),
('user0025uuid00000000000000000025', 2, 'Lê Hạnh H', 'lehanhh@gmail.com', '0911000045', 1, 'Đà Nẵng', 'lehanhh', '123456', 1, 'https://example.com/image45.jpg', '1988-09-11'),
('user0026uuid00000000000000000026', 2, 'Trương Quỳ I', 'truongquyi@gmail.com', '0911000046', 0, 'TP.HCM', 'truongquyi', '123456', 1, 'https://example.com/image46.jpg', '1993-05-29'),
('user0027uuid00000000000000000027', 2, 'Nguyễn Bảo J', 'nguyenbaoj@gmail.com', '0911000047', 1, 'Hà Nội', 'nguyenbaoj', '123456', 1, 'https://example.com/image47.jpg', '1992-06-14'),

('user0028uuid00000000000000000028', 3, 'Lê Hữu A', 'lhuuA@gmail.com', '0922000021', 1, 'TP.HCM', 'lhuuA', '123456', 0, 'https://jbagy.me/wp-content/uploads/2025/03/Hinh-anh-avatar-anime-nu-cute-2.jpg', '1999-12-13'),
('user0029uuid00000000000000000029', 3, 'Trần Mạnh B', 'tranmanb@gmail.com', '0922000022', 0, 'Hà Nội', 'tranmanb', '123456', 0, 'https://jbagy.me/wp-content/uploads/2025/03/Hinh-anh-avatar-anime-nu-cute-2.jpg', '2000-01-24'),
('user0030uuid00000000000000000030', 3, 'Nguyễn Minh C', 'nguyenminhc@gmail.com', '0922000023', 1, 'Đà Nẵng', 'nguyenminhc', '123456', 0, 'https://jbagy.me/wp-content/uploads/2025/03/Hinh-anh-avatar-anime-nu-cute-2.jpg', '1998-11-06'),
('user0031uuid00000000000000000031', 3, 'Phan Ngọc D', 'phanngocd@gmail.com', '0922000024', 0, 'TP.HCM', 'phanngocd', '123456', 0, 'https://jbagy.me/wp-content/uploads/2025/03/Hinh-anh-avatar-anime-nu-cute-2.jpg', '1997-05-17'),
('user0032uuid00000000000000000032', 3, 'Trương Thị E', 'truongthie@gmail.com', '0922000025', 1, 'Hà Nội', 'truongthie', '123456', 0, 'https://jbagy.me/wp-content/uploads/2025/03/Hinh-anh-avatar-anime-nu-cute-2.jpg', '1996-02-23'),
('user0033uuid00000000000000000033', 3, 'Nguyễn Quang F', 'nguyenquangf@gmail.com', '0922000026', 0, 'Đà Nẵng', 'nguyenquangf', '123456', 0, 'https://jbagy.me/wp-content/uploads/2025/03/Hinh-anh-avatar-anime-nu-cute-2.jpg', '1999-03-09'),
('user0034uuid00000000000000000034', 3, 'Lê Thanh G', 'lethang@gmail.com', '0922000027', 1, 'TP.HCM', 'lethang', '123456', 0, 'https://jbagy.me/wp-content/uploads/2025/03/Hinh-anh-avatar-anime-nu-cute-2.jpg', '2000-12-10'),
('user0035uuid00000000000000000035', 3, 'Nguyễn Thị H', 'nguyenthih@gmail.com', '0922000028', 0, 'Hà Nội', 'nguyenthih', '123456', 0, 'https://jbagy.me/wp-content/uploads/2025/03/Hinh-anh-avatar-anime-nu-cute-2.jpg', '1995-04-17'),
('user0036uuid00000000000000000036', 3, 'Trần Quang I', 'tranquang@gmail.com', '0922000029', 1, 'Đà Nẵng', 'tranquang', '123456', 0, 'https://jbagy.me/wp-content/uploads/2025/03/Hinh-anh-avatar-anime-nu-cute-2.jpg', '1998-07-09'),
('user0037uuid00000000000000000037', 3, 'Hoàng Minh J', 'hoangminhj@gmail.com', '0922000030', 0, 'TP.HCM', 'hoangminhj', '123456', 0, 'https://jbagy.me/wp-content/uploads/2025/03/Hinh-anh-avatar-anime-nu-cute-2.jpg', '1997-09-14'),
('user0038uuid00000000000000000038', 3, 'Nguyễn Thị K', 'nguyenthik@gmail.com', '0922000031', 1, 'Hà Nội', 'nguyenthik', '123456', 0, 'https://jbagy.me/wp-content/uploads/2025/03/Hinh-anh-avatar-anime-nu-cute-2.jpg', '1996-11-05'),
('user0039uuid00000000000000000039', 3, 'Trần Quỳ L', 'tranquyl@gmail.com', '0922000032', 0, 'TP.HCM', 'tranquyl', '123456', 0, 'https://jbagy.me/wp-content/uploads/2025/03/Hinh-anh-avatar-anime-nu-cute-2.jpg', '1998-01-29'),
('user0040uuid00000000000000000040', 3, 'Nguyễn Linh M', 'nguyenlinhm@gmail.com', '0922000033', 1, 'Đà Nẵng', 'nguyenlinhm', '123456', 0, 'https://jbagy.me/wp-content/uploads/2025/03/Hinh-anh-avatar-anime-nu-cute-2.jpg', '2000-04-14');

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
('pat0001uuid00000000000000000001','user0023uuid00000000000000000023','Lê Hữu A','1999-12-13','Nữ','0922000021','Bản thân','TP HCM'),
('pat0002uuid00000000000000000002','user0024uuid00000000000000000024','Trần Mạnh B','2000-01-24','Nam','0922000022','Chồng','Hà Nội'),
('pat0003uuid00000000000000000003','user0025uuid00000000000000000025','Nguyễn Minh C','1998-11-06','Nữ','0922000023','Con','Đà Nẵng'),
('pat0004uuid00000000000000000004','user0026uuid00000000000000000026','Phan Ngọc D','1997-05-17','Nam','0922000024','Chồng','TP HCM'),
('pat0005uuid00000000000000000005','user0027uuid00000000000000000027','Trương Thị E','1996-02-23','Nữ','0922000025','Con','Hà Nội'),
('pat0006uuid00000000000000000006','user0028uuid00000000000000000028','Nguyễn Quang F','1999-03-09','Nam','0922000026','Con','Đà Nẵng'),
('pat0007uuid00000000000000000007','user0029uuid00000000000000000029','Lê Thanh G','2000-12-10','Nữ','0922000027','Bản thân','TP HCM'),
('pat0008uuid00000000000000000008','user0030uuid00000000000000000030','Nguyễn Thị H','1995-04-17','Nữ','0922000028','Chồng','Hà Nội'),
('pat0009uuid00000000000000000009','user0031uuid00000000000000000031','Trần Quang I','1998-07-09','Nam','0922000029','Bản thân','Đà Nẵng'),
('pat0010uuid00000000000000000010','user0032uuid00000000000000000032','Hoàng Minh J','1997-09-14','Nam','0922000030','Con','TP HCM'),
('pat0011uuid00000000000000000011','user0033uuid00000000000000000033','Nguyễn Thị K','1996-11-05','Nữ','0922000031','Chồng','Hà Nội'),
('pat0012uuid00000000000000000012','user0034uuid00000000000000000034','Trần Quỳ L','1998-01-29','Nam','0922000032','Chồng','TP HCM'),
('pat0013uuid00000000000000000013','user0035uuid00000000000000000035','Nguyễn Linh M','2000-04-14','Nữ','0922000033','Con','Đà Nẵng'),
('pat0014uuid00000000000000000014','user0036uuid00000000000000000036','Lê Hương N','1997-02-11','Nam','0922000034','Chồng','TP HCM'),
('pat0015uuid00000000000000000015','user0037uuid00000000000000000037','Trần Quý O','1996-07-21','Nữ','0922000035','Con','Hà Nội'),
('pat0016uuid00000000000000000016','user0038uuid00000000000000000038','Nguyễn Bảo P','1999-10-19','Nữ','0922000036','Chồng','Đà Nẵng'),
('pat0017uuid00000000000000000017','user0039uuid00000000000000000039','Lê Thi Th','2000-09-25','Nam','0922000037','Bản thân','TP HCM'),
('pat0018uuid00000000000000000018','user0040uuid00000000000000000040','Trương Thị U','1998-05-05','Nữ','0922000038','Con','Hà Nội');

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
('doc0002uuid00000000000000000002', 'user0002uuid00000000000000000002', NULL, 'cli0002uuid00000000000000000002', 2, 'spec0002uuid00000000000000000002', 'BS23456', 'Chuyên gia nhi khoa, với nhiều năm kinh nghiệm trong việc điều trị các bệnh lý hô hấp và tiêu hóa ở trẻ em. Tư vấn chuyên sâu cho các bậc phụ huynh về chế độ ăn uống, vệ sinh và phòng bệnh cho trẻ nhỏ. Bác sĩ luôn lắng nghe và chăm sóc tận tình từng trường hợp, đặc biệt là trẻ em có nhu cầu đặc biệt.', 10, 'https://nano-ceramic.vn/wp-content/uploads/2024/12/300-hinh-anh-anime-cute-de-thuong-lam-hinh-nen-cuc-chat.jpg'),
('doc0003uuid00000000000000000003', 'user0003uuid00000000000000000003', 'hosp0003uuid00000000000000000003', NULL, 1, 'spec0003uuid00000000000000000003', 'BS34567', 'Bác sĩ da liễu với kinh nghiệm nhiều năm trong điều trị các bệnh lý về da như mụn, nám, vảy nến và các bệnh lý mãn tính. Đặc biệt, bác sĩ nổi tiếng với liệu trình điều trị mụn hiệu quả, giúp phục hồi làn da sáng khỏe cho bệnh nhân. Luôn cập nhật các phương pháp điều trị mới nhất, an toàn và hiệu quả.', 15, 'https://nano-ceramic.vn/wp-content/uploads/2024/12/300-hinh-anh-anime-cute-de-thuong-lam-hinh-nen-cuc-chat.jpg'),
('doc0004uuid00000000000000000004', 'user0004uuid00000000000000000004', NULL, 'cli0004uuid00000000000000000004', 2, 'spec0004uuid00000000000000000004', 'BS45678', 'Chuyên gia thần kinh với hơn 15 năm kinh nghiệm trong việc điều trị các bệnh lý thần kinh như đau đầu, động kinh, trầm cảm, và các vấn đề về tâm lý. Bác sĩ có phong cách điều trị thân thiện, nhẹ nhàng, giúp bệnh nhân cảm thấy thoải mái và an tâm trong suốt quá trình điều trị.', 8, 'https://nano-ceramic.vn/wp-content/uploads/2024/12/300-hinh-anh-anime-cute-de-thuong-lam-hinh-nen-cuc-chat.jpg'),
('doc0005uuid00000000000000000005', 'user0005uuid00000000000000000005', 'hosp0005uuid00000000000000000005', NULL, 1, 'spec0005uuid00000000000000000005', 'BS56789', 'Bác sĩ ngoại tổng quát với hơn 6000 ca phẫu thuật thành công trong các lĩnh vực như phẫu thuật u xơ tử cung, cắt amidan, và các phẫu thuật cấp cứu. Bác sĩ luôn áp dụng các kỹ thuật y tế tiên tiến, đảm bảo cho bệnh nhân sự an toàn tuyệt đối trong quá trình điều trị và hồi phục.', 20, 'https://nano-ceramic.vn/wp-content/uploads/2024/12/300-hinh-anh-anime-cute-de-thuong-lam-hinh-nen-cuc-chat.jpg'),
('doc0006uuid00000000000000000006', 'user0006uuid00000000000000000006', NULL, 'cli0006uuid00000000000000000006', 2, 'spec0006uuid00000000000000000006', 'BS67890', 'Bác sĩ sản phụ khoa với hơn 2000 ca sinh nở thành công, giúp các bà mẹ vượt cạn an toàn và khỏe mạnh. Bác sĩ chuyên sâu về các bệnh lý sản khoa, điều trị các vấn đề về thai kỳ và sinh sản nữ. Bác sĩ cũng cung cấp dịch vụ tư vấn sức khỏe tiền hôn nhân và sau sinh cho các bà mẹ.', 9, 'https://nano-ceramic.vn/wp-content/uploads/2024/12/300-hinh-anh-anime-cute-de-thuong-lam-hinh-nen-cuc-chat.jpg'),
('doc0007uuid00000000000000000007', 'user0007uuid00000000000000000007', 'hosp0007uuid00000000000000000007', NULL, 1, 'spec0007uuid00000000000000000007', 'BS78901', 'Bác sĩ răng hàm mặt, chuyên về các phương pháp thẩm mỹ răng miệng, phục hình răng và điều trị các bệnh lý về răng miệng như sâu răng, viêm nướu, và các bệnh về lợi. Bác sĩ luôn theo sát tình trạng của bệnh nhân và áp dụng các kỹ thuật tiên tiến nhất để mang lại kết quả tối ưu.', 11, 'https://nano-ceramic.vn/wp-content/uploads/2024/12/300-hinh-anh-anime-cute-de-thuong-lam-hinh-nen-cuc-chat.jpg'),

-- 32 more doctors to complete 40
('doc0008uuid00000000000000000008', 'user0008uuid00000000000000000008', 'hosp0008uuid00000000000000000008', NULL, 1, 'spec0008uuid00000000000000000008', 'BS89012', 'Bác sĩ ung bướu, chuyên điều trị các bệnh ung thư giai đoạn cuối, tư vấn cho bệnh nhân về các phương pháp điều trị ung thư hiện đại và hỗ trợ tinh thần cho bệnh nhân trong suốt quá trình điều trị. Bác sĩ giúp bệnh nhân vượt qua giai đoạn khó khăn nhất của cuộc đời.', 14, 'https://i.pinimg.com/736x/0b/75/87/0b758729c7492f41b14be27ab482dbc0.jpg'),
('doc0009uuid00000000000000000009', 'user0009uuid00000000000000000009', 'hosp0009uuid00000000000000000009', NULL, 1, 'spec0009uuid00000000000000000009', 'BS90123', 'Chuyên gia nội tiết, điều trị các bệnh về tiểu đường, rối loạn chuyển hóa và các vấn đề về tuyến giáp. Bác sĩ nổi tiếng với các phương pháp điều trị hiệu quả và hiện đại, giúp bệnh nhân duy trì chất lượng cuộc sống tốt hơn.', 18, 'https://i.pinimg.com/736x/0b/75/87/0b758729c7492f41b14be27ab482dbc0.jpg'),
('doc0010uuid00000000000000000010', 'user0010uuid00000000000000000010', 'hosp0010uuid00000000000000000010', NULL, 1, 'spec0010uuid00000000000000000010', 'BS01234', 'Chuyên gia chấn thương chỉnh hình, chuyên điều trị các bệnh lý về cơ xương khớp, phục hồi chức năng sau tai nạn và phẫu thuật cho các ca chấn thương nặng. Bác sĩ có kinh nghiệm dày dặn trong việc giúp bệnh nhân phục hồi nhanh chóng và hiệu quả.', 19, 'https://i.pinimg.com/736x/0b/75/87/0b758729c7492f41b14be27ab482dbc0.jpg'),
('doc0011uuid00000000000000000011', 'user0011uuid00000000000000000011', 'hosp0001uuid00000000000000000001', NULL, 1, 'spec0001uuid00000000000000000001', 'BS12346', 'Bác sĩ tim mạch, chuyên điều trị bệnh nhân cao huyết áp và nhồi máu cơ tim. Bác sĩ luôn cập nhật các phương pháp điều trị mới nhất và hiệu quả cho bệnh nhân, giúp giảm thiểu tối đa nguy cơ và cải thiện chất lượng sống của bệnh nhân.', 13, 'https://i.pinimg.com/736x/0b/75/87/0b758729c7492f41b14be27ab482dbc0.jpg'),
('doc0012uuid00000000000000000012', 'user0012uuid00000000000000000012', 'hosp0002uuid00000000000000000002', NULL, 1, 'spec0002uuid00000000000000000002', 'BS12347', 'Chuyên gia nhi khoa, điều trị hiệu quả các bệnh lý về đường hô hấp ở trẻ em. Bác sĩ luôn tận tâm trong việc chăm sóc sức khỏe cho trẻ và tư vấn cho các bậc phụ huynh về cách chăm sóc, dinh dưỡng hợp lý cho trẻ nhỏ.', 11, 'https://i.pinimg.com/736x/0b/75/87/0b758729c7492f41b14be27ab482dbc0.jpg'),
('doc0013uuid00000000000000000013', 'user0013uuid00000000000000000013', 'hosp0003uuid00000000000000000003', NULL, 1, 'spec0003uuid00000000000000000003', 'BS12348', 'Chuyên gia da liễu, điều trị các bệnh lý về da như vảy nến, eczema. Bác sĩ có kinh nghiệm dày dặn trong việc phục hồi da cho bệnh nhân và áp dụng các phương pháp điều trị tiên tiến, giúp làn da trở lại khỏe mạnh.', 10, 'https://i.pinimg.com/736x/0b/75/87/0b758729c7492f41b14be27ab482dbc0.jpg'),
('doc0014uuid00000000000000000014', 'user0014uuid00000000000000000014', 'hosp0004uuid00000000000000000004', NULL, 1, 'spec0004uuid00000000000000000004', 'BS12349', 'Bác sĩ thần kinh, điều trị các bệnh lý thần kinh như đau đầu, chóng mặt, và các chứng bệnh liên quan đến hệ thần kinh trung ương. Bác sĩ luôn sử dụng phương pháp điều trị hiện đại và an toàn cho bệnh nhân.', 12, 'https://i.pinimg.com/736x/0b/75/87/0b758729c7492f41b14be27ab482dbc0.jpg'),
('doc0015uuid00000000000000000015', 'user0015uuid00000000000000000015', 'hosp0005uuid00000000000000000005', NULL, 1, 'spec0005uuid00000000000000000005', 'BS12350', 'Bác sĩ ngoại tổng quát, điều trị các bệnh lý liên quan đến hệ thống tiêu hóa, u xơ tử cung và các bệnh lý liên quan đến nội tạng. Bác sĩ luôn đảm bảo phẫu thuật an toàn cho bệnh nhân và giúp bệnh nhân hồi phục nhanh chóng.', 14, 'https://i.pinimg.com/736x/0b/75/87/0b758729c7492f41b14be27ab482dbc0.jpg'),
('doc0016uuid00000000000000000016', 'user0016uuid00000000000000000016', 'hosp0006uuid00000000000000000006', NULL, 1, 'spec0006uuid00000000000000000006', 'BS12351', 'Chuyên gia sản phụ khoa, chuyên điều trị các bệnh lý sản khoa cho phụ nữ như vô sinh, hiếm muộn, và các bệnh lý thai kỳ. Bác sĩ luôn tận tình và chăm sóc sức khỏe của các bà mẹ và thai nhi trong suốt thời gian thai kỳ.', 9, 'https://i.pinimg.com/736x/0b/75/87/0b758729c7492f41b14be27ab482dbc0.jpg'),
('doc0017uuid00000000000000000017', 'user0017uuid00000000000000000017', 'hosp0007uuid00000000000000000007', NULL, 1, 'spec0007uuid00000000000000000007', 'BS12352', 'Bác sĩ răng hàm mặt, chuyên về các phương pháp điều trị bệnh lý về răng miệng như sâu răng, viêm nướu, và các bệnh về lợi. Bác sĩ luôn theo sát tình trạng của bệnh nhân và áp dụng các kỹ thuật tiên tiến nhất để mang lại kết quả tối ưu.', 13, 'https://i.pinimg.com/736x/0b/75/87/0b758729c7492f41b14be27ab482dbc0.jpg'),
('doc0018uuid00000000000000000018', 'user0018uuid00000000000000000018', 'hosp0008uuid00000000000000000008', NULL, 1, 'spec0008uuid00000000000000000008', 'BS12353', 'Chuyên gia ung bướu, tư vấn và điều trị ung thư phổi, ung thư vú. Bác sĩ luôn đưa ra các phương pháp điều trị hiệu quả và an toàn, đồng hành cùng bệnh nhân trong hành trình điều trị ung thư.', 14, 'https://i.pinimg.com/736x/0b/75/87/0b758729c7492f41b14be27ab482dbc0.jpg'),
('doc0019uuid00000000000000000019', 'user0019uuid00000000000000000019', 'hosp0009uuid00000000000000000009', NULL, 1, 'spec0009uuid00000000000000000009', 'BS12354', 'Chuyên gia nội tiết, điều trị các bệnh về tiểu đường, bệnh tuyến giáp và các vấn đề về hormon. Bác sĩ cung cấp các phương pháp điều trị hiệu quả, giúp bệnh nhân duy trì mức hormon và đường huyết ổn định.', 12, 'https://i.pinimg.com/736x/0b/75/87/0b758729c7492f41b14be27ab482dbc0.jpg'),
('doc0020uuid00000000000000000020', 'user0020uuid00000000000000000020', 'hosp0010uuid00000000000000000010', NULL, 1, 'spec0010uuid00000000000000000010', 'BS12355', 'Chuyên gia chấn thương chỉnh hình, phẫu thuật các bệnh lý xương khớp và các chấn thương thể thao. Bác sĩ luôn tận tình và sẵn sàng hỗ trợ phục hồi chức năng cho bệnh nhân sau khi phẫu thuật.', 15, 'https://i.pinimg.com/736x/0b/75/87/0b758729c7492f41b14be27ab482dbc0.jpg'),

-- 7 bác sĩ còn lại
('doc0021uuid00000000000000000021', 'user0021uuid00000000000000000021', 'hosp0001uuid00000000000000000001', NULL, 1, 'spec0001uuid00000000000000000001', 'BS12356', 'Chuyên gia tim mạch, tư vấn về phòng ngừa bệnh tim mạch, giúp bệnh nhân duy trì sức khỏe tim mạch tốt thông qua các phương pháp thay đổi lối sống, ăn uống và các chương trình tập luyện phù hợp.', 10, 'https://onghoikhinen.com/wp-content/uploads/2022/08/anh-anime-nam-cute-ngau-dep-hiem-lanh-lung-chat-ngau-dep-nhat-hien-tai-8730-30.jpg'),
('doc0022uuid00000000000000000022', 'user0022uuid00000000000000000022', 'hosp0002uuid00000000000000000002', NULL, 1, 'spec0002uuid00000000000000000002', 'BS12357', 'Chuyên gia nhi khoa, tư vấn chăm sóc trẻ em trong mọi độ tuổi, điều trị các bệnh lý hô hấp, tiêu hóa và giúp các bậc phụ huynh hướng dẫn cách chăm sóc trẻ một cách khoa học và an toàn.', 8, 'https://onghoikhinen.com/wp-content/uploads/2022/08/anh-anime-nam-cute-ngau-dep-hiem-lanh-lung-chat-ngau-dep-nhat-hien-tai-8730-30.jpg'),
('doc0023uuid00000000000000000023', 'user0023uuid00000000000000000023', 'hosp0003uuid00000000000000000003', NULL, 1, 'spec0003uuid00000000000000000003', 'BS12358', 'Chuyên gia da liễu, chuyên trị mụn, nám và các bệnh lý về da. Bác sĩ áp dụng các liệu pháp mới nhất để cải thiện và duy trì làn da khỏe mạnh cho bệnh nhân, từ da mặt đến da cơ thể.', 12, 'https://onghoikhinen.com/wp-content/uploads/2022/08/anh-anime-nam-cute-ngau-dep-hiem-lanh-lung-chat-ngau-dep-nhat-hien-tai-8730-30.jpg'),
('doc0024uuid00000000000000000024', 'user0024uuid00000000000000000024', 'hosp0004uuid00000000000000000004', NULL, 1, 'spec0004uuid00000000000000000004', 'BS12359', 'Chuyên gia thần kinh, điều trị các bệnh lý về thần kinh như đau nửa đầu, động kinh, bệnh Parkinson. Bác sĩ chuyên về điều trị các vấn đề về tâm lý, giúp bệnh nhân đối phó với stress và các vấn đề tâm lý khác.', 13, 'https://onghoikhinen.com/wp-content/uploads/2022/08/anh-anime-nam-cute-ngau-dep-hiem-lanh-lung-chat-ngau-dep-nhat-hien-tai-8730-30.jpg'),
('doc0025uuid00000000000000000025', 'user0025uuid00000000000000000025', 'hosp0005uuid00000000000000000005', NULL, 1, 'spec0005uuid00000000000000000005', 'BS12360', 'Chuyên gia ngoại khoa, điều trị các bệnh lý về thận, tiết niệu và đường tiêu hóa. Bác sĩ nổi tiếng với các ca phẫu thuật khó và thành công, mang lại sự hồi phục tuyệt vời cho bệnh nhân.', 14, 'https://onghoikhinen.com/wp-content/uploads/2022/08/anh-anime-nam-cute-ngau-dep-hiem-lanh-lung-chat-ngau-dep-nhat-hien-tai-8730-30.jpg'),
('doc0026uuid00000000000000000026', 'user0026uuid00000000000000000026', 'hosp0006uuid00000000000000000006', NULL, 1, 'spec0006uuid00000000000000000006', 'BS12361', 'Chuyên gia sản phụ khoa, thực hiện các phẫu thuật phụ khoa và điều trị bệnh lý sinh sản nữ. Bác sĩ còn chuyên về tư vấn tiền hôn nhân và các vấn đề tình dục cho phụ nữ.', 9, 'https://onghoikhinen.com/wp-content/uploads/2022/08/anh-anime-nam-cute-ngau-dep-hiem-lanh-lung-chat-ngau-dep-nhat-hien-tai-8730-30.jpg'),
('doc0027uuid00000000000000000027', 'user0027uuid00000000000000000027', 'hosp0007uuid00000000000000000007', NULL, 1, 'spec0007uuid00000000000000000007', 'BS12362', 'Chuyên gia răng hàm mặt, điều trị các vấn đề về răng miệng như sâu răng, viêm nướu, và phục hình răng cho bệnh nhân. Bác sĩ cũng chuyên trong việc làm đẹp răng miệng thông qua các dịch vụ chỉnh nha và tẩy trắng răng.', 15, 'https://onghoikhinen.com/wp-content/uploads/2022/08/anh-anime-nam-cute-ngau-dep-hiem-lanh-lung-chat-ngau-dep-nhat-hien-tai-8730-30.jpg');

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

-- Thêm lịch làm việc cho các bác sĩ
INSERT INTO schedules (uuid, doctor_id, work_date, start_time, end_time) VALUES
-- Bác sĩ 2
('sch0021uuid020101','doc0002uuid00000000000000000002','2025-07-02','08:00:00','12:00:00'),
('sch0022uuid020102','doc0002uuid00000000000000000002','2025-07-02','13:00:00','17:00:00'),
('sch0023uuid020103','doc0002uuid00000000000000000002','2025-07-03','08:00:00','12:00:00'),
('sch0024uuid020104','doc0002uuid00000000000000000002','2025-07-03','13:00:00','17:00:00'),
('sch0025uuid020105','doc0002uuid00000000000000000002','2025-07-04','08:00:00','12:00:00'),
('sch0026uuid020106','doc0002uuid00000000000000000002','2025-07-04','13:00:00','17:00:00'),
('sch0027uuid020107','doc0002uuid00000000000000000002','2025-07-05','08:00:00','12:00:00'),
('sch0028uuid020108','doc0002uuid00000000000000000002','2025-07-05','13:00:00','17:00:00'),
('sch0029uuid020109','doc0002uuid00000000000000000002','2025-07-06','08:00:00','12:00:00'),
('sch0030uuid020110','doc0002uuid00000000000000000002','2025-07-06','13:00:00','17:00:00'),
('sch0031uuid020201','doc0002uuid00000000000000000002','2025-07-07','08:00:00','12:00:00'),
('sch0032uuid020202','doc0002uuid00000000000000000002','2025-07-07','13:00:00','17:00:00'),
('sch0033uuid020203','doc0002uuid00000000000000000002','2025-07-08','08:00:00','12:00:00'),
('sch0034uuid020204','doc0002uuid00000000000000000002','2025-07-08','13:00:00','17:00:00'),
('sch0035uuid020205','doc0002uuid00000000000000000002','2025-07-09','08:00:00','12:00:00'),
('sch0036uuid020206','doc0002uuid00000000000000000002','2025-07-09','13:00:00','17:00:00'),
('sch0037uuid020207','doc0002uuid00000000000000000002','2025-07-10','08:00:00','12:00:00'),
('sch0038uuid020208','doc0002uuid00000000000000000002','2025-07-10','13:00:00','17:00:00'),
('sch0039uuid020209','doc0002uuid00000000000000000002','2025-07-11','08:00:00','12:00:00'),
('sch0040uuid020210','doc0002uuid00000000000000000002','2025-07-11','13:00:00','17:00:00'),

-- Bác sĩ 3
('sch0041uuid030101','doc0003uuid00000000000000000003','2025-07-02','08:00:00','12:00:00'),
('sch0042uuid030102','doc0003uuid00000000000000000003','2025-07-02','13:00:00','17:00:00'),
('sch0043uuid030201','doc0003uuid00000000000000000003','2025-07-03','08:00:00','12:00:00'),
('sch0044uuid030202','doc0003uuid00000000000000000003','2025-07-03','13:00:00','17:00:00'),
('sch0045uuid030203','doc0003uuid00000000000000000003','2025-07-04','08:00:00','12:00:00'),
('sch0046uuid030301','doc0003uuid00000000000000000003','2025-07-04','13:00:00','17:00:00'),
('sch0047uuid030302','doc0003uuid00000000000000000003','2025-07-05','08:00:00','12:00:00'),
('sch0048uuid030303','doc0003uuid00000000000000000003','2025-07-05','13:00:00','17:00:00'),
('sch0049uuid030304','doc0003uuid00000000000000000003','2025-07-06','08:00:00','12:00:00'),
('sch0050uuid030401','doc0003uuid00000000000000000003','2025-07-06','13:00:00','17:00:00'),
('sch0051uuid030402','doc0003uuid00000000000000000003','2025-07-07','08:00:00','12:00:00'),
('sch0052uuid030501','doc0003uuid00000000000000000003','2025-07-07','13:00:00','17:00:00'),
('sch0053uuid030502','doc0003uuid00000000000000000003','2025-07-08','08:00:00','12:00:00'),
('sch0054uuid030503','doc0003uuid00000000000000000003','2025-07-08','13:00:00','17:00:00'),
('sch0055uuid030601','doc0003uuid00000000000000000003','2025-07-09','08:00:00','12:00:00'),
('sch0056uuid030602','doc0003uuid00000000000000000003','2025-07-09','13:00:00','17:00:00'),
('sch0057uuid030603','doc0003uuid00000000000000000003','2025-07-10','08:00:00','12:00:00'),
('sch0058uuid030604','doc0003uuid00000000000000000003','2025-07-10','13:00:00','17:00:00'),
('sch0059uuid030701','doc0003uuid00000000000000000003','2025-07-11','08:00:00','12:00:00'),
('sch0060uuid030702','doc0003uuid00000000000000000003','2025-07-11','13:00:00','17:00:00'),

-- Bác sĩ 4
('sch0061uuid040101','doc0004uuid00000000000000000004','2025-07-02','08:00:00','12:00:00'),
('sch0062uuid040102','doc0004uuid00000000000000000004','2025-07-02','13:00:00','17:00:00'),
('sch0063uuid040201','doc0004uuid00000000000000000004','2025-07-03','08:00:00','12:00:00'),
('sch0064uuid040202','doc0004uuid00000000000000000004','2025-07-03','13:00:00','17:00:00'),
('sch0065uuid040203','doc0004uuid00000000000000000004','2025-07-04','08:00:00','12:00:00'),
('sch0066uuid040301','doc0004uuid00000000000000000004','2025-07-04','13:00:00','17:00:00'),
('sch0067uuid040302','doc0004uuid00000000000000000004','2025-07-05','08:00:00','12:00:00'),
('sch0068uuid040303','doc0004uuid00000000000000000004','2025-07-05','13:00:00','17:00:00'),
('sch0069uuid040304','doc0004uuid00000000000000000004','2025-07-06','08:00:00','12:00:00'),
('sch0070uuid040401','doc0004uuid00000000000000000004','2025-07-06','13:00:00','17:00:00'),
('sch0071uuid040402','doc0004uuid00000000000000000004','2025-07-07','08:00:00','12:00:00'),
('sch0072uuid040501','doc0004uuid00000000000000000004','2025-07-07','13:00:00','17:00:00'),
('sch0073uuid040502','doc0004uuid00000000000000000004','2025-07-08','08:00:00','12:00:00'),
('sch0074uuid040503','doc0004uuid00000000000000000004','2025-07-08','13:00:00','17:00:00'),
('sch0075uuid040601','doc0004uuid00000000000000000004','2025-07-09','08:00:00','12:00:00'),
('sch0076uuid040602','doc0004uuid00000000000000000004','2025-07-09','13:00:00','17:00:00'),
('sch0077uuid040603','doc0004uuid00000000000000000004','2025-07-10','08:00:00','12:00:00'),
('sch0078uuid040604','doc0004uuid00000000000000000004','2025-07-10','13:00:00','17:00:00'),
('sch0079uuid040701','doc0004uuid00000000000000000004','2025-07-11','08:00:00','12:00:00'),
('sch0080uuid040702','doc0004uuid00000000000000000004','2025-07-11','13:00:00','17:00:00'),

-- Bác sĩ 5
('sch0081uuid050101','doc0005uuid00000000000000000005','2025-07-02','08:00:00','12:00:00'),
('sch0082uuid050102','doc0005uuid00000000000000000005','2025-07-02','13:00:00','17:00:00'),
('sch0083uuid050201','doc0005uuid00000000000000000005','2025-07-03','08:00:00','12:00:00'),
('sch0084uuid050202','doc0005uuid00000000000000000005','2025-07-03','13:00:00','17:00:00'),
('sch0085uuid050203','doc0005uuid00000000000000000005','2025-07-04','08:00:00','12:00:00'),
('sch0086uuid050301','doc0005uuid00000000000000000005','2025-07-04','13:00:00','17:00:00'),
('sch0087uuid050302','doc0005uuid00000000000000000005','2025-07-05','08:00:00','12:00:00'),
('sch0088uuid050303','doc0005uuid00000000000000000005','2025-07-05','13:00:00','17:00:00'),
('sch0089uuid050304','doc0005uuid00000000000000000005','2025-07-06','08:00:00','12:00:00'),
('sch0090uuid050401','doc0005uuid00000000000000000005','2025-07-06','13:00:00','17:00:00'),
('sch0091uuid050402','doc0005uuid00000000000000000005','2025-07-07','08:00:00','12:00:00'),
('sch0092uuid050501','doc0005uuid00000000000000000005','2025-07-07','13:00:00','17:00:00'),
('sch0093uuid050502','doc0005uuid00000000000000000005','2025-07-08','08:00:00','12:00:00'),
('sch0094uuid050503','doc0005uuid00000000000000000005','2025-07-08','13:00:00','17:00:00'),
('sch0095uuid050601','doc0005uuid00000000000000000005','2025-07-09','08:00:00','12:00:00'),
('sch0096uuid050602','doc0005uuid00000000000000000005','2025-07-09','13:00:00','17:00:00'),
('sch0097uuid050603','doc0005uuid00000000000000000005','2025-07-10','08:00:00','12:00:00'),
('sch0098uuid050604','doc0005uuid00000000000000000005','2025-07-10','13:00:00','17:00:00'),
('sch0099uuid050701','doc0005uuid00000000000000000005','2025-07-11','08:00:00','12:00:00'),
('sch0100uuid050702','doc0005uuid00000000000000000005','2025-07-11','13:00:00','17:00:00'),

-- Bác sĩ 6
('sch0101uuid060101','doc0006uuid00000000000000000006','2025-07-02','08:00:00','12:00:00'),
('sch0102uuid060102','doc0006uuid00000000000000000006','2025-07-02','13:00:00','17:00:00'),
('sch0103uuid060201','doc0006uuid00000000000000000006','2025-07-03','08:00:00','12:00:00'),
('sch0104uuid060202','doc0006uuid00000000000000000006','2025-07-03','13:00:00','17:00:00'),
('sch0105uuid060203','doc0006uuid00000000000000000006','2025-07-04','08:00:00','12:00:00'),
('sch0106uuid060301','doc0006uuid00000000000000000006','2025-07-04','13:00:00','17:00:00'),
('sch0107uuid060302','doc0006uuid00000000000000000006','2025-07-05','08:00:00','12:00:00'),
('sch0108uuid060303','doc0006uuid00000000000000000006','2025-07-05','13:00:00','17:00:00'),
('sch0109uuid060304','doc0006uuid00000000000000000006','2025-07-06','08:00:00','12:00:00'),
('sch0110uuid060401','doc0006uuid00000000000000000006','2025-07-06','13:00:00','17:00:00'),
('sch0111uuid060402','doc0006uuid00000000000000000006','2025-07-07','08:00:00','12:00:00'),
('sch0112uuid060501','doc0006uuid00000000000000000006','2025-07-07','13:00:00','17:00:00'),
('sch0113uuid060502','doc0006uuid00000000000000000006','2025-07-08','08:00:00','12:00:00'),
('sch0114uuid060503','doc0006uuid00000000000000000006','2025-07-08','13:00:00','17:00:00'),
('sch0115uuid060601','doc0006uuid00000000000000000006','2025-07-09','08:00:00','12:00:00'),
('sch0116uuid060602','doc0006uuid00000000000000000006','2025-07-09','13:00:00','17:00:00'),
('sch0117uuid060603','doc0006uuid00000000000000000006','2025-07-10','08:00:00','12:00:00'),
('sch0118uuid060604','doc0006uuid00000000000000000006','2025-07-10','13:00:00','17:00:00'),
('sch0119uuid060701','doc0006uuid00000000000000000006','2025-07-11','08:00:00','12:00:00'),
('sch0120uuid060702','doc0006uuid00000000000000000006','2025-07-11','13:00:00','17:00:00'),

-- Bác sĩ 7
('sch0121uuid070101','doc0007uuid00000000000000000007','2025-07-02','08:00:00','12:00:00'),
('sch0122uuid070102','doc0007uuid00000000000000000007','2025-07-02','13:00:00','17:00:00'),
('sch0123uuid070201','doc0007uuid00000000000000000007','2025-07-03','08:00:00','12:00:00'),
('sch0124uuid070202','doc0007uuid00000000000000000007','2025-07-03','13:00:00','17:00:00'),
('sch0125uuid070203','doc0007uuid00000000000000000007','2025-07-04','08:00:00','12:00:00'),
('sch0126uuid070301','doc0007uuid00000000000000000007','2025-07-04','13:00:00','17:00:00'),
('sch0127uuid070302','doc0007uuid00000000000000000007','2025-07-05','08:00:00','12:00:00'),
('sch0128uuid070303','doc0007uuid00000000000000000007','2025-07-05','13:00:00','17:00:00'),
('sch0129uuid070304','doc0007uuid00000000000000000007','2025-07-06','08:00:00','12:00:00'),
('sch0130uuid070401','doc0007uuid00000000000000000007','2025-07-06','13:00:00','17:00:00'),


-- Bác sĩ 8
('sch0131uuid080101','doc0008uuid00000000000000000008','2025-07-02','08:00:00','12:00:00'),
('sch0132uuid080102','doc0008uuid00000000000000000008','2025-07-02','13:00:00','17:00:00'),
('sch0133uuid080201','doc0008uuid00000000000000000008','2025-07-03','08:00:00','12:00:00'),
('sch0134uuid080202','doc0008uuid00000000000000000008','2025-07-03','13:00:00','17:00:00'),
('sch0135uuid080203','doc0008uuid00000000000000000008','2025-07-04','08:00:00','12:00:00'),
('sch0136uuid080301','doc0008uuid00000000000000000008','2025-07-04','13:00:00','17:00:00'),
('sch0137uuid080302','doc0008uuid00000000000000000008','2025-07-05','08:00:00','12:00:00'),
('sch0138uuid080303','doc0008uuid00000000000000000008','2025-07-05','13:00:00','17:00:00'),
('sch0139uuid080304','doc0008uuid00000000000000000008','2025-07-06','08:00:00','12:00:00'),
('sch0140uuid080401','doc0008uuid00000000000000000008','2025-07-06','13:00:00','17:00:00'),

-- Bác sĩ 9
('sch0141uuid090101','doc0009uuid00000000000000000009','2025-07-02','08:00:00','12:00:00'),
('sch0142uuid090102','doc0009uuid00000000000000000009','2025-07-02','13:00:00','17:00:00'),
('sch0143uuid090201','doc0009uuid00000000000000000009','2025-07-03','08:00:00','12:00:00'),
('sch0144uuid090202','doc0009uuid00000000000000000009','2025-07-03','13:00:00','17:00:00'),
('sch0145uuid090203','doc0009uuid00000000000000000009','2025-07-04','08:00:00','12:00:00'),
('sch0146uuid090301','doc0009uuid00000000000000000009','2025-07-04','13:00:00','17:00:00'),
('sch0147uuid090302','doc0009uuid00000000000000000009','2025-07-05','08:00:00','12:00:00'),
('sch0148uuid090303','doc0009uuid00000000000000000009','2025-07-05','13:00:00','17:00:00'),
('sch0149uuid090304','doc0009uuid00000000000000000009','2025-07-06','08:00:00','12:00:00'),
('sch0150uuid090401','doc0009uuid00000000000000000009','2025-07-06','13:00:00','17:00:00'),

-- Bác sĩ 10
('sch0151uuid100101','doc0010uuid00000000000000000010','2025-07-02','08:00:00','12:00:00'),
('sch0152uuid100102','doc0010uuid00000000000000000010','2025-07-02','13:00:00','17:00:00'),
('sch0153uuid100201','doc0010uuid00000000000000000010','2025-07-03','08:00:00','12:00:00'),
('sch0154uuid100202','doc0010uuid00000000000000000010','2025-07-03','13:00:00','17:00:00'),
('sch0155uuid100203','doc0010uuid00000000000000000010','2025-07-04','08:00:00','12:00:00'),
('sch0156uuid100301','doc0010uuid00000000000000000010','2025-07-04','13:00:00','17:00:00'),
('sch0157uuid100302','doc0010uuid00000000000000000010','2025-07-05','08:00:00','12:00:00'),
('sch0158uuid100303','doc0010uuid00000000000000000010','2025-07-05','13:00:00','17:00:00'),
('sch0159uuid100304','doc0010uuid00000000000000000010','2025-07-06','08:00:00','12:00:00'),
('sch0160uuid100401','doc0010uuid00000000000000000010','2025-07-06','13:00:00','17:00:00'),

-- Bác sĩ 11 (đã sửa uuid để tránh trùng lặp)
('sch0161uuid110101','doc0011uuid00000000000000000011','2025-07-02','08:00:00','12:00:00'),
('sch0162uuid110102','doc0011uuid00000000000000000011','2025-07-02','13:00:00','17:00:00'),
('sch0163uuid110201','doc0011uuid00000000000000000011','2025-07-03','08:00:00','12:00:00'),
('sch0164uuid110202','doc0011uuid00000000000000000011','2025-07-03','13:00:00','17:00:00'),
('sch0165uuid110203','doc0011uuid00000000000000000011','2025-07-04','08:00:00','12:00:00'),
('sch0166uuid110301','doc0011uuid00000000000000000011','2025-07-04','13:00:00','17:00:00'),
('sch0167uuid110302','doc0011uuid00000000000000000011','2025-07-05','08:00:00','12:00:00'),
('sch0168uuid110303','doc0011uuid00000000000000000011','2025-07-05','13:00:00','17:00:00'),
('sch0169uuid110304','doc0011uuid00000000000000000011','2025-07-06','08:00:00','12:00:00'),
('sch0170uuid110401','doc0011uuid00000000000000000011','2025-07-06','13:00:00','17:00:00'),
('sch0171uuid110402','doc0011uuid00000000000000000011','2025-07-07','08:00:00','12:00:00'),
('sch0172uuid110501','doc0011uuid00000000000000000011','2025-07-07','13:00:00','17:00:00'),
('sch0173uuid110502','doc0011uuid00000000000000000011','2025-07-08','08:00:00','12:00:00'),
('sch0174uuid110503','doc0011uuid00000000000000000011','2025-07-08','13:00:00','17:00:00'),
('sch0175uuid110601','doc0011uuid00000000000000000011','2025-07-09','08:00:00','12:00:00'),
('sch0176uuid110602','doc0011uuid00000000000000000011','2025-07-09','13:00:00','17:00:00'),
('sch0177uuid110603','doc0011uuid00000000000000000011','2025-07-10','08:00:00','12:00:00'),
('sch0178uuid110604','doc0011uuid00000000000000000011','2025-07-10','13:00:00','17:00:00'),
('sch0179uuid110701','doc0011uuid00000000000000000011','2025-07-11','08:00:00','12:00:00'),
('sch0180uuid110702','doc0011uuid00000000000000000011','2025-07-11','13:00:00','17:00:00'),

-- Bác sĩ 12
-- Bác sĩ 12
('sch0201uuid120101','doc0012uuid00000000000000000012','2025-07-02','08:00:00','12:00:00'),
('sch0202uuid120102','doc0012uuid00000000000000000012','2025-07-02','13:00:00','17:00:00'),
('sch0203uuid120201','doc0012uuid00000000000000000012','2025-07-03','08:00:00','12:00:00'),
('sch0204uuid120202','doc0012uuid00000000000000000012','2025-07-03','13:00:00','17:00:00'),
('sch0205uuid120203','doc0012uuid00000000000000000012','2025-07-04','08:00:00','12:00:00'),
('sch0206uuid120301','doc0012uuid00000000000000000012','2025-07-04','13:00:00','17:00:00'),
('sch0207uuid120302','doc0012uuid00000000000000000012','2025-07-05','08:00:00','12:00:00'),
('sch0208uuid120303','doc0012uuid00000000000000000012','2025-07-05','13:00:00','17:00:00'),
('sch0209uuid120304','doc0012uuid00000000000000000012','2025-07-06','08:00:00','12:00:00'),
('sch0210uuid120401','doc0012uuid00000000000000000012','2025-07-06','13:00:00','17:00:00'),

-- Bác sĩ 13
('sch0181uuid130101','doc0013uuid00000000000000000013','2025-07-02','08:00:00','12:00:00'),
('sch0182uuid130102','doc0013uuid00000000000000000013','2025-07-02','13:00:00','17:00:00'),
('sch0183uuid130201','doc0013uuid00000000000000000013','2025-07-03','08:00:00','12:00:00'),
('sch0184uuid130202','doc0013uuid00000000000000000013','2025-07-03','13:00:00','17:00:00'),
('sch0185uuid130203','doc0013uuid00000000000000000013','2025-07-04','08:00:00','12:00:00'),
('sch0186uuid130301','doc0013uuid00000000000000000013','2025-07-04','13:00:00','17:00:00'),
('sch0187uuid130302','doc0013uuid00000000000000000013','2025-07-05','08:00:00','12:00:00'),
('sch0188uuid130303','doc0013uuid00000000000000000013','2025-07-05','13:00:00','17:00:00'),
('sch0189uuid130304','doc0013uuid00000000000000000013','2025-07-06','08:00:00','12:00:00'),
('sch0190uuid130401','doc0013uuid00000000000000000013','2025-07-06','13:00:00','17:00:00'),
('sch0191uuid130402','doc0013uuid00000000000000000013','2025-07-07','08:00:00','12:00:00'),
('sch0192uuid130501','doc0013uuid00000000000000000013','2025-07-07','13:00:00','17:00:00'),
('sch0193uuid130502','doc0013uuid00000000000000000013','2025-07-08','08:00:00','12:00:00'),
('sch0194uuid130503','doc0013uuid00000000000000000013','2025-07-08','13:00:00','17:00:00'),
('sch0195uuid130601','doc0013uuid00000000000000000013','2025-07-09','08:00:00','12:00:00'),
('sch0196uuid130602','doc0013uuid00000000000000000013','2025-07-09','13:00:00','17:00:00'),
('sch0197uuid130603','doc0013uuid00000000000000000013','2025-07-10','08:00:00','12:00:00'),
('sch0198uuid130604','doc0013uuid00000000000000000013','2025-07-10','13:00:00','17:00:00'),
('sch0199uuid130701','doc0013uuid00000000000000000013','2025-07-11','08:00:00','12:00:00'),
('sch0200uuid130702','doc0013uuid00000000000000000013','2025-07-11','13:00:00','17:00:00'),

-- Bác sĩ 14
('sch0141uuid080101','doc0014uuid00000000000000000014','2025-07-02','08:00:00','12:00:00'),
('sch0142uuid080102','doc0014uuid00000000000000000014','2025-07-02','13:00:00','17:00:00'),
('sch0143uuid080201','doc0014uuid00000000000000000014','2025-07-03','08:00:00','12:00:00'),
('sch0144uuid080202','doc0014uuid00000000000000000014','2025-07-03','13:00:00','17:00:00'),
('sch0145uuid080203','doc0014uuid00000000000000000014','2025-07-04','08:00:00','12:00:00'),
('sch0146uuid080301','doc0014uuid00000000000000000014','2025-07-04','13:00:00','17:00:00'),
('sch0147uuid080302','doc0014uuid00000000000000000014','2025-07-05','08:00:00','12:00:00'),
('sch0148uuid080303','doc0014uuid00000000000000000014','2025-07-05','13:00:00','17:00:00'),
('sch0149uuid080304','doc0014uuid00000000000000000014','2025-07-06','08:00:00','12:00:00'),
('sch0150uuid080401','doc0014uuid00000000000000000014','2025-07-06','13:00:00','17:00:00'),
('sch0151uuid080402','doc0014uuid00000000000000000014','2025-07-07','08:00:00','12:00:00'),
('sch0152uuid080501','doc0014uuid00000000000000000014','2025-07-07','13:00:00','17:00:00'),
('sch0153uuid080502','doc0014uuid00000000000000000014','2025-07-08','08:00:00','12:00:00'),
('sch0154uuid080503','doc0014uuid00000000000000000014','2025-07-08','13:00:00','17:00:00'),
('sch0155uuid080601','doc0014uuid00000000000000000014','2025-07-09','08:00:00','12:00:00'),
('sch0156uuid080602','doc0014uuid00000000000000000014','2025-07-09','13:00:00','17:00:00'),
('sch0157uuid080603','doc0014uuid00000000000000000014','2025-07-10','08:00:00','12:00:00'),
('sch0158uuid080604','doc0014uuid00000000000000000014','2025-07-10','13:00:00','17:00:00'),
('sch0159uuid080701','doc0014uuid00000000000000000014','2025-07-11','08:00:00','12:00:00'),
('sch0160uuid080702','doc0014uuid00000000000000000014','2025-07-11','13:00:00','17:00:00'),

-- Bác sĩ 15
('sch0161uuid090101','doc0015uuid00000000000000000015','2025-07-02','08:00:00','12:00:00'),
('sch0162uuid090102','doc0015uuid00000000000000000015','2025-07-02','13:00:00','17:00:00'),
('sch0163uuid090201','doc0015uuid00000000000000000015','2025-07-03','08:00:00','12:00:00'),
('sch0164uuid090202','doc0015uuid00000000000000000015','2025-07-03','13:00:00','17:00:00'),
('sch0165uuid090203','doc0015uuid00000000000000000015','2025-07-04','08:00:00','12:00:00'),
('sch0166uuid090301','doc0015uuid00000000000000000015','2025-07-04','13:00:00','17:00:00'),
('sch0167uuid090302','doc0015uuid00000000000000000015','2025-07-05','08:00:00','12:00:00'),
('sch0168uuid090303','doc0015uuid00000000000000000015','2025-07-05','13:00:00','17:00:00'),
('sch0169uuid090304','doc0015uuid00000000000000000015','2025-07-06','08:00:00','12:00:00'),
('sch0170uuid090401','doc0015uuid00000000000000000015','2025-07-06','13:00:00','17:00:00'),
('sch0171uuid090402','doc0015uuid00000000000000000015','2025-07-07','08:00:00','12:00:00'),
('sch0172uuid090501','doc0015uuid00000000000000000015','2025-07-07','13:00:00','17:00:00'),
('sch0173uuid090502','doc0015uuid00000000000000000015','2025-07-08','08:00:00','12:00:00'),
('sch0174uuid090503','doc0015uuid00000000000000000015','2025-07-08','13:00:00','17:00:00'),
('sch0175uuid090601','doc0015uuid00000000000000000015','2025-07-09','08:00:00','12:00:00'),
('sch0176uuid090602','doc0015uuid00000000000000000015','2025-07-09','13:00:00','17:00:00'),
('sch0177uuid090603','doc0015uuid00000000000000000015','2025-07-10','08:00:00','12:00:00'),
('sch0178uuid090604','doc0015uuid00000000000000000015','2025-07-10','13:00:00','17:00:00'),
('sch0179uuid090701','doc0015uuid00000000000000000015','2025-07-11','08:00:00','12:00:00'),
('sch0180uuid090702','doc0015uuid00000000000000000015','2025-07-11','13:00:00','17:00:00'),

-- Bác sĩ 16
('sch0201uuid160101','doc0016uuid00000000000000000016','2025-07-02','08:00:00','12:00:00'),
('sch0202uuid160102','doc0016uuid00000000000000000016','2025-07-02','13:00:00','17:00:00'),
('sch0203uuid160201','doc0016uuid00000000000000000016','2025-07-03','08:00:00','12:00:00'),
('sch0204uuid160202','doc0016uuid00000000000000000016','2025-07-03','13:00:00','17:00:00'),
('sch0205uuid160203','doc0016uuid00000000000000000016','2025-07-04','08:00:00','12:00:00'),
('sch0206uuid160301','doc0016uuid00000000000000000016','2025-07-04','13:00:00','17:00:00'),
('sch0207uuid160302','doc0016uuid00000000000000000016','2025-07-05','08:00:00','12:00:00'),
('sch0208uuid160303','doc0016uuid00000000000000000016','2025-07-05','13:00:00','17:00:00'),
('sch0209uuid160304','doc0016uuid00000000000000000016','2025-07-06','08:00:00','12:00:00'),
('sch0210uuid160401','doc0016uuid00000000000000000016','2025-07-06','13:00:00','17:00:00'),

-- Bác sĩ 17
('sch0211uuid170101','doc0017uuid00000000000000000017','2025-07-02','08:00:00','12:00:00'),
('sch0212uuid170102','doc0017uuid00000000000000000017','2025-07-02','13:00:00','17:00:00'),
('sch0213uuid170201','doc0017uuid00000000000000000017','2025-07-03','08:00:00','12:00:00'),
('sch0214uuid170202','doc0017uuid00000000000000000017','2025-07-03','13:00:00','17:00:00'),
('sch0215uuid170203','doc0017uuid00000000000000000017','2025-07-04','08:00:00','12:00:00'),
('sch0216uuid170301','doc0017uuid00000000000000000017','2025-07-04','13:00:00','17:00:00'),
('sch0217uuid170302','doc0017uuid00000000000000000017','2025-07-05','08:00:00','12:00:00'),
('sch0218uuid170303','doc0017uuid00000000000000000017','2025-07-05','13:00:00','17:00:00'),
('sch0219uuid170304','doc0017uuid00000000000000000017','2025-07-06','08:00:00','12:00:00'),
('sch0220uuid170401','doc0017uuid00000000000000000017','2025-07-06','13:00:00','17:00:00'),

-- Bác sĩ 18
('sch0221uuid180101','doc0018uuid00000000000000000018','2025-07-02','08:00:00','12:00:00'),
('sch0222uuid180102','doc0018uuid00000000000000000018','2025-07-02','13:00:00','17:00:00'),
('sch0223uuid180201','doc0018uuid00000000000000000018','2025-07-03','08:00:00','12:00:00'),
('sch0224uuid180202','doc0018uuid00000000000000000018','2025-07-03','13:00:00','17:00:00'),
('sch0225uuid180203','doc0018uuid00000000000000000018','2025-07-04','08:00:00','12:00:00'),
('sch0226uuid180301','doc0018uuid00000000000000000018','2025-07-04','13:00:00','17:00:00'),
('sch0227uuid180302','doc0018uuid00000000000000000018','2025-07-05','08:00:00','12:00:00'),
('sch0228uuid180303','doc0018uuid00000000000000000018','2025-07-05','13:00:00','17:00:00'),
('sch0229uuid180304','doc0018uuid00000000000000000018','2025-07-06','08:00:00','12:00:00'),
('sch0230uuid180401','doc0018uuid00000000000000000018','2025-07-06','13:00:00','17:00:00'),

-- Bác sĩ 19
('sch0231uuid190101','doc0019uuid00000000000000000019','2025-07-02','08:00:00','12:00:00'),
('sch0232uuid190102','doc0019uuid00000000000000000019','2025-07-02','13:00:00','17:00:00'),
('sch0233uuid190201','doc0019uuid00000000000000000019','2025-07-03','08:00:00','12:00:00'),
('sch0234uuid190202','doc0019uuid00000000000000000019','2025-07-03','13:00:00','17:00:00'),
('sch0235uuid190203','doc0019uuid00000000000000000019','2025-07-04','08:00:00','12:00:00'),
('sch0236uuid190301','doc0019uuid00000000000000000019','2025-07-04','13:00:00','17:00:00'),
('sch0237uuid190302','doc0019uuid00000000000000000019','2025-07-05','08:00:00','12:00:00'),
('sch0238uuid190303','doc0019uuid00000000000000000019','2025-07-05','13:00:00','17:00:00'),
('sch0239uuid190304','doc0019uuid00000000000000000019','2025-07-06','08:00:00','12:00:00'),
('sch0240uuid190401','doc0019uuid00000000000000000019','2025-07-06','13:00:00','17:00:00'),

-- Bác sĩ 20
('sch0241uuid200101','doc0020uuid00000000000000000020','2025-07-02','08:00:00','12:00:00'),
('sch0242uuid200102','doc0020uuid00000000000000000020','2025-07-02','13:00:00','17:00:00'),
('sch0243uuid200201','doc0020uuid00000000000000000020','2025-07-03','08:00:00','12:00:00'),
('sch0244uuid200202','doc0020uuid00000000000000000020','2025-07-03','13:00:00','17:00:00'),
('sch0245uuid200203','doc0020uuid00000000000000000020','2025-07-04','08:00:00','12:00:00'),
('sch0246uuid200301','doc0020uuid00000000000000000020','2025-07-04','13:00:00','17:00:00'),
('sch0247uuid200302','doc0020uuid00000000000000000020','2025-07-05','08:00:00','12:00:00'),
('sch0248uuid200303','doc0020uuid00000000000000000020','2025-07-05','13:00:00','17:00:00'),
('sch0249uuid200304','doc0020uuid00000000000000000020','2025-07-06','08:00:00','12:00:00'),
('sch0250uuid200401','doc0020uuid00000000000000000020','2025-07-06','13:00:00','17:00:00'),

-- Bác sĩ 21
('sch0251uuid210101','doc0021uuid00000000000000000021','2025-07-02','08:00:00','12:00:00'),
('sch0252uuid210102','doc0021uuid00000000000000000021','2025-07-02','13:00:00','17:00:00'),
('sch0253uuid210201','doc0021uuid00000000000000000021','2025-07-03','08:00:00','12:00:00'),
('sch0254uuid210202','doc0021uuid00000000000000000021','2025-07-03','13:00:00','17:00:00'),
('sch0255uuid210203','doc0021uuid00000000000000000021','2025-07-04','08:00:00','12:00:00'),
('sch0256uuid210301','doc0021uuid00000000000000000021','2025-07-04','13:00:00','17:00:00'),
('sch0257uuid210302','doc0021uuid00000000000000000021','2025-07-05','08:00:00','12:00:00'),
('sch0258uuid210303','doc0021uuid00000000000000000021','2025-07-05','13:00:00','17:00:00'),
('sch0259uuid210304','doc0021uuid00000000000000000021','2025-07-06','08:00:00','12:00:00'),
('sch0260uuid210401','doc0021uuid00000000000000000021','2025-07-06','13:00:00','17:00:00'),

-- Bác sĩ 22
('sch0261uuid220101','doc0022uuid00000000000000000022','2025-07-02','08:00:00','12:00:00'),
('sch0262uuid220102','doc0022uuid00000000000000000022','2025-07-02','13:00:00','17:00:00'),
('sch0263uuid220201','doc0022uuid00000000000000000022','2025-07-03','08:00:00','12:00:00'),
('sch0264uuid220202','doc0022uuid00000000000000000022','2025-07-03','13:00:00','17:00:00'),
('sch0265uuid220203','doc0022uuid00000000000000000022','2025-07-04','08:00:00','12:00:00'),
('sch0266uuid220301','doc0022uuid00000000000000000022','2025-07-04','13:00:00','17:00:00'),
('sch0267uuid220302','doc0022uuid00000000000000000022','2025-07-05','08:00:00','12:00:00'),
('sch0268uuid220303','doc0022uuid00000000000000000022','2025-07-05','13:00:00','17:00:00'),
('sch0269uuid220304','doc0022uuid00000000000000000022','2025-07-06','08:00:00','12:00:00'),
('sch0270uuid220401','doc0022uuid00000000000000000022','2025-07-06','13:00:00','17:00:00'),

-- Bác sĩ 23
('sch0271uuid230101','doc0023uuid00000000000000000023','2025-07-02','08:00:00','12:00:00'),
('sch0272uuid230102','doc0023uuid00000000000000000023','2025-07-02','13:00:00','17:00:00'),
('sch0273uuid230201','doc0023uuid00000000000000000023','2025-07-03','08:00:00','12:00:00'),
('sch0274uuid230202','doc0023uuid00000000000000000023','2025-07-03','13:00:00','17:00:00'),
('sch0275uuid230203','doc0023uuid00000000000000000023','2025-07-04','08:00:00','12:00:00'),
('sch0276uuid230301','doc0023uuid00000000000000000023','2025-07-04','13:00:00','17:00:00'),
('sch0277uuid230302','doc0023uuid00000000000000000023','2025-07-05','08:00:00','12:00:00'),
('sch0278uuid230303','doc0023uuid00000000000000000023','2025-07-05','13:00:00','17:00:00'),
('sch0279uuid230304','doc0023uuid00000000000000000023','2025-07-06','08:00:00','12:00:00'),
('sch0280uuid230401','doc0023uuid00000000000000000023','2025-07-06','13:00:00','17:00:00'),

-- Bác sĩ 24
('sch0281uuid240101','doc0024uuid00000000000000000024','2025-07-02','08:00:00','12:00:00'),
('sch0282uuid240102','doc0024uuid00000000000000000024','2025-07-02','13:00:00','17:00:00'),
('sch0283uuid240201','doc0024uuid00000000000000000024','2025-07-03','08:00:00','12:00:00'),
('sch0284uuid240202','doc0024uuid00000000000000000024','2025-07-03','13:00:00','17:00:00'),
('sch0285uuid240203','doc0024uuid00000000000000000024','2025-07-04','08:00:00','12:00:00'),
('sch0286uuid240301','doc0024uuid00000000000000000024','2025-07-04','13:00:00','17:00:00'),
('sch0287uuid240302','doc0024uuid00000000000000000024','2025-07-05','08:00:00','12:00:00'),
('sch0288uuid240303','doc0024uuid00000000000000000024','2025-07-05','13:00:00','17:00:00'),
('sch0289uuid240304','doc0024uuid00000000000000000024','2025-07-06','08:00:00','12:00:00'),
('sch0290uuid240401','doc0024uuid00000000000000000024','2025-07-06','13:00:00','17:00:00'),

-- Bác sĩ 25
('sch0291uuid250101','doc0025uuid00000000000000000025','2025-07-02','08:00:00','12:00:00'),
('sch0292uuid250102','doc0025uuid00000000000000000025','2025-07-02','13:00:00','17:00:00'),
('sch0293uuid250201','doc0025uuid00000000000000000025','2025-07-03','08:00:00','12:00:00'),
('sch0294uuid250202','doc0025uuid00000000000000000025','2025-07-03','13:00:00','17:00:00'),
('sch0295uuid250203','doc0025uuid00000000000000000025','2025-07-04','08:00:00','12:00:00'),
('sch0296uuid250301','doc0025uuid00000000000000000025','2025-07-04','13:00:00','17:00:00'),
('sch0297uuid250302','doc0025uuid00000000000000000025','2025-07-05','08:00:00','12:00:00'),
('sch0298uuid250303','doc0025uuid00000000000000000025','2025-07-05','13:00:00','17:00:00'),
('sch0299uuid250304','doc0025uuid00000000000000000025','2025-07-06','08:00:00','12:00:00'),
('sch0300uuid250401','doc0025uuid00000000000000000025','2025-07-06','13:00:00','17:00:00'),

-- Bác sĩ 26
('sch0301uuid260101','doc0026uuid00000000000000000026','2025-07-02','08:00:00','12:00:00'),
('sch0302uuid260102','doc0026uuid00000000000000000026','2025-07-02','13:00:00','17:00:00'),
('sch0303uuid260201','doc0026uuid00000000000000000026','2025-07-03','08:00:00','12:00:00'),
('sch0304uuid260202','doc0026uuid00000000000000000026','2025-07-03','13:00:00','17:00:00'),
('sch0305uuid260203','doc0026uuid00000000000000000026','2025-07-04','08:00:00','12:00:00'),
('sch0306uuid260301','doc0026uuid00000000000000000026','2025-07-04','13:00:00','17:00:00'),
('sch0307uuid260302','doc0026uuid00000000000000000026','2025-07-05','08:00:00','12:00:00'),
('sch0308uuid260303','doc0026uuid00000000000000000026','2025-07-05','13:00:00','17:00:00'),
('sch0309uuid260304','doc0026uuid00000000000000000026','2025-07-06','08:00:00','12:00:00'),
('sch0310uuid260401','doc0026uuid00000000000000000026','2025-07-06','13:00:00','17:00:00'),

-- Bác sĩ 27
('sch0311uuid270101','doc0027uuid00000000000000000027','2025-07-02','08:00:00','12:00:00'),
('sch0312uuid270102','doc0027uuid00000000000000000027','2025-07-02','13:00:00','17:00:00'),
('sch0313uuid270201','doc0027uuid00000000000000000027','2025-07-03','08:00:00','12:00:00'),
('sch0314uuid270202','doc0027uuid00000000000000000027','2025-07-03','13:00:00','17:00:00'),
('sch0315uuid270203','doc0027uuid00000000000000000027','2025-07-04','08:00:00','12:00:00'),
('sch0316uuid270301','doc0027uuid00000000000000000027','2025-07-04','13:00:00','17:00:00'),
('sch0317uuid270302','doc0027uuid00000000000000000027','2025-07-05','08:00:00','12:00:00'),
('sch0318uuid270303','doc0027uuid00000000000000000027','2025-07-05','13:00:00','17:00:00'),
('sch0319uuid270304','doc0027uuid00000000000000000027','2025-07-06','08:00:00','12:00:00'),
('sch0320uuid270401','doc0027uuid00000000000000000027','2025-07-06','13:00:00','17:00:00');

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
('ms0001uuid00000000000000000001', 'Xét nghiệm máu', 'Kiểm tra chỉ số máu', 200000, 'spec0001uuid00000000000000000001', 'cli0001uuid00000000000000000001', 'hosp0001uuid00000000000000000001', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/08/hinh-nen-dien-thoai-anime-2.jpg'),
('ms0002uuid00000000000000000002', 'Khám nhi', 'Khám sức khỏe cho trẻ', 150000, 'spec0002uuid00000000000000000002', 'cli0002uuid00000000000000000002', 'hosp0002uuid00000000000000000002', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/08/hinh-nen-dien-thoai-anime-2.jpg'),
('ms0003uuid00000000000000000003', 'Khám da liễu', 'Tư vấn da', 180000, 'spec0003uuid00000000000000000003', 'cli0003uuid00000000000000000003', 'hosp0003uuid00000000000000000003', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/08/hinh-nen-dien-thoai-anime-2.jpg'),
('ms0004uuid00000000000000000004', 'Khám thần kinh', 'Khám và tư vấn thần kinh', 250000, 'spec0004uuid00000000000000000004', 'cli0004uuid00000000000000000004', 'hosp0004uuid00000000000000000004', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/08/hinh-nen-dien-thoai-anime-2.jpg'),
('ms0005uuid00000000000000000005', 'Khám ngoại', 'Khám các vấn đề ngoại tổng quát', 200000, 'spec0005uuid00000000000000000005', 'cli0005uuid00000000000000000005', 'hosp0005uuid00000000000000000005', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/08/hinh-nen-dien-thoai-anime-2.jpg'),
('ms0006uuid00000000000000000006', 'Khám sản phụ', 'Khám thai sản', 300000, 'spec0006uuid00000000000000000006', 'cli0006uuid00000000000000000006', 'hosp0006uuid00000000000000000006', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/08/hinh-nen-dien-thoai-anime-2.jpg'),
('ms0007uuid00000000000000000007', 'Khám nội tiết', 'Kiểm tra hormone', 210000, 'spec0009uuid00000000000000000009', 'cli0007uuid00000000000000000007', 'hosp0007uuid00000000000000000007', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/08/hinh-nen-dien-thoai-anime-2.jpg'),
('ms0008uuid00000000000000000008', 'Khám ung bướu', 'Tầm soát ung thư', 350000, 'spec0008uuid00000000000000000008', 'cli0009uuid00000000000000000009', 'hosp0009uuid00000000000000000009', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/08/hinh-nen-dien-thoai-anime-2.jpg'),
('ms0009uuid00000000000000000009', 'Khám răng hàm mặt', 'Khám nha khoa', 160000, 'spec0007uuid00000000000000000007', 'cli0004uuid00000000000000000004', 'hosp0004uuid00000000000000000004', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/08/hinh-nen-dien-thoai-anime-2.jpg'),
('ms0010uuid00000000000000000010', 'Khám chấn thương', 'Khám chấn thương chỉnh hình', 240000, 'spec0010uuid00000000000000000010', 'cli0010uuid00000000000000000010', 'hosp0010uuid00000000000000000010', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/08/hinh-nen-dien-thoai-anime-2.jpg'),
('ms0011uuid00000000000000000011', 'Khám tổng quát', 'Khám sức khỏe toàn diện', 250000, 'spec0001uuid00000000000000000001', 'cli0001uuid00000000000000000001', 'hosp0001uuid00000000000000000001', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/08/hinh-nen-dien-thoai-anime-2.jpg'),
('ms0012uuid00000000000000000012', 'Khám tai mũi họng', 'Khám tai, mũi, họng', 170000, 'spec0002uuid00000000000000000002', 'cli0002uuid00000000000000000002', 'hosp0002uuid00000000000000000002', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/08/hinh-nen-dien-thoai-anime-2.jpg'),
('ms0013uuid00000000000000000013', 'Khám tim mạch', 'Khám sức khỏe tim mạch', 300000, 'spec0001uuid00000000000000000001', 'cli0003uuid00000000000000000003', 'hosp0003uuid00000000000000000003', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/08/hinh-nen-dien-thoai-anime-2.jpg'),
('ms0014uuid00000000000000000014', 'Khám phụ khoa', 'Khám phụ khoa', 230000, 'spec0006uuid00000000000000000006', 'cli0004uuid00000000000000000004', 'hosp0004uuid00000000000000000004', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/08/hinh-nen-dien-thoai-anime-2.jpg'),

('ms0015uuid00000000000000000015', 'Khám mắt', 'Khám và tư vấn mắt', 180000, 'spec0007uuid00000000000000000007', 'cli0005uuid00000000000000000005', 'hosp0005uuid00000000000000000005', 'https://i.pinimg.com/736x/fe/a6/ab/fea6abcca2bee97515b108313db5ef0a.jpg'),
('ms0016uuid00000000000000000016', 'Khám dạ dày', 'Khám và tư vấn dạ dày', 220000, 'spec0008uuid00000000000000000008', 'cli0006uuid00000000000000000006', 'hosp0006uuid00000000000000000006', 'https://i.pinimg.com/736x/fe/a6/ab/fea6abcca2bee97515b108313db5ef0a.jpg'),
('ms0017uuid00000000000000000017', 'Khám cổ họng', 'Khám và tư vấn cổ họng', 190000, 'spec0002uuid00000000000000000002', 'cli0007uuid00000000000000000007', 'hosp0007uuid00000000000000000007', 'https://i.pinimg.com/736x/fe/a6/ab/fea6abcca2bee97515b108313db5ef0a.jpg'),
('ms0018uuid00000000000000000018', 'Khám tiểu đường', 'Khám và tư vấn tiểu đường', 230000, 'spec0009uuid00000000000000000009', 'cli0008uuid00000000000000000008', 'hosp0008uuid00000000000000000008', 'https://i.pinimg.com/736x/fe/a6/ab/fea6abcca2bee97515b108313db5ef0a.jpg'),
('ms0019uuid00000000000000000019', 'Khám ung thư vú', 'Tầm soát ung thư vú', 330000, 'spec0008uuid00000000000000000008', 'cli0009uuid00000000000000000009', 'hosp0009uuid00000000000000000009', 'https://i.pinimg.com/736x/fe/a6/ab/fea6abcca2bee97515b108313db5ef0a.jpg'),
('ms0020uuid00000000000000000020', 'Khám sức khỏe định kỳ', 'Khám sức khỏe định kỳ cho công ty', 200000, 'spec0001uuid00000000000000000001', 'cli0001uuid00000000000000000001', 'hosp0001uuid00000000000000000001', 'https://i.pinimg.com/736x/fe/a6/ab/fea6abcca2bee97515b108313db5ef0a.jpg'),
('ms0021uuid00000000000000000021', 'Khám tai mũi họng', 'Khám tai mũi họng', 170000, 'spec0002uuid00000000000000000002', 'cli0002uuid00000000000000000002', 'hosp0002uuid00000000000000000002', 'https://i.pinimg.com/736x/fe/a6/ab/fea6abcca2bee97515b108313db5ef0a.jpg'),
('ms0022uuid00000000000000000022', 'Khám răng', 'Khám răng và tư vấn nha khoa', 150000, 'spec0007uuid00000000000000000007', 'cli0003uuid00000000000000000003', 'hosp0003uuid00000000000000000003', 'https://i.pinimg.com/736x/fe/a6/ab/fea6abcca2bee97515b108313db5ef0a.jpg'),
('ms0023uuid00000000000000000023', 'Khám khớp', 'Khám và tư vấn khớp', 220000, 'spec0009uuid00000000000000000009', 'cli0004uuid00000000000000000004', 'hosp0004uuid00000000000000000004', 'https://i.pinimg.com/736x/fe/a6/ab/fea6abcca2bee97515b108313db5ef0a.jpg'),
('ms0024uuid00000000000000000024', 'Khám bệnh xương khớp', 'Khám xương khớp và tư vấn điều trị', 230000, 'spec0009uuid00000000000000000009', 'cli0005uuid00000000000000000005', 'hosp0005uuid00000000000000000005', 'https://i.pinimg.com/736x/fe/a6/ab/fea6abcca2bee97515b108313db5ef0a.jpg'),
('ms0025uuid00000000000000000025', 'Khám vú', 'Khám và tư vấn vú', 200000, 'spec0008uuid00000000000000000008', 'cli0006uuid00000000000000000006', 'hosp0006uuid00000000000000000006', 'https://i.pinimg.com/736x/fe/a6/ab/fea6abcca2bee97515b108313db5ef0a.jpg'),
('ms0026uuid00000000000000000026', 'Khám tiêu hóa', 'Khám và tư vấn tiêu hóa', 210000, 'spec0007uuid00000000000000000007', 'cli0007uuid00000000000000000007', 'hosp0007uuid00000000000000000007', 'https://i.pinimg.com/736x/fe/a6/ab/fea6abcca2bee97515b108313db5ef0a.jpg'),

('ms0027uuid00000000000000000027', 'Khám thận', 'Khám thận và tư vấn', 250000, 'spec0008uuid00000000000000000008', 'cli0008uuid00000000000000000008', 'hosp0008uuid00000000000000000008', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0028uuid00000000000000000028', 'Khám thai', 'Khám thai kỳ', 270000, 'spec0006uuid00000000000000000006', 'cli0009uuid00000000000000000009', 'hosp0009uuid00000000000000000009', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0029uuid00000000000000000029', 'Khám sức khỏe công ty', 'Khám sức khỏe cho doanh nghiệp', 220000, 'spec0001uuid00000000000000000001', 'cli0010uuid00000000000000000010', 'hosp0010uuid00000000000000000010', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0030uuid00000000000000000030', 'Khám sức khỏe nữ', 'Khám sức khỏe cho phụ nữ', 280000, 'spec0006uuid00000000000000000006', 'cli0001uuid00000000000000000001', 'hosp0001uuid00000000000000000001', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0031uuid00000000000000000031', 'Khám bệnh tâm lý', 'Khám và tư vấn tâm lý', 300000, 'spec0004uuid00000000000000000004', 'cli0002uuid00000000000000000002', 'hosp0002uuid00000000000000000002', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0032uuid00000000000000000032', 'Khám tiêu hóa', 'Khám và tư vấn bệnh tiêu hóa', 250000, 'spec0007uuid00000000000000000007', 'cli0003uuid00000000000000000003', 'hosp0003uuid00000000000000000003', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0033uuid00000000000000000033', 'Khám bệnh về xương khớp', 'Khám và tư vấn điều trị xương khớp', 230000, 'spec0009uuid00000000000000000009', 'cli0004uuid00000000000000000004', 'hosp0004uuid00000000000000000004', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0034uuid00000000000000000034', 'Khám thần kinh', 'Khám và điều trị thần kinh', 250000, 'spec0004uuid00000000000000000004', 'cli0005uuid00000000000000000005', 'hosp0005uuid00000000000000000005', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0035uuid00000000000000000035', 'Khám bệnh viêm khớp', 'Khám và điều trị viêm khớp', 270000, 'spec0009uuid00000000000000000009', 'cli0006uuid00000000000000000006', 'hosp0006uuid00000000000000000006', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0036uuid00000000000000000036', 'Khám mắt', 'Khám và tư vấn các bệnh về mắt', 200000, 'spec0002uuid00000000000000000002', 'cli0007uuid00000000000000000007', 'hosp0007uuid00000000000000000007', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0037uuid00000000000000000037', 'Khám thận', 'Khám và tư vấn các bệnh thận', 250000, 'spec0008uuid00000000000000000008', 'cli0008uuid00000000000000000008', 'hosp0008uuid00000000000000000008', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0038uuid00000000000000000038', 'Khám sức khỏe cho người cao tuổi', 'Khám sức khỏe cho người cao tuổi', 280000, 'spec0006uuid00000000000000000006', 'cli0009uuid00000000000000000009', 'hosp0009uuid00000000000000000009', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0039uuid00000000000000000039', 'Khám sức khỏe định kỳ', 'Khám sức khỏe định kỳ cho cá nhân', 220000, 'spec0001uuid00000000000000000001', 'cli0010uuid00000000000000000010', 'hosp0010uuid00000000000000000010', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0040uuid00000000000000000040', 'Khám hô hấp', 'Khám và tư vấn các bệnh về hô hấp', 230000, 'spec0002uuid00000000000000000002', 'cli0001uuid00000000000000000001', 'hosp0001uuid00000000000000000001', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0041uuid00000000000000000041', 'Khám phụ khoa', 'Khám và tư vấn phụ khoa', 300000, 'spec0006uuid00000000000000000006', 'cli0002uuid00000000000000000002', 'hosp0002uuid00000000000000000002', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0042uuid00000000000000000042', 'Khám phổi', 'Khám và điều trị các bệnh về phổi', 240000, 'spec0008uuid00000000000000000008', 'cli0003uuid00000000000000000003', 'hosp0003uuid00000000000000000003', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0043uuid00000000000000000043', 'Khám tiêu hóa', 'Khám và tư vấn các bệnh tiêu hóa', 250000, 'spec0007uuid00000000000000000007', 'cli0004uuid00000000000000000004', 'hosp0004uuid00000000000000000004', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0044uuid00000000000000000044', 'Khám da liễu', 'Khám và điều trị các bệnh về da', 220000, 'spec0003uuid00000000000000000003', 'cli0005uuid00000000000000000005', 'hosp0005uuid00000000000000000005', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0045uuid00000000000000000045', 'Khám cơ xương khớp', 'Khám và điều trị các vấn đề cơ xương khớp', 280000, 'spec0009uuid00000000000000000009', 'cli0006uuid00000000000000000006', 'hosp0006uuid00000000000000000006', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0046uuid00000000000000000046', 'Khám hô hấp', 'Khám và tư vấn bệnh hô hấp', 240000, 'spec0008uuid00000000000000000008', 'cli0007uuid00000000000000000007', 'hosp0007uuid00000000000000000007', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0047uuid00000000000000000047', 'Khám thần kinh', 'Khám và điều trị thần kinh', 220000, 'spec0004uuid00000000000000000004', 'cli0008uuid00000000000000000008', 'hosp0008uuid00000000000000000008', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0048uuid00000000000000000048', 'Khám tiểu đường', 'Khám và tư vấn tiểu đường', 250000, 'spec0009uuid00000000000000000009', 'cli0009uuid00000000000000000009', 'hosp0009uuid00000000000000000009', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0049uuid00000000000000000049', 'Khám viêm gan', 'Khám và điều trị viêm gan', 300000, 'spec0008uuid00000000000000000008', 'cli0010uuid00000000000000000010', 'hosp0010uuid00000000000000000010', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg'),
('ms0050uuid00000000000000000050', 'Khám sức khỏe tổng quát', 'Khám sức khỏe toàn diện', 280000, 'spec0001uuid00000000000000000001', 'cli0001uuid00000000000000000001', 'hosp0001uuid00000000000000000001', 'https://tamkytourism.com/wp-content/uploads/2025/02/hinh-anh-anime-nu-quyen-ru-22.jpg');

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

-- Thêm các cuộc hẹn
INSERT INTO appointments (
  uuid, doctor_id, patient_id, clinic_id, hospital_id, schedule_id, vaccination_center_id, medical_service_id, date, status, health_status, user_id
) VALUES
('app0021uuid00000000000000000001', 'doc0002uuid00000000000000000002', 'pat0001uuid00000000000000000001', 'cli0001uuid00000000000000000001', NULL, 'sch0021uuid020101', NULL, NULL, '2025-07-02 08:30:00', 1, 'Ho, đau họng', 'user0008uuid00000000000000000008'),
('app0022uuid00000000000000000002', 'doc0002uuid00000000000000000002', 'pat0002uuid00000000000000000002', 'cli0001uuid00000000000000000001', NULL, 'sch0022uuid020102', NULL, NULL, '2025-07-02 13:30:00', 1, 'Đau đầu, chóng mặt', 'user0009uuid00000000000000000009'),
('app0023uuid00000000000000000003', 'doc0003uuid00000000000000000003', 'pat0002uuid00000000000000000002', 'cli0002uuid00000000000000000002', NULL, 'sch0041uuid030101', NULL, NULL, '2025-07-02 08:30:00', 1, 'Nổi mề đay, dị ứng', 'user0010uuid00000000000000000010'),
('app0024uuid00000000000000000004', 'doc0004uuid00000000000000000004', 'pat0003uuid00000000000000000003', 'cli0003uuid00000000000000000003', NULL, 'sch0061uuid040101', NULL, NULL, '2025-07-02 08:30:00', 1, 'Mệt mỏi, chán ăn', 'user0010uuid00000000000000000010'),
('app0025uuid00000000000000000005', 'doc0005uuid00000000000000000005', 'pat0004uuid00000000000000000004', 'cli0004uuid00000000000000000004', NULL, 'sch0081uuid050101', NULL, NULL, '2025-07-02 08:30:00', 1, 'Đau bụng, đầy hơi', 'user0010uuid00000000000000000010'),
('app0026uuid00000000000000000006', 'doc0006uuid00000000000000000006', 'pat0005uuid00000000000000000005', 'cli0005uuid00000000000000000005', NULL, 'sch0101uuid060101', NULL, NULL, '2025-07-02 08:30:00', 1, 'Chóng mặt, buồn nôn', 'user0010uuid00000000000000000010'),
('app0027uuid00000000000000000007', 'doc0007uuid00000000000000000007', 'pat0006uuid00000000000000000006', 'cli0006uuid00000000000000000006', NULL, 'sch0121uuid070101', NULL, NULL, '2025-07-02 08:30:00', 1, 'Sốt, đau nhức cơ thể', 'user0010uuid00000000000000000010'),
('app0028uuid00000000000000000008', 'doc0008uuid00000000000000000008', 'pat0007uuid00000000000000000007', 'cli0007uuid00000000000000000007', NULL, 'sch0131uuid080101', NULL, NULL, '2025-07-02 08:30:00', 1, 'Khó thở, ho khan', 'user0010uuid00000000000000000010'),
('app0029uuid00000000000000000009', 'doc0009uuid00000000000000000009', 'pat0008uuid00000000000000000008', 'cli0008uuid00000000000000000008', NULL, 'sch0141uuid090101', NULL, NULL, '2025-07-02 08:30:00', 1, 'Đau ngực, mệt mỏi', 'user0010uuid00000000000000000010'),
('app0030uuid00000000000000000010', 'doc0010uuid00000000000000000010', 'pat0009uuid00000000000000000009', 'cli0009uuid00000000000000000009', NULL, 'sch0151uuid100101', NULL, NULL, '2025-07-02 08:30:00', 1, 'Sốt, đau họng', 'user0010uuid00000000000000000010'),
('app0031uuid00000000000000000011', 'doc0002uuid00000000000000000002', 'pat0010uuid00000000000000000010', 'cli0010uuid00000000000000000010', NULL, 'sch0023uuid020103', NULL, NULL, '2025-07-03 08:30:00', 1, 'Đau đầu, nôn mửa', 'user0010uuid00000000000000000010');

CREATE TABLE `appointment_cancellations` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `appointment_uuid` CHAR(32) NOT NULL,
  `cancel_reason` VARCHAR(1000) NOT NULL,
  `cancelled_by` ENUM('patient', 'doctor', 'system') NOT NULL,  -- Ai là người hủy
  `cancelled_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(), -- Thời gian hủy
  CONSTRAINT `fk_appointment_uuid` FOREIGN KEY (`appointment_uuid`) REFERENCES `appointments` (`uuid`) ON DELETE CASCADE
);

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
('art0001uuid00000000000000000001', 'Chế độ ăn uống cho người cao tuổi', 'Chế độ ăn uống cho người cao tuổi cần phải được quan tâm đặc biệt, bởi sự thay đổi của cơ thể theo thời gian. Những thực phẩm dễ tiêu hóa, giàu dinh dưỡng và ít chất béo sẽ giúp cải thiện sức khỏe và phòng ngừa các bệnh lý tuổi già. Cùng tìm hiểu những chế độ ăn phù hợp để giữ gìn sức khỏe cho người cao tuổi.', 'https://live.staticflickr.com/65535/51257673845_277102a21b_b.jpg', 'BS Nguyễn Quang H'),
('art0002uuid00000000000000000002', 'Phòng ngừa bệnh tim mạch', 'Bệnh tim mạch là một trong những nguyên nhân hàng đầu gây tử vong. Việc phòng ngừa bệnh tim cần được chú trọng ngay từ khi còn trẻ bằng cách duy trì một chế độ ăn uống hợp lý, tránh thói quen hút thuốc và tập thể dục đều đặn.', 'https://live.staticflickr.com/65535/51257673845_277102a21b_b.jpg', 'BS Trần Thị Bích'),
('art0003uuid00000000000000000003', 'Bảo vệ mắt trong mùa hè', 'Với sự gia tăng ánh nắng mặt trời, việc bảo vệ đôi mắt trong mùa hè là cực kỳ quan trọng. Hãy luôn mang kính mát để bảo vệ mắt khỏi tác hại của tia UV và hạn chế các bệnh về mắt như đục thủy tinh thể hay thoái hóa điểm vàng.', 'https://live.staticflickr.com/65535/51257673845_277102a21b_b.jpg', 'BS Lê Văn C'),
('art0004uuid00000000000000000004', 'Giảm căng thẳng và lo âu', 'Căng thẳng và lo âu là một vấn đề phổ biến trong cuộc sống hiện đại. Việc tập luyện thể dục, thiền, ngủ đủ giấc và xây dựng một môi trường làm việc và sống lành mạnh sẽ giúp bạn giảm căng thẳng và cải thiện tâm lý.', 'https://live.staticflickr.com/65535/51257673845_277102a21b_b.jpg', 'BS Nguyễn Minh D'),
('art0005uuid00000000000000000005', 'Tăng cường miễn dịch mùa dịch', 'Khi dịch bệnh đang diễn biến phức tạp, việc tăng cường hệ miễn dịch là điều cực kỳ quan trọng. Thực phẩm giàu vitamin C, D, E và các khoáng chất như kẽm sẽ giúp cơ thể chống lại các tác nhân gây bệnh hiệu quả. Cùng tìm hiểu những thực phẩm giúp tăng cường miễn dịch mùa dịch.', 'https://live.staticflickr.com/65535/51257673845_277102a21b_b.jpg', 'BS Phạm Thị E'),
('art0006uuid00000000000000000006', 'Phòng chống ung thư vú', 'Ung thư vú là một trong những bệnh ung thư phổ biến nhất ở phụ nữ. Việc tầm soát ung thư vú định kỳ và duy trì lối sống lành mạnh sẽ giúp phát hiện bệnh sớm và nâng cao khả năng điều trị thành công.', 'https://live.staticflickr.com/65535/51257673845_277102a21b_b.jpg', 'BS Nguyễn Thị F'),
('art0007uuid00000000000000000007', 'Chăm sóc sức khỏe tâm thần', 'Sức khỏe tâm thần cũng quan trọng không kém sức khỏe thể chất. Việc duy trì tinh thần lạc quan, hạn chế căng thẳng và tìm sự giúp đỡ từ chuyên gia khi cần thiết sẽ giúp bạn sống vui vẻ và khỏe mạnh hơn.', 'https://live.staticflickr.com/65535/51257673845_277102a21b_b.jpg', 'BS Trương Văn G'),
('art0008uuid00000000000000000008', 'Khám sức khỏe định kỳ', 'Khám sức khỏe định kỳ giúp phát hiện sớm các bệnh lý tiềm ẩn và duy trì trạng thái sức khỏe ổn định. Việc đi khám định kỳ mỗi năm sẽ giúp bạn theo dõi tình trạng sức khỏe và có những biện pháp điều trị kịp thời.', 'https://live.staticflickr.com/65535/51257673845_277102a21b_b.jpg', 'BS Nguyễn Quang H'),
('art0009uuid00000000000000000009', 'Dinh dưỡng cho người bệnh tiểu đường', 'Dinh dưỡng đúng cách đóng vai trò quan trọng trong việc kiểm soát bệnh tiểu đường. Chế độ ăn uống khoa học sẽ giúp kiểm soát đường huyết, phòng ngừa các biến chứng và cải thiện chất lượng sống của bệnh nhân.', 'https://live.staticflickr.com/65535/51257673845_277102a21b_b.jpg', 'BS Trần Thị Bích'),
('art0010uuid00000000000000000010', 'Chăm sóc sức khỏe bà bầu', 'Chăm sóc sức khỏe bà bầu trong suốt thai kỳ là rất quan trọng để đảm bảo sức khỏe cho mẹ và bé. Hãy duy trì chế độ dinh dưỡng hợp lý, tập thể dục nhẹ nhàng và khám thai định kỳ để đảm bảo thai kỳ khỏe mạnh.', 'https://live.staticflickr.com/65535/51257673845_277102a21b_b.jpg', 'BS Nguyễn Minh D'),
('art0011uuid00000000000000000011', 'Kiểm soát huyết áp', 'Kiểm soát huyết áp là một phần quan trọng trong việc phòng ngừa các bệnh lý tim mạch và đột quỵ. Việc theo dõi huyết áp định kỳ và thay đổi chế độ ăn uống hợp lý sẽ giúp bạn kiểm soát huyết áp và duy trì sức khỏe tim mạch tốt.', 'https://live.staticflickr.com/65535/51257673845_277102a21b_b.jpg', 'BS Phạm Thị E'),
('art0012uuid00000000000000000012', 'Chế độ ăn cho người giảm cân', 'Một chế độ ăn phù hợp sẽ giúp bạn giảm cân hiệu quả mà không ảnh hưởng đến sức khỏe. Hãy cùng tìm hiểu các thực phẩm nên và không nên ăn khi muốn giảm cân, để có một vóc dáng khỏe mạnh và thon gọn.', 'https://live.staticflickr.com/65535/51257673845_277102a21b_b.jpg', 'BS Nguyễn Thị F'),
('art0013uuid00000000000000000013', 'Bảo vệ sức khỏe trong mùa lạnh', 'Mùa lạnh có thể khiến cơ thể dễ bị cảm lạnh và các bệnh hô hấp. Hãy chăm sóc sức khỏe bằng cách giữ ấm cơ thể, bổ sung vitamin C, và tăng cường hệ miễn dịch để tránh bị bệnh vào mùa đông.', 'https://live.staticflickr.com/65535/51257673845_277102a21b_b.jpg', 'BS Trương Văn G'),
('art0024uuid00000000000000000014', 'Thực phẩm tốt cho não bộ', 'Thực phẩm có thể ảnh hưởng trực tiếp đến chức năng của não bộ. Những thực phẩm giàu omega-3, vitamin B và chất chống oxy hóa giúp cải thiện trí nhớ và sức khỏe tâm thần. Hãy bổ sung những thực phẩm này vào chế độ ăn để giữ cho não bộ luôn khỏe mạnh.', 'https://live.staticflickr.com/65535/51257673845_277102a21b_b.jpg', 'BS Nguyễn Quang H'),
('art0025uuid00000000000000000015', 'Phòng tránh các bệnh về mắt', 'Bệnh về mắt có thể gây ảnh hưởng nghiêm trọng đến chất lượng cuộc sống. Việc bảo vệ mắt khỏi ánh sáng xanh, đeo kính mát khi ra ngoài và khám mắt định kỳ sẽ giúp bạn bảo vệ thị lực của mình tốt hơn.', 'https://live.staticflickr.com/65535/51257673845_277102a21b_b.jpg', 'BS Trần Thị Bích');
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
('rev0001uuid00000000000000000001', 'user0028uuid00000000000000000028', 'doc0002uuid00000000000000000002', 'app0021uuid00000000000000000001', 5, 'Bác sĩ rất có tâm, khám tận tình và chu đáo.'),
('rev0002uuid00000000000000000002', 'user0028uuid00000000000000000028', 'doc0003uuid00000000000000000003', 'app0022uuid00000000000000000002', 4, 'Khám khá kỹ nhưng thời gian chờ đợi dài.'),
('rev0003uuid00000000000000000003', 'user0029uuid00000000000000000029', 'doc0004uuid00000000000000000004', 'app0023uuid00000000000000000003', 5, 'Khám bệnh nhanh chóng, bác sĩ tận tình, không gian thoải mái.'),
('rev0004uuid00000000000000000004', 'user0030uuid00000000000000000030', 'doc0005uuid00000000000000000005', 'app0024uuid00000000000000000004', 4, 'Khám kỹ càng nhưng cần cải thiện thời gian chờ đợi.'),
('rev0005uuid00000000000000000005', 'user0031uuid00000000000000000031', 'doc0006uuid00000000000000000006', 'app0025uuid00000000000000000005', 5, 'Dịch vụ khám rất tuyệt vời, bác sĩ thân thiện và nhiệt tình.'),
('rev0006uuid00000000000000000006', 'user0031uuid00000000000000000031', 'doc0007uuid00000000000000000007', 'app0026uuid00000000000000000006', 4, 'Bác sĩ khám nhanh nhưng cần cải thiện không gian phòng khám.'),
('rev0007uuid00000000000000000007', 'user0032uuid00000000000000000032', 'doc0008uuid00000000000000000008', 'app0027uuid00000000000000000007', 5, 'Khám bệnh rất kỹ, bác sĩ giải thích rất chi tiết và tận tình.'),
('rev0008uuid00000000000000000008', 'user0033uuid00000000000000000033', 'doc0009uuid00000000000000000009', 'app0028uuid00000000000000000008', 4, 'Dịch vụ tốt, bác sĩ khám cẩn thận nhưng thời gian hơi lâu.'),
('rev0009uuid00000000000000000009', 'user0034uuid00000000000000000034', 'doc0010uuid00000000000000000010', 'app0029uuid00000000000000000009', 5, 'Dịch vụ khám rất tuyệt vời, bác sĩ nhiệt tình và rất có chuyên môn.'),
('rev0010uuid00000000000000000010', 'user0035uuid00000000000000000035', 'doc0011uuid00000000000000000011', 'app0030uuid00000000000000000010', 4, 'Khám tốt nhưng cần cải thiện thời gian chờ đợi.'),
('rev0011uuid00000000000000000011', 'user0036uuid00000000000000000036', 'doc0012uuid00000000000000000012', 'app0031uuid00000000000000000011', 5, 'Khám bệnh nhanh chóng, bác sĩ giải thích chi tiết, dịch vụ tốt.');

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


INSERT INTO payments (uuid, user_id, appointment_id, amount, payment_method, status, payment_time, created_at, updated_at) VALUES
('pay0006uuid00000000000000000006', 'user0028uuid00000000000000000028', 'app0026uuid00000000000000000006', 270000, 'cash', 2, '2025-06-19 15:30:00', NOW(), NOW()), -- success
('pay0007uuid00000000000000000007', 'user0029uuid00000000000000000029', 'app0027uuid00000000000000000007', 450000, 'online', 1, NULL, NOW(), NOW()), -- pending
('pay0008uuid00000000000000000008', 'user0030uuid00000000000000000030', 'app0028uuid00000000000000000008', 600000, 'cash', 3, '2025-06-20 12:45:00', NOW(), NOW()), -- failed
('pay0009uuid00000000000000000009', 'user0031uuid00000000000000000031', 'app0029uuid00000000000000000009', 550000, 'online', 2, '2025-06-21 10:10:00', NOW(), NOW()), -- success
('pay0010uuid00000000000000000010', 'user0032uuid00000000000000000032', 'app0030uuid00000000000000000010', 300000, 'cash', 1, NULL, NOW(), NOW()), -- pending
('pay0011uuid00000000000000000011', 'user0033uuid00000000000000000033', 'app0031uuid00000000000000000011', 250000, 'online', 2, '2025-06-22 13:20:00', NOW(), NOW());



CREATE TABLE `notifications` (
  `uuid` char(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) DEFAULT 1,
  `user_id` char(32) DEFAULT NULL,
  `appointment_id` char(32) DEFAULT NULL,
  `doctor_id` char(32) DEFAULT NULL,
  `payment_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (`payment_id`) REFERENCES `payments` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
