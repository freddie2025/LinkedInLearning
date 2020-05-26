USE AdventureworksDW2016CTP3

GO

CREATE CLUSTERED COLUMNSTORE INDEX [CCI_Demo] ON [dbo].[FactResellerSalesXL_CCIDemo] WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0)

GO


GO


SELECT o.name
	,cs.*
FROM sys.column_store_row_groups cs
INNER JOIN sys.objects o ON o.object_id = cs.object_id
WHERE o.name = 'FactResellerSalesXL_CCIDemo'