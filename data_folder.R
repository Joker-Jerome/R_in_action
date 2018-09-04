# Data storage
# The data folder is meant to store binary data (in .rda format) that is made available to users. The easiest way to do this is to use the devtools::use_data() function on whatever R object you have. For instance:

x <- c(1:10)
devtools::use_data(x)


# This ends up creating and saving the x object into data/x.rda. When you load up your package, the x variable will be available for you to use. You can this one step further, by actually providing the code that generated the binary data. To do this, the standard thing to do is create a data-raw folder. Then create a file .R file with the same name as your binary data. Inside this .R files, you put the exact same code as above. This gives you a record of how the binary data is generated.

# raw data
# You don’t want to include these .R files in the actual R package. So what we do is place the data-raw folder into the .Rbuildignore file like this:



