# grch37 
library(biomaRt)
suppressPackageStartupMessages(library(biomaRt))
grch37 = useMart(biomart="ENSEMBL_MART_ENSEMBL", host="grch37.ensembl.org", path="/biomart/martservice", dataset="hsapiens_gene_ensembl")
gene_info = getBM(filters= "ensembl_gene_id", 
                  attributes= c("ensembl_gene_id",'hgnc_symbol','chromosome_name',"transcript_biotype"), 
                  values= gene_vec, 
                  mart= grch37)


