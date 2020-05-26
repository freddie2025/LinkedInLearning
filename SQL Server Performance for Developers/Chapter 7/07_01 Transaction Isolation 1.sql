-- init

USE DemoDB

--Start Transaction

BEGIN TRAN
UPDATE  dbo.TestIsolationLevels 
SET     Salary = 25000
WHERE   EmpID = 2900

--ROLLBACK
