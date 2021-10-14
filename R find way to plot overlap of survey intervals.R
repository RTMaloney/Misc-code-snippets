
# how can we get a correlogram / confusion matrix type grid to display the amount of overlap for each time interval?

library(descr)
library(corrplot)
library(psych)


# Set up dummy data:
# How many entries (rows) are wanted in the dataframe?
total_n    <- 1000
# Proportion of the data to be missing/null
propn_null <- 0.35  # Note: this will not affect the unique ID column.

df1 <- data.frame(a = as.logical(round(runif(total_n))),
           b = as.logical(round(runif(total_n))),
           cc = as.logical(round(runif(total_n))))

df1["d"] <- !df1$cc

# Insert missing data
for (ii in names(df1[-1]) ) {
  
  df1[ sample(1:total_n, round(total_n * propn_null), replace = TRUE), ii] <- NA
  
}


# See here for solution/inspiration:
# https://stackoverflow.com/questions/44709440/function-on-all-column-combinations-of-nm-matrix-yielding-a-mm-result

myComb <- expand.grid(colnames(df1), colnames(df1))

myComb$N <- apply(myComb, 1, function(x){ 
  sum( df1[, x[1]] & df1[, x[2]], na.rm=TRUE)
})

myComb$p <- myComb$N / nrow(df1)

cov(df1)
corrplot(cor(df1), method = "color",
         title = "method = 'color'",
         tl.pos = "n")


# other relevant links here:

# https://stackoverflow.com/questions/37897252/plot-confusion-matrix-in-r-using-ggplot
# https://data-flair.training/blogs/r-contingency-tables/
#   https://www.rdocumentation.org/packages/descr/versions/1.1.5/topics/crosstab
# https://www.statology.org/contingency-table-in-r/
#   https://www.datacamp.com/community/tutorials/contingency-tables-r
# https://www.programmingr.com/statistics/contingency-table/
#   https://r-coder.com/correlation-plot-r/
#   https://stackoverflow.com/questions/19012529/correlation-corrplot-configuration
# https://rdrr.io/r/base/expand.grid.html
# https://stackoverflow.com/questions/52500031/apply-a-function-to-each-combination-of-columns
# https://stackoverflow.com/questions/44709440/function-on-all-column-combinations-of-nm-matrix-yielding-a-mm-result
