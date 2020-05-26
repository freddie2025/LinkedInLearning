USE AdventureworksDW2016CTP3
GO
SET STATISTICS TIME ON

SELECT P.EnglishProductName, F.OrderDate, sum(F.SalesAmount)
FROM FactResellerSalesXL_CI F
INNER JOIN DimProduct P on P.ProductKey = F.ProductKey
WHERE OrderDate BETWEEN '2011-01-01' and '2013-01-01'
GROUP BY P.EnglishProductName, F.OrderDate
ORDER BY Sum(F.SalesAmount) DESC















CREATE INDEX NCI_FactResellerSalesXL_SalesAmount ON FactResellerSalesXL_CI (SalesAmount, orderquantity)
CREATE INDEX NCI_FactResellerSalesXL_Covering ON FactResellerSalesXL_CI (ProductKey,OrderDate)
INCLUDE (salesAmount, orderquantity)