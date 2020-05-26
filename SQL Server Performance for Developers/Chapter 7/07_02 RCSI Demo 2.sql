USE DemoDB

BEGIN TRAN
SELECT *
FROM   DemoTable
WHERE a = 1 

select * From sys.dm_tran_version_Store

--ROLLBACK

SELECT *
FROM   DemoTable
WHERE a = 1