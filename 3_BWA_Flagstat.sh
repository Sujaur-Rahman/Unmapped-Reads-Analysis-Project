#!/bin/sh

cd /hosted/cvmpt/archive/WGS_Human/Puerto/

############## Module Load ####################################

module load bwa
module load samtools


##############################################################



#BC-CR-100-1.sorted.unmapped.fastq

FILELIST=`cat FsamplesList.txt`  ##Can be used if a file list is needed
for FILE in $FILELIST; do


        SHORT=`echo $FILE | awk -F "." '{print $1}'`

#using bwa mem to align the unmapped reads with chm13 genome
bwa mem -t 20 -M -p /mmfs1/hosted/cvmpt/Human_Research/CHM13_genome/chm13v2.0 "$SHORT".sorted.unmapped.fastq > "$SHORT".UM_mem.sam

#samtools view is to convert sam to bam
samtools view -Sb -@ 20 "$SHORT".UM_mem.sam -o "$SHORT".UM_mem.bam

samtools sort -@ 20 "$SHORT".UM_mem.bam -o "$SHORT".UM_memsorted.bam

samtools index -@ 20 "$SHORT".UM_memsorted.bam     

samtools flagstat $SHORT.UM_mem.sam > $SHORT.UM_stat.txt


done
