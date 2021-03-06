USE [master]
GO
/****** Object:  Database [TeaShopERP]    Script Date: 2022/1/18 上午 01:03:28 ******/
CREATE DATABASE [TeaShopERP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TeaShopERP', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TeaShopERP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TeaShopERP_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TeaShopERP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TeaShopERP] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TeaShopERP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TeaShopERP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TeaShopERP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TeaShopERP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TeaShopERP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TeaShopERP] SET ARITHABORT OFF 
GO
ALTER DATABASE [TeaShopERP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TeaShopERP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TeaShopERP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TeaShopERP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TeaShopERP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TeaShopERP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TeaShopERP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TeaShopERP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TeaShopERP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TeaShopERP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TeaShopERP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TeaShopERP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TeaShopERP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TeaShopERP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TeaShopERP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TeaShopERP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TeaShopERP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TeaShopERP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TeaShopERP] SET  MULTI_USER 
GO
ALTER DATABASE [TeaShopERP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TeaShopERP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TeaShopERP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TeaShopERP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TeaShopERP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TeaShopERP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TeaShopERP] SET QUERY_STORE = OFF
GO
USE [TeaShopERP]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2022/1/18 上午 01:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[Type] [nvarchar](10) NULL,
	[ProductCategory] [nvarchar](50) NOT NULL,
	[ProductPicture] [nvarchar](50) NULL,
	[ProductDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrderDetail]    Script Date: 2022/1/18 上午 01:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderDetail](
	[PurchaseOrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseOrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[PurchaseQuantity] [int] NOT NULL,
	[UnitPrice] [money] NULL,
 CONSTRAINT [PK_PurchaseOrderDetail_1] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrderHeader]    Script Date: 2022/1/18 上午 01:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderHeader](
	[PurchaseOrderID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[PurchaseTotal] [money] NOT NULL,
	[PurchaseDate] [datetime] NOT NULL,
	[Arrival] [int] NULL,
 CONSTRAINT [PK_PurchaseOrderHeader] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesOrderDetail]    Script Date: 2022/1/18 上午 01:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrderDetail](
	[SalesOrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[SalesOrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SalesQuantity] [int] NOT NULL,
	[UnitPrice] [money] NULL,
 CONSTRAINT [PK_SalesOrderDetail_1] PRIMARY KEY CLUSTERED 
(
	[SalesOrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesOrderHeader]    Script Date: 2022/1/18 上午 01:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrderHeader](
	[SalesOrderID] [int] IDENTITY(1,1) NOT NULL,
	[Customer] [nvarchar](20) NOT NULL,
	[SalesTotal] [money] NOT NULL,
	[SalesDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SalesOrderHeader] PRIMARY KEY CLUSTERED 
(
	[SalesOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 2022/1/18 上午 01:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[StockID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[StockAmount] [int] NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[StockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 2022/1/18 上午 01:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](80) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2022/1/18 上午 01:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Administrator] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [Name], [Type], [ProductCategory], [ProductPicture], [ProductDescription]) VALUES (1, N'清萍壺', N'茶壺', N'綠泥', N'/productImg/1.jpg', N'宜興紫砂作家中，極少見科班出身的吳江健老師，這次採用膾炙人口的古農真壺稀世名泥～「二代墨荷」，巧妙地利用其色調與質感，創作出一件清新脫俗的嶄新作品 ！')
INSERT [dbo].[Product] ([ProductID], [Name], [Type], [ProductCategory], [ProductPicture], [ProductDescription]) VALUES (2, N'紫砂提梁大壺', N'茶壺', N'紫泥', N'/productImg/2.jpg', N'形狀古奇，胎骨堅實，壺口內壁及壺身裡測均未見成型後的修飾，與陶罐製作特徵相似，但泥質較細')
INSERT [dbo].[Product] ([ProductID], [Name], [Type], [ProductCategory], [ProductPicture], [ProductDescription]) VALUES (3, N'柿蒂紋紫砂蓮子壺', N'茶壺', N'紫泥', N'/productImg/3.jpg', N'成型法為手工捏塑，泥條盤筑，泥片鑲接，木模或泥模擋胚等。')
INSERT [dbo].[Product] ([ProductID], [Name], [Type], [ProductCategory], [ProductPicture], [ProductDescription]) VALUES (8, N'紫砂茶葉罐', N'茶壺', N'紫泥', N'/productImg/8.jpg', N'歷史悠久，屬於原土原礦，胎土呈現淡紫色，器身常見染質丶黑點丶火疵，做工粗放，表面少見刮修。')
INSERT [dbo].[Product] ([ProductID], [Name], [Type], [ProductCategory], [ProductPicture], [ProductDescription]) VALUES (9, N'甲辰大彬款高燈壺', N'茶壺', N'朱泥', N'/productImg/9.jpg', N'壺之土色，皆細土淡墨色，上有銀沙閃點，砂粒點點，相當奪目。')
INSERT [dbo].[Product] ([ProductID], [Name], [Type], [ProductCategory], [ProductPicture], [ProductDescription]) VALUES (10, N'朱泥菱瓣壺', N'茶壺', N'朱泥', N'/productImg/10.jpg', N'朱泥壺的筋紋器以菊瓣類為主，通常都是偶數瓣，如16丶36等等。')
INSERT [dbo].[Product] ([ProductID], [Name], [Type], [ProductCategory], [ProductPicture], [ProductDescription]) VALUES (11, N'大彬款龍蛋朱泥壺', N'茶壺', N'朱泥', N'/productImg/11.jpg', N'龍蛋壺式基本上由壺身丶壺嘴丶壺紐三個立體圓錐形組成。')
INSERT [dbo].[Product] ([ProductID], [Name], [Type], [ProductCategory], [ProductPicture], [ProductDescription]) VALUES (12, N'鍛泥紫砂潘壺', N'茶壺', N'鍛泥', N'/productImg/12.jpg', N'常用多種色泥作不同配比，再摻以泥砂，礦砂，使色澤變化更為豐富。')
INSERT [dbo].[Product] ([ProductID], [Name], [Type], [ProductCategory], [ProductPicture], [ProductDescription]) VALUES (13, N'飛鴻延年壺', N'茶壺', N'紫泥', N'/productImg/13.jpg', N'此壺底印"飛鴻延年"有六個點，左右各三，相對並列，乃取"六二於盅"之意。')
INSERT [dbo].[Product] ([ProductID], [Name], [Type], [ProductCategory], [ProductPicture], [ProductDescription]) VALUES (14, N'楊彭年制訪古井欄壺', N'茶壺', N'紫泥', N'/productImg/14.jpg', N'壺蓋作橋型紐，壺體扁圓，壺口較大，圓肩，直腹，挖足，一彎嘴，單孔，環把。')
INSERT [dbo].[Product] ([ProductID], [Name], [Type], [ProductCategory], [ProductPicture], [ProductDescription]) VALUES (15, N'大亨款八卦束竹壺', N'茶壺', N'紫泥', N'/productImg/15.jpg', N'用64根細竹圍成，每根粗細相同，工整且光潔。')
INSERT [dbo].[Product] ([ProductID], [Name], [Type], [ProductCategory], [ProductPicture], [ProductDescription]) VALUES (18, N'梨山高冷紅茶', N'茶葉', N'紅茶', N'/productImg/18.jpg', N'不同於一般紅茶採用低海拔之阿薩姆茶葉，而是產於海拔2200公尺的梨山茶園，由人工摘採芯芽，梨山高冷紅茶重發酵烘焙，使之結合了紅茶及高山茶的特性。高海拔茶園的地理因素，讓小葉種青心烏龍於生長期累積了較多的茶氨酸物質，芯芽乃茶樹最柔嫰的部位，木質纖維化程度低')
INSERT [dbo].[Product] ([ProductID], [Name], [Type], [ProductCategory], [ProductPicture], [ProductDescription]) VALUES (19, N'四季春茶', N'茶葉', N'綠茶', N'/productImg/19.jpg', N'屬小葉型，極早生之包種茶品種，樹型中大型且開張，枝葉及芽密生，幼芽呈淡紅色，葉型較近紡錘型，兩端較尖銳，葉色淡綠，具細且銳之鋸齒，葉肉厚且具光澤，樹勢強，採摘期極長且收成量高。')
INSERT [dbo].[Product] ([ProductID], [Name], [Type], [ProductCategory], [ProductPicture], [ProductDescription]) VALUES (20, N'鐵觀音', N'茶葉', N'青茶', N'/productImg/20.jpg', N'屬於小葉種，晚生種適製鐵觀音茶，樹型大枝條粗，但枝葉及芽密度很疏，幼芽稍帶紅色，葉型長橢圓至狹長型，葉緣起伏大，呈波浪狀，鋸齒大但不銳利，葉肉極厚且富有光澤，樹勢較弱且收成量少，本品種目前僅栽培於台北市文山區的木柵地區，是最佳的鐵觀音茶種。')
INSERT [dbo].[Product] ([ProductID], [Name], [Type], [ProductCategory], [ProductPicture], [ProductDescription]) VALUES (21, N'青心烏龍茶', N'茶葉', N'青茶', N'/productImg/21.jpg', N'屬於小葉種，適合製造部分發酵的晚生種，由於本品種是一個極有歷史並且被廣泛種植的品種，因此有青心烏龍，種仔，種茶，軟枝烏龍等別名。樹型稍小，屬於開張型，枝葉較密生，幼芽成紫色，葉片狹長橢圓形，葉肉稍厚柔軟富彈性，葉色濃綠富光澤。')
INSERT [dbo].[Product] ([ProductID], [Name], [Type], [ProductCategory], [ProductPicture], [ProductDescription]) VALUES (22, N'普洱茶', N'茶葉', N'黑茶', N'/productImg/22.jpg', N'百分之百發酵，採用不萎凋後發酵')
INSERT [dbo].[Product] ([ProductID], [Name], [Type], [ProductCategory], [ProductPicture], [ProductDescription]) VALUES (23, N'南瓜壺', N'茶壺', N'紫泥', N'/productImg/23.jpg', N'造型扁平，壺身作八瓣南瓜形，腹部圓鼓。')
INSERT [dbo].[Product] ([ProductID], [Name], [Type], [ProductCategory], [ProductPicture], [ProductDescription]) VALUES (24, N'竹節壺', N'茶壺', N'紫泥', N'/productImg/24.jpg', N'造型取材於竹，泥色紫黑透紅，細膩而不耀眼，又稱紫砂鐘形壺。')
INSERT [dbo].[Product] ([ProductID], [Name], [Type], [ProductCategory], [ProductPicture], [ProductDescription]) VALUES (25, N'隨緣壺', N'茶壺', N'紫泥', N'/productImg/25.jpg', N'形體渾圓，線條轉切自然，壺嘴精短微曲，圓蓋珠紐。')
INSERT [dbo].[Product] ([ProductID], [Name], [Type], [ProductCategory], [ProductPicture], [ProductDescription]) VALUES (26, N'金萱茶', N'茶葉', N'綠茶', N'/productImg/26.jpg', N'別名台茶十二號，其中早生，強健，高產且適合機採的特性，因此種植面積在穩定的增加中。台茶十二號樹型較大，屬於稍具直立性的橫張型，芽密度高，幼芽大，綠中帶紫，洱毛密度略少於青心烏龍，但製造時較不易脫落，故成茶上可看到明顯的洱毛。葉片大型呈橢圓型，葉緣鋸齒較疏，葉肉稍厚，濃綠且富光澤。')
INSERT [dbo].[Product] ([ProductID], [Name], [Type], [ProductCategory], [ProductPicture], [ProductDescription]) VALUES (28, N'杉林溪高山茶', N'茶葉', N'青茶', N'/productImg/28.jpg', N'茶園所產製之半球型茶，芽葉柔軟，葉肉厚，果膠質含量高，因此具有色澤翠綠鮮活，滋味甘醇滑軟，厚重帶活性，香氣淡雅，水色蜜綠顯黃及耐沖泡等特色')
INSERT [dbo].[Product] ([ProductID], [Name], [Type], [ProductCategory], [ProductPicture], [ProductDescription]) VALUES (29, N'天池茶', N'茶葉', N'綠茶', N'/productImg/29.jpg', N'天池茶工廠位於南投清境風景區，以販售茶葉為主要業務，茶葉產品皆為自產自銷，擁有多處地點和海拔高度不同的高山茶園。台灣高山茶因生長環境寒冷、日照短，所以生長緩慢，讓茶葉具有芽葉柔軟、葉肉厚實、果膠質含量高等優點，也使得芽葉中的苦澀成份降低，進而增加了甘味的口感，不論春夏秋冬哪一個季節，都可以喝到最適合當季的芬芳氣息。')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseOrderDetail] ON 

INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (1, 2, 3, 10, 1000.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (2, 2, 10, 7, 2430.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (3, 2, 22, 7, 4120.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (6, 3, 22, 1, 2000.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (8, 3, 21, 10, 7500.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (9, 3, 24, 10, 4600.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (12, 3, 18, 13, 1000.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (13, 3, 23, 10, 15200.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (1015, 2, 10, 100, 5000.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (1016, 2, 8, 7, 12000.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (1017, 2, 9, 7, 300000.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (1018, 2, 25, 10, 10.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (1019, 2, 26, 10, 10.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (1030, 1038, 9, 10, 100.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (1031, 1038, 3, 10, 100.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (1032, 1039, 1, 10, 1000.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (2032, 2039, 23, 20, 2000.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (2033, 2040, 1, 1, 200.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (2034, 2041, 1, 10, 100.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (2035, 2042, 1, 10, 1000.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (2036, 2042, 10, 10, 1000.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (2037, 2042, 21, 10, 1000.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (2038, 2042, 26, 10, 1000.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (2039, 2043, 1, 1, 1000.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (2040, 2044, 10, 2, 2000.0000)
INSERT [dbo].[PurchaseOrderDetail] ([PurchaseOrderDetailID], [PurchaseOrderID], [ProductID], [PurchaseQuantity], [UnitPrice]) VALUES (2041, 2044, 3, 2, 2000.0000)
SET IDENTITY_INSERT [dbo].[PurchaseOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseOrderHeader] ON 

INSERT [dbo].[PurchaseOrderHeader] ([PurchaseOrderID], [SupplierID], [PurchaseTotal], [PurchaseDate], [Arrival]) VALUES (2, 2, 12500.0000, CAST(N'2007-08-01T00:00:00.000' AS DateTime), 110)
INSERT [dbo].[PurchaseOrderHeader] ([PurchaseOrderID], [SupplierID], [PurchaseTotal], [PurchaseDate], [Arrival]) VALUES (3, 3, 52300.0000, CAST(N'2021-12-12T00:00:00.000' AS DateTime), 20)
INSERT [dbo].[PurchaseOrderHeader] ([PurchaseOrderID], [SupplierID], [PurchaseTotal], [PurchaseDate], [Arrival]) VALUES (5, 3, 15500.0000, CAST(N'2022-01-07T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PurchaseOrderHeader] ([PurchaseOrderID], [SupplierID], [PurchaseTotal], [PurchaseDate], [Arrival]) VALUES (8, 1, 1000.0000, CAST(N'2022-01-07T17:42:42.893' AS DateTime), 0)
INSERT [dbo].[PurchaseOrderHeader] ([PurchaseOrderID], [SupplierID], [PurchaseTotal], [PurchaseDate], [Arrival]) VALUES (9, 2, 1000.0000, CAST(N'2022-01-07T17:43:10.807' AS DateTime), 0)
INSERT [dbo].[PurchaseOrderHeader] ([PurchaseOrderID], [SupplierID], [PurchaseTotal], [PurchaseDate], [Arrival]) VALUES (10, 2, 1000.0000, CAST(N'2022-01-07T17:44:39.203' AS DateTime), 0)
INSERT [dbo].[PurchaseOrderHeader] ([PurchaseOrderID], [SupplierID], [PurchaseTotal], [PurchaseDate], [Arrival]) VALUES (11, 2, 1000.0000, CAST(N'2022-01-07T17:44:49.943' AS DateTime), 0)
INSERT [dbo].[PurchaseOrderHeader] ([PurchaseOrderID], [SupplierID], [PurchaseTotal], [PurchaseDate], [Arrival]) VALUES (1038, 1, 1000.0000, CAST(N'2022-01-08T22:06:59.477' AS DateTime), 0)
INSERT [dbo].[PurchaseOrderHeader] ([PurchaseOrderID], [SupplierID], [PurchaseTotal], [PurchaseDate], [Arrival]) VALUES (1039, 2, 2000.0000, CAST(N'2022-01-09T00:21:29.767' AS DateTime), 0)
INSERT [dbo].[PurchaseOrderHeader] ([PurchaseOrderID], [SupplierID], [PurchaseTotal], [PurchaseDate], [Arrival]) VALUES (2039, 1, 1000.0000, CAST(N'2022-01-10T02:21:09.523' AS DateTime), 0)
INSERT [dbo].[PurchaseOrderHeader] ([PurchaseOrderID], [SupplierID], [PurchaseTotal], [PurchaseDate], [Arrival]) VALUES (2040, 3, 999.0000, CAST(N'2022-01-10T10:27:13.967' AS DateTime), 0)
INSERT [dbo].[PurchaseOrderHeader] ([PurchaseOrderID], [SupplierID], [PurchaseTotal], [PurchaseDate], [Arrival]) VALUES (2041, 5, 1000.0000, CAST(N'2022-01-10T10:27:44.850' AS DateTime), 0)
INSERT [dbo].[PurchaseOrderHeader] ([PurchaseOrderID], [SupplierID], [PurchaseTotal], [PurchaseDate], [Arrival]) VALUES (2042, 3, 1000.0000, CAST(N'2022-01-10T10:28:22.660' AS DateTime), 0)
INSERT [dbo].[PurchaseOrderHeader] ([PurchaseOrderID], [SupplierID], [PurchaseTotal], [PurchaseDate], [Arrival]) VALUES (2043, 3, 1000.0000, CAST(N'2022-01-10T10:31:01.947' AS DateTime), 0)
INSERT [dbo].[PurchaseOrderHeader] ([PurchaseOrderID], [SupplierID], [PurchaseTotal], [PurchaseDate], [Arrival]) VALUES (2044, 4, 999.0000, CAST(N'2022-01-10T10:32:44.310' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[PurchaseOrderHeader] OFF
GO
SET IDENTITY_INSERT [dbo].[SalesOrderDetail] ON 

INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailID], [SalesOrderID], [ProductID], [SalesQuantity], [UnitPrice]) VALUES (1, 1, 14, 52, 9600.0000)
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailID], [SalesOrderID], [ProductID], [SalesQuantity], [UnitPrice]) VALUES (2, 1, 19, 10, 12055.0000)
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailID], [SalesOrderID], [ProductID], [SalesQuantity], [UnitPrice]) VALUES (3, 2, 15, 6, 1250.0000)
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailID], [SalesOrderID], [ProductID], [SalesQuantity], [UnitPrice]) VALUES (4, 1, 3, 4, 111.0000)
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailID], [SalesOrderID], [ProductID], [SalesQuantity], [UnitPrice]) VALUES (5, 2, 10, 7, 111.0000)
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailID], [SalesOrderID], [ProductID], [SalesQuantity], [UnitPrice]) VALUES (6, 1, 22, 5, 222.0000)
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailID], [SalesOrderID], [ProductID], [SalesQuantity], [UnitPrice]) VALUES (9, 2, 22, 1, 222.0000)
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailID], [SalesOrderID], [ProductID], [SalesQuantity], [UnitPrice]) VALUES (10, 1, 23, 21, 222.0000)
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailID], [SalesOrderID], [ProductID], [SalesQuantity], [UnitPrice]) VALUES (11, 5, 1, 1, 1000.0000)
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailID], [SalesOrderID], [ProductID], [SalesQuantity], [UnitPrice]) VALUES (12, 6, 9, 10, 100.0000)
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailID], [SalesOrderID], [ProductID], [SalesQuantity], [UnitPrice]) VALUES (13, 7, 15, 20, 100.0000)
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailID], [SalesOrderID], [ProductID], [SalesQuantity], [UnitPrice]) VALUES (14, 8, 15, 10, 1000.0000)
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailID], [SalesOrderID], [ProductID], [SalesQuantity], [UnitPrice]) VALUES (15, 9, 15, 30, 4100.0000)
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailID], [SalesOrderID], [ProductID], [SalesQuantity], [UnitPrice]) VALUES (16, 13, 3, 30, 1000.0000)
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailID], [SalesOrderID], [ProductID], [SalesQuantity], [UnitPrice]) VALUES (17, 15, 1, 20, 30.0000)
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailID], [SalesOrderID], [ProductID], [SalesQuantity], [UnitPrice]) VALUES (18, 15, 13, 11, 100.0000)
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailID], [SalesOrderID], [ProductID], [SalesQuantity], [UnitPrice]) VALUES (1020, 1014, 1, 10, 100.0000)
INSERT [dbo].[SalesOrderDetail] ([SalesOrderDetailID], [SalesOrderID], [ProductID], [SalesQuantity], [UnitPrice]) VALUES (1021, 1015, 1, 10, 100.0000)
SET IDENTITY_INSERT [dbo].[SalesOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[SalesOrderHeader] ON 

INSERT [dbo].[SalesOrderHeader] ([SalesOrderID], [Customer], [SalesTotal], [SalesDate]) VALUES (1, N'Kevin', 1000.0000, CAST(N'2021-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesOrderHeader] ([SalesOrderID], [Customer], [SalesTotal], [SalesDate]) VALUES (2, N'Kobe ', 3200.0000, CAST(N'2021-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesOrderHeader] ([SalesOrderID], [Customer], [SalesTotal], [SalesDate]) VALUES (5, N'雞雞', 1000.0000, CAST(N'2022-01-08T20:33:15.940' AS DateTime))
INSERT [dbo].[SalesOrderHeader] ([SalesOrderID], [Customer], [SalesTotal], [SalesDate]) VALUES (6, N'雞雞', 1000.0000, CAST(N'2022-01-08T21:47:26.073' AS DateTime))
INSERT [dbo].[SalesOrderHeader] ([SalesOrderID], [Customer], [SalesTotal], [SalesDate]) VALUES (7, N'雞雞', 1000.0000, CAST(N'2022-01-08T21:48:33.343' AS DateTime))
INSERT [dbo].[SalesOrderHeader] ([SalesOrderID], [Customer], [SalesTotal], [SalesDate]) VALUES (8, N'雞雞', 1000.0000, CAST(N'2022-01-08T21:49:37.803' AS DateTime))
INSERT [dbo].[SalesOrderHeader] ([SalesOrderID], [Customer], [SalesTotal], [SalesDate]) VALUES (9, N'雞雞', 1000.0000, CAST(N'2022-01-08T22:08:26.837' AS DateTime))
INSERT [dbo].[SalesOrderHeader] ([SalesOrderID], [Customer], [SalesTotal], [SalesDate]) VALUES (10, N'雞雞', 1000.0000, CAST(N'2022-01-08T22:40:22.033' AS DateTime))
INSERT [dbo].[SalesOrderHeader] ([SalesOrderID], [Customer], [SalesTotal], [SalesDate]) VALUES (11, N'雞雞', 1000.0000, CAST(N'2022-01-08T22:41:08.130' AS DateTime))
INSERT [dbo].[SalesOrderHeader] ([SalesOrderID], [Customer], [SalesTotal], [SalesDate]) VALUES (12, N'雞雞', 1000.0000, CAST(N'2022-01-08T22:42:17.590' AS DateTime))
INSERT [dbo].[SalesOrderHeader] ([SalesOrderID], [Customer], [SalesTotal], [SalesDate]) VALUES (13, N'雞雞', 1000.0000, CAST(N'2022-01-08T22:44:51.490' AS DateTime))
INSERT [dbo].[SalesOrderHeader] ([SalesOrderID], [Customer], [SalesTotal], [SalesDate]) VALUES (14, N'雞雞', 1212.0000, CAST(N'2022-01-09T00:17:54.120' AS DateTime))
INSERT [dbo].[SalesOrderHeader] ([SalesOrderID], [Customer], [SalesTotal], [SalesDate]) VALUES (15, N'雞雞', 1212.0000, CAST(N'2022-01-09T00:19:34.577' AS DateTime))
INSERT [dbo].[SalesOrderHeader] ([SalesOrderID], [Customer], [SalesTotal], [SalesDate]) VALUES (1014, N'雞雞', 1000.0000, CAST(N'2022-01-10T10:50:01.847' AS DateTime))
INSERT [dbo].[SalesOrderHeader] ([SalesOrderID], [Customer], [SalesTotal], [SalesDate]) VALUES (1015, N'雞雞', 1000.0000, CAST(N'2022-01-10T10:50:47.950' AS DateTime))
SET IDENTITY_INSERT [dbo].[SalesOrderHeader] OFF
GO
SET IDENTITY_INSERT [dbo].[Stock] ON 

INSERT [dbo].[Stock] ([StockID], [ProductID], [StockAmount]) VALUES (1, 1, 5)
INSERT [dbo].[Stock] ([StockID], [ProductID], [StockAmount]) VALUES (2, 2, 7)
INSERT [dbo].[Stock] ([StockID], [ProductID], [StockAmount]) VALUES (3, 3, 102)
INSERT [dbo].[Stock] ([StockID], [ProductID], [StockAmount]) VALUES (4, 10, 185)
INSERT [dbo].[Stock] ([StockID], [ProductID], [StockAmount]) VALUES (5, 22, 30)
INSERT [dbo].[Stock] ([StockID], [ProductID], [StockAmount]) VALUES (1003, 23, 21)
INSERT [dbo].[Stock] ([StockID], [ProductID], [StockAmount]) VALUES (1004, 18, 6)
INSERT [dbo].[Stock] ([StockID], [ProductID], [StockAmount]) VALUES (1007, 8, 17)
INSERT [dbo].[Stock] ([StockID], [ProductID], [StockAmount]) VALUES (1008, 9, 18)
INSERT [dbo].[Stock] ([StockID], [ProductID], [StockAmount]) VALUES (1009, 11, 10)
INSERT [dbo].[Stock] ([StockID], [ProductID], [StockAmount]) VALUES (1010, 12, 32)
INSERT [dbo].[Stock] ([StockID], [ProductID], [StockAmount]) VALUES (1011, 13, 21)
INSERT [dbo].[Stock] ([StockID], [ProductID], [StockAmount]) VALUES (1012, 14, 10)
INSERT [dbo].[Stock] ([StockID], [ProductID], [StockAmount]) VALUES (1013, 25, 10)
INSERT [dbo].[Stock] ([StockID], [ProductID], [StockAmount]) VALUES (1014, 26, 20)
SET IDENTITY_INSERT [dbo].[Stock] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([SupplierID], [SupplierName]) VALUES (1, N'Kevin Lin')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName]) VALUES (2, N'Eric Johnson')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName]) VALUES (3, N'Pamela tsuado')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName]) VALUES (4, N'123')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName]) VALUES (5, N'琦玉')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName]) VALUES (6, N'琦玉111')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName]) VALUES (7, N'sss')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName]) VALUES (8, N'rrr')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName]) VALUES (9, N'lklklkl')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName]) VALUES (10, N'popo')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [Password], [ModifiedDate]) VALUES (1, N'你上路真的爛', N'sf9600212', CAST(N'2021-12-11T21:31:55.020' AS DateTime))
INSERT [dbo].[User] ([UserID], [UserName], [Password], [ModifiedDate]) VALUES (2, N'ASP從0到100', N'willson', CAST(N'2021-12-11T21:31:55.020' AS DateTime))
INSERT [dbo].[User] ([UserID], [UserName], [Password], [ModifiedDate]) VALUES (3, N'kevinlin', N'kevin96007', CAST(N'2021-12-11T21:31:55.020' AS DateTime))
INSERT [dbo].[User] ([UserID], [UserName], [Password], [ModifiedDate]) VALUES (4, N'willson', N'123456', CAST(N'2021-12-11T21:31:55.020' AS DateTime))
INSERT [dbo].[User] ([UserID], [UserName], [Password], [ModifiedDate]) VALUES (5, N'test', N'text123', CAST(N'2021-12-14T17:12:25.980' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[PurchaseOrderHeader] ADD  CONSTRAINT [DF_PurchaseOrderHeader_PurchaseDate]  DEFAULT (getdate()) FOR [PurchaseDate]
GO
ALTER TABLE [dbo].[PurchaseOrderHeader] ADD  CONSTRAINT [DF_PurchaseOrderHeader_Arrival]  DEFAULT ((0)) FOR [Arrival]
GO
ALTER TABLE [dbo].[SalesOrderHeader] ADD  CONSTRAINT [DF_SalesOrderHeader_SalesDate]  DEFAULT (getdate()) FOR [SalesDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[PurchaseOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PurchaseOrderDetail] CHECK CONSTRAINT [FK_PurchaseOrderDetail_Product]
GO
ALTER TABLE [dbo].[PurchaseOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderDetail_PurchaseOrderHeader] FOREIGN KEY([PurchaseOrderID])
REFERENCES [dbo].[PurchaseOrderHeader] ([PurchaseOrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseOrderDetail] CHECK CONSTRAINT [FK_PurchaseOrderDetail_PurchaseOrderHeader]
GO
ALTER TABLE [dbo].[PurchaseOrderHeader]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderHeader_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[PurchaseOrderHeader] CHECK CONSTRAINT [FK_PurchaseOrderHeader_Supplier]
GO
ALTER TABLE [dbo].[SalesOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[SalesOrderDetail] CHECK CONSTRAINT [FK_SalesOrderDetail_Product]
GO
ALTER TABLE [dbo].[SalesOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderDetail_SalesOrderHeader] FOREIGN KEY([SalesOrderID])
REFERENCES [dbo].[SalesOrderHeader] ([SalesOrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SalesOrderDetail] CHECK CONSTRAINT [FK_SalesOrderDetail_SalesOrderHeader]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Product]
GO
/****** Object:  Trigger [dbo].[Purchase_Stock_Change]    Script Date: 2022/1/18 上午 01:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Purchase_Stock_Change]
ON [dbo].[PurchaseOrderDetail]
AFTER UPDATE
AS
BEGIN
 DECLARE @ProductID INT
 DECLARE @New_PurchaseQuantity INT
 DECLARE @Old_PurchaseQuantity INT
 
 SELECT @ProductID = ProductID, @New_PurchaseQuantity = PurchaseQuantity FROM inserted
 SELECT @ProductID = ProductID, @Old_PurchaseQuantity = PurchaseQuantity FROM deleted

 UPDATE Stock SET StockAmount = StockAmount + @New_PurchaseQuantity - @Old_PurchaseQuantity WHERE ProductID = @ProductID
END
GO
ALTER TABLE [dbo].[PurchaseOrderDetail] ENABLE TRIGGER [Purchase_Stock_Change]
GO
/****** Object:  Trigger [dbo].[Purchase_Stock_Delete]    Script Date: 2022/1/18 上午 01:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Purchase_Stock_Delete]
ON [dbo].[PurchaseOrderDetail]
AFTER DELETE
AS
BEGIN
 DECLARE @ProductID int 
 DECLARE @PurchaseQuantity int

 SELECT @ProductID = ProductID, @PurchaseQuantity = PurchaseQuantity FROM deleted

 UPDATE Stock SET StockAmount -= @PurchaseQuantity WHERE ProductID = @ProductID
END
GO
ALTER TABLE [dbo].[PurchaseOrderDetail] ENABLE TRIGGER [Purchase_Stock_Delete]
GO
/****** Object:  Trigger [dbo].[Purchase_Stock_Update]    Script Date: 2022/1/18 上午 01:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Purchase_Stock_Update]
ON [dbo].[PurchaseOrderDetail]
FOR INSERT
AS
BEGIN
 DECLARE @ProductID INT
 DECLARE @PurchaseQuantity INT
 
 SELECT @ProductID = ProductID, @PurchaseQuantity = PurchaseQuantity FROM inserted
 UPDATE Stock SET StockAmount += @PurchaseQuantity WHERE ProductID = @ProductID
END
GO
ALTER TABLE [dbo].[PurchaseOrderDetail] ENABLE TRIGGER [Purchase_Stock_Update]
GO
/****** Object:  Trigger [dbo].[Sales_Stock_Change]    Script Date: 2022/1/18 上午 01:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Sales_Stock_Change]
ON [dbo].[SalesOrderDetail]
AFTER UPDATE
AS
BEGIN
 DECLARE @ProductID INT
 DECLARE @New_SalesQuantity INT
 DECLARE @Old_SalesQuantity INT
 
 SELECT @ProductID = ProductID, @New_SalesQuantity = SalesQuantity FROM inserted
 SELECT @ProductID = ProductID, @Old_SalesQuantity = SalesQuantity FROM deleted

 UPDATE Stock SET StockAmount = StockAmount - @New_SalesQuantity + @Old_SalesQuantity WHERE ProductID = @ProductID
END
GO
ALTER TABLE [dbo].[SalesOrderDetail] ENABLE TRIGGER [Sales_Stock_Change]
GO
/****** Object:  Trigger [dbo].[Sales_Stock_Delete]    Script Date: 2022/1/18 上午 01:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Sales_Stock_Delete]
ON [dbo].[SalesOrderDetail]
AFTER DELETE
AS
BEGIN
 DECLARE @ProductID int 
 DECLARE @SalesQuantity int

 SELECT @ProductID = ProductID, @SalesQuantity = SalesQuantity FROM deleted

 UPDATE Stock SET StockAmount += @SalesQuantity WHERE ProductID = @ProductID
END
GO
ALTER TABLE [dbo].[SalesOrderDetail] ENABLE TRIGGER [Sales_Stock_Delete]
GO
/****** Object:  Trigger [dbo].[Sales_Stock_Update]    Script Date: 2022/1/18 上午 01:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Sales_Stock_Update]
ON [dbo].[SalesOrderDetail]
FOR INSERT
AS
BEGIN
 DECLARE @ProductID INT
 DECLARE @SalesQuantity INT
 
 SELECT @ProductID = ProductID, @SalesQuantity = SalesQuantity FROM inserted
 UPDATE Stock SET StockAmount -= @SalesQuantity WHERE ProductID = @ProductID
END
GO
ALTER TABLE [dbo].[SalesOrderDetail] ENABLE TRIGGER [Sales_Stock_Update]
GO
USE [master]
GO
ALTER DATABASE [TeaShopERP] SET  READ_WRITE 
GO
