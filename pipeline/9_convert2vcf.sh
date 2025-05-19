
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --clusters=arc
#SBATCH --ntasks-per-node=1
#SBATCH --time=2-10:00:00 
#SBATCH --job-name=beagle_to_vcf
#SBATCH --partition=long

##################################################################################
#######################

PATH_INPUT="/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/reports/genotype_likelihoods/done/"
PATH_SCRIPT="/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/src/"
PATH_OUT="/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/reports/vcf/"

python "${PATH_SCRIPT}beagle_to_vcf.py" "${PATH_INPUT}neutral_snps_certain.beagle"
 "${PATH_OUT}neutral_snps_certain.vcf"
