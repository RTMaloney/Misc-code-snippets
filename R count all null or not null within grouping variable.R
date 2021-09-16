 group_by(group) %>%
 summarise_all( funs( sum(!is.na(.)) ) ) 
