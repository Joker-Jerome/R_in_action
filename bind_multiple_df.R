# https://stackoverflow.com/questions/2851327/combine-a-list-of-data-frames-into-one-data-frame

library(rbenchmark)
benchmark(
  do.call = do.call("rbind", listOfDataFrames),
  plyr_rbind.fill = plyr::rbind.fill(listOfDataFrames), 
  plyr_ldply = plyr::ldply(listOfDataFrames, data.frame),
  data.table_rbindlist = as.data.frame(data.table::rbindlist(listOfDataFrames)),
  replications = 100, order = "relative", 
  columns=c('test','replications', 'elapsed','relative')
  ) 
                  test replications elapsed relative
4 data.table_rbindlist          100    0.11    1.000
1              do.call          100    9.39   85.364
2      plyr_rbind.fill          100   12.08  109.818
3           plyr_ldply          100   15.14  137.636
