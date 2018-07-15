# gc function
gc()

# Garbage Collection
# A call of gc causes a garbage collection to take place. gcinfo sets a flag so that automatic collection is either silent (verbose = FALSE) or prints memory usage statistics (verbose = TRUE).

# http://adv-r.had.co.nz/memory.html
# advanced R talking about the memory in R

# pryr package
library(pryr)
object_size(1:10)

# While object_size() tells you the size of a single object, pryr::mem_used() tells you the total size of all objects in memory:
mem_used()

# mem_change() builds on top of mem_used() to tell you how memory changes during code execution. Positive numbers represent an increase in the memory used by R, and negative numbers represent a decrease.
mem_change(x <- 1:1e6)

# In some languages, you have to explicitly delete unused objects for their memory to be returned. R uses an alternative approach: garbage collection (or GC for short). GC automatically releases memory when an object is no longer used. It does this by tracking how many names point to each object, and when there are no names pointing to an object, it deletes that object.
# The best way to tackle this is to run rm()






