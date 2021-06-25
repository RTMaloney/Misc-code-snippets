# ~~~~~~~~~~~ Obtain 95% CIs ~~~~~~~~~~~
#  Define a function, that runs the binomial test, and returns the confidence intervals
#   x = number of successes/events
#   n = overall total (number of trials: the denominator)
# The binom.test assumes a hypothesized probability of success (p) of 0.5 by default, and a confidence level for the returned confidence interval (conf.int) of 0.95.
# See also https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/binom.test

my_binom <- function(x, n) {binom.test(x,n)$conf.int[1:2]}
