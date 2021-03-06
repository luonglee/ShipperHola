USE [master]
GO
/****** Object:  Database [ShipperHola]    Script Date: 9/17/2017 9:03:14 PM ******/
CREATE DATABASE [ShipperHola]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShipperHola', FILENAME = N'C:\Applications\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\ShipperHola.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShipperHola_log', FILENAME = N'C:\Applications\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\ShipperHola_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ShipperHola] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShipperHola].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShipperHola] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShipperHola] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShipperHola] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShipperHola] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShipperHola] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShipperHola] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShipperHola] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShipperHola] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShipperHola] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShipperHola] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShipperHola] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShipperHola] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShipperHola] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShipperHola] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShipperHola] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShipperHola] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShipperHola] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShipperHola] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShipperHola] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShipperHola] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShipperHola] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShipperHola] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShipperHola] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShipperHola] SET  MULTI_USER 
GO
ALTER DATABASE [ShipperHola] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShipperHola] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShipperHola] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShipperHola] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShipperHola] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShipperHola] SET QUERY_STORE = OFF
GO
USE [ShipperHola]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ShipperHola]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 9/17/2017 9:03:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[password] [varchar](30) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[gender] [bit] NULL,
	[dateOfBirth] [date] NULL,
	[email] [varchar](255) NULL,
	[phoneNumber] [varchar](20) NULL,
	[address] [nvarchar](max) NULL,
	[facebookUrl] [varchar](max) NULL,
	[role] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_Account_username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 9/17/2017 9:03:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[accountId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[note] [nvarchar](max) NULL,
 CONSTRAINT [PK_CartItem] PRIMARY KEY CLUSTERED 
(
	[accountId] ASC,
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 9/17/2017 9:03:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 9/17/2017 9:03:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[buyerAddress] [nvarchar](max) NOT NULL,
	[buyerPhoneNumber] [varchar](20) NOT NULL,
	[paymentMethod] [varchar](20) NOT NULL,
	[status] [varchar](20) NOT NULL,
	[buyerId] [int] NOT NULL,
	[productId] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderMessage]    Script Date: 9/17/2017 9:03:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderMessage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[accountId] [int] NOT NULL,
	[repliedMessageId] [int] NULL,
	[orderId] [int] NOT NULL,
 CONSTRAINT [PK_OrderMessage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 9/17/2017 9:03:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[currentPrice] [float] NOT NULL,
	[allowOrder] [nchar](10) NOT NULL,
	[categoryId] [int] NOT NULL,
	[sellerId] [int] NOT NULL,
	[pictureUrl] [varchar](max) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_ShippingAddress]    Script Date: 9/17/2017 9:03:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_ShippingAddress](
	[productId] [int] NOT NULL,
	[shippingAddressId] [int] NOT NULL,
 CONSTRAINT [PK_Product_ShippingAddress] PRIMARY KEY CLUSTERED 
(
	[productId] ASC,
	[shippingAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductComment]    Script Date: 9/17/2017 9:03:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductComment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[accountId] [int] NOT NULL,
	[repliedCommentId] [int] NULL,
	[productId] [int] NOT NULL,
 CONSTRAINT [PK_ProductComment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductReview]    Script Date: 9/17/2017 9:03:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductReview](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[rating] [float] NOT NULL,
	[content] [nvarchar](max) NULL,
	[accountId] [int] NOT NULL,
	[productId] [int] NOT NULL,
 CONSTRAINT [PK_ProductReview] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SearchKeyword]    Script Date: 9/17/2017 9:03:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SearchKeyword](
	[keyword] [nvarchar](255) NOT NULL,
	[searchCount] [bigint] NOT NULL,
 CONSTRAINT [PK_SearchKeyword] PRIMARY KEY CLUSTERED 
(
	[keyword] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShippingAddress]    Script Date: 9/17/2017 9:03:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingAddress](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_ShippingAddress] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_paymentMethod]  DEFAULT ('COD') FOR [paymentMethod]
GO
ALTER TABLE [dbo].[SearchKeyword] ADD  CONSTRAINT [DF_SearchKeyword_searchCount]  DEFAULT ((0)) FOR [searchCount]
GO
ALTER TABLE [dbo].[CartItem]  WITH NOCHECK ADD  CONSTRAINT [FK_CartItem_Account] FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_CartItem_Account]
GO
ALTER TABLE [dbo].[CartItem]  WITH NOCHECK ADD  CONSTRAINT [FK_CartItem_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_CartItem_Product]
GO
ALTER TABLE [dbo].[Order]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([buyerId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[Order]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[OrderMessage]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderMessage_Account] FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[OrderMessage] CHECK CONSTRAINT [FK_OrderMessage_Account]
GO
ALTER TABLE [dbo].[OrderMessage]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderMessage_Order] FOREIGN KEY([orderId])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderMessage] CHECK CONSTRAINT [FK_OrderMessage_Order]
GO
ALTER TABLE [dbo].[OrderMessage]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderMessage_OrderMessage] FOREIGN KEY([repliedMessageId])
REFERENCES [dbo].[OrderMessage] ([id])
GO
ALTER TABLE [dbo].[OrderMessage] CHECK CONSTRAINT [FK_OrderMessage_OrderMessage]
GO
ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD  CONSTRAINT [FK_Product_Account] FOREIGN KEY([sellerId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Account]
GO
ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product_ShippingAddress]  WITH NOCHECK ADD  CONSTRAINT [FK_Product_ShippingAddress_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Product_ShippingAddress] CHECK CONSTRAINT [FK_Product_ShippingAddress_Product]
GO
ALTER TABLE [dbo].[Product_ShippingAddress]  WITH NOCHECK ADD  CONSTRAINT [FK_Product_ShippingAddress_ShippingAddress] FOREIGN KEY([shippingAddressId])
REFERENCES [dbo].[ShippingAddress] ([id])
GO
ALTER TABLE [dbo].[Product_ShippingAddress] CHECK CONSTRAINT [FK_Product_ShippingAddress_ShippingAddress]
GO
ALTER TABLE [dbo].[ProductComment]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductComment_Account] FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[ProductComment] CHECK CONSTRAINT [FK_ProductComment_Account]
GO
ALTER TABLE [dbo].[ProductComment]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductComment_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[ProductComment] CHECK CONSTRAINT [FK_ProductComment_Product]
GO
ALTER TABLE [dbo].[ProductComment]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductComment_ProductComment] FOREIGN KEY([repliedCommentId])
REFERENCES [dbo].[ProductComment] ([id])
GO
ALTER TABLE [dbo].[ProductComment] CHECK CONSTRAINT [FK_ProductComment_ProductComment]
GO
ALTER TABLE [dbo].[ProductReview]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductReview_Account] FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[ProductReview] CHECK CONSTRAINT [FK_ProductReview_Account]
GO
ALTER TABLE [dbo].[ProductReview]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductReview_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[ProductReview] CHECK CONSTRAINT [FK_ProductReview_Product]
GO
USE [master]
GO
ALTER DATABASE [ShipperHola] SET  READ_WRITE 
GO
