# Steps for defining, populating and saving data in a new Excel notebook
library(openxlsx)

# Define the name of the workbook object
data_summary_workbook <- createWorkbook()

# Define the file name of the resulting excel file
data_summary_fn <- "filepath/filename.xlsx"

# Insert tables into spreadsheet
addWorksheet(data_summary_workbook, "sheet 1 name")
writeData(data_summary_workbook, s heet = "sheet 1 name", x = datal)
addWorksheet(data_summary_workbook, "sheet 2 name")
writeData(data_summary_workbook, sheet = "sheet 2 name", x = data2)

# Save the file. Set overwrite=TRUE, to save over a file if it has the same name.
saveWorkbook(data_summary_workbook, file=data_summary_fn, overwrite = TRUE)
