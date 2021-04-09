# Durian_genome

Basic analyses:

● Reads preprocessing: trimming + quality check (before and after)

FastQC for both Illumina short reads

Trimmomatic – for Illumina reads

● Genome assembly of PacBio reads. 

Canu – does both trimming and assembly of PacBio

● Correct the assembly with Illumina reads.

BWA maps Illumina to draft assembly 

Pilon – polishing the draft assembly with Illumina short reads

RepeatMasker

● Assembly quality assessment.

BUSCO
QUAST

● Structural and functional annotation.

BRAKER

● Differential expression analyses. 

Htseq 
