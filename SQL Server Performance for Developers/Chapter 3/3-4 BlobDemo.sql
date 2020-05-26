IF OBJECT_id('FileStorageDemo') IS NOT NULL
                BEGIN DROP TABLE FileStorageDemo END
IF OBJECT_id('RowStore') IS NOT NULL
                BEGIN DROP TABLE RowStore END
GO
CREATE TABLE RowStore (ID INT IDENTITY, Value VARCHAR(20))
DECLARE @x INT = 10000;
WHILE @x > 0
	BEGIN
INSERT INTO RowStore (Value) VALUES ('DemoExample')
SET @x -= 1;
	END;

CREATE TABLE FileStorageDemo (theFile VARBINARY(max))
go
 
INSERT FileStorageDemo (theFile)
SELECT *
FROM OPENROWSET(BULK 'C:\temp\Capture.PNG', SINGLE_BLOB) AS x
 
SELECT * FROM FileStorageDemo
 
 
DBCC IND('TempDb', 'FileStorageDemo', 1)
DBCC IND('TempDb', 'RowStore', 1)