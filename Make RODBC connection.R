
# Note that different ODBC drivers will be installed on different Windows devices.
# To see what drivers are installed, go to Control Panel > Administrative Tools > ODBC Data Sources (64-bit).
# Click on the 'Drivers' tab to see the installed drivers listed.

library(RODBC)

# Set up direct connection to SQL server database engine, using Windows credentials
cnxn <- odbcDriverConnect('driver={SQL Server};
                          server=server_name;
                          database=database_name;
                          trusted_connection=true')

# To get info on this connection:
odbcGetInfo(cnxn)
