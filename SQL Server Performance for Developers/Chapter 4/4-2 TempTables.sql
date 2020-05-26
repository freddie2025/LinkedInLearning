USE AdventureWorks2016CTP3
GO

DECLARE @temp TABLE
    (
        ProductID INT ,
        SalesOrderID INT ,
        SalesOrderDetailID INT ,
        OrderQty SMALLINT ,
        PRIMARY KEY CLUSTERED
        (
            SalesOrderID ,
            SalesOrderDetailID ) ,
        UNIQUE NONCLUSTERED
        (
            ProductID ,
            SalesOrderID ,
            SalesOrderDetailID )
    );

INSERT INTO @temp ( ProductID ,
                    SalesOrderID ,
                    SalesOrderDetailID ,
                    OrderQty )
            SELECT ProductID ,
                   SalesOrderID ,
                   SalesOrderDetailID ,
                   OrderQty
            FROM   Sales.SalesOrderDetail;
SELECT temp.SalesOrderID ,
       temp.SalesOrderDetailID ,
       temp.ProductID ,
       temp.OrderQty
FROM   @temp AS temp
WHERE  temp.SalesOrderID = 43661;
GO


DECLARE @a TABLE (i INT);

WITH Nums (i) AS
(
 SELECT 1
 FROM (VALUES (1), (1), (1), (1), (1), (1), (1), (1), (1), (1)) n(i)

)
INSERT INTO @a(i)
SELECT n1.i
FROM Nums n1
CROSS JOIN Nums n2
CROSS JOIN Nums n3
CROSS JOIN Nums n4
CROSS JOIN Nums n5
CROSS JOIN Nums n6

select i from @a --OPTION (RECOMPILE)