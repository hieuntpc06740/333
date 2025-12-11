CREATE DATABASE QLDVTHUEXE
USE QLDVTHUEXE
GO 

CREATE TABLE XE(
 MAXE NVARCHAR(10) PRIMARY KEY,
 TENXE NVARCHAR(200) NOT NULL UNIQUE,
 LOAIXE NVARCHAR(50) NOT NULL,
 HANGSX NVARCHAR(50) ,
 GIA MONEY NOT NULL,
 SOLUONG INT NOT NULL,
 NGAYNHAP DATE 
)
GO 
CREATE TABLE KHACHHANG(
MA_KH NVARCHAR(5) PRIMARY KEY,
TEN_KH NVARCHAR(100) NOT NULL,
SDT NVARCHAR(12) , 
)
GO 
CREATE TABLE HOADON(
MaHoaDon NVARCHAR(5) PRIMARY KEY ,
MA_KH NVARCHAR(5) REFERENCES KHACHHANG(MA_KH) ,
TONGTIEN MONEY ,
NGAY DATE 
)
GO 
CREATE TABLE HOADONCHITIET(
ID INT PRIMARY KEY,
MAXE NVARCHAR(10) REFERENCES XE(MAXE) ,
SOLUONG INT ,
GIA MONEY ,
HD_MA NVARCHAR(5) REFERENCES HOADON(MaHoaDon) 
)

-- nhập liệu CSDL 
GO
INSERT INTO Xe VALUES 
('Maxe101',N'Mercedes C-Class',N'Xe 4 chỗ ','Mercedes',1599000000,3,'2023-08-02'),
('Maxe102',N'Mercedes E-Class',N'Xe 4 chỗ','Mercedes',,7,'2022-03-02'),
('Maxe103',N'Pin sạc dự phòng Energizer (20000mAh)',N'Sạc dự phòng','Energizer',799000,11,'2022-08-01'),
('Maxe104',N'Pin sạc dự phòng Energizer (10000mAh)',N'Sạc dự phòng','Energizer',359000,5,'2022-08-01'),
('Maxe105',N'Pin sạc dự phòng Xiaomi (20000mAh)',N'Sạc dự phòng','Xiaomi',499000,14,'2022-08-01'),
('Maxe106',N'Pin sạc dự phòng Xiaomi (10000mAh)',N'Sạc dự phòng','Xiaomi',259000,9,'2022-08-01'),
('Maxe107',N'Ốp lưng Samsung S22 Plus Silicone',N'Ốp Lưng','Samsung',99000,20,'2022-09-01'),
('Maxe108',N'Ốp lưng Xiaomi 13 Silicone',N'Ốp lưng','Xiaomi',259000,20,'2022-09-01'),
('Maxe109',N'Ốp lưng iPhone 14 Pro Max Apple Silicone Case With Magsafee',N'Ốp Lưng','Apple',999000,15,'2022-09-01'),
('Maxe110',N'Ốp lưng iPhone 13 Pro Apple Silicone Case With Magsafe',N'Ốp lưng','Apple',859000,7,'2022-09-01'),
('Maxe111',N'Tai nghe Bluetooth Apple AirPods 3 2022',N'Tai nghe','Apple',4599000,3,'2022-11-01'),
('Maxe112',N'Tai nghe Bluetooth Apple AirPods 3 Magsafe',N'Tai nghe','Apple',4759000,13,'2022-11-01'),
('Maxe113',N'Tai nghe Bluetooth Apple AirPods 2',N'Tai nghe','Apple',599000,14,'2022-11-01'),
('Maxe114',N'Tai nghe không dây Samsung Galaxy Buds2',N'Tai Nghe','Samsung',1450000,20,'2022-11-01'),
('Maxe115',N'Tay cầm chống rung Zhiyun Q3',N'Gimbal','Zhiyun',1699000,10,'2023-01-10'),
('Maxe116',N'Tay cầm Gimbal DJI OM 6',N'Gimbal','DJI',3330000,8,'2023-01-10'),
('Maxe117',N'Tay cầm Gimbal DJI OM 5',N'Gimbal','DJI',2999000,4,'2023-01-10'),
('Maxe118',N'Tay cầm chống rung Zhiyun Q4',N'Gimbal','Zhiyun',2790000,5,'2023-01-10'),
('Maxe119',N'Quạt tản nhiệt điện thoại Asus Rog Phone 6 cooler',N'Tản Nhiệt Điện Thoại','Asus',245000,5,'2022-03-01'),
('Maxe120',N'Quạt tản nhiệt điện thoại MEMO DL05/FL05/G6',N'Tản Nhiệt Điện Thoại','MEMO',279000,8,'2022-03-01'),
('Maxe121',N'Giá đỡ điện thoại eSaver JHD-171',N'Giá Đỡ','eSaver',50000,22,'2023-05-01'),
('Maxe122',N'Giá đỡ điện thoại eSaver JHD-98',N'Giá Đỡ','eSaver',45000,25,'2023-05-01');
-- THÊM 20 DÒNG DỮ LIỆU
SELECT * FROM HOADON

GO 
INSERT INTO KHACHHANG VALUES
('KH001',N'Lê Văn Sáng','0374530908',0),
('KH002',N'Nguyễn Hiếu Lễ','0394522978',4),
('KH003',N'Hồ Trung Hiếu','0373662123',2),
('KH004',N'Lê Thị Huyền','0374530011',1),
('KH005',N'Nguyễn Tuấn Duy','0123456789',0),
('KH006',N'Đoàn Thị Yến','0654782599',3),
('KH007',N'Phan Thành Công','0287563249',2),
('KH008',N'Nguyễn Thành Đạt','0857432914',1),
('KH009',N'Mai Ngọc Anh','0395277515',2),
('KH010',N'Trương Tuấn Kiệt','0826547955',0),
('KH011',N'Trần Hồ Ngọc Trâm','0854213657',0),
('KH012',N'Dương Kim Ngọc','0625814983',2),
('KH013',N'Nguyễn Thị Bảo Vy','0336985347',3),
('KH014',N'Nguyễn Quốc Anh','0394489526',1),
('KH015',N'Đoàn Thị Minh Ngọc','0374596321',2),
('KH016',N'Lê Minh Ngọc','0889756248',1),
('KH017',N'Nguyễn Trần Minh Anh','0379518120',0),
('KH018',N'Phan Bảo Đại','0302524860',2),
('KH019',N'Trương Quốc Chí','0890034820',4),
('KH020',N'Nguyễn Ánh Tuyết','0815661124',2),
('KH021',N'Tống Chí Dương','0789524003',1),
('KH022',N'Nguyễn Trung Đức','0348910025',0),
('KH023',N'Lê Kim Ánh','0338729100',5),
('KH024',N'Dương Chí Bảo','0377789901',2);

GO
INSERT INTO HOADON VALUES
('HD001','KH002',NULL,'2023-03-12'),
('HD002','KH001',NULL,'2022-10-15'),
('HD003','KH004',NULL,'2023-03-12'),
('HD004','KH009',NULL,'2023-03-15'),
('HD005','KH003',NULL,'2023-03-12'),
('HD006','KH024',NULL,'2023-03-15'),
('HD007','KH006',NULL,'2023-03-12'),
('HD008','KH007',NULL,'2023-03-15'),
('HD009','KH005',NULL,'2023-03-12'),
('HD010','KH008',NULL,'2023-03-15'),
('HD011','KH010',NULL,'2023-03-12'),
('HD012','KH017',NULL,'2023-03-15'),
('HD013','KH013',NULL,'2023-03-12'),
('HD014','KH015',NULL,'2023-03-15'),
('HD015','KH011',NULL,'2023-03-12'),
('HD016','KH018',NULL,'2023-03-15'),
('HD017','KH014',NULL,'2023-03-12'),
('HD018','KH024',NULL,'2023-03-15'),
('HD019','KH019',NULL,'2023-03-12'),
('HD020','KH012',NULL,'2023-03-15'),
('HD021','KH021',NULL,'2023-03-12'),
('HD022','KH016',NULL,'2023-03-15'),
('HD023','KH022',NULL,'2023-03-12'),
('HD024','KH023',NULL,'2023-03-15');

GO
INSERT INTO HOADONCHITIET VALUES
(1,'PK102',3,NULL,'HD001'),
(2,'PK124',1,NULL,'HD002'),
