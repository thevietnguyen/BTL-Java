USE [master]
GO
/****** Object:  Database [QLKQHocTap]    Script Date: 6/10/2024 1:18:13 AM ******/
CREATE DATABASE [QLKQHocTap]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLKQHocTap', FILENAME = N'D:\DuLieu\QLKQHocTap.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLKQHocTap_log', FILENAME = N'D:\DuLieu\QLKQHocTap_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLKQHocTap] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLKQHocTap].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLKQHocTap] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLKQHocTap] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLKQHocTap] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLKQHocTap] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLKQHocTap] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLKQHocTap] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLKQHocTap] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLKQHocTap] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLKQHocTap] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLKQHocTap] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLKQHocTap] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLKQHocTap] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLKQHocTap] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLKQHocTap] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLKQHocTap] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLKQHocTap] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLKQHocTap] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLKQHocTap] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLKQHocTap] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLKQHocTap] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLKQHocTap] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLKQHocTap] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLKQHocTap] SET RECOVERY FULL 
GO
ALTER DATABASE [QLKQHocTap] SET  MULTI_USER 
GO
ALTER DATABASE [QLKQHocTap] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLKQHocTap] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLKQHocTap] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLKQHocTap] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLKQHocTap] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLKQHocTap] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLKQHocTap', N'ON'
GO
ALTER DATABASE [QLKQHocTap] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLKQHocTap] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLKQHocTap]
GO
/****** Object:  Table [dbo].[BangDiem]    Script Date: 6/10/2024 1:18:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BangDiem](
	[MaMonHoc] [nchar](10) NOT NULL,
	[MaSinhVien] [nchar](10) NOT NULL,
	[DiemTX1] [nchar](10) NULL,
	[DiemTX2] [nchar](10) NULL,
	[DiemGiuaKy] [nchar](10) NULL,
	[DiemCuoiKy] [nchar](10) NULL,
	[Diem10] [nchar](10) NULL,
	[Diem4] [nchar](10) NULL,
	[DiemChu] [nchar](10) NULL,
	[XepLoai] [nvarchar](20) NULL,
 CONSTRAINT [PK_BangDiem] PRIMARY KEY CLUSTERED 
(
	[MaMonHoc] ASC,
	[MaSinhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietLopHoc]    Script Date: 6/10/2024 1:18:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietLopHoc](
	[MaLopHoc] [nchar](50) NOT NULL,
	[MaSinhVien] [nchar](10) NOT NULL,
 CONSTRAINT [PK_ChiTietLopHoc_1] PRIMARY KEY CLUSTERED 
(
	[MaLopHoc] ASC,
	[MaSinhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiangVien]    Script Date: 6/10/2024 1:18:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiangVien](
	[MaGiangVien] [nchar](10) NOT NULL,
	[TenTaiKhoan] [nchar](10) NOT NULL,
	[TenGiangVien] [nvarchar](50) NULL,
	[SDT] [nchar](10) NULL,
	[Khoa] [nvarchar](50) NULL,
 CONSTRAINT [PK_GiangVien] PRIMARY KEY CLUSTERED 
(
	[MaGiangVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LopHoc]    Script Date: 6/10/2024 1:18:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LopHoc](
	[MaLopHoc] [nchar](50) NOT NULL,
	[SiSo] [int] NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL,
	[MaMonHoc] [nchar](10) NOT NULL,
	[MaGiangVien] [nchar](10) NOT NULL,
 CONSTRAINT [PK_LopHoc] PRIMARY KEY CLUSTERED 
(
	[MaLopHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 6/10/2024 1:18:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[MaMonHoc] [nchar](10) NOT NULL,
	[TenMon] [nvarchar](200) NULL,
	[SoTin] [int] NULL,
	[Khoa] [nchar](50) NULL,
	[HeSoTX1] [float] NULL,
	[HeSoTX2] [float] NULL,
	[HeSoGiuaKy] [float] NULL,
	[HeSoCuoiKy] [float] NULL,
 CONSTRAINT [PK_MonHoc] PRIMARY KEY CLUSTERED 
(
	[MaMonHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 6/10/2024 1:18:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MaSinhVien] [nchar](10) NOT NULL,
	[TenSinhVien] [nvarchar](50) NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[MaSinhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 6/10/2024 1:18:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenTaiKhoan] [nchar](10) NOT NULL,
	[MatKhau] [nchar](50) NULL,
 CONSTRAINT [PK_TaiKhoan_1] PRIMARY KEY CLUSTERED 
(
	[TenTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600001', N'6.5       ', N'6.5       ', NULL, N'8.2       ', N'7.5       ', N'3.0       ', N'B         ', N'Khá')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600006', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600007', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600011', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600012', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600013', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600015', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600016', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600018', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600019', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600021', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600024', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600025', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600026', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600027', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600028', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600029', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600030', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600031', N'7.0       ', N'7.5       ', NULL, N'8.2       ', N'7.8       ', N'3.0       ', N'B         ', N'Khá')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600032', N'8.5       ', N'8.0       ', NULL, N'8.4       ', N'8.4       ', N'3.5       ', N'B+        ', N'Khá giỏi')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600033', N'6.5       ', N'7.5       ', NULL, N'9.0       ', N'8.2       ', N'3.5       ', N'B+        ', N'Khá giỏi')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600034', N'9.0       ', N'8.5       ', NULL, N'9.6       ', N'9.3       ', N'4.0       ', N'A         ', N'Giỏi')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600035', N'10.0      ', N'9.5       ', NULL, N'9.8       ', N'9.8       ', N'4.0       ', N'A         ', N'Giỏi')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600036', N'5.5       ', N'6.0       ', NULL, N'7.6       ', N'6.9       ', N'2.5       ', N'C+        ', N'TB khá')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600037', N'8.5       ', N'7.5       ', NULL, N'8.8       ', N'8.5       ', N'4.0       ', N'A         ', N'Giỏi')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600038', N'6.5       ', N'6.5       ', NULL, N'7.0       ', N'6.8       ', N'2.5       ', N'C+        ', N'TB khá')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600039', N'7.5       ', N'8.0       ', NULL, N'8.2       ', N'8.0       ', N'3.5       ', N'B+        ', N'Khá giỏi')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600040', N'7.0       ', N'7.5       ', NULL, N'8.0       ', N'7.7       ', N'3.0       ', N'B         ', N'Khá')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600041', N'5.0       ', N'4.5       ', NULL, N'5.5       ', N'5.2       ', N'1.5       ', N'D+        ', N'TB yếu')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600042', N'3.5       ', N'4.5       ', NULL, N'3.0       ', N'3.4       ', N'0.0       ', N'F         ', N'Kém')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600043', N'5.5       ', N'6.5       ', NULL, N'7.8       ', N'7.1       ', N'3.0       ', N'B         ', N'Khá')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600044', N'3.0       ', N'3.5       ', NULL, N'5.0       ', N'4.3       ', N'1.0       ', N'D         ', N'Yếu')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600045', N'8.5       ', N'8.0       ', NULL, N'9.0       ', N'8.7       ', N'4.0       ', N'A         ', N'Giỏi')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600046', N'10.0      ', N'8.5       ', NULL, N'9.2       ', N'9.2       ', N'4.0       ', N'A         ', N'Giỏi')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600047', N'5.5       ', N'6.5       ', NULL, N'7.0       ', N'6.6       ', N'2.5       ', N'C+        ', N'TB khá')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600048', N'1.0       ', N'1.0       ', NULL, N'0.0       ', N'0.4       ', N'0.0       ', N'F         ', N'Kém')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600049', N'7.5       ', N'8.0       ', NULL, N'8.4       ', N'8.1       ', N'3.5       ', N'B+        ', N'Khá giỏi')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600050', N'8.5       ', N'8.5       ', NULL, N'9.0       ', N'8.8       ', N'4.0       ', N'A         ', N'Giỏi')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600051', N'7.5       ', N'9.0       ', NULL, N'8.8       ', N'8.6       ', N'4.0       ', N'A         ', N'Giỏi')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600052', N'2.5       ', N'5.5       ', NULL, N'1.0       ', N'2.2       ', N'0.0       ', N'F         ', N'Kém')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600053', N'5.5       ', N'9.0       ', NULL, N'8.8       ', N'8.2       ', N'3.5       ', N'B+        ', N'Khá giỏi')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600054', N'9.0       ', N'9.0       ', NULL, N'9.4       ', N'9.3       ', N'4.0       ', N'A         ', N'Giỏi')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600055', N'10.0      ', N'10.0      ', NULL, N'9.8       ', N'9.9       ', N'4.0       ', N'A         ', N'Giỏi')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600056', N'5.5       ', N'2.5       ', NULL, N'3.0       ', N'3.4       ', N'0.0       ', N'F         ', N'Kém')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600057', N'0.0       ', N'0.0       ', NULL, N'0.0       ', N'0.0       ', N'0.0       ', N'F         ', N'Kém')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600058', N'7.0       ', N'7.5       ', NULL, N'8.8       ', N'8.2       ', N'3.5       ', N'B+        ', N'Khá giỏi')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600059', N'7.5       ', N'8.5       ', NULL, N'8.8       ', N'8.5       ', N'4.0       ', N'A         ', N'Giỏi')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6001    ', N'2021600060', N'5.5       ', N'8.0       ', NULL, N'8.8       ', N'8.0       ', N'3.5       ', N'B+        ', N'Khá giỏi')
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600006', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600007', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600011', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600012', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600013', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600015', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600016', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600018', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600019', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600021', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600024', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600025', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600026', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600027', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600028', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600029', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600030', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600031', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600032', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600033', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600034', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600035', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600036', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600037', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600038', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600039', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600040', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600041', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600042', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600043', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600044', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600045', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600046', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600047', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600048', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600049', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600050', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600051', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600052', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600053', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600054', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600055', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600056', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600057', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600058', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600059', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6002    ', N'2021600060', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6003    ', N'2021600001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6003    ', N'2021600002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6003    ', N'2021600003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6003    ', N'2021600004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6003    ', N'2021600005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6003    ', N'2021600006', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6003    ', N'2021600007', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6003    ', N'2021600008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6003    ', N'2021600009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6003    ', N'2021600010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6003    ', N'2021600040', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6003    ', N'2021600044', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6003    ', N'2021600045', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6003    ', N'2021600048', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6003    ', N'2021600049', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6003    ', N'2021600050', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6003    ', N'2021600051', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6003    ', N'2021600052', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6003    ', N'2021600055', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangDiem] ([MaMonHoc], [MaSinhVien], [DiemTX1], [DiemTX2], [DiemGiuaKy], [DiemCuoiKy], [Diem10], [Diem4], [DiemChu], [XepLoai]) VALUES (N'IT6003    ', N'2021600060', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600001')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600002')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600003')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600004')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600005')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600006')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600007')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600008')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600009')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600010')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600011')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600012')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600013')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600014')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600015')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600016')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600017')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600018')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600019')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600020')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600021')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600022')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600023')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600024')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600025')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600026')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600027')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600028')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600029')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600101                                      ', N'2021600030')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600031')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600032')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600033')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600034')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600035')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600036')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600037')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600038')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600039')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600040')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600041')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600042')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600043')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600044')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600045')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600046')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600047')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600048')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600049')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600050')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600051')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600052')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600053')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600054')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600055')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600056')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600057')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600058')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600059')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600102                                      ', N'2021600060')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600001')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600002')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600003')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600004')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600005')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600006')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600007')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600008')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600009')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600010')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600021')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600022')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600023')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600024')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600025')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600026')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600027')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600028')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600029')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600030')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600041')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600042')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600043')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600044')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600045')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600046')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600047')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600048')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600049')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600201                                      ', N'2021600050')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600011')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600012')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600013')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600014')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600015')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600016')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600017')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600018')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600019')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600020')
GO
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600031')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600032')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600033')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600034')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600035')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600036')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600037')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600038')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600039')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600040')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600051')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600052')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600053')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600054')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600055')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600056')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600057')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600058')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600059')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600202                                      ', N'2021600060')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600301                                      ', N'2021600001')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600301                                      ', N'2021600002')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600301                                      ', N'2021600003')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600301                                      ', N'2021600004')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600301                                      ', N'2021600005')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600301                                      ', N'2021600006')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600301                                      ', N'2021600007')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600301                                      ', N'2021600008')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600301                                      ', N'2021600009')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600301                                      ', N'2021600010')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600301                                      ', N'2021600040')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600301                                      ', N'2021600044')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600301                                      ', N'2021600045')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600301                                      ', N'2021600048')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600301                                      ', N'2021600049')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600301                                      ', N'2021600050')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600301                                      ', N'2021600051')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600301                                      ', N'2021600052')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600301                                      ', N'2021600055')
INSERT [dbo].[ChiTietLopHoc] ([MaLopHoc], [MaSinhVien]) VALUES (N'2024IT600301                                      ', N'2021600060')
GO
INSERT [dbo].[GiangVien] ([MaGiangVien], [TenTaiKhoan], [TenGiangVien], [SDT], [Khoa]) VALUES (N'20001     ', N'20001     ', N'Hoàng Quang Huy', N'0906125656', N'Công nghệ thông tin')
INSERT [dbo].[GiangVien] ([MaGiangVien], [TenTaiKhoan], [TenGiangVien], [SDT], [Khoa]) VALUES (N'20002     ', N'20002     ', N'Hoàng Thị Phương Lan', N'0965782389', N'Ngoại ngữ')
INSERT [dbo].[GiangVien] ([MaGiangVien], [TenTaiKhoan], [TenGiangVien], [SDT], [Khoa]) VALUES (N'20003     ', N'20003     ', N'Vũ Thị Dương', N'0963561235', N'Công nghệ thông tin')
GO
INSERT [dbo].[LopHoc] ([MaLopHoc], [SiSo], [NgayBatDau], [NgayKetThuc], [MaMonHoc], [MaGiangVien]) VALUES (N'2024IT600101                                      ', 30, CAST(N'2024-03-10' AS Date), CAST(N'2024-06-25' AS Date), N'IT6001    ', N'20001     ')
INSERT [dbo].[LopHoc] ([MaLopHoc], [SiSo], [NgayBatDau], [NgayKetThuc], [MaMonHoc], [MaGiangVien]) VALUES (N'2024IT600102                                      ', 30, CAST(N'2024-03-10' AS Date), CAST(N'2024-05-25' AS Date), N'IT6001    ', N'20001     ')
INSERT [dbo].[LopHoc] ([MaLopHoc], [SiSo], [NgayBatDau], [NgayKetThuc], [MaMonHoc], [MaGiangVien]) VALUES (N'2024IT600201                                      ', 30, CAST(N'2024-03-10' AS Date), CAST(N'2024-06-25' AS Date), N'IT6002    ', N'20001     ')
INSERT [dbo].[LopHoc] ([MaLopHoc], [SiSo], [NgayBatDau], [NgayKetThuc], [MaMonHoc], [MaGiangVien]) VALUES (N'2024IT600202                                      ', 30, CAST(N'2024-03-10' AS Date), CAST(N'2024-06-25' AS Date), N'IT6002    ', N'20003     ')
INSERT [dbo].[LopHoc] ([MaLopHoc], [SiSo], [NgayBatDau], [NgayKetThuc], [MaMonHoc], [MaGiangVien]) VALUES (N'2024IT600301                                      ', 20, CAST(N'2024-03-10' AS Date), CAST(N'2024-06-25' AS Date), N'IT6003    ', N'20002     ')
GO
INSERT [dbo].[MonHoc] ([MaMonHoc], [TenMon], [SoTin], [Khoa], [HeSoTX1], [HeSoTX2], [HeSoGiuaKy], [HeSoCuoiKy]) VALUES (N'IT6001    ', N'Lập trình Java', 3, N'Công nghệ thông tin                               ', 20, 20, NULL, 60)
INSERT [dbo].[MonHoc] ([MaMonHoc], [TenMon], [SoTin], [Khoa], [HeSoTX1], [HeSoTX2], [HeSoGiuaKy], [HeSoCuoiKy]) VALUES (N'IT6002    ', N'Lập trình .Net', 3, N'Công nghệ thông tin                               ', 15, 15, NULL, 70)
INSERT [dbo].[MonHoc] ([MaMonHoc], [TenMon], [SoTin], [Khoa], [HeSoTX1], [HeSoTX2], [HeSoGiuaKy], [HeSoCuoiKy]) VALUES (N'IT6003    ', N'Tiếng anh Công nghệ thông tin 1', 5, N'Công nghệ thông tin                               ', 10, 10, 20, 60)
GO
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600001', N'Hà Thị Quỳnh Hương')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600002', N'Nguyễn Đức Khoa')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600003', N'Nguyễn Đắc Kiên')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600004', N'Ngô Duy Long')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600005', N'Nguyễn Thanh Long')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600006', N'Đinh Đức Lương')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600007', N'Nguyễn Tuấn Minh')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600008', N'Đinh Quang Nam')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600009', N'Nguyễn Văn Nam')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600010', N'Triệu Chiều Nam')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600011', N'Trịnh Bá Nguyên')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600012', N'Mẫn Anh Pháp')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600013', N'Trần Mạnh Phú')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600014', N'Hà Xuân Phúc')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600015', N'Nguyễn Nhật Quang')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600016', N'Hoàng Quốc Quý')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600017', N'Nguyễn Hoàng Sơn')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600018', N'Phùng Thái Sơn')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600019', N'Nguyễn Quyết Thắng')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600020', N'Nguyễn Khắc Thành')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600021', N'Ngô Tiến Thành')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600022', N'Trần Văn Thành')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600023', N'Trần Tiến Thịnh')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600024', N'Đào Thu Trang')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600025', N'Đặng Cao Trí')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600026', N'Vi Thị Thanh Trúc')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600027', N'Phạm Xuân Trung')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600028', N'Đào Xuân Trường')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600029', N'Nguyễn Dũng Tuấn')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600030', N'Vũ Long Vũ')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600031', N'Tạ Thị Minh An')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600032', N'Trịnh Lan An')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600033', N'Ngô Thùy Anh')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600034', N'Bùi Hồng Anh')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600035', N'Phạm Thị Ngọc Anh')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600036', N'Lê Thị Thúy Ánh')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600037', N'Hoàng Thị Ngọc Ánh')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600038', N'Nguyễn Thị Bảo Linh')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600039', N'Trần Thị Bích')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600040', N'Hoàng Thị Thanh Bình')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600041', N'Hoàng Quang Chiến')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600042', N'Đỗ Quốc Cường')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600043', N'Vũ Thị Tuyết Dung')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600044', N'Hà Quỳnh Giang')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600045', N'Trần Gia Hân')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600046', N'Hoàng Thị Hiền')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600047', N'Nguyễn Thanh Hiền')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600048', N'Dương Thanh Hoàn')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600049', N'Đào Thanh Hương')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600050', N'Phạm Thị Linh')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600051', N'Hoàng Thị Quỳnh Hương')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600052', N'Mai Thu Huyền')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600053', N'Phạm Như Lệ')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600054', N'Nguyễn Lương Diệu Linh')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600055', N'Trần Khánh Linh')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600056', N'Trần Thị Linh')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600057', N'
Bùi Thị Loan
')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600058', N'Vũ Văn Út')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600059', N'Nguyễn Thế Việt')
INSERT [dbo].[SinhVien] ([MaSinhVien], [TenSinhVien]) VALUES (N'2021600060', N'Nguyễn Thị Yến')
GO
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau]) VALUES (N'20001     ', N'huy123                                           ')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau]) VALUES (N'20002     ', N'lan123                                            ')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau]) VALUES (N'20003     ', N'duong123                                          ')
GO
ALTER TABLE [dbo].[BangDiem]  WITH CHECK ADD  CONSTRAINT [FK_BangDiem_MonHoc] FOREIGN KEY([MaMonHoc])
REFERENCES [dbo].[MonHoc] ([MaMonHoc])
GO
ALTER TABLE [dbo].[BangDiem] CHECK CONSTRAINT [FK_BangDiem_MonHoc]
GO
ALTER TABLE [dbo].[BangDiem]  WITH CHECK ADD  CONSTRAINT [FK_BangDiem_SinhVien] FOREIGN KEY([MaSinhVien])
REFERENCES [dbo].[SinhVien] ([MaSinhVien])
GO
ALTER TABLE [dbo].[BangDiem] CHECK CONSTRAINT [FK_BangDiem_SinhVien]
GO
ALTER TABLE [dbo].[ChiTietLopHoc]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietLopHoc_LopHoc] FOREIGN KEY([MaLopHoc])
REFERENCES [dbo].[LopHoc] ([MaLopHoc])
GO
ALTER TABLE [dbo].[ChiTietLopHoc] CHECK CONSTRAINT [FK_ChiTietLopHoc_LopHoc]
GO
ALTER TABLE [dbo].[ChiTietLopHoc]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietLopHoc_SinhVien] FOREIGN KEY([MaSinhVien])
REFERENCES [dbo].[SinhVien] ([MaSinhVien])
GO
ALTER TABLE [dbo].[ChiTietLopHoc] CHECK CONSTRAINT [FK_ChiTietLopHoc_SinhVien]
GO
ALTER TABLE [dbo].[GiangVien]  WITH CHECK ADD  CONSTRAINT [FK_GiangVien_TaiKhoan] FOREIGN KEY([TenTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([TenTaiKhoan])
GO
ALTER TABLE [dbo].[GiangVien] CHECK CONSTRAINT [FK_GiangVien_TaiKhoan]
GO
ALTER TABLE [dbo].[LopHoc]  WITH CHECK ADD  CONSTRAINT [FK_LopHoc_GiangVien] FOREIGN KEY([MaGiangVien])
REFERENCES [dbo].[GiangVien] ([MaGiangVien])
GO
ALTER TABLE [dbo].[LopHoc] CHECK CONSTRAINT [FK_LopHoc_GiangVien]
GO
ALTER TABLE [dbo].[LopHoc]  WITH CHECK ADD  CONSTRAINT [FK_LopHoc_MonHoc] FOREIGN KEY([MaMonHoc])
REFERENCES [dbo].[MonHoc] ([MaMonHoc])
GO
ALTER TABLE [dbo].[LopHoc] CHECK CONSTRAINT [FK_LopHoc_MonHoc]
GO
USE [master]
GO
ALTER DATABASE [QLKQHocTap] SET  READ_WRITE 
GO
DROP DATABASE [QLKQHocTap] ;  
GO  
