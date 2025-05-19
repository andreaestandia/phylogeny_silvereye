#!/bin/bash
#SBATCH --nodes=1
#SBATCH --clusters=arc
#SBATCH --ntasks-per-node=1
#SBATCH --time=2-10:00:00 
#SBATCH --job-name=treemix
#SBATCH --partition=long

##################################################################################
#######################

#Load angsd module
#ml R/4.2.2-foss-2022a
ml TreeMix/1.13-intel-2020a

PATH_INPUT=/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/reports/treemix/mainland/

cd $PATH_INPUT

for m in {1..15}

   do

   for i in {1..10}

      do

      s=$RANDOM

      echo "Random seed = ${s}"

      treemix -i neutral_snps_certain_renamed.LDpruned_mainland.treemix.frq.gz  -o neutral_snps_certain_renamed.LDpruned_mainland.${i}.${m} -m ${m} -root Zosterops_tenuirostris -k 1000 -seed ${s}

      done 

done

