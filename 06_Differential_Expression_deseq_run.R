#adapted from http://www.bioconductor.org/packages/release/bioc/vignettes/DESeq2/inst/doc/DESeq2.html#htseq-count-input 
setwd("~/MA_Bioinformatics/Genome_Analysis/Project/deseq")
library(DESeq2)
library(apeglm)
directory <- "C:/Users/Annyeong/Documents/MA_Bioinformatics/Genome_Analysis/Project/deseq/"
#specify htseq-count file names
sampleFiles <- grep("Durian",list.files(directory),value=TRUE)
#specify replicate factors
condition <- c('musangking','musangking','musangking','monthong','monthong','monthong')
sampleTable <- data.frame(sampleName = sampleFiles,
                          fileName = sampleFiles,
                          condition = condition)
sampleTable$condition <- factor(sampleTable$condition)
#create DESeqDATAset
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
                                       directory = directory,
                                       design= ~ condition)
ddsHTSeq
head(assay(ddsHTSeq))
#filtering out rows which have 10 count or less
keep <- rowSums(counts(ddsHTSeq)) >= 10
ddsHTSeq <- ddsHTSeq[keep,]
#setting the reference condition
ddsHTSeq$condition <- relevel(ddsHTSeq$condition, ref = "musangking")
dds <- DESeq(ddsHTSeq)
#check reference condition
resultsNames(dds)
#applying log fold change shrinkage for visualization
resLFC <- lfcShrink(dds, coef="condition_monthong_vs_musangking", type="apeglm")
resLFC
#plot the shrunken log2 fold changes
plotMA(resLFC, ylim=c(-2,2), nrpoints = 0)
#transforming data for PCA using variance stabilizing transformation
vsd <- vst(dds, blind=FALSE)
plotPCA(vsd, intgroup=c("condition"))
#multiple testing corrction using Benjamini-Hochberg method and FDR set to 0.05
library("BiocParallel")
register(SnowParam(4))
res05 <- results(dds, alpha=0.05)
summary(res05)
sum(res05$padj < 0.05, na.rm=TRUE)

