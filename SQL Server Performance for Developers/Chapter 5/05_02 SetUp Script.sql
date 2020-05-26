{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf400
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww20920\viewh15200\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 SET ANSI_NULLS ON\
GO\
SET QUOTED_IDENTIFIER ON\
GO\
CREATE TABLE [dbo].[FactResellerSalesXL_Heap](\
	[ProductKey] [int] NOT NULL,\
	[OrderDateKey] [int] NOT NULL,\
	[DueDateKey] [int] NOT NULL,\
	[ShipDateKey] [int] NOT NULL,\
	[ResellerKey] [int] NOT NULL,\
	[EmployeeKey] [int] NOT NULL,\
	[PromotionKey] [int] NOT NULL,\
	[CurrencyKey] [int] NOT NULL,\
	[SalesTerritoryKey] [int] NOT NULL,\
	[SalesOrderNumber] [nvarchar](20) NOT NULL,\
	[SalesOrderLineNumber] [tinyint] NOT NULL,\
	[RevisionNumber] [tinyint] NULL,\
	[OrderQuantity] [smallint] NULL,\
	[UnitPrice] [money] NULL,\
	[ExtendedAmount] [money] NULL,\
	[UnitPriceDiscountPct] [float] NULL,\
	[DiscountAmount] [float] NULL,\
	[ProductStandardCost] [money] NULL,\
	[TotalProductCost] [money] NULL,\
	[SalesAmount] [money] NULL,\
	[TaxAmt] [money] NULL,\
	[Freight] [money] NULL,\
	[CarrierTrackingNumber] [nvarchar](25) NULL,\
	[CustomerPONumber] [nvarchar](25) NULL,\
	[OrderDate] [datetime] NULL,\
	[DueDate] [datetime] NULL,\
	[ShipDate] [datetime] NULL\
) ON [PRIMARY]\
\
GO\
SET ANSI_PADDING ON\
\
INSERT INTO [FactResellerSalesXL_Heap] SELECT * FROM [FactResellerSalesXL_CCI]\
\
\
CREATE TABLE [dbo].[FactResellerSalesXL_CI](\
	[ProductKey] [int] NOT NULL,\
	[OrderDateKey] [int] NOT NULL,\
	[DueDateKey] [int] NOT NULL,\
	[ShipDateKey] [int] NOT NULL,\
	[ResellerKey] [int] NOT NULL,\
	[EmployeeKey] [int] NOT NULL,\
	[PromotionKey] [int] NOT NULL,\
	[CurrencyKey] [int] NOT NULL,\
	[SalesTerritoryKey] [int] NOT NULL,\
	[SalesOrderNumber] [nvarchar](20) NOT NULL,\
	[SalesOrderLineNumber] [tinyint] NOT NULL,\
	[RevisionNumber] [tinyint] NULL,\
	[OrderQuantity] [smallint] NULL,\
	[UnitPrice] [money] NULL,\
	[ExtendedAmount] [money] NULL,\
	[UnitPriceDiscountPct] [float] NULL,\
	[DiscountAmount] [float] NULL,\
	[ProductStandardCost] [money] NULL,\
	[TotalProductCost] [money] NULL,\
	[SalesAmount] [money] NULL,\
	[TaxAmt] [money] NULL,\
	[Freight] [money] NULL,\
	[CarrierTrackingNumber] [nvarchar](25) NULL,\
	[CustomerPONumber] [nvarchar](25) NULL,\
	[OrderDate] [datetime] NULL,\
	[DueDate] [datetime] NULL,\
	[ShipDate] [datetime] NULL\
) ON [PRIMARY]\
\
GO\
SET ANSI_PADDING ON\
\
CREATE CLUSTERED INDEX [CI_Fact_ResellerSalesXL_CIDemo] on [CI_Fact_ResellerSalesXL] (ProductKey)\
GO\
INSERT INTO [CI_Fact_ResellerSalesXL_CIDemo] SELECT * FROM [FactResellerSalesXL_CCI]\
GO}