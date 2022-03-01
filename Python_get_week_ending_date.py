# Input any date string and return the SATURDAY (as date object) on which the week that day appears in ENDS.
# If the input date is a Saturday, it returns the same day.
# This can be amended to return any day of the week.
# See https://stackoverflow.com/questions/8801084/how-to-calculate-next-friday for inspiration.

import datetime as dt
from datetime import timedelta
import pandas as pd

# current week of data processing (last saturday)
def find_Saturday_WE(date_str):
    
    # Date of interest: 
    date = pd.to_datetime(date_str).dt.date # Convert to date object (no time)
   
    # as long as the target date is NOT a Saturday
    while date.weekday() != 5: 
    
        date += timedelta(days=1) # Add days consecutively 
    return(date)
    # Saturday stays as it is 
