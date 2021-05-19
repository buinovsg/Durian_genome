#! /bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 12:00:00
#SBATCH -J durian_bwa

cat $0
echo JOB = "$SLURM_JOBID"

cd $SNIC_TMP

mkdir assembly
cp /home/grbui/DurianProject/analyses/02_genome_assembly/canu_assembly/canu-pacbio/durian.contigs.fasta assembly/

mkdir illumina_data
cp /proj/g2021012/5_Tean_Teh_2017/illumina_data/SRR6058604_scaffold_06* illumina_data/
gunzip illumina_data/*
ls illumina_data/

module load bioinfo-tools
module load bwa/0.7.17
module load samtools

bwa index assembly/durian.contigs.fasta

bwa mem -t 2 assembly/durian.contigs.fasta illumina_data/SRR6058604_scaffold_06.1P.fastq illumina_data/SRR6058604_scaffold_06.2P.fastq > bwa_mapping.sam
echo "completed bwa mem"

cp bwa_mapping.sam /home/grbui/DurianProject/analyses/03_genome_correction/ 

samtools view -Sb bwa_mapping.sam | samtools view - -Sb | samtools sort - -@14 -o /home/grbui/DurianProject/analyses/03_genome_correction/mapping.sorted.bam

samtools index /home/grbui/DurianProject/analyses/03_genome_correction/mapping.sorted.bam

