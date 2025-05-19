#!/bin/bash

#SBATCH --nodes=1
#SBATCH --job-name=saf
#SBATCH --partition=long
#SBATCH --cluster=arc

module purge
# module spider angsd/0.935-GCC-10.2.0
module load angsd/0.935-GCC-10.2.0

PATH_INPUT="/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/data/fst/"
PATH_REF="/data/zool-zost/Ref_Genome/Ref_Genome_PseudoChroms/"
PATH_OUT="/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/reports/fst/"

declare -a pop=("ambrym" "NSW" "chatham" "efate" "gaua" "GT" "heron" "huahine" "maupiti" "moorea" "raiatea" "tahiti" "lifou" "LHI" "malekula" "mare" "norfolk" "nz_north" "ouvea" "pentecost" "QLD" "Santo" "SA" "nz_south" "tanna" "tasmania" "victoria" "WA" "vanua_lava")

for name_pop in "${pop[@]}"
do

angsd -beagle "${PATH_INPUT}${name_pop}.beagle" -doSaf 4  -anc "${PATH_REF}Zlat_2_Tgut_pseudochromosomes.shortChromNames.fasta.gz" -fai "${PATH_REF}Zlat_2_Tgut_pseudochromosomes.shortChromNames.fasta.gz.fai" -out "${PATH_OUT}${name_pop}"

done

