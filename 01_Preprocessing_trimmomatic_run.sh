#! /bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 06:00:00
#SBATCH -J durian_trimmomatic

cat $0
echo JOB = "$SLURM_JOBID"

module load bioinfo-tools
module load trimmomatic/0.36

cp /proj/g2021012/5_Tean_Teh_2017/transcriptome/untrimmed/*_06.* $SNIC_TMP

java -jar $TRIMMOMATIC_HOME/trimmomatic.jar PE -threads 2 \
 -trimlog trim_log.txt \
 $SNIC_TMP/SRR6040095_scaffold_06.1.fastq.gz \
 $SNIC_TMP/SRR6040095_scaffold_06.2.fastq.gz \
 -baseout SRR6040095_scaffold_06 \
 ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 MINLEN:36

