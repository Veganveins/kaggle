
library(data.table)
debate = read.csv('~/Downloads/debate.csv')
debate = as.data.table(debate)


clinton = debate[Speaker == "Clinton"]
trump = debate[Speaker == "Trump"]

length(debate$Speaker)
length(trump$Speaker)
length(clinton$Speaker)

