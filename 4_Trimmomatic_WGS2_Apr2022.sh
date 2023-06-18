#!/bin/sh

cd /hosted/cvmpt/archive/WGS_Human/z_ROUND_2_Mar2022_TL
## load the module

#load the module on Easley
module load trimmomatic/0.39

ls *_1_*.fastq.gz > FSamplesList.txt

FILELIST=`cat FSamplesList.txt`

for FILENAME in $FILELIST
do
#BC-CR-100-1_1_Apr2022.fastq.gz
SHORTER=`echo $FILENAME | awk -F "." '{print $1}'`
SHORT=`echo $SHORTER | awk -F "_" '{print $1}'`

#Make sure that the path to the trimmomatic.jar file is correct
java -jar /tools/trimmomatic-0.39/trimmomatic-0.39.jar PE -threads 48 -phred33 -trimlog $SHORTER.trim.log "$SHORT"_1_Apr2022.fastq.gz "$SHORT"_2_Apr2022.fastq.gz -baseout $SHORT.trim.fastq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 HEADCROP:0 LEADING:0 TRAILING:0 SLIDINGWINDOW:4:10

done


#mv *trim_*U.fastq.gz

#gunzip "$FILENAME"_trim_1P.fastq.gz
#gunzip "$FILENAME"_trim_2P.fastq.gz
