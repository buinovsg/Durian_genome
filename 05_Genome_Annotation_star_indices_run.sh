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
