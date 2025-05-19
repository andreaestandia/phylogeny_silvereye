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

PATH_INPUT=/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/reports/raxml/
PATH_SRC=/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/src/

cd $PATH_INPUT

raxmlHPC -N autoMRE -m GTRGAMMA -x $RANDOM -p $RANDOM -s neutral_snps_certain.fasta -T 40 -n neutral_snps_certain_raxml
"${PATH_SRC}raxml-ng" --all --msa output.phy --model GTGTR4 --tree pars{10} --bs-trees 200 --outgroup 15.179
