## library
library('BiocParallel')


## Compute TWAS weights in parallel (worth learning )
output_status <- bpmapply(function(i, feat_id, clean_bim = FALSE) {
    
    ## Check that the output file exists
    out_file <- file.path('out_files', paste0(opt$feature, '_', i))
    
    ## Clean up
    if(clean_bim) unlink(dirname(filt_bim), recursive = TRUE)
    
    return(file.exists(paste0(out_file, '.wgt.RDat')))
    
}, i, i.names, BPPARAM = MulticoreParam(workers = opt$cores), SIMPLIFY = FALSE)
output_status <- unlist(output_status)
