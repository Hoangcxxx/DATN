CREATE DATABASE DATN_NIMBUS;
GO

USE DATN_NIMBUS;
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
go
CREATE TABLE [vocher] (
  [Id_vocher] INT PRIMARY KEY IDENTITY(1,1),
  [ma_vocher] NVARCHAR(50) NOT NULL UNIQUE,
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
CREATE TABLE [loai_vocher] (
  [Id_loai_vocher] INT PRIMARY KEY IDENTITY(1,1),
  [ten_loai_vocher] NVARCHAR(100) NOT NULL,
  [mo_ta] NVARCHAR(MAX),
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
  [id_vocher] INT,
  CONSTRAINT [FK_loai_vocher_id_vocher]
    FOREIGN KEY ([id_vocher])
      REFERENCES [vocher]([Id_vocher])
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
  [id_loai_vocher] INT,
  CONSTRAINT [FK_san_pham_id_loai_vocher]
    FOREIGN KEY ([id_loai_vocher])
      REFERENCES [loai_vocher]([Id_loai_vocher]),
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
  [trang_thai] BIT DEFAULT 1,
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE()
);
go
CREATE TABLE [chat_lieu_chi_tiet] (
  [Id_chat_lieu_tiet] INT PRIMARY KEY IDENTITY(1,1),
  [id_chat_lieu] INT,
  [mo_ta] NVARCHAR(MAX),
  [trang_thai] BIT DEFAULT 1,
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
  [trang_thai] BIT DEFAULT 1,
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE()
);
go
CREATE TABLE [kich_thuoc_chi_tiet] (
  [Id_kich_thuoc_chi_tiet] INT PRIMARY KEY IDENTITY(1,1),
  [id_kich_thuoc] INT,
  [mo_ta] NVARCHAR(MAX),
  [trang_thai] BIT DEFAULT 1,
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
  [trang_thai] BIT DEFAULT 1,
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE()
);
go
CREATE TABLE [mau_sac_chi_tiet] (
  [Id_mau_sac_chi_tiet] INT PRIMARY KEY IDENTITY(1,1),
  [mo_ta] NVARCHAR(MAX),
  [trang_thai] BIT DEFAULT 1,
  [ngay_tao] DATETIME DEFAULT GETDATE(),
  [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
  [id_mau_sac] INT,
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
  [id_loai_vocher] INT,
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
  CONSTRAINT [FK_hoa_don_id_loai_vocher]
    FOREIGN KEY ([id_loai_vocher])
      REFERENCES [loai_vocher]([Id_loai_vocher])
);
go
CREATE TABLE [hoa_don_chi_tiet] (
  [Id_hoa_don_chi_tiet] INT PRIMARY KEY IDENTITY(1,1),
  [ma_don] NVARCHAR(50),
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
-- Th�m d? li?u cho b?ng vai_tro
INSERT INTO vai_tro (ten, mo_ta) VALUES 
('Qu?n tr? vi�n', 'Ng??i qu?n l� to�n b? h? th?ng'),
('Kh�ch h�ng', 'Ng??i mua h�ng tr�n website'),
('Nh�n vi�n b�n h�ng', 'Nh�n vi�n h? tr? b�n h�ng'),
('Nh�n vi�n giao h�ng', 'Ng??i giao h�ng ??n tay kh�ch'),
('Qu?n l� kho', 'Ng??i qu?n l� t?n kho');

-- Th�m d? li?u cho b?ng nguoi_dung
INSERT INTO nguoi_dung (ten_nguoi_dung, ma_nguoi_dung, Email, sdt_nguoi_dung, Ngay_Sinh, Dia_Chi, Gioi_Tinh, Mat_Khau) VALUES 
('Nguy?n V?n A', 'user001', 'vana@example.com', '0123456789', '1990-01-01', 'H� N?i', 'Nam', 'password1'),
('Tr?n Th? B', 'user002', 'tranb@example.com', '0123456790', '1992-02-02', 'H� N?i', 'N?', 'password2'),
('L� V?n C', 'user003', 'vanc@example.com', '0123456791', '1988-03-03', 'H� N?i', 'Nam', 'password3'),
('Nguy?n Th? D', 'user004', 'vand@example.com', '0123456792', '1995-04-04', 'H� N?i', 'N?', 'password4'),
('Tr?n V?n E', 'user005', 'vane@example.com', '0123456793', '1993-05-05', 'H� N?i', 'Nam', 'password5');

-- Th�m d? li?u cho b?ng vocher
INSERT INTO vocher (ma_vocher, phan_tram_giam, so_luong, mo_ta, ngay_bat_dau, ngay_ket_thuc) VALUES 
('VOCHER01', 10.00, 100, 'Gi?m 10% cho ??n h�ng tr�n 500k', '2024-01-01', '2024-01-31'),
('VOCHER02', 15.00, 50, 'Gi?m 15% cho ??n h�ng tr�n 1 tri?u', '2024-02-01', '2024-02-28'),
('VOCHER03', 5.00, 200, 'Gi?m 5% cho t?t c? s?n ph?m', '2024-03-01', '2024-03-31'),
('VOCHER04', 20.00, 30, 'Gi?m 20% cho kh�ch h�ng m?i', '2024-04-01', '2024-04-30'),
('VOCHER05', 25.00, 10, 'Gi?m 25% cho ??n h�ng ??u ti�n', '2024-05-01', '2024-05-31');

-- Th�m d? li?u cho b?ng loai_vocher
INSERT INTO loai_vocher (ten_danh_muc, mo_ta) VALUES 
('Gi?m gi� theo ph?n tr?m', 'Gi?m gi� theo t? l? ph?n tr?m'),
('Gi?m gi� theo s? ti?n', 'Gi?m gi� m?t s? ti?n c? ??nh');

-- Th�m d? li?u cho b?ng danh_muc
INSERT INTO danh_muc (ten_danh_muc, mo_ta) VALUES 
('�o', 'C�c lo?i �o th?i trang'),
('Qu?n', 'C�c lo?i qu?n th?i trang'),
('Gi�y', 'C�c lo?i gi�y th?i trang'),
('Ph? ki?n', 'C�c ph? ki?n th?i trang'),
('??ng h?', 'C�c lo?i ??ng h? th?i trang');

-- Th�m d? li?u cho b?ng san_pham
INSERT INTO san_pham (ten_san_pham, so_luong_ton, gia_ban, mo_ta, id_danh_muc, id_loai_vocher) VALUES 
('�o thun nam', 100, 200000, '�o thun nam ch?t li?u cotton', 1, 1),
('Qu?n jeans n?', 50, 300000, 'Qu?n jeans n? th?i trang', 2, 1),
('Gi�y th? thao', 80, 500000, 'Gi�y th? thao ph� h?p m?i l?a tu?i', 3, 2),
('M? th?i trang', 150, 100000, 'M? th?i trang cho m�a h�', 4, 1),
('??ng h? th�ng minh', 30, 1500000, '??ng h? th�ng minh ?a ch?c n?ng', 5, 2);

INSERT INTO sp_vocher (Id_san_pham, Id_vocher) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 2);


-- Th�m d? li?u cho b?ng danh_gia
INSERT INTO danh_gia (id_nguoi_dung, id_san_pham, noi_dung, diem) VALUES 
(1, 1, 'S?n ph?m r?t t?t!', 5),
(2, 2, 'Qu?n ??p nh?ng h?i ch?t.', 4),
(3, 3, 'Gi�y r?t �m ch�n.', 5),
(4, 4, 'M? r?t th?i trang.', 3),
(5, 5, '??ng h? r?t ch?t l??ng.', 4);

-- Th�m d? li?u cho b?ng chat_lieu
INSERT INTO chat_lieu (ten_chat_lieu, mo_ta) VALUES 
('Cotton', 'Ch?t li?u cotton tho�ng m�t'),
('Jean', 'Ch?t li?u denim b?n ch?c'),
('Da', 'Ch?t li?u da t? nhi�n'),
('N?', 'Ch?t li?u n? ?m �p'),
('V?i thun', 'Ch?t li?u v?i thun co gi�n');

-- Th�m d? li?u cho b?ng chat_lieu_chi_tiet
INSERT INTO chat_lieu_chi_tiet (id_chat_lieu, mo_ta) VALUES 
(1, 'Ch?t li?u cotton 100%'),
(2, 'Ch?t li?u denim cao c?p'),
(3, 'Ch?t li?u da th?t'),
(4, 'Ch?t li?u n? m?m m?i'),
(5, 'Ch?t li?u v?i thun co gi�n t?t');

-- Th�m d? li?u cho b?ng kich_thuoc
INSERT INTO kich_thuoc (ten_kich_thuoc, mo_ta) VALUES 
('S', 'K�ch th??c nh?'),
('M', 'K�ch th??c v?a'),
('L', 'K�ch th??c l?n'),
('XL', 'K�ch th??c r?t l?n'),
('XXL', 'K�ch th??c r?t r?t l?n');

-- Th�m d? li?u cho b?ng kich_thuoc_chi_tiet
INSERT INTO kich_thuoc_chi_tiet (id_kich_thuoc, mo_ta) VALUES 
(1, 'S cho ng??i nh? nh?n'),
(2, 'M cho ng??i trung b�nh'),
(3, 'L cho ng??i cao to'),
(4, 'XL cho ng??i r?t cao'),
(5, 'XXL cho ng??i c� kh? l?n');

-- Th�m d? li?u cho b?ng mau_sac
INSERT INTO mau_sac (ten_mau_sac, mo_ta) VALUES 
('??', 'M�u ?? r?c r?'),
('Xanh', 'M�u xanh t??i m�t'),
('Tr?ng', 'M�u tr?ng tinh khi?t'),
('?en', 'M�u ?en sang tr?ng'),
('V�ng', 'M�u v�ng n?i b?t');

-- Th�m d? li?u cho b?ng mau_sac_chi_tiet
INSERT INTO mau_sac_chi_tiet (id_mau_sac, mo_ta) VALUES 
(1, '?? t??i'),
(2, 'Xanh d??ng'),
(3, 'Tr?ng s?a'),
(4, '?en huy?n'),
(5, 'V�ng chanh');

-- Th�m d? li?u cho b?ng gio_hang
INSERT INTO gio_hang (id_nguoi_dung) VALUES 
(1), (2), (3), (4), (5);

-- Th�m d? li?u cho b?ng gio_hang_chi_tiet
INSERT INTO gio_hang_chi_tiet (id_gio_hang, so_luong, don_gia, thanh_tien) VALUES 
(1, 1, 200000, 200000),
(2, 2, 300000, 600000),
(3, 1, 500000, 500000),
(4, 1, 100000, 100000),
(5, 1, 1500000, 1500000);

-- Th�m d? li?u cho b?ng san_pham_chi_tiet
INSERT INTO san_pham_chi_tiet (so_luong, mo_ta, id_kich_thuoc_chi_tiet, id_mau_sac_chi_tiet, id_chat_lieu_chi_tiet) VALUES 
(10, 'Chi ti?t s?n ph?m 1', 1, 1, 1),
(5, 'Chi ti?t s?n ph?m 2', 2, 2, 2),
(8, 'Chi ti?t s?n ph?m 3', 3, 3, 3),
(6, 'Chi ti?t s?n ph?m 4', 4, 4, 4),
(4, 'Chi ti?t s?n ph?m 5', 5, 5, 5);
INSERT INTO phi_van_chuyen (so_tien_van_chuyen, mo_ta) VALUES 
(25000, 'Ph� v?n chuy?n n?i th�nh'),
(50000, 'Ph� v?n chuy?n ngo?i th�nh'),
(100000, 'Ph� v?n chuy?n ?i t?nh'),
(150000, 'Ph� v?n chuy?n cho ??n h�ng l?n'),
(20000, 'Ph� v?n chuy?n cho ??n h�ng d??i 500k');
INSERT INTO dia_chi_van_chuyen (id_phi_van_chuyen, tinh, huyen, xa, mo_ta) VALUES 
(1, 'H� N?i', 'Ho�n Ki?m', 'Ph??ng 1', '??a ch? giao h�ng ? H� N?i'),
(2, 'H� N?i', '??ng ?a', 'Ph??ng 2', '??a ch? giao h�ng ? ??ng ?a'),
(3, 'H� N?i', 'C?u Gi?y', 'Ph??ng 3', '??a ch? giao h�ng ? C?u Gi?y'),
(1, 'H� N?i', 'Thanh Xu�n', 'Ph??ng 4', '??a ch? giao h�ng ? Thanh Xu�n'),
(2, 'H� N?i', 'T�y H?', 'Ph??ng 5', '??a ch? giao h�ng ? T�y H?');
INSERT INTO pt_thanh_toan (ma_thanh_toan, ten_phuong_thuc, noi_dung_thanh_toan) VALUES 
('TT01', 'Chuy?n kho?n ng�n h�ng', 'Chuy?n kho?n qua ng�n h�ng'),
('TT02', 'Thanh to�n khi nh?n h�ng', 'Thanh to�n b?ng ti?n m?t khi nh?n h�ng'),
('TT03', 'Th? t�n d?ng', 'Thanh to�n qua th? t�n d?ng'),
('TT04', 'V� ?i?n t?', 'Thanh to�n qua v� ?i?n t?'),
('TT05', 'QR Code', 'Thanh to�n qua QR Code');
INSERT INTO [pt_thanh_toan_hoa_don] ([id_pt_thanh_toan], [so_tien_thanh_toan], [ngay_giao_dich], [ghi_chu], [id_giao_dich_thanh_toan])
VALUES 
(1, 1000.00, '2024-09-27', 'Payment for invoice #123', 'TXN001'),
(2, 500.50, '2024-09-26', 'Partial payment for invoice #124', 'TXN002'),
(1, 1500.75, '2024-09-25', 'Full payment for invoice #125', 'TXN003');
INSERT INTO [pt_thanh_toan_hoa_don] ([id_pt_thanh_toan], [so_tien_thanh_toan], [ngay_giao_dich], [ghi_chu], [id_giao_dich_thanh_toan])
VALUES 
(1, 2000.00, '2024-09-28', 'Payment for invoice #126', 'TXN004'),
(2, 750.25, '2024-09-29', 'Deposit for invoice #127', 'TXN005');

INSERT INTO trang_thai_hoa_don (ten_trang_thai, mo_ta) VALUES 
('?ang x? l�', 'H�a ??n ?ang ???c x? l�'),
('?� giao h�ng', 'H�a ??n ?� ???c giao h�ng'),
('?� h?y', 'H�a ??n ?� b? h?y'),
('?� thanh to�n', 'H�a ??n ?� ???c thanh to�n'),
('Ch? thanh to�n', 'H�a ??n ?ang ch? thanh to�n');
INSERT INTO hoa_don (ma_hoa_don, id_nguoi_dung, id_loai_vocher, Id_dia_chi_van_chuyen, id_trang_thai_hoa_don, ten_nguoi_nhan, phi_ship, dia_chi, sdt_nguoi_nhan, thanh_tien, mo_ta, id_pt_thanh_toan_hoa_don) VALUES 
('HD001', 1, 1, 1, 1, 'Nguy?n V?n A', 25000, '??a ch? 1', '0123456789', 220000, 'H�a ??n mua �o thun', 1),
('HD002', 2, 2, 2, 2, 'Tr?n Th? B', 50000, '??a ch? 2', '0123456790', 600000, 'H�a ??n mua qu?n jeans', 2),
('HD003', 3, 1, 3, 3, 'L� V?n C', 100000, '??a ch? 3', '0123456791', 500000, 'H�a ??n mua gi�y th? thao', 3),
('HD004', 4, 1, 4, 1, 'Nguy?n Th? D', 20000, '??a ch? 4', '0123456792', 100000, 'H�a ??n mua m? th?i trang', 4),
('HD005', 5, 2, 5, 2, 'Tr?n V?n E', 30000, '??a ch? 5', '0123456793', 1500000, 'H�a ??n mua ??ng h? th�ng minh', 5);
INSERT INTO [hoa_don_chi_tiet] (ma_don, id_san_pham_chi_tiet, id_hoa_don, so_luong, tong_tien, mo_ta)
VALUES 
('HDCT001', 1, 1, 2, 200000.00, 'M� t? s?n ph?m 1'),
('HDCT002', 2, 2, 1, 150000.00, 'M� t? s?n ph?m 2'),
('HDCT003', 1, 5, 3, 600000.00, 'M� t? s?n ph?m 3'),
('HDCT004', 3, 4, 1, 300000.00, 'M� t? s?n ph?m 4'),
('HDCT005', 2, 3, 5, 1000000.00, 'M� t? s?n ph?m 5');

INSERT INTO hinh_anh_san_pham (id_san_pham, url_anh, mo_ta) VALUES 
(1, 'http://example.com/images/ao_thun_nam.jpg', 'H�nh ?nh �o thun nam'),
(2, 'http://example.com/images/quan_jeans_nu.jpg', 'H�nh ?nh qu?n jeans n?'),
(3, 'http://example.com/images/giai_the_thao.jpg', 'H�nh ?nh gi�y th? thao'),
(4, 'http://example.com/images/mu_thoi_trang.jpg', 'H�nh ?nh m? th?i trang'),
(5, 'http://example.com/images/dong_ho_thong_minh.jpg', 'H�nh ?nh ??ng h? th�ng minh');
INSERT INTO xac_thuc (ma_xac_thuc, id_nguoi_dung, mo_ta) VALUES 
('XACTHUC001', 1, 'X�c th?c t�i kho?n ng??i d�ng 1'),
('XACTHUC002', 2, 'X�c th?c t�i kho?n ng??i d�ng 2'),
('XACTHUC003', 3, 'X�c th?c t�i kho?n ng??i d�ng 3'),
('XACTHUC004', 4, 'X�c th?c t�i kho?n ng??i d�ng 4'),
('XACTHUC005', 5, 'X�c th?c t�i kho?n ng??i d�ng 5');
INSERT INTO lich_su_hoa_don (so_tien_thanh_toan, ngay_giao_dich, id_hoa_don_chi_tiet, id_nguoi_dung) VALUES 
(200000, '2024-01-02', 1, 1),
(600000, '2024-02-03', 2, 2),
(500000, '2024-03-04', 3, 3),
(100000, '2024-04-05', 4, 4),
(1500000, '2024-05-06', 5, 5);
-- L?y t?t c? d? li?u t? b?ng vai_tro
SELECT * FROM vai_tro;

-- L?y t?t c? d? li?u t? b?ng nguoi_dung
SELECT * FROM nguoi_dung;

-- L?y t?t c? d? li?u t? b?ng vocher
SELECT * FROM vocher;

-- L?y t?t c? d? li?u t? b?ng loai_vocher
SELECT * FROM loai_vocher;

-- L?y t?t c? d? li?u t? b?ng sp_vocher
SELECT * FROM sp_vocher;

-- L?y t?t c? d? li?u t? b?ng danh_muc
SELECT * FROM danh_muc;

-- L?y t?t c? d? li?u t? b?ng san_pham
SELECT * FROM san_pham;

-- L?y t?t c? d? li?u t? b?ng danh_gia
SELECT * FROM danh_gia;

-- L?y t?t c? d? li?u t? b?ng chat_lieu
SELECT * FROM chat_lieu;

-- L?y t?t c? d? li?u t? b?ng chat_lieu_chi_tiet
SELECT * FROM chat_lieu_chi_tiet;

-- L?y t?t c? d? li?u t? b?ng kich_thuoc
SELECT * FROM kich_thuoc;

-- L?y t?t c? d? li?u t? b?ng kich_thuoc_chi_tiet
SELECT * FROM kich_thuoc_chi_tiet;

-- L?y t?t c? d? li?u t? b?ng mau_sac
SELECT * FROM mau_sac;

-- L?y t?t c? d? li?u t? b?ng mau_sac_chi_tiet
SELECT * FROM mau_sac_chi_tiet;

-- L?y t?t c? d? li?u t? b?ng gio_hang
SELECT * FROM gio_hang;

-- L?y t?t c? d? li?u t? b?ng gio_hang_chi_tiet
SELECT * FROM gio_hang_chi_tiet;

-- L?y t?t c? d? li?u t? b?ng san_pham_chi_tiet
SELECT * FROM san_pham_chi_tiet;

-- L?y t?t c? d? li?u t? b?ng phi_van_chuyen
SELECT * FROM phi_van_chuyen;

-- L?y t?t c? d? li?u t? b?ng dia_chi_van_chuyen
SELECT * FROM dia_chi_van_chuyen;

-- L?y t?t c? d? li?u t? b?ng pt_thanh_toan
SELECT * FROM pt_thanh_toan;

-- L?y t?t c? d? li?u t? b?ng pt_thanh_toan_hoa_don
SELECT * FROM pt_thanh_toan_hoa_don;

-- L?y t?t c? d? li?u t? b?ng trang_thai_hoa_don
SELECT * FROM trang_thai_hoa_don;

-- L?y t?t c? d? li?u t? b?ng hoa_don
SELECT * FROM hoa_don;

-- L?y t?t c? d? li?u t? b?ng hoa_don_chi_tiet
SELECT * FROM hoa_don_chi_tiet;

-- L?y t?t c? d? li?u t? b?ng hinh_anh_san_pham
SELECT * FROM hinh_anh_san_pham;

-- L?y t?t c? d? li?u t? b?ng xac_thuc
SELECT * FROM xac_thuc;

-- L?y t?t c? d? li?u t? b?ng lich_su_hoa_don
SELECT * FROM lich_su_hoa_don;
