#!/bin/sh

cd /hosted/cvmpt/archive/WGS_Human/Puerto/chm13/flagstat

module load samtools

FILELIST=`cat FSamplesList_flagstat.txt`  ##Can be used if a file list is needed
for FILE in $FILELIST; do

        #########Creating Variable for File names#################
##Need to be changed based on naming system
#Input = BC-CR-100-1_1_Apr2022.fastq.gz

#SHORTER=`echo $FILE | awk -F "." '{print $1}'`
SHORT=`echo $FILE | awk -F "." '{print $1}'`     

##SHORT = BC-CR-100-1
#BC-CR-100-1.memsorted.bam 

samtools flagstat "$SHORT".markdup.sorted.bam > "$SHORT".flagstat.txt

done
