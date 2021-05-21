#! /bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 24:00:00
#SBATCH -J durian_braker

cat $0
echo JOB = "$SLURM_JOBID"

module load bioinfo-tools
module load braker

source $AUGUSTUS_CONFIG_COPY

braker.pl --species=Dzibethinus --genome=/home/grbui/DurianProject/analyses/03_genome_correction/repeat_masking/durian.contig.masked.fasta \
     --softmasking  --bam=/home/grbui/DurianProject/analyses/05_genome_annotation/STAR_RNAseq_align/Aligned.out.sorted.bam

