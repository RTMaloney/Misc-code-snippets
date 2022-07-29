# Convert a multi-index set of columns into single-level columns
df.columns = df.columns.map(lambda x: ' '.join([str(i) for i in x])).str.strip(' ') # final strip of whitespace off end of column name 
