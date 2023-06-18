#!/bin/sh

cd /hosted/cvmpt/archive/WGS_Human/Puerto/chm13/group2

module load gatk 
module load samtools

FILELIST=`cat FSamplesList.vcf.group2.txt`  ##Can be used if a file list is needed
for FILE in $FILELIST; do

        #########Creating Variable for File names#################
##Need to be changed based on naming system
#Input = BC-CR-100-1_1_Apr2022.fastq.gz

#SHORTER=`echo $FILE | awk -F "." '{print $1}'`
SHORT=`echo $FILE | awk -F "." '{print $1}'`     

##SHORT = BC-CR-100-1
#BC-CR-100-1.memsorted.bam 

 gatk --java-options "-Xmx80g" HaplotypeCaller  \
   -R /hosted/cvmpt/archive/WGS_Human/SRG_WGS2_PR1_genome_Jun2022/CHM13_genome/CHM13_genome/chm13v2.0.fa \
   -I "$SHORT".recal.sorted.bam \
   -O "$SHORT".g.vcf.gz \
   -ERC GVCF \
   -A AlleleFraction \
   -A BaseQuality \
   -A MappingQuality \
   --native-pair-hmm-threads 48 
   

done
