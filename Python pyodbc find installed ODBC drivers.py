# This Python ODBC module (pyodbc library) can be used to tell you which SQL server driver(s) are installed on the machine you're running. 
# It provides a list of all drivers. 
# You can then specify which driver to use when making a ODBC connection.

import pyodbc as pdb 

pdb.drivers() # this will return a list of the installed ODBC drivers.
