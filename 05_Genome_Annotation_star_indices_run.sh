#! /bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 01:00:00
#SBATCH -J durian_star_indices


module load bioinfo-tools
module load star

STAR --runThreadN 8 \
 --runMode genomeGenerate \
 --genomeDir /home/grbui/DurianProject/analyses/05_genome_annotation/STAR_RNAseq_align/genome_indices \
 --genomeFastaFiles /home/grbui/DurianProject/analyses/03_genome_correction/repeat_masking/durian.contig.masked.fasta \
 --genomeSAindexNbases 12
#https://hbctraining.github.io/Intro-to-rnaseq-hpc-O2/lessons/03_alignment.html

#https://physiology.med.cornell.edu/faculty/skrabanek/lab/angsd/lecture_notes/STARmanual.pdf

#https://bioinformatics.stackexchange.com/questions/4364/can-i-run-star-without-an-annotation-file
