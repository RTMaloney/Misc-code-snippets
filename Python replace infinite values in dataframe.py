# To replace any inf values with NaNs (eg, as when we have a divide by zero situation):
df.replace([np.inf, -np.inf], np.nan, inplace=True)

# See:
# https://stackoverflow.com/questions/17477979/dropping-infinite-values-from-dataframes-in-pandas
