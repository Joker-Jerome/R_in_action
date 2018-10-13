

# load libraries 
install.packages("mlr")
library(mlr)

# load data
train <- read.csv("/Users/jerome/Data/train_u6lujuX_CVtuZ9i.csv", na.strings = c(""," ",NA))
test <- read.csv("/Users/jerome/Data/test_Y3wMUE5_7gLdaTN.csv", na.strings = c(""," ",NA))
                 
                 
# explore the data
summarizeColumns(train)
summarizeColumns(test)

# 