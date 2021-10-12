

# This script will generate a random dummy dataframe that can be used in testing or dev work, etc.
# It includes dummy examples designed to mimic different data classes commonly found in SQL server databases.
# Customise to add other columns or data types if desired.
# It is exported as a .csv file that can then be loaded into Power BI desktop, Excel, etc.
# R Maloney, Aug 2021

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~ Import libraries ~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

library(stringi)
library(tidyverse)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~ Define parameters of the data ~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# How many entries (rows) are wanted in the dataframe?
total_n    <- 1000
# Proportion of the data to be missing/null
propn_null <- 0.1  # Note: this will not affect the unique ID column.

# what is the length of the ID code (characters)?
ID_l       <- 8
# How many unique (distinct) identifiers are wanted in the IDs column?
n_IDs      <- 50

# Specify the start and end dates you want sampled from
start.date <- "2019-01-01"
end.date   <- "2022-01-01"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~ Make the full dataframe ~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Set up a subfunction to generate random sets of digit strings as dummy ID codes.
# We do it this way so that there will be some repetition of unique ID codes across the whole sample
# (rather than each of the n entries having different ID codes).
# See https://stackoverflow.com/questions/29344795/generating-a-random-sequence-of-multiple-characters-in-r

# Change 'pattern' to include other characters, eg "[A-Za-z0-9]"
make_rand_str <- function(n_IDs, ID_l) {
  set.seed(pi)
  stri_rand_strings(n_IDs, ID_l, pattern = "[0-9]")
 }
 
# make the vector of ID codes, with repetition
ID <- replicate (total_n/n_IDs,  make_rand_str(n_IDs, ID_l)) %>% as.vector()
  
df1 <- data.frame(
        ID = ID,                                                  # Unique ID generated above
        grp = LETTERS[ sample(1:5, total_n, replace = TRUE) ],    # Grouping/categorical variable, letters A-E
        subgrp = letters[ sample(1:8, total_n, replace = TRUE) ], # Subgroup/sub-category, letters a-h
        cost = round(runif(total_n, min=0, max=100), digits=2),   # random numbers from uniform distribution, simulate currency$$$
        quantity = round(runif(total_n, min=1, max=1000)),        # simple integer values within range
        # get random set of dates within the nominated date range:
        date = sample( seq(as.Date(start.date), as.Date(end.date), by="day"), total_n, replace = TRUE),
        bool = as.logical(round(runif(total_n)))                  # Simple boolean TRUE/FALSE
        )

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~ Simulate missing data ~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Insert NAs at random into the DF according to a proportion of rows.
# NOTE: this will not affect the ID column (col 1)
for (ii in names(df1[-1]) ) {
  
  df1[ sample(1:total_n, round(total_n * propn_null), replace = TRUE), ii] <- NA
  
}

# View the result:
View(df1)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~ Export as csv ~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Save the resulting df as .csv (this will save to the current working directory)
write.csv(df1, file = paste0(Sys.Date(), " dummy dataset.csv"), row.names=FALSE)
