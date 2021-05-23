#! /bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 06:00:00
#SBATCH -J durian_star_htseq

cat $0
echo JOB = "$SLURM_JOBID"

cp /home/grbui/DurianProject/data/raw_data/transcriptome/trimmed/SRR6040094_scaffold_06.1.fastq.gz \
 /home/grbui/DurianProject/data/raw_data/transcriptome/trimmed/SRR6040094_scaffold_06.2.fastq.gz \
 /home/grbui/DurianProject/data/raw_data/transcriptome/trimmed/SRR6040097_scaffold_06.1.fastq.gz \
 /home/grbui/DurianProject/data/raw_data/transcriptome/trimmed/SRR6040097_scaffold_06.2.fastq.gz \
 /home/grbui/DurianProject/data/raw_data/transcriptome/trimmed/SRR6156066_scaffold_06.1.fastq.gz \
 /home/grbui/DurianProject/data/raw_data/transcriptome/trimmed/SRR6156066_scaffold_06.2.fastq.gz \
 /home/grbui/DurianProject/data/raw_data/transcriptome/trimmed/SRR6156067_scaffold_06.1.fastq.gz \
 /home/grbui/DurianProject/data/raw_data/transcriptome/trimmed/SRR6156067_scaffold_06.2.fastq.gz \
 /home/grbui/DurianProject/data/raw_data/transcriptome/trimmed/SRR6156069_scaffold_06.1.fastq.gz \
 /home/grbui/DurianProject/data/raw_data/transcriptome/trimmed/SRR6156069_scaffold_06.2.fastq.gz  $SNIC_TMP
gunzip $SNIC_TMP/*

cp /home/grbui/DurianProject/analyses/01_preprocessing/trimming_untrimmed/SRR6040095_scaffold_06_1P.fastq \
  /home/grbui/DurianProject/analyses/01_preprocessing/trimming_untrimmed/SRR6040095_scaffold_06_2P.fastq  $SNIC_TMP

cd $SNIC_TMP

module load bioinfo-tools
module load star
module load samtools

STAR --runThreadN 8 \
 --genomeDir /home/grbui/DurianProject/analyses/05_genome_annotation/STAR_RNAseq_align/genome_indices \
 --readFilesIn SRR6040094_scaffold_06.1.fastq SRR6040094_scaffold_06.2.fastq \
 --outSAMtype BAM SortedByCoordinate \
 --outFileNamePrefix /proj/g2021012/nobackup/gretbuin/htseq/separate_RNAseq/output/SRR6040094

STAR --runThreadN 8 \
 --genomeDir /home/grbui/DurianProject/analyses/05_genome_annotation/STAR_RNAseq_align/genome_indices \
 --readFilesIn SRR6040097_scaffold_06.1.fastq SRR6040097_scaffold_06.2.fastq \
 --outSAMtype BAM SortedByCoordinate \
 --outFileNamePrefix /proj/g2021012/nobackup/gretbuin/htseq/separate_RNAseq/output/SRR6040097

STAR --runThreadN 8 \
 --genomeDir /home/grbui/DurianProject/analyses/05_genome_annotation/STAR_RNAseq_align/genome_indices \
 --readFilesIn SRR6040095_scaffold_06_1P.fastq SRR6040095_scaffold_06_2P.fastq \
 --outSAMtype BAM SortedByCoordinate \
 --outFileNamePrefix /proj/g2021012/nobackup/gretbuin/htseq/separate_RNAseq/output/SRR6040095

STAR --runThreadN 8 \
 --genomeDir /home/grbui/DurianProject/analyses/05_genome_annotation/STAR_RNAseq_align/genome_indices \
 --readFilesIn SRR6156066_scaffold_06.1.fastq SRR6156066_scaffold_06.2.fastq \
 --outSAMtype BAM SortedByCoordinate \
 --outFileNamePrefix /proj/g2021012/nobackup/gretbuin/htseq/separate_RNAseq/output/SRR6156066

STAR --runThreadN 8 \
 --genomeDir /home/grbui/DurianProject/analyses/05_genome_annotation/STAR_RNAseq_align/genome_indices \
 --readFilesIn SRR6156067_scaffold_06.1.fastq SRR6156067_scaffold_06.2.fastq \
 --outSAMtype BAM SortedByCoordinate \
 --outFileNamePrefix /proj/g2021012/nobackup/gretbuin/htseq/separate_RNAseq/output/SRR6156067

STAR --runThreadN 8 \
 --genomeDir /home/grbui/DurianProject/analyses/05_genome_annotation/STAR_RNAseq_align/genome_indices \
 --readFilesIn SRR6156069_scaffold_06.1.fastq SRR6156069_scaffold_06.2.fastq \
 --outSAMtype BAM SortedByCoordinate \
 --outFileNamePrefix /proj/g2021012/nobackup/gretbuin/htseq/separate_RNAseq/output/SRR6156069


for FILE in /proj/g2021012/nobackup/gretbuin/htseq/separate_RNAseq/output/*.bam; do samtools index $FILE; done
