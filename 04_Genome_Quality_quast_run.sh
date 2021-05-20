#! /bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 10:00:00
#SBATCH -J durian_quast

cat $0
echo JOB = "$SLURM_JOBID"

module load bioinfo-tools
module load quast/5.0.2

python /sw/bioinfo/quast/5.0.2/snowy/bin/quast.py -t 2 -e -r /home/grbui/DurianProject/data/Paper5_scaffold06/scaffold_6.fasta \
 -g /home/grbui/DurianProject/data/Paper5_scaffold06/scaffold_06.gff pilon_round4.fasta 


