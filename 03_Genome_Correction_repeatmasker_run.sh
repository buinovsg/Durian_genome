#! /bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 03:00:00
#SBATCH -J durian_repeat_mask

cat $0
echo JOB = "$SLURM_JOBID"

module load bioinfo-tools
module load RepeatMasker/4.1.0

RepeatMasker -species cotton -xsmall pilon_round4.fasta

