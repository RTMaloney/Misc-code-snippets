
# see: https://stackoverflow.com/questions/25043639/pandas-how-to-find-the-max-n-values-for-each-category-in-a-column

df = pd.DataFrame({"borough":["A", "A", "A", "B", "B", "C"],
                   "title":["Book1", "Book2", "Book3", "Book1", "Book2", "Book3"],
                   "total_loans":[4, 48, 46, 78, 15, 122]})
#df.set_index(['borough', 'title'], inplace=True)
df.groupby( ['borough', 'title'] ).sum().reset_index().sort_values(['borough', 'total_loans'], ascending=[1,0]).groupby('borough').head(2)
