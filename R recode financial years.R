# This script shows how to redefine calendar years into Aus financial years.
# NOTE: assumes the dataframe has a year column and a numeric month column.

# From Wikipedia:

# "In Australia, a fiscal year is commonly called a "financial year" (FY) and starts on 1 July and ends on the next 30 June.
# Financial years are designated by the calendar year of the second half of the period. For example, financial year 2017 is the 12-month period ending on 30 June 2017
# and can be referred to as FY2016/17.

# Define new column, same as regular (calendar) year
data1["FinYear"] <- data1$Year

# Months in First half of Year = same fin year as calendar
# Months in 2nd half of Year = Next fin year to calendar
# So we add +1 years to the Fin Year for those dates occurring in the 2ND half of the calendar year
data1$FinYear[data1$Month >= 7] <- data1$FinYear[data1$Month >= 7] + 1
