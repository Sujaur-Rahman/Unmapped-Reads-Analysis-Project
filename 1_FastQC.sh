#!/bin/sh

##Change to the working directory if you are working on Easley
cd /hosted/cvmpt/archive/WGS_Human/

#load FastQC on easley
module load fastqc

########### Run FastQC on original forward fastq files.
########### What is FastQC analysis: A simple program used to assess the quality of the sequencing data generated from high throughput sequencing pipelines.

### This step should be performed before and after trimming.
#run fastqc on original forward fastq files

for UNTRIMMED_F_FASTQ in *_1_*.fastq.gz
do

fastqc $UNTRIMMED_F_FASTQ

done

mkdir Fastqc_untrimmed
mv *.html Fastqc_untrimmed
tar -czvf Fastqc_untrimmed.tar Fastqc_untrimmed
