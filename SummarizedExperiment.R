library(GenomicRanges)
library(airway)

# Overview
colData(airway)

# Exp data
exptData(airway)
colnames(airway)
head(rownames(airway))
assayNames(airway)
assays(airway)

# New features
# So far, this is all information which could be stored in an ExpressionSet. The new thing is that SummarizedExperiment allows for a rowRanges (or granges) data representing the different features. The idea is that these GRanges tells us which part of the genome is summarized for a particular feature. Let us take a look
# See how rowRanges is a GRangesList (it could also be a single GRanges). Each element of the list represents a feature and the GRanges of the feature tells us the coordinates of the exons in the gene (or transcript). Because these are genes, for each GRanges, all the ranges should have the same strand and seqnames, but that is not enforced.

# In total we have around 64k “genes” or “transcripts” and around 745k different exons.

length(rowRanges(airway))
dim(airway)
rowRanges(airway)


