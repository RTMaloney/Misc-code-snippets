

# This script will generate a random dummy dataframe that can be used in testing or dev work, etc.
# R Maloney, Aug 2021


library(stringi)
library(tidyverse)

# How many entries in the dataframe?
total_n <- 100

# How many unique identifiers in the IDs column?
n_IDs   <- 5
# what is the length of the ID code (characters)?
ID_l    <- 5

# Specify the start and end dates you want sampled from
start.date <- "2019-01-01"
end.date   <- "2022-01-01"

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
  
# Now make the full dataframe:
df1 <- data.frame(
        ID = ID,  # Unique ID generated above
        grp = LETTERS[ sample(1:5, total_n, replace = TRUE) ],    # Grouping/categorical variable, letters A-E
        subgrp = letters[ sample(1:8, total_n, replace = TRUE) ], # Subgroup/sub-category, letters a-h
        cost = round(runif(total_n, min=0, max=100), digits=2),   # random numbers from uniform distribution
        # get random set of dates within the nominated date range
        date = sample( seq(as.Date(start.date), as.Date(end.date), by="day"), total_n),
        bool = as.logical(round(runif(total_n))) # Simple boolean TRUE/FALSE
        )
                  
  
