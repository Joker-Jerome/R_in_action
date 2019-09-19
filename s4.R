library(methods)
library(sloop)

# definitions of the s4 class
setClass("Person", 
  slots = c(
    name = "character", 
    age = "numeric"
  )
)

#  create a new class instance
john <- new("Person", name = "John Smith", age = NA_real_)

# check the info of that instance
is(john)
john@name
slot(john, "age")

# define the method
setMethod("age", "Person", function(x) x@age)
setMethod("age<-", "Person", function(x, value) {
  x@age <- value
  x
})


# define an s4 class
# three arguments: class name, a name character vector that describes the names and classes of the slots, a prototype

setClass("Person", 
  slots = c(
    name = "character", 
    age = "numeric"
  ), 
  prototype = list(
    name = NA_character_,
    age = NA_real_
  )
)

me <- new("Person", name = "Hadley")
str(me)
