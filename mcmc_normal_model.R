library(mnormt)
set.seed(46436)

################
#Simulating Data
################
n<-100
mu<-2.7
sd<-0.50
y<-rnorm(n,mu,sd)


########################
#MCMC Code
########################

#Global Settings
mc_num<-100000

#Parameter Vectors/Matrices
mu<-rep(0,times=mc_num)
sigma2<-rep(0,times=mc_num)

#Initial Values
mu[1]<-1000
sigma2[1]<-1000

for(i in 2:mc_num){
   
   #Update mu
   mu[i]<-rnorm(n=1,mean=mean(y),sd=sqrt(sigma2[i-1]/n))

   #Update sigma2
   sigma2[i]<-1/rgamma(n=1,(n/2),(sum((y-mu[i])^2)/2))

   }

#Trace Plots
par(mfrow=c(2,1))
plot(mu,type="l")
plot(sigma2,type="l")

#Posterior Samples Summary (without Burn-in)
par(mfrow=c(2,1))
hist(mu)
hist(sigma2)
mean(mu)
mean(sigma2)



#Trace Plots (Burn-in of 10,000)
par(mfrow=c(2,1))
plot(mu[10001:mc_num],type="l")
plot(sigma2[10001:mc_num],type="l")

#Posterior Samples Summary (with Burn-in)
par(mfrow=c(2,1))
hist(mu[10001:mc_num])
hist(sigma2[10001:mc_num])
mean(mu[10001:mc_num])
mean(sigma2[10001:mc_num])
