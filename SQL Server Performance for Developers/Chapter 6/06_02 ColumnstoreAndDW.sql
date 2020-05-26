USE AdventureworksDW2016CTP3
GO
sp_spaceused 'FactResellerSalesXL_CCI'
GO
sp_spaceused 'FactResellerSalesXL_PageCompressed'
GO

-- Validate that both tables have the same amount of rows
SELECT count(*) as CCITableCount
FROM FactResellerSalesXL_CCI
GO
SELECT count(*) as PageCompressedTableCount
FROM FactResellerSalesXL_PageCompressed
GO

-- Execute a typical query that joins the Fact Table with dimension tables
-- Note this query will run on the Page Compressed table, Note down the time
SET STATISTICS IO ON 
SET STATISTICS TIME ON
GO

SELECT c.CalendarYear
	,e.ProductCategoryKey
	,count(SalesOrderNumber) AS NumSales
	,sum(SalesAmount) AS TotalSalesAmt
	,Avg(SalesAmount) AS AvgSalesAmt
	,count(DISTINCT SalesOrderNumber) AS NumOrders
FROM FactResellerSalesXL_PageCompressed a
INNER JOIN DimProduct b ON b.ProductKey = a.ProductKey
Inner JOIN DimProductSubCategory e on e.ProductSubcategoryKey = b.ProductSubCategoryKey
INNER JOIN DimDate c ON c.DateKey = a.OrderDateKey
WHERE e.ProductCategoryKey =2
	AND c.FullDateAlternateKey BETWEEN '1/1/2014' AND '1/1/2015'
GROUP BY e.ProductCategoryKey,c.CalendarYear
GO

SET STATISTICS IO OFF
SET STATISTICS TIME OFF
GO


-- This is the same Prior query on a table with a Clustered Columnstore index CCI
-- The comparison numbers are even more dramatic the larger the table is, this is a 11 million row table only.
SET STATISTICS IO ON
SET STATISTICS TIME ON
GO
SELECT c.CalendarYear
	,e.ProductCategoryKey
	,count(SalesOrderNumber) AS NumSales
	,sum(SalesAmount) AS TotalSalesAmt
	,Avg(SalesAmount) AS AvgSalesAmt
	,count(DISTINCT SalesOrderNumber) AS NumOrders
FROM FactResellerSalesXL_CCI a
INNER JOIN DimProduct b ON b.ProductKey = a.ProductKey
Inner JOIN DimProductSubCategory e on e.ProductSubcategoryKey = b.ProductSubCategoryKey
INNER JOIN DimDate c ON c.DateKey = a.OrderDateKey
WHERE e.ProductCategoryKey =2
	AND c.FullDateAlternateKey BETWEEN '1/1/2014' AND '1/1/2015'
GROUP BY e.ProductCategoryKey,c.CalendarYear
GO

SET STATISTICS IO OFF
SET STATISTICS TIME OFF
GO
