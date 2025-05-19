#!/bin/bash
#SBATCH --nodes=1
#SBATCH --clusters=arc
#SBATCH --ntasks-per-node=1
#SBATCH --time=2-10:00:00 
#SBATCH --job-name=selection
#SBATCH --partition=long

##################################################################################
#######################

#Load angsd module
ml angsd/0.925-foss-2018b

# Set path to reference assembly and list of bam files (bam.list)
# Note: bam files need to be indexed (using samtools index) 
PATH_INPUT="/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/reports/genotype_likelihoods/done/"
PATH_RESOURCES="/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/analysis/resources/"

cd $PATH_INPUT

#Unzip file
#gunzip -k combined_beagle.gz 

#Keep only sites we want
grep -w -F -f "${PATH_RESOURCES}subset_neutral_snps_2.5M" combined_beagle > neutral_snps.beagle

#Remove those bases where there's some uncertainty. We keep 21724 loci
awk '{ for (i=1; i<=NF-2; i++) if ($i == "0.333333" && $(i+1) == "0.333333" && $(i+2) == "0.333333") next } 1' neutral_snps.beagle >  neutral_snps_certain.beagle
