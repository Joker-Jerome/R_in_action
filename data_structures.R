# factors
status <- c("good", "so-so", "bad")
factorized_status <- factor(status, ordered = T)
factorized_status_ <- factor(status, ordered = T, levels = c("good", "so-so", "bad"))

# list 
a <- c("1", "2", "3")
b <- 1:3
c <- c(1, "2", 3) # coerce
list_a <- list(a_comp = a, b_comp = b, c_comp = c)
list_a

# object
class(object)
names(object)
str(object)