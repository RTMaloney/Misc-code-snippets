# Use these steps if you want R to run or evaluate the contents of a string, 
# ie if you are storing a command or expression as a string (within some variable)

library(rlang)

string_to_run <- "x <- 1+1"               # Define the string you want treated like a command
expr_to_eval  <- parse_expr(string_to_run)  # parse the string to make in an expression (storing as an object)
eval(expr_to_eval)                          # Evaluate the expression 
print(x)
