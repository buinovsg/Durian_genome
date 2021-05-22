#! /bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 24:00:00
#SBATCH -J busco_durian

module load bioinfo-tools
module load BUSCO/3.0.2b

source $AUGUSTUS_CONFIG_COPY

python /sw/bioinfo/BUSCO/3.0.2b/rackham/bin/run_BUSCO.py -i /home/grbui/DurianProject/analyses/03_genome_correction/repeat_masking/durian.contig.masked.fasta \
 -o Durian_BUSCO -l $BUSCO_LINEAGE_SETS/embryophyta_odb9 -m geno
