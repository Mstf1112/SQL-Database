USE [master]
GO
/****** Object:  Database [Nalbur_DB]    Script Date: 29.12.2023 12:03:03 ******/
CREATE DATABASE [Nalbur_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Nalbur_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Nalbur_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Nalbur_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Nalbur_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Nalbur_DB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Nalbur_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Nalbur_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Nalbur_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Nalbur_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Nalbur_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Nalbur_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Nalbur_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Nalbur_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Nalbur_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Nalbur_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Nalbur_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Nalbur_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Nalbur_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Nalbur_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Nalbur_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Nalbur_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Nalbur_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Nalbur_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Nalbur_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Nalbur_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Nalbur_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Nalbur_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Nalbur_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Nalbur_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [Nalbur_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Nalbur_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Nalbur_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Nalbur_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Nalbur_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Nalbur_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Nalbur_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Nalbur_DB] SET QUERY_STORE = ON
GO
ALTER DATABASE [Nalbur_DB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Nalbur_DB]
GO
/****** Object:  Table [dbo].[Musteri]    Script Date: 29.12.2023 12:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteri](
	[MusteriID] [int] NOT NULL,
	[Ad] [nvarchar](50) NULL,
	[Soyad] [nvarchar](50) NULL,
	[Telefon] [nvarchar](15) NULL,
	[SirketAdi] [nvarchar](100) NULL,
	[Adres] [nvarchar](255) NULL,
	[Eposta] [nvarchar](100) NULL,
 CONSTRAINT [anahtar_pk_M] PRIMARY KEY CLUSTERED 
(
	[MusteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AdresM]    Script Date: 29.12.2023 12:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[AdresM] as
select MusteriID,Ad,Adres from Musteri where Adres like 'İ%'
GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 29.12.2023 12:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[KatagoriID] [int] NOT NULL,
	[KatagoriAdi] [varchar](255) NULL,
	[Aciklama] [text] NULL,
	[MusterisiparisID] [int] NULL,
 CONSTRAINT [anahtar_pk] PRIMARY KEY CLUSTERED 
(
	[KatagoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 29.12.2023 12:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[UrunlerID] [int] IDENTITY(1,1) NOT NULL,
	[UrunAdi] [varchar](255) NULL,
	[BirimFiyat] [decimal](10, 2) NULL,
	[StokMiktar] [int] NULL,
	[Aciklama] [text] NULL,
	[Kategori_ID] [int] NULL,
	[Marka_ID] [int] NULL,
 CONSTRAINT [anahtar_pk_URu] PRIMARY KEY CLUSTERED 
(
	[UrunlerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[kategoriUrun1]    Script Date: 29.12.2023 12:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[kategoriUrun1]() returns table as
return
select KatagoriAdi,Urunadi,(Birimfiyat*StokMiktar) as 'Tutar'from Urunler U join Kategori k on U.Kategori_ID=k.KatagoriID
GO
/****** Object:  Table [dbo].[kargo1]    Script Date: 29.12.2023 12:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kargo1](
	[kargo_id] [int] NOT NULL,
	[kargocu_personel] [nvarchar](100) NULL,
	[kargo_firması] [nvarchar](100) NULL,
	[tahmini_teslimat] [nvarchar](100) NULL,
	[personelin_telefonu] [nvarchar](100) NULL,
	[kargo_notu] [nvarchar](100) NULL,
	[siparis_durumu] [nvarchar](100) NULL,
	[FirmaID] [int] NULL,
 CONSTRAINT [anahtar_kargo] PRIMARY KEY CLUSTERED 
(
	[kargo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KargoFirmalari]    Script Date: 29.12.2023 12:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KargoFirmalari](
	[FirmaID] [int] NOT NULL,
	[FirmaAdi] [nvarchar](30) NULL,
	[Telefon] [nvarchar](15) NULL,
	[OdemeTarihi] [date] NULL,
	[SevkTarihi] [date] NULL,
	[IslemUcreti] [decimal](10, 2) NULL,
	[SiparisID] [int] NULL,
	[kargoID] [int] NULL,
 CONSTRAINT [anahtar_KARgo_firma] PRIMARY KEY CLUSTERED 
(
	[FirmaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marka]    Script Date: 29.12.2023 12:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marka](
	[MarkaID] [int] IDENTITY(1,1) NOT NULL,
	[MarkaAdi] [nvarchar](100) NULL,
	[Ulke] [nvarchar](50) NULL,
 CONSTRAINT [anahtar_pk_MAR] PRIMARY KEY CLUSTERED 
(
	[MarkaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personel]    Script Date: 29.12.2023 12:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel](
	[PersonelID] [int] NOT NULL,
	[Adi] [nvarchar](100) NULL,
	[Soyadi] [nvarchar](100) NULL,
	[Telefon] [nvarchar](15) NULL,
	[Maas] [decimal](10, 2) NULL,
	[izingunu] [nvarchar](50) NULL,
	[Pozisyon] [nvarchar](30) NULL,
	[iseGirisTarihi] [nvarchar](50) NULL,
	[SiparisID] [int] NULL,
 CONSTRAINT [anahtar_per] PRIMARY KEY CLUSTERED 
(
	[PersonelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siparisler]    Script Date: 29.12.2023 12:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparisler](
	[SiparisID] [int] IDENTITY(1,1) NOT NULL,
	[BirimFiyat] [decimal](10, 2) NULL,
	[Detay] [nvarchar](255) NULL,
	[SiparisTarihi] [date] NULL,
	[ToplamTutar] [decimal](10, 2) NULL,
	[SiparisDurumu] [nvarchar](50) NULL,
	[OdemeTuru] [nvarchar](50) NULL,
	[Musteri_ID] [int] NULL,
 CONSTRAINT [PK__Siparisl__C3F03BDDF0DDE9CF] PRIMARY KEY CLUSTERED 
(
	[SiparisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stok]    Script Date: 29.12.2023 12:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stok](
	[StokID] [int] NOT NULL,
	[MevcutStokMiktari] [int] NULL,
	[UrunID] [int] NULL,
 CONSTRAINT [anahtar] PRIMARY KEY CLUSTERED 
(
	[StokID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tedarikci]    Script Date: 29.12.2023 12:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tedarikci](
	[TedarikciID] [int] NOT NULL,
	[Adres] [nvarchar](255) NULL,
	[Eposta] [nvarchar](100) NULL,
	[Telefon] [nvarchar](15) NULL,
	[TedarikciAdi] [nvarchar](100) NULL,
	[UrunID] [int] NULL,
 CONSTRAINT [PK_Tedarikci] PRIMARY KEY CLUSTERED 
(
	[TedarikciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[kargo1] ([kargo_id], [kargocu_personel], [kargo_firması], [tahmini_teslimat], [personelin_telefonu], [kargo_notu], [siparis_durumu], [FirmaID]) VALUES (1, N'furkan', N'yurtseven', N'05364956743', N'mstfyrltn@gmail.com', N'2003-02-21', N'11111111111', NULL)
GO
INSERT [dbo].[KargoFirmalari] ([FirmaID], [FirmaAdi], [Telefon], [OdemeTarihi], [SevkTarihi], [IslemUcreti], [SiparisID], [kargoID]) VALUES (1, N'ExpressCargo', N'1234567890', CAST(N'2023-11-28' AS Date), CAST(N'2023-12-05' AS Date), CAST(250.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[KargoFirmalari] ([FirmaID], [FirmaAdi], [Telefon], [OdemeTarihi], [SevkTarihi], [IslemUcreti], [SiparisID], [kargoID]) VALUES (2, N'SpeedyDelivery', N'0987654321', CAST(N'2023-11-27' AS Date), CAST(N'2023-12-03' AS Date), CAST(300.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[KargoFirmalari] ([FirmaID], [FirmaAdi], [Telefon], [OdemeTarihi], [SevkTarihi], [IslemUcreti], [SiparisID], [kargoID]) VALUES (3, N'GlobalShippers', N'5554443333', CAST(N'2023-11-26' AS Date), CAST(N'2023-12-04' AS Date), CAST(200.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[KargoFirmalari] ([FirmaID], [FirmaAdi], [Telefon], [OdemeTarihi], [SevkTarihi], [IslemUcreti], [SiparisID], [kargoID]) VALUES (4, N'SwiftFreight', N'7778889999', CAST(N'2023-11-25' AS Date), CAST(N'2023-12-02' AS Date), CAST(280.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[KargoFirmalari] ([FirmaID], [FirmaAdi], [Telefon], [OdemeTarihi], [SevkTarihi], [IslemUcreti], [SiparisID], [kargoID]) VALUES (5, N'RapidTransit', N'1112223334', CAST(N'2023-11-24' AS Date), CAST(N'2023-12-01' AS Date), CAST(320.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[KargoFirmalari] ([FirmaID], [FirmaAdi], [Telefon], [OdemeTarihi], [SevkTarihi], [IslemUcreti], [SiparisID], [kargoID]) VALUES (6, N'ZoomLogistics', N'9998887776', CAST(N'2023-11-23' AS Date), CAST(N'2023-11-30' AS Date), CAST(270.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[KargoFirmalari] ([FirmaID], [FirmaAdi], [Telefon], [OdemeTarihi], [SevkTarihi], [IslemUcreti], [SiparisID], [kargoID]) VALUES (7, N'QuickShip', N'4445556667', CAST(N'2023-11-22' AS Date), CAST(N'2023-11-29' AS Date), CAST(290.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[KargoFirmalari] ([FirmaID], [FirmaAdi], [Telefon], [OdemeTarihi], [SevkTarihi], [IslemUcreti], [SiparisID], [kargoID]) VALUES (8, N'FastTrack', N'2223334448', CAST(N'2023-11-21' AS Date), CAST(N'2023-11-28' AS Date), CAST(310.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[KargoFirmalari] ([FirmaID], [FirmaAdi], [Telefon], [OdemeTarihi], [SevkTarihi], [IslemUcreti], [SiparisID], [kargoID]) VALUES (9, N'SwiftCargo', N'6667778889', CAST(N'2023-11-20' AS Date), CAST(N'2023-11-27' AS Date), CAST(260.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[KargoFirmalari] ([FirmaID], [FirmaAdi], [Telefon], [OdemeTarihi], [SevkTarihi], [IslemUcreti], [SiparisID], [kargoID]) VALUES (10, N'ExpressDelivery', N'3332221110', CAST(N'2023-11-19' AS Date), CAST(N'2023-11-26' AS Date), CAST(280.00 AS Decimal(10, 2)), NULL, NULL)
GO
INSERT [dbo].[Kategori] ([KatagoriID], [KatagoriAdi], [Aciklama], [MusterisiparisID]) VALUES (1, N'Boya', N'Ev ve endüstriyel boyalar için kategori', 1)
INSERT [dbo].[Kategori] ([KatagoriID], [KatagoriAdi], [Aciklama], [MusterisiparisID]) VALUES (2, N'Banyo', N'Banyo malzemeleri ve ekipmanları için kategori', 2)
INSERT [dbo].[Kategori] ([KatagoriID], [KatagoriAdi], [Aciklama], [MusterisiparisID]) VALUES (3, N'Hırdavat', N'Hırdavat malzemeleri ve aletleri için kategori', 43)
INSERT [dbo].[Kategori] ([KatagoriID], [KatagoriAdi], [Aciklama], [MusterisiparisID]) VALUES (4, N'Elektrik', N'Elektrik malzemeleri ve ekipmanları için kategori', 6)
INSERT [dbo].[Kategori] ([KatagoriID], [KatagoriAdi], [Aciklama], [MusterisiparisID]) VALUES (5, N'Tesisat', N'Su ve ısı tesisatı malzemeleri için kategori', 6)
INSERT [dbo].[Kategori] ([KatagoriID], [KatagoriAdi], [Aciklama], [MusterisiparisID]) VALUES (6, N'Yapı Kimyasalları', N'İnşaat ve yapı kimyasalları için kategori', 4)
INSERT [dbo].[Kategori] ([KatagoriID], [KatagoriAdi], [Aciklama], [MusterisiparisID]) VALUES (7, N'İnşaat', N'İnşaat malzemeleri ve ekipmanları için kategori', 5)
INSERT [dbo].[Kategori] ([KatagoriID], [KatagoriAdi], [Aciklama], [MusterisiparisID]) VALUES (8, N'Bahçe', N'Bahçe düzenleme ve bakım ürünleri için kategori', 6)
GO
SET IDENTITY_INSERT [dbo].[Marka] ON 

INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi], [Ulke]) VALUES (1, N'ABC Marka', N'Türkiye')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi], [Ulke]) VALUES (2, N'XYZ Electronics', N'Çin')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi], [Ulke]) VALUES (3, N'GHI Furniture', N'Almanya')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi], [Ulke]) VALUES (4, N'JKL Motors', N'Japonya')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi], [Ulke]) VALUES (5, N'MNO Textiles', N'Hindistan')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi], [Ulke]) VALUES (6, N'PQR Chemicals', N'ABD')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi], [Ulke]) VALUES (7, N'RST Foods', N'Fransa')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi], [Ulke]) VALUES (8, N'STU Electronics', N'Güney Kore')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi], [Ulke]) VALUES (9, N'UVW Metals', N'İngiltere')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi], [Ulke]) VALUES (10, N'LMN Construction', N'Brezilya')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi], [Ulke]) VALUES (11, N'OPQ Appliances', N'İtalya')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi], [Ulke]) VALUES (12, N'EFG Appliances', N'Rusya')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi], [Ulke]) VALUES (13, N'HIJ Tools', N'Kanada')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi], [Ulke]) VALUES (14, N'KLM Textiles', N'Avustralya')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi], [Ulke]) VALUES (15, N'NOP Toys', N'Meksika')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi], [Ulke]) VALUES (16, N'QRS Kitchenware', N'İspanya')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi], [Ulke]) VALUES (17, N'TUV Mobile', N'Hollanda')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi], [Ulke]) VALUES (18, N'VWX Computers', N'Gürcistan')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi], [Ulke]) VALUES (19, N'YZA Stationery', N'Portekiz')
INSERT [dbo].[Marka] ([MarkaID], [MarkaAdi], [Ulke]) VALUES (20, N'BCD Hardware', N'Yeni Zelanda')
SET IDENTITY_INSERT [dbo].[Marka] OFF
GO
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Telefon], [SirketAdi], [Adres], [Eposta]) VALUES (1, N'Ahmet', N'Yılmaz', N'5551234567', N'ABC Ltd. Şti.', N'İstanbul', N'ahmet@abc.com')
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Telefon], [SirketAdi], [Adres], [Eposta]) VALUES (2, N'Ayşe', N'Kaya', N'5559876543', N'XYZ AŞ', N'Ankara', N'ayse@xyz.com')
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Telefon], [SirketAdi], [Adres], [Eposta]) VALUES (3, N'Mehmet', N'Öztürk', N'5552345678', N'MNO Ltd. Şti.', N'İzmir', N'mehmet@mno.com')
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Telefon], [SirketAdi], [Adres], [Eposta]) VALUES (4, N'Zeynep', N'Güneş', N'5558765432', N'PQR Holding', N'Bursa', N'zeynep@pqr.com')
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Telefon], [SirketAdi], [Adres], [Eposta]) VALUES (5, N'Can', N'Ergün', N'5553456789', N'DEF Ticaret', N'Adana', N'can@def.com')
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Telefon], [SirketAdi], [Adres], [Eposta]) VALUES (6, N'Seda', N'Bilgin', N'5557654321', N'RST Limited', N'Antalya', N'seda@rst.com')
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Telefon], [SirketAdi], [Adres], [Eposta]) VALUES (7, N'Efe', N'Kara', N'5554567890', N'UVW AŞ', N'Eskişehir', N'efe@uvw.com')
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Telefon], [SirketAdi], [Adres], [Eposta]) VALUES (8, N'Deniz', N'Özcan', N'5556543210', N'GHI Holding', N'Trabzon', N'deniz@ghi.com')
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Telefon], [SirketAdi], [Adres], [Eposta]) VALUES (9, N'Cemal', N'Uçar', N'5557890123', N'JKL Ticaret', N'Gaziantep', N'cemal@jkl.com')
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Telefon], [SirketAdi], [Adres], [Eposta]) VALUES (10, N'Gamze', N'Kurt', N'5552109876', N'STU Ltd. Şti.', N'Diyarbakır', N'gamze@stu.com')
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Telefon], [SirketAdi], [Adres], [Eposta]) VALUES (11, N'Okan', N'Koç', N'5554321098', N'LMN Holding', N'Konya', N'okan@lmn.com')
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Telefon], [SirketAdi], [Adres], [Eposta]) VALUES (12, N'Nalan', N'Öztürk', N'5551098765', N'OPQ AŞ', N'Adıyaman', N'nalan@opq.com')
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Telefon], [SirketAdi], [Adres], [Eposta]) VALUES (13, N'Yasin', N'Demir', N'5555678901', N'XYZ Ltd. Şti.', N'Samsun', N'yasin@xyz.com')
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Telefon], [SirketAdi], [Adres], [Eposta]) VALUES (14, N'Aslı', N'Çelik', N'5556789012', N'PQR AŞ', N'Erzurum', N'asli@pqr.com')
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Telefon], [SirketAdi], [Adres], [Eposta]) VALUES (15, N'Umut', N'Yıldırım', N'5553456789', N'ABC Ticaret', N'Çorum', N'umut@abc.com')
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Telefon], [SirketAdi], [Adres], [Eposta]) VALUES (16, N'Sibel', N'Şahin', N'5552345678', N'DEF Ltd. Şti.', N'Balıkesir', N'sibel@def.com')
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Telefon], [SirketAdi], [Adres], [Eposta]) VALUES (17, N'Yavuz', N'Kara', N'5559876543', N'RST AŞ', N'Mersin', N'yavuz@rst.com')
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Telefon], [SirketAdi], [Adres], [Eposta]) VALUES (18, N'Elif', N'Güneş', N'5558765432', N'GHI Ticaret', N'Edirne', N'elif@ghi.com')
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Telefon], [SirketAdi], [Adres], [Eposta]) VALUES (19, N'Tolga', N'Özcan', N'5554567890', N'JKL Ltd. Şti.', N'Zonguldak', N'tolga@jkl.com')
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Telefon], [SirketAdi], [Adres], [Eposta]) VALUES (20, N'Burcu', N'Koç', N'5557654321', N'STU AŞ', N'Van', N'burcu@stu.com')
GO
INSERT [dbo].[Personel] ([PersonelID], [Adi], [Soyadi], [Telefon], [Maas], [izingunu], [Pozisyon], [iseGirisTarihi], [SiparisID]) VALUES (1, N'Mehmet mert', N'Kılıçarslan', N'5515654865', CAST(25000.00 AS Decimal(10, 2)), N'30', N'CEO', N'2020-01-20', 1)
INSERT [dbo].[Personel] ([PersonelID], [Adi], [Soyadi], [Telefon], [Maas], [izingunu], [Pozisyon], [iseGirisTarihi], [SiparisID]) VALUES (2, N'Mustafa', N'Yurtalan', N'5473518356', CAST(5000.00 AS Decimal(10, 2)), N'5', N'Satış temsilcisi', N'2022-05-10', 2)
INSERT [dbo].[Personel] ([PersonelID], [Adi], [Soyadi], [Telefon], [Maas], [izingunu], [Pozisyon], [iseGirisTarihi], [SiparisID]) VALUES (3, N'Alp', N'Külahçıoğlu', N'5473518345', CAST(5500.00 AS Decimal(10, 2)), N'0', N'Satış temsilcisi', N'2022-11-10', 3)
INSERT [dbo].[Personel] ([PersonelID], [Adi], [Soyadi], [Telefon], [Maas], [izingunu], [Pozisyon], [iseGirisTarihi], [SiparisID]) VALUES (4, N'Furkan', N'Yurtseven', N'5394956765', CAST(9500.00 AS Decimal(10, 2)), N'0', N'Satış temsilcisi', N'2022-11-10', 4)
INSERT [dbo].[Personel] ([PersonelID], [Adi], [Soyadi], [Telefon], [Maas], [izingunu], [Pozisyon], [iseGirisTarihi], [SiparisID]) VALUES (5, N'Miraç', N'x', N'5468975212', CAST(9500.00 AS Decimal(10, 2)), N'0', N'Satış temsilcisi', N'2022-11-10', 5)
GO
SET IDENTITY_INSERT [dbo].[Siparisler] ON 

INSERT [dbo].[Siparisler] ([SiparisID], [BirimFiyat], [Detay], [SiparisTarihi], [ToplamTutar], [SiparisDurumu], [OdemeTuru], [Musteri_ID]) VALUES (1, CAST(19.99 AS Decimal(10, 2)), N'Bahçe Çit ve Bahçe Mobilya Seti', CAST(N'2023-11-25' AS Date), CAST(249.98 AS Decimal(10, 2)), N'Hazırlanıyor', N'Kredi Kartı', 1)
INSERT [dbo].[Siparisler] ([SiparisID], [BirimFiyat], [Detay], [SiparisTarihi], [ToplamTutar], [SiparisDurumu], [OdemeTuru], [Musteri_ID]) VALUES (2, CAST(34.99 AS Decimal(10, 2)), N'Priz ve Anahtar Seti', CAST(N'2023-11-26' AS Date), CAST(104.97 AS Decimal(10, 2)), N'Gönderildi', N'Nakit', 3)
INSERT [dbo].[Siparisler] ([SiparisID], [BirimFiyat], [Detay], [SiparisTarihi], [ToplamTutar], [SiparisDurumu], [OdemeTuru], [Musteri_ID]) VALUES (3, CAST(44.99 AS Decimal(10, 2)), N'Akıllı Priz ve Elektrikli Isıtıcı', CAST(N'2023-11-27' AS Date), CAST(89.98 AS Decimal(10, 2)), N'Tamamlandı', N'Havale', 2)
INSERT [dbo].[Siparisler] ([SiparisID], [BirimFiyat], [Detay], [SiparisTarihi], [ToplamTutar], [SiparisDurumu], [OdemeTuru], [Musteri_ID]) VALUES (4, CAST(299.99 AS Decimal(10, 2)), N'Akıllı Ev Kontrol Sistemi', CAST(N'2023-11-28' AS Date), CAST(299.99 AS Decimal(10, 2)), N'Hazırlanıyor', N'Kredi Kartı', 4)
INSERT [dbo].[Siparisler] ([SiparisID], [BirimFiyat], [Detay], [SiparisTarihi], [ToplamTutar], [SiparisDurumu], [OdemeTuru], [Musteri_ID]) VALUES (5, CAST(149.99 AS Decimal(10, 2)), N'Çelik İskele', CAST(N'2023-11-29' AS Date), CAST(599.96 AS Decimal(10, 2)), N'Gönderildi', N'Kapıda Ödeme', 5)
INSERT [dbo].[Siparisler] ([SiparisID], [BirimFiyat], [Detay], [SiparisTarihi], [ToplamTutar], [SiparisDurumu], [OdemeTuru], [Musteri_ID]) VALUES (6, CAST(799.99 AS Decimal(10, 2)), N'Yatak Odası Takımı ve Mutfak Masası Seti', CAST(N'2023-11-30' AS Date), CAST(1599.98 AS Decimal(10, 2)), N'Tamamlandı', N'Havale', 6)
INSERT [dbo].[Siparisler] ([SiparisID], [BirimFiyat], [Detay], [SiparisTarihi], [ToplamTutar], [SiparisDurumu], [OdemeTuru], [Musteri_ID]) VALUES (7, CAST(4.99 AS Decimal(10, 2)), N'Kurşun Kalem Seti', CAST(N'2023-12-01' AS Date), CAST(49.90 AS Decimal(10, 2)), N'Hazırlanıyor', N'Kredi Kartı', 7)
INSERT [dbo].[Siparisler] ([SiparisID], [BirimFiyat], [Detay], [SiparisTarihi], [ToplamTutar], [SiparisDurumu], [OdemeTuru], [Musteri_ID]) VALUES (8, CAST(49.99 AS Decimal(10, 2)), N'Bahçe Aydınlatma Seti', CAST(N'2023-12-02' AS Date), CAST(149.97 AS Decimal(10, 2)), N'Gönderildi', N'Nakit', 8)
INSERT [dbo].[Siparisler] ([SiparisID], [BirimFiyat], [Detay], [SiparisTarihi], [ToplamTutar], [SiparisDurumu], [OdemeTuru], [Musteri_ID]) VALUES (9, CAST(399.99 AS Decimal(10, 2)), N'Dolap ve Raf Sistemi', CAST(N'2023-12-03' AS Date), CAST(799.98 AS Decimal(10, 2)), N'Tamamlandı', N'Kapıda Ödeme', 9)
INSERT [dbo].[Siparisler] ([SiparisID], [BirimFiyat], [Detay], [SiparisTarihi], [ToplamTutar], [SiparisDurumu], [OdemeTuru], [Musteri_ID]) VALUES (10, CAST(14.99 AS Decimal(10, 2)), N'Bahçe Sulama Hortumu', CAST(N'2023-12-04' AS Date), CAST(44.97 AS Decimal(10, 2)), N'Hazırlanıyor', N'Kredi Kartı', 10)
INSERT [dbo].[Siparisler] ([SiparisID], [BirimFiyat], [Detay], [SiparisTarihi], [ToplamTutar], [SiparisDurumu], [OdemeTuru], [Musteri_ID]) VALUES (11, CAST(14.99 AS Decimal(10, 2)), N'Bahçe Sulama Hortumu', CAST(N'2023-12-04' AS Date), CAST(44.97 AS Decimal(10, 2)), N'Hazırlanıyor', N'Kredi Kartı', 10)
INSERT [dbo].[Siparisler] ([SiparisID], [BirimFiyat], [Detay], [SiparisTarihi], [ToplamTutar], [SiparisDurumu], [OdemeTuru], [Musteri_ID]) VALUES (12, CAST(14.99 AS Decimal(10, 2)), N'Bahçe Sulama Hortumu', CAST(N'2023-12-04' AS Date), CAST(44.97 AS Decimal(10, 2)), N'Hazırlanıyor', N'Kredi Kartı', 10)
INSERT [dbo].[Siparisler] ([SiparisID], [BirimFiyat], [Detay], [SiparisTarihi], [ToplamTutar], [SiparisDurumu], [OdemeTuru], [Musteri_ID]) VALUES (13, CAST(19.99 AS Decimal(10, 2)), N'Bahçe Çiçek Tohumları', CAST(N'2023-12-05' AS Date), CAST(39.98 AS Decimal(10, 2)), N'Gönderildi', N'Havale', 11)
INSERT [dbo].[Siparisler] ([SiparisID], [BirimFiyat], [Detay], [SiparisTarihi], [ToplamTutar], [SiparisDurumu], [OdemeTuru], [Musteri_ID]) VALUES (14, CAST(9.99 AS Decimal(10, 2)), N'Bahçe Makası', CAST(N'2023-12-06' AS Date), CAST(29.97 AS Decimal(10, 2)), N'Onaylandı', N'Nakit', 12)
INSERT [dbo].[Siparisler] ([SiparisID], [BirimFiyat], [Detay], [SiparisTarihi], [ToplamTutar], [SiparisDurumu], [OdemeTuru], [Musteri_ID]) VALUES (15, CAST(24.99 AS Decimal(10, 2)), N'Bahçe Ayakkabısı', CAST(N'2023-12-07' AS Date), CAST(74.97 AS Decimal(10, 2)), N'Teslim Edildi', N'Kredi Kartı', 13)
INSERT [dbo].[Siparisler] ([SiparisID], [BirimFiyat], [Detay], [SiparisTarihi], [ToplamTutar], [SiparisDurumu], [OdemeTuru], [Musteri_ID]) VALUES (16, CAST(34.99 AS Decimal(10, 2)), N'Bahçe Saksısı Seti', CAST(N'2023-12-08' AS Date), CAST(104.97 AS Decimal(10, 2)), N'Hazırlanıyor', N'Havale', 14)
INSERT [dbo].[Siparisler] ([SiparisID], [BirimFiyat], [Detay], [SiparisTarihi], [ToplamTutar], [SiparisDurumu], [OdemeTuru], [Musteri_ID]) VALUES (17, CAST(12.99 AS Decimal(10, 2)), N'Bahçe Dekoratif Lamba', CAST(N'2023-12-09' AS Date), CAST(38.97 AS Decimal(10, 2)), N'Gönderildi', N'Nakit', 15)
INSERT [dbo].[Siparisler] ([SiparisID], [BirimFiyat], [Detay], [SiparisTarihi], [ToplamTutar], [SiparisDurumu], [OdemeTuru], [Musteri_ID]) VALUES (18, CAST(39.99 AS Decimal(10, 2)), N'Bahçe Oturma Grubu', CAST(N'2023-12-10' AS Date), CAST(119.97 AS Decimal(10, 2)), N'Onaylandı', N'Kredi Kartı', 16)
INSERT [dbo].[Siparisler] ([SiparisID], [BirimFiyat], [Detay], [SiparisTarihi], [ToplamTutar], [SiparisDurumu], [OdemeTuru], [Musteri_ID]) VALUES (19, CAST(17.99 AS Decimal(10, 2)), N'Bahçe Sulama Kovaları', CAST(N'2023-12-11' AS Date), CAST(53.97 AS Decimal(10, 2)), N'Teslim Edildi', N'Havale', 17)
INSERT [dbo].[Siparisler] ([SiparisID], [BirimFiyat], [Detay], [SiparisTarihi], [ToplamTutar], [SiparisDurumu], [OdemeTuru], [Musteri_ID]) VALUES (20, CAST(29.99 AS Decimal(10, 2)), N'Bahçe Duvar Süsü', CAST(N'2023-12-12' AS Date), CAST(89.97 AS Decimal(10, 2)), N'Hazırlanıyor', N'Nakit', 18)
INSERT [dbo].[Siparisler] ([SiparisID], [BirimFiyat], [Detay], [SiparisTarihi], [ToplamTutar], [SiparisDurumu], [OdemeTuru], [Musteri_ID]) VALUES (21, CAST(22.99 AS Decimal(10, 2)), N'Bahçe Taşları Seti', CAST(N'2023-12-13' AS Date), CAST(68.97 AS Decimal(10, 2)), N'Gönderildi', N'Kredi Kartı', 19)
SET IDENTITY_INSERT [dbo].[Siparisler] OFF
GO
INSERT [dbo].[Stok] ([StokID], [MevcutStokMiktari], [UrunID]) VALUES (1, 100, 1)
INSERT [dbo].[Stok] ([StokID], [MevcutStokMiktari], [UrunID]) VALUES (2, 150, 2)
INSERT [dbo].[Stok] ([StokID], [MevcutStokMiktari], [UrunID]) VALUES (3, 80, 3)
INSERT [dbo].[Stok] ([StokID], [MevcutStokMiktari], [UrunID]) VALUES (4, 200, 4)
INSERT [dbo].[Stok] ([StokID], [MevcutStokMiktari], [UrunID]) VALUES (5, 50, 5)
INSERT [dbo].[Stok] ([StokID], [MevcutStokMiktari], [UrunID]) VALUES (6, 120, NULL)
INSERT [dbo].[Stok] ([StokID], [MevcutStokMiktari], [UrunID]) VALUES (7, 90, NULL)
INSERT [dbo].[Stok] ([StokID], [MevcutStokMiktari], [UrunID]) VALUES (8, 180, NULL)
INSERT [dbo].[Stok] ([StokID], [MevcutStokMiktari], [UrunID]) VALUES (9, 60, NULL)
INSERT [dbo].[Stok] ([StokID], [MevcutStokMiktari], [UrunID]) VALUES (10, 220, NULL)
INSERT [dbo].[Stok] ([StokID], [MevcutStokMiktari], [UrunID]) VALUES (11, 75, NULL)
INSERT [dbo].[Stok] ([StokID], [MevcutStokMiktari], [UrunID]) VALUES (12, 110, NULL)
INSERT [dbo].[Stok] ([StokID], [MevcutStokMiktari], [UrunID]) VALUES (13, 130, NULL)
INSERT [dbo].[Stok] ([StokID], [MevcutStokMiktari], [UrunID]) VALUES (14, 95, NULL)
INSERT [dbo].[Stok] ([StokID], [MevcutStokMiktari], [UrunID]) VALUES (15, 170, NULL)
INSERT [dbo].[Stok] ([StokID], [MevcutStokMiktari], [UrunID]) VALUES (16, 40, NULL)
INSERT [dbo].[Stok] ([StokID], [MevcutStokMiktari], [UrunID]) VALUES (17, 85, NULL)
INSERT [dbo].[Stok] ([StokID], [MevcutStokMiktari], [UrunID]) VALUES (18, 160, NULL)
INSERT [dbo].[Stok] ([StokID], [MevcutStokMiktari], [UrunID]) VALUES (19, 105, NULL)
INSERT [dbo].[Stok] ([StokID], [MevcutStokMiktari], [UrunID]) VALUES (20, 190, NULL)
GO
INSERT [dbo].[Tedarikci] ([TedarikciID], [Adres], [Eposta], [Telefon], [TedarikciAdi], [UrunID]) VALUES (1, N'İstanbul', N'mehmet@example.com', N'1234567890', N'Jmehmet öz', 12)
INSERT [dbo].[Tedarikci] ([TedarikciID], [Adres], [Eposta], [Telefon], [TedarikciAdi], [UrunID]) VALUES (2, N'Ankara', N'mert@example.com', N'0987654321', N'mert simit', 2)
INSERT [dbo].[Tedarikci] ([TedarikciID], [Adres], [Eposta], [Telefon], [TedarikciAdi], [UrunID]) VALUES (3, N'İzmir', N'ali@example.com', N'5554443333', N'ali al', 3)
INSERT [dbo].[Tedarikci] ([TedarikciID], [Adres], [Eposta], [Telefon], [TedarikciAdi], [UrunID]) VALUES (4, N'Bursa', N'fatih@example.com', N'7778889999', N'fatih terim', 4)
INSERT [dbo].[Tedarikci] ([TedarikciID], [Adres], [Eposta], [Telefon], [TedarikciAdi], [UrunID]) VALUES (5, N'Antalya', N'hüseyin@example.com', N'1112223334', N'hüseyin kel', 5)
INSERT [dbo].[Tedarikci] ([TedarikciID], [Adres], [Eposta], [Telefon], [TedarikciAdi], [UrunID]) VALUES (6, N'Adana', N'mustafa@example.com', N'9998887776', N'mustfa batı', NULL)
INSERT [dbo].[Tedarikci] ([TedarikciID], [Adres], [Eposta], [Telefon], [TedarikciAdi], [UrunID]) VALUES (7, N'Trabzon', N'hasan@example.com', N'4445556667', N'hasan kara', NULL)
INSERT [dbo].[Tedarikci] ([TedarikciID], [Adres], [Eposta], [Telefon], [TedarikciAdi], [UrunID]) VALUES (8, N'Eskişehir', N'hasanK@example.com', N'2223334448', N'hasan ak', NULL)
INSERT [dbo].[Tedarikci] ([TedarikciID], [Adres], [Eposta], [Telefon], [TedarikciAdi], [UrunID]) VALUES (9, N'Gaziantep', N'zeynep@example.com', N'6667778889', N'zeynep gök', NULL)
INSERT [dbo].[Tedarikci] ([TedarikciID], [Adres], [Eposta], [Telefon], [TedarikciAdi], [UrunID]) VALUES (10, N'Konya', N'ece@example.com', N'3332221110', N'ece tok', NULL)
GO
SET IDENTITY_INSERT [dbo].[Urunler] ON 

INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (1, N'PVC Boru PB-100', CAST(5.99 AS Decimal(10, 2)), 300, N'Sıhhi tesisat için PVC boru', 5, 1)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (2, N'Kapı Boyası KX-500', CAST(45.99 AS Decimal(10, 2)), 80, N'Ahşap kapılar için özel boyama', 1, 1)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (3, N'Tavan Boyası TY-700', CAST(29.99 AS Decimal(10, 2)), 120, N'Tavanlar için beyaz renk boya', 1, 1)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (4, N'Selülozik Boya SX-200', CAST(55.99 AS Decimal(10, 2)), 50, N'Selülozik yüzeyler için profesyonel boya', 1, 2)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (5, N'Endüstriyel Metal Boya EM-100', CAST(69.99 AS Decimal(10, 2)), 40, N'Metal yüzeylerde kullanılmak üzere endüstriyel boya', 1, 3)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (6, N'Boya Tiner BT-300', CAST(12.99 AS Decimal(10, 2)), 200, N'Boya inceltici ve temizleyici', 1, 1)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (7, N'Ahsap Koruyucu Cila AC-800', CAST(34.99 AS Decimal(10, 2)), 60, N'Ahşap yüzeyler için koruyucu cila', 1, 2)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (8, N'Su Bazlı Tavan Boyası ST-200', CAST(27.99 AS Decimal(10, 2)), 90, N'Su bazlı tavan boyası', 1, 1)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (9, N'Epoksi Zemin Kaplama EZ-400', CAST(89.99 AS Decimal(10, 2)), 30, N'Endüstriyel zeminler için epoksi kaplama', 1, 3)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (10, N'Otomotiv Boya OB-600', CAST(49.99 AS Decimal(10, 2)), 45, N'Araçlar için özel otomotiv boya', 1, 4)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (11, N'Cam Boya CB-100', CAST(19.99 AS Decimal(10, 2)), 100, N'Cam yüzeyler için renkli boya', 1, 2)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (12, N'Banyo Dolap Seti BD-1000', CAST(249.99 AS Decimal(10, 2)), 20, N'Modern banyo dolabı seti', 2, 1)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (13, N'Duş Başlığı DB-200', CAST(39.99 AS Decimal(10, 2)), 50, N'Yağmur efektiyle modern duş başlığı', 2, 2)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (14, N'Banyo Havluluk BH-300', CAST(19.99 AS Decimal(10, 2)), 80, N'Duvara monte banyo havlu askısı', 2, 3)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (15, N'Cam Duşa Kabin CK-400', CAST(599.99 AS Decimal(10, 2)), 10, N'Şeffaf cam duşa kabin', 2, 4)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (16, N'Seramik Banyo Lavabo SL-500', CAST(129.99 AS Decimal(10, 2)), 30, N'Modern seramik banyo lavabo', 2, 5)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (17, N'Banyo Ayak Paspası BA-600', CAST(9.99 AS Decimal(10, 2)), 100, N'Kaymaz banyo ayak paspası', 2, 6)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (18, N'Sıvı Sabunluk SS-700', CAST(12.99 AS Decimal(10, 2)), 150, N'Banyo lavabosu için sıvı sabunluk', 2, 7)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (19, N'Banyo Perdesi BP-800', CAST(29.99 AS Decimal(10, 2)), 70, N'Renkli desenli banyo perdesi', 2, 8)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (20, N'Ayna LED Aydınlatmalı AL-900', CAST(79.99 AS Decimal(10, 2)), 40, N'LED ışıklı banyo aynası', 2, 9)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (21, N'Banyo Havlu Seti BHS-1000', CAST(49.99 AS Decimal(10, 2)), 60, N'Kaliteli banyo havlu seti', 2, 10)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (22, N'Vida Seti VS-100', CAST(14.99 AS Decimal(10, 2)), 200, N'Çeşitli boy ve tiplerde vida seti', 3, 1)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (23, N'Çekiç CH-200', CAST(29.99 AS Decimal(10, 2)), 100, N'Ahşap ve metal işleri için çekiç', 3, 2)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (24, N'Matkap Ucu Seti MUS-300', CAST(24.99 AS Decimal(10, 2)), 150, N'Farklı boy ve tiplerde matkap ucu seti', 3, 3)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (25, N'Testere TS-400', CAST(34.99 AS Decimal(10, 2)), 80, N'Ahşap ve metal kesimleri için testere', 3, 4)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (26, N'Çelik Mengene CM-500', CAST(49.99 AS Decimal(10, 2)), 50, N'Ahşap ve metal işleri için çelik mengene', 3, 5)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (27, N'Ölçüm Şeridi OS-600', CAST(9.99 AS Decimal(10, 2)), 300, N'Ölçümler için uzun ölçüm şeridi', 3, 6)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (28, N'Taşlama Makinesi TM-700', CAST(89.99 AS Decimal(10, 2)), 30, N'Metal yüzeyleri taşlamak için makine', 3, 7)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (29, N'Pense Seti PS-800', CAST(19.99 AS Decimal(10, 2)), 120, N'Farklı boy ve tiplerde pense seti', 3, 8)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (30, N'Cıvata Seti CS-900', CAST(12.99 AS Decimal(10, 2)), 250, N'Çeşitli boy ve tiplerde cıvata seti', 3, 9)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (31, N'Tornavida TSV-1000', CAST(7.99 AS Decimal(10, 2)), 200, N'Farklı uç tiplerine sahip tornavida seti', 3, 10)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (32, N'Aydınlatma Led Ampul ALA-100', CAST(12.99 AS Decimal(10, 2)), 150, N'Enerji tasarruflu LED ampul', 4, 1)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (33, N'Priz ve Anahtar Seti PAS-200', CAST(34.99 AS Decimal(10, 2)), 80, N'Duvar prizi ve anahtar seti', 4, 2)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (34, N'Güç Şeridi GS-300', CAST(19.99 AS Decimal(10, 2)), 120, N'Çoklu prizli güç şeridi', 4, 3)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (35, N'Kablo Organizatör KO-400', CAST(9.99 AS Decimal(10, 2)), 200, N'Kablo düzenleyici set', 4, 4)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (36, N'Akıllı Priz AP-500', CAST(49.99 AS Decimal(10, 2)), 50, N'Wi-Fi ile kontrol edilebilen akıllı priz', 4, 5)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (37, N'Elektrikli Isıtıcı EI-600', CAST(79.99 AS Decimal(10, 2)), 30, N'Taşınabilir elektrikli ısıtıcı', 4, 6)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (38, N'Kesintisiz Güç Kaynağı KGS-700', CAST(199.99 AS Decimal(10, 2)), 15, N'Kesintisiz güç kaynağı', 4, 7)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (39, N'Güneş Enerjili Lamba GEL-800', CAST(44.99 AS Decimal(10, 2)), 60, N'Güneş enerjisiyle çalışan bahçe lambası', 4, 8)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (40, N'Akıllı Ev Kontrol Sistemi AKS-900', CAST(299.99 AS Decimal(10, 2)), 10, N'Wi-Fi ile bağlanabilen akıllı ev kontrol sistemi', 4, 9)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (41, N'Elektrikli Tornavida ET-1000', CAST(39.99 AS Decimal(10, 2)), 40, N'Elektrikli şarjlı tornavida', 4, 10)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (42, N'Sifon ve Lavabo Takımı SLT-200', CAST(24.99 AS Decimal(10, 2)), 120, N'Lavabo için sifon takımı', 5, 2)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (43, N'Musluk MK-300', CAST(39.99 AS Decimal(10, 2)), 80, N'Banyo veya mutfak musluğu', 5, 3)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (44, N'Pompa P-400', CAST(79.99 AS Decimal(10, 2)), 50, N'Sıvı transferi için su pompası', 5, 4)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (45, N'Radyatör RT-500', CAST(89.99 AS Decimal(10, 2)), 40, N'Isıtma sistemleri için panel radyatör', 5, 5)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (46, N'Filtre ve Su Arıtma Sistemi FAS-600', CAST(149.99 AS Decimal(10, 2)), 30, N'Su arıtma filtresi ve sistem', 5, 6)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (47, N'Tesisat Conta Seti TCS-700', CAST(14.99 AS Decimal(10, 2)), 200, N'Çeşitli boy ve tiplerde conta seti', 5, 7)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (48, N'Sızdırmazlık Bandı SB-800', CAST(9.99 AS Decimal(10, 2)), 250, N'Su sızıntıları için bant', 5, 8)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (49, N'Pis Su Tahliye Hortumu PTH-900', CAST(7.99 AS Decimal(10, 2)), 300, N'Pis su tahliyesi için esnek hortum', 5, 9)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (50, N'Su Sayacı SS-1000', CAST(29.99 AS Decimal(10, 2)), 60, N'Evlerde su tüketimini ölçen sayaç', 5, 10)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (51, N'Çimento Katkı CEMK-100', CAST(14.99 AS Decimal(10, 2)), 200, N'Çimento karışımlarına katkı malzemesi', 6, 1)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (52, N'Su İzolasyon Malzemesi SIM-200', CAST(29.99 AS Decimal(10, 2)), 150, N'Yüzeylere su izolasyonu için malzeme', 6, 2)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (53, N'Epoksi Yapıştırıcı EPOY-300', CAST(44.99 AS Decimal(10, 2)), 120, N'Ahşap, metal ve seramik yapıştırıcı', 6, 3)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (54, N'Yapı Yalıtım Köpüğü YK-400', CAST(19.99 AS Decimal(10, 2)), 180, N'Duvar yalıtımı için köpük', 6, 4)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (55, N'Astar ve Primer AP-500', CAST(9.99 AS Decimal(10, 2)), 250, N'Yüzeylere astar ve primer uygulaması', 6, 5)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (56, N'Kimyasal Ankraj Sistemi KAS-600', CAST(49.99 AS Decimal(10, 2)), 80, N'Beton ve duvar sabitleme için sistem', 6, 6)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (57, N'Kaplama ve Zemin Koruyucu KZK-700', CAST(34.99 AS Decimal(10, 2)), 100, N'Zemin ve kaplamaları koruyucu malzeme', 6, 7)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (58, N'Kimyasal Enjeksiyon KE-800', CAST(64.99 AS Decimal(10, 2)), 60, N'Çatlakları doldurmak için enjeksiyon malzemesi', 6, 8)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (59, N'Ayarlanabilir Harç AH-900', CAST(22.99 AS Decimal(10, 2)), 130, N'Seramik ve taş kaplamalar için ayarlanabilir harç', 6, 9)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (60, N'Yapıştırma ve Tamirat Seti YTS-1000', CAST(39.99 AS Decimal(10, 2)), 90, N'Çeşitli yüzeylerde kullanılabilen tamirat seti', 6, 10)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (61, N'Çelik İskele CI-100', CAST(299.99 AS Decimal(10, 2)), 30, N'İnşaat alanında kullanılan çelik iskele', 7, 1)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (62, N'Tuğla ve Blok TB-200', CAST(1.99 AS Decimal(10, 2)), 1000, N'İnşaat duvarları için tuğla ve blok', 7, 2)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (63, N'Betopan BP-300', CAST(19.99 AS Decimal(10, 2)), 200, N'İnşaat için yalıtım panelleri', 7, 3)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (64, N'Çatı Kaplama Malzemesi CKM-400', CAST(49.99 AS Decimal(10, 2)), 50, N'Çatı kaplama malzemesi', 7, 4)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (65, N'Alçıpan AP-500', CAST(9.99 AS Decimal(10, 2)), 300, N'Duvar kaplama ve tavan uygulamaları için alçıpan', 7, 5)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (66, N'İnşaat Makası IM-600', CAST(149.99 AS Decimal(10, 2)), 20, N'İnşaat alanında kullanılan kesme makası', 7, 6)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (67, N'İzolasyon Malzemesi IZM-700', CAST(29.99 AS Decimal(10, 2)), 150, N'İzolasyon için kullanılan malzeme', 7, 7)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (68, N'Kiremit KK-800', CAST(1.49 AS Decimal(10, 2)), 5000, N'Çatı kaplama için kiremit', 7, 8)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (69, N'İnşaat Tel Çiti ITC-900', CAST(7.99 AS Decimal(10, 2)), 400, N'İnşaat alanını çevrelemek için tel çit', 7, 9)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (70, N'Hazır Beton HB-1000', CAST(79.99 AS Decimal(10, 2)), 80, N'İnşaat projeleri için hazır beton', 7, 10)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (71, N'Yatak Odası Takımı YT-1000', CAST(1499.99 AS Decimal(10, 2)), 10, N'Modern tasarımlı yatak odası takımı', 8, 1)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (72, N'Kanepe ve Sehpa Seti KSS-200', CAST(799.99 AS Decimal(10, 2)), 15, N'Rahat kanepe ve sehpa seti', 8, 2)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (73, N'Yemek Masası ve Sandalye Seti YMS-300', CAST(599.99 AS Decimal(10, 2)), 20, N'Şık yemek masası ve sandalye seti', 8, 3)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (74, N'Dolap ve Raf Sistemi DRS-400', CAST(399.99 AS Decimal(10, 2)), 25, N'Çeşitli bölmeli dolap ve raf sistemi', 8, 4)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (75, N'TV Ünitesi TU-500', CAST(299.99 AS Decimal(10, 2)), 30, N'Modern tasarımlı TV ünitesi', 8, 5)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (76, N'Kitaplık KB-600', CAST(149.99 AS Decimal(10, 2)), 40, N'Duvara monte edilebilen kitaplık', 8, 6)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (77, N'Mutfak Masası ve Sandalye Seti MSS-700', CAST(449.99 AS Decimal(10, 2)), 18, N'Şık mutfak masası ve sandalye seti', 8, 7)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (78, N'Ayna ve Komodin Seti AKS-800', CAST(199.99 AS Decimal(10, 2)), 12, N'Yatak odası için ayna ve komodin seti', 8, 8)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (79, N'Dekoratif Lamba DL-900', CAST(79.99 AS Decimal(10, 2)), 22, N'Ev dekorasyonu için dekoratif lamba', 8, 9)
INSERT [dbo].[Urunler] ([UrunlerID], [UrunAdi], [BirimFiyat], [StokMiktar], [Aciklama], [Kategori_ID], [Marka_ID]) VALUES (80, N'Halı ve Kilim Seti HKS-1000', CAST(129.99 AS Decimal(10, 2)), 35, N'Ev içi zemin kaplaması için halı ve kilim seti', 8, 10)
SET IDENTITY_INSERT [dbo].[Urunler] OFF
GO
ALTER TABLE [dbo].[kargo1]  WITH CHECK ADD  CONSTRAINT [FK_kargo_kargofirmalari] FOREIGN KEY([FirmaID])
REFERENCES [dbo].[KargoFirmalari] ([FirmaID])
GO
ALTER TABLE [dbo].[kargo1] CHECK CONSTRAINT [FK_kargo_kargofirmalari]
GO
ALTER TABLE [dbo].[KargoFirmalari]  WITH CHECK ADD  CONSTRAINT [anahtar_KF] FOREIGN KEY([SiparisID])
REFERENCES [dbo].[Siparisler] ([SiparisID])
GO
ALTER TABLE [dbo].[KargoFirmalari] CHECK CONSTRAINT [anahtar_KF]
GO
ALTER TABLE [dbo].[Personel]  WITH CHECK ADD  CONSTRAINT [anahtar_PS] FOREIGN KEY([SiparisID])
REFERENCES [dbo].[Siparisler] ([SiparisID])
GO
ALTER TABLE [dbo].[Personel] CHECK CONSTRAINT [anahtar_PS]
GO
ALTER TABLE [dbo].[Siparisler]  WITH CHECK ADD  CONSTRAINT [FK_MusteriSiparis] FOREIGN KEY([Musteri_ID])
REFERENCES [dbo].[Musteri] ([MusteriID])
GO
ALTER TABLE [dbo].[Siparisler] CHECK CONSTRAINT [FK_MusteriSiparis]
GO
ALTER TABLE [dbo].[Stok]  WITH CHECK ADD  CONSTRAINT [anahtar_UR] FOREIGN KEY([UrunID])
REFERENCES [dbo].[Urunler] ([UrunlerID])
GO
ALTER TABLE [dbo].[Stok] CHECK CONSTRAINT [anahtar_UR]
GO
ALTER TABLE [dbo].[Tedarikci]  WITH CHECK ADD  CONSTRAINT [anahtar_UT] FOREIGN KEY([UrunID])
REFERENCES [dbo].[Urunler] ([UrunlerID])
GO
ALTER TABLE [dbo].[Tedarikci] CHECK CONSTRAINT [anahtar_UT]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [anahtar_fk_k] FOREIGN KEY([Kategori_ID])
REFERENCES [dbo].[Kategori] ([KatagoriID])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [anahtar_fk_k]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [anahtar_fk_m] FOREIGN KEY([Marka_ID])
REFERENCES [dbo].[Marka] ([MarkaID])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [anahtar_fk_m]
GO
/****** Object:  StoredProcedure [dbo].[kategoriUrun]    Script Date: 29.12.2023 12:03:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[kategoriUrun] (@id int) as 
select KatagoriID,UrunlerID,UrunAdi,KatagoriAdi,(Birimfiyat*StokMiktar) as 'Tutar' from Kategori K join Urunler U on
U.Kategori_ID=K.KatagoriID where KatagoriID=@id
GO
USE [master]
GO
ALTER DATABASE [Nalbur_DB] SET  READ_WRITE 
GO
