
library(RODBC)

# Set up direct connection to SQL server database engine, using Windows credentials
cnxn <- odbcDriverConnect('driver={SQL Server};
                          server=server_name;
                          database=database_name;
                          trusted_connection=true')

# To get info on this connection:
odbcGetInfo(cnxn)
