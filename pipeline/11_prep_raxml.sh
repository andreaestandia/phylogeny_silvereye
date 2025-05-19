#!/bin/bash
#SBATCH --nodes=1
#SBATCH --clusters=arc
#SBATCH --ntasks-per-node=1
#SBATCH --time=2-10:00:00 
#SBATCH --job-name=prep_raxml
#SBATCH --partition=long

##################################################################################
#######################

PATH_INPUT="/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/reports/vcf/"
PATH_SRC="/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/src/"

cd ${PATH_INPUT}

python "${PATH_SRC}vcf2phylip.py" -i neutral_snps_certain_renamed.vcf -o neutral_snps_certain.phy
python "${PATH_SRC}AMAS/amas/AMAS.py" convert -i neutral_snps_certain.phy -d dna -f phylip -u fasta
