# example
example("rbind")

# list all the possible functions containing rbind
apropos("rbind", mode="function")

# remove objects 
rm(objectlist)

# show the command history 
n <- 5
history(n)

# save command history to 
savehistory("myfile")
loadhistory("myfile")

# save image
save.image("myfile")

# save object list
save(objectlist, file="myfile")
load("myfile")

# txt output
sink("sink_output.txt")
sink()
