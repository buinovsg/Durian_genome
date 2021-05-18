#! /bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 48:00:00
#SBATCH -J durian_canu


module load bioinfo-tools
module load canu/2.0


canu \
-p durian -d canu-pacbio \
genomeSize=27m \
-pacbio-raw ~/DurianProject/data/pacbio_data/SRR6037732_scaffold_06.fq.gz
