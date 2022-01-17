USE [master]
GO
/****** Object:  Database [TeaShopERP]    Script Date: 2022/1/17 下午 09:24:09 ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 2022/1/17 下午 09:24:09 ******/
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
/****** Object:  Table [dbo].[PurchaseOrderDetail]    Script Date: 2022/1/17 下午 09:24:09 ******/
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
/****** Object:  Table [dbo].[PurchaseOrderHeader]    Script Date: 2022/1/17 下午 09:24:09 ******/
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
/****** Object:  Table [dbo].[SalesOrderDetail]    Script Date: 2022/1/17 下午 09:24:09 ******/
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
/****** Object:  Table [dbo].[SalesOrderHeader]    Script Date: 2022/1/17 下午 09:24:09 ******/
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
/****** Object:  Table [dbo].[Stock]    Script Date: 2022/1/17 下午 09:24:09 ******/
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
/****** Object:  Table [dbo].[Supplier]    Script Date: 2022/1/17 下午 09:24:09 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 2022/1/17 下午 09:24:09 ******/
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
/****** Object:  Trigger [dbo].[Purchase_Stock_Change]    Script Date: 2022/1/17 下午 09:24:09 ******/
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
/****** Object:  Trigger [dbo].[Purchase_Stock_Delete]    Script Date: 2022/1/17 下午 09:24:10 ******/
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
/****** Object:  Trigger [dbo].[Purchase_Stock_Update]    Script Date: 2022/1/17 下午 09:24:10 ******/
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
/****** Object:  Trigger [dbo].[Sales_Stock_Change]    Script Date: 2022/1/17 下午 09:24:10 ******/
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
/****** Object:  Trigger [dbo].[Sales_Stock_Delete]    Script Date: 2022/1/17 下午 09:24:10 ******/
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
/****** Object:  Trigger [dbo].[Sales_Stock_Update]    Script Date: 2022/1/17 下午 09:24:10 ******/
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
