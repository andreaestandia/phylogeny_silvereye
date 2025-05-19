#!/bin/bash
#SBATCH --nodes=1
#SBATCH --clusters=arc
#SBATCH --ntasks-per-node=1
#SBATCH --time=2-10:00:00 
#SBATCH --job-name=iqtree
#SBATCH --partition=long

##################################################################################
#######################

#Load angsd module
#ml RAxML/8.2.12-gompi-2021b-hybrid-avx2
ml IQ-TREE/1.6.12-foss-2018b


PATH_INPUT=/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/reports/iqtree/

cd $PATH_INPUT

#iqtree -s iqtree.phy -m MF+ASC -o 15.179 -safe -b 100 -nt AUTO -st DNA
iqtree -s iqtree.phy -m MF+ASC -o 15.179 -safe -b 100 -nt AUTO -st DNA -pre run -seed 123

