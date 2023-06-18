#!/bin/sh
##Needs to be ran on fastq files that have already been trimmed

cd /hosted/cvmpt/archive/WGS_Human/hepatitis_c_virus/HHV8/HHV8_New_Samples/
#/archive/merner_lab/vol1/WGS_Human/Unmapped_files/RefSeq

#/scratch/mcneeih/WGS_data/Unmapped_Fastq/RefSeq
#<Desired Working Directory>

############## Module Load ####################################

module load samtools
##########


FILELIST=`cat Fsamples.txt`  ##Can be used if a file list is needed
for FILE in $FILELIST; do

        #########Creating Variable for File names#################
##Need to be changed based on naming system
SHORTER=`echo $FILE | awk -F "." '{print $1}'`

#BC-CR-95-1.unmapped.bam

samtools sort -n "$SHORTER".unmapped.bam -o "$SHORTER".sorted.unmapped.bam
#samtools index "$SHORTER".UM_HHV8_NC_009333.memsorted.bam

done




#samtools sort -n -o aln.qsort.bam aln.bam
