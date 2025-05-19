#!/bin/bash

#SBATCH --nodes=1
#SBATCH --mem=64000
#SBATCH --job-name=sfs_lifou
#SBATCH --partition=long
#SBATCH --clusters=arc

module purge
# module spider angsd/0.935-GCC-10.2.0
module load angsd/0.935-GCC-10.2.0

PATH_SAF="/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/reports/fst/"
PATH_SFS="/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/reports/fst/"

declare -a pop=("ambrym" "NSW" "chatham" "efate" "gaua" "GT" "heron" "huahine" "maupiti" "moorea" "raiatea" "tahiti" "lifou" "LHI" "malekula" "mare" "norfolk" "nz_north" "ouvea" "pentecost" "QLD" "santo" "SA" "nz_south" "tanna" "tasmania" "victoria" "WA" "vanua_lava" "santo")

for name_pop in "${pop[@]}"
do

realSFS "${PATH_SAF}${name_pop}.saf.idx" -P 48 -fold 1 -nSites 1000000 > "${PATH_S
FS}${name_pop}.sfs"

done

