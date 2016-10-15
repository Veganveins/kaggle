#PREPARE THE DATA
library(data.table)
debate.copy = read.csv('~/Downloads/debate.csv')
debate = as.data.table(debate.copy)
debate$Text = tolower(debate$Text)
debate$Text = gsub("-", " ", debate$Text)
debate$Text = stringi::stri_trans_general(debate$Text, "latin-ascii")
debate$Text = gsub("[[:punct:]]", "", debate$Text)
debate = debate[Speaker == "Clinton" | Speaker == "Trump"]
clinton = debate[Speaker == "Clinton"]
trump = debate[Speaker == "Trump"]

spoken = vapply(strsplit(trump$Text[i], "\\W+"), length, integer(1))

####TOTAL WORDS CLINTON
#12834 total words
all_words <- vector(mode="numeric", length=0)
new_words <- vector(mode="numeric", length=0)
total_words <- vector(mode="numeric", length=0)
for (i in (1:nrow(clinton))){
  all_words = total_words
  new_words = as.list(strsplit(clinton$Text[i], " ")[[1]])
  total_words = c(all_words, new_words)
}
length(total_words)
####TOTAL WORDS TRUMP
#16407 total words 
all_words.t <- vector(mode="numeric", length=0)
new_words.t <- vector(mode="numeric", length=0)
total_words.t <- vector(mode="numeric", length=0)
for (i in (1:nrow(trump))){
  all_words.t = total_words.t
  new_words.t = as.list(strsplit(trump$Text[i], " ")[[1]])
  total_words.t = c(all_words.t, new_words.t)
}

length(total_words.t)
#########################
##AVG WORD LENGTH CLINTON = 4.02
sum = 0
this_word = vector(mode="numeric", length=0)
all_words = vector(mode="numeric", length=0)
for (i in (1:length(total_words))){
  sum = sum + nchar(total_words.t[[i]])
  this_word = nchar(total_words.t[[i]])
  all_words = c(this_word, all_words)
}
hist(all_words)
sum/length(all_words)
  
##AVG WORD LENGTH TRUMP = 4.03
sum.t = 0
this_word.t = vector(mode="numeric", length=0)
all_words.t = vector(mode="numeric", length=0)
for (i in (1:length(total_words.t))){
  sum.t = sum.t + nchar(total_words.t[[i]])
  this_word.t = nchar(total_words.t[[i]])
  all_words.t = c(this_word.t, all_words.t)
}
hist(all_words.t)
sum.t/length(all_words.t)

#what words do they both say that have 13 characters?
#HILLARY 13 Letter Words
word1 = vector(mode="numeric", length=0)
allwords = vector(mode="numeric", length=0)
for (i in (1:length(total_words))){
  if (nchar(total_words[i]) > 12 & !is.element(total_words[i], allwords)) {
    word1 = total_words[[i]]
    allwords = c(allwords, word1)
  }
}
allwords

#TRUMP 13 Letter Words
word1.t = vector(mode="numeric", length=0)
allwords.t = vector(mode="numeric", length=0)
for (i in (1:length(total_words.t))){
  if (nchar(total_words.t[i]) > 12 & !is.element(total_words.t[i], allwords.t)) {
    word1.t = total_words.t[[i]]
    allwords.t = c(allwords.t, word1.t)
  }
}
allwords.t