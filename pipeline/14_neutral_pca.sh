#!/bin/bash
#SBATCH --nodes=1
#SBATCH --clusters=arc
#SBATCH --ntasks-per-node=1
#SBATCH --time=2-10:00:00 
#SBATCH --job-name=pca
#SBATCH --partition=long

##################################################################################
#######################

#Load angsd module
ml angsd/0.925-foss-2018b

PATH_INPUT="/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/reports/genotype_likelihoods/done/"
PATH_PCANGSD=""
PAHT_OUT="/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/reports/selection/"

python "${PATH_PCANGSD}pcangsd.py" -beagle "${PATH_INPUT}neutral_snps.beagle" -adm
ix -tree -out "${PATH_OUT}neutral_pca" -threads 25
