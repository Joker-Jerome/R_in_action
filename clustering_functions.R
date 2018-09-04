# generate the data
?rnorm
df <- data.frame(id = 1:100)
df$TestDate <- rep(1:5, 20)
df$id <- unlist(lapply(1:20, function(x) rep(x, 5)))
df$lab_1 <- rnorm(100, mean = 0, sd = 1)
df$lab_2 <- rnorm(100, mean = 1, sd = 1)
df$lab_3 <- rnorm(100, mean = 2, sd = 1)
# SamSpectral
# library(SamSPECTRAL) 
na_idx <- sample(1:100, 50, replace = F)

# get the closest


# Kernlab
library(kernlab)
data("spirals")
sc <- specc(df, center = 5)


closest_lab <- function(df) {
    # init
    n <- nrow(df)
    cur_id <- df[1, ]$PatientID
    output_df <- df[1, ]
    testdate_df <- df[1, ]
    cursor <- 1
    tmp_record <- df[1, ]
    ori_test_idx <- which(!is.na(tmp_record))[-1]
    
    if (length(ori_test_idx) > 0) {
        testdate_df[cursor, ori_test_idx] <- tmp_record$TestDate
    }
    # main loop
    for (i in 1:nrow(df)) {
        #progress(i, max.value = n)
        tmp_record <- df[i, ]
        if (tmp_record$PatientID != cur_id) {
            cur_id <- tmp_record$PatientID
            cursor <- cursor + 1
            output_df <- rbind(output_df, tmp_record)
            ori_test_idx <- which(!is.na(tmp_record))[-1]
            cat(ori_test_idx)
            cat("\n")
            testdate_df <- rbind(testdate_df, tmp_record)
            if (length(ori_test_idx) > 0) {
                testdate_df[cursor, ori_test_idx] <- tmp_record$TestDate
            }
            
            
        }
        na_idx <- which(is.na(output_df[cursor, ]))
        if (length(na_idx) > 0) {
            for (j in 1:length(na_idx)) {
                x <- na_idx[j]
                if (!is.na(tmp_record[x])) {
                    output_df[cursor, x] <- tmp_record[x]
                    testdate_df[cursor, x] <- tmp_record$TestDate
                }
            }
        }
    }
    output_list <- list(output_df = output_df, testdate_df = testdate_df)
    return(output_list)
}
