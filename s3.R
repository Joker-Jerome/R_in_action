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


# The generic is a middleman: its job is to define the interface (i.e. the arguments) then find the right implementation for the job. The implementation for a specific class is called a method, and the generic finds that method by performing method dispatch.

s3_dispatch(print(f))


# Unlike most functions, you can’t see the source code for most S3 methods45 just by typing their names. That’s because S3 methods are not usually exported: they live only inside the package, and are not available from the global environment. Instead, you can use sloop::s3_get_method(), which will work regardless of where the method lives:
sloop::s3_get_method()
s3_get_method(weighted.mean.Date)




# Classes
# If you have done object-oriented programming in other languages, you may be surprised to learn that S3 has no formal definition of a class: to make an object an instance of a class, you simply set the class attribute. You can do that during creation with structure(), or after the fact with class<-()

# Create and assign class in one step
x <- structure(list(), class = "my_class")

# Create, then set class
x <- list()
class(x) <- "my_class"

class(x)
inherits(x, "my_class")
inherits(x, "your_class")

# if you’ve used other OO languages, this might make you feel queasy, but in practice this flexibility causes few problems. R doesn’t stop you from shooting yourself in the foot, but as long as you don’t aim the gun at your toes and pull the trigger, you won’t have a problem.

To avoid foot-bullet intersections when creating your own class, I recommend that you usually provide three functions:

A low-level constructor, new_myclass(), that efficiently creates new objects with the correct structure.

A validator, validate_myclass(), that performs more computationally expensive checks to ensure that the object has correct values.

A user-friendly helper, myclass(), that provides a convenient way for others to create objects of your class.


# Constructor
new_Date <- function(x = double()) {
  stopifnot(is.double(x))
  structure(x, class = "Date")
}


new_difftime <- function(x = double(), units = "secs") {
  stopifnot(is.double(x))
  units <- match.arg(units, c("secs", "mins", "hours", "days", "weeks"))

  structure(x,
    class = "difftime",
    units = units
  )
}

# Validators

new_factor <- function(x = integer(), levels = character()) {
  stopifnot(is.integer(x))
  stopifnot(is.character(levels))

  structure(
    x,
    levels = levels,
    class = "factor"
  )
}

# validate factor

validate_factor <- function(x) {
  values <- unclass(x)
  levels <- attr(x, "levels")

  if (!all(!is.na(values) & values > 0)) {
    stop(
      "All `x` values must be non-missing and greater than zero",
      call. = FALSE
    )
  }

  if (length(levels) < max(values)) {
    stop(
      "There must be at least as many `levels` as possible values in `x`",
      call. = FALSE
    )
  }

  x
}


validate_factor(new_factor(1:5, "a"))


#  Helpers
# can be used to coerce the input to a double
difftime <- function(x = double(), units = "secs") {
  x <- as.double(x)
  new_difftime(x, units = units)
}

difftime(1:10)
