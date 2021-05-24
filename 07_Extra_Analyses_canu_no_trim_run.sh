#! /bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 48:00:00
#SBATCH -J durian_no_trim_canu

module load bioinfo-tools
module load canu/2.0
module load quast/5.0.2

canu -correct \
  -p durian -d durian-canu \
  genomeSize=27m \
  -pacbio  ~/DurianProject/data/raw_data/pacbio_data/SRR6037732_scaffold_06.fq.gz

canu \
  -p durian -d durian-erate-0.039 \
  genomeSize=27m \
  correctedErrorRate=0.039 \
  -corrected -pacbio durian-canu/durian.correctedReads.fasta.gz

canu \
  -p durian -d durian-erate-0.075 \
  genomeSize=27m \
  correctedErrorRate=0.075 \
  -corrected -pacbio durian-canu/durian.correctedReads.fasta.gz

python /sw/bioinfo/quast/5.0.2/snowy/bin/quast.py -t 2 -e -r /home/grbui/DurianProject/data/Paper5_scaffold06/scaffold_6.fasta \
 -g /home/grbui/DurianProject/data/Paper5_scaffold06/scaffold_06.gff durian-erate-0.039/durian.contig.fasta 

python /sw/bioinfo/quast/5.0.2/snowy/bin/quast.py -t 2 -e -r /home/grbui/DurianProject/data/Paper5_scaffold06/scaffold_6.fasta \
 -g /home/grbui/DurianProject/data/Paper5_scaffold06/scaffold_06.gff durian-erate-0.075/durian.contig.fasta
