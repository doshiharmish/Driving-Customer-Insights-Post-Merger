-------------------------DIM DATE-----------------------------
USE [ist722_hhkhan_ca5_dw]
GO

ALTER TABLE [dbo5].[DimDate] DROP CONSTRAINT [DF__DimDate__IsAWeek__4E1E9780]
GO

/****** Object:  Table [dbo5].[DimDate]    Script Date: 8/17/2023 1:38:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo5].[DimDate]') AND type in (N'U'))
DROP TABLE [dbo5].[DimDate]
GO

/****** Object:  Table [dbo5].[DimDate]    Script Date: 8/17/2023 1:38:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo5].[DimDate](
	[DateKey] [int] NOT NULL,
	[Date] [datetime] NULL,
	[FullDateUSA] [nchar](11) NOT NULL,
	[DayOfWeek] [tinyint] NOT NULL,
	[DayName] [nchar](10) NOT NULL,
	[DayOfMonth] [tinyint] NOT NULL,
	[DayOfYear] [int] NULL,
	[WeekOfYear] [tinyint] NOT NULL,
	[MonthName] [nchar](10) NOT NULL,
	[MonthOfYear] [tinyint] NOT NULL,
	[Quarter] [tinyint] NOT NULL,
	[QuarterName] [nchar](10) NOT NULL,
	[Year] [int] NULL,
	[IsAWeekday] [varchar](1) NOT NULL,
 CONSTRAINT [PK_dbo5.DimDate] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo5].[DimDate] ADD  DEFAULT ('N') FOR [IsAWeekday]
GO


--------------------------DIM CUSTOMERS---------------------------------------------
USE [ist722_hhkhan_ca5_dw]
GO

ALTER TABLE [dbo5].[DimCustomers] DROP CONSTRAINT [DF__DimCustom__RowEn__39E294A9]
GO

ALTER TABLE [dbo5].[DimCustomers] DROP CONSTRAINT [DF__DimCustom__RowSt__38EE7070]
GO

ALTER TABLE [dbo5].[DimCustomers] DROP CONSTRAINT [DF__DimCustom__RowIs__37FA4C37]
GO

/****** Object:  Table [dbo5].[DimCustomers]    Script Date: 8/17/2023 1:39:25 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo5].[DimCustomers]') AND type in (N'U'))
DROP TABLE [dbo5].[DimCustomers]
GO

/****** Object:  Table [dbo5].[DimCustomers]    Script Date: 8/17/2023 1:39:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo5].[DimCustomers](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nvarchar](10) NOT NULL,
	[CustomerEmail] [nvarchar](200) NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[CustomerAddress] [nvarchar](255) NOT NULL,
	[CustomerCity] [char](50) NULL,
	[CustomerState] [char](2) NULL,
	[CustomerZipCode] [nvarchar](10) NULL,
	[Source] [nvarchar](10) NOT NULL,
	[RowIsCurrent] [bit] NOT NULL,
	[RowStartDate] [datetime] NOT NULL,
	[RowEndDate] [datetime] NOT NULL,
	[RowChangeReason] [nvarchar](200) NULL,
 CONSTRAINT [PK_dbo5.DimCustomers] PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo5].[DimCustomers] ADD  DEFAULT ((1)) FOR [RowIsCurrent]
GO

ALTER TABLE [dbo5].[DimCustomers] ADD  DEFAULT ('12/31/1899') FOR [RowStartDate]
GO

ALTER TABLE [dbo5].[DimCustomers] ADD  DEFAULT ('12/31/9999') FOR [RowEndDate]
GO

-----------------------------------DIM PRODUCTS---------------------------------------------------------
USE [ist722_hhkhan_ca5_dw]
GO

ALTER TABLE [dbo5].[DimProducts] DROP CONSTRAINT [DF__DimProduc__RowEn__6E8B6712]
GO

ALTER TABLE [dbo5].[DimProducts] DROP CONSTRAINT [DF__DimProduc__RowSt__6D9742D9]
GO

ALTER TABLE [dbo5].[DimProducts] DROP CONSTRAINT [DF__DimProduc__RowIs__6CA31EA0]
GO

ALTER TABLE [dbo5].[DimProducts] DROP CONSTRAINT [DF__DimProduc__Produ__6BAEFA67]
GO

ALTER TABLE [dbo5].[DimProducts] DROP CONSTRAINT [DF__DimProduc__Produ__6ABAD62E]
GO

ALTER TABLE [dbo5].[DimProducts] DROP CONSTRAINT [DF__DimProduc__Produ__69C6B1F5]
GO

ALTER TABLE [dbo5].[DimProducts] DROP CONSTRAINT [DF__DimProduc__Produ__68D28DBC]
GO

/****** Object:  Table [dbo5].[DimProducts]    Script Date: 8/17/2023 1:39:53 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo5].[DimProducts]') AND type in (N'U'))
DROP TABLE [dbo5].[DimProducts]
GO

/****** Object:  Table [dbo5].[DimProducts]    Script Date: 8/17/2023 1:39:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo5].[DimProducts](
	[ProductKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [varchar](20) NOT NULL,
	[ProductName] [varchar](200) NOT NULL,
	[ProductDescription] [varchar](1000) NULL,
	[ProductCategory] [varchar](20) NOT NULL,
	[ProductReleasedYear] [int] NOT NULL,
	[Source] [varchar](10) NOT NULL,
	[RowIsCurrent] [bit] NOT NULL,
	[RowStartDate] [datetime] NOT NULL,
	[RowEndDate] [datetime] NOT NULL,
	[RowChangeReason] [nvarchar](200) NULL,
 CONSTRAINT [PK_dbo5.DimProducts] PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo5].[DimProducts] ADD  DEFAULT ('PN_N/A') FOR [ProductName]
GO

ALTER TABLE [dbo5].[DimProducts] ADD  DEFAULT ('D_N/A') FOR [ProductDescription]
GO

ALTER TABLE [dbo5].[DimProducts] ADD  DEFAULT ('C_N/A') FOR [ProductCategory]
GO

ALTER TABLE [dbo5].[DimProducts] ADD  DEFAULT ((1800)) FOR [ProductReleasedYear]
GO

ALTER TABLE [dbo5].[DimProducts] ADD  DEFAULT ((1)) FOR [RowIsCurrent]
GO

ALTER TABLE [dbo5].[DimProducts] ADD  DEFAULT ('12/31/1899') FOR [RowStartDate]
GO

ALTER TABLE [dbo5].[DimProducts] ADD  DEFAULT ('12/31/9999') FOR [RowEndDate]
GO
-------------------------Fact Reviews------------------
USE [ist722_hhkhan_ca5_dw]
GO

ALTER TABLE [dbo5].[FactReviews] DROP CONSTRAINT [FK_dbo5_FactReviews_ReviewDateKey]
GO

ALTER TABLE [dbo5].[FactReviews] DROP CONSTRAINT [FK_dbo5_FactReviews_ProductKey]
GO

ALTER TABLE [dbo5].[FactReviews] DROP CONSTRAINT [FK_dbo5_FactReviews_CustomerKey]
GO

ALTER TABLE [dbo5].[FactReviews] DROP CONSTRAINT [DF__FactRevie__Custo__762C88DA]
GO

/****** Object:  Table [dbo5].[FactReviews]    Script Date: 8/17/2023 2:12:20 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo5].[FactReviews]') AND type in (N'U'))
DROP TABLE [dbo5].[FactReviews]
GO

/****** Object:  Table [dbo5].[FactReviews]    Script Date: 8/17/2023 2:12:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo5].[FactReviews](
	[CustomerKey] [int] NOT NULL,
	[ReviewDateKey] [int] NOT NULL,
	[CustomerRatings] [int] NULL,
	[ProductKey] [int] NOT NULL,
	[Source] [varchar](10) NOT NULL,
 CONSTRAINT [PK_dbo5.FactReviews] PRIMARY KEY NONCLUSTERED 
(
	[CustomerKey] ASC,
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo5].[FactReviews] ADD  DEFAULT ((0)) FOR [CustomerRatings]
GO

ALTER TABLE [dbo5].[FactReviews]  WITH CHECK ADD  CONSTRAINT [FK_dbo5_FactReviews_CustomerKey] FOREIGN KEY([CustomerKey])
REFERENCES [dbo5].[DimCustomers] ([CustomerKey])
GO

ALTER TABLE [dbo5].[FactReviews] CHECK CONSTRAINT [FK_dbo5_FactReviews_CustomerKey]
GO

ALTER TABLE [dbo5].[FactReviews]  WITH CHECK ADD  CONSTRAINT [FK_dbo5_FactReviews_ProductKey] FOREIGN KEY([ProductKey])
REFERENCES [dbo5].[DimProducts] ([ProductKey])
GO

ALTER TABLE [dbo5].[FactReviews] CHECK CONSTRAINT [FK_dbo5_FactReviews_ProductKey]
GO

ALTER TABLE [dbo5].[FactReviews]  WITH CHECK ADD  CONSTRAINT [FK_dbo5_FactReviews_ReviewDateKey] FOREIGN KEY([ReviewDateKey])
REFERENCES [dbo5].[DimDate] ([DateKey])
GO

ALTER TABLE [dbo5].[FactReviews] CHECK CONSTRAINT [FK_dbo5_FactReviews_ReviewDateKey]
GO


INSERT INTO dbo5.DimDate (DateKey, Date, FullDateUSA, DayOfWeek, DayName, DayOfMonth, DayOfYear, WeekOfYear, MonthName, MonthOfYear, Quarter, QuarterName, Year, IsAWeekday)
VALUES (-1, '', 'Unk date', 0, 'Unk day', 0, 0, 0, 'Unk month', 0, 0, 'Unk qtr', 0, '?')
GO

SET IDENTITY_INSERT dbo5.DimCustomers ON
;
INSERT INTO dbo5.DimCustomers (CustomerKey, CustomerID, CustomerEmail, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerZipCode, Source, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason)
VALUES (-1, '-1', 'EM_N/A', 'CN_N/A', 'CAdd_N/A', 'NA', 'NA', 'CZC_N/A', 'Unk Source', 1, '12/31/1899', '12/31/9999', 'N/A');
;
SET IDENTITY_INSERT dbo5.DimCustomers OFF
GO
SET IDENTITY_INSERT dbo5.DimProducts ON
;
INSERT INTO dbo5.DimProducts (ProductKey, ProductID, ProductName, ProductDescription, ProductCategory, /*[ProductSub-Category], ProductVendor,*/ ProductReleasedYear, Source, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason)
VALUES (-1, '-1', 'PN_N/A', 'D_N/A', 'C_N/A', /*'SC_N/A', 'V_N/A',*/ 1800, 'Unk Source', 1, '12/31/1899', '12/31/9999', 'N/A')
;
SET IDENTITY_INSERT dbo5.DimProducts OFF
