USE [master]
GO
/****** Object:  Database [QUANLYDAILY]    Script Date: 5/26/2024 2:11:31 AM ******/
CREATE DATABASE [QUANLYDAILY]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QUANLYDAILY', FILENAME = N'E:\CSDL\MSSQL16.SQLEXPRESS\MSSQL\DATA\QUANLYDAILY.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QUANLYDAILY_log', FILENAME = N'E:\CSDL\MSSQL16.SQLEXPRESS\MSSQL\DATA\QUANLYDAILY_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QUANLYDAILY] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QUANLYDAILY].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QUANLYDAILY] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QUANLYDAILY] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QUANLYDAILY] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QUANLYDAILY] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QUANLYDAILY] SET ARITHABORT OFF 
GO
ALTER DATABASE [QUANLYDAILY] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QUANLYDAILY] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QUANLYDAILY] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QUANLYDAILY] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QUANLYDAILY] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QUANLYDAILY] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QUANLYDAILY] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QUANLYDAILY] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QUANLYDAILY] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QUANLYDAILY] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QUANLYDAILY] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QUANLYDAILY] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QUANLYDAILY] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QUANLYDAILY] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QUANLYDAILY] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QUANLYDAILY] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QUANLYDAILY] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QUANLYDAILY] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QUANLYDAILY] SET  MULTI_USER 
GO
ALTER DATABASE [QUANLYDAILY] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QUANLYDAILY] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QUANLYDAILY] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QUANLYDAILY] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QUANLYDAILY] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QUANLYDAILY] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QUANLYDAILY] SET QUERY_STORE = ON
GO
ALTER DATABASE [QUANLYDAILY] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QUANLYDAILY]
GO
/****** Object:  Table [dbo].[BAOCAOCONGNO]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAOCAOCONGNO](
	[MaDaiLy] [varchar](10) NOT NULL,
	[Thang] [int] NOT NULL,
	[Nam] [int] NOT NULL,
	[NoDau] [money] NULL,
	[PhatSinh] [money] NULL,
	[NoCuoi]  AS ([NoDau]+[PhatSinh]) PERSISTED,
 CONSTRAINT [PK_BAOCAOCONGNO] PRIMARY KEY CLUSTERED 
(
	[MaDaiLy] ASC,
	[Thang] ASC,
	[Nam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAOCAODOANHSO]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAOCAODOANHSO](
	[MaBCDS] [varchar](10) NOT NULL,
	[Thang] [int] NULL,
	[Nam] [int] NULL,
	[TongDoanhThu] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBCDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_BCDOANHSO]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_BCDOANHSO](
	[MaBCDS] [varchar](10) NOT NULL,
	[MaDaiLy] [varchar](10) NOT NULL,
	[SoLuongPhieuXuat] [int] NULL,
	[TongTriGia] [float] NULL,
	[TiLe] [float] NULL,
 CONSTRAINT [PK_CTBCDOANHSO] PRIMARY KEY CLUSTERED 
(
	[MaBCDS] ASC,
	[MaDaiLy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_PNH]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PNH](
	[SoPhieuNhap] [varchar](10) NOT NULL,
	[MaMatHang] [varchar](50) NOT NULL,
	[SoLuongNhap] [bigint] NULL,
	[DonGiaNhap] [money] NULL,
	[ThanhTien] [money] NULL,
 CONSTRAINT [PK_CTPNH] PRIMARY KEY CLUSTERED 
(
	[SoPhieuNhap] ASC,
	[MaMatHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_PXH]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PXH](
	[SoPhieuXuat] [varchar](10) NOT NULL,
	[MaMatHangXuat] [varchar](50) NOT NULL,
	[SoLuongXuat] [int] NULL,
	[DonGiaXuat] [money] NULL,
	[ThanhTien] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DAILY]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DAILY](
	[MaDaiLy] [varchar](10) NOT NULL,
	[TenDaiLy] [varchar](10) NOT NULL,
	[MaLoaiDaiLy] [varchar](10) NOT NULL,
	[DienThoai] [varchar](10) NOT NULL,
	[DiaChi] [varchar](200) NOT NULL,
	[Email] [varchar](255) NULL,
	[MaQuan] [varchar](10) NULL,
	[NgayTiepNhan] [date] NULL,
	[TongNo] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDaiLy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DVT]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DVT](
	[MaDVT] [varchar](10) NOT NULL,
	[TenDVT] [varchar](10) NULL,
 CONSTRAINT [PK_DVT] PRIMARY KEY CLUSTERED 
(
	[MaDVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAIDAILY]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIDAILY](
	[MaLoaiDaiLy] [varchar](10) NOT NULL,
	[TenLoaiDaiLy] [varchar](100) NULL,
	[SoNoToiDa] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiDaiLy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MATHANG]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MATHANG](
	[MaMatHang] [varchar](50) NOT NULL,
	[TenMatHang] [varchar](10) NULL,
	[MaDVT] [varchar](10) NULL,
	[SoLuongTon] [int] NULL,
 CONSTRAINT [PK_MATHANG] PRIMARY KEY CLUSTERED 
(
	[MaMatHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIEUNHAPHANG]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUNHAPHANG](
	[SoPhieuNhap] [varchar](10) NOT NULL,
	[NgayNhapHang] [date] NULL,
	[TongTien] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[SoPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIEUTHUTIEN]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUTHUTIEN](
	[SoPhieuThu] [varchar](10) NOT NULL,
	[MaDaiLy] [varchar](10) NULL,
	[NgayThuTien] [date] NULL,
	[SoTienThu] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[SoPhieuThu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIEUXUATHANG]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUXUATHANG](
	[SoPhieuXuat] [varchar](10) NOT NULL,
	[MaDaiLy] [varchar](10) NULL,
	[NgayXuatHang] [date] NULL,
	[TongTien] [money] NULL,
	[SoTienTra] [money] NULL,
	[ConLai]  AS ([TongTien]-[SoTienTra]) PERSISTED,
PRIMARY KEY CLUSTERED 
(
	[SoPhieuXuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QUAN]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUAN](
	[MaQuan] [varchar](10) NOT NULL,
	[TenQuan] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THAMSO]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THAMSO](
	[TenThamSo] [varchar](50) NOT NULL,
	[GiaTri] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TenThamSo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERACCOUNT]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERACCOUNT](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BAOCAOCONGNO] ([MaDaiLy], [Thang], [Nam], [NoDau], [PhatSinh]) VALUES (N'12', 5, 2024, NULL, -123.0000)
INSERT [dbo].[BAOCAOCONGNO] ([MaDaiLy], [Thang], [Nam], [NoDau], [PhatSinh]) VALUES (N'DL0001', 5, 2024, 0.0000, 0.0000)
INSERT [dbo].[BAOCAOCONGNO] ([MaDaiLy], [Thang], [Nam], [NoDau], [PhatSinh]) VALUES (N'DL01', 5, 2024, NULL, 0.0000)
GO
INSERT [dbo].[DAILY] ([MaDaiLy], [TenDaiLy], [MaLoaiDaiLy], [DienThoai], [DiaChi], [Email], [MaQuan], [NgayTiepNhan], [TongNo]) VALUES (N'DL0001', N'DL01', N'MLDL0001', N'1234567890', N'123', N'123', N'Q1', CAST(N'2024-05-26' AS Date), 0.0000)
GO
INSERT [dbo].[DVT] ([MaDVT], [TenDVT]) VALUES (N'MDVT0001', N'DONVITINH1')
INSERT [dbo].[DVT] ([MaDVT], [TenDVT]) VALUES (N'MDVT0002', NULL)
GO
INSERT [dbo].[LOAIDAILY] ([MaLoaiDaiLy], [TenLoaiDaiLy], [SoNoToiDa]) VALUES (N'MLDL0001', NULL, 0.0000)
INSERT [dbo].[LOAIDAILY] ([MaLoaiDaiLy], [TenLoaiDaiLy], [SoNoToiDa]) VALUES (N'MLDL0002', NULL, 0.0000)
GO
INSERT [dbo].[MATHANG] ([MaMatHang], [TenMatHang], [MaDVT], [SoLuongTon]) VALUES (N'MMH0001', NULL, NULL, 0)
INSERT [dbo].[MATHANG] ([MaMatHang], [TenMatHang], [MaDVT], [SoLuongTon]) VALUES (N'MMH0002', NULL, NULL, 0)
INSERT [dbo].[MATHANG] ([MaMatHang], [TenMatHang], [MaDVT], [SoLuongTon]) VALUES (N'MMH0003', NULL, NULL, 0)
GO
INSERT [dbo].[PHIEUXUATHANG] ([SoPhieuXuat], [MaDaiLy], [NgayXuatHang], [TongTien], [SoTienTra]) VALUES (N'spx001', N'12', CAST(N'2024-05-26' AS Date), 0.0000, 123.0000)
GO
INSERT [dbo].[QUAN] ([MaQuan], [TenQuan]) VALUES (N'Q1', N'QUAN1')
GO
INSERT [dbo].[THAMSO] ([TenThamSo], [GiaTri]) VALUES (N'ApDungQDKiemTraSoTienThu', 1)
INSERT [dbo].[THAMSO] ([TenThamSo], [GiaTri]) VALUES (N'SoDaiLyToiDa', 4)
INSERT [dbo].[THAMSO] ([TenThamSo], [GiaTri]) VALUES (N'SoDonViTinh', 2)
INSERT [dbo].[THAMSO] ([TenThamSo], [GiaTri]) VALUES (N'SoLoaiDaiLy', 2)
INSERT [dbo].[THAMSO] ([TenThamSo], [GiaTri]) VALUES (N'SoMatHang', 5)
INSERT [dbo].[THAMSO] ([TenThamSo], [GiaTri]) VALUES (N'TiLeTinhDonGiaXuat', 102)
GO
INSERT [dbo].[USERACCOUNT] ([Username], [Password]) VALUES (N'sa', N'1982408718410113214846658453255177250147212')
GO
ALTER TABLE [dbo].[CT_PXH] ADD  DEFAULT ((0)) FOR [ThanhTien]
GO
ALTER TABLE [dbo].[CT_BCDOANHSO]  WITH CHECK ADD  CONSTRAINT [FK_CT_BCDOANHSO_MaBCDS] FOREIGN KEY([MaBCDS])
REFERENCES [dbo].[BAOCAODOANHSO] ([MaBCDS])
GO
ALTER TABLE [dbo].[CT_BCDOANHSO] CHECK CONSTRAINT [FK_CT_BCDOANHSO_MaBCDS]
GO
ALTER TABLE [dbo].[CT_BCDOANHSO]  WITH CHECK ADD  CONSTRAINT [FK_CT_BCDOANHSO_MaDaiLy] FOREIGN KEY([MaDaiLy])
REFERENCES [dbo].[DAILY] ([MaDaiLy])
GO
ALTER TABLE [dbo].[CT_BCDOANHSO] CHECK CONSTRAINT [FK_CT_BCDOANHSO_MaDaiLy]
GO
ALTER TABLE [dbo].[CT_PXH]  WITH CHECK ADD FOREIGN KEY([MaMatHangXuat])
REFERENCES [dbo].[MATHANG] ([MaMatHang])
GO
ALTER TABLE [dbo].[CT_PXH]  WITH CHECK ADD FOREIGN KEY([SoPhieuXuat])
REFERENCES [dbo].[PHIEUXUATHANG] ([SoPhieuXuat])
GO
ALTER TABLE [dbo].[DAILY]  WITH CHECK ADD FOREIGN KEY([MaLoaiDaiLy])
REFERENCES [dbo].[LOAIDAILY] ([MaLoaiDaiLy])
GO
ALTER TABLE [dbo].[DAILY]  WITH CHECK ADD FOREIGN KEY([MaQuan])
REFERENCES [dbo].[QUAN] ([MaQuan])
GO
ALTER TABLE [dbo].[MATHANG]  WITH CHECK ADD  CONSTRAINT [FK_MATHANG_DVT] FOREIGN KEY([MaDVT])
REFERENCES [dbo].[DVT] ([MaDVT])
GO
ALTER TABLE [dbo].[MATHANG] CHECK CONSTRAINT [FK_MATHANG_DVT]
GO
ALTER TABLE [dbo].[PHIEUTHUTIEN]  WITH CHECK ADD FOREIGN KEY([MaDaiLy])
REFERENCES [dbo].[DAILY] ([MaDaiLy])
GO
ALTER TABLE [dbo].[BAOCAOCONGNO]  WITH CHECK ADD  CONSTRAINT [CK_BAOCAOCONGNO_Nam] CHECK  (([Nam]>=(0)))
GO
ALTER TABLE [dbo].[BAOCAOCONGNO] CHECK CONSTRAINT [CK_BAOCAOCONGNO_Nam]
GO
ALTER TABLE [dbo].[BAOCAOCONGNO]  WITH CHECK ADD  CONSTRAINT [CK_BAOCAOCONGNO_Thang] CHECK  (([Thang]>=(1) AND [Thang]<=(12)))
GO
ALTER TABLE [dbo].[BAOCAOCONGNO] CHECK CONSTRAINT [CK_BAOCAOCONGNO_Thang]
GO
ALTER TABLE [dbo].[BAOCAODOANHSO]  WITH CHECK ADD  CONSTRAINT [CHK_Nam] CHECK  (([Nam]>=(0)))
GO
ALTER TABLE [dbo].[BAOCAODOANHSO] CHECK CONSTRAINT [CHK_Nam]
GO
ALTER TABLE [dbo].[BAOCAODOANHSO]  WITH CHECK ADD  CONSTRAINT [CHK_Thang] CHECK  (([Thang]>=(1) AND [Thang]<=(12)))
GO
ALTER TABLE [dbo].[BAOCAODOANHSO] CHECK CONSTRAINT [CHK_Thang]
GO
ALTER TABLE [dbo].[BAOCAODOANHSO]  WITH CHECK ADD  CONSTRAINT [CHK_TongDoanhThu] CHECK  (([TongDoanhThu]>=(0)))
GO
ALTER TABLE [dbo].[BAOCAODOANHSO] CHECK CONSTRAINT [CHK_TongDoanhThu]
GO
ALTER TABLE [dbo].[CT_BCDOANHSO]  WITH CHECK ADD  CONSTRAINT [CHK_SoLuongPhieuXuat] CHECK  (([SoLuongPhieuXuat]>=(0)))
GO
ALTER TABLE [dbo].[CT_BCDOANHSO] CHECK CONSTRAINT [CHK_SoLuongPhieuXuat]
GO
ALTER TABLE [dbo].[CT_BCDOANHSO]  WITH CHECK ADD  CONSTRAINT [CHK_TiLe] CHECK  (([TiLe]>=(0) AND [TiLe]<=(1)))
GO
ALTER TABLE [dbo].[CT_BCDOANHSO] CHECK CONSTRAINT [CHK_TiLe]
GO
ALTER TABLE [dbo].[CT_BCDOANHSO]  WITH CHECK ADD  CONSTRAINT [CHK_TongTriGia] CHECK  (([TongTriGia]>=(0)))
GO
ALTER TABLE [dbo].[CT_BCDOANHSO] CHECK CONSTRAINT [CHK_TongTriGia]
GO
ALTER TABLE [dbo].[CT_PXH]  WITH CHECK ADD  CONSTRAINT [ck_SlXuat] CHECK  (([CT_PXH].[SoLuongXuat]>=(0)))
GO
ALTER TABLE [dbo].[CT_PXH] CHECK CONSTRAINT [ck_SlXuat]
GO
ALTER TABLE [dbo].[DAILY]  WITH CHECK ADD  CONSTRAINT [CHK_DLSDT] CHECK  ((len([DienThoai])=(10)))
GO
ALTER TABLE [dbo].[DAILY] CHECK CONSTRAINT [CHK_DLSDT]
GO
ALTER TABLE [dbo].[MATHANG]  WITH CHECK ADD  CONSTRAINT [CK_MATHANG_SoLuongton] CHECK  (([SoLuongTon]>=(0)))
GO
ALTER TABLE [dbo].[MATHANG] CHECK CONSTRAINT [CK_MATHANG_SoLuongton]
GO
/****** Object:  StoredProcedure [dbo].[BCDS_month]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BCDS_month]
    @Thang INT,
    @Nam INT
AS
BEGIN
    DECLARE @SoLuongPhieuXuat INT, @TongTriGia FLOAT;

    SELECT 
        ROW_NUMBER() OVER (ORDER BY PX.MaDaiLy) AS 'STT',
        PX.MaDaiLy,
        COUNT(*) AS 'Số Phiếu Xuất',
        SUM(CTPX.ThanhTien) AS 'Tổng trị giá',
        100.0 AS 'Tỉ Lệ'
    FROM 
        PHIEUXUATHANG PX
        JOIN CT_PXH CTPX ON PX.SoPhieuXuat = CTPX.SoPhieuXuat
    WHERE 
        MONTH(PX.NgayXuatHang) = @Thang AND YEAR(PX.NgayXuatHang) = @Nam  
	GROUP BY 
        PX.MaDaiLy
END
GO
/****** Object:  StoredProcedure [dbo].[datagridview_loaidaily]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[datagridview_loaidaily]
AS
BEGIN
	select MaLoaiDaiLy,TenLoaiDaiLy,SoNoToiDa
	from LOAIDAILY
END
GO
/****** Object:  StoredProcedure [dbo].[datagridview_Quan]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------
create procedure [dbo].[datagridview_Quan]
as
begin
	select MaQuan,TenQuan
	from QUAN
end
GO
/****** Object:  StoredProcedure [dbo].[delete_ct_pxh]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_ct_pxh]
@SoPhieuXuat varchar(10),
@MaMatHangXuat varchar(10)
as
begin
	delete CT_PXH
	where
	SoPhieuXuat =@SoPhieuXuat and MaMatHangXuat =@MaMatHangXuat
end
GO
/****** Object:  StoredProcedure [dbo].[Delete_DAILY]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Delete_DAILY]
	@MaDaiLy varchar(10)
as
begin
	delete from DAILY where @MaDaiLy = MaDaiLy
end;
GO
/****** Object:  StoredProcedure [dbo].[Delete_Info_PNH]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delete_Info_PNH]
	@SoPhieuNhap VARCHAR(10)
AS
BEGIN
	DELETE CT_PNH
	WHERE SoPhieuNhap = @SoPhieuNhap
    DELETE PHIEUNHAPHANG
	WHERE SoPhieuNhap = @SoPhieuNhap
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_Info_PTT]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------
CREATE PROCEDURE [dbo].[Delete_Info_PTT]
	@SoPhieuThu VARCHAR(10)
AS
BEGIN
	DELETE FROM PHIEUTHUTIEN 
	WHERE @SoPhieuThu = SoPhieuThu
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_Info_PXH]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Delete_Info_PXH]
	@SoPhieuXuat VARCHAR(10)
AS
BEGIN
	DELETE CT_PXH
	WHERE SoPhieuXuat = @SoPhieuXuat
    DELETE PHIEUXUATHANG
	WHERE SoPhieuXuat = @SoPhieuXuat
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_LoaiDaiLy]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Delete_LoaiDaiLy]
@MaLoaiDaiLy varchar(10)
AS
BEGIN
	DELETE FROM LOAIDAILY
	WHERE MaLoaiDaiLy = @MaLoaiDaiLy 
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_Quan]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delete_Quan]
@MaQuan varchar(10)
AS
BEGIN
	DELETE FROM QUAN
	WHERE MaQuan = @MaQuan 
END
GO
/****** Object:  StoredProcedure [dbo].[deletePXH]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[deletePXH]
@SoPhieuXuat varchar(10)
as
begin
	delete CT_PXH
	where SoPhieuXuat = @SoPhieuXuat

	delete PHIEUXUATHANG
	where SoPhieuXuat = @SoPhieuXuat


end
GO
/****** Object:  StoredProcedure [dbo].[Insert_DaiLy]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insert_DaiLy]
	@TenDaiLy varchar(10),
	@MaLoaiDaiLy varchar(10),
	@DienThoai varchar(10),
	@DiaChi varchar(200),
	@Email varchar(40),
	@MaQuan varchar(10),
	@NgayTiepNhan date,
	@TongNo money
as
begin
	insert into DAILY(TenDaiLy,MaLoaiDaiLy, DienThoai, DiaChi, Email, MaQuan, NgayTiepNhan, TongNo)
	values
	(@TenDaiLy, @MaLoaiDaiLy, @DienThoai, @DiaChi, @Email, @MaQuan, @NgayTiepNhan, @TongNo);
end;
GO
/****** Object:  StoredProcedure [dbo].[Insert_LoaiDaiLy]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Insert_LoaiDaiLy]
@MaLoaiDaiLy varchar(10),
@TenLoaiDaiLy varchar(100),
@SoNoToiDa money
AS
BEGIN
	INSERT INTO LOAIDAILY(MaLoaiDaiLy,TenLoaiDaiLy,SoNoToiDa) values (@MaLoaiDaiLy, @TenLoaiDaiLy, @SoNoToiDa)
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_PNH]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_PNH]
    @SoPhieuNhap VARCHAR(10),
    @MaMatHang VARCHAR(50),
    @SoLuongNhap BIGINT,
    @DonGiaNhap MONEY,
	@NgayNhapHang DATE,
    @MaDVT VARCHAR(10)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM PHIEUNHAPHANG WHERE SoPhieuNhap = @SoPhieuNhap)
    BEGIN
        INSERT INTO PHIEUNHAPHANG (SoPhieuNhap, NgayNhapHang)
        VALUES (@SoPhieuNhap, @NgayNhapHang)
    END

	IF NOT EXISTS (SELECT * FROM MATHANG WHERE MaMatHang = @MaMatHang)
    BEGIN
        INSERT INTO MATHANG (MaMatHang, MaDVT)
        VALUES (@MaMatHang, @MaDVT)
    END

    IF NOT EXISTS (SELECT * FROM CT_PNH WHERE SoPhieuNhap = @SoPhieuNhap AND MaMatHang = @MaMatHang)
    BEGIN
        INSERT INTO CT_PNH (SoPhieuNhap, MaMatHang, SoLuongNhap, DonGiaNhap)
        VALUES (@SoPhieuNhap, @MaMatHang, @SoLuongNhap, @DonGiaNhap)
    END
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_PXH]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Insert_PXH]
    @SoPhieuXuat VARCHAR(10),
	@MaDaiLy VARCHAR(10),
	@NgayXuatHang DATE,
	@TongTien money,
	@SoTienTra money
AS
BEGIN
    Insert into PHIEUXUATHANG(SoPhieuXuat,MaDaiLy,NgayXuatHang,TongTien,SoTienTra)
	values (@SoPhieuXuat,@MaDaiLy,@NgayXuatHang,@TongTien,@SoTienTra);
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_TenQuan]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Insert_TenQuan]
@MaQuan varchar(10),
@TenQuan varchar(100)
AS
BEGIN
	INSERT INTO QUAN(MaQuan,TenQuan) values (@MaQuan, @TenQuan)
END
GO
/****** Object:  StoredProcedure [dbo].[load_Quan]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------

CREATE PROCEDURE [dbo].[load_Quan]
AS
BEGIN
	SELECT MaQuan,TenQuan
	from QUAN	
END
GO
/****** Object:  StoredProcedure [dbo].[Search_All_PNH]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Search_All_PNH]
	@SoPhieuNhap VARCHAR(10)
AS
BEGIN
    SELECT *
    FROM PHIEUNHAPHANG
END
GO
/****** Object:  StoredProcedure [dbo].[Search_All_PTT]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------
CREATE PROCEDURE [dbo].[Search_All_PTT]
	@SoPhieuThu VARCHAR(10)
AS
BEGIN
	SELECT SoPhieuThu, MaDaiLy, NgayThuTien, SoTienTHu
	FROM PHIEUTHUTIEN
END
GO
/****** Object:  StoredProcedure [dbo].[Search_All_PXH]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Search_All_PXH]
	@SoPhieuXuat VARCHAR(10)
AS
BEGIN
    SELECT SoPhieuXuat, NgayXuatHang, TongTien, MaDaiLy
    FROM PHIEUXUATHANG
END
GO
/****** Object:  StoredProcedure [dbo].[Search_CT_PNH]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Search_CT_PNH]
	@SoPhieuNhap VARCHAR(10),
	@MaMatHang VARCHAR(50)
AS
BEGIN
	SELECT CT_PNH.SoPhieuNhap, CT_PNH.MaMatHang, SoLuongNhap, DonGiaNhap, ThanhTien, MATHANG.MaDVT as 'Mã đơn vị tính', TenDVT 'Tên đơn vị tính'
    FROM CT_PNH
	JOIN MATHANG on MATHANG.MaMatHang = CT_PNH.MaMatHang
	JOIN DVT on DVT.MaDVT = MATHANG.MaDVT
	WHERE SoPhieuNhap = @SoPhieuNhap and CT_PNH.MaMatHang = @MaMatHang
END
GO
/****** Object:  StoredProcedure [dbo].[Search_CT_PNH_All]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------
CREATE PROCEDURE [dbo].[Search_CT_PNH_All]
	@SoPhieuNhap VARCHAR(10)
AS
BEGIN
	SELECT CT_PNH.SoPhieuNhap, CT_PNH.MaMatHang, SoLuongNhap, DonGiaNhap, ThanhTien, MATHANG.MaDVT as 'Mã đơn vị tính', TenDVT 'Tên đơn vị tính'
    FROM CT_PNH
	JOIN MATHANG on MATHANG.MaMatHang = CT_PNH.MaMatHang
	JOIN DVT on DVT.MaDVT = MATHANG.MaDVT
END
GO
/****** Object:  StoredProcedure [dbo].[Search_CT_PXH]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Search_CT_PXH]
	@SoPhieuXuat VARCHAR(10),
	@MaMatHangXuat VARCHAR(50)
AS 
BEGIN
	SELECT SoPhieuXuat, MaMatHangXuat, SoLuongXuat, DonGiaXuat, ThanhTien
	FROM CT_PXH
	WHERE SoPhieuXuat = @SoPhieuXuat And @MaMatHangXuat = MaMatHangXuat
END
GO
/****** Object:  StoredProcedure [dbo].[Search_CT_PXH_All]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Search_CT_PXH_All] 
AS 
BEGIN
	SELECT SoPhieuXuat, MaMatHangXuat, SoLuongXuat, DonGiaXuat, ThanhTien
	FROM CT_PXH
END
GO
/****** Object:  StoredProcedure [dbo].[Search_Info_PNH]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------
CREATE PROCEDURE [dbo].[Search_Info_PNH]
	@SoPhieuNhap VARCHAR(10)
AS
BEGIN
    SELECT *
    FROM PHIEUNHAPHANG
	WHERE SoPhieuNhap = @SoPhieuNhap
END
GO
/****** Object:  StoredProcedure [dbo].[Search_Info_PTT]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Search_Info_PTT]
	@SoPhieuThu VARCHAR(10)
AS
BEGIN
	SELECT SoPhieuThu, MaDaiLy, NgayThuTien, SoTienTHu
	FROM PHIEUTHUTIEN
	WHERE 	@SoPhieuThu = SoPhieuThu
END
GO
/****** Object:  StoredProcedure [dbo].[Search_Info_PXH]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Search_Info_PXH]
	@SoPhieuXuat VARCHAR(10)
AS
BEGIN
    SELECT SoPhieuXuat, NgayXuatHang, TongTien, MaDaiLy
    FROM PHIEUXUATHANG
	WHERE @SoPhieuXuat = SoPhieuXuat		
END
GO
/****** Object:  StoredProcedure [dbo].[Search_LoaiDaiLy]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Search_LoaiDaiLy]
@MaLoaiDaiLy varchar(10)
AS
BEGIN
	SELECT MaLoaiDaiLy,TenLoaiDaiLy,SoNoToiDa
	from LOAIDAILY
END
GO
/****** Object:  StoredProcedure [dbo].[tongthanhtien]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[tongthanhtien]
@SoPhieuXuat varchar(10)
as
begin
	select SUM( ThanhTien) as ketqua
	from CT_PXH
	where
	SoPhieuXuat =@SoPhieuXuat
end
GO
/****** Object:  StoredProcedure [dbo].[Update_CT_PNH_DGN]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------
CREATE PROCEDURE [dbo].[Update_CT_PNH_DGN]
	@SoPhieuNhap VARCHAR(10),
	@MaMatHang VARCHAR(50),
	@DonGiaNhap MONEY
AS
BEGIN
	UPDATE CT_PNH
	SET DonGiaNhap = @DonGiaNhap
	WHERE SoPhieuNhap = @SoPhieuNhap and MaMatHang = @MaMatHang
END
GO
/****** Object:  StoredProcedure [dbo].[Update_CT_PNH_DVT]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_CT_PNH_DVT]
	@SoPhieuNhap VARCHAR(10),
	@MaMatHang VARCHAR(50),
	@MaDVT VARCHAR(10)
AS
BEGIN
	UPDATE MATHANG
	SET MaDVT = @MaDVT
	WHERE MaMatHang = @MaMatHang
END
GO
/****** Object:  StoredProcedure [dbo].[Update_CT_PNH_SLN]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_CT_PNH_SLN]
	@SoPhieuNhap VARCHAR(10),
	@MaMatHang VARCHAR(50),
	@SoLuongNhap BIGINT
AS
BEGIN
	UPDATE CT_PNH
	SET SoLuongNhap = @SoLuongNhap
	WHERE SoPhieuNhap = @SoPhieuNhap and MaMatHang = @MaMatHang
END
-------------
GO
/****** Object:  StoredProcedure [dbo].[Update_CT_PXH_DGX]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Update_CT_PXH_DGX]
	@SoPhieuXuat VARCHAR(10),
	@MaMatHangXuat VARCHAR(50),
	@DonGiaXuat Money
AS
BEGIN
	UPDATE CT_PXH
	SET DonGiaXuat = @DonGiaXuat 
	WHERE SoPhieuXuat = @SoPhieuXuat and MaMatHangXuat = @MaMatHangXuat
END
GO
/****** Object:  StoredProcedure [dbo].[Update_CT_PXH_SLX]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Update_CT_PXH_SLX]
	@SoPhieuXuat VARCHAR(10),
	@MaMatHangXuat VARCHAR(50),
	@SoLuongXuat BIGINT
AS
BEGIN
	UPDATE CT_PXH
	SET SoLuongXuat = @SoLuongXuat
	WHERE SoPhieuXuat = @SoPhieuXuat and MaMatHangXuat = @MaMatHangXuat
END
GO
/****** Object:  StoredProcedure [dbo].[Update_DAILY]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Update_DAILY]
@MaDaiLy varchar(10),
@TenDaiLy varchar(200),
@MaLoaiDaiLy varchar(10),
@DienThoai varchar(10),
@Email varchar(255),
@MaQuan varchar(10)
as
begin
	update DAILY
	set		TenDaiLy = @TenDaiLy,
			MaLoaiDaiLy = @MaLoaiDaiLy,
			DienThoai = @DienThoai,
			Email = @Email,
			MaQuan = @MaQuan
	where MaDaiLy = @MaDaiLy
end;
GO
/****** Object:  StoredProcedure [dbo].[Update_LoaiDaiLy_SoNoToiDa]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_LoaiDaiLy_SoNoToiDa]
	@MaLoaiDaiLy varchar(10),
	@SoNoToiDa money
AS 
BEGIN 
	UPDATE LOAIDAILY
	SET SoNoToiDa = @SoNoToiDa
	where MaLoaiDaiLy = @MaLoaiDaiLy
END
GO
/****** Object:  StoredProcedure [dbo].[Update_LoaiDaiLy_Ten]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_LoaiDaiLy_Ten]
	@MaLoaiDaiLy VARCHAR(10),
	@TenLoaiDaiLy VARCHAR(100)
AS 
BEGIN 
	UPDATE LOAIDAILY
	SET TenLoaiDaiLy = @TenLoaiDaiLy
	where MaLoaiDaiLy = @MaLoaiDaiLy
END
GO
/****** Object:  StoredProcedure [dbo].[Update_PTT_STT]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_PTT_STT]
	@SoPhieuThu VARCHAR(10),
	@MaDaiLy VARCHAR(10),
	@SoTienThu Money
AS 
BEGIN 
	UPDATE PHIEUTHUTIEN
	SET SoTienThu = @SoTienThu
	where SoPhieuThu = @SoPhieuThu and MaDaiLy = @MaDaiLy
END
--------
GO
/****** Object:  StoredProcedure [dbo].[Update_TenQuan]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_TenQuan]
	@MaQuan varchar(10),
	@TenQuan varchar(100)
AS 
BEGIN 
	UPDATE QUAN
	SET TenQuan = @TenQuan
	where MaQuan = @MaQuan
END
GO
/****** Object:  StoredProcedure [dbo].[updatePXH]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updatePXH]
@SoPhieuXuat varchar(10),
@SoTienTra money
as
begin
	update PHIEUXUATHANG
	set SoTienTra = @SoTienTra
	where SoPhieuXuat =@SoPhieuXuat
end
GO
/****** Object:  StoredProcedure [dbo].[Useraccount_Login]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------
create proc [dbo].[Useraccount_Login]
	@Username varchar(50),
	@Password varchar(50)
as
begin
	select * from USERACCOUNT where Username = @Username and Password = @Password
end;
GO
/****** Object:  StoredProcedure [dbo].[USP_AddCongNo]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_AddCongNo]
    @MaDaiLy varchar(10),
    @Thang int,
    @Nam int,
    @NoDau money,
    @PhatSinh money,
    @ErrorMessage NVARCHAR(1000) OUTPUT
AS
BEGIN
    IF EXISTS(
        SELECT * FROM BAOCAOCONGNO
        WHERE MaDaiLy = @MaDaiLy
            and Thang = @Thang
            and Nam = @Nam)
    BEGIN
        SET @ErrorMessage = 'Da ton tai phieu ghi no cung thang, nam cua cong ty nay';
        RETURN; -- Kết thúc procedure
    END
    
    INSERT INTO BAOCAOCONGNO (MaDaiLy, Thang, Nam, NoDau, PhatSinh)
    VALUES (@MaDaiLy, @Thang, @Nam, @NoDau, @PhatSinh)

    SET @ErrorMessage = NULL;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteDVT]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------
create procedure [dbo].[USP_DeleteDVT]
@MaDVT varchar(10)
as
begin
	delete DVT
	where MaDVT = @MaDVT
end
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteLoaiDaiLy]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[USP_DeleteLoaiDaiLy]
@MaLoaiDaiLy varchar(10)
as
begin
	delete LOAIDAILY
	where MaLoaiDaiLy = @MaLoaiDaiLy
end
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteMatHang]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[USP_DeleteMatHang]
@MaMatHang varchar(10)
as
begin
	delete MATHANG
	where MaMatHang = @MaMatHang
end
GO
/****** Object:  StoredProcedure [dbo].[USP_FindDaiLy]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_FindDaiLy]
	@DienThoai varchar(10)
as
begin
	SELECT TenDaiLy,TenLoaiDaiLy, DienThoai, DiaChi,Email,TenQuan,NgayTiepNhan, TongNo
    FROM DAILY inner join QUAN ON DAILY.MaQuan = QUAN.MaQuan
	INNER JOIN LOAIDAILY ON DAILY.MaLoaiDaiLy = LOAIDAILY.MaLoaiDaiLy
	where @DienThoai = DienThoai
end;
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllTenLoaiDaiLy]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetAllTenLoaiDaiLy]
as
begin
	select TenLoaiDaiLy
	from LOAIDAILY
end;
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllTenQuan]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetAllTenQuan]
as
begin
	select TenQuan
	from QUAN
end;
GO
/****** Object:  StoredProcedure [dbo].[USP_GetCongNoInfo]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetCongNoInfo]
@Thang int,
@Nam int
AS
BEGIN
    SELECT TenDaiLy, NoDau, PhatSinh, NoCuoi
    FROM DAILY inner join BAOCAOCONGNO ON DAILY.MaDaiLy = BAOCAOCONGNO.MaDaiLy
	WHERE BAOCAOCONGNO.Thang = @Thang AND BAOCAOCONGNO.Nam = @Nam
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_GetDaiLyInfo]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetDaiLyInfo]
as
begin
	SELECT MaDaiLy, TenDaiLy,MaLoaiDaiLy, DienThoai, DiaChi,Email,MaQuan,NgayTiepNhan, TongNo
    FROM DAILY
end;
GO
/****** Object:  StoredProcedure [dbo].[USP_GetLoaiDaiLy]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------
CREATE proc [dbo].[USP_GetLoaiDaiLy]
as
begin
	select MaLoaiDaiLy
	from LOAIDAILY
end;
GO
/****** Object:  StoredProcedure [dbo].[USP_GetMaDVT]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetMaDVT]
as
begin
	select MaDVT
	from DVT
end;
GO
/****** Object:  StoredProcedure [dbo].[USP_GetMaMatHang]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetMaMatHang]
as
begin
	select MaMatHang
	from MATHANG
end;
GO
/****** Object:  StoredProcedure [dbo].[USP_GetMaQuan]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetMaQuan]
as
begin
	select MaQuan
	from QUAN
end;
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTenDaiLy]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetTenDaiLy]
    @MaDaiLy varchar(10)
AS
BEGIN
    SELECT TenDaiLy FROM DAILY
	WHERE MaDaiLy = @MaDaiLy
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_insert_CT_PXH]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[USP_insert_CT_PXH]
@SoPhieuXuat varchar(10),
@MaMatHangXuat varchar(10),
@SoLuongXuat int,
@DonGiaXuat money,
@ThanhTien money
as
begin
	insert into CT_PXH(SoPhieuXuat,MaMatHangXuat,SoLuongXuat,DonGiaXuat,ThanhTien)
	values(@SoPhieuXuat,@MaMatHangXuat,@SoLuongXuat,@DonGiaXuat,@ThanhTien)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_PHIEUXUATHANG_BAOCAOCONGNO]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[USP_PHIEUXUATHANG_BAOCAOCONGNO]
@MaDaiLy varchar(10),
@ThoiGian datetime,
@ThayDoiConLai money
AS
BEGIN
	Declare @Thang Int ;Set @Thang = month(@ThoiGian);
	Declare @Nam Int; Set @Nam = year(@ThoiGian);

	IF(@MaDaiLy is null)
		return;

	If(@ThayDoiConLai is null)
	begin
		set @ThayDoiConLai = 0
	end

	IF(Exists (select * from BAOCAOCONGNO where MaDaiLy = @MaDaiLy and Nam =  @Nam and Thang = @Thang))
	Begin
		Update BAOCAOCONGNO
		set PhatSinh += @ThayDoiConLai
		Where MaDaiLy = @MaDaiLy and Nam =  @Nam and Thang = @Thang;
	end
	Else
	Begin
		Insert Into BAOCAOCONGNO(MaDaiLy,Thang,Nam,PhatSinh)
		values (@MaDaiLy,@Thang,@Nam,@ThayDoiConLai);
	end
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateDVT]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[USP_UpdateDVT]
@MaDVT varchar(10),
@TenDVT varchar(100)
as
begin
	Update DVT
	set TenDVT =@TenDVT
	where MaDVT = @MaDVT
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateLoaiDaiLy]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[USP_UpdateLoaiDaiLy]
@MaLoaiDaiLy varchar(10),
@TenLoaiDaiLy varchar(100),
@SoNoToiDa money
as
begin
	Update LOAIDAILY
	Set
		TenLoaiDaiLy = @TenLoaiDaiLy,
		SoNoToiDa = @SoNoToiDa
	Where
		MaLoaiDaiLy  = @MaLoaiDaiLy
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateMatHang]    Script Date: 5/26/2024 2:11:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[USP_UpdateMatHang]
@MaMatHang varchar(10),
@TenMatHang varchar(100),
@MaDVT varchar(10),
@SoLuongTon int
as
begin

	if(@MaDVT = 'null')
		Set @MaDVT = null;
	
	Update MATHANG
	Set
		TenMatHang = @TenMatHang,
		MaDVT = @MaDVT,
		SoLuongTon = @SoLuongTon
	Where
		MaMatHang  = @MaMatHang
end
GO
USE [master]
GO
ALTER DATABASE [QUANLYDAILY] SET  READ_WRITE 
GO
