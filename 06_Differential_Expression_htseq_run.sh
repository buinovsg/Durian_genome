#! /bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 02:00:00
#SBATCH -J durian_htseq

cat $0
echo JOB = "$SLURM_JOBID"

module load bioinfo-tools
module load htseq

cd /proj/g2021012/nobackup/gretbuin/htseq/separate_RNAseq/output/

for FILE in *.bam
do

echo $FILE
SUBNAME=$(echo $FILE | cut -d'A' -f 1)
echo $SUBNAME
htseq-count -r pos -f bam $FILE  /home/grbui/DurianProject/analyses/06_differential_expression_analysis/Htseq_analysis/braker_remove_no_gene_id.gtf > $SUBNAME.htseq.output.txt
mv *.htseq.output.txt /proj/g2021012/nobackup/gretbuin/htseq/separate_htseq

done

