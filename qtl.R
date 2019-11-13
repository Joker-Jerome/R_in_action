install.packages("R/qtl")

source("https://bioconductor.org/biocLite.R")
biocLite("R/qtl")


rotmat2d <- function(theta){
    matrix(c(cos(theta),sin(theta),-sin(theta),cos(theta)),2,2)
}
x <- seq(-2,2,length=11)
y <- 4*exp(-x^2) - 2
xy <- cbind(x,y)
rang <- c(30,45,60,90,180)
dev.new(width=12,height=8,noRStudioGD=TRUE)
par(mfrow=c(2,3))
plot(x,y,xlim=c(-3,3),ylim=c(-3,3),main="No Rotation")
text(x,y,labels=letters[1:11],cex=1.5)
for(j in 1:5){
    rmat <- rotmat2d(rang[j]*2*pi/360)
    xyrot <- xy%*%rmat
    plot(xyrot,xlim=c(-3,3),ylim=c(-3,3))
    text(xyrot,labels=letters[1:11],cex=1.5)
    title(paste(rang[j]," degrees"))
}