fare_ceiling = 40
train.orig = as.data.table(train)
train = copy(train.orig)
train <- transform(train, Fare = ifelse(Fare >= 40, 39, Fare))

women_onboard = subset(train, Sex=="female")
men_onboard = subset(train, Sex=="male")

fare_bracket_size = 10
number_of_price_brackets = fare_ceiling / fare_bracket_size
number_of_classes = unique(train[,3])

woman_survival_table = matrix(c(0,0,0,0,0,0,0,0,0,0,0,0), nrow = 3, ncol=4, byrow= TRUE)
man_survival_table = matrix(c(0,0,0,0,0,0,0,0,0,0,0,0), nrow = 3, ncol=4, byrow= TRUE)
women_onboard = as.data.frame(women_onboard)
men_onboard = as.data.frame(men_onboard)

for (i in 1:number_of_classes) {
  for (j in 1:number_of_price_brackets) {
    women_only_stats = subset(women_onboard, Pclass == i)
    women_only_stats = subset(women_only_stats, Fare >= (j-1)*fare_bracket_size)
    women_only_stats = subset(women_only_stats, Fare < j*fare_bracket_size)
    woman_survival_table[i,j] = mean((women_only_stats[,2]))
    
    men_only_stats = subset(men_onboard, Pclass == i)
    men_only_stats = subset(men_only_stats, Fare >= (j-1)*fare_bracket_size)
    men_only_stats = subset(men_only_stats, Fare < j*fare_bracket_size)
    man_survival_table[i,j] = mean((men_only_stats[,2]))
    
  }
}
#233 women survivors
#109 male survivors
woman_survival_table[is.na(woman_survival_table)] <- 0
man_survival_table[is.na(man_survival_table)] <- 0

woman_survival_table[(woman_survival_table<.5)] <- 0
woman_survival_table[(woman_survival_table)>=.5] <- 1

man_survival_table[(man_survival_table<.5)] <- 0
man_survival_table[(man_survival_table)>=.5] <- 1

test = read.csv("/Users/jthompson/kaggle/titanic/data/test.csv")
gender = read.csv("/Users/jthompson/kaggle/titanic/data/gendermodel.csv")

