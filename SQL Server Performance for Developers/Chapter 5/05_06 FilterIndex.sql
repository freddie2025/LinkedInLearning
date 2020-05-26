USE AdventureWorks2016CTP3
GO

SET STATISTICS TIME, IO ON 

SELECT UnitPrice, Count(UnitPrice)+'+' AS CountHist
FROM Sales.SalesOrderDetail
GROUP BY UnitPrice
ORDER BY UnitPrice DESC


--find SalesOrderDetailIDs with UnitPrice > $2000 - no index
SELECT SalesOrderDetailID, UnitPrice
FROM Sales.SalesOrderDetail
WHERE UnitPrice > 2000
GO
 
--add nonclustered index to UnitPrice column
CREATE NONCLUSTERED INDEX NCI_SalesOrderDetail_UnitPrice
ON Sales.SalesOrderDetail (UnitPrice)
GO


--find SalesOrderDetailIDs with UnitPrice > 2000 - now using nonclustered filtered index
SELECT SalesOrderDetailID, UnitPrice
FROM Sales.SalesOrderDetail
WHERE UnitPrice > 2000
GO
 
DROP INDEX NCI_SalesOrderDetail_UnitPrice
ON Sales.SalesOrderDetail


CREATE NONCLUSTERED INDEX FIX_SalesOrderDetail_UnitPrice_High
ON Sales.SalesOrderDetail(UnitPrice)
WHERE UnitPrice > 2000
GO

CREATE NONCLUSTERED INDEX FIX_SalesOrderDetail_UnitPrice_Low
ON Sales.SalesOrderDetail(UnitPrice)
WHERE UnitPrice < 2000
GO


--find SalesOrderDetailIDs with UnitPrice > 2000 - now using nonclustered filtered index
SELECT SalesOrderDetailID, UnitPrice
FROM Sales.SalesOrderDetail
WHERE UnitPrice > 2000
GO

SELECT SalesOrderDetailID, UnitPrice
FROM Sales.SalesOrderDetail_NoFilter
WHERE UnitPrice > 2000
GO