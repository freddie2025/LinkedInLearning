USE WideWorldImporters
GO

/* ALTER DATABASE $YourDatabase ADD FILEGROUP [IMOLTP] CONTAINS MEMORY_OPTIMIZED_DATA;
    ALTER DATABASE $YourDatabase ADD FILE (name = [IMOLTP_c1], filename = 'C:\MSSQL\Data\IMOLTP') TO FILEGROUP [IMOLTP]
*/


SET STATISTICS TIME ON;
SET NOCOUNT ON;
GO

CREATE OR ALTER PROCEDURE sp_temp_OnDisk
AS
    BEGIN
        DROP TABLE IF EXISTS #temp1
        CREATE TABLE #temp1
            (
              c1 INT NOT NULL ,
              c2 NVARCHAR(5) ,
              session_id SMALLINT NOT NULL DEFAULT ( @@spid ) ,
              INDEX IX_session_id ( session_id ) 
                
            );
        BEGIN TRAN
        DECLARE @i INT = 0;
        WHILE @i < 100000
            BEGIN
                INSERT  #temp1
                VALUES  ( @i, N'abc', @@spid );
                SET @i += 1
            END;
        COMMIT
    END;

GO 

EXEC sp_temp_OnDisk
GO
-- Function To Enable Row-Level Security

CREATE OR ALTER FUNCTION dbo.fn_SessionFilter(@session_id smallint)
    RETURNS TABLE
WITH SCHEMABINDING, NATIVE_COMPILATION
AS
    RETURN SELECT 1 as fn_SessionFilter WHERE @session_id=@@spid;
GO

DROP TABLE IF EXISTS dbo.temp1
GO
--Create In-Memory Temp Table

CREATE TABLE dbo.temp1
    (
      c1 INT NOT NULL ,
      c2 NVARCHAR(5) ,
      session_id SMALLINT NOT NULL DEFAULT ( @@spid ) ,
      INDEX IX_session_id ( session_id ) ,
      CONSTRAINT CHK_temp1_session_id CHECK ( session_id = @@spid ),
    )
    WITH (MEMORY_OPTIMIZED=ON, DURABILITY=SCHEMA_ONLY);
GO
-- add security policy to enable filtering on session_id, for each temp table

CREATE SECURITY POLICY dbo.temp1Filter
ADD FILTER PREDICATE dbo.fn_SessionFilter(session_id)
ON dbo.temp1
WITH (STATE = ON);

GO

CREATE OR ALTER PROCEDURE sp_temp_InMem
WITH NATIVE_COMPILATION, SCHEMABINDING
AS
    BEGIN ATOMIC WITH (TRANSACTION ISOLATION LEVEL = SNAPSHOT, LANGUAGE = N'English')

        DELETE FROM dbo.temp1;
        DECLARE @i INT = 0;
        WHILE @i < 100000
            BEGIN
                INSERT  dbo.temp1 (c1, c2)
                VALUES  ( @i, N'abc' );
                SET @i += 1;
            END;
        END;
GO

EXEC sp_temp_InMem

EXEC sp_temp_OnDisk
GO
