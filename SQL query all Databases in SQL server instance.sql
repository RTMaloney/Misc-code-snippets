-- See inspiration here:
-- https://dataedo.com/kb/query/sql-server/list-all-tables-in-all-databases
-- this could be modified to query the TABLES and Columns within each database too.

DECLARE @sql NVARCHAR(MAX);

SELECT @sql = 
    (SELECT ' UNION ALL
        SELECT ' +  + QUOTENAME(name,'''') + ' AS database_name,
               s.name COLLATE DATABASE_DEFAULT
                    AS schema_name,
               t.name COLLATE DATABASE_DEFAULT AS table_name 
               FROM '+ QUOTENAME(name) + '.sys.tables t
               JOIN '+ QUOTENAME(name) + '.sys.schemas s
                    ON s.schema_id = t.schema_id'
    FROM sys.databases 
    WHERE state=0
    AND name NOT IN ('SSISDB') --remove any DBs our userID does not have access to; or not interested in.
    ORDER BY [name] for XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)');

SET @sql = stuff(@sql, 1, 12, '') + ' ORDER BY database_name, 
                                               schema_name,
                                               table_name';

EXECUTE (@sql);
