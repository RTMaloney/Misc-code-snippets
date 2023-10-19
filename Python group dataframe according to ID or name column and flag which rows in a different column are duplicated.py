"""
We want to group a dataframe according to one ('name/id') column; 
then, WITHIN each group, we want to flag which of a different column(s) are ALL duplicated (the same)
within that group. Then, retaining the original groupings; we want to sort the values so that those 
groups with ALL duplicates within the other column are shifted to the TOP of the dataframe; 
while those where the group does NOT contain all duplicates (all the same within the group) 
would be shifted to the bottom of the dataframe. The Rows must remain grouped together after sorting, 
even if one particular group (of say, 3 rows) contains 2 duplicates, and 1 unique value 
(ie, we don't want ANY duplicates going to the top of the dataframe while splitting up the Name/ID Groups).

This solution discovered partly from asking BingGPT and partly from trial & error. 
"""

# Assuming df is your DataFrame and 'col1' and 'col2' are your columns
df = pd.DataFrame({
    'col1': ['A', 'B', 'A', 'B', 'A', 'C', 'C', 'C', 'C', 'D', 'D'], # names
    'col2': [10, 20, 10, 40, 10, 60, 70, 60, 70, 10, 10]            # values    
})
# Create a new column that indicates whether 'col2' has any duplicates
df['is_duplicated'] = df.duplicated(subset='col2', keep=False) # Be sure to flag all as dupes (keep=False)

# Now, group by the NAME column, and indicate whether ALL 
# (or just some) of the values in col2 are duplicates of each other.
grouped = df.groupby(['col1']).agg(
    all_duplicated = ('is_duplicated', all)).reset_index()

# Then, LEFT JOIN on the original df to expand out the 'all_duplicated' column to each row within the group.
# Sort descending by the 'all_duplicated' column (True values will be at the top),
# and then by 'col1' to put the groups that contain ALL duplicates on top of the df.
# Finally, sort by 'col2' last, so that PAIRS of duplicates 
# (whether they occur in the ALL duplicates groups, or the NOT all duplicates groups)
# are at least in adjacent rows. 
df2 = df.merge(
    grouped, on='col1', how='left').sort_values(
    by=['all_duplicated', 'col1', 'col2'], 
    ascending=[False, True, True]
    )

# Drop the 'is_duplicated/all_duplicated' columns, if desired.
#df2 = df2.drop(columns=['is_duplicated', 'all_duplicated'])
print(df2)
