# log likelihood
plsimple <- function(beta) {
	ipsi <- exp(beta)
	result <- log(psi) - log(3*psi + 3) -
		log(3*psi + 1) - log(2*psi + 1)
	result }

# optimization
result <- optim(par=0, fn = plsimple, method = "L-BFGS-B", control=list(fnscale = -1), lower = -3, upper = 1)
