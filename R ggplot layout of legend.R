
theme( legend.key.size = grid::unit(1.5, 'lines')) +               # Alter size of lines/symbols
theme( legend.text = element_text(size=12)) +                       # Alter font size
theme( legend.title = element_blank()) +                            # get rid of legend title
guides( color=guide_legend(ncol = 2 , byrow = FALSE) ) +            # Change direction & order in which key is stacked!
theme( legend.position = "top", legend.direction = "horizontal") + # Position the legend on figure
theme( legend.spacing.x = unit(0.5, 'cm')) +                       # spacing between objects in key
theme( legend.background = element_blank())                         # get rid of legend border
