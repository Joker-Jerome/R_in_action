# read in all the CSV files
all_data_frames <- lapply(list.files(pattern = ".csv"), read.csv)
 
# stack all data frames together
single_data_frame <- Reduce(rbind, all_data_frames)

