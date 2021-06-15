# R has no built in function for finding the numeric mode of a distribution. 
# NOTE: change 'from' value depending on what is considered to be the smallest (possible) value in the distribution.
# (or modify to parse as a parameter).
# x is the data.

estimate_mode <- function(x, to=max(x, na.rm=TRUE)) {
  d <- density(x, from=0, to=to, na.rm=TRUE)
  return(d$x[which.max(d$y)])
}
