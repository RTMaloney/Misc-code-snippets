# Quick Venn diagram where you simply plug in the number of items in each set, and the overlap.
# see this: https://www.geeksforgeeks.org/how-to-create-a-venn-diagram-in-r/

library("VennDiagram")

# move to new plotting page
grid.newpage()

# create pairwise Venn diagram
draw.pairwise.venn(area1=80, area2=27,cross.area=14,
                   category=c("Decile\n file", "DDD\n preview"),
                   fill=c("Blue","Red"),
                   cat.pos = c(0, 45))
