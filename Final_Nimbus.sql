CREATE DATABASE FINAL_NIMBUS;
GO

USE FINAL_NIMBUS;
GO
CREATE TABLE [vai_tro] (
  [Id_vai_tro] INT PRIMARY KEY IDENTITY(1,1),
  [ten] NVARCHAR(100) NOT NULL,
  [mo_ta] NVARCHAR(MAX),
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE()
);
go
CREATE TABLE [nguoi_dung] (
  [Id_nguoi_dung] INT PRIMARY KEY IDENTITY(1,1),
  [ten_nguoi_dung] NVARCHAR(100) NOT NULL,
  [ma_nguoi_dung] NVARCHAR(50) NOT NULL UNIQUE,
  [Email] NVARCHAR(255) NOT NULL UNIQUE,
  [sdt_nguoi_dung] NVARCHAR(15),
  [Ngay_Sinh] DATE,
  [Dia_Chi] NVARCHAR(255),
  [Gioi_Tinh] NVARCHAR(10),
  [Mat_Khau] NVARCHAR(255) NOT NULL,
  [Anh_Dai_Dien] NVARCHAR(255),
  [Trang_thai] BIT DEFAULT 1,
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
  [id_vai_tro] INT,
  CONSTRAINT [FK_nguoi_dung_id_vai_tro]
    FOREIGN KEY ([id_vai_tro])
      REFERENCES [vai_tro]([Id_vai_tro])
);
-- Insert data for vai_tro

CREATE TABLE [voucher] (
  [Id_voucher] INT PRIMARY KEY IDENTITY(1,1),
  [ma_voucher] NVARCHAR(50) NOT NULL UNIQUE,
  [phan_tram_giam] DECIMAL(5,2),
  [so_luong] INT,
  [trang_thai] BIT DEFAULT 1,
  [mo_ta] NVARCHAR(MAX),
  [ngay_bat_dau] DATETIME,
  [ngay_ket_thuc] DATETIME,
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE()
);
go
CREATE TABLE [loai_voucher] (
  [Id_loai_voucher] INT PRIMARY KEY IDENTITY(1,1),
  [ten_loai_voucher] NVARCHAR(100) NOT NULL,
  [mo_ta] NVARCHAR(MAX),
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
  [id_voucher] INT,
  CONSTRAINT [FK_loai_voucher_id_voucher]
    FOREIGN KEY ([id_voucher])
      REFERENCES [voucher]([Id_voucher])
);
go
CREATE TABLE [danh_muc] (
  [Id_danh_muc] INT PRIMARY KEY IDENTITY(1,1),
  [ten_danh_muc] NVARCHAR(100) NOT NULL,
  [mo_ta] NVARCHAR(MAX),
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE()
);
go
CREATE TABLE [san_pham] (
  [Id_san_pham] INT PRIMARY KEY IDENTITY(1,1),
  [ten_san_pham] NVARCHAR(100) NOT NULL,
  [so_luong_ton] INT NOT NULL,
  [gia_ban] DECIMAL(18,2) NOT NULL,
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
  [mo_ta] NVARCHAR(MAX),
  [id_danh_muc] INT,
  [id_loai_voucher] INT,
  CONSTRAINT [FK_san_pham_id_loai_voucher]
    FOREIGN KEY ([id_loai_voucher])
      REFERENCES [loai_voucher]([Id_loai_voucher]),
  CONSTRAINT [FK_san_pham_id_danh_muc]
    FOREIGN KEY ([id_danh_muc])
      REFERENCES [danh_muc]([Id_danh_muc])
);
go
CREATE TABLE [danh_gia] (
  [Id_danh_gia] INT PRIMARY KEY IDENTITY(1,1),
  [id_nguoi_dung] INT,
  [id_san_pham] INT,
  [noi_dung] NVARCHAR(MAX),
  [diem] INT CHECK (diem >= 1 AND diem <= 5),
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
  CONSTRAINT [FK_danh_gia_id_nguoi_dung]
    FOREIGN KEY ([id_nguoi_dung])
      REFERENCES [nguoi_dung]([Id_nguoi_dung]),
  CONSTRAINT [FK_danh_gia_id_san_pham]
    FOREIGN KEY ([id_san_pham])
      REFERENCES [san_pham]([Id_san_pham])
);
go
CREATE TABLE [chat_lieu] (
  [Id_chat_lieu] INT PRIMARY KEY IDENTITY(1,1),
  [ten_chat_lieu] NVARCHAR(100) NOT NULL,
  [mo_ta] NVARCHAR(MAX),
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE()
);
go
CREATE TABLE [chat_lieu_chi_tiet] (
  [Id_chat_lieu_tiet] INT PRIMARY KEY IDENTITY(1,1),
  [id_chat_lieu] INT,
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
  CONSTRAINT [FK_chat_lieu_chi_tiet_id_chat_lieu]
    FOREIGN KEY ([id_chat_lieu])
      REFERENCES [chat_lieu]([Id_chat_lieu])
);
go
CREATE TABLE [kich_thuoc] (
  [Id_kich_thuoc] INT PRIMARY KEY IDENTITY(1,1),
  [ten_kich_thuoc] NVARCHAR(100) NOT NULL,
  [mo_ta] NVARCHAR(MAX),
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE()
);
go
CREATE TABLE [kich_thuoc_chi_tiet] (
  [Id_kich_thuoc_chi_tiet] INT PRIMARY KEY IDENTITY(1,1),
  [id_kich_thuoc] INT,
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
  CONSTRAINT [FK_kich_thuoc_chi_tiet_id_kich_thuoc]
    FOREIGN KEY ([id_kich_thuoc])
      REFERENCES [kich_thuoc]([Id_kich_thuoc])
);
go
CREATE TABLE [mau_sac] (
  [Id_mau_sac] INT PRIMARY KEY IDENTITY(1,1),
  [ten_mau_sac] NVARCHAR(100) NOT NULL,
  [mo_ta] NVARCHAR(MAX),
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE()
);
go
CREATE TABLE [mau_sac_chi_tiet] (
  [Id_mau_sac_chi_tiet] INT PRIMARY KEY IDENTITY(1,1),
  [id_mau_sac] INT,
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
  CONSTRAINT [FK_mau_sac_chi_tiet_id_mau_sac]
    FOREIGN KEY ([id_mau_sac])
      REFERENCES [mau_sac]([Id_mau_sac])
);
go
CREATE TABLE [gio_hang] (
  [Id_gio_hang] INT PRIMARY KEY IDENTITY(1,1),
  [id_nguoi_dung] INT,
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [trang_thai] BIT DEFAULT 1,
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE()
);
go
CREATE TABLE [gio_hang_chi_tiet] (
  [Id_gio_hang_chi_tiet] INT PRIMARY KEY IDENTITY(1,1),
  [id_gio_hang] INT,
  [so_luong] INT,
  [don_gia] DECIMAL(18,2),
  [thanh_tien] DECIMAL(18,2),
  [Trang_Thai] BIT DEFAULT 1,
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
  CONSTRAINT [FK_gio_hang_chi_tiet_id_gio_hang]
    FOREIGN KEY ([id_gio_hang])
      REFERENCES [gio_hang]([Id_gio_hang])
);
go
CREATE TABLE [san_pham_chi_tiet] (
  [Id_san_pham_chi_tiet] INT PRIMARY KEY IDENTITY(1,1),
  [so_luong] INT NOT NULL,
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
  [trang_thai] BIT DEFAULT 1,
  [mo_ta] NVARCHAR(MAX),
  [id_kich_thuoc_chi_tiet] INT,
  [id_mau_sac_chi_tiet] INT,
  [id_chat_lieu_chi_tiet] INT,
  [id_gio_hang_chi_tiet] INT,
  [id_san_pham] INT,
  CONSTRAINT [FK_san_pham_chi_tiet_id_chat_lieu_chi_tiet]
    FOREIGN KEY ([id_chat_lieu_chi_tiet])
      REFERENCES [chat_lieu_chi_tiet]([Id_chat_lieu_tiet]),
  CONSTRAINT [FK_san_pham_chi_tiet_id_kich_thuoc_chi_tiet]
    FOREIGN KEY ([id_kich_thuoc_chi_tiet])
      REFERENCES [kich_thuoc_chi_tiet]([Id_kich_thuoc_chi_tiet]),
  CONSTRAINT [FK_san_pham_chi_tiet_id_san_pham]
    FOREIGN KEY ([id_san_pham])
      REFERENCES [san_pham]([Id_san_pham]),
  CONSTRAINT [FK_san_pham_chi_tiet_id_mau_sac_chi_tiet]
    FOREIGN KEY ([id_mau_sac_chi_tiet])
      REFERENCES [mau_sac_chi_tiet]([Id_mau_sac_chi_tiet]),
  CONSTRAINT [FK_san_pham_chi_tiet_id_gio_hang_chi_tiet]
    FOREIGN KEY ([id_gio_hang_chi_tiet])
      REFERENCES [gio_hang_chi_tiet]([Id_gio_hang_chi_tiet])
);
go
CREATE TABLE [phi_van_chuyen] (
  [Id_phi_van_chuyen] INT PRIMARY KEY IDENTITY(1,1),
  [so_tien_van_chuyen] DECIMAL(18,2),
  [mo_ta] NVARCHAR(MAX),
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE()
);
go
CREATE TABLE [dia_chi_van_chuyen] (
  [Id_dia_chi_van_chuyen] INT PRIMARY KEY IDENTITY(1,1),
  [id_phi_van_chuyen] INT,
  [tinh] NVARCHAR(100),
  [huyen] NVARCHAR(100),
  [xa] NVARCHAR(100),
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
  [mo_ta] NVARCHAR(MAX),
  CONSTRAINT [FK_dia_chi_van_chuyen_id_phi_van_chuyen]
    FOREIGN KEY ([id_phi_van_chuyen])
      REFERENCES [phi_van_chuyen]([Id_phi_van_chuyen])
);
go
CREATE TABLE [pt_thanh_toan] (
  [Id_pt_thanh_toan] INT PRIMARY KEY IDENTITY(1,1),
  [ma_thanh_toan] NVARCHAR(50) NOT NULL UNIQUE,
  [ten_phuong_thuc] NVARCHAR(100) NOT NULL,
  [noi_dung_thanh_toan] NVARCHAR(MAX),
  [ngay_thanh_toan] DATETIME,
  [trang_thai_thanh_toan] BIT DEFAULT 1,
  [phi_giao_dich] DECIMAL(18,2),
  [thong_tin_them] NVARCHAR(MAX)
);
go
CREATE TABLE [pt_thanh_toan_hoa_don] (
  [Id_thanh_toan_hoa_don] INT PRIMARY KEY IDENTITY(1,1),
  [id_pt_thanh_toan] INT,
  [so_tien_thanh_toan] DECIMAL(18,2),
  [ngay_giao_dich] DATETIME,
  [ghi_chu] NVARCHAR(MAX),
  [id_giao_dich_thanh_toan] NVARCHAR(50),
  CONSTRAINT [FK_pt_thanh_toan_hoa_don_id_pt_thanh_toan]
    FOREIGN KEY ([id_pt_thanh_toan])
      REFERENCES [pt_thanh_toan]([Id_pt_thanh_toan])
);
go
CREATE TABLE [trang_thai_hoa_don] (
  [Id_trang_thai_hoa_don] INT PRIMARY KEY IDENTITY(1,1),
  [ten_trang_thai] NVARCHAR(100) NOT NULL,
  [mo_ta] NVARCHAR(MAX),
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE()
);
go
CREATE TABLE [hoa_don] (
  [Id_hoa_don] INT PRIMARY KEY IDENTITY(1,1),
  [ma_hoa_don] NVARCHAR(50) NOT NULL UNIQUE,
  [id_nguoi_dung] INT,
  [id_loai_voucher] INT,
  [Id_dia_chi_van_chuyen] INT,
  [id_trang_thai_hoa_don] INT,
  [ten_nguoi_nhan] NVARCHAR(100) NOT NULL,
  [phi_ship] DECIMAL(18,2),
  [dia_chi] NVARCHAR(255) NOT NULL,
  [sdt_nguoi_nhan] NVARCHAR(15),
  [thanh_tien] DECIMAL(18,2),
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [mo_ta] NVARCHAR(MAX),
  [trang_thai] BIT DEFAULT 1,
  [ngay_thanh_toan] DATETIME,
  [id_pt_thanh_toan_hoa_don] INT,
  CONSTRAINT [FK_hoa_don_id_nguoi_dung]
    FOREIGN KEY ([id_nguoi_dung])
      REFERENCES [nguoi_dung]([Id_nguoi_dung]),
  CONSTRAINT [FK_hoa_don_Id_dia_chi_van_chuyen]
    FOREIGN KEY ([Id_dia_chi_van_chuyen])
      REFERENCES [dia_chi_van_chuyen]([Id_dia_chi_van_chuyen]),
  CONSTRAINT [FK_hoa_don_id_pt_thanh_toan_hoa_don]
    FOREIGN KEY ([id_pt_thanh_toan_hoa_don])
      REFERENCES [pt_thanh_toan_hoa_don]([Id_thanh_toan_hoa_don]),
  CONSTRAINT [FK_hoa_don_id_trang_thai_hoa_don]
    FOREIGN KEY ([id_trang_thai_hoa_don])
      REFERENCES [trang_thai_hoa_don]([Id_trang_thai_hoa_don]),
  CONSTRAINT [FK_hoa_don_id_loai_voucher]
    FOREIGN KEY ([id_loai_voucher])
      REFERENCES [loai_voucher]([Id_loai_voucher])
);
go
CREATE TABLE [hoa_don_chi_tiet] (
  [Id_hoa_don_chi_tiet] INT PRIMARY KEY IDENTITY(1,1),
  [id_san_pham_chi_tiet] INT,
  [id_hoa_don] INT,
  [so_luong] INT NOT NULL,
  [tong_tien] DECIMAL(18,2),
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
  [trang_thai] BIT DEFAULT 1,
  [mo_ta] NVARCHAR(MAX),
  CONSTRAINT [FK_hoa_don_chi_tiet_id_hoa_don]
    FOREIGN KEY ([id_hoa_don])
      REFERENCES [hoa_don]([Id_hoa_don]),
  CONSTRAINT [FK_hoa_don_chi_tiet_id_san_pham_chi_tiet]
    FOREIGN KEY ([id_san_pham_chi_tiet])
      REFERENCES [san_pham_chi_tiet]([Id_san_pham_chi_tiet])
);
go
CREATE TABLE [hinh_anh_san_pham] (
  [Id_hinh_anh_san_pham] INT PRIMARY KEY IDENTITY(1,1),
  [id_san_pham] INT,
  [url_anh] NVARCHAR(255) NOT NULL,
  [mo_ta] NVARCHAR(MAX),
  [trang_thai] BIT DEFAULT 1,
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
  CONSTRAINT [FK_hinh_anh_san_pham_id_san_pham]
    FOREIGN KEY ([id_san_pham])
      REFERENCES [san_pham]([Id_san_pham])
);
go
CREATE TABLE [xac_thuc] (
  [Id_xac_thuc] INT PRIMARY KEY IDENTITY(1,1),
  [ma_xac_thuc] NVARCHAR(50) NOT NULL UNIQUE,
  [id_nguoi_dung] INT,
  [mo_ta] NVARCHAR(MAX),
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
  CONSTRAINT [FK_xac_thuc_id_nguoi_dung]
    FOREIGN KEY ([id_nguoi_dung])
      REFERENCES [nguoi_dung]([Id_nguoi_dung])
);
go
CREATE TABLE [lich_su_hoa_don] (
  [Id_lich_su_hoa_don] INT PRIMARY KEY IDENTITY(1,1),
  [so_tien_thanh_toan] DECIMAL(18,2),
  [ngay_giao_dich] DATETIME,
  [id_hoa_don_chi_tiet] INT,
  [id_nguoi_dung] INT,
  CONSTRAINT [FK_lich_su_hoa_don_id_nguoi_dung]
    FOREIGN KEY ([id_nguoi_dung])
      REFERENCES [nguoi_dung]([Id_nguoi_dung]),
  CONSTRAINT [FK_lich_su_hoa_don_id_hoa_don_chi_tiet]
    FOREIGN KEY ([id_hoa_don_chi_tiet])
      REFERENCES [hoa_don_chi_tiet]([Id_hoa_don_chi_tiet])
);
go


INSERT INTO vai_tro (ten, mo_ta) VALUES 
(N'Quản trị viên', N'Người quản lý toàn bộ hệ thống'),
(N'Khách hàng', N'Người mua hàng trên website'),
(N'Nhân viên bán hàng', N'Nhân viên hỗ trợ bán hàng'),
(N'Nhân viên giao hàng', N'Người giao hàng đến tay khách hàng'),
(N'Quản lý kho', N'Người quản lý tồn kho');
go
-- Insert data for nguoi_dung
INSERT INTO nguoi_dung (ten_nguoi_dung, ma_nguoi_dung, Email, sdt_nguoi_dung, Ngay_Sinh, Dia_Chi, Gioi_Tinh, Mat_Khau) VALUES 
(N'Phạm Thùy Dương', 'user001', 'duongpt@gmail.com', '0918829273', '2004-01-02', N'Hà Nội', N'Nữ', '123456'),
(N'Lê Khả Hoàng', 'user002', 'hoanglk@gmail.com', '0912353678', '2004-01-03', N'Hà Nội', N'Nam', '123456'),
(N'Nguyễn Trung Hiếu', 'user003', 'hieunt@gmail.com', '0916789535', '2004-01-04', N'Hà Nội', 'Nam', '123456'),
(N'Lê Đình Linh', 'user004', 'linhld@gmail.com', '0912679346', '2004-01-05', N'Hà Nội', N'Nam', '123456'),
(N'Hoàng Văn Hà', 'user005', 'hahv@gmail.com', '0918934754', '2004-01-06', N'Hà Nội', N'Nam', '123456');
go
-- Insert data for voucher
INSERT INTO voucher (ma_voucher, phan_tram_giam, so_luong, mo_ta) VALUES 
(N'VOUCHER1', 10.00, 100, N'Giảm 10% cho đơn hàng trên 500k'),
(N'VOUCHER2', 15.00, 50, N'Giảm 15% cho khách hàng mới'),
(N'VOUCHER3', 20.00, 30, N'Giảm 20% vào dịp sinh nhật'),
(N'VOUCHER4', 5.00, 200, N'Giảm 5% cho tất cả sản phẩm'),
(N'VOUCHER5', 25.00, 10, N'Giảm 25% cho đơn hàng trên 1 triệu');
go
-- Insert data for loai_voucher
INSERT INTO loai_voucher (ten_loai_voucher,mo_ta,id_voucher) VALUES 
(N'Voucher Giảm Giá 10%', N'Áp dụng cho đơn hàng trên 500k', 1),
(N'Voucher Khách Hàng Mới', N'Chỉ dành cho khách hàng mới', 2),
(N'Voucher Sinh Nhật', N'Giảm giá đặc biệt vào dịp sinh nhật',3),
(N'Voucher Toàn Sản Phẩm', N'Giảm giá cho tất cả sản phẩm',4),
(N'Voucher Đơn Hàng Lớn', N'Áp dụng cho đơn hàng trên 1 triệu',5);
go
-- Insert data for danh_muc
INSERT INTO danh_muc (ten_danh_muc, mo_ta) VALUES 
(N'Áo phông', N'Áo phông đa dạng kiểu dành cho nam nữ'),
(N'Áo sơ mi', N'Áo sơ mi đa dạng kiểu dành cho nam nữ'),
(N'Áo phao', N'Áo phao đa dạng kiểu dành cho nam nữ'),
(N'Áo chống nắng', N'Áo chống nắng dành cho nam nữ'),
(N'Quần kaki', N'Quần kaki đa dạng kiểu dành cho nam nữ'),
(N'Quần sort & jean', N'Quần sort và jean đa dạng dành cho nam nữ');
go
-- Insert data for danh_gia

-- Insert data for chat_lieu
INSERT INTO chat_lieu (ten_chat_lieu, mo_ta) VALUES 
(N'Cotton', N'Vải cotton thoáng khí, mềm mại, thích hợp cho áo phông và áo sơ mi.'),
(N'Polyester', N'Vải polyester bền, ít nhăn, thích hợp cho áo phao và áo chống nắng.'),
(N'Linen', N'Vải linen thoáng khí, thường dùng cho áo sơ mi vào mùa hè.'),
(N'Tencel', N'Vải Tencel mịn màng, thoải mái, phù hợp cho áo sơ mi.'),
(N'Nylon', N'Vải nylon nhẹ, bền, thường được dùng cho áo phao và áo chống nắng.'),
(N'Denim', N'Vải denim dày dạn, dùng cho quần kaki,sort và jean.');
go
-- Insert data for chat_lieu_chi_tiet
INSERT INTO chat_lieu_chi_tiet (id_chat_lieu) VALUES 
(1),
(2),
(3),
(4),
(5);
go
-- Insert data for kich_thuoc
INSERT INTO kich_thuoc (ten_kich_thuoc, mo_ta) VALUES 
('S', N'Kích thước nhỏ'),
('M', N'Kích thước vừa'),
('L', N'Kích thước lớn'),
('XL', N'Kích thước rất lớn'),
('XXL', N'Kích thước cực lớn');
go
-- Insert data for kich_thuoc_chi_tiet
INSERT INTO kich_thuoc_chi_tiet (id_kich_thuoc) VALUES 
(1),
(2),
(3),
(4),
(5);
go
-- Insert data for mau_sac
INSERT INTO mau_sac (ten_mau_sac, mo_ta) VALUES 
(N'Đen', N'Màu đen cổ điển, dễ phối với nhiều loại trang phục.'),
(N'Trắng', N'Màu trắng tinh khiết, phù hợp cho mọi dịp.'),
(N'Xanh dương', N'Màu xanh dương, mang đến cảm giác tươi mát và trẻ trung.'),
(N'Đỏ', N'Màu đỏ nổi bật, thể hiện sự năng động và cá tính.'),
(N'Vàng', N'Màu vàng tươi sáng, mang lại sự ấm áp và vui tươi.'),
(N'Hồng', N'Màu hồng nhẹ nhàng, phù hợp cho những ai yêu thích sự nữ tính.'),
(N'Xanh lá', N'Màu xanh lá cây, biểu trưng cho thiên nhiên và sự tươi mát.'),
(N'Nâu', N'Màu nâu ấm áp, thường được dùng trong thời trang thu đông.'),
(N'Xám', N'Màu xám trung tính, dễ dàng kết hợp với các màu khác.'),
(N'Xanh than', N'Màu xanh than, mang lại vẻ lịch lãm và sang trọng.'),
(N'Be', N'Màu be nhẹ nhàng, phù hợp cho trang phục hàng ngày.');
go
-- Insert data for mau_sac_chi_tiet
INSERT INTO mau_sac_chi_tiet (id_mau_sac) VALUES 
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11);


go
-- Insert data for gio_hang
INSERT INTO gio_hang (id_nguoi_dung) VALUES 
(1), (2), (3), (4), (5);
go

-- Insert data for gio_hang_chi_tiet
INSERT INTO gio_hang_chi_tiet (id_gio_hang, so_luong, don_gia, thanh_tien) VALUES 
(1, 1, 200000, 200000),
(2, 2, 300000, 600000),
(3, 1, 500000, 500000),
(4, 1, 100000, 100000),
(5, 1, 1500000, 1500000);

go
-- Insert data for phi_van_chuyen
INSERT INTO phi_van_chuyen (so_tien_van_chuyen, mo_ta) VALUES 
(30000, N'Phí vận chuyển cho đơn hàng nội tỉnh.'),
(50000, N'Phí vận chuyển cho đơn hàng liên tỉnh.'),
(20000, N'Phí vận chuyển cho đơn hàng dưới 1kg.'),
(10000, N'Phí vận chuyển cho đơn hàng trên 1kg.'),
(100000, N'Phí vận chuyển cho đơn hàng đặc biệt.');
go

-- Insert data for dia_chi_van_chuyen
INSERT INTO dia_chi_van_chuyen (id_phi_van_chuyen, tinh, huyen, xa, mo_ta) VALUES 
(1, N'Hà Nội', N'Hoàn Kiếm', N'Phan Chu Trinh', N'Địa chỉ giao hàng tại Hà Nội.'),
(2, N'TP. Hồ Chí Minh', N'Quận 1', N'Nguyễn Thái Bình', N'Địa chỉ giao hàng tại TP. Hồ Chí Minh.'),
(3, N'Hà Nội', N'Ba Đình', N'Trần Phú', N'Địa chỉ giao hàng cho các đơn hàng nhỏ.'),
(4, N'Đà Nẵng', N'Hải Châu', N'Hải Châu 1', N'Địa chỉ giao hàng tại Đà Nẵng.'),
(5, N'Bắc Ninh', N'Thuận Thành', N'Thị trấn Hồ', N'Địa chỉ giao hàng tại Bắc Ninh.');
go

-- Insert data for pt_thanh_toan
INSERT INTO pt_thanh_toan (ma_thanh_toan, ten_phuong_thuc, noi_dung_thanh_toan, phi_giao_dich, thong_tin_them) VALUES 
(N'TT001', N'Transfer Ngân Hàng', N'Transfer qua ngân hàng cho đơn hàng.', 0.00, N'Không có phí.'),
(N'TT002', N'Thanh Toán Qua Thẻ', N'Sử dụng thẻ tín dụng để thanh toán.', 1.50, N'Phí giao dịch thẻ tín dụng.'),
(N'TT003', N'Ví Điện Tử', N'Sử dụng ví điện tử để thanh toán.', 0.00, N'Không có phí.'),
(N'TT004', N'Thu Tiền Tận Nơi', N'Nhân viên sẽ đến thu tiền tại địa chỉ giao hàng.', 10.00, N'Phí thu tiền tận nơi.'),
(N'TT005', N'Thanh Toán Trực Tiếp', N'Khách hàng thanh toán trực tiếp tại cửa hàng.', 0.00, N'Không có phí.');
go
-- Insert data for pt_thanh_toan
INSERT INTO pt_thanh_toan_hoa_don (id_pt_thanh_toan, so_tien_thanh_toan, ghi_chu, id_giao_dich_thanh_toan) VALUES 
(1, 500.00, N'Thanh toán đơn hàng 001', N'GD001'),
(2, 750.00, N'Thanh toán đơn hàng 002', N'GD002'),
(3, 300.00, N'Thanh toán đơn hàng 003', N'GD003'),
(4, 1200.00, N'Thanh toán đơn hàng 004', N'GD004'),
(5, 150.00, N'Thanh toán đơn hàng 005', N'GD005');

go
-- Insert data for trang_thai_hoa_don
INSERT INTO trang_thai_hoa_don (ten_trang_thai, mo_ta) VALUES 
(N'Chờ Xử Lý', N'Hoa đơn đang chờ xử lý.'),
(N'Đang Giao Hàng', N'Hoa đơn đang được giao hàng.'),
(N'Hoàn Thành', N'Hoa đơn đã hoàn thành.'),
(N'Hủy Bỏ', N'Hoa đơn đã bị hủy.'),
(N'Thất Bại', N'Hoa đơn không thể hoàn tất.');

go
-- Insert data for hoa_don
INSERT INTO hoa_don (ma_hoa_don, id_nguoi_dung, id_loai_voucher, Id_dia_chi_van_chuyen, id_trang_thai_hoa_don, ten_nguoi_nhan, phi_ship, dia_chi, sdt_nguoi_nhan, thanh_tien, mo_ta, id_pt_thanh_toan_hoa_don) VALUES 
('HD001', 1, 1, 1, 1, N'Trần Văn A', 30.00, N'Số 1, Đường A, Quận 1', N'0123456789', 500.00, N'Hoa đơn cho sản phẩm A', 1),
('HD002', 2, 2, 2, 1, N'Nguyễn Thị B', 20.00, N'Số 2, Đường B, Quận 2', N'0123456788', 750.00, N'Hoa đơn cho sản phẩm B', 2),
('HD003', 1, 3, 1, 1, N'Lê Văn C', 15.00, N'Số 3, Đường C, Quận 3', N'0123456787', 300.00, N'Hoa đơn cho sản phẩm C', 3),
('HD004', 3, 4, 2, 1, N'Trần Thị D', 25.00, N'Số 4, Đường D, Quận 4', N'0123456786', 1200.00, N'Hoa đơn cho sản phẩm D', 4),
('HD005', 2, 5, 1, 1, N'Nguyễn Văn E', 10.00, N'Số 5, Đường E, Quận 5', N'0123456785', 150.00, N'Hoa đơn cho sản phẩm E', 5);

go
INSERT INTO xac_thuc (ma_xac_thuc, id_nguoi_dung, mo_ta) VALUES 
(N'XAC001', 1, N'Xác thực đăng ký tài khoản'),
(N'XAC002', 2, N'Xác thực email'),
(N'XAC003', 1, N'Xác thực số điện thoại'),
(N'XAC004', 3, N'Xác thực khôi phục mật khẩu'),
(N'XAC005', 2, N'Xác thực đăng nhập');
go


-- Insert data for san_pham
INSERT INTO san_pham (ten_san_pham, so_luong_ton, gia_ban, mo_ta, id_danh_muc,id_loai_voucher) VALUES 
(N'Áo phông hình bàn tay', 100, 120000, N'Áo phông cotton mềm mại, thiết kế cổ tròn với tay ngắn', 1, 4),
(N'Áo phông butterfly', 100, 120000, N'Áo phông cotton mềm mại, thiết kế cổ tròn với tay ngắn', 1, 4),
(N'Áo phông cotton', 100, 120000, N'Áo phông cotton mềm mại, thiết kế cổ tròn với tay ngắn', 1, 4),
(N'Áo phông ENJOYABLE', 100, 120000, N'Áo phông cotton mềm mại, thiết kế cổ tròn với tay ngắn', 1, 4),
(N'Áo phông loang', 100, 120000, N'Áo phông cotton mềm mại, thiết kế cổ tròn với tay ngắn', 1, 4),
(N'Áo phông holiday 1961', 100, 120000, N'Áo phông cotton mềm mại, thiết kế cổ tròn với tay ngắn', 1, 4),
(N'Áo phông nam nữ 1984', 100, 120000, N'Áo phông cotton mềm mại, thiết kế cổ tròn với tay ngắn', 1, 4),
(N'Áo phông nam nữ oversize', 100, 120000, N'Áo phông cotton mềm mại, thiết kế cổ tròn với tay ngắn', 1, 4),
(N'Áo phông tay lỡ', 100, 120000, N'Áo phông cotton mềm mại, thiết kế cổ tròn với tay ngắn', 1, 4),
(N'Áo phông thể thao', 100, 120000, N'Áo phông cotton mềm mại, thiết kế cổ tròn với tay ngắn', 1, 4),
(N'Áo phông SPORT FASHION', 100, 120000, N'Áo phông cotton mềm mại, thiết kế cổ tròn với tay ngắn', 1, 4),

(N'Áo sơ mi đũi nơ thắt eo', 100, 120000, N'Áo sơ mi được làm từ 100% cotton mềm mại, thoáng khí', 2, 4),
(N'Áo sơ mi nam kẻ sọc', 100, 120000, N'Áo sơ mi được làm từ 100% cotton mềm mại, thoáng khí', 2, 4),
(N'Áo sơ mi lụa công sở', 100, 120000, N'Áo sơ mi được làm từ lụa mềm mại, thoáng khí', 2, 4),
(N'Áo sơ mi nam loang', 100, 120000, N'Áo sơ mi được làm từ 100% cotton mềm mại, thoáng khí', 2, 4),
(N'Áo sơ mi ngắn siết eo', 100, 120000, N'Áo sơ mi được làm từ 100% cotton mềm mại, thoáng khí', 2, 4),
(N'Áo sơ mi tay ngắn túi hộp', 100, 120000, N'Áo sơ mi được làm từ 100% cotton mềm mại, thoáng khí', 2, 4),
(N'Áo sơ mi thắt cà vạt', 100, 120000, N'Áo sơ mi được làm theo phong cách Nhật', 2, 4),
(N'Áo sơ mi sọc đơn giản', 100, 120000, N'Áo sơ mi được làm từ 100% cotton mềm mại, thoáng khí', 2, 4),
(N'Áo sơ mi tay ngắn', 100, 120000, N'Áo sơ mi được làm từ 100% cotton mềm mại, thoáng khí', 2, 4),
(N'Áo sơ mi trơn', 100, 120000, N'Áo sơ mi được làm từ 100% cotton mềm mại, thoáng khí', 2, 4),

(N'Áo ấm lông cừu', 100, 120000, N'Áo phao dày dặn, giúp giữ ấm hiệu quả trong những ngày đông lạnh giá', 3, 4),
(N'Áo béo buộc nơ', 100, 120000, N'Áo phao dày dặn, giúp giữ ấm hiệu quả trong những ngày đông lạnh giá', 3, 4),
(N'Áo phao bông', 100, 120000, N'Áo phao dày dặn, giúp giữ ấm hiệu quả trong những ngày đông lạnh giá', 3, 4),
(N'Áo phao cài khuy', 100, 120000, N'Áo phao dày dặn, giúp giữ ấm hiệu quả trong những ngày đông lạnh giá', 3, 4),
(N'Áo phao gile', 100, 120000, N'Áo phao dày dặn, giúp giữ ấm hiệu quả trong những ngày đông lạnh giá', 3, 4),
(N'Áo phao cài khuy cổ', 100, 120000, N'Áo phao dày dặn, giúp giữ ấm hiệu quả trong những ngày đông lạnh giá', 3, 4),
(N'Áo phao cài lửng thời trang', 100, 120000, N'Áo phao dày dặn, giúp giữ ấm hiệu quả trong những ngày đông lạnh giá', 3, 4),
(N'Áo phao nhung cừu', 100, 120000, N'Áo phao dày dặn, giúp giữ ấm hiệu quả trong những ngày đông lạnh giá', 3, 4),
(N'Áo phao cài NIKE', 100, 120000, N'Áo phao dày dặn, giúp giữ ấm hiệu quả trong những ngày đông lạnh giá', 3, 4),

(N'Áo chống nắng viền tròn', 100, 120000, N'Áo chống nắng chất liệu vải thoáng mát, nhẹ nhàng và có khả năng chống tia UV', 4, 4),
(N'Áo chống nắng toàn thân', 100, 120000, N'Áo chống nắng chất liệu vải thoáng mát, nhẹ nhàng và có khả năng chống tia UV', 4, 4),
(N'Áo chống nắng thông hơi', 100, 120000, N'Áo chống nắng chất liệu vải thoáng mát, nhẹ nhàng và có khả năng chống tia UV', 4, 4),
(N'Áo chống nắng thòi trang', 100, 120000, N'Áo chống nắng chất liệu vải thoáng mát, nhẹ nhàng và có khả năng chống tia UV', 4, 4),
(N'Áo chống nắng thể thao', 100, 120000, N'Áo chống nắng chất liệu vải thoáng mát, nhẹ nhàng và có khả năng chống tia UV', 4, 4),
(N'Áo chống nắng LV', 100, 120000, N'Áo chống nắng chất liệu vải thoáng mát, nhẹ nhàng và có khả năng chống tia UV', 4, 4),
(N'Áo chống nắng dài xoe', 100, 120000, N'Áo chống nắng chất liệu vải thoáng mát, nhẹ nhàng và có khả năng chống tia UV', 4, 4),
(N'Áo chống nắng croptop', 100, 120000, N'Áo chống nắng chất liệu vải thoáng mát, nhẹ nhàng và có khả năng chống tia UV', 4, 4),
(N'Áo chống nắng cánh dơi', 100, 120000, N'Áo chống nắng chất liệu vải thoáng mát, nhẹ nhàng và có khả năng chống tia UV', 4, 4),

(N'Quần baggy kaki', 100, 120000, N'Quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 5, 4),
(N'Quần đũi dài nam', 100, 120000, N'Quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 5, 4),
(N'Quần đũi dài nữ', 100, 120000, N'Quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 5, 4),
(N'Quần ống rộng cạp cao', 100, 120000, N'Quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 5, 4),
(N'Quần ống rộng nam', 100, 120000, N'Quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 5, 4),
(N'Quần đũi rộng túi hộp', 100, 120000, N'Quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 5, 4),
(N'Quần suông đơn giản', 100, 120000, N'Quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 5, 4),
(N'Quần suông rộng', 100, 120000, N'Quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 5, 4),

(N'Quần ống rộng suông', 100, 120000, N'Quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 6, 4),
(N'Quần sort nữ cá tính', 100, 120000, N'Quần sort chất liệu kaki mềm mại, co giãn nhẹ', 6, 4),
(N'Quần sort nữ đũi', 100, 120000, N'Quần sort chất liệu đũi mềm mại, co giãn nhẹ', 6, 4),
(N'Quần đùi túi hộp đứng', 100, 120000, N'Quần dài dáng suông, chất liệu đũi mềm mại, co giãn nhẹ', 6, 4),
(N'Quần jean cạp trễ', 100, 120000, N'Quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 6, 4),
(N'Quần jean thời trang', 100, 120000, N'Quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 6, 4),
(N'Quần sort bò rộng', 100, 120000, N'Quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 6, 4),
(N'Quần sort tây nam', 100, 120000, N'Quần sort chất liệu kaki mềm mại, co giãn nhẹ', 6, 4),
(N'Quần suông dài basic', 100, 120000, N'Quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 6, 4);
go
INSERT INTO danh_gia (id_nguoi_dung, id_san_pham, noi_dung, diem) VALUES 
(1, 1, N'Sản phẩm đẹp như trên mô tả', 5),
(2, 2, N'Sản phẩm chất lượng', 4),
(3, 3, N'Sản phẩm tốt, phù hợp giá tiền', 5),
(4, 4, N'Chất vải tốt, mặc rất thoải mái', 4),
(5, 5, N'Áo chất lượng, đáng tiền', 4);
go

-- Insert data for san_pham_chi_tiet
INSERT INTO san_pham_chi_tiet (so_luong, mo_ta, id_kich_thuoc_chi_tiet, id_mau_sac_chi_tiet, id_chat_lieu_chi_tiet, id_gio_hang_chi_tiet, id_san_pham)
VALUES 
-- Áo phông hình bàn tay (M, màu trắng, cotton, giỏ hàng 1)
(100, N'Áo phông hình bàn tay, size M, màu trắng', 2, 1, 1, 1, 1),

-- Áo phông butterfly (M, màu đen, cotton, giỏ hàng 2)
(100, N'Áo phông butterfly, size M, màu đen', 2, 2, 1, 2, 2),

-- Áo phông cotton (M, màu xám, cotton, giỏ hàng 3)
(100, N'Áo phông cotton, size M, màu xám', 2, 3, 1, 3, 3),

-- Áo phông ENJOYABLE (M, màu xanh, cotton, giỏ hàng 4)
(100, N'Áo phông ENJOYABLE, size M, màu xanh', 2, 4, 1, 4, 4),

-- Áo phông loang (M, màu đỏ, cotton, giỏ hàng 5)
(100, N'Áo phông loang, size M, màu đỏ', 2, 5, 1, 5, 5),

-- Áo phông holiday 1961 (M, màu vàng, cotton, giỏ hàng 6)
(100, N'Áo phông holiday 1961, size M, màu vàng', 2, 6, 1, 3, 6),
-- Áo phông nam nữ 1984 (100 sản phẩm, màu trắng, cotton, giỏ hàng 4)
(100, N'Áo phông nam nữ 1984, 100 sản phẩm, màu trắng, cotton', 2, 1, 1, 4, 7),

-- Áo phông nam nữ oversize (100 sản phẩm, màu đen, cotton, giỏ hàng 4)
(100, N'Áo phông nam nữ oversize, 100 sản phẩm, màu đen, cotton', 2, 2, 1, 4, 8),

-- Áo phông tay lỡ (100 sản phẩm, màu xám, cotton, giỏ hàng 4)
(100, N'Áo phông tay lỡ, 100 sản phẩm, màu xám, cotton', 2, 3, 1, 4, 9),

-- Áo phông thể thao (100 sản phẩm, màu xanh, cotton, giỏ hàng 4)
(100, N'Áo phông thể thao, 100 sản phẩm, màu xanh, cotton', 2, 4, 1, 4, 10),

-- Áo phông SPORT FASHION (100 sản phẩm, màu đỏ, cotton, giỏ hàng 4)
(100, N'Áo phông SPORT FASHION, 100 sản phẩm, màu đỏ, cotton', 2, 5, 1, 4, 11),

-- Áo sơ mi đũi nơ thắt eo (100 sản phẩm, giỏ hàng 4)
(100, N'Áo sơ mi đũi nơ thắt eo, 100 sản phẩm, được làm từ 100% cotton mềm mại, thoáng khí', 2, 1, 1, 4, 12),

-- Áo sơ mi nam kẻ sọc (100 sản phẩm, giỏ hàng 4)
(100, N'Áo sơ mi nam kẻ sọc, 100 sản phẩm, được làm từ 100% cotton mềm mại, thoáng khí', 2, 2, 1, 4, 13),

-- Áo sơ mi lụa công sở (100 sản phẩm, giỏ hàng 4)
(100, N'Áo sơ mi lụa công sở, 100 sản phẩm, được làm từ lụa mềm mại, thoáng khí', 2, 3, 2, 4, 14),

-- Áo sơ mi nam loang (100 sản phẩm, giỏ hàng 4)
(100, N'Áo sơ mi nam loang, 100 sản phẩm, được làm từ 100% cotton mềm mại, thoáng khí', 2, 4, 1, 4, 15),

-- Áo sơ mi ngắn siết eo (100 sản phẩm, giỏ hàng 4)
(100, N'Áo sơ mi ngắn siết eo, 100 sản phẩm, được làm từ 100% cotton mềm mại, thoáng khí', 2, 5, 1, 4, 16),

-- Áo sơ mi tay ngắn túi hộp (100 sản phẩm, giỏ hàng 4)
(100, N'Áo sơ mi tay ngắn túi hộp, 100 sản phẩm, được làm từ 100% cotton mềm mại, thoáng khí', 2, 6, 1, 4, 17),

-- Áo sơ mi thắt cà vạt (100 sản phẩm, giỏ hàng 4)
(100, N'Áo sơ mi thắt cà vạt, 100 sản phẩm, được làm theo phong cách Nhật', 2, 7, 1, 4, 18),

-- Áo sơ mi sọc đơn giản (100 sản phẩm, giỏ hàng 4)
(100, N'Áo sơ mi sọc đơn giản, 100 sản phẩm, được làm từ 100% cotton mềm mại, thoáng khí', 2, 8, 1, 4, 19),

-- Áo sơ mi tay ngắn (100 sản phẩm, giỏ hàng 4)
(100, N'Áo sơ mi tay ngắn, 100 sản phẩm, được làm từ 100% cotton mềm mại, thoáng khí', 2, 9, 1, 4, 20),

-- Áo sơ mi trơn (100 sản phẩm, giỏ hàng 4)
(100, N'Áo sơ mi trơn, 100 sản phẩm, được làm từ 100% cotton mềm mại, thoáng khí', 2, 10, 1, 4, 21),

-- Áo ấm lông cừu (100 sản phẩm, giỏ hàng 4)
(100, N'Áo ấm lông cừu, 100 sản phẩm, áo phao dày dặn, giúp giữ ấm hiệu quả trong những ngày đông lạnh giá', 3, 1, 1, 4, 22),

-- Áo béo buộc nơ (100 sản phẩm, giỏ hàng 4)
(100, N'Áo béo buộc nơ, 100 sản phẩm, áo phao dày dặn, giúp giữ ấm hiệu quả trong những ngày đông lạnh giá', 3, 2, 1, 4, 23),

-- Áo phao bông (100 sản phẩm, giỏ hàng 4)
(100, N'Áo phao bông, 100 sản phẩm, áo phao dày dặn, giúp giữ ấm hiệu quả trong những ngày đông lạnh giá', 3, 3, 1, 4, 24),

-- Áo phao cài khuy (100 sản phẩm, giỏ hàng 4)
(100, N'Áo phao cài khuy, 100 sản phẩm, áo phao dày dặn, giúp giữ ấm hiệu quả trong những ngày đông lạnh giá', 3, 4, 1, 4, 25),

-- Áo phao gile (100 sản phẩm, giỏ hàng 4)
(100, N'Áo phao gile, 100 sản phẩm, áo phao dày dặn, giúp giữ ấm hiệu quả trong những ngày đông lạnh giá', 3, 5, 1, 4, 26),

-- Áo phao cài khuy cổ (100 sản phẩm, giỏ hàng 4)
(100, N'Áo phao cài khuy cổ, 100 sản phẩm, áo phao dày dặn, giúp giữ ấm hiệu quả trong những ngày đông lạnh giá', 3, 6, 1, 4, 27),

-- Áo phao cài lửng thời trang (100 sản phẩm, giỏ hàng 4)
(100, N'Áo phao cài lửng thời trang, 100 sản phẩm, áo phao dày dặn, giúp giữ ấm hiệu quả trong những ngày đông lạnh giá', 3, 7, 1, 4, 28),

-- Áo phao nhung cừu (100 sản phẩm, giỏ hàng 4)
(100, N'Áo phao nhung cừu, 100 sản phẩm, áo phao dày dặn, giúp giữ ấm hiệu quả trong những ngày đông lạnh giá', 3, 8, 1, 4, 29),

-- Áo phao cài NIKE (100 sản phẩm, giỏ hàng 4)
(100, N'Áo phao cài NIKE, 100 sản phẩm, áo phao dày dặn, giúp giữ ấm hiệu quả trong những ngày đông lạnh giá', 3, 9, 1, 4, 30),

-- Áo chống nắng viền tròn (100 sản phẩm, giỏ hàng 4)
(100, N'Áo chống nắng viền tròn, 100 sản phẩm, áo chống nắng chất liệu vải thoáng mát, nhẹ nhàng và có khả năng chống tia UV', 4, 1, 2, 4, 31),

-- Áo chống nắng toàn thân (100 sản phẩm, giỏ hàng 4)
(100, N'Áo chống nắng toàn thân, 100 sản phẩm, áo chống nắng chất liệu vải thoáng mát, nhẹ nhàng và có khả năng chống tia UV', 4, 2, 2, 4, 32),

-- Áo chống nắng thông hơi (100 sản phẩm, giỏ hàng 4)
(100, N'Áo chống nắng thông hơi, 100 sản phẩm, áo chống nắng chất liệu vải thoáng mát, nhẹ nhàng và có khả năng chống tia UV', 4, 3, 2, 4, 33),

-- Áo chống nắng thời trang (100 sản phẩm, giỏ hàng 4)
(100, N'Áo chống nắng thời trang, 100 sản phẩm, áo chống nắng chất liệu vải thoáng mát, nhẹ nhàng và có khả năng chống tia UV', 4, 4, 2, 4, 34),

-- Áo chống nắng thể thao (100 sản phẩm, giỏ hàng 4)
(100, N'Áo chống nắng thể thao, 100 sản phẩm, áo chống nắng chất liệu vải thoáng mát, nhẹ nhàng và có khả năng chống tia UV', 4, 5, 2, 4, 35),

-- Áo chống nắng LV (100 sản phẩm, giỏ hàng 4)
(100, N'Áo chống nắng LV, 100 sản phẩm, áo chống nắng chất liệu vải thoáng mát, nhẹ nhàng và có khả năng chống tia UV', 4, 6, 2, 4, 36),

-- Áo chống nắng dài xòe (100 sản phẩm, giỏ hàng 4)
(100, N'Áo chống nắng dài xòe, 100 sản phẩm, áo chống nắng chất liệu vải thoáng mát, nhẹ nhàng và có khả năng chống tia UV', 4, 7, 2, 4, 37),

-- Áo chống nắng croptop (100 sản phẩm, giỏ hàng 4)
(100, N'Áo chống nắng croptop, 100 sản phẩm, áo chống nắng chất liệu vải thoáng mát, nhẹ nhàng và có khả năng chống tia UV', 4, 8, 2, 4, 38),

-- Áo chống nắng cánh dơi (100 sản phẩm, giỏ hàng 4)
(100, N'Áo chống nắng cánh dơi, 100 sản phẩm, áo chống nắng chất liệu vải thoáng mát, nhẹ nhàng và có khả năng chống tia UV', 4, 9, 2, 4, 39),


-- Quần baggy kaki (100 sản phẩm, giỏ hàng 4)
(100, N'Quần baggy kaki, 100 sản phẩm, quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 5, 1, 2, 4, 40),

-- Quần đũi dài nam (100 sản phẩm, giỏ hàng 4)
(100, N'Quần đũi dài nam, 100 sản phẩm, quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 5, 2, 2, 4, 41),

-- Quần đũi dài nữ (100 sản phẩm, giỏ hàng 4)
(100, N'Quần đũi dài nữ, 100 sản phẩm, quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 5, 3, 2, 4, 42),

-- Quần ống rộng cạp cao (100 sản phẩm, giỏ hàng 4)
(100, N'Quần ống rộng cạp cao, 100 sản phẩm, quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 5, 4, 2, 4, 43),

-- Quần ống rộng nam (100 sản phẩm, giỏ hàng 4)
(100, N'Quần ống rộng nam, 100 sản phẩm, quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 5, 5, 2, 4, 44),

-- Quần đũi rộng túi hộp (100 sản phẩm, giỏ hàng 4)
(100, N'Quần đũi rộng túi hộp, 100 sản phẩm, quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 5, 6, 2, 4, 45),

-- Quần suông đơn giản (100 sản phẩm, giỏ hàng 4)
(100, N'Quần suông đơn giản, 100 sản phẩm, quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 5, 7, 2, 4, 46),

-- Quần suông rộng (100 sản phẩm, giỏ hàng 4)
(100, N'Quần suông rộng, 100 sản phẩm, quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 5, 8, 2, 4, 47),

-- Quần ống rộng suông
(100, N'Quần ống rộng suông, 100 sản phẩm, quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 4, 1, 2, 4, 48),

-- Quần sort nữ cá tính
(100, N'Quần sort nữ cá tính, 100 sản phẩm, quần sort chất liệu kaki mềm mại, co giãn nhẹ', 4, 2, 2, 4, 49),

-- Quần sort nữ đũi
(100, N'Quần sort nữ đũi, 100 sản phẩm, quần sort chất liệu đũi mềm mại, co giãn nhẹ', 4, 3, 3, 4, 50),

-- Quần đùi túi hộp đứng
(100, N'Quần đùi túi hộp đứng, 100 sản phẩm, quần dài dáng suông, chất liệu đũi mềm mại, co giãn nhẹ', 4, 4, 3, 4, 51),

-- Quần jean cạp trễ
(100, N'Quần jean cạp trễ, 100 sản phẩm, quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 4, 5, 2, 4, 52),

-- Quần jean thời trang
(100, N'Quần jean thời trang, 100 sản phẩm, quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 4, 6, 2, 4, 53),

-- Quần sort bò rộng
(100, N'Quần sort bò rộng, 100 sản phẩm, quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 4, 7, 2, 4, 54),

-- Quần sort tây nam
(100, N'Quần sort tây nam, 100 sản phẩm, quần sort chất liệu kaki mềm mại, co giãn nhẹ', 4, 8, 2, 4, 55),

-- Quần suông dài basic
(100, N'Quần suông dài basic, 100 sản phẩm, quần dài dáng suông, chất liệu kaki mềm mại, co giãn nhẹ', 4, 9, 2, 4, 56);

go
INSERT INTO hinh_anh_san_pham (id_san_pham, url_anh, mo_ta) VALUES 
/* Áo phông */
(1,'/images/ao_phong/aophongbantaydep.jpg', N'Hình ảnh áo phông'),
(1,'/images/ao_phong/aophongbantaydep(2).jpg', N'Hình ảnh áo phông'),
(1,'/images/ao_phong/aophongbantaydep(3).jpg', N'Hình ảnh áo phông'),
(2,'/images/ao_phong/aophongbutterfly.jpg', N'Hình ảnh áo phông'),
(2,'/images/ao_phong/aophongbutterfly(2).jpg', N'Hình ảnh áo phông'),
(2,'/images/ao_phong/aophongbutterfly(3).jpg', N'Hình ảnh áo phông'),
(3,'/images/ao_phong/aophongcotton.jpg', N'Hình ảnh áo phông'),
(3,'/images/ao_phong/aophongcotton(2).jpg', N'Hình ảnh áo phông'),
(3,'/images/ao_phong/aophongcotton(3).jpg', N'Hình ảnh áo phông'),
(4,'/images/ao_phong/aophongenjoyable.jpg', N'Hình ảnh áo phông'),
(4,'/images/ao_phong/aophongenjoyable(2).jpg', N'Hình ảnh áo phông'),
(4,'/images/ao_phong/aophongenjoyable(3).jpg', N'Hình ảnh áo phông'),
(5,'/images/ao_phong/aophongloang.jpg', N'Hình ảnh áo phông'),
(5,'/images/ao_phong/aophongloang(2).jpg', N'Hình ảnh áo phông'),
(6,'/images/ao_phong/aophongmatholiday.jpg', N'Hình ảnh áo phông'),
(6,'/images/ao_phong/aophongmatholiday(2).jpg', N'Hình ảnh áo phông'),
(6,'/images/ao_phong/aophongmatholiday(3).jpg', N'Hình ảnh áo phông'),
(7,'/images/ao_phong/aophongnamnu1984.jpg', N'Hình ảnh áo phông'),
(7,'/images/ao_phong/aophongnamnu1984(2).jpg', N'Hình ảnh áo phông'),
(7,'/images/ao_phong/aophongnamnu1984(3).jpg', N'Hình ảnh áo phông'),
(8,'/images/ao_phong/aophongnamnuoversize.jpg', N'Hình ảnh áo phông'),
(8,'/images/ao_phong/aophongnamnuoversize(2).jpg', N'Hình ảnh áo phông'),
(9,'/images/ao_phong/aophongtaylo.jpg', N'Hình ảnh áo phông'),
(9,'/images/ao_phong/aophongtaylo(2).jpg', N'Hình ảnh áo phông'),
(9,'/images/ao_phong/aophongtaylo(3).jpg', N'Hình ảnh áo phông'),
(10,'/images/ao_phong/aophongthethao.jpg', N'Hình ảnh áo phông'),
(10,'/images/ao_phong/aophongthethao(2).jpg', N'Hình ảnh áo phông'),
(10,'/images/ao_phong/aophongthethao(3).jpg', N'Hình ảnh áo phông'),
(11,'/images/ao_phong/SPORTFASHION.jpg', N'Hình ảnh áo phông'),
(11,'/images/ao_phong/SPORTFASHION(2).jpg', N'Hình ảnh áo phông'),
(11,'/images/ao_phong/SPORTFASHION(3).jpg', N'Hình ảnh áo phông'),

/* Áo sơ mi */
(12,'/images/ao_so_mi/aosomiduinobuoceo.jpg', N'Hình ảnh áo sơ mi'),
(12,'/images/ao_so_mi/aosomiduinobuoceo(2).jpg', N'Hình ảnh sơ mi'),
(13,'/images/ao_so_mi/aosomikesoc.jpg', N'Hình ảnh áo sơ mi'),
(13,'/images/ao_so_mi/aosomikesoc(2).jpg', N'Hình ảnh áo sơ mi'),
(14,'/images/ao_so_mi/aosomiluacongso.jpg', N'Hình ảnh sơ mi'),
(14,'/images/ao_so_mi/aosomiluacongso(2).jpg', N'Hình ảnh sơ mi'), 
(15,'/images/ao_so_mi/aosominamnuloang.jpg', N'Hình ảnh sơ mi'), 
(15,'/images/ao_so_mi/aosominamnuloang(2).jpg', N'Hình ảnh sơ mi'),
(16,'/images/ao_so_mi/aosomingansieteo.jpg', N'Hình ảnh sơ mi'),
(17,'/images/ao_so_mi/aosomingansieteo(2).jpg', N'Hình ảnh sơ mi'),
(17,'/images/ao_so_mi/aosomingantaytuihop.jpg', N'Hình ảnh sơ mi'),
(17,'/images/ao_so_mi/aosomingantaytuihop(2).jpg', N'Hình ảnh sơ mi'),
(17,'/images/ao_so_mi/aosomingantaytuihop(3).jpg', N'Hình ảnh sơ mi'),
(18,'/images/ao_so_mi/aosomiphongcachnhat.jpg', N'Hình ảnh sơ mi'),
(18,'/images/ao_so_mi/aosomiphongcachnhat(2).jpg', N'Hình ảnh sơ mi '),
(18,'/images/ao_so_mi/aosomiphongcachnhat(3).jpg', N'Hình ảnh sơ mi'),
(19,'/images/ao_so_mi/aosomisocdongian.jpg', N'Hình ảnh áo sơ mi'),
(19,'/images/ao_so_mi/aosomisocdongian(2).jpg', N'Hình ảnh áo sơ mi'),
(20,'/images/ao_so_mi/aosomitayngan.jpg', N'Hình ảnh áo sơ mi'),
(20,'/images/ao_so_mi/aosomitayngan(2).jpg', N'Hình ảnh áo sơ mi'),
(21,'/images/ao_so_mi/aosomitron.jpg', N'Hình ảnh áo sơ mi'),
(21,'/images/ao_so_mi/aosomitron(2).jpg', N'Hình ảnh áo sơ mi'),
(21,'/images/ao_so_mi/aosomitron(3).jpg', N'Hình ảnh áo sơ mi'),


/* Áo phao */
(22,'/images/ao_phao/aoamcolong.jpg', N'Hình ảnh áo phao'),
(22,'/images/ao_phao/aoamcolong(2).jpg', N'Hình ảnh áo phao'),
(22,'/images/ao_phao/aoamcolong(3).jpg', N'Hình ảnh áo phao'),
(23,'/images/ao_phao/aobeobuocno.jpg', N'Hình ảnh áo phao'),
(23,'/images/ao_phao/aobeobuocno(2).jpg', N'Hình ảnh áo phao'),
(23,'/images/ao_phao/aobeobuocno(3).jpg', N'Hình ảnh áo phao'),
(24,'/images/ao_phao/aophaobongngau.jpg', N'Hình ảnh áo phao'),
(24,'/images/ao_phao/aophaobongngau(2).jpg', N'Hình ảnh áo phao'),
(25,'/images/ao_phao/aophaocaikhuydethuong.jpg', N'Hình ảnh áo phao'),
(25,'/images/ao_phao/aophaocaikhuydethuong(2).jpg', N'Hình ảnh áo phao'),
(25,'/images/ao_phao/aophaocaikhuydethuong(3).jpg', N'Hình ảnh áo phao'),
(26,'/images/ao_phao/aophaogile.jpg', N'Hình ảnh áo phao'),
(26,'/images/ao_phao/aophaogile(2).jpg', N'Hình ảnh áo phao'),
(26,'/images/ao_phao/aophaogile(3).jpg', N'Hình ảnh áo phao'),
(27,'/images/ao_phao/aophaokhuyco.jpg', N'Hình ảnh áo phao'),
(27,'/images/ao_phao/aophaokhuyco(2).jpg', N'Hình ảnh áo phao'),
(27,'/images/ao_phao/aophaokhuyco(3).jpg', N'Hình ảnh áo phao'),
(28,'/images/ao_phao/aophaolungthoitrang.jpg', N'Hình ảnh áo phao'),
(28,'/images/ao_phao/aophaolungthoitrang(2).jpg', N'Hình ảnh áo phao'),
(28,'/images/ao_phao/aophaolungthoitrang(3).jpg', N'Hình ảnh áo phao'),
(29,'/images/ao_phao/aophaonhungcuu.jpg', N'Hình ảnh áo phao'),
(29,'/images/ao_phao/aophaonhungcuu(2).jpg', N'Hình ảnh áo phao'),
(29,'/images/ao_phao/aophaonhungcuu(3).jpg', N'Hình ảnh áo phao'),
(30,'/images/ao_phao/aophaoNIKE.jpg', N'Hình ảnh áo phao'),
(30,'/images/ao_phao/aophaoNIKE(2).jpg', N'Hình ảnh áo phao'),
(30,'/images/ao_phao/aophaoNIKE(3).jpg', N'Hình ảnh áo phao'),

/* Áo chống nắng */
(31,'/images/ao_chong_nang/aochongnangvientron.jpg', N'Hình ảnh áo chống nắng'),
(31,'/images/ao_chong_nang/aochongnangvientron(2).jpg', N'Hình ảnh chống nắng'),
(31,'/images/ao_chong_nang/aochongnangvientron(3).jpg', N'Hình ảnh chống nắng'),
(32,'/images/ao_chong_nang/aochongnangtoanthan.jpg', N'Hình ảnh áo chống nắng'),
(32,'/images/ao_chong_nang/aochongnangtoanthan(2).jpg', N'Hình ảnh áo chống nắng'),
(32,'/images/ao_chong_nang/aochongnangtoanthan(3).jpg', N'Hình ảnh áo chống nắng'),
(33,'/images/ao_chong_nang/aochongnangthonghoi.jpg', N'Hình ảnh áo chống nắng'),
(33,'/images/ao_chong_nang/aochongnangthonghoi(2).jpg', N'Hình ảnh áo chống nắng'),
(33,'/images/ao_chong_nang/aochongnangthonghoi(3).jpg', N'Hình ảnh áo chống nắng'),
(34,'/images/ao_chong_nang/aochongnangthoitrang.jpg', N'Hình ảnh áo chống nắng'),
(34,'/images/ao_chong_nang/aochongnangthoitrang(2).jpg', N'Hình ảnh áo chống nắng'),
(34,'/images/ao_chong_nang/aochongnangthoitrang(3).jpg', N'Hình ảnh áo chống nắng'),
(35,'/images/ao_chong_nang/aochongnangthethao.jpg', N'Hình ảnh áo chống nắng'),
(35,'/images/ao_chong_nang/aochongnangthethao(2).jpg', N'Hình ảnh áo chống nắng'),
(35,'/images/ao_chong_nang/aochongnangthethao(3).jpg', N'Hình ảnh áo chống nắng'),
(36,'/images/ao_chong_nang/aochongnangLV.jpg', N'Hình ảnh áo chống nắng'),
(36,'/images/ao_chong_nang/aochongnangLV(2).jpg', N'Hình ảnh áo chống nắng'),
(36,'/images/ao_chong_nang/aochongnangLV(3).jpg', N'Hình ảnh áo chống nắng'),
(37,'/images/ao_chong_nang/aochongnangdaixoe.jpg', N'Hình ảnh áo chống nắng'),
(37,'/images/ao_chong_nang/aochongnangdaixoe(2).jpg', N'Hình ảnh áo chống nắng'),
(37,'/images/ao_chong_nang/aochongnangdaixoe(3).jpg', N'Hình ảnh áo chống nắng'),
(38,'/images/ao_chong_nang/aochongnangcroptop.jpg', N'Hình ảnh áo chống nắng'),
(38,'/images/ao_chong_nang/aochongnangcroptop(2).jpg', N'Hình ảnh áo chống nắng'),
(38,'/images/ao_chong_nang/aochongnangcroptop(3).jpg', N'Hình ảnh áo chống nắng'),
(39,'/images/ao_chong_nang/aochongnangcanhdoi.jpg', N'Hình ảnh áo chống nắng'),
(39,'/images/ao_chong_nang/aochongnangcanhdoi(2).jpg', N'Hình ảnh áo chống nắng'),
(39,'/images/ao_chong_nang/aochongnangcanhdoi(3).jpg', N'Hình ảnh áo chống nắng'),

/* Quần kaki */
(40,'/images/quan_kaki/quanbaggykaki.jpg', N'Hình ảnh quần kaki'),
(40,'/images/quan_kaki/quanbaggykaki(2).jpg', N'Hình ảnh quần kaki'),
(40,'/images/quan_kaki/quanbaggykaki(3).jpg', N'Hình ảnh quần kaki'),
(41,'/images/quan_kaki/quanduidainamnu.jpg',N'Hình ảnh quần kaki'),
(41,'/images/quan_kaki/quanduidainamnu(2).jpg',N'Hình ảnh quần kaki'),
(41,'/images/quan_kaki/quanduidainamnu(3).jpg', N'Hình ảnh quần kaki'),
(42,'/images/quan_kaki/quanduithoaimai.jpg', N'Hình ảnh quần kaki'),
(42,'/images/quan_kaki/quanduithoaimai(2).jpg', N'Hình ảnh quần kaki'),
(42,'/images/quan_kaki/quanduithoaimai(3).jpg', N'Hình ảnh quần kaki'),
(43,'/images/quan_kaki/quanongrongcapcao.jpg', N'Hình ảnh quần kaki'),
(43,'/images/quan_kaki/quanongrongcapcao(2).jpg', N'Hình ảnh quần kaki'),
(43,'/images/quan_kaki/quanongrongcapcao(3).jpg',N'Hình ảnh quần kaki'),
(44,'/images/quan_kaki/quanongrongcongso.jpg', N'Hình ảnh quần kaki'),
(44,'/images/quan_kaki/quanongrongcongso(2).jpg', N'Hình ảnh quần kaki'),
(45,'/images/quan_kaki/quanrongtuihopngau.jpg', N'Hình ảnh quần kaki'),
(45,'/images/quan_kaki/quanrongtuihopngau(2).jpg',N'Hình ảnh quần kaki'),
(46,'/images/quan_kaki/quansuongdongian.jpg', N'Hình ảnh quần kaki'),
(46,'/images/quan_kaki/quansuongdongian(2).jpg',N'Hình ảnh quần kaki'),
(47,'/images/quan_kaki/quansuongongrong.jpg',N'Hình ảnh quần kaki'),
(47,'/images/quan_kaki/quansuongongrong(2).jpg',N'Hình ảnh quần kaki'),


/* Quần sort and jean */
(48,'/images/quan_sort_&_jean/quanboongrongsuong.jpg',N'Hình ảnh quần kiểu'),
(48,'/images/quan_sort_&_jean/quanboongrongsuong(2).jpg',N'Hình ảnh quần kiểu'),
(48,'/images/quan_sort_&_jean/quanboongrongsuong(3).jpg',N'Hình ảnh quần kiểu'),
(49,'/images/quan_sort_&_jean/quanduinucatinh.jpg',N'Hình ảnh quần kiểu'),
(49,'/images/quan_sort_&_jean/quanduinucatinh(2).jpg',N'Hình ảnh quần kiểu'),
(50,'/images/quan_sort_&_jean/quanduinuthoaimai.jpg',N'Hình ảnh quần kiểu'),
(50,'/images/quan_sort_&_jean/quanduinuthoaimai(2).jpg',N'Hình ảnh quần kiểu'),
(50,'/images/quan_sort_&_jean/quanduinuthoaimai(3).jpg',N'Hình ảnh quần kiểu'),
(51,'/images/quan_sort_&_jean/quanduituihopdung.jpg',N'Hình ảnh quần kiểu'),
(51,'/images/quan_sort_&_jean/quanduituihopdung(2).jpg',N'Hình ảnh quần kiểu'),
(52,'/images/quan_sort_&_jean/quanjeancaptre.jpg',N'Hình ảnh quần kiểu'),
(52,'/images/quan_sort_&_jean/quanjeancaptre(2).jpg',N'Hình ảnh quần kiểu'),
(52,'/images/quan_sort_&_jean/quanjeancaptre(3).jpg',N'Hình ảnh quần kiểu'),
(53,'/images/quan_sort_&_jean/quanjeanthoitrang.jpg',N'Hình ảnh quần kiểu'),
(53,'/images/quan_sort_&_jean/quanjeanthoitrang(2).jpg',N'Hình ảnh quần kiểu'),
(53,'/images/quan_sort_&_jean/quanjeanthoitrang(3).jpg',N'Hình ảnh quần kiểu'),
(54,'/images/quan_sort_&_jean/quanshortborong.jpg',N'Hình ảnh quần kiểu'),
(54,'/images/quan_sort_&_jean/quanshortborong(2).jpg',N'Hình ảnh quần kiểu'),
(55,'/images/quan_sort_&_jean/quanshorttaynam.jpg',N'Hình ảnh quần kiểu'),
(55,'/images/quan_sort_&_jean/quanshorttaynam(2).jpg',N'Hình ảnh quần kiểu'),
(55,'/images/quan_sort_&_jean/quanshorttaynam(3).jpg',N'Hình ảnh quần kiểu'),
(56,'/images/quan_sort_&_jean/quansuongdaibasic.jpg',N'Hình ảnh quần kiểu'),
(56,'/images/quan_sort_&_jean/quansuongdaibasic(2).jpg',N'Hình ảnh quần kiểu'),
(56,'/images/quan_sort_&_jean/quansuongdaibasic(3).jpg',N'Hình ảnh quần kiểu');
go

-- Insert data for hoa_don_chi_tiet
INSERT INTO hoa_don_chi_tiet (id_san_pham_chi_tiet, id_hoa_don, so_luong, tong_tien) VALUES 
(1, 1, 2, 1000.00),
(2, 1, 1, 500.00),
(3, 2, 1, 750.00),
(4, 3, 5, 1500.00),
(5, 4, 3, 3600.00);
go

-- Insert data for lich_su_hoa_don
INSERT INTO lich_su_hoa_don (so_tien_thanh_toan, id_hoa_don_chi_tiet, id_nguoi_dung) VALUES 
(500.00, 1, 4),
(750.00, 2, 2),
(300.00, 3, 1),
(1200.00, 4, 3),
(150.00, 5, 5);
go
select * from vai_tro
select * from nguoi_dung
select * from voucher
select * from loai_voucher
select * from danh_muc
select * from danh_gia
select * from chat_lieu
select * from chat_lieu_chi_tiet
select * from kich_thuoc
select * from kich_thuoc_chi_tiet
select * from mau_sac
select * from mau_sac_chi_tiet
select * from gio_hang
select * from gio_hang_chi_tiet
select * from phi_van_chuyen
select * from dia_chi_van_chuyen
select * from pt_thanh_toan
select * from pt_thanh_toan_hoa_don
select * from trang_thai_hoa_don
select * from hoa_don
select * from hoa_don_chi_tiet
select * from xac_thuc
select * from lich_su_hoa_don
select * from san_pham
select * from san_pham_chi_tiet
select * from hinh_anh_san_pham
