#!/bin/sh

cd /hosted/cvmpt/archive/WGS_Human/Puerto/chm13/group1/

module load gatk 
module load picard
module load samtools

FILELIST=`cat md.FSamplesList.group1.txt`  ##Can be used if a file list is needed
for FILE in $FILELIST; do

        #########Creating Variable for File names#################
##Need to be changed based on naming system
#Input = BC-CR-100-1_1_Apr2022.fastq.gz

#SHORTER=`echo $FILE | awk -F "." '{print $1}'`
SHORT=`echo $FILE | awk -F "." '{print $1}'`     

##SHORT = BC-CR-100-1
#BC-CR-100-1.memsorted.bam 

java -jar /tools/picard-2.23.9/libs/picard.jar MarkDuplicates \
      I="$SHORT".rgsorted.bam \
      O="$SHORT".markdup.bam \
      M="$SHORT".marked_dup_metrics.txt

samtools sort -@ 48 "$SHORT".markdup.bam -o "$SHORT".markdup.sorted.bam
samtools index -@ 48 "$SHORT".markdup.sorted.bam

done

