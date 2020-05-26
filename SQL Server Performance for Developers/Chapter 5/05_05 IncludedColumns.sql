USE AdventureWorks2016CTP3
GO
SET STATISTICS IO ON 

SELECT AddressLine1, AddressLine2, City, StateProvinceID, PostalCode
FROM Person.Address
WHERE PostalCode BETWEEN '98000' and '99999';
GO

CREATE INDEX IX_Address_PostalCode
ON Person.Address (PostalCode)
INCLUDE (AddressLine1, AddressLine2, City, StateProvinceID);
GO

SELECT NationalIDNumber, HireDate, MaritalStatus
FROM HumanResources.Employee
WHERE NationalIDNumber = N'14417807'

CREATE INDEX NCI_KL_Demo on HumanResources.Employee (NationalIDNumber) INCLUDE (HireDate, MaritalStatus)





SELECT Comments
FROM Production.ProductReview 
WHERE ProductID = 937;
GO

CREATE NONCLUSTERED INDEX IX_ProductReview_ProductID_ReviewerName
ON Production.ProductReview (ProductID, ReviewerName,Comments);
GO

CREATE NONCLUSTERED INDEX IX_ProductReview_ProductID_ReviewerName_Included
ON Production.ProductReview (ProductID, ReviewerName)
INCLUDE (Comments);
GO