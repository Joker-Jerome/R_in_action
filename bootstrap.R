# library
library(datasets)
library(boot)

# bootstrap from scratch
num_proc <- 1000
n <- length(acme)

# resample with replacement
resamples <- matrix(sample(acmep[, 1], n * num_proc, replace = TRUE),
B, n)

# medians
medians <- apply(resamples, 1, median)

# sd
sd(medians)

# CI
quantile(medians, c(.025, .975))

# bootstrap with package
stat <- function(x, i) { median(x[i]) }
boot.out <- boot(data = acme[, 1], statistic = stat, R = 1000)
boot.ci(boot.out)
