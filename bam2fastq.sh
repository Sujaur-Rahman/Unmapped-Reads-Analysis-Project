#!/bin/sh


cd /hosted/cvmpt/archive/WGS_Human/hepatitis_c_virus/HHV8/HHV8_New_Samples/



   ############## Module Load ####################################

module load samtools

   ##########


FILELIST=`cat Fsamples.txt`  ##Can be used if a file list is needed
for FILE in $FILELIST; do

    #########Creating Variable for File names#################
    #########Need to be changed based on naming system#######
SHORTER=`echo $FILE | awk -F "." '{print $1}'`

#########output paired and singleton reads in a single file
samtools fastq -0 /dev/null "$SHORTER".sorted.unmapped.bam > "$SHORTER".sorted.unmapped.fastq

###Discard singleton and paird reads are in seperate files
###samtools fastq "$SHORTER".sorted.unmapped.bam  -1 "$SHORTER".sorted.unmapped_1.fq -2 "$SHORTER".sorted.unmapped_2.fq -0 /dev/null -s /dev/null -n

#########Keep singleton and paird reads are in seperate files
#########samtools fastq "$SHORTER".sorted.unmapped.bam  -1 "$SHORTER".sorted.unmapped_1.fq -2 "$SHORTER".sorted.unmapped_2.fq -0 /dev/null -n

##############Singleton in seperate file and paird reads in single file
##############samtools fastq -0 /dev/null -s single.fq -N "$SHORTER".sorted.unmapped.bam > "$SHORTER".sorted.unmapped.fq

######## dev null = /dev/null in Linux is a null device file. This will discard anything written to it, and will return EOF(end of file) on reading.This is a command-line hack that acts as a vacuum, that sucks anything thrown to it.
######## -0 = write reads where the READ1 and READ2 FLAG bits set are either both set or both unset to FILE instead of outputting them.
######## -s = Write singleton reads to FILE.
######## -n = By default, either '/1' or '/2' is added to the end of read names where the corresponding READ1 or READ2 FLAG bit is set. Using -n causes read names to be left as they are.

done

