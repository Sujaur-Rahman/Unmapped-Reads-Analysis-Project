#!/bin/sh

cd /hosted/cvmpt/archive/WGS_Human/Puerto/chm13/group1/


module load gatk

module load samtools


FILELIST=`cat samples.cov.group1.txt`

for FILE in $FILELIST; do 


SHORT=`echo $FILE | awk -F "." '{print $1}'`

gatk \
  DepthOfCoverage \
  -R /mmfs1/hosted/cvmpt/Human_Research/CHM13_genome/chm13v2.0.fa \
  -O "$SHORT".DOC_base \
  -I "$SHORT".markdup.sorted.bam \
  -L /hosted/cvmpt/archive/WGS_Human/Puerto/list_of_interval_puerto/chm13v2.0.interval_list \
  --summary-coverage-threshold 4 --summary-coverage-threshold 6 --summary-coverage-threshold 10 --summary-coverage-threshold 15 --summary-coverage-threshold 20 --summary-coverage-threshold 25 --summary-coverage-threshold 30 --summary-coverage-threshold 35 --summary-coverage-threshold 40 --summary-coverage-threshold 45 --summary-coverage-threshold 50 \


done
