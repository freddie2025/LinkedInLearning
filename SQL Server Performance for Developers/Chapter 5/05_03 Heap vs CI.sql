USE AdventureworksDW2016CTP3
GO

SET STATISTICS TIME ON


BULK INSERT FactProductInventory_CI FROM 'C:\temp\FactProduct.csv'
	WITH
	 (
	 	FIELDTERMINATOR  = ','
	 );


BULK INSERT FactProductInventory_HEAP FROM 'C:\temp\FactProduct.csv'
	WITH
	 (
	 	FIELDTERMINATOR  = ','
	 );