# par() function
# copy the default settings
opar <- par(no.readonly = T) 
par(lty = 2, pch = 17)
x <- 1:5
y <- 2:6
plot(x, y)

par(opar)

# pch: plot symbols
# cex: the size of the point
# lty: line type
# lwd: line width

# colors
# col.axis
# col.lab
# col.main
# col.sub
# fg: foreground
# bg: background
# a function to search for all the colors
colors()

# layout function
attach(mtcars)
layout(matrix(c(1,1,2,3), 2, 2, byrow = T))
hist(wt)
hist(mpg)
hist(disp)
