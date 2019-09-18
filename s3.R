# S3 is R’s first and simplest OO system. S3 is informal and ad hoc, but there is a certain elegance in its minimalism: you can’t take away any part of it and still have a useful OO system. For these reasons, you should use it, unless you have a compelling reason to do otherwise. S3 is the only OO system used in the base and stats packages, and it’s the most commonly used system in CRAN packages.

# basics
f <- factor(c("a", "b", "c"))
typeof(f)
attributes(f)

# strips the class attribute, causing it to lose its special behaviour
unclass(f)

# An S3 object behaves differently from its underlying base type whenever it’s passed to a generic (short for generic function). The easiest way to tell if a function is a generic is to use sloop::ftype() and look for “generic” in the output:

ftype(print)
ftype(str)
ftype(unclass)


# some S4 classes use that generic to hide the internal details

time <- strptime(c("2017-01-01", "2020-05-04 03:21"), "%Y-%m-%d")
str(time)
time <- strptime(c("2017-01-01", "2020-05-04 03:21"), "%Y-%m-%d")
str(time)
