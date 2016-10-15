
library(data.table)
debate.copy = read.csv('~/Downloads/debate.csv')
debate = as.data.table(debate.copy)

debate = debate[Speaker == "Clinton" | Speaker == "Trump"]

length(debate$Speaker)
clinton = debate[Speaker == "Clinton"]
trump = debate[Speaker == "Trump"]


length(trump$Speaker)
length(clinton$Speaker)

