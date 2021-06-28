  SELECT TABLE_NAME,
       COLUMN_NAME,
       ORDINAL_POSITION,         -- Order column appears in table (column id number)
       DATA_TYPE,        
       IS_NULLABLE,              -- Nullability of the column. If this column allows for NULL, =YES. Otherwise, NO. Primary keys can not be nulled.
       CHARACTER_MAXIMUM_LENGTH, -- Maximum length, in CHARACTERS, for binary data, character data, or text and image data. -1 for xml and large-value type data.
       CHARACTER_OCTET_LENGTH,   -- Maximum length, in BYTES
       NUMERIC_PRECISION,        -- Precision of approximate numeric data, exact numeric data, integer data (total DIGITS, incl after dec point)
       NUMERIC_PRECISION_RADIX,  -- Precision radix (ie base no.) of approximate numeric data, exact numeric data, integer data,
       NUMERIC_SCALE,            -- Number of digits after the decimal point; for integers this is 0
       DATETIME_PRECISION,       -- Precision (sampling) of date/time data (ms field). The clock can update every 3 ms or every 0.003333 sec. So the clock samples at 333.333 Hz.
       CHARACTER_SET_NAME        -- unique name for the character set if this column is character data or text data type.
FROM   INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME NOT LIKE '%V_D%' -- Filter out VIEW objects which begin with 'V_DB'; we want only BASE TABLES 
--WHERE DATA_TYPE != 'nvarchar'

  -- For info on the meaning of information see 
  --https://docs.microsoft.com/en-us/sql/relational-databases/system-information-schema-views/columns-transact-sql?redirectedfrom=MSDN&view=sql-server-ver15
  
