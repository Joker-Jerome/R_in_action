n <- 1e4L
dfr <- data.frame(
  y = exp(rlnorm(n)),  #really right-skewed variable
  f = gl(2, n / 2)
)

p <- ggplot(dfr, aes(f, y)) + 
  geom_boxplot()
p   # big outlier causes quartiles to look too slim

p2 <- ggplot(dfr, aes(f, y)) + 
  geom_boxplot(outlier.shape = NA) +
  scale_y_continuous(limits = quantile(dfr$y, c(0.1, 0.9)))
p2  # no outliers plotted, range shifted
