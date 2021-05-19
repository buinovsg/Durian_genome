#! /bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 06:00:00
#SBATCH -J durian_pilon1

cat $0
echo JOB = "$SLURM_JOBID"

module load bioinfo-tools
module load Pilon/1.24

java -jar $PILON_HOME/pilon.jar --genome /home/grbui/DurianProject/analyses/02_genome_assembly/canu_assembly/canu-pacbio/durian.contigs.fasta \
 --fix all --changes --bam /home/grbui/DurianProject/analyses/03_genome_correction/mapping.sorted.bam \
 --threads 2 --output /home/grbui/DurianProject/analyses/03_genome_correction/pilon/pilon_round1 | \
 tee /home/grbui/DurianProject/analyses/03_genome_correction/pilon/round1.pilon



