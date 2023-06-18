#!/bin/sh

cd /hosted/cvmpt/archive/WGS_Human/Puerto/chm13/group1/

module load gatk 
module load samtools
module load R

FILELIST=`cat bqsr.samplesList.group1.txt`  ##Can be used if a file list is needed
for FILE in $FILELIST; do

        #########Creating Variable for File names#################
##Need to be changed based on naming system
#Input = BC-CR-100-1_1_Apr2022.fastq.gz

#SHORTER=`echo $FILE | awk -F "." '{print $1}'`
SHORT=`echo $FILE | awk -F "." '{print $1}'`     

##SHORT = BC-CR-100-1
#BC-CR-100-1.memsorted.bam 

gatk BaseRecalibrator \
-I "$SHORT".markdup.sorted.bam \
-R /hosted/cvmpt/archive/WGS_Human/SRG_WGS2_PR1_genome_Jun2022/CHM13_genome/CHM13_genome/chm13v2.0.fa \
--known-sites /hosted/cvmpt/archive/WGS_Human/SRG_WGS2_PR1_genome_Jun2022/Known_Sites_CHM13/dbSNP_Files_KnownSites_CHM13/chm13v2.0_dbSNPv155.vcf \
-O "$SHORT".recal_data.table
 
gatk ApplyBQSR \
-R /hosted/cvmpt/archive/WGS_Human/SRG_WGS2_PR1_genome_Jun2022/CHM13_genome/CHM13_genome/chm13v2.0.fa \
-I "$SHORT".markdup.sorted.bam \
--bqsr-recal-file "$SHORT".recal_data.table \
-O "$SHORT".recal.bam
 
gatk AnalyzeCovariates \
-bqsr "$SHORT".recal_data.table \
-plots "$SHORT".AnalyzeCovariates.pdf

samtools sort -@ 48 "$SHORT".recal.bam -o "$SHORT".recal.sorted.bam
samtools index -@ 48 "$SHORT".recal.sorted.bam


done
# Need to mv files and make directory

