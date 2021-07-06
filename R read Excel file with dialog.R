library(readxl)
library(here)

# Open dialog box to select the latest dataset:
data_fn   <- choose.files(default = paste0(here(), "/*.xlsx" ),
                          caption = "Select file:",
                          multi = FALSE, filters = Filters,
                          index = nrow(Filters))

# Load the data, specifying the header names as column names
# Note that this should automatically open the first sheet in the file which is what we want (raw data)
df1 <- read_excel(data_fn, col_names = TRUE, na = "NULL", guess_max = 10000)
