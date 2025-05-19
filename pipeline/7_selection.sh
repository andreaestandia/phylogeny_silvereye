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
PATH_PCANGSD=""
PATH_OUT="/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/reports/selection/"

gzip -k "${PATH_INPUT}combined_beagle"
python "${PATH_PCANGSD}pcangsd.py" -beagle "${PATH_INPUT}combined_beagle.gz" -selection -out "${PATH_OUT}pca" -threads 25

