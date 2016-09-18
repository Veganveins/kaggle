library(data.table)

train = read.csv("/Users/jthompson/kaggle/titanic/data/train.csv")
gender_class = read.csv("/Users/jthompson/kaggle/titanic/data/genderclassmodel.csv")

train = as.data.frame(train)
num_passengers = nrow(train)
num_survived = sum(train[,2])
proportion_survivors = num_survived / num_passengers



women_onboard = subset(train, Sex=="female")
women_survived = sum(women_onboard[,2])
men_onboard = subset(train, Sex=="male")
men_survived = sum(men_onboard[,2])


proportion_women_survived = women_survived/nrow(women_onboard) 
proportion_men_survived = men_survived/nrow(men_onboard)

