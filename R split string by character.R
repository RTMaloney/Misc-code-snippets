# Unpack column of strings into a single long vector. Do not remove duplicates. In this example, the strings are broken up when divided by ";  ". 
# reduce(c) takes the output of the str_split and concatenates them all into one long vector.

library(stringr)
library(tidyverse)

string_vector <- column_of_strings %>% str_split("; ") %>% reduce(c)
