import timeit

tic = timeit.default_timer() # Set up timer to get measure of the time to run the query.

# run the process... 

toc = timeit.default_timer() 
print(toc - tic) # Gives the answer in SECONDS
