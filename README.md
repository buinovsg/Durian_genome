# Durian_genome


## Outline

The aim of this project is to become familiar with genome assemmbly procedure by means of assembling a contig taken from a the raw read data taken from a Durio zibethinus assembly (https://doi.org/10.1038/ng.3972). The project will include the following steps: read preprocessing, genome assembly, correction, quality check, annotation and differential expression analysis. Roughly the aim is to complete the steps up to correction by April 15th 2021 and to complete all analyses by May 4th 2021 followed by the result analysis and final presentation of results on May 26th 2021. The raw data and all analyses-related files will be stored in UPPMAX and organized in directories which indicate the order in which the analyses are to be performed performed.

## Analyses:

● Reads preprocessing: trimming + quality check (before and after) for the untrimmed RNAseq file

**Trimmomatic** – for Illumina reads

**FastQC** - for quality assessment of the reads before and after the trimming of the untrimmed file, and assessment of all the already trimmed ILLUMINA files

● Genome assembly of PacBio reads. 

**Canu** – does both trimming and assembly of PacBio

● Correct the assembly with Illumina reads.

**BWA** - maps Illumina to draft assembly 

**Pilon** - polishing the draft assembly with Illumina short reads

**RepeatMasker** - softmasking the draft contig assembly, useful for the gene annotation step later

● Assembly quality assessment.

**QUAST** - general assembly statistics as well as using the RNAseq data to see how well genes are assembled

● Structural and functional annotation.

**STAR** - to make alignmnet files of RNA seq to our assembly

**BRAKER** - gene annotation of the assembly

**EGGNOG MAPPER** - find potential function in the genes annotaated by BRAKER

● Differential expression analyses.

**STAR** - to make alignmnet files of RNA seq files which we wish to compare for expression

**Htseq** - produces expression count files

**DSEQ** analysing and visualizing downregulation ad upregulation of genes

●  Extra analyses

**BUSCO** - to check how many of expected orthologs can be has been captured in the assembly

**TRINITY** - de novo transcriptome assembly
