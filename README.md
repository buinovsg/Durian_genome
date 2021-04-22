# Durian_genome


## Aim

The aim of this project is to become familiar with genome assemmbly procedure by means of assembling a contig taken from a Durio zibethinus assembly (https://doi.org/10.1038/ng.3972).


## Analyses:

● Reads preprocessing: trimming + quality check (before and after)

**FastQC** for both Illumina short reads

**Trimmomatic** – for Illumina reads  COULD STILL USE TRIMMOMATICS 

● Genome assembly of PacBio reads. 

**Canu** – does both trimming and assembly of PacBio

● Correct the assembly with Illumina reads.

**BWA** maps Illumina to draft assembly 

**Pilon** – polishing the draft assembly with Illumina short reads

**RepeatMasker** optional

● Assembly quality assessment.

**BUSCO**

**QUAST**

● Structural and functional annotation.

**BRAKER** WANT TO FIND OUT IF YOU HAVE GENES
**eggnog** ASSEMBLY AS INPUTFUNCTIONAL ANNOTATION EGGNOG FOR POTENTIAL FUNCTION

● Differential expression analyses. 
STAR FOR MAPPING RNA TO GENOME ASSEMBLY
**Htseq**   
*DSEQ*  HOW GENES ARE UP AND DOWN REGULATED
