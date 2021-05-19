#! /bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 24:00:00
#SBATCH -J durian_pilon234_1

cat $0
echo JOB = "$SLURM_JOBID"

module load bioinfo-tools
module load Pilon/1.24
module load bwa/0.7.17
module load samtools

mkdir $SNIC_TMP/illumina_data
cp /proj/g2021012/5_Tean_Teh_2017/illumina_data/SRR6058604_scaffold_06* $SNIC_TMP/illumina_data/
gunzip $SNIC_TMP/illumina_data/*

#///////Round2:///////

bwa index /home/grbui/DurianProject/analyses/03_genome_correction/pilon/pilon_round1.fasta
bwa mem -t 2 /home/grbui/DurianProject/analyses/03_genome_correction/pilon/pilon_round1.fasta $SNIC_TMP/illumina_data/SRR6058604_scaffold_06.1P.fastq \
 $SNIC_TMP/illumina_data/SRR6058604_scaffold_06.2P.fastq | samtools view -Sb  | samtools view - -Sb | samtools sort - -@14 -o \
 /home/grbui/DurianProject/analyses/03_genome_correction/illumina_mapping/mapping_pilon1.sorted.bam
samtools index /home/grbui/DurianProject/analyses/03_genome_correction/illumina_mapping/mapping_pilon1.sorted.bam

java -jar $PILON_HOME/pilon.jar --genome /home/grbui/DurianProject/analyses/03_genome_correction/pilon/pilon_round1.fasta \
 --fix all --changes --bam /home/grbui/DurianProject/analyses/03_genome_correction/illumina_mapping/mapping_pilon1.sorted.bam \
 --threads 2 --output /home/grbui/DurianProject/analyses/03_genome_correction/pilon/pilon_round2 | \
 tee /home/grbui/DurianProject/analyses/03_genome_correction/pilon/round2.pilon

#///////Round3:///////

bwa index /home/grbui/DurianProject/analyses/03_genome_correction/pilon/pilon_round2.fasta
bwa mem -t 2 /home/grbui/DurianProject/analyses/03_genome_correction/pilon/pilon_round2.fasta $SNIC_TMP/illumina_data/SRR6058604_scaffold_06.1P.fastq \
 $SNIC_TMP/illumina_data/SRR6058604_scaffold_06.2P.fastq | samtools view -Sb  | samtools view - -Sb | samtools sort - -@14 -o \
 /home/grbui/DurianProject/analyses/03_genome_correction/illumina_mapping/mapping_pilon2.sorted.bam
samtools index /home/grbui/DurianProject/analyses/03_genome_correction/illumina_mapping/mapping_pilon2.sorted.bam

java -jar $PILON_HOME/pilon.jar --genome /home/grbui/DurianProject/analyses/03_genome_correction/pilon/pilon_round2.fasta \
 --fix all --changes --bam /home/grbui/DurianProject/analyses/03_genome_correction/illumina_mapping/mapping_pilon2.sorted.bam \
 --threads 2 --output /home/grbui/DurianProject/analyses/03_genome_correction/pilon/pilon_round3 | \
 tee /home/grbui/DurianProject/analyses/03_genome_correction/pilon/round3.pilon

#///////Round4:///////

bwa index /home/grbui/DurianProject/analyses/03_genome_correction/pilon/pilon_round3.fasta
bwa mem -t 2 /home/grbui/DurianProject/analyses/03_genome_correction/pilon/pilon_round3.fasta $SNIC_TMP/illumina_data/SRR6058604_scaffold_06.1P.fastq \
 $SNIC_TMP/illumina_data/SRR6058604_scaffold_06.2P.fastq | samtools view -Sb  | samtools view - -Sb | samtools sort - -@14 -o \
 /home/grbui/DurianProject/analyses/03_genome_correction/illumina_mapping/mapping_pilon3.sorted.bam
samtools index /home/grbui/DurianProject/analyses/03_genome_correction/illumina_mapping/mapping_pilon3.sorted.bam

java -jar $PILON_HOME/pilon.jar --genome /home/grbui/DurianProject/analyses/03_genome_correction/pilon/pilon_round3.fasta \
 --fix all --changes --bam /home/grbui/DurianProject/analyses/03_genome_correction/illumina_mapping/mapping_pilon3.sorted.bam \
 --threads 2 --output /home/grbui/DurianProject/analyses/03_genome_correction/pilon/pilon_round4 | \
 tee /home/grbui/DurianProject/analyses/03_genome_correction/pilon/round4.pilon

