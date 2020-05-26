USE AdventureworksDW2016CTP3
GO

SET STATISTICS IO ON 
GO

SELECT  F.OrderDate, F.SalesAmount
FROM FactResellerSalesXL_CI F
WHERE OrderDate BETWEEN '2011-01-01' and '2013-01-01'
ORDER BY OrderDate

SELECT  F.OrderDate, F.SalesAmount
FROM FactResellerSalesXL_Heap F
WHERE OrderDate BETWEEN '2011-01-01' and '2013-01-01'
ORDER BY OrderDate

SELECT P.EnglishProductName, F.OrderDate, F.SalesAmount
FROM FactResellerSalesXL_CI F
INNER JOIN DimProduct P on P.ProductKey = F.ProductKey
WHERE OrderDate BETWEEN '2011-01-01' and '2013-01-01'
ORDER BY OrderDate

SELECT P.EnglishProductName, F.OrderDate, F.SalesAmount
FROM FactResellerSalesXL_Heap F
INNER JOIN DimProduct P on P.ProductKey = F.ProductKey
WHERE OrderDate BETWEEN '2011-01-01' and '2013-01-01'
ORDER BY OrderDate