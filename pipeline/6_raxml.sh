#!/bin/bash
#SBATCH --nodes=1
#SBATCH --clusters=arc
#SBATCH --ntasks-per-node=1
#SBATCH --time=2-10:00:00 
#SBATCH --job-name=raxml
#SBATCH --partition=long

##################################################################################
#######################

#Load angsd module
ml RAxML/8.2.12-gompi-2021b-hybrid-avx2

# Set path to reference assembly and list of bam files (bam.list)
# Note: bam files need to be indexed (using samtools index) 
PATH_INPUT=/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/reports/fasta/

cd $PATH_INPUT

raxmlHPC -N autoMRE -m GTRGAMMA -x $RANDOM -p $RANDOM -s combined_beagle.fa -T 40 -n combined_beagle 

