# from variable to string
myfunc <- function(v1) {
  deparse(substitute(v1))
}

myfunc(foo)
[1] "foo"

# from string to variable 
# as.name() + eval()
myFunc <- function(string) {
	res = eval(as.name(paste0(string)))
	return(res)
}

# get()
get(string)
