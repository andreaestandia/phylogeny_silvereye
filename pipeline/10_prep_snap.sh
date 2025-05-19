#!/bin/bash
#SBATCH --nodes=1
#SBATCH --clusters=arc
#SBATCH --ntasks-per-node=1
#SBATCH --time=2-10:00:00 
#SBATCH --job-name=prep_snapp
#SBATCH --partition=long

##################################################################################
#######################

PATH_INPUT="/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/reports/vcf/"

cd ${PATH_INPUT}

bgzip -c neutral_snps_certain.vcf > neutral_snps_certain.vcf.gz
tabix neutral_snps_certain.vcf.gz

bcftools view -s Ind23,Ind21,Ind32,Ind51,Ind52,Ind94,Ind12,Ind54,Ind55,Ind0,Ind57,Ind59,Ind61,Ind65,Ind27,Ind10,Ind69,Ind101,Ind74,Ind78,Ind91,Ind80,Ind87,Ind26,Ind114,Ind44,Ind39,Ind105,Ind4,Ind109,Ind113,Ind40,Ind100 -o neutral_snps_subset.vcf neutral_snps_certain.vcf.gz

ruby snapp_prep.rb -v neutral_snps_subset.vcf -t individuals.txt -m 1000 -l 100000
 -c constraints.txt
