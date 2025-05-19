#!/bin/bash

#SBATCH --nodes=1
#SBATCH --job-name=subset_pop
#SBATCH --partition=long
#SBATCH --cluster=htc

PATH_BEAGLE="/data/zool-zost/sjoh4959/projects/0.0_island_rule/data/wgs/"
PATH_SCRIPT="/data/zool-zost/sjoh4959/projects/0.0_island_rule/src/myscripts/"
PATH_OUT="/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/data/fst/"
PATH_SAMPLES="/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/analysis/resou
rces/pops_subset/"

declare -a pop=("ambae" "ambrym" "NSW" "chatham" "efate" "gaua" "GT" "heron" "huahine" "maupiti" "moorea" "raiatea" "tahiti" "lifou" "LHI" "malekula" "mare" "norfolk" "nz_north" "ouvea" "pentecost" "QLD" "santo" "SA" "nz_south" "tanna" "tasmania" "victoria" "WA" "vanua_lava")

for name_pop in "${pop[@]}"
do

python "${PATH_SCRIPT}subset_beagle.py" --beagle "${PATH_BEAGLE}wholegenome.beagle
" --samples "${PATH_SAMPLES}${name_pop}" --out "${PATH_OUT}${name_pop}.beagle"

done

