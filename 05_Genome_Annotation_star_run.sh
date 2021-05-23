#! /bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 06:00:00
#SBATCH -J durian_star

cat $0
echo JOB = "$SLURM_JOBID"

cp /home/grbui/DurianProject/data/raw_data/transcriptome/trimmed/* $SNIC_TMP
gunzip $SNIC_TMP/*
cp /home/grbui/DurianProject/analyses/01_preprocessing/trimming_untrimmed/SRR6040095_scaffold_06_1P.fastq \
  /home/grbui/DurianProject/analyses/01_preprocessing/trimming_untrimmed/SRR6040095_scaffold_06_2P.fastq  $SNIC_TMP

module load bioinfo-tools
module load star

STAR --runThreadN 8 \
 --genomeDir /home/grbui/DurianProject/analyses/05_genome_annotation/STAR_RNAseq_align/genome_indices \
 --readFilesIn $SNIC_TMP/SRR6040092_scaffold_06.1.fastq,$SNIC_TMP/SRR6040093_scaffold_06.1.fastq,$SNIC_TMP/SRR6040094_scaffold_06.1.fastq,$SNIC_TMP/SRR6040096_scaffold_06.1.fastq,$SNIC_TMP/SRR6040097_scaffold_06.1.fastq,$SNIC_TMP/SRR6040095_scaffold_06_1P.fastq $SNIC_TMP/SRR6040092_scaffold_06.2.fastq,$SNIC_TMP/SRR6040093_scaffold_06.2.fastq,$SNIC_TMP/SRR6040094_scaffold_06.2.fastq,$SNIC_TMP/SRR6040096_scaffold_06.2.fastq,$SNIC_TMP/SRR6040097_scaffold_06.2.fastq,$SNIC_TMP/SRR6040095_scaffold_06_2P.fastq \
 --outSAMtype BAM Unsorted

samtools sort -n Aligned.out.bam -o Aligned.out.sorted.bam
