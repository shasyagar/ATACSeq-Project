if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("ATACseqQC")
BiocManager::install("Rsamtools")
BiocManager::install("GenomicRanges")

library(ATACseqQC)
library(Rsamtools)
library(GenomicRanges)

bamFiles <- c("ATACrep3_shifted_no_mito_sorted.bam", "ATACrep4_shifted_no_mito_sorted.bam")
bamFiles.labels <- c("ATACrep3", "ATACrep4")

fragSizeDist(
  bamFiles = bamFiles,
  bamFiles.labels = bamFiles.labels,
  index = bamFiles,
  ylim = NULL,       
  logYlim = NULL      
)