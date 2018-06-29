# identify the NAs
attach(mtcars)
which(disp == NA, arr.ind = T)
is.na(disp)

# in there is no NAs, it will return integer(0)
# to evaluate the integer(0), we can use length() 
# function

# inner join 
merge(dfA, dfB, by = "ID")

# subset function
subset(df, age > 1 | age < 10, select = c(q1, q2, q3))

# sql operation 
newdf <- sqldf("select * from mtcars where carb=1 order by mpg", row.names = T)
head(newdf)
sqldf("select avg(mpg) as avg_mpg, avg(disp) as avg_disp, gear from mtcars where cyl in (4, 6) group by gear")
 
