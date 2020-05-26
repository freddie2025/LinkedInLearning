USE [AdventureWorks2016CTP3]
GO

SELECT ProductID
FROM   Sales.SalesOrderDetail
WHERE  UnitPriceDiscount = 0.40;
GO

SELECT SalesOrderID
FROM   Sales.SalesOrderDetail
WHERE  LineTotal = 236.421500;
GO

SELECT SalesOrderID
FROM   Sales.SalesOrderHeader
WHERE  TaxAmt = '10.316';

GO

SELECT s.last_user_seek ,
       d.object_id ,
       d.equality_columns ,
       d.inequality_columns ,
       d.included_columns ,
       d.statement ,
       s.avg_user_impact
FROM   sys.dm_db_missing_index_group_stats AS s
       INNER JOIN sys.dm_db_missing_index_groups AS g ON ( s.group_handle = g.index_group_handle )
       INNER JOIN sys.dm_db_missing_index_details AS d ON ( g.index_handle = d.index_handle );


-- DROP INDEX NCI_SalesOrderDetail_UnitPriceDiscount ON [Sales].[SalesOrderDetail]
CREATE INDEX NCI_SalesOrderDetail_UnitPriceDiscount
ON [Sales].[SalesOrderDetail] ([UnitPriceDiscount])
INCLUDE ([ProductID])