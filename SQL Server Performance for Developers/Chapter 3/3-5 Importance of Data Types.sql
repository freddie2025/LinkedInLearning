USE AdventureWorks2016CTP3
GO
SET STATISTICS IO, TIME ON

SELECT BusinessEntityID, NationalIDNumber, LoginID
FROM HumanResources.Employee
WHERE NationalIDNumber = 112457891
GO
DBCC FREEPROCCACHE
GO

SELECT BusinessEntityID, NationalIDNumber, LoginID
FROM HumanResources.Employee
WHERE NationalIDNumber = '112457891'
go









CREATE INDEX NCI_Employee_NationalIDNumber_Login_BEID on HumanResources.Employee (NationalIDNumber)
INCLUDE (BusinessEntityID, LoginID)