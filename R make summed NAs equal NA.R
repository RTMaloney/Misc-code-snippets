# If you are summing across rows, if all entries in a row = NA, then the result = 0.
# I don't know why the sum of NAs does not == NA.

# This operation allows you to sum rows accounting for the case where all entries == NA, but makes the result in this case == NA and != 0.

# See here for inspiration: https://stackoverflow.com/questions/18708647/logical-vector-with-multiple-columns-in-r

valid_sum   <- apply(df1, 1, function(x) any(!is.na(x)) ) # Provides a flag where at least 1 entry is NOT null
                   
invalid_sum <- apply(df1, 1, function(x) all(is.na(x)) ) # provides a flag where ALL entries in the row == NA
