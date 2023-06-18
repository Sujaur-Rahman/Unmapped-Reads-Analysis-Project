#!/bin/sh
cd /hosted/cvmpt/archive/WGS_Human/Puerto/chm13/all.vcf

module load gatk 

 gatk --java-options "-Xmx550g" GenotypeGVCFs \
   -R /hosted/cvmpt/archive/WGS_Human/SRG_WGS2_PR1_genome_Jun2022/CHM13_genome/CHM13_genome/chm13v2.0.fa \
   -V gendb://WGS_GDBI_Workspace \
   -O GenotypeGVCF_output_WGS.vcf.gz \
   --tmp-dir GenotypeGVCF_tmp
